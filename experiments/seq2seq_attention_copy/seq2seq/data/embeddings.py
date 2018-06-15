'''
modified by dongxu wang from
Created on Jul 4, 2017

@author: Bhanu

'''
import numpy as np
from seq2seq.data import vocab
from gensim.models.keyedvectors import KeyedVectors
import json
import os.path
from nltk import word_tokenize
np.random.seed(12345)
infiles = { 'train':      # 'vocab_encode_nl', 'vocab_decode_sql' 
           '/home/lily/dw633/seq2seq/seq2sql/data/mix_data/raw_data/train.json',   
            'dev':        # 'vocab_decode_nl':
           '/home/lily/dw633/seq2seq/seq2sql/data/mix_data/raw_data/dev.json',
           'schema':
           '/home/lily/dw633/seq2seq/seq2sql/data/mix_data/raw_data/tables.json'
}
VALUE_NUM_SYMBOL = "{VALUE}"




# def count_databases():
#     content = set()
#     with open(infiles['dev']) as f:
#         ex_list = json.load(f)
#         for table_dict in ex_list:
#             content.add(table_dict["db_id"])
#     dev_count = len(content)
#     print "dev count", dev_count
#     with open(infiles['train']) as f:
#         ex_list = json.load(f)
#         for table_dict in ex_list:
#             content.add(table_dict["db_id"])
#     train_count = len(content) - dev_count
#     return content

def get_schema_vocab_mapping():
    # used_databases = count_databases()
    cnt = {}
    # there is no interpretation for wikisql
    with open( '/home/lily/dw633/seq2seq/seq2sql_copy_mask/data/datasets/data/tables.json') as f:
        ex_list = json.load(f)
        for table_dict in ex_list:
            db_id = table_dict["db_id"]
            # if db_id not in used_databases:
            #     continue
            new_tokens = []
            column_names = table_dict["column_names"]
            table_names = table_dict["table_names"]
            column_names_original = table_dict["column_names_original"]
            table_names_original = table_dict["table_names_original"]
            for i in range(len(column_names)):
                item_original = column_names_original[i]
                # print item_original
                item = column_names[i]
                cnt[item_original[1]] = item[1]
            for i in range(len(table_names)):
                item_original = table_names_original[i]
                item = table_names[i]
                cnt[item_original[1]] = item[1]
    return cnt



def get_word_vector(input_string, model, cnt, separate_word_dict):
    '''
    Given an input string and a gensim Word2Vec model, return a vector
    representation of the string. If the string is a single word,
    simply returns the embedding for the string, or UNK embedding. If
    the string is multiple_words_with_underscores_between, tokenizes
    based on underscores and returns the means of the vectors for all
    tokens that are not UNK. Empty string returns a zero vector.
    '''
    if len(input_string) == 0:
        return np.zeros(len(model['the']))
    # Split on underscores
    # change to input string
    if input_string in cnt:
        words = [w.lower() for w in cnt[input_string].split() if len(w) > 0]
    else:
        words = [w.lower() for w in input_string.split("_") if len(w) > 0] 
    vector = np.zeros(len(model['the']))
    # print words
    for word in words:
        if word in model:
            vector += model[word]
            print "added %s to vector" % word
        else:
            if len(words) == 1 and word.lower().endswith("id"):
                vector += model["id"]
                if len(word) > 2 and word[0:-2] in model:
                    vector += model[word[0:-2]]
                print "%s not recognized; using id instead." % word
            else:
                if word in separate_word_dict:
                    vector += separate_word_dict[word]
                elif word[0] == "'" or word[0] == '"' or word[-1] == "'" or word[-1] == '"':
                    vector += separate_word_dict["quote"]
                    print "%s not recognized; using quote instead." % word     
                else:
                    tmp_vec = np.random.uniform(-0.25, 0.25, size=len(model['the']))
                    vector += tmp_vec
                    separate_word_dict[word] = tmp_vec
                    print "%s not recognized; using random instead." % word     
    v_norm = np.linalg.norm(vector)
    if v_norm == 0:
        return vector
    return vector / v_norm



# def read_embeddings_source(embeddings_path, vocab_path):
#     gensim_model = KeyedVectors.load_word2vec_format(embeddings_path, binary=False)
#     vocab_, _, _ = vocab.read_vocab(vocab_path)
#     vecs = [get_word_vector(w, gensim_model) for w in vocab_]
#     embedding_mat = np.asarray(vecs, dtype=np.float32)

#     return embedding_mat
def read_embed_from_file(filename, vocab_):
    word_dict = {}
    vecs = []
    with open(filename) as fin:
        for line in fin:
            parts = line.split('|||')
            word = parts[0]
            vec = parts[1].split()
            vecs.append(vec)
    embedding_mat = np.asarray(vecs, dtype=np.float32)
    return embedding_mat

def store_to_file(filename, vecs, vocab_):
    with open(filename, 'w') as fout:
        for i in range(len(vecs)):
            item = vecs[i]
            token = vocab_[i]
            item_list = item.tolist()
            vec = " ".join(str(v) for v in item_list)
            try:
                fout.write((token+"|||"+vec+ "\n"))
            except:
                fout.write((token+"|||"+vec+ "\n").encode("utf-8"))
    

def read_embeddings(embeddings_path, vocab_path, embed_dim, mode="source"):
    cnt = get_schema_vocab_mapping()
    filename = vocab_path.split(".")[0]+"saved_embedding_"+str(embed_dim) +"_"+ mode + "_2"
    vocab_, _, _ = vocab.read_vocab(vocab_path)
    if os.path.isfile(filename):
        return read_embed_from_file(filename, vocab_)
    else:
        # add already randomed into it
        separate_word_dict = {}
        gensim_model = KeyedVectors.load_word2vec_format(embeddings_path, binary=False)
        separate_word_dict["quote"] = np.random.uniform(-0.25, 0.25, size=len(gensim_model['the']))
        vecs = [get_word_vector(w, gensim_model, cnt, separate_word_dict) for w in vocab_]
        store_to_file(filename, vecs, vocab_)
        embedding_mat = np.asarray(vecs, dtype=np.float32)
    
    return embedding_mat

# def read_embeddings_target(embeddings_path, vocab_path):
#   gensim_model = KeyedVectors.load_word2vec_format(embeddings_path, binary=False)
#   vocab_, _, _ = vocab.read_vocab(vocab_path)
#   vecs = [get_word_vector(w, gensim_model) for w in vocab_]
#   embedding_mat = np.asarray(vecs, dtype=np.float32)

#   return embedding_mat

if __name__ == "__main__":
    cnt = get_schema_vocab_mapping()
    for k in cnt.keys():
        print (k, cnt[k])


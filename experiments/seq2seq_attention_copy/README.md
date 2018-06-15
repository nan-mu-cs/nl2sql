This is a documentation for the experiments run by Dongxu and Rui, for the sequence to sequence model, on 2 datasets (data, data_radn_split) with 3 methods (basic, attention, attention+copy) each. With mask and tune with glove embedding.

The location of the experiment git repo is currently

**/home/lily/dw633/seq2seq/seq2sql_copy_mask_replicate**

## 0. package version

modefied from google seq2seq v0.1 and code by Catherine Finegan-Dollak.

Python 2.7.14 :: Anaconda custom (64-bit)

tensorflow, gpu: 1.5.0

numpy: 1.13.3 

matplotlib: 2.1.0

## 1. folder structure (before we do anything)

In the root directory,

bin/ contains entry point to the model including train.py and infer.py, and other tool codes

experimental_configs/ contains experimental configurations in yaml format 

data/ contains folder pre_process, folder glove, folder datasets folder containing 3 datasets (to add outside the git repo)

seq2seq/ contains the main model code

config_builder.py helps make new model directory and write configurations into bash files

.git and .gitignore for the git repo

sample_output.txt is a sample output from dev split infer

experiments_to_review.txt records the experiments we run

other files are from google seq2seq v0.1 and not used



bin/
CONTRIBUTING.md  
experimental_configs/  
process.py     
README.md  
setup.py
config_builder.py  
evaluation.py    
LICENSE               
quick_eval.py  
seq2seq/
data/
.gitignore
.git/
experiments_to_review.txt
sample_output.txt

## 1. change configuration

#### 1.1  we run 6( (basic, attention, attention+copy) * (data, data_radn_split)) experiments. The configuration yaml files are in experimental_configs folder:

attn_copying_tune_data_radn_split.yaml  
attn_tune_data.yaml
attn_copying_tune_data.yaml 
basic_tune_data_radn_split.yaml
attn_tune_data_radn_split.yaml          
basic_tune_data.yaml


TODO: 

In the configuration yaml files, change the data directotries:

data_directories: /home/lily/dw633/seq2seq/seq2sql_copy_mask_replicate/data/datasets/data_processed/
embedding.file: /home/lily/dw633/seq2seq/seq2sql_copy_mask_replicate/data/glove/glove.6B.100d.txt

#### 1.2 prepare data

TODO:

change the infiles and prefix variables in data/pre_process/utils.py, and use data/pre_process/generate_vocab.py
to generate from folder 
data/datasets/data             
data/datasets/data_radn_split
to folder
data_processed
data_radn_split_processed

#### 1.3 Use config_builder.py to build model folder

generate model folder with configuration and bash files using configs in experimental_configs/
usage: python config_builder.py [configuration yaml file] 

TODO:

In config_builder.py, change the folder path of the script, that is to change the folder name example 'seq2sql_copy_mask_replicate':

'''...
cd ~/%s/seq2sql_copy_mask_replicate/
...
'''

Then we will get 6 new folders

InputAttentionCopyingSeq2Seq_tune_model_data/
InputAttentionCopyingSeq2Seq_tune_model_data_radn_split/
BasicSeq2Seq_tune_model_data/
BasicSeq2Seq_tune_model_data_radn_split/
AttentionSeq2Seq_tune_model_data/
AttentionSeq2Seq_tune_model_data_radn_split/


## 2. run experiment

First choose gpu, and use command

nohup ./[model folder]/experiment.sh >& output_BasicSeq2Seq_tune_model_data_radn_split.txt & 

to train.


Then use 

nohup ./[model folder]/experiment_infer.sh >& output_BasicSeq2Seq_tune_model_data_radn_split_infer.txt & 

to infer, 
the inferred dev is in [model folder]/output.txt, test is in [model folder]/output_test.txt, train is in [model folder]/output_train.txt


for example in tangra0

nohup ./BasicSeq2Seq_tune_model_data_radn_split/experiment.sh >& output_BasicSeq2Seq_tune_model_data_radn_split.txt &  


or in tangra1

nohup ./InputAttentionCopyingSeq2Seq_tune_model_data/experiment.sh >& output_InputAttentionCopyingSeq2Seq_tune_model_data.txt &  


## 3. evaluate

Note before evaluation, need to replace all ' . ' in the output, then compare the result with the 
datasets/ [processed dataset name] / [data split] / [data split] _decode.txt



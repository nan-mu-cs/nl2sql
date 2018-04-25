#!/usr/bin/python
import sys
import json

BLACK_LIST = ['variant','value']
def compare_node(label_node,test_node):
	if isinstance(label_node, dict) and isinstance(test_node, list):
		for child in test_node:
			ret,_,_ = compare_node(label_node, child)
			if ret == 1:
				return 1,1,len(test_node)
		return 0,1,len(test_node)
	if isinstance(label_node, list) and isinstance(test_node, dict):
		for child in label_node:
			ret,_,_ = compare_node(child, test_node)
			if ret == 1:
				return 1,len(label_node),1
		return 0,len(label_node),1
	if isinstance(label_node, dict) and isinstance(test_node, dict):
		for key in label_node:
			if key in BLACK_LIST:
				continue
			if key not in test_node:
#				print(key)
				return 0,1,1
			if isinstance(label_node[key], dict):
				ret,label,_ = compare_node(label_node[key], test_node[key])
				if ret != label:
					return 0,1,1
			else:
				if label_node[key] != test_node[key]:
					return 0,1,1
		return 1,1,1
	if isinstance(label_node, list) and isinstance(test_node, list):
		visited = [False]*len(label_node)
		matched = 0
		for test_child in test_node:
			for i,label_child in enumerate(label_node):
				if visited[i]:
					continue
				ret,label,_ = compare_node(label_child, test_child)
				if ret == label:
					visited[i] = True
					matched += 1
					break
		return matched,len(label_node),len(test_node)
	num_label = 1
	if isinstance(label_node, list):
		num_label = len(label_node)				
	num_test = 1
	if isinstance(test_node, list):
		num_test = len(test_node)
	if label_node == test_node:
		return 1,1,1
	return 0,num_label,num_test

def expand_where(node,ret,exp_set):
	if "operation" in node and (node["operation"] == "and" or node["operation"] == "or"):
		exp_set.append(node["operation"])
		if "left" in node:
			expand_where(node["left"], ret, exp_set)
		if "right" in node:
			expand_where(node["right"], ret, exp_set)
	else:
		ret.append(node)
#print(compare_node(label2, test1))
def evaluation_ast(label_ast,test_ast):
	ret = {
		"select":[0,0,0],
		"select_agg":[0,0,0],
		"select_without_agg":[0,0,0],
		"where_expression":[0,0,0],
		"where_operator":[0,0,0],
		"where_nested":[0,0,0],
		"group":[0,0,0],
		"having":[0,0,0],
		"order":[0,0,0],
		"compound":[0,0,0]
	}
	label_agg_node = []
	test_agg_node = []
	label_without_agg_node = []
	test_without_agg_node = []
	if "result" in label_ast:
		for node in label_ast["result"]:
			if "type" in node:
				if node["type"] == "identifier":
					label_without_agg_node.append(node)
				elif node["type"] == "function":
					label_agg_node.append(node)
	if "result" in test_ast:
		for node in test_ast["result"]:
			if "type" in node:
				if node["type"] == "identifier":
					test_without_agg_node.append(node)
				elif node["type"] == "function":
					test_agg_node.append(node)
	ret["select_agg"] = compare_node(label_agg_node, test_agg_node)
	ret["select_without_agg"] = compare_node(label_without_agg_node, test_without_agg_node)
	if "result" in label_ast and "result" in test_ast:
		ret["select"] = compare_node(label_ast["result"], test_ast["result"])
#		if ret["select"][0] > 0:
#			print("compare")
#			print(label_ast["result"])
#			print(test_ast["result"])
	elif "result" in label_ast:
		ret["select"][1] = len(label_ast["result"])
	elif "result" in test_ast:
		ret["select"][2] = len(test_ast["result"])
	label_nested_where = []
	test_nested_where = []
	label_expand_where = []
	test_expand_where = []
	label_expand_oper = []
	test_expand_oper = []
	if "where" in label_ast and isinstance(label_ast["where"], list) and len(label_ast["where"]) > 0:
		if len(label_ast["where"]) > 1:
			print(label_ast)
		expand_where(label_ast["where"][0], label_expand_where, label_expand_oper)
	if "where" in test_ast and isinstance(test_ast["where"], list) and len(test_ast["where"]) > 0:
		if len(test_ast["where"]) > 1:
			print(test_ast)
		expand_where(test_ast["where"][0], test_expand_where, test_expand_oper)
#	if len(label_expand_oper) > 0 or len(test_expand_oper) > 0:
#		print("compare")
#		print(label_expand_oper)
#		print(test_expand_oper)
	ret["where_expression"] = compare_node(label_expand_where, test_expand_where)
	
	ret["where_operator"] = compare_node(label_expand_oper, test_expand_oper)
	for node in label_expand_where:
		if "left" in node and "type" in node["left"] and node["left"]["type"] == "statement":
			label_nested_where.append(node["left"])
		if "right" in node and "type" in node["right"] and node["right"]["type"] == "statement":
			label_nested_where.append(node["right"])
	for node in test_expand_where:
		if "left" in node and "type" in node["left"] and node["left"]["type"] == "statement":
			test_nested_where.append(node["left"])
		if "right" in node and "type" in node["right"] and node["right"]["type"] == "statement":
			test_nested_where.append(node["right"])
	ret["where_nested"] = compare_node(label_nested_where, test_nested_where)
#	if len(label_nested_where) > 0 and len(test_nested_where) > 0:
#		print("compare")
#		print(label_nested_where)
#		print(test_nested_where)
#	if "where" in label_ast and "where" in test_ast:
#		ret["where"] = compare_node(label_ast["where"], test_ast["where"])
#	elif "where" in label_ast:
#		ret["where"][1] = len(label_ast["where"])
#	elif "where" in test_ast:
#		ret["where"][2] = len(test_ast["where"])
		
	if "group" in label_ast and "group" in test_ast:
		ret["group"] = compare_node(label_ast["group"], test_ast["group"])
	elif "group" in label_ast:
		ret["group"][1] = 1
	elif "group" in test_ast:
		ret["group"][2] = 1
		
	if "having" in label_ast and "having" in test_ast:
		ret["having"] = compare_node(label_ast["having"], test_ast["having"])
	elif "having" in label_ast:
		ret["having"][1] = 1
	elif "having" in test_ast:
		ret["having"][2] = 1
	
	if "order" in label_ast and "order" in test_ast:
		ret["order"] = compare_node(label_ast["order"], test_ast["order"])
	elif "order" in label_ast:
		ret["order"][1] = 1
	elif "order" in test_ast:
		ret["order"][2] = 1
	
	if "compound" in label_ast and "compound" in test_ast:
		ret["compound"] = compare_node(label_ast["compound"], test_ast["compound"])
	elif "compound" in label_ast:
		ret["compound"][1] = 1
	elif "compound" in test_ast:
		ret["compound"][2] = 1
	
	return ret

def evaluation(label_file,test_file):
	label_data = json.load(open(label_file))
	test_data = json.load(open(test_file))
	stat = {
		"select":[0,0,0],
		"select_agg":[0,0,0],
		"select_without_agg":[0,0,0],
		"where_expression":[0,0,0],
		"where_operator":[0,0,0],
		"where_nested":[0,0,0],
		"group":[0,0,0],
		"having":[0,0,0],
		"order":[0,0,0],
		"compound":[0,0,0]
	}
	for label_ast,test_ast in zip(label_data,test_data):
		val = evaluation_ast(label_ast, test_ast)
		for key in stat:
			if key in val:
				for i in range(len(stat[key])):
					stat[key][i] += val[key][i]
	return stat
ast1 = {
			"type": "statement",
			"variant": "select",
			"result": [
				{
					"type": "identifier",
					"variant": "column",
					"name": "a"
				},
				{
					"type": "identifier",
					"variant": "column",
					"name": "b"
				}
			],
			"where": [
				{
					"type": "expression",
					"format": "binary",
					"variant": "operation",
					"operation": "=",
					"left": {
						"type": "identifier",
						"variant": "column",
						"name": "a"
					},
					"right": {
						"type": "literal",
						"variant": "decimal",
						"value": "1"
					}
				}
			]
		}
ast2 = {
			"type": "statement",
			"variant": "select",
			"result": [
				{
					"type": "identifier",
					"variant": "column",
					"name": "a"
				}
			],
			"from": {
				"type": "identifier",
				"variant": "table",
				"name": "b"
			},
			"where": [
				{
					"type": "expression",
					"format": "binary",
					"variant": "operation",
					"operation": "in",
					"right": {
						"type": "statement",
						"variant": "select",
						"result": [
							{
								"type": "identifier",
								"variant": "column",
								"name": "d"
							}
						]
					},
					"left": {
						"type": "identifier",
						"variant": "column",
						"name": "c"
					}
				}
			]
		}
#print(evaluation_ast(ast1, ast2))	
print(evaluation("../../mix_label_ast.json", "../../mix_iyer_ast.json"))
		
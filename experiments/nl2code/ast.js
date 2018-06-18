"use strict";

var _sqlgenerate = require("sqlgenerate");

ast = {
    "where": [{
        "operation": "=",
        "right": {
            "from": {
                "type": "identifier",
                "name": "city"
            },
            "type": "statement",
            "result": [{
                "args": {
                    "type": "identifier",
                    "name": "city.population"
                },
                "type": "function",
                "name": {
                    "type": "identifier",
                    "name": "max"
                }
            }]
        },
        "type": "expression",
        "left": {
            "type": "identifier",
            "name": "city.population"
        }
    }],
    "type": "statement",
    "result": [{
        "type": "identifier",
        "name": "city.city_name"
    }],
    "from": {
        "type": "identifier",
        "name": "city"
    }
}; /**
    * Created by kai on 2018/4/21.
    */


sql = (0, _sqlgenerate.generate)(ast);

console.log(sql);

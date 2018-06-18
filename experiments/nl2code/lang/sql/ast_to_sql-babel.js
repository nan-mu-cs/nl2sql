'use strict';

var _sqlgenerateBabel = require('./sqlgenerate-babel');

var fs = require('fs'); /**
                         * Created by kai on 2018/4/21.
                         */


var obj = JSON.parse(fs.readFileSync('./rand_1_result.json', 'utf8'));
var writer = fs.createWriteStream('rand1_result.txt');
console.log(obj.length);
for (var i = 0; i < obj.length; i++) {
    var sql = "";
    try {
        // console.log(obj[i][0][1]);
        sql = (0, _sqlgenerateBabel.generate)(obj[i][0][1]);
        // console.log(sql.replace("\n"," "));
        // sql = sql.replace("\n"," ")
        var re = /\r\n|\n\r|\n|\r/g;
        sql = sql.replace(re, " ");
    } catch (e) {
        sql = "select a from b";
    } finally {
        writer.write(sql + "\n");
    }
}

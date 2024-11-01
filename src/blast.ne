@{%
const moo = require("moo");

const lexer = moo.compile({
    WS: { match: /\s+/, lineBreaks: true },
    number: /[0-9]+/,
    plus: "+",
    times: "*",
    lparen: "(",
    rparen: ")"
});
%}

# Specify the lexer to use with Nearley
@lexer lexer

# Define grammar rules
expression -> term (plus term):* {% 
    function (d) {
        return d[0] + d[1].reduce((acc, curr) => acc + curr[1], 0);
    } 
%}

term -> factor (times factor):* {% 
    function (d) {
        return d[0] * d[1].reduce((acc, curr) => acc * curr[1], 1);
    } 
%}

factor -> number {% 
    function (d) {
        return Number(d[0].value);
    } 
%}
    | lparen expression rparen {% d => d[1] %}
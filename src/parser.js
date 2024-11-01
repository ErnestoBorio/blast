const nearley = require("nearley");
const grammar = require("./grammar");

function parse(input) {
    const parser = new nearley.Parser(nearley.Grammar.fromCompiled(grammar));

    try {
        parser.feed(input);
        return parser.results[0]; // Get the first parsed result
    } catch (error) {
        console.error("Parse error:", error.message);
    }
}

module.exports = parse;
const parse = require("./parser");

const input = "3 + 5 * (2 + 3)"; // Sample expression
const result = parse(input);

console.log("Parsed result:", result);
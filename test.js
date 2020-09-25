var markdownpdf = require("markdown-pdf")
  , fs = require("fs")
 
fs.createReadStream("test.md")
  .pipe(markdownpdf())
  .pipe(fs.createWriteStream("test.pdf"))

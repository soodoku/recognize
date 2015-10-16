### Recognize: Assess OCR Quality

[![GPL-3.0](http://img.shields.io/:license-gpl-blue.svg)](http://opensource.org/licenses/GPL-3.0)
[![Build Status](https://travis-ci.org/soodoku/recognize.svg?branch=master)](https://travis-ci.org/soodoku/recognize)

### Testing Quality

Say you run 10,000 documents through an OCR software. And now you want to know how well did the software do in recognizing the text. To do that -- a simple solution exists. Take a random sample of the documents. Get humans to transcribe the sample. Call the human transcriptions, the gold standard. Compare the OCR text to the gold standard. In particular, calculate the edit distance between the two documents. 

Small courtesies may be neccessary --- removing extra spaces for one. Whenever there are images in the document with no text, OCR software typically add loads of extra space. We would want to account for that.

More complex formulations of this simple plan are easily apprehended. The above method doesn't take account of text **decorations**, headers etc. And capturing these may be essential. Extensions to unicode would also be useful. Analysis of how well we have done with regards to more complex data structures like tables needs further thought. But a start. 

### Installation

To get the current development version from github:

```{r install}
# install.packages("devtools")
devtools::install_github("soodoku/recognize")
```

The package depends on [readr](https://github.com/hadley/readr) and [RecordLinkage](https://cran.r-project.org/web/packages/RecordLinkage/index.html)

### Usage

```{r}
setwd(path.package("recognize"))
compare_txt("inst/extdata/abbyyR_wisc_out/PA_Casey_Auditor_General", "inst/extdata/gold_wisc_out/PA_Casey_Auditor_General")
```

```
## 163
```

#### License
Scripts are released under [GNU V3](http://www.gnu.org/licenses/gpl-3.0.en.html).

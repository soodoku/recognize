#' Sample Docs
#'
#' Output a random sample of documents 
#' The function by default prints the status of the task you are trying to delete. It will show up as 'deleted' if successful
#' @param path_to_ocr path to folder containing images that are OCR'd; required
#' @param path_to_gold path to folder containing human transcribed text; required
#' 
#' @return a vector of names of the sampled files
#' @export
#' @examples \dontrun{
#' compare_txt(path_to_ocr="path_to_ocr_file", path_to_gold="path_to_gold_file")
#' }

compare_txt <- function(path_to_ocr=NULL, path_to_gold=NULL, remove_extra_space=TRUE, normalize=TRUE) 
{
	ocr  <- read_file(path_to_ocr)
	gold <- read_file(path_to_gold)

	if (remove_extra_space) {
		ocr  <- gsub("^ *|(?<= ) | *$", "", ocr, perl=T)
		gold <- gsub("^ *|(?<= ) | *$", "", gold, perl=T)
	}

	levdist <- levenshteinDist(ocr, gold)

	if (normalize == TRUE) levdist/nchar(gold) 

	levdist
}
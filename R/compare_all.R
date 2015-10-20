#' Compare All
#'
#' Takes path to directory with OCRd files and path to directory with human transcribed files and calculates error rate.
#' Calls compare_txt
#' @param ocr_dir  path to directory containing files with OCRd text; required
#' @param gold_dir path to directory containing files with human transcribed text; required
#' @param remove_extra_space a dummy indicating whether or not extra spaces should be removed from the OCR file; default is TRUE
#' @param normalize normalize string distance measures --- otherwise longer the document, greater the distance
#' 
#' @return error rate
#' @export
#' @examples \dontrun{
#' compare_all(ocr_dir="path_to_ocr_dir", gold_dir="path_to_gold_dir", 
#' 	           remove_extra_space=TRUE)
#' }

compare_all <- 
function(ocr_dir=NULL, gold_dir=NULL, remove_extra_space=TRUE, normalize=TRUE) 
{
	res <- NA
	j <- 1
	files <- dir(ocr_dir)

	for(i in files){
		res[j] <- compare_txt(paste0(ocr_dir, files[i]), paste0(gold_dir, files[i]), remove_extra_space, normalize)
		j <- j + 1
	}

	res
}
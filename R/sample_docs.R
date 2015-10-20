#' Sample Docs
#'
#' Output a weighted random sample of documents. Documents weighted by their length.
#'
#' @param ocr_dir path to folder containing OCRd documents; required
#' @param output_dir path to folder containing sampled OCRd documents; required
#' @param nsamp number of sampled files; required
#' 
#' @return a vector of names of the sampled files. It also creates a directory with sampled files
#' @export
#' @examples \dontrun{
#' sample_docs(ocr_dir="path_to_ocr_dir", output_dir = "path_to_output_dir_with_sample_docs")
#' }

sample_docs <- 
function(ocr_dir=NULL, output_dir=NULL, nsamp=NULL) 
{
	res <- NA
	j <- 1
	files <- dir(ocr_dir)

	samp <- samp(files, nsamp)

	for(i in samp){
		file.copy(paste0(ocr_dir, samp[i]), paste0(output_dir, samp[i]), copy.mode = TRUE, copy.date = TRUE)
	}
	samp
}
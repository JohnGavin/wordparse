

#' @importFrom dplyr `%>%`
vowel_str <- function(x){
  strsplit(x, "") %>%
  unlist() %>%
  intersect(y = strsplit("aeiou", "")[[1]])
}

#' Extract vowels from a character vector
#'
#' Iterate over a character vector, to extract vowels.
#' Return a named vector of the vowels found.
#'
#' @param x character vector
#'
#' @export
#' @importFrom purrr map
vowel_strs <- function(x){
  x %>%
  map( ~ vowel_str(.)) %>%
  structure(names = x)
}



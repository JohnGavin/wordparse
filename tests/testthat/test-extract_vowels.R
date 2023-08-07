test_that("vowel_strs works", {
  x <- c("sdfwevc", "fyoigvcoi")
  vowel_strs(x) %>%
  expect_equal(
    list(sdfwevc = "e", fyoigvcoi = c("o", "i"))
  )
})

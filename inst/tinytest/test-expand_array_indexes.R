ans1 <- expand_array_indexes(c("123_1", "55_[1-5]", "122_[1, 5-6]", "44_[1-3:2]"))
ans0 <- c("123_1", "55_1", "55_2", "55_3", "55_4", "55_5", "122_1", "122_5", "122_6", "44_1", "44_3")
expect_equal(ans1, ans0)

test_that("summary for data_preparation separate=TRUE", {
  save_dir <- withr::local_tempdir(pattern = "summary", tempdir(TRUE))
  set.seed(2002213011)
  simdata_censored <- data_gen_censored(500, 10)
  object <- data_preparation(
    data = simdata_censored,
    id = "ID",
    period = "t",
    treatment = "A",
    outcome = "Y",
    cense = "C",
    eligible = "eligible",
    outcome_cov = ~X1,
    model_var = "assigned_treatment",
    use_weight = 1,
    use_censor = 1,
    cense_n_cov = ~X1,
    switch_n_cov = ~age_s,
    separate_files = TRUE,
    data_dir = save_dir,
    save_weight_models = TRUE,
    quiet = TRUE
  )
  expect_snapshot(
    summary(object, digits = 3),
    transform = function(lines) {
      lines <- gsub(": .*trial_", ": random_temp_dir_path/trial_", lines)
      gsub("^--- *", "---", lines)
    }
  )
  expect_snapshot(
    print(object$censor_models[[1]]),
    transform = function(lines) {
      gsub("\".*cense_model_d0.rds", "\"random_temp_dir_path/cense_model_d0.rds", lines)
    }
  )
  expect_snapshot(print(object$censor_models[[1]], full = FALSE))
  expect_warning(weights(object), "not supported when data prepared with ")
})

test_that("summary for data_preparation separate=FALSE", {
  save_dir <- withr::local_tempdir(pattern = "summary", tempdir(TRUE))
  set.seed(2002213011)
  simdata_censored <- data_gen_censored(1000, 10)
  object <- data_preparation(
    data = simdata_censored,
    id = "ID",
    period = "t",
    treatment = "A",
    outcome = "Y",
    cense = "C",
    eligible = "eligible",
    outcome_cov = ~X1,
    model_var = c("assigned_treatment", "dose"),
    use_weight = 1,
    use_censor = 0,
    cense_n_cov = ~X1,
    switch_n_cov = ~age_s,
    separate_files = FALSE,
    data_dir = save_dir,
    save_weight_models = FALSE,
    quiet = TRUE
  )

  expect_snapshot(summary(object, digits = 3))
  expect_snapshot(print(object$switch_models[[1]]))
  expect_snapshot(print(object$switch_models[[1]], full = FALSE))
  expect_snapshot(summary(weights(object)))
})


test_that("summary for initiators", {
  set.seed(20020111)
  simdata_censored <- data_gen_censored(1000, 10)
  expect_warning(
    object <- initiators(
      data = simdata_censored,
      id = "ID",
      period = "t",
      treatment = "A",
      outcome = "Y",
      cense = "C",
      eligible = "eligible",
      outcome_cov = ~X1,
      model_var = c("assigned_treatment", "dose"),
      use_weight = 1,
      use_censor = 0,
      cense_n_cov = ~X1,
      switch_n_cov = ~age_s,
      quiet = TRUE
    ),
    "non-integer"
  )
  expect_snapshot(summary(object, digits = 3))
  expect_snapshot(summary(object, digits = 7))
})
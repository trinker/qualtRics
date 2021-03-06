test_that("getSurvey() reads a stored survey in temporary directory if exists", { # nolint
  # Register dummy key
  qualtRics::registerOptions(api_token="1234",
                             root_url="https://yourdatacenterid.qualtrics.com")
  # Store RDS file
  data <- "SUCCESS"
  curr.wd <- getwd()
  setwd(tempdir())
  on.exit(setwd(curr.wd))
  saveRDS(data, "surveyID.rds")
  # Query with all options
  expect_message(qualtRics::getSurvey("surveyID"),
                 "Loading this file. Set 'force_request' to TRUE if you want to override this.") # nolint

})

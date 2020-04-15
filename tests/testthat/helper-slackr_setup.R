
getAPIToken <- function(){
  if(Sys.getenv("SLACK_API_TOKEN") == ""){
    # This only works when you run locally. slacr_creds.yml should not be saved in git.
    # Travis should use the env variable
    api_token <- yaml::read_yaml(file.path("exdata", "slackr_creds.yml"))$slackr$api_token
    Sys.setenv("SLACK_API_TOKEN" = api_token)
  } else {
    api_token <- Sys.getenv("SLACK_API_TOKEN")
  }
  return(api_token)
}
api_token <- getAPIToken()

test_that("slackr_setup works ", {
  expect_silent(slackr_setup(channel = "#publicchanneltest",
                             username = "slackr_bot",
                             api_token = api_token ))
})

#' On travis, this is specified as an env var.
#' Can't commit it to github, so if you need the local creds, ask dan egan

if(Sys.getenv("SLACK_API_TOKEN") == ""){
  api_token <- yaml::read_yaml(file.path("inst", "exdata", "slackr_creds.yml"))$slackr$api_token
  Sys.setenv("SLACK_API_TOKEN" = api_token)
} else {
  api_token <- Sys.getenv("SLACK_API_TOKEN")
}

api_token <- getAPIToken()

test_that("slackr_bot: webhook fails/works appropriately", {

  expect_error(slackr_bot(txt = "testing 1,2,3",
                            channel = "#publichanneltest",
                            incoming_webhook_url = "BAD HOOK"
                            ),
                 regexp = "Could not resolve host: BAD HOOK")
  Sys.sleep(1)
  expect_silent(slackr_bot(txt = "testing 1,2,3",
                            channel = "#publicchanneltest",
                            incoming_webhook_url = "https://hooks.slack.com/services/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")
                )
  Sys.sleep(1)


  expect_error(slackr_bot(txt = "testing 1,2,3"), regexp = "No incoming webhook URL specified. Did you forget to call slackr_setup()?")

})


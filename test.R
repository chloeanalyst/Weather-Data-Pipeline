current_time <- Sys.time()
print(current_time)

msg <- glue::glue("This is a test I'm running at {current_time}")

cat(msg, file = "test.txt")


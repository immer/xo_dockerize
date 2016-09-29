# NOTE: The answers below represent these question/responses
# Select a default region (us-west-1)
# It appears you are using Docker. Is this correct? (yes)
# Docker version: (most recent)
# Setup SSH? (no)


# Ensure there is a Dockerfile so the answers below make sense
touch Dockerfile

eb init $APP_NAME << ANSWERS
1
y
1
N
ANSWERS

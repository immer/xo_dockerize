
# Ensure end user had bin directory at root
mkdir -p bin

# Copy jq binary to ./bin
cp tmp/xo_dockerize/bin/jq bin/

# Copy Dockerrun.aws.jq to root of end user project
cp tmp/xo_dockerize/src/Dockerrun.aws.jq ./


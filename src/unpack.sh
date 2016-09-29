
# Create a directory to cache source files in
mkdir -p tmp/xo_dockerize

# Unpack the source files into the end users project awaiting further
# intallation tasks
echo $bindata | base64 -D | tar -xz -C tmp/xo_dockerize/


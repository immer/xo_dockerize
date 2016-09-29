
# Prompt end user to select a standardized dockerfile
dockerfiles=$(ls tmp/xo_dockerize/dockerfiles | sed 's/Dockerfile://g')

echo 'Which Dockerfile would you like to use? ('$dockerfiles')'

read dockerfile


# Copy selected dockerfile and Makefile shortcuts into place
cp tmp/xo_dockerize/dockerfiles/Dockerfile:$dockerfile ./Dockerfile

# Append helpful make targets to end user's Makefile
touch Makefile
cat tmp/xo_dockerize/build_steps/Makefile.template >> Makefile

# Copy the docker related scripts into the location the make targets expect
cp -R tmp/xo_dockerize/build_steps ./docker

# Copy the environment variables template file into place
cp tmp/xo_dockerize/src/env.example ./env.example


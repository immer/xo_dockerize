environment_name=$APP_NAME-$APP_ENV

# Commit the newly created Dockerrun.aws.json
git add .
git commit -m "Environment initialization for "$environment_name

# Create the environment
eb create $environment_name

# Create a deployment helper script for post create deployments
cat tmp/xo_dockerize/src/deploy-template.txt > release-$environment_name.sh

echo 'Created release-'$environment_name'.sh utility for deployments'


# @param
# ---
# $image_url container_host/image:version
#
# @description
# ---
# Run this program to create a fresh Dockerrun.aws.json file for use
# with `eb create` and `eb deploy`
#
# @usage
# ---
# jq -n --arg image_url container_host/image:version -f etc/Dockerrun.aws.jq > Dockerrun.aws.json

{
  AWSEBDockerrunVersion: "1",
  Image: {
    Name: "\($image_url)",
    Update: "true"
  }
}


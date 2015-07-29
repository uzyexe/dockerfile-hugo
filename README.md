# uzyexe/hugo

## What is Hugo

A Fast & Modern Static Website Engine

[https://gohugo.io/](https://gohugo.io/)

## Dockerfile

[**Trusted Build**](https://registry.hub.docker.com/u/uzyexe/hugo/)

This Docker image is based on the [alpine:3.2](https://registry.hub.docker.com/_/alpine/) base image.

## How to use this image

```
# Make hugo directory
HUGO_DIRECTORY="/opt/hugo"
YOUR_IPADDR="127.0.0.1"

mkdir ${HUGO_DIRECTORY}
chown 5000 ${HUGO_DIRECTORY}

# Create site
docker run --rm -it --volume="${HUGO_DIRECTORY}:/www" uzyexe/hugo new site .

# Create content
docker run --rm -it --volume="${HUGO_DIRECTORY}:/www" uzyexe/hugo new about.md
echo # Hello World >> ${HUGO_DIRECTORY}/about.md

# Download Theme 
# https://github.com/spf13/hugoThemes/
git clone https://github.com/TiTi/hurock.git ${HUGO_DIRECTORY}/themes/hurock

# Edit config.toml (Check it theme README.md sample config.toml) 
vi ${HUGO_DIRECTORY}/config.toml

# Apply Theme
docker run --rm -it --volume="${HUGO_DIRECTORY}:/www" uzyexe/hugohugo -t hugo-zen

# Preview and public content auto generate
docker run --rm -it -p 1313:1313 --volume="${HUGO_DIRECTORY}:/www" uzyexe/hugo server --theme=hurock --buildDrafts --watch --bind=${YOUR_IPADDR} --baseUrl=http://{YOUR_IPADDR}:1313

```

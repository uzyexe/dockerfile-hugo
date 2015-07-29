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
HUGO_THEME="casper"
YOUR_IPADDR=YOUR_IPADDR


mkdir ${HUGO_DIRECTORY}
chown 5000 ${HUGO_DIRECTORY}

# Create site
docker run --rm -it --volume="${HUGO_DIRECTORY}:/www" uzyexe/hugo new site .

# Download Theme 
# https://github.com/spf13/hugoThemes/
git clone https://github.com/vjeantet/hugo-theme-${HUGO_THEME}.git ${HUGO_DIRECTORY}/themes/${HUGO_THEME}

# Apply Theme
docker run --rm -it --volume="${HUGO_DIRECTORY}:/www" uzyexe/hugo -t ${HUGO_THEME}

# Edit config.toml (Check it theme README.md sample config.toml) 
vi ${HUGO_DIRECTORY}/config.toml

# Create content
docker run --rm -it --volume="${HUGO_DIRECTORY}:/www" uzyexe/hugo new -t ${HUGO_THEME} post/about.md
echo "# Hello World" >> ${HUGO_DIRECTORY}/content/post/about.md

# Preview and public content auto generate
docker run --rm -it --net=host --volume="${HUGO_DIRECTORY}:/www" uzyexe/hugo server --theme=${HUGO_THEME} --buildDrafts --watch --bind=${YOUR_IPADDR} --baseUrl=http://${YOUR_IPADDR}:1313

```

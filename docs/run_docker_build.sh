docker run --rm \
  --volume="$PWD:/srv/jekyll:Z" \
  -it jekyll/jekyll \
  sh -c "jekyll new --skip-bundle . --force"
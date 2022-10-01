docker run --rm \
  --volume="$PWD:/srv/jekyll:Z" \
  -p 4000:4000 \
  jekyll/jekyll \
  sh -c "bundle install \
  && bundle exec jekyll serve --host 0.0.0.0"
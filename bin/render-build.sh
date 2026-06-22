#!/usr/bin/env bash
set -o errexit

bundle install
ruby bin/rails assets:precompile
ruby bin/rails assets:clean
ruby bin/rails db:migrate
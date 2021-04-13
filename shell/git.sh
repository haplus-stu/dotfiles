#!/bin/bash -x

git add -A

git commit

git push origin $(git rev-parse --abbrev-ref HEAD)


#!/bin/sh

REPO=git@github.com:kztk-m/proenb-csharp.git
DEPLOY=./deploy

# Commit Message 
COMMIT=$(git log -1 HEAD --pretty=format:%H)


if test -e $DEPLOY;
then
    echo "$DEPLOY exists. Remove or rename it beforehand."
    exit 0;     
fi

rm -rf $DEPLOY

CURRENTDIR=`pwd`

# Use rebuild not to keep removed files. 
sh ./site.sh rebuild 
cd $CURRENTDIR

git clone --depth 1 $REPO $DEPLOY

echo "Cleaning up $DEPLOY ..."
# Cleaning up $DEPLOY, while keeping ".git" (use of * is intentional).
rm -rf "$DEPLOY"/*

echo "Copying files ..."
# Copying _site into $DEPLOY
rsync -a _site/* $DEPLOY

touch $DEPLOY/.nojekyll

set -x 

echo "Deploying"
cd $DEPLOY && git checkout main \
           && git add -A . \
           && git commit -m "generated from $COMMIT" -q \
           && git push 
set +x

cd $CURRENTDIR
echo "Removing $DEPLOY ..." 
rm -rf $DEPLOY 

echo "Done."

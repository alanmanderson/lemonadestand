#!/bin/bash
TARGET="staging"

if [ $TRAVIS_TEST_RESULT -eq 0 ]; then
    echo "Accessing build_success.sh"
    echo "Branch:"
    echo $TRAVIS_BRANCH
    echo "Fetching $TARGET:"
    git fetch
    echo "Calling git show-ref"
    git show-ref
    echo "***************"
    echo "Displaying list of branches:"
    git branch -a
    echo "Checking out remotes/origin/$TARGET:"
    git checkout remotes/origin/$TARGET
    echo "Creating new branch $TARGET:"
    git checkout -b $TARGET
    echo "Displaying list of branches:"
    git branch -a
    echo "Displaying commit log:"
    git log -5
    echo "Merging from $TRAVIS_BRANCH:"
    git merge $TRAVIS_BRANCH
    echo "Pushing:"
    git push origin $TARGET
fi

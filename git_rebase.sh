#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# make project folder
rm -rf project_rebase
mkdir project_rebase
cd project_rebase|| return
git init
echo 'initial commit' >> file-one.txt
git add .
git commit -m 'initial commit'
git branch -m master main

sleep 1
# create featureA branch and make a commit
git checkout -b featureA
echo 'featureA file change' >> featureA.txt
# this will create merge conflict with featureB ??
# echo 'change from featureA' >> file-one.txt
git add .
git commit -m 'commit on featureA'

sleep 1
# create featureB branch and make a commit
git checkout main
git checkout -b featureB
echo 'featureB file change' >> featureB.txt
# this will create merge conflict with featureA ??
# echo 'change from featureB' >> file-one.txt
git add .
git commit -m 'commit on featureB'

sleep 1
# create commit on feature A
git checkout featureA
echo 'featureA file change' >> featureA.txt
git add .
git commit -m 'commit on featureA'

sleep 1
# create commit on feature B
git checkout featureB
echo 'featureB file change' >> featureB.txt
git add .
git commit -m 'commit on featureB'

sleep 1
# create commit on feature A
git checkout featureA
echo 'featureA file change' >> featureA.txt
git add .
git commit -m 'commit on featureA'

sleep 1
# create commit on feature B
git checkout featureB
echo 'featureB file change' >> featureB.txt
git add .
git commit -m 'commit on featureB'

sleep 1
# merge feature branches into
git checkout main
# this command line is equivalent to github rebase and merge
git merge --ff-only featureA --no-edit
sleep 1
git checkout featureB
# this command is where merge conflicts may arise.
# IDEA: fixing merge conflict in feature branch is the proper place to fix the issue.
git rebase main
sleep 1
git checkout main
git merge --ff-only featureB --no-edit

# git log
# commit 73c3ca3367608f3e984e92cf82b76333dee3aac7 (HEAD -> refs/heads/main, refs/heads/featureB)
# Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
# Date:   Sun Nov 22 09:01:52 2020 -0500
#
#     commit on featureB
#
# commit 9088a9bb9ebf1458c48cbad2cd3c879347923bd7
# Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
# Date:   Sun Nov 22 09:01:49 2020 -0500
#
#     commit on featureB
#
# commit 35599264ea7ab67378468a762b8ea50452935f9d
# Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
# Date:   Sun Nov 22 09:01:47 2020 -0500
#
#     commit on featureB
#
# commit b45632826f8fcc852ffb33beb96e26f93d1fe869 (refs/heads/featureA)
# Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
# Date:   Sun Nov 22 09:01:50 2020 -0500
#
#     commit on featureA
#
# commit 12fa3c5f6262b5ed1aea7b19f4a37a6cb921e2db
# Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
# Date:   Sun Nov 22 09:01:48 2020 -0500
#
#     commit on featureA
#
# commit 9b54fa92cdc277d276b17f9c00f96be0d390552c
# Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
# Date:   Sun Nov 22 09:01:46 2020 -0500
#
#     commit on featureA
#
# commit 30ea0a04f36214abb346f94cb6c4274ce56d3e86
# Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
# Date:   Sun Nov 22 09:01:45 2020 -0500
#
#     initial commit

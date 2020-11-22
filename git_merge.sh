#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# make project folder
rm -rf project_merge
mkdir project_merge
cd project_merge || return
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
# merge feature branches into main
git checkout main
# fast-forward merge
git merge featureA
sleep 1
# --no-edit added only for script purposes
# recursive merge
git merge featureB --no-edit

# git log
# recursive merge
# commit 2d122fc99070c8f42cbbaebcd9cfe554ccf0f728 (HEAD -> refs/heads/main)
# Merge: 6c71509 b5f72a4
# Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
# Date:   Sun Nov 22 09:25:24 2020 -0500
#
#     Merge branch 'featureB' into main
#
#     * featureB:
#       commit on featureB
#       commit on featureB
#       commit on featureB
#
# commit b5f72a4fb09c9b0accea528166f5fcc9408671c1 (refs/heads/featureB)
# Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
# Date:   Sun Nov 22 09:25:22 2020 -0500
#
#     commit on featureB
#
# commit 6c71509a034d4ebc5110b29b1c563d1661407716 (refs/heads/featureA)
# Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
# Date:   Sun Nov 22 09:25:21 2020 -0500
#
#     commit on featureA
#
# commit 68d1bb0f49d72017c18fcbe39cd1087a15f16051
# Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
# Date:   Sun Nov 22 09:25:20 2020 -0500
#
#     commit on featureB
#
# commit 917c696be320ff9f47de64f99ac7efbd00a7c5ec
# Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
# Date:   Sun Nov 22 09:25:19 2020 -0500
#
#     commit on featureA
#
# commit 30d16341da1f36c3cde796ccfa78625782c8fa3f
# Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
# Date:   Sun Nov 22 09:25:18 2020 -0500
#
#     commit on featureB
#
# commit 6832e3c66993636642a8ccb3873087048f224454
# Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
# Date:   Sun Nov 22 09:25:17 2020 -0500
#
#     commit on featureA
#
# commit f18c9ace903aa70a487b8b60df5f94fd6db420f8
# Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
# Date:   Sun Nov 22 09:25:16 2020 -0500
#
#     initial commit

# NOTE: octopus strategy when merging mulitple branches into main
# git merge featureA featureB
# commit 13711317332fab16eeee2417acfcbdecb51193bd (HEAD -> refs/heads/main)
# Merge: dd6761c b25a1a7
# Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
# Date:   Sun Nov 22 08:28:30 2020 -0500
#
#     Merge branches 'featureA' and 'featureB' into main
#
#     * featureA:
#       commit on featureA
#       commit on featureA
#       commit on featureA
#
#     * featureB:
#       commit on featureB
#       commit on featureB
#       commit on featureB
#

Git Merge Vs Rebase
===================

This repo contains two small scripts that demonstrate why I believe recursive merge commits are a bad idea in your project.

The bash scripts will create the histories seen here.  These scripts do not introduce merge conflicts.  But you can modify them to do so for further experimentation.

In team related work, there will be multiple branches working on different features.

If you then merge these unrelated features into main branch, you get a git log similar to this:

```git
commit 2d122fc99070c8f42cbbaebcd9cfe554ccf0f728 (HEAD -> refs/heads/main)
Merge: 6c71509 b5f72a4
Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
Date:   Sun Nov 22 09:25:24 2020 -0500

    Merge branch 'featureB' into main

    * featureB:
      commit on featureB
      commit on featureB
      commit on featureB

commit b5f72a4fb09c9b0accea528166f5fcc9408671c1 (refs/heads/featureB)
Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
Date:   Sun Nov 22 09:25:22 2020 -0500

    commit on featureB

commit 6c71509a034d4ebc5110b29b1c563d1661407716 (refs/heads/featureA)
Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
Date:   Sun Nov 22 09:25:21 2020 -0500

    commit on featureA

commit 68d1bb0f49d72017c18fcbe39cd1087a15f16051
Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
Date:   Sun Nov 22 09:25:20 2020 -0500

    commit on featureB

commit 917c696be320ff9f47de64f99ac7efbd00a7c5ec
Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
Date:   Sun Nov 22 09:25:19 2020 -0500

    commit on featureA

commit 30d16341da1f36c3cde796ccfa78625782c8fa3f
Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
Date:   Sun Nov 22 09:25:18 2020 -0500

    commit on featureB

commit 6832e3c66993636642a8ccb3873087048f224454
Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
Date:   Sun Nov 22 09:25:17 2020 -0500

    commit on featureA

commit f18c9ace903aa70a487b8b60df5f94fd6db420f8
Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
Date:   Sun Nov 22 09:25:16 2020 -0500

    initial commit
```

After `git merge featureA`, by default you will have a fast-forward commit that looks fine.
After `git merge featureB`, you end up with a recursive merge commit which mixes the commits of featureA and featureB in chronological order.  This is what you see above.

If you were to merge multiple features at once, you get an octopus merge for the final commit.

`git merge featureA featureB`

```git
commit 13711317332fab16eeee2417acfcbdecb51193bd (HEAD -> refs/heads/main)
Merge: dd6761c b25a1a7
Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
Date:   Sun Nov 22 08:28:30 2020 -0500

    Merge branches 'featureA' and 'featureB' into main

    * featureA:
      commit on featureA
      commit on featureA
      commit on featureA

    * featureB:
      commit on featureB
      commit on featureB
      commit on featureB

```

With this history, it is difficult to track which commits were part of which feature.  It is not a clean linear history and is more difficult to read.  


A better method is to rebase all feature branches before merging, and use fast-forward merge only.  

This results in a git history that looks like this:

```git
commit 73c3ca3367608f3e984e92cf82b76333dee3aac7 (HEAD -> refs/heads/main, refs/heads/featureB)
Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
Date:   Sun Nov 22 09:01:52 2020 -0500

    commit on featureB

commit 9088a9bb9ebf1458c48cbad2cd3c879347923bd7
Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
Date:   Sun Nov 22 09:01:49 2020 -0500

    commit on featureB

commit 35599264ea7ab67378468a762b8ea50452935f9d
Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
Date:   Sun Nov 22 09:01:47 2020 -0500

    commit on featureB

commit b45632826f8fcc852ffb33beb96e26f93d1fe869 (refs/heads/featureA)
Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
Date:   Sun Nov 22 09:01:50 2020 -0500

    commit on featureA

commit 12fa3c5f6262b5ed1aea7b19f4a37a6cb921e2db
Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
Date:   Sun Nov 22 09:01:48 2020 -0500

    commit on featureA

commit 9b54fa92cdc277d276b17f9c00f96be0d390552c
Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
Date:   Sun Nov 22 09:01:46 2020 -0500

    commit on featureA

commit 30ea0a04f36214abb346f94cb6c4274ce56d3e86
Author: Antonios Hadjigeorgalis <Antonios@Hadji.co>
Date:   Sun Nov 22 09:01:45 2020 -0500

    initial commit
```

This results in a clean linear history that is easy to follow.  

This strategy also has the potential to be read as a changelog if:

* Each commit is meaningful
* Each commit contains an meaningful commit message



#!/bin/bash
# generate random org name 
org="org$(date +%s)$(printf '%04X' $RANDOM)"
export org
# do an inline edit on .gh-api-examples.conf file to switch out
# the org name:
perl -p -i -e 's/^org=.*/org=$ENV{org}/g' .gh-api-examples.conf
set -x
#org
./create-organization.sh
./create-team.sh
./pwr-create-users.sh
./pwr-create-org-members.sh
./pwr-add-users-to-team.sh
./add-maintainers-to-team.sh
./create-organization-project.sh
./create-an-organization-webhook.sh
# repo 
./create-repo-testrepo.sh
./add-team-to-repo.sh
./create-webhook.sh
./create-commit-codeowners.sh
./create-commit-readme.sh
./create-commit-python-pip.sh
sleep 2.5
./create-commit-requirements.sh
./create-branch-newbranch.sh
./create-commit-on-newbranch.sh
./create-commit-update-readme.sh
./create-commit-workflow-build-push-docker.sh
./create-commit-mermaid.sh
./create-repo-issue.sh
./create-issue-comment.sh
./create-labels.sh
./create-blob.sh
./create-pull-request.sh
./create-release.sh
./create-pages.sh
./create-gist.sh
# ./create-pat-as-repository-secret.sh
# ./create-public-key.sh
./create-a-code-security-configuration.sh
./create-a-fork.sh
./create-project-repo-project.sh
./create-project-card.sh
./create-reaction-for-issue.sh
./create-tag.sh
./create-reference.sh
./create-reference-to-tag.sh
./enable-secret-scanning.sh
./enable-git-lfs-for-a-repository.sh
./enable-lfs.sh
python3 ./create-workflow-simple-json-file.py
./create-commit-workflow-simple.sh
./create-repository-dispatch-event.sh
./create-branch-protected.sh
./set-branch-protection.sh
./create-commit-gitattributes.sh

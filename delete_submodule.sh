export PROJECT_NAME=SkyReels-A2

git submodule deinit -f models/$PROJECT_NAME && \
git rm -f models/$PROJECT_NAME && \
rm -rf .git/modules/models/$PROJECT_NAME
set -e
set -x

TARGET_DIR="chef/geo-ip-service/files/default/geo-ip-service"
cp -r ./conf $TARGET_DIR
cp -r ./lib $TARGET_DIR
cp -r ./node_modules $TARGET_DIR
cp ./LICENSE $TARGET_DIR
cp ./npm-shrinkwrap.json $TARGET_DIR
cp ./package.json $TARGET_DIR
cp ./README.md $TARGET_DIR

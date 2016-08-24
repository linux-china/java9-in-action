GREEN='\033[0;32m'
NC='\033[0m'
MODULE_PATH="target/mods"

rm -rf target

mkdir -p ${MODULE_PATH}

echo "${GREEN}building astro${NC}"

rm -rf astro/target

mkdir -p astro/target/classes

find astro/src/main/java -type f -name "*.java" -print | xargs javac -d astro/target/classes

jar -cfe ${MODULE_PATH}/astro.jar org.astro.Main -C astro/target/classes .

echo "${GREEN}building greetings${NC}"

rm -rf greetings/target

mkdir -p greetings/target/classes

find greetings/src/main/java -type f -name "*.java" -print | xargs javac -modulepath ${MODULE_PATH} -d greetings/target/classes

jar -cfe ${MODULE_PATH}/greetings.jar com.greetings.Main -C greetings/target/classes .

echo "${GREEN}running greeting application${NC}"

java -modulepath ${MODULE_PATH} -m com.greetings/com.greetings.Main

echo "${GREEN}linking application${NC}"

jlink --strip-debug --module-path ${MODULE_PATH}:$JAVA_HOME/jmods --add-modules com.greetings --output target/greetings-image

echo "${GREEN}run from image${NC}"

./target/greetings-image/bin/com.greetings
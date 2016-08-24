GREEN='\033[0;32m'
NC='\033[0m'

rm -rf target

mkdir -p target/mods

echo "${GREEN}building astro${NC}"

rm -rf astro/target

mkdir -p astro/target/classes

javac -d astro/target/classes astro/src/main/java/module-info.java astro/src/main/java/org/astro/World.java

jar -cfe target/mods/astro.jar org.astro.World -C astro/target/classes .

echo "${GREEN}building greetings${NC}"

rm -rf greetings/target

mkdir -p greetings/target/classes

javac -modulepath target/mods -d greetings/target/classes greetings/src/main/java/module-info.java greetings/src/main/java/com/greetings/Main.java

jar -cfe target/mods/greetings.jar com.greetings.Main -C greetings/target/classes .

echo "${GREEN}running greeting application${NC}"

java -modulepath target/mods -m com.greetings/com.greetings.Main

echo "${GREEN}linking application${NC}"

jlink --module-path target/mods/:$JAVA_HOME/jmods --add-modules com.greetings --output target/greetings-image

echo "${GREEN}run from image${NC}"

./target/greetings-image/bin/com.greetings
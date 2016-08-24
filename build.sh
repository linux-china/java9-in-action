rm -rf target

mkdir -p target/mods

echo "building astro"

rm -rf astro/target

mkdir -p astro/target/classes

javac -d astro/target/classes astro/src/main/java/module-info.java astro/src/main/java/org/astro/World.java

jar -cfe target/mods/astro.jar org.astro.World -C astro/target/classes .

echo "building greetings"

rm -rf greetings/target

mkdir -p greetings/target/classes

javac -modulepath target/mods -d greetings/target/classes greetings/src/main/java/module-info.java greetings/src/main/java/com/greetings/Main.java

jar -cfe target/mods/greetings.jar com.greetings.Main -C greetings/target/classes .

echo "running greeting application"

java -modulepath target/mods -m com.greetings/com.greetings.Main

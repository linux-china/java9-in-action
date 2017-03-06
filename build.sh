GREEN='\033[0;32m'
NC='\033[0m'
MODULE_PATH="target/mods"

mvn clean package

jlink --strip-debug --module-path target/mods:$JAVA_HOME/jmods --add-modules com.greetings --output target/greetings-bin --launcher greetings=com.greetings/com.greetings.Main

echo "${GREEN}run from binary${NC}"

./target/greetings-bin/bin/greetings
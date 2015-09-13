Java 9 in Action
===============================

Java 9 Examples

### References

* OpenJDK 9 wiki: https://wiki.openjdk.java.net/display/Adoption/JDK+9+Outreach
* Java 9 Module: https://www.voxxed.com/blog/presentation/presentation-java-9-make-way-for-modules/
* Project page: http://openjdk.java.net/projects/jdk9/


### Download and Install JDK 9

The download linK https://jdk9.java.net/download/ , please use jenv to install jdk.


## Jigsaw Module System

How to use module in JDK 9

#### compile

1. javac -d target/mods/org.astro src/main/java/org/astro/module-info.java src/main/java/org/astro/World.java

2. javac -modulepath target/mods -d target/mods/com.greetings src/main/java/com/greetings/module-info.java src/main/java/com/greetings/Main.java

3. java -modulepath target/mods -m com.greetings/com.greetings.Main Greetings world!

#### package


1. jar --create --archive=target/mlib/org.astro@1.0.jar --module-version=1.0 -C target/mods/org.astro .

2. jar --create --archive=target/mlib/com.greetings.jar --main-class=com.greetings.Main -C target/mods/com.greetings .

3. java -mp target/mlib -m com.greetings Greetings world!

#### linker

1. jlink --modulepath $JAVA_HOME/jmods:target/mlib --addmods com.greetings --output target/greetingsapp

2. cd target/greetingsapp/bin and run "./com.greetings"
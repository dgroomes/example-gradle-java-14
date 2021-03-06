#!/usr/bin/env bash
# Run the program using the "java" command with a "--class-path" argument that points to the program's compiled files
# (.class files) and to the library dependencies (.jar files)
#
# This script depends on two things:
#   1) The program must first be compiled with `./gradlew compileJava`
#   2) The runtime dependencies must be printed out with `./gradlew listDependencies`

set -eu

programClasses="build/classes/java/main"
if [[ ! -d "$programClasses" ]]; then
  echo >&2 "Build the program first. See the README for instructions."
  exit 1
fi

depsFile="build/runtime-dependencies.txt"
if [[ ! -f "$depsFile" ]]; then
  echo >&2 "Build the dependencies file first. See the README for instructions."
  exit 1
fi

java --class-path "${programClasses}:$(cat "$depsFile")" dgroomes/Main

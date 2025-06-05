#!/bin/bash
echo "Building the project..."

# Example build step (for Java)
javac Main.java

if [[ $? -ne 0 ]]; then
  echo "Build failed!"
  exit 1
fi

echo "Build succeeded."

# Create an artifact
jar cf app.jar *.class

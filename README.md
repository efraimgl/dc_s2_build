### Mamram Rules

# 🚀 Java CI Pipeline with GitHub Actions

This project includes a simple **Continuous Integration (CI)** pipeline powered by **GitHub Actions**. It automatically builds your Java application on every code push using a custom `build.sh` script.

---

## 📂 Workflow Overview

* **Location:** `.github/workflows/ci.yml`
* **Workflow Name:** `CI Pipeline`
* **Trigger:** Runs on every `push` event

---

## 🛠 What It Does

1. **Check out the code**
   Uses `actions/checkout@v3` to clone the repository.

2. **Ensure build script is executable**
   Grants execute permission to `build.sh`.

3. **Build the Java application**
   Runs `build.sh`, which:

   * Compiles `Main.java`
   * Creates a `JAR` file (`app.jar`)

---

## 📄 Example Workflow File

```yaml
name: CI Pipeline

on: [push]

jobs:
  ci-job:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Make test.sh executable
        run: chmod +x ./build.sh

      - name: Build application
        run: ./build.sh
```

---

## 📌 Requirements

* A file named `Main.java` at the root of your repository
* A `build.sh` script with the following content:

```bash
#!/bin/bash
echo "Building the project..."

javac Main.java

if [[ $? -ne 0 ]]; then
  echo "Build failed!"
  exit 1
fi

echo "Build succeeded."

jar cf app.jar *.class
```

---

## 🧪 Running Locally

You can also run the build manually:

```bash
chmod +x build.sh
./build.sh
java -cp app.jar Main
```

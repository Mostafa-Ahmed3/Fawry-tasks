# 🛠️ Q1 : Custom Command (mygrep.sh)

## 📜 Description
**mygrep.sh** is a lightweight version of the Unix `grep` command, built in Bash. It supports:
- **Case-insensitive search** for a string in a text file.
- **Options** to show line numbers `-n`, invert matches `-v`, and combinations like `-vn` or `-nv`.
- **Robust error handling** for missing arguments or files.
- **Bonus features** like `--help` for usage instructions.
---

## 📋 Hands-On Validation

Tested using a `testfile.txt` with contents:
```
Hello world
This is a test
another test line
HELLO AGAIN
Don't match this line
Testing one two three
```

✅ Example screenshot to include:
- `./mygrep.sh hello testfile.txt`
- `./mygrep.sh -n hello testfile.txt`
- `./mygrep.sh -vn hello testfile.txt`
- `./mygrep.sh -v testfile.txt` (expect an error about missing search string)
- `./mygrep.sh --help`

![Mygrep](mygrep.jpg)
---

## 🧠 Reflection

### 1. Argument and Option Handling Breakdown
- If `--help` is passed at any time, display usage information and exit.
- Options (`-n`, `-v`, or combinations like `-vn`) are parsed first.
- Then the script checks for the search string and filename.
- If arguments are missing or file doesn't exist, it shows an error.
- Searching is performed using `grep -i`, with flags added based on the parsed options.

### 2. Supporting Additional Options
If I wanted to add features like:
- `-i` (ignore case, already somewhat done),
- `-c` (count number of matching lines),
- `-l` (list only filenames with matches),

...I would refactor the script to fully rely on `getopts`, allowing easy parsing of each new flag and maintaining a cleaner structure. Also, I'd build dynamic `grep` command strings based on active flags.

### 3. Hardest Part
The most challenging part was **correctly handling combined options** (e.g., `-vn`, `-nv`) because the order should not matter. I had to make sure my script parsed each character individually rather than expecting full-word options, mimicking real `grep` behavior.

--------------------------------------
# Q2 : Scenario

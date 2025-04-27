mygrep.sh is a mini version of the Unix grep command, implemented as a Bash script.
It supports basic string searching within files with options for line numbers and inverted matches.

Features
Case-insensitive search: Matches strings without considering letter case.

Print matching lines: Displays lines that match (or don't match) the search string.

Supported Options:

-n: Show line numbers for each matching line.

-v: Invert the match (show lines that do not match the search string).

Options can be combined (-vn, -nv).

Usage
bash
Copy
Edit
./mygrep.sh [options] search_string filename
Examples
Basic search:

bash
Copy
Edit
./mygrep.sh hello testfile.txt
Search with line numbers:

bash
Copy
Edit
./mygrep.sh -n hello testfile.txt
Inverted search with line numbers:

bash
Copy
Edit
./mygrep.sh -vn hello testfile.txt
Missing search string (should display an error):

bash
Copy
Edit
./mygrep.sh -v testfile.txt
Requirements
Bash shell

Executable permissions on mygrep.sh (chmod +x mygrep.sh)

Error Handling
The script checks and reports:

Missing arguments

Non-existent or unreadable files

Invalid usage patterns

Hands-On Validation
Use the following testfile.txt content for testing:

arduino
Copy
Edit
Hello world
This is a test
another test line
HELLO AGAIN
Don't match this line
Testing one two three
Ensure the script behaves correctly with the examples provided above.

Reflective Section
Handling Arguments and Options:

The script parses command-line arguments manually or with getopts (bonus).

It identifies options first, then the search string, and finally the filename.

If Supporting Regex or More Options (-i, -c, -l):

I would redesign argument parsing to be more modular, possibly using getopts.

Introduce internal flags for regex handling and result aggregation (count/match/line listing).

Hardest Part:

Handling combinations of options cleanly (-vn, -nv) without rewriting parsing logic for every case.

Bonus
--help flag supported: Displays a help message with usage instructions.

Improved option parsing using getopts for cleaner, scalable argument management.

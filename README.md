This script uses a Bash case statement to check the first argument passed to the script.

The most important thing to understand in this script is the difference between:
- ;;
- ;&
- ;;&
These three operators control how Bash moves from one case block to another.

How ;& works (the most important part)?
"Execute the next block, even if its pattern does not match the input."

Normally, Bash checks each pattern. But when it encounters ;&, it skips the pattern check for the next block.

"Execute the next block, even if its pattern does not match the input."

Normally, Bash checks each pattern. But when it encounters ;&, it skips the pattern check for the next block.

    A["Input: $1"] --> B{"Does input match 1?"}
    B -->|Yes| C["Print: one"]
    C --> D[";& Execute next block"]
    D --> E["Print: two"]
    E --> F[";& Execute next block"]
    F --> G["Print: anything with 3 in the last"]
    B -->|No| H{"Does input match 2?"}
    H -->|Yes| E
    H -->|No| I{"Does input match *3?"}
    I -->|Yes| G
    I -->|No| J["Print: no option"]
    
Notice that the flowchart simplifies the behavior a little: when the script enters a block through ;&, it doesn't check the next pattern.
Execution:
Step	What happens:

1	Input 1 matches pattern 1.
2	Prints one.
3	;& executes the next block.
4	Prints two (falls through from one if matched at 1).
5	The next ;& executes the *3 block.
6	Prints anything with 3 in the last.
7	;; stops execution.

Difference between ;;, ;&, and ;;&
This is a very important Bash concept.
Operator	Behavior
;;	Stop checking cases after the current matching block.
;&	Execute the next block without checking its pattern.
;;&	Continue checking the next pattern normally.

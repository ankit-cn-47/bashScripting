Introduction to sed Command in Linux

sed, short for Stream Editor, is a powerful tool in Linux used for performing basic text transformations on an input stream (a file or input from a pipeline). Whether you want to find and replace text, delete lines, or insert text, sed can help you do this quickly and efficiently.
Basic Syntax

The basic syntax of the sed command is:

bash

sed [options] 'command' file

Here’s a breakdown:

    sed: The command itself.
    [options]: Optional flags that modify how sed behaves.
    'command': The specific command or set of commands you want to execute.
    file: The file on which you want to perform the operation.

1. Replacing Text (s Command)

The most common use of sed is to replace text in a file or stream.

Example: Replace the first occurrence of "oldtext" with "newtext" in each line:

bash

sed 's/oldtext/newtext/' filename.txt

    s: Stands for "substitute".
    oldtext: The text you want to replace.
    newtext: The text you want to replace it with.

Example: Replace all occurrences in each line (use the g flag):

bash

sed 's/oldtext/newtext/g' filename.txt

    g: Stands for "global", meaning all occurrences in each line.

2. Replacing Text in a Specific Line

If you want to replace text only on a specific line or range of lines, you can specify the line number before the command.

Example: Replace text only on line 3:

bash

sed '3s/oldtext/newtext/' filename.txt

Example: Replace text on lines 3 to 5:

bash

sed '3,5s/oldtext/newtext/' filename.txt

3. Deleting Lines

You can delete specific lines from a file using the d command.

Example: Delete line 3:

bash

sed '3d' filename.txt

Example: Delete lines 2 to 4:

bash

sed '2,4d' filename.txt

4. Inserting or Appending Text

    Insert (i): Adds text before a line.
    Append (a): Adds text after a line.

Example: Insert text before line 3:

bash

sed '3i\This is inserted text.' filename.txt

Example: Append text after line 3:

bash

sed '3a\This is appended text.' filename.txt

5. Modifying the File In-Place

By default, sed outputs the modified text to the terminal without changing the file. If you want to save the changes directly to the file, use the -i option.

Example: Replace all occurrences of "oldtext" with "newtext" and save changes to the file:

bash

sed -i 's/oldtext/newtext/g' filename.txt

6. Using Multiple Commands

You can chain multiple sed commands together using the -e option or by enclosing them in single quotes separated by semicolons.

Example: Replace text and delete a line:

bash

sed -e 's/oldtext/newtext/' -e '3d' filename.txt

Or:

bash

sed 's/oldtext/newtext/; 3d' filename.txt

7. Using Regular Expressions

sed supports regular expressions for more complex text manipulation.

Example: Replace any digits with #:

bash

sed 's/[0-9]/#/g' filename.txt

Example: Replace all lowercase vowels with *:

bash

sed 's/[aeiou]/*/g' filename.txt

Conclusion

The sed command is a versatile tool for text manipulation. While it can seem complex at first, starting with basic operations like text replacement and deletion will help you build a strong foundation. As you become more comfortable, you can explore more advanced features like regular expressions and scripting with sed. Happy scripting!
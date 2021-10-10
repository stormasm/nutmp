|name|description|subcommands|
|-|-|-|
|alias|Alias a command to an expansion.||
|all?|Find if the table rows matches the condition.||
|ansi|Output ANSI codes to change color.||
|any?|Find if the table rows matches the condition.||
|append|Append a row to the table.||
|autoenv|Manage directory specific environment variables and scripts.||
|autoview|View the contents of the pipeline as a table or list.||
|benchmark|Runs a block and returns the time it took to execute it.||
|build-string|Builds a string from the arguments.||
|cal|Display a calendar.||
|cd|Change to a new path.||
|char|Output special characters (e.g., &#x27;newline&#x27;).||
|chart|Displays charts.||
|clear|Clears the terminal.||
|collect|Collect the stream and pass it to a block.||
|compact|Creates a table with non-empty rows.||
|config|Configuration management.|[table 6 rows]|
|cp|Copy files.||
|dataframe|Commands to work with polars dataframes||
|date|Apply date function.||
|debug|Print the Rust debug representation of the values.||
|def|Create a command and set it to a definition.||
|default|Sets a default row&#x27;s column if missing.||
|describe|Describes the objects in the stream.||
|do|Runs a block, optionally ignoring errors.||
|drop|Remove the last number of rows or columns.||
|du|Find disk usage sizes of specified items.||
|each|Run a block on each row of the table.||
|echo|Echo the arguments back to the user.||
|empty?|Check for empty values.||
|enter|Create a new shell and begin at this path.||
|every|Show (or skip) every n-th row, starting from the first one.||
|exec|Execute a command, replacing the current process.||
|exit|Exit the current shell (or all shells).||
|fetch|Fetch the contents from a URL (HTTP GET operation).||
|find|Find text in the output of a previous command||
|first|Show only the first number of rows.||
|flatten|Flatten the table.||
|for|Run a block on each row of the table.||
|format|Format columns into a string using a simple pattern.|[table 1 rows]|
|from|Parse content (string or binary) as a table (input format based on subcommand, like csv, ini, json, toml).||
|g|Go to specified shell.||
|get|Open given cells as text.||
|group-by|Create a new table grouped.||
|hash|Apply hash function.||
|headers|Use the first row of the table as column names.||
|help|Display help information about commands.||
|histogram|Creates a new table with a histogram based on the column name passed in.||
|history|Display command history.||
|if|Run blocks if a condition is true or false.||
|ignore|Ignore the output of the previous command in the pipeline||
|insert|Insert a new column with a given value.||
|into|Apply into function.|[table 6 rows]|
|keep|Keep the number of rows only.||
|kill|Kill a process using the process id.||
|last|Show only the last number of rows.||
|length|Show the total number of rows or items.||
|let|Create a variable and give it a value.||
|let-env|Create an environment variable and give it a value.||
|lines|Split single string into rows, one per line.||
|load-env|Set environment variables using a table stream||
|ls|View the contents of the current or given path.||
|math|Use mathematical functions as aggregate functions on a list of numbers or tables.||
|merge|Merge a table.||
|mkdir|Make directories, creates intermediary directories as required.||
|move|Move columns.||
|mv|Move files or directories.||
|n|Go to next shell.||
|nth|Return or skip only the selected rows.||
|open|Load a file into a cell, convert to table if possible (avoid by appending &#x27;--raw&#x27;).||
|p|Go to previous shell.||
|parse|Parse columns from string data using a simple pattern.||
|path|Explore and manipulate paths.||
|pathvar|Manipulate the PATH variable (pathvar) or a different variable following the
same rules.||
|pivot|Pivots the table contents so rows become columns and columns become rows.||
|post|Post a body to a URL (HTTP POST operation).||
|prepend|Prepend the given row to the front of the table.||
|ps|View information about system processes.||
|pwd|Output the current working directory.||
|random|Generate random values.||
|range|Return only the selected rows.||
|reduce|Aggregate a list table to a single value using an accumulator block.||
|reject|Remove the given columns from the table. If you want to remove rows, try &#x27;drop&#x27;.||
|rename|Creates a new table with columns renamed.||
|reverse|Reverses the table.||
|rm|Remove file(s).||
|roll|Rolls the table rows.||
|rotate|Rotates the table by 90 degrees clockwise.||
|save|Save the contents of the pipeline to a file.||
|select|Down-select table to only these columns.||
|seq|Print sequences of numbers.|[table 1 rows]|
|shells|Display the list of current shells.||
|shuffle|Shuffle rows randomly.||
|size|Gather word count statistics on the text.||
|skip|Skip some number of rows.||
|sleep|Delay for a specified amount of time.||
|sort-by|Sort by the given columns, in increasing order.||
|source|Runs a script file in the current context.||
|split|Split contents across desired subcommand (like row, column) via the separator.||
|split-by|Creates a new table with the data from the inner tables split by the column given.||
|str|Apply string function.||
|sys|View information about the system.||
|table|View the contents of the pipeline as a table.||
|tags|Read the tags (metadata) for values.||
|to|Convert table into an output format (based on subcommand, like csv, html, json, yaml).||
|touch|Creates one or more files.||
|tutor|Run the tutorial. To begin, run: tutor||
|unalias|Removes an alias||
|uniq|Return the unique rows.||
|unlet-env|Delete an environment variable.||
|update|Update an existing column to have a new value.||
|url|Apply url function.||
|version|Display Nu version.||
|where|Filter table to match the condition.||
|which|Finds a program file, alias or custom command.||
|with-env|Runs a block with an environment variable set.||
|wrap|Wraps the given data in a table.||
|zip|Zip two tables.||

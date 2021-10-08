# Headings

To create a heading, add number signs (\#) in front of a word or phrase. The number of number signs you use should correspond to the heading level.

# Heading level 1

## Heading level 2

### Heading level 3

#### Heading level 4

##### Heading level 5

###### Heading level 6

## Alternate Syntax

Alternatively, on the line below the text, add any number of == characters for heading level 1 or -- characters for heading level 2.

# Heading level 1

## Heading level 2

# Paragraphs

To create paragraphs, use a blank line to separate one or more lines of text.

Markdown HTML Rendered Output I really like using Markdown.

# Line Breaks

To create a line break (<br>), end a line with two or more spaces, and then type return.

This is the first line.\
And this is the second line.

# Emphasis

You can add emphasis by making text bold or italic.

## Bold

To bold text, add two asterisks or underscores before and after a word or phrase. To bold the middle of a word for emphasis, add two asterisks without spaces around the letters.

I just love **bold text**.\
I just love **bold text**.\
Love**is**bold

## Italic

To italicize text, add one asterisk or underscore before and after a word or phrase. To italicize the middle of a word for emphasis, add one asterisk without spaces around the letters.

Markdown\
Italicized text is the *cat's meow*. Italicized text is the *cat's meow*. A*cat*meow

## Bold and Italic

To emphasize text with bold and italics at the same time, add three asterisks or underscores before and after a word or phrase. To bold and italicize the middle of a word for emphasis, add three asterisks without spaces around the letters.

This text is ***really important***. This text is ***really important***. This text is ***really important***. This text is ***really important***. This is really***very***important text.

# Blockquotes

To create a blockquote, add a \> in front of a paragraph.

> Dorothy followed her through many of the beautiful rooms in her castle.

## Blockquotes with Multiple Paragraphs

Blockquotes can contain multiple paragraphs. Add a \> on the blank lines between the paragraphs.

> Dorothy followed her through many of the beautiful rooms in her castle.
>
> The Witch bade her clean the pots and kettles and sweep the floor and keep the fire fed with wood.

## Nested Blockquotes

Blockquotes can be nested. Add a \>\> in front of the paragraph you want to nest.

> Dorothy followed her through many of the beautiful rooms in her castle.
>
> > The Witch bade her clean the pots and kettles and sweep the floor and keep the fire fed with wood.

## Blockquotes with Other Elements

Blockquotes can contain other Markdown formatted elements. Not all elements can be used --- you'll need to experiment to see which ones work.

> #### The quarterly results look great!
>
> -   Revenue was off the chart.
> -   Profits were higher than ever.
>
> *Everything* is going according to **plan**.

# Lists

You can organize items into ordered and unordered lists.

## Ordered Lists

To create an ordered list, add line items with numbers followed by periods. The numbers don't have to be in numerical order, but the list should start with the number one.

Example 1

1.  First item
2.  Second item
3.  Third item
4.  Fourth item

Example 2

1.  First item
2.  Second item
3.  Third item
4.  Fourth item

Example 3

1.  First item
2.  Second item
3.  Third item
4.  Fourth itemd item
5.  Fourth item

Example 4

1.  First item

2.  Second item

3.  Third item

    1.  Indented item
    2.  Indented item

4.  Fourth item

## Unordered Lists

To create an unordered list, add dashes (-), asterisks (\*), or plus signs (+) in front of line items. Indent one or more items to create a nested list.

Example 1

-   First item
-   Second item
-   Third item
-   Fourth item

Example 2

-   First item
-   Second item
-   Third item
-   Fourth item

Example 3

-   First item
-   Second item
-   Third item
-   Fourth item

Example 4

-   First item

-   Second item

-   Third item

    -   Indented item
    -   Indented item

-   Fourth item

## Starting Unordered List Items With Numbers

If you need to start an unordered list item with a number followed by a period, you can use a backslash (\\) to escape the period.

-   1968\. A great year!
-   I think 1969 was second best.

## Adding Elements in Lists

To add another element in a list while preserving the continuity of the list, indent the element four spaces or one tab, as shown in the following examples.

### Paragraphs

-   This is the first list item.

-   Here's the second list item.

    I need to add another paragraph below the second list item.

-   And here's the third list item.

### Blockquotes

-   This is the first list item.

-   Here's the second list item.

    > A blockquote would look great below the second list item.

-   And here's the third list item.

### Code Blocks

Code blocks are normally indented four spaces or one tab. When they're in a list, indent them eight spaces or two tabs.

1.  Open the file.

2.  Find the following code block on line 21:

         <html>
           <head>
             <title>Test</title>
           </head>

3.  Update the title to match the name of your website.

### Images

1.  Open the file containing the Linux mascot.

2.  Marvel at its beauty.

    ![Base R applications](image/base_r.jpg)

3.  Close the file. The rendered output looks like this:

### Lists

You can nest an unordered list in an ordered list, or vice versa.

1.  First item

2.  Second item

3.  Third item

    -   Indented item
    -   Indented item

4.  Fourth item The rendered output looks like this:

# Code

To denote a word or phrase as code, enclose it in backticks (\`).

At the command prompt, type `nano`.

## Code Blocks

To create code blocks, indent every line of the block by at least four spaces or one tab.

    <html>
      <head>
      </head>
    </html>

# Horizontal Rules

To create a horizontal rule, use three or more asterisks (\*\*\*), dashes (---), or underscores (\_\_\_) on a line by themselves.

------------------------------------------------------------------------

------------------------------------------------------------------------

------------------------------------------------------------------------

# Links

To create a link, enclose the link text in brackets (e.g., [Duck Duck Go]) and then follow it immediately with the URL in parentheses (e.g., (<https://duckduckgo.com>)).

My favorite search engine is [Duck Duck Go](https://duckduckgo.com).

## Adding Titles

You can optionally add a title for a link. This will appear as a tooltip when the user hovers over the link. To add a title, enclose it in parentheses after the URL.

My favorite search engine is [Duck Duck Go](https://duckduckgo.com "The best search engine for privacy").

## URLs and Email Addresses

To quickly turn a URL or email address into a link, enclose it in angle brackets.

<https://www.markdownguide.org>

[fake\@example.com](mailto:fake@example.com){.email}

# Images

To add an image, add an exclamation mark (!), followed by alt text in brackets, and the path or URL to the image asset in parentheses. You can optionally add a title after the URL in the parentheses.

![Project's folder](image/project_folder.jpg "Project's folder")

# Tables

To add a table, use three or more hyphens (---) to create each column's header, and use pipes (\|) to separate each column. For compatibility, you should also add a pipe on either end of the row.

| Syntax    | Description |
|-----------|-------------|
| Header    | Title       |
| Paragraph | Text        |

## Alignment

You can align text in the columns to the left, right, or center by adding a colon (:) to the left, right, or on both side of the hyphens within the header row.

| Syntax    | Description |   Test Text |
|:----------|:-----------:|------------:|
| Header    |    Title    | Here's this |
| Paragraph |    Text     |    And more |

# Fenced Code Blocks

The basic Markdown syntax allows you to create code blocks by indenting lines by four spaces or one tab. If you find that inconvenient, try using fenced code blocks. Depending on your Markdown processor or editor, you'll use three backticks (\`\`\`) or three tildes (\~\~\~) on the lines before and after the code block. The best part? You don't have to indent any lines!

    {
      "firstName": "John",
      "lastName": "Smith",
      "age": 25
    }

# Syntax Highlighting

Many Markdown processors support syntax highlighting for fenced code blocks. This feature allows you to add color highlighting for whatever language your code was written in. To add syntax highlighting, specify a language next to the backticks before the fenced code block.

``` {.json}
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25
}
```

# Definition Lists

Some Markdown processors allow you to create definition lists of terms and their corresponding definitions. To create a definition list, type the term on the first line. On the next line, type a colon followed by a space and the definition.

First Term

:   This is the definition of the first term.

Second Term

:   This is one definition of the second term.

:   This is another definition of the second term.

# Strikethrough

You can strikethrough words by putting a horizontal line through the center of them. The result looks like this. This feature allows you to indicate that certain words are a mistake not meant for inclusion in the document. To strikethrough words, use two tilde symbols (\~\~) before and after the words.

~~The world is flat.~~ We now know that the world is round.

# Task Lists

Task lists allow you to create a list of items with checkboxes. In Markdown applications that support task lists, checkboxes will be displayed next to the content. To create a task list, add dashes (-) and brackets with a space ([ ]) in front of task list items. To select a checkbox, add an x in between the brackets ([x]).

-   [ ] Write the press release
-   [ ] Update the website
-   [x] Contact the media

# Footnotes

Footnotes allow you to add notes and references without cluttering the body of the document. When you create a footnote, a superscript number with a link appears where you added the footnote reference. Readers can click the link to jump to the content of the footnote at the bottom of the page.

To create a footnote reference, add a caret and an identifier inside brackets ([^1]). Identifiers can be numbers or words, but they can't contain spaces or tabs. Identifiers only correlate the footnote reference with the footnote itself --- in the output, footnotes are numbered sequentially.

[^1]: This is the first footnote.

Add the footnote using another caret and number inside brackets with a colon and text ([^2]: My footnote.). You don't have to put footnotes at the end of the document. You can put them anywhere except inside other elements like lists, block quotes, and tables.

[^2]: This is the first footnote.

Here's a simple footnote,[^3] and here's a longer one.[^4]

[^3]: This is the first footnote.

[^4]: Here's one with multiple paragraphs and code.

    Indent paragraphs to include them in the footnote.

    `{ my code }`

    Add as many paragraphs as you like.

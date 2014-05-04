---
layout: custom
header: Markdown
intro: Get out of writing fancy code with this humanistic, editor-friendly language
baseurl: "../"
---

# Introduction

Markdown is a simple, humanistic way to write web content without coding. You still write content like you always have, only now you drop in a few symbols that magically transforms it into HTML. This means, you can put all your effort into writing great content without the hassle of using fancy code.

## Jekyll

Another definition for Markdown is [syntactic sugar](http://en.wikipedia.org/wiki/Syntactic_sugar) --- a language designed to make things easier to voice or read. It is not HTML, nor does it create HTML pages. Something else is responsible for transforming it stealthily into HTML. That something is [Jekyll](http://jekyllrb.com/).

In short, Jekyll runs your content through the ringer and spits out stylized HTML pages. And since it doesn't mess with your original content, you never have to touch HTML --- Jekyll automatically creates new HTML pages whenever you update your content.

## Prose.io

One content editor has stood out consistently with performance, simplicity, and practicality. If you’re rummaging around the web for a reliable content editor, include [Prose.io](http://prose.io) in your search. Prose.io is designed specially for managing and editing Markdown content on GitHub, although you can edit much more than that.


# Paragraphs

Now that you're acquainted with the inner-workings, let's get to the stuff you came here for --- starting with paragraphs.

Similar to Pages, Google Docs, and Word, you create paragraphs by writing one or more lines of content and separating them with blank lines. This is arguably the simplest form of writing in Markdown because it doesn't require any symbols.

<pre>
Lorem ipsum is simply dummy text of the printing and typesetting industry.

It has been the industry's standard dummy text ever since the 1500s.

Contrary to popular belief, Lorem ipsum is not random text.
</pre>

<summary class="panel">

Lorem ipsum is simply dummy text of the printing and typesetting industry.

Lorem ipsum has been the industry's standard dummy text ever since the 1500s.

Contrary to popular belief, Lorem ipsum is not random text.

</summary>


# Text-level Semantics

With Markdown, you can add these text effects to your content.

* [Bold](#toc_5)
* [Italic](#toc_6)
* [Bold and italic](#toc_7)
* [Underline](#toc_8)
* [Delete (or strikethrough)](#toc_9)
* [Superscript](#toc_10)

## Bold

Place two asterisks `**` or two underscores `__` at both ends of your content.

<pre>
Lorem ipsum is **simply dummy text** of the printing and typesetting industry. It has been the industry's standard dummy text __ever since the 1500s__.
</pre>

<summary class="panel">

Lorem ipsum is **simply dummy text** of the printing and typesetting industry. It has been the industry's standard dummy text __ever since the 1500s__.

</summary>

## Italic

Place one asterisk `*` at both ends of your content.

<pre>
Lorem ipsum is simply dummy text of the *printing* and *typesetting* industry.
</pre>

<summary class="panel">

Lorem ipsum is simply dummy text of the *printing* and *typesetting* industry.

</summary>

## Bold and italic

Mixing bold and italic styles is not complicated. The trick to it is using the underscore `__` for bold styles instead of the asterisks.

<pre>
__Lorem ipsum is *simply dummy text*__ of the printing and typesetting industry. It has been the industry's standard *dummy text __ever since the 1500s__*.
</pre>

<summary class="panel">

__Lorem ipsum is *simply dummy text*__ of the printing and typesetting industry. It has been the industry's standard *dummy text __ever since the 1500s__*.

</summary>

## Underline

Place one underscore `_` at both ends of your content.

<pre>
Lorem ipsum is simply dummy text of the _printing and typesetting industry_.
</pre>

<summary class="panel">

Lorem ipsum is simply dummy text of the _printing and typesetting industry_.

</summary>

## Delete

Place two tildes `~~` at both ends of your content.

<pre>
Lorem ipsum is ~~simply~~ dummy text of the ~~printing and~~ typesetting industry.
</pre>

<summary class="panel">

Lorem ipsum is ~~simply~~ dummy text of the ~~printing and~~ typesetting industry.

</summary>

## Superscript

Put one caret `^` before **each** word.

<pre>
Lorem ipsum^[1] is simply dummy text of the printing and typesetting industry^[Citation ^needed].
</pre>

<summary class="panel">

Lorem ipsum^[1] is simply dummy text of the printing and typesetting industry^[Citation ^needed].

</summary>


# Punctuation

You can create the following punctuations with Markdown:

* [Em dash](#toc_12)
* [En dash](#toc_13)
* [Horizontal rules](#toc_14)

## Em dash

Use three hyphens `---` to make an em dash.

<pre>
Lorem ipsum --- dummy text of the printing and typesetting industry.
</pre>

<summary class="panel">

Lorem ipsum --- dummy text of the printing and typesetting industry.

</summary>

## En dash

Use two hyphens `--` to make an en dash.

<pre>
Lorem ipsum -- dummy text of the printing and typesetting industry.
</pre>

<summary class="panel">

Lorem ipsum -- dummy text of the printing and typesetting industry.

</summary>

## Horizontal rules

To create horizontal rules, use three hyphens `---`, asterisks `***`, or underscores `___`.

<pre>
Hyphens

---

Asterisks

***

Underscores

___
</pre>

<summary class="panel">

Hyphens

---

Asterisks

***

Underscores

___

</summary>


# Blockquotes

Make a blockquote by putting a **greater-than** angle bracket `>` before the content.

<pre>
> Blockquotes are very handy to emulate content for quotes.
</pre>

> Blockquotes are very handy to emulate content for quotes.

<pre>
> When you are courting a nice girl, an hour seems like a second. When you sit on a red-hot cinder, a second seems like an hour. That's relativity. --- *Albert Einstein*
</pre>

> When you are courting a nice girl, an hour seems like a second. When you sit on a red-hot cinder, a second seems like an hour. That's relativity. --- *Albert Einstein*


# Headings

Tell Markdown what you want to be a heading and how big you want it by using hash tags `#`.

<pre>
# h1. Heading 1
## h2. Heading 2
### h3. Heading 3
#### h4. Heading 4
</pre>

## Setext styles

Instead of using hash tags, setext styles for h1 and h2 headings are available. Put at least three equal signs `===` under your content to make h1 headings and three dashes `---` to make h2 headings.

<pre>
h1. Heading 1
===

h2. Heading 2
---
</pre>


# Lists

This summary shows how to create the following lists:

* [Number](#toc_19)
* [Bullet](#toc_20)
* [Number and bullet](#toc_21)

## Number lists

Create number lists by putting a number before each line.

<pre>
1. First ordered list item
2. Another item
3. Actual numbers don't matter, just that it's a number
4. And here's another
</pre>

1. First ordered list item
2. Another item
3. Actual numbers don't matter, just that it's a number
4. And here's another

## Bullet lists

Make a bullet list by placing either a star `*`, a hyphen `-`, or a plus `+` before the content.

<pre>
* Bullet 1
- Bullet 2
+ Bullet 3
</pre>

* Bullet 1
- Bullet 2
+ Bullet 3

## Number and bullet lists

This example shows how to combine both lists. Notice the indents before the sub items. Use two spaces to make that indentation.

<pre>
1. First number list item
2. Another item
  * Bullet list item
3. Actual numbers list item
  1. Another bullet list item
4. And the final number list item
</pre>

1. First number list item
2. Another item
  * Bullet list item
3. Actual numbers list item
  1. Another bullet list item
4. And the final number list item


# Links

Creating a link is very simple with Markdown. All you have to do is put the word(s) you want to highlight in brackets `[]` and the link in parenthesis `()` next to it.

<pre>
[Visit our website](http://www.softlayer.com)

Hover over [this link](http://www.softlayer.com "SoftLayer, an IBM Company") to see the title

[Read our license on GitHub](../blob/master/LICENSE)
</pre>

<summary class="panel">

[Visit our website](http://www.softlayer.com)

Hover over [this link](http://www.softlayer.com "SoftLayer, an IBM Company") to see the title

[Read our license on GitHub](../blob/master/LICENSE)

</summary>

## Autolinks

Emulate a direct link without any specific words by putting angle brackets `<>` at both ends of the link.

`<http://www.softlayer.com>`<br>
`<howdy@softlayer.com>`

<summary class="panel">

Visit our website at <http://www.softlayer.com>

Email <howdy@softlayer.com> to get a quote

</summary>


# Images

Links and images use similar formats except:

* Images have an exclamation mark `!` before the brackets
* Text is optional --- although the brackets `[]` are still required

#### Example 1

<pre>
![Company Logo](http://static.softlayer.com/images/info/sl_logo_215x19.jpg "SoftLayer, an IBM Company")
</pre>

<summary class="panel">

![Company Logo](http://static.softlayer.com/images/info/sl_logo_215x19.jpg "SoftLayer, an IBM Company")

</summary>

#### Example 2

<pre>
![](http://static.softlayer.com/images/info/sl_logo_215x19.jpg "SoftLayer, an IBM Company")
</pre>

<summary class="panel">

![](http://static.softlayer.com/images/info/sl_logo_215x19.jpg "SoftLayer, an IBM Company")

</summary>


# Code

This summary shows how to decorate code snippets for the following formats:

* [Inline Code](#toc_28)
* [Code Blocks](#toc_29)

There's also some stuff about [code highlighting](#toc_30) if you're into that sort of thing.

## Inline code

Use `back-ticks` to show inline code.

<pre>
Use `back-ticks` to show inline code.
</pre>

## Code blocks

Fence your big chucks of code by putting three back-ticks <code>```</code> at the top and at the bottom.

<pre>
```
if (!selector) {
  selector = $this.attr('href')
  selector = selector && selector.replace(/.*(?=#[^\s]*$)/, '')
}

if ($this.parent('li').hasClass('active')) return

  var previous = $ul.find('active')[0]
  var e        = $.Event('show.active', {
  relatedTarget: previous
})
```
</pre>

<summary class="panel">

```
if (!selector) {
  selector = $this.attr('href')
  selector = selector && selector.replace(/.*(?=#[^\s]*$)/, '')
}

if ($this.parent('li').hasClass('active')) return

  var previous = $ul.find('active')[0]
  var e        = $.Event('show.active', {
  relatedTarget: previous
})
```

</summary>

## Code highlighting

To make your code blocks festive, we include highlights for dozens of programming languages, template languages, and other markup. Just add the language name after the top-set of back ticks if you want it highlighted.

For a complete list of supported languages, check out the [wiki page for Rouge](https://github.com/jayferd/rouge/wiki/List-of-supported-languages-and-lexers).

#### Example: Ruby

<pre>
```ruby
class TkFrame

  def cswap

    for loc in ['background', 'foreground', 'activebackground']
      c = @swapbut.cget(loc)
      @swapbut.configure(loc => @stopbut.cget(loc))
      @stopbut.configure(loc => c)
    end
  end

  def initialize
    super

    @swapbut = TkButton.new(self, 'command' => proc { self.cswap } ) {
      text "Swap"
      background '#EECCCC'
      activebackground '#FFEEEE'
      foreground '#990000'
      pack('side' => 'top', 'fill' => 'both')
    }
```
</pre>

<summary class="panel">

```ruby
class TwoLabs < TkFrame

  def cswap

    for loc in ['background', 'foreground', 'activebackground']
      c = @swapbut.cget(loc)
      @swapbut.configure(loc => @stopbut.cget(loc))
      @stopbut.configure(loc => c)
    end
  end

  def initialize
    super

    @swapbut = TkButton.new(self, 'command' => proc { self.cswap } ) {
      text "Swap"
      background '#EECCCC'
      activebackground '#FFEEEE'
      foreground '#990000'
      pack('side' => 'top', 'fill' => 'both')
    }
```
</summary>

#### Example: Python

<pre>
```python
from datetime import datetime

class TokensV2(object):
  def __init__(self, app):
    self.app = app

  def on_post(self, req, resp):
  body = req.stream.read().decode()

  index_url = self.app.get_dispatcher('identity').get_endpoint_url(req, 'v2_auth_index')
  v2_url = self.app.get_dispatcher('compute').get_endpoint_url(req, 'v2_index')
```
</pre>

<summary class="panel">

```python
from datetime import datetime

class TokensV2(object):
  def __init__(self, app):
    self.app = app

  def on_post(self, req, resp):
  body = req.stream.read().decode()

  index_url = self.app.get_dispatcher('identity').get_endpoint_url(req, 'v2_auth_index')
  v2_url = self.app.get_dispatcher('compute').get_endpoint_url(req, 'v2_index')
```
</summary>


# Tables

Making a table is fairly straightforward:

* The first row is always the header
* Dashes `-` separate the header from the data
* Colons `:` align the columns (and are optional)

Our first example shows all the symbols lined up neatly. Making tables look this neat is purely for readability. Symbols do not have to line up. In fact, the outer pipes `|` are not even required.

#### Example 1: Aligned

<pre>
| Column 1         | Column 2              | Column 3  |
| ---------------- |:---------------------:| ---------:|
| col 2 is         | centered              |     $1600 |
| col 3 is         | right-aligned         |       $12 |
| Row stripes      | improve readability   |        $1 |
| Responsiveness   | already built-in      |      FREE |
</pre>


| Column 1         | Column 2              | Column 3  |
| ---------------- |:---------------------:| ---------:|
| col 2 is         | centered              |     $1600 |
| col 3 is         | right-aligned         |       $12 |
| Row stripes      | improve readability   |        $1 |
| Responsiveness   | already built-in      |      FREE |

#### Example 2: Nonaligned

<pre>
The Not-So | Pretty | Version
--- | --- | ---
Still | looks | snazzy
Tall | Grande | Venti
Titan | Europa | Enceladus
</pre>

The Not-So | Pretty | Version
--- | --- | ---
Still | looks | snazzy
Tall | Grande | Venti
Titan | Europa | Enceladus


# Videos

You cannot embed videos with Markdown, but you can add an image that links back to the video.

<pre>
[![Title](http://img.youtube.com/vi/VideoID/0.jpg)](http://www.youtube.com/watch?v=VideoID)
</pre>

#### Example: YouTube

Here's how to add a video from YouTube.

1. Pick any video in YouTube.
2. Click the “Share” button.
3. Copy the `VideoID` from the link.
4. Paste the ID in both spots where VideoID is (and as a warning, it is case sensitive).

<pre>
[![Lefties](http://img.youtube.com/vi/1TUTwdOvAVM/0.jpg)](http://www.youtube.com/watch?v=1TUTwdOvAVM)
</pre>

<summary class="panel">

[![Lefties](http://img.youtube.com/vi/1TUTwdOvAVM/0.jpg)](http://www.youtube.com/watch?v=1TUTwdOvAVM)

</summary>

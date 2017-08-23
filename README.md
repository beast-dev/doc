## Creating content

You can use the [editor on GitHub](https://github.com/beast-dev/doc/edit/master/README.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

## BEASTdoc conventions

A few conventions to follow when creating content:

### Internal Links:

These go in square brackets i.e., `[beauti]` will link to a page called BEAUti.html (case is ignored and the .html should be omitted for simplicity). To create a link with more readable text: 
`[BEAUti application](beauti)`. 

### Images:

Use the 'image.html' include like this:

`{% include image.html file="image1.png" %}`

This will link to images in the root level /images folder.

Use the prefix attribute to link elsewhere (still assumes an 'images' folder):

`{% include image.html prefix="tutorials/tutorial1/" file="image1.png" %}`

This will link to '/tutorials/tutorial1/images/image1.png'

The size of the image can be controlled with the 'width' setting:

`{% include image.html width="50%" prefix="tutorials/tutorial1/" file="image1.png" %}`

Specify width as a percentage of the page width so that it will scale on smaller devices like phones.

A caption can also be included:

`{% include image.html caption="This is a nice image" width="50%" prefix="tutorials/tutorial1/" file="image1.png" %}`

### Preample material

Provide the title (used both on the page and as a title for the browser), a permalink (how the page will be displayed in the url), whether you want a table of contents and some tags for searching and indexing.

At the top of the page is a field called `summary:`. Include some text here to be displayed at the top of the page. All formatting in this block needs to be in html rather than markdown:

`summary: "This page provides a step-by-step tutorial for analyzing..."`

### Callouts

Various callouts/boxes can be used to break up the text. Here are the suggested uses:

#### Program icons 

Use an icon call out to introduce the software being used:

```
{% include icon-callout.html file='icons/beauti-icon.png' content='Run <a href="beauti">BEAUti</a> by double clicking on its icon. BEAUti is an interactive graphical application for designing your analysis and generating the control file (a BEAST XML file) which BEAST will use to run the analysis.' %}
```

There are icons for most of the main bits of software: beauti-icon.png, beast-icon.png, tracer-icon.png, utility-icon.png etc.

#### Downloads boxes

Use this box to give directions and links for a file download:

```
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The data file is called '<samp>YFV.nex</samp>' and can be found in the BEAST package in the '<samp>examples/Data/</samp>' folder or <a href="{{ root_url }}files/YFV.nex">can be downloaded from here</a>.</div>
```

#### Notes, Warnings etc.

A range of callout boxes are available for notes and warnings etc. These take the form:

```
{% include note.html content="Negative numbers denote years as Before the Common Era (BCE) but technically the calendar goes from 1 BCE to 1 CE --- there was no year zero. So if you want to report BCE years, you should take the absolute value and add 1" %} 
```

For the note version. Also available are `warning.html`, `important.html` and `tip.html` which each give different colours and icons.

#### Other callouts

Finally there are some simple callout boxes that have a coloured bar on the left. The general form is:

```
{% include callout.html type="warning" content="Stuff" %}
```

The `type` parameter controls the colour with the options being, danger, default, primary, success, info and warning --- [see here](http://idratherbewriting.com/documentation-theme-jekyll/mydoc_alerts.html#callouts).

Perhaps we can use these different colours with some conventions. For example, the `warning` type (which gives an orange side bar) can be used for setting questions:

```
{% include callout.html type="warning" content="How do the viruses from the Americas cluster relative to the African viruses and what conclusions can we draw from the inferred time scale?<br /><br /><br />" %} 
```

The `<br /><br /><br />` provide some blank lines for the answer.

[See this page for an example of all of these elements.](http://beast.community/workshop_rates_and_dates)

### Theme

This site uses a a modified <a href="https://github.com/tomjohnson1492/documentation-theme-jekyll/">Documentation Theme for Jekyll</a> by Tom Johnson.

[See this site for documentation on creating content for this theme.](http://idratherbewriting.com/documentation-theme-jekyll/)

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).


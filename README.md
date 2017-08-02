## Creating content

You can use the [editor on GitHub](https://github.com/beast-dev/doc/edit/master/README.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### BEASTdoc conventions

A few conventions to follow when creating content:

#### Internal Links:

These go in square brackets i.e., `[beauti]` will link to a page called BEAUti.html (case is ignored and the .html should be omitted for simplicity). To create a link with more readable text: 
`[BEAUti application](beauti)`. 

#### Images:

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


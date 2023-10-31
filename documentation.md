---
layout: page
title: Documentation
author: Alex Gil
---

## Contents
{:.no_toc}

* ToC
{:toc}

---

## Prerequisites

This documentation was built with beginners in mind, but has the necessary information for more seasoned producers.

To install and use Ed you will be using your terminal. If you need a refresher, I highly recommend "[The Command Line Crash Course](https://www.computervillage.org/articles/CommandLine.pdf)." Working knowledge of HTML and CSS is also taken for granted. If you're new to HTML and CSS, you may want to check out the relevant courses on [codecademy.com](https://www.codecademy.com/catalog/language/html-css).

Jekyll does not run very well on Windows machines. If you are using Windows, this theme can work for you with some difficulty. You can [struggle through it](https://jekyllrb.com/docs/installation/windows/), or simply deploy our principles, and parts of our stylesheet, on a system like [Hugo](https://gohugo.io/), which does work on Windows.

---

## Using Ed as a Template

You can use Ed on GitHub Pages for free, without a local installation, by editing the project files on github and using the template files. To use Ed this way you must have a Github account of your own. Once logged in, visit the [Github repository for Ed](https://github.com/minicomp/ed), and follow this steps:

1. Select **Use this template** (the big green button).
1. In the next page, name your new project. Remember to use only lowercase letters and no spaces.
1. Once you save your new settings, GitHub should take you to your new repository page. Select the **Settings** tab.
1. Once in **Settings** select **Pages**
1. In the **Pages** tab select the **main** branch from the **Branch** drop-down menu. Save. Your site will be built shortly. 
1. Give it a few minutes and refresh the page. GitHub should display the link to your published site when it's ready. 


## Installing Ed Locally

### Existing Ruby environments 

To install Ed locally you need a contemporary Ruby environment up and running. In 2022 we will use `chruby` with `ruby-3.1.2`. If you don't even know what the last two sentences mean, skip ahead. If you already have your own ruby environment and relatively recent Ruby installed, then you can get up and running by downloading the source code from Github and running  

Switch to the directory where you want to install your project. Once inside the folder, you are ready to download and start using Ed:

~~~ bash
$ git clone https://github.com/minicomp/ed.git
$ cd ed
$ gem install bundler
$ bundle install
~~~

That's it. To see if Ed is working properly we will take advantage of Jekyll's built in server. You can build the first version of your site and run the jekyll server at the same time by entering:

~~~ bash
$ jekyll serve
~~~

If at any point during this process you had an error you could not resolve, move on to the next section. If the site was rendered fine, copy the url from your terminal log and paste it into your browser of choice (I recommend Firefox). This url usually looks something like this `http://127.0.0.1:4000/ed`. At this point you should be looking at your very own working version of Ed:

![Your very own Ed]({{ site.baseurl }}/assets/screenshot-home.png)


### Installing from scratch

Our first step is to make sure you have XCode Command Line tools, and git specifically, installed in your computer. You may have both already. To check, type the following into your instructions (without the `$`, that's just there to remind you these lines are to be copied and pasted into the terminal)

~~~ bash
$ git --version
~~~

If you have git, you're good to go. If you don't, your Mac will ask you to install the XCode Command Line Tools, which will also install git. Say yes, please. This step also installs a number of other tools directly from Apple that you will need for everything else to work well.

Now we begin the long process of installing Jekyll. Jekyll is a Ruby gem (Ruby's name for software packages). The best way to ensure you have the right environment is to use a ruby environment mangager. In our case, we're going to use `chruby`, and the Ruby 3.1.2. To install `chruby` follow these instructions:

1. Install [Homebrew](https://brew.sh/). Think of Homebrew as a sort of App Store for your terminal. You may need to use your password and hit enter a few times after pasting the install link from Homebrew in your terminal. Remember that when you type your password into the terminal, the interface does not show that you are typing. Don't worry, it is listening. After you type it correctly, hit enter, and keep going.
2. After the installation succeeds, remember to copy the three lines indicated in the "Next Steps" message from Homebrew on your terminal. Now you should be able to brew.
4. Install `ruby-install` and `chruby` on your terminal (I'm using [these instructions](https://mac.install.guide/ruby/12.html) with some modification). `ruby-install` is a tool designed just to install Ruby. `chruby` is a tool used to manage Ruby. To install:   
~~~ Bash
$ brew install ruby-install chruby
~~~

<div style="border-style: dotted; padding: 1rem; margin-bottom: 1rem;"><p>Pro Tip: <code>`chruby`</code> is very useful for folks who are running older Jekyll themes that use Ruby 2.x.x, and need to switch back and forth with newer themes that have made the transition to Ruby 3.x.x. Changing the Ruby environment becomes as easy as:</p>
<pre>$ chruby ruby-3.1.2<br>$ chruby ruby-2.7.2</pre>
</div>
 

&nbsp;&nbsp;&nbsp;5. Now we will tell your shell where these commands that you just installed are by editing the "PATH," and make Ruby 3.1.2 the default ruby whenever you use the terminal (even before we install it!). If you are using traditional bash (the one with the `$` before your commands) you must edit the `~/.bash_profile` file (it's hidden, so this is where your command line skills will prove useful). If you are using zsh (the one with the `%` before your commands) you must edit the `~/.zshrc` file instead (this one is also hidden). For most beginners who have never done this, those files probably don't even exist. Let's create the one you need, open the file and then paste the appropriate lines.   
   
**For bash users (the $ on the shell):**: 
~~~ Bash
$ touch ~/.bash_profile
$ open ~/.bash_profile
~~~   
At this point your terminal will open your text editor. Probably TextEdit. (N.B. Make sure your TextEdit is set to save in plain text, and not rich text. This setting can be changed in TextEdit/Preferences). Now paste the following lines, save and close:
~~~
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-3.1.2
~~~   
**For zsh users (the % on the shell):**:   
~~~ Bash
$ touch ~/.zshrc
$ open ~/.zshrc
~~~   
At this point your terminal will open your text editor. Probably TextEdit. (N.B. Make sure your TextEdit is set to save in plain text, and not rich text. This setting can be changed in TextEdit/Preferences). Now paste the following lines, save and close:
~~~
source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby ruby-3.1.2
~~~
&nbsp;&nbsp;&nbsp;6. Quit and re-open your terminal. You will get an error message saying it can't find Ruby 3.1.2. Ignore. (Any other error message might be worth paying attention to, though).

&nbsp;&nbsp;&nbsp;7. Now the big moment: Install Ruby 3.1.2:
~~~ Bash
$ ruby-install ruby-3.1.2
~~~ 
If you have a newer Mac with an M1 or M2 chip, you might need to add the `--enable-shared` flag like this:
~~~ Bash
$ ruby-install ruby-3.1.2 -- --enable-shared
~~~ 

&nbsp;&nbsp;&nbsp;8. Quit and re-open your terminal again. There should be no errors at this point.

&nbsp;&nbsp;&nbsp;9. Check to see if your new Ruby interpreter is working:
~~~ Bash
$ ruby -v
~~~ 

If the answer is 3.1.2, you are ready to install the software you will need to run Ed, including Jekyll (the static site generator that uses the Ed theme). Bundler will do this for you, and along with a couple of other little things that Ed will need to run. You are also ready to download the Ed files, which comes witha list of extra software, or "dependencies" that Ed uses. 

<div style="border-style: dotted; padding: 1rem; margin-bottom: 1rem;"><p>Pro-tip: Many contemporary Jekyll installs break because the new Jekyll doesn't come with a gem called <code>webrick</code>. Ed already has <code>webrick</code> included in its <code>Gemfile</code>—the instructions for what gems to install on Ruby projects—so it will install this extra gem alongside Jekyll. <strong>But</strong>, if you came to this guide as a reliable way to run other Jekyll projects because this guide is a legend, please remember to add or install the <code>webrick</code> gem if you are going to use newer versions of Jekyll. If you are using Bundler you can use the following command:</p>

<pre>$ bundle add webrick</pre>

<p>If you are just installing gems yourself one by one, common on projects that come without a Gemfile, this might do the trick:</p>

<pre>$ gem install webrick</pre>
</div>


Now let's get down to business. 

The following steps make a couple of assumptions:

1. That you have a GitHub account. If you don't, [please create one](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiq_Lmp-cn6AhV9FlkFHQhLAjYQFnoECA8QAQ&url=https%3A%2F%2Fgithub.com%2Fjoin&usg=AOvVaw0H9TK-nu7JfXaoNeNMgJEk). 
2. That you set up your global credentials for git on your computer. If not, replace the content in quotation marks with your info, and run these lines on the terminal:   
~~~ Bash
$ git config --global user.email "you@example.com"
$ git config --global user.name "Your Name"
~~~
2. That your computer is connected to your GitHub account, and can push (upload), and pull (download) from that account. If you are using Microsoft Visual Studio Code as your main plain text editor (recommended), this can be easily done by linking your GitHub account to VS Code. There are many ways to accomplish this, some built in into VS Code, or by [adding the GitHub extension](https://code.visualstudio.com/docs/sourcecontrol/github). If you're planning to use the Terminal to interact with GitHub and git, then you need to [set up an ssh key connection to GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent). The latter is a more involved process, and beginners may want to save it for later when they get more comfortable with these type of workflows.

Ok. If you have your GitHub account and you're set up with your VS Code or your Terminal, you are ready to proceed:

Visit <a href="https://github.com/minicomp/ed.git">the repository for Ed</a>. On GitHub, follow the following steps:
1. Select **Use this template** (the big green button).
1. In the next page, name your new project. Remember to use only lowercase letters and no spaces.
1. Once you save your new settings, GitHub should take you to your new repository page. At this point you are ready to clone the project into your computer.

**For VS Code users:**: 

1. Create a folder called `www` on your Mac user folder, i.e. right next to Documents, Downloads, Desktop, etc. 
1. Open VS Code
2. Select 'Clone Git Repository' from the starting page, or go to the Source Control tab on the left (Ctrl + Shift + G), and select 'Clone Repository.' (If you already had a folder open on your VS code, then make sure to close it in the File menu before doing this step)
3. If this is your first time cloning a repository on VS Code, select "Clone from Github." VS Code will now download a list of all your existing repositories, and create a new dropdown menu listing them all. You can search or browse through this list.
4. Select the repository you just created on your GitHub when you copied the Ed template. It should be available from the dropdown menu. 
4. When prompted where you would like to save the local copy, save it in the `www` folder you created in step #1. 

That's it. VS Code should now download it and from now on be able to upload to it. Skip ahead to "All together now" for the last few bits left and to run the local server.

**For Terminal users:**: 

Using the `cd` command on your terminal, navigate to the folder where you keep your web projects. For the sake of this tutorial, we're going to use a folder called `www`, which will live in your main user folder, next to Documents, Downloads, Desktop, etc. Since you probably don't have this folder in your computer, let's create it on the terminal, and move our operation there:

~~~ Bash
$ mkdir ~/www
$ cd ~/www
~~~ 

Once you're in the `www` folder, where Ed will live, download it from github. You will need the right SSH link for this, not the HTTPS key. To get the right key, on your GitHub repo page, on the Code drop-down menu (the green button) you will see 3 tabs. HTTPS, SSH and GitHub CLI. Make sure to select the SSH tab before copying the link. Once you have that link copied in your clipboard, go back to the terminal and "clone" the repository:

~~~ bash
$ git clone [the SSH link to your repository]
~~~


**All together now**

We'll need the terminal for this. At this point we want to make sure that we're all in the `ed` folder:

~~~ Bash
$ cd ~/www/ed
~~~ 

Once  you are inside the Ed folder, run these final steps:

~~~ Bash
$ gem install bundler
$ bundle install
~~~ 

If you don't get any errors, Ed should work at this point. To see if Ed is working properly, we will take advantage of Jekyll's built-in server. You can build the first version of your site and run the jekyll server at the same time:

~~~ bash
$ bundle exec jekyll serve
~~~

Copy the URL from your terminal log and paste it into your browser of choice (I'm team Firefox myself). This URL usually looks something like this `http://127.0.0.1:4000/ed`. At this point you should be looking at your very own working version of Ed:

![Your very own Ed]({{ site.baseurl }}/assets/screenshot-home.png)

If you did get an error at any point during this process, and don't feel comfortable troubleshooting on the terminal, this is a good opportunity to reach out to a friend who can help. You can leave me a note on [the issues page](https://github.com/minicomp/ed/issues), for example. I'll try to get to it as soon as my other commitments permit. If you're comfortable troubleshooting on your own, I recommend Jekyll's own [troubleshooting documentation](http://jekyllrb.com/docs/troubleshooting/). Another great strategy for troubleshooting on the terminal is to copy and paste the errors you receive (*sans* personal information) into your favorite search engine.


---

## Replacing an existing Jekyll theme with Ed

Ed, like Jekyll, is also a gem. Jekyll gives you the option to switch themes, as long as those themes are gems as well. If you have existing content and would like to use Ed, you need to add the following line to your _config.yml file, usually at the bottom:

~~~
theme: "ed."
~~~

You also need to add the gem to your Gemfile file:

~~~
gem "ed."
~~~

Make sure to replace the version number with the one you need. I will do my best to document what changes come with each new gem. If your current theme does not have a Gemfile, you would need to create one and add the line above. The Gemfile is a plain text file like all other files in Jekyll, and should not have a file extension.

After these files have been modified, you need to update your Bundle in the terminal:

~~~ bash
$ bundle update
~~~

When using the gem on top of a previous theme, you will not have all the files of a full Ed install immediately available to you. More importantly, you may not have a _texts folder. You need to create one or copy them from a full installation of Ed. You might also want to add the search and index file. The gem comes bundled with all these files once you install it on your system, but they won't be in the same folder as your project. To locate them you can refer to the [Jekyll documentation for gem-based themes](https://jekyllrb.com/docs/themes/). With some previous themes you might need to erase lingering files that interfere with the functioning of Ed. This can be an advanced operation I can't do justice to here. At that point you might need to familiarize yourself with the architecture of Jekyll, or pay close attention to errors when you try to serve the site, and reverse-engineer from there.

Going forward, updating to a new version of Ed is as simple as changing the release version and running the bundle update. I will try to keep changes in the actual markup to a minimum, but will let users know if any changes require a global find and replace in your editions.

---

## Jekyll

Ed is a Jekyll theme. That means you will need some familiarity with Jekyll to take advantage of its full potential. While running a Jekyll site is a bit more involved than Wordpress and other similar tools, the payoff in the long term is worth the effort to learn it. If you are new to Jekyll, I recommend you take a look at ["How (and Why) to Generate a Static Website Using Jekyll"](http://chronicle.com/blogs/profhacker/jekyll1/60913) at ProfHacker, Amanda Visconti's excellent [Building a static website with Jekyll and GitHub Pages](http://programminghistorian.org/lessons/building-static-sites-with-jekyll-github-pages) on *The Programming Historian* and [Jekyll's own documentation](http://jekyllrb.com/) to start getting a sense of how it works.

Once you have gone through these tutorials, you can get started using Ed by replacing the sample texts included in in the `_texts` folder in Ed with your own edited texts. Remember to always and only edit files in Ed using [a plain text editor](https://en.wikipedia.org/wiki/Text_editor), and *not* a word processor. I'm composing this file using a plain text editor called [Visual Studio Code](https://code.visualstudio.com/) by Microsoft (recommended).  

An easy way to make new texts is to copy an existing text, replace the content and rename the file. Remember to always use the jekyll convention for naming files: `your-title.md`. You should also make sure that all your texts have the YAML front matter (the information at the top of the file). YAML stands for "YAML Ain't Markup Language"---no disrespect to XML---and it's the main way that Jekyll handles named data. Here's an example of YAML front matter:

~~~ yaml
---
layout: poem
title: "Cahier d'un retour au pays natal"
author: Aimé Césaire
---
~~~

Besides replacing content and creating new texts, you will probably  want to edit the `_config.yml` file to replace the boilerplate information we provided with your own personalized information in the relevant categories. Avoid replacing the information in categories that are not clear to you. Make sure to use proper YAML formatting when writing in the `_config.yml` file. Here's [a good reference source](http://docs.ansible.com/ansible/YAMLSyntax.html) in case you have doubts.

---

## Markdown and kramdown

Ed is designed for scholars and amateur editors who want to produce either a clean reading edition or a scholarly annotated edition of a text. The main language we use to write in the Jekyll environment is called Markdown. To learn more about the Markdown family, see Dennis Tenen and Grant Wythoff's "[Sustainable Authorship in Plain Text using Pandoc and Markdown](http://programminghistorian.org/lessons/sustainable-authorship-in-plain-text-using-pandoc-and-markdown)."

Our version of Jekyll uses a special Markdown processor called kramdown. The processor can be said to use it's own 'flavor' of Markdown, and sometimes the Markdown syntax will be different than other flavors of Markdown. Kramdown is convenient for scholars because of the way it handles footnotes. You can become familiar with the kramdown syntax in the [kramdown documentation](http://kramdown.gettalong.org/syntax.html). Another way to become familiar is to examine the sample text source files we provided.

---

## Genres

Ed offers three different layouts: poem, narrative and drama. The genre is indicated in the YAML front matter on your texts. The templates that govern how these genres are displayed can be found in the `_layouts` folder. Using these layouts will allow you to tweak the stylesheets according to your different needs. Out of the box, Ed contains some special instructions for poetry in its stylesheets that allow you to deal with some of the peculiarities of poetry layouts.

To indicate lines in poetry we use the line syntax from Markdown:

~~~ markdown
- Hold fast to dreams
- For if dreams die
- Life is a broken-winged bird
- That cannot fly.
- Hold fast to dreams
- For when dreams go
- Life is a barren field
- Frozen with snow.
~~~

To indent specific lines we take advantage of a feature in kramdown that allows us to indicate classes for a line. This approach still allows the line to be readable while editing.

~~~ markdown
- {:.indent-3} But O heart! heart! heart!
- {:.indent-4} O the bleeding drops of red,
- {:.indent-5} Where on the deck my Captain lies,
- {:.indent-6} Fallen cold and dead.
~~~

The `-` at the beginning of each line indicates that these are lines. The `{:.indent-3}` is what we need to in order to indicate the indent value for that line. Values can range from 1-10. You can expand the range or adjust the values in the Ed stylesheet (`_ed.scss`) in the `_sass` folder.

The example from Raisin in the Sun shows us that we don't need much special markup for theater as long as we use CAPITAL LETTERS for speakers. Italics for directions are easy enough. Just use `*` around the words you want to italicize.

*Narrative of the Life of Frederick Douglass* shows us an example of narrative that includes footnotes and quoted poetry. See the sections below for how to accomplish these different effects.

---

## Footnotes

Footnotes are the bread and butter of scholarship. Kramdown makes footnotes a fairly simple affair:


~~~
- O Captain! my Captain! rise up and hear the bells;
- Rise up—for you the flag is flung—for you the bugle[^fn2] trills,

...

[^fn2]: The bugle is a small trumpet implicated in the military industrial complex.
~~~

These footnotes can be placed anywhere, but they will always be generated at the bottom of the document. To have a multi-paragraph footnote you need to start the footnote text on the next line after the footnote anchor and indent it:

~~~
[^fn3]:
  Ugh pinterest fixie cronut pitchfork beard. Literally deep
  cold-pressed distillery pabst austin.

  Typewriter 90's roof party poutine, kickstarter raw
  denim pabst readymade biodiesel umami chicharrones XOXO.
~~~

The footnotes system provided by kramdown does have one limitation: It generates the numeration for you automatically, and it only allows you to have one set of footnotes for a text. In some cases we have to separate the author's footnotes from our own, in others we want to represent the author's own footnote style. In these cases we have to use HTML. Here's the example from *Narrative of the Life*:

~~~ html
... At this time, Anna,<sup><a href="#fn2" id="ref2">\*</a></sup> my intended wife, came on;

...

<sup id="fn2">*</sup> She was free. [&#x21a9;&#xfe0e;](#ref2)
~~~

Notice the double HTML Entity (hex), `&#x21a9;&#xfe0e;`, used at the end of the footnote to return us to the top. The first hex is the &#x21a9;&#xfe0e; symbol proper. The second assigns the proper variant glyph. This is a necessary hack while we wait for Apple devices to stop turning everything into unseemly emojis.

---

## Blockquotes

*Narrative of the Life* also includes several blockquotes. You can also find another example of blockquote use in the footnote of "O Captain! My Captain!" Simple blockquotes are simple enough in kramdown:

~~~
> This is to certify that I, the undersigned, have given the bearer, my servant, full liberty to go to Baltimore, and spend the Easter holidays.
>
> Written with mine own hand, &c., 1835.  
> WILLIAM HAMILTON,
~~~

To use a line break in block elements add two spaces after the end of the line where you want the break. You can't see them after `&c., 1835.` but they are there.

Things get a bit complicated when we want to use poetry inside the block or when the block is included in another block element, like a footnote. Here's the last two stanzas from "A Parody" in *Narrative of the Life*, which shows an example of a blockquote of poetry:

~~~
...
> - Two others oped their iron jaws,
> - And waved their children-stealing paws;
> - There sat their children in gewgaws;
> - By stinting negroes' backs and maws,
> - They kept up heavenly union.
> ^
> - All good from Jack another takes,
> - And entertains their flirts and rakes,
> - Who dress as sleek as glossy snakes,
> - And cram their mouths with sweetened cakes;
> - And this goes down for union.
{:.poetry}
~~~

The `{:.poetry}` tag at the end tells the processor to think of the lines above it as poetry. The `{:.poetry}` tag is an example of kramdown class assignments for block-elements. Because this segment of poetry exists in the 'narrative' layout, and because it is part of a blockquote, we need to signal to the processor to process poetry this way, so that the right class is invoked in the stylesheet. Notice also the `^` separating the stanzas. This bit of kramdown syntax helps us separate the stanzas while staying within the blockquote. The good news is this is the most complex kramdown syntax layout you will encounter in Ed.


## Pages

Your editions are treated as [collections](https://jekyllrb.com/docs/collections/) in Ed. Other web pages in your site exist outside the `_texts` folder. The homepage, for example, is constructed from the `index.html` file found on the root folder of your Ed project.

You will notice that the homepage in particular has a `.html` file ending instead of a `.md` ending. All template files in Jekyll are HTML, and the index behaves as a template file. Although these files are mostly written in HTML, notice that they still contain YAML front matter and liquid tags. To edit the homepage replace the content on the file shipped with Ed, making sure that your changes to `index.html` are written in valid HTML. The same goes for the template files in the `_layouts` folder.

Ed also comes with a search page, `search.html`. This page implements [elastic lunr](http://elasticlunr.com/), "a lightweight full-text search engine in Javascript for browser search and offline search." This simple search page can be useful if you have large collections of texts. If you don't, and don't feel the need, go ahead and delete it along with the `assets/js` folder.

Besides the homepage and the search page, Ed ships with an About page, `about.md` and a documentation page, `documentation.md`, i.e. this page. As you can see, these are regular `.md` files. You can replace the contents of each file using normal kramdown syntax. This also applies to any new page you create, which you should remember to save with an `.md` extension. When editing the `bibliography.md` file, be careful not to replace the liquid tag that generates your bibliography, unless you don't want to have a bibliography at all.

---

## Tables of Content

You will find three kinds of Tables of Content in Ed. The first example is in the list of Sample Texts in the Homepage. This list is generated using the [Liquid Templating language](http://liquidmarkup.org/). This is one of the major components of Jekyll, and I recommend you deepen your knowledge of it if you want to modify the logic that automates much of Ed. Here is the code that generates the Sample Texts list on the homepage:

~~~ html
<div class="toc">
  <h2>Sample texts</h2>
  <ul class="post">
  {% for item in site.texts %}  
    <li class="text-title">
      <a href="{{ site.baseurl }}{{ item.url }}">
        {{ item.title }}
      </a>
    </li>
  {% endfor %}
  </ul>
</div>
~~~

As you can see, the liquid tags `{%raw%}{% %}{%endraw%}` and `{%raw%}{{ }}{%endraw%}` are embedded into the HTML. Those with `{%raw%}{% %}{%endraw%}` often use programmatic logic, as is the case here. If you are not already familiar with programming languages, you may need to start elsewhere. I recommend learning Ruby, since this is the language used to build jekyll and jekyll-scholar in the first place (it's also the first programming language I used, so I'm biased). The `{%raw%}{{ }}{%endraw%}` simply pulls data from your project. In the example above it pulls the title from each 'post', i.e. each edited text. As you may have noticed already, we are basically adapting the blogging features of Jekyll to our own ends, what Cuban designer and theorist Ernesto Oroza would call "[technological dissobedience](http://www.ernestooroza.com/)."

The second kind of table of content is exemplified in this documentation. If you open the source file for the documentation, you will notice at the top this snippet:

~~~ markdown
## Contents
{:.no_toc}

* ToC
{:toc}
~~~

This is the kramdown way. The first tag, `{:.no_toc}` tells the processor not to add `## Contents` to the ToC. The second part creates an empty list and then tells the processor to replace it with a table of contents based on headers in the document. You can use this syntax in any page on the site that uses headers.

The third way is slightly more involved, but very useful for long texts. If we add the table of contents to the YAML front matter of a page, Ed will activate the optional table of content sidebar (`_includes/sidebar-toc.html`) and move the table of contents to a special sidebar for that page. *Narrative of the Life* uses this method for its table of content. If you would like to replicate this functionality in your own long texts, make sure to use the same syntax:

~~~ yaml
toc:
- Title Page
- Preface
- Letter From Wendell Phillips
- Chapter I
- Chapter II
~~~

The internal links pointing to the right sections in your document are generated from the title names automatically. In order for the links to work the names on section headings must contain the same words as the section headers. The punctuation and capitalization is irrelevant. If you can figure out how Ed accomplishes this trick, you have graduated from the Ed school of minimal editions.

---

## Bibliographies

If you want to include a small bibliography, and you feel it would be easier to write it out directly, Ed can help you render it with hanging indentation.  To achieve this effect make sure to use the `.bibliography` class in an ordered list. For example:

~~~ markdown
1. Douglass, Frederick et al. Narrative of the Life of Frederick Douglass: An American Slave. Charlottesville, Va.: University of Virginia Library, 1996. Open WorldCat. Web. 17 Apr. 2016.
2. Hansberry, Lorraine, and Robert Nemiroff. A Raisin in the Sun. Rep Rei edition. New York: Vintage, 2004. Print.
{.bibliography}
~~~

Which should display like this:

1. Douglass, Frederick et al. Narrative of the Life of Frederick Douglass: An American Slave. Charlottesville, Va.: University of Virginia Library, 1996. Open WorldCat. Web. 17 Apr. 2016.
2. Hansberry, Lorraine, and Robert Nemiroff. A Raisin in the Sun. Rep Rei edition. New York: Vintage, 2004. Print.
{:.bibliography}

---


To help us style and generate bibliographies and citations *automatically*, Ed can use the jekyll-scholar gem by [Sylvester Keil](https://github.com/inukshuk/). To learn more about the gem beyond the basic instructions below, make sure to read the documentation on the [jekyll-scholar](https://github.com/inukshuk/jekyll-scholar) GitHub page. Keep in mind, though, that installing jekyll-scholar and working with it may be a bit difficult for beginners.


If you can get over the hurdles, jekyll-scholar can save you enormous amounts of time in the long term for your citation and bibliographic work. To begin, you must move the contents of the `jekyll-scholar starter kit` in your `optional` folder into the root folder. This will effectively replace the original `_config.yml` and `Gemfile` files, and add a `_bibliography` folder, and the `bibliography.md` and `Rakefile` files. To enable jekyll-scholar you must re-run `bundle install` again.

If everything goes smoothly, you should be able to start using jekyll-scholar at this point. The first thing you may want to do is provide Jekyll with your own bibliographic information in the form of a `.bib` file to replace the content of the `references.bib` file we've provided in the `_bibliography` folder.

To make it easy to create your own version of this file and to keep track of your bibliography for your project, in general I recommend you use [Zotero](http://zotero.org/). To export from Zotero in this format select the references you need from within your Zotero library, right click and select `export in...` and choose the BibLaTeX format. Rename your file to `references.bib` and move it into the `_bibliography` folder. You are, of course, free to create your `references.bib` file using any method you prefer as long as it is a BibTeX file.

Because as textual editors we are more likely than not to use citations in footnotes or pages that contain footnotes, and because footnotes will be necessarily generated at the bottom of the page, Ed also needs a separate page for your Bibliography or works cited. This is the role of the `bibliography.md` file. Feel free to edit the sample text, but make sure to leave the following line intact:

<pre>
&#123;% bibliography %&#125;
</pre>

To link your citations to the bibliography page, instead of writing them by hand, you can use the cite function in jekyll-scholar:

<pre>
&#123;% cite cesaire_discourse_2001 %&#125;
</pre>

Here's the breakdown:

* `cite` is the jekyllscholar command.
* `cesaire_discourse_2001` is the unique ID for Césaire's *Discourse on Colonialism* entry included in the reference.bib file.

Note that our jekyll-scholar starter kit comes ready for MLA style. To use Chicago style or more advanced citation features, refer to the documentation on jekyll-scholar to make the appropriate changes.

**Publishing your site on Github Pages with jekyll-scholar**

If you install jekyll-scholar, or most other plugins in Jekyll, you will need a workaround to publish your site on Github Pages, which only runs in 'safe mode.' I've provided a slightly modified version of a `Rakefile` originally created by [Robert Rawlins](https://blog.sorryapp.com/blogging-with-jekyll/2014/01/31/using-jekyll-plugins-on-github-pages.html) that will help you accomplish this task. Once you are ready to publish, switch to your `gh-pages` branch and run the following command:

~~~ bash
$ rake ed:publish
~~~

---

## Tips and Tricks

- The folding sidebar menu is generated from the `sidebar.html` file in the `_includes` folder. The top menu items are generated automatically from your pages. The bottom menu items are manually written in HTML. This structure can allow you to add external links. If you don't have that many pages, you may choose to do all the links by hand.
- For more hand-crafted layouts---such as [the title page in *The Narrative of the Life*]({{ site.baseurl }}/texts/narrative/index.html#title-page)---you may choose to work directly with HTML. One of the great advantages of working with the kramdown processor is that we have a lot of flexibility to mix HTML with the kramdown syntax. Note though, that even in the case of the title page, you can achieve these effects using kramdown syntax.
- Make sure to add horizontal rules, `---`, to separate sections in your texts. This creates a more pleasant layout.
- You can clean unnecessary folders and files from the original Ed package before publishing your site. This will help you reduce overhead. For example, you can erase this page, the sample texts and the `syntax.css` file (used for styling code).
- Consider providing tips for your readers on how to make their font bigger or smaller by taking advantage of <kbd>Command</kbd> + <kbd>+</kbd> and <kbd>Command</kbd> + <kbd>-</kbd>. Or returning to the top of the page using <kbd>Command</kbd> + <kbd>Up Arrow</kbd>. Part of the philosophy behind Ed is to avoid duplicating features that are already easily available in most web ecosystems.
- If you want to allow annotations on your site, consider providing a `via.hypothes.is` link. Our sample site can be annotated, for example, using the following link: `https://via.hypothes.is/http://minicomp.github.io/ed/`, which readers can access on the sidebar. Once you've indicated your own URL in the config file, the link will update automatically. Make sure to visit [hypothes.is](https://hypothes.is/) to learn more.
- Ed includes metadata in the headers that makes it easier for users of Zotero, and other systems to grab bibliographic information for the site and individual texts. Our metadata functionality may not be enough to generate a full proper citation. Consider providing visible citation information in your about page or homepage.
- Make sure to deepen your knowledge of the building blocks of Ed: Jekyll, YAML and Liquid. A great list of resources can be found in the blog "[Jekyll for Web Designers](http://jameswillweb.github.io/jekyll-for-designers/resources.html)".
- Our base themes Poole/Lanyon allow for easily customization of the interface. You can, for example, switch the position of the sidebar, change the theme colors and overlay options. To learn more check out the [Lanyon documentation](https://github.com/poole/lanyon#themes), and make sure to try the green, `.theme-base-0b`, it's really nice.
- You can change the look and feel of the site as a whole by changing the `color-scheme` in the `_config.yml` file. If you want to have more granularity, short of editing the `css`, you can change the variable values in the `assets/css/style.scss` file.
- In the `optional` folder you will find a sample `xslt` to help you get started converting TEI to Ed. You will also find css for adding pop-up "balloons" or tooltips to your texts.

---

## Publishing: A UNIX server

Publishing and Ed edition can be done in one of two ways. One way is to host it on a server you rent, own or have access to. Most mortals pay a hosting provider to host their sites. I recommend [Reclaim Hosting](https://reclaimhosting.com/), which is run by scholars for scholars. If you are affiliated with a university, chances are that your institution provides you with a UNIX account and a bit of server space. Since Jekyll generates a full static site for you, that means you can park it there too. To do so you need to build the site first. If you have been keeping your eye on your project by using `jekyll serve`, chances are you have a current built site in your project folder labelled `_site`.

If you don't already, you can build one easily by using the following Jekyll command:

~~~ bash
$ jekyll build
~~~

Or, again, if you have multiple environments:

~~~ bash
$ bundle exec jekyll serve
~~~

Using an FTP client like [Filezilla](https://filezilla-project.org/), or [SSH on your terminal](https://www.siteground.com/tutorials/ssh/), you need to push the contents of the `_site` folder to the folder on your server where you would like your project to exist. Depending on your host provider, you may be able to receive help from the sys admins with this step.

Please refer to the [note below on base urls](#a-note-on-your-base-url) to make sure your new links work on your new site.

## Publishing: GitHub pages

The second option is to publish your site for free on GitHub Pages.
Whether you decide to publish on GitHub pages or not, we recommend that you still use git and GitHub to version your edition and make the data available via another channel other than your webpage. This is one of the great advantages of using our system, increasing the chances of survival of your work and opening new audiences for it.

If you do decide to use the GitHub pages option, please make sure to read the [note below on base urls](#a-note-on-your-base-url).

To publish on GitHub pages, you must have a copy of the repository in GitHub. That means you also need an account there. Once you've created the repository that you will use, you must link your local repository to the one on GitHub. Notice that because you cloned the original source files from my repository, it will be linked to my repository (to which you don't have writing privileges) until you do this step. Instructions for changing the remote URL can be found [here](https://help.github.com/articles/changing-a-remote-s-url/).

The usual way of doing it is to create a different git branch called `gh-pages` within your local repository for your site. This is a branch is published by GitHub by default. GitHub also gives you the option to select [any branch you want to publish](https://github.com/blog/2228-simpler-github-pages-publishing), including the master branch.

In the following I use the gh-pages branch. To create and use that branch use the following command:

~~~ bash
$ git checkout -b gh-pages
~~~

Once you are using that branch, you are ready to publish your site. To do so use simply push the gh-pages branch to github:

~~~ bash
$ git push origin gh-pages
~~~

You can now access your site using an address that looks like `http://your-username.github.io/your-project-name`. The sample page for Ed, for example, is hosted at [minicomp.github.io/ed](http://minicomp.github.io/ed).

**<span id="a-note-on-your-base-url">A note on your base url</span>**

When you publish on a subfolder—automatic on GitHub pages—many of your links will break unless you indicate the name of your sub-folder in the `baseurl` value in your `_config.html` file. In addition, you need to make sure that your site-wide links (your links to your CSS files, for example) are preceded by the `{{ site.baseurl }}` tag. The base Ed install already uses this system, so you can simply replace the value `/ed` in your `baseurl` to `/your-project-slug`.

If on the other hand you are running your site on a root folder, simply erase `/ed`, but do make sure to leave the single quotes:

~~~ yaml
baseurl: ''
~~~

---

That should do it. If you have suggestions on how to improve Ed, make sure to leave us a line on [our issues page](https://github.com/minicomp/ed/issues), or send us a pull request.

Happy editing!

Alex Gil  
April 2016

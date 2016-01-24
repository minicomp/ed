---
layout: page
title: Documentation
---

## Getting Started

Ed is a Jekyll theme. That means you will need some familiarity with Jekyll to take advantage of its full potential. While running a Jekyll is a bit more involved than Wordpress and other similar tools, the payoff in the long term is worth the effort to learn it. If you are new to Jekyll we recommend you take a look at ["How (and Why) to Generate a Static Website Using Jekyll"](http://chronicle.com/blogs/profhacker/jekyll1/60913) at ProfHacker, and the excellent [Jekyll documentation](http://jekyllrb.com/). To use Jekyll you will be using your terminal. If you need a refresher, I highly recommend "[The Command Line Crash Course](http://cli.learncodethehardway.org/book/)" 

Note that Jekyll does not run very well on Windows machines as of now. If you are using Windows, this theme won't work for you, but we hope that you simply deploy our principles on a system like [Hugo](https://gohugo.io/), which does work on Windows.

Jekyll is a Ruby "gem" (Ruby's name for software packages). Besides Jekyll, Ed needs another gem to run: jekyll-scholar. I have provided a `Gemfile` that allows you to install the right versions of jekyll and jekyll-scholar. Before you can use this Gemfile, you need to to setup the right Ruby environment for Ed to run smoothly. The best way to ensure you have the right environment is to use Ruby Version Manager, or [rvm](https://rvm.io/), and the latest stable version of Ruby. To install rvm *and* a recent version of Ruby at the same time enter the following two lines into your terminal (always ignore the $):

 	$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
 ^
  	$ \curl -sSL https://get.rvm.io | bash -s stable






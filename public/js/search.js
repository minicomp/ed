---

---
// Based on a script by Kathie Decora : katydecorah.com/code/lunr-and-jekyll/

//Create the lunr index for the search

var index = elasticlunr(function () {
  this.addField('title')
  this.addField('author')
  this.addField('layout')
  this.addField('content')
  this.setRef('id')
});

//Add to this index the proper metadata from the Jekyll content

{% assign count = 0 %}{% for post in site.posts %}
index.addDoc({
  title: {{post.title | jsonify}},
  author: {{post.author | jsonify}},
  layout: {{post.layout | jsonify}},
  content: {{post.content | jsonify | strip_html}},
  id: {{count}}
});{% assign count = count | plus: 1 %}{% endfor %}
console.log( jQuery.type(index) );

// Builds reference data (maybe not necessary for us, to check)

var store = [{% for post in site.posts %}{
  "title": {{post.title | jsonify}},
  "author": {{post.author | jsonify}},
  "layout": {{ post.layout | jsonify }},
  "link": {{post.url | jsonify}},
}
{% unless forloop.last %},{% endunless %}{% endfor %}]

//Query 

$(document).ready(function() {
  $('input#search').on('keyup', function () {
	var resultdiv = $('#results');
	var query = $(this).val();
 
  //The search is then launched on the index built with Lunr
  var result = index.search(query);
  resultdiv.empty();
  resultdiv.append('<p class="">Found '+result.length+' result(s)</p>');
  //Loop through, match, and add results
  for (var item in result) {
	var ref = result[item].ref;
    var searchitem = '<div class="result"><p><a href="{{ site.baseurl }}'+store[ref].link+'">'+store[ref].title+'</a> by '+store[ref].author+'</p></div>';
    resultdiv.append(searchitem);
   }
  });
});

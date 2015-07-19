function Issue(title,labels,created,comments){
  this.title = title;
  this.labels = labels;
  this.created = created;
  this.comments = comments;
}

Issue.prototype.labelNames = function(){
  var labelnames = []
  for(var i = 0; i < this.labels.length; i++) {
    labelnames.push(this.labels[i].name)
  }
  return labelnames.join(" ")
}

Issue.prototype.getHTML = function(){
  return ["<p>" + this.title + "</p>",
   "<p>Created:  " + this.created + "</p>",
   "<p>Comments: " + this.comments + "</p>",
   "<p>Labels: " + this.labelNames() + "</p>"
  ].join(",")
}
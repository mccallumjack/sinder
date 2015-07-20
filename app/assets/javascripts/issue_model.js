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
  return ["<table class='hoverable'><tr><td><strong>Issue:</strong> " + this.title + "</td>" +
   "<td><span class='right'><strong>Created:</strong>  " + new Date(this.created).toDateString() + "</span></td></tr>" +
   "<tr><td>" + this.labelNames() + "</td>" +
   "<td><span class='right'><strong>Comments:</strong> " + this.comments + "</span></td></tr></table>"
  ].join("")
}

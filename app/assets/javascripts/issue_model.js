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
  return ["<tr><td>" + this.title + "</td>",
   "<td>Created:  " + this.created + "</td></tr>",
   "<tr><td>Labels: " + this.labelNames() + "</td>",
   "<td>Comments: " + this.comments + "</td></tr></table>"
  ].join(",")
}
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
  return ["<li><div class='collapsible-header'>Title: " + this.title + "</div>" +
   "<div class='collapsible-body'><p>Created: " + new Date(this.created).toDateString() + "<br>" + "Comments: " + this.comments + "</p>" +
   "<a class='display-in-line float-right'>" + this.labelNames() + "</a></div>" + "</li>"].join("")
}

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
  return ["<li>" +
            "<div class='collapsible-header thin bold400 repo-header-color'>" + this.title + "</div>" +
              "<div class='collapsible-body thin bold400 grey lighten-2'>" +
                "<div class='display-in-line width70'>" +
                  "<p>Created: " + new Date(this.created).toDateString() + "<br>" + "Comments: " + this.comments + "</p>" +
                "</div>" +
                "<div class='valign-wrapper float-right'>" +
                  "<div class='small-top-margin valign'>" + "<p>" + this.labelNames() + "</p>" +
                  "</div>" +
                "</div>" +
              "</div>" +
          "</li>"].join("")
}

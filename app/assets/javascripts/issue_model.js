function Issue(title,labels,created,comments){
  this.title = title;
  this.labels = labels;
  this.created = created;
  this.comments = comments;
}

Issue.prototype.labelNames = function(){
  var labelnames = []
  for(var i = 0; i < this.labels.length; i++) {
    var label = this.labels[i]
    var labelHTML = "<span class='label thin' style='background-color:#" + label.color + ";color:" + getContrastYIQ(label.color) + ";'>" + label.name + "</span>"
    labelnames.push(labelHTML)
  }
  return labelnames.join(" ")
}

Issue.prototype.getHTML = function(){
  return ["<li>" +
            "<div class='collapsible-header thin bold400 repo-header-color lighten-2'>" +
              "<i class='material-icons'>code</i>" +
              this.title +
            "</div>" +
              "<div class='collapsible-body thin bold400 grey lighten-2'>" +
                "<div class='display-in-line width68'>" +
                  "<p>Created: " + new Date(this.created).toDateString() + "<br>" + "Comments: " + this.comments + "</p>" +
                "</div>" +
                "<div class='valign-wrapper float-right'>" +
                  "<div class='small-top-margin valign'>" + "<p>" + this.labelNames() + "</p>" +
                  "</div>" +
                "</div>" +
              "</div>" +
          "</li>"].join("")
}


// This function is used in our labels to apply white text to dark backgrounds and black text to light backgrounds
function getContrastYIQ(hexcolor){
    var r = parseInt(hexcolor.substr(0,2),16);
    var g = parseInt(hexcolor.substr(2,2),16);
    var b = parseInt(hexcolor.substr(4,2),16);
    var yiq = ((r*299)+(g*587)+(b*114))/1000;
    return (yiq >= 128) ? 'black' : 'white';
}

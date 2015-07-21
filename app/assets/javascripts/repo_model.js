function Repo(json){

  this.issues = []

    for(var key in json) {
      if(json.hasOwnProperty(key)) {
          this[key] = json[key];
      }
  }
}

Repo.prototype.renderIssues = function() {
  for(var i = 0; i < 3; i++) {
    if(typeof this.issues[i] === 'undefined') { break; }
    $("#issue-list").append(this.issues[i].getHTML())
  };
   $('.collapsible').collapsible({
      accordion : true
    });
  }

Repo.prototype.getIssues = function() {

  var that = this
  var path = this.full_name
  var url = "/api/repos/" + this.id + "/issues"

  var request = $.get(url, function() {})
    .done(function(data) {
      for(var i = 0; i < data.length; i++){
        var issue = data[i]
        if (issue.state === "open"){
        that.issues.push(new Issue(issue.title,issue.labels,issue.created_at,issue.comments))
        }
      }
    })
}




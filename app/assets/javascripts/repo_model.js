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
  }
}

Repo.prototype.getIssues = function() {

  var that = this
  var path = this.full_name
  var url = "https://api.github.com/repos/" + path + "/issues" + "?client_id=2e640df7f1e180d20e7d&client_secret=6be16036813ab080278b706b1dd7558d92fa1d14"

  var request = $.get(url, function() {})
    .done(function(data) {
      for(var i = 0; i < data.length; i++){
        var issue = data[i]
        // Don't add the issue if it isn't open
        if (issue.state != "open") { continue; }
        that.issues.push(new Issue(issue.title,issue.labels,issue.created_at,issue.comments))
      }
        that.renderIssues();
    })
}




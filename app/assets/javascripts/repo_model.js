function Repo(json){

  this.issues = []

  for(var key in json) {
    if(json.hasOwnProperty(key)) {
        this[key] = json[key];
    }
  }
}

Repo.prototype.contributorIcon = function(){
  if (this.contributors_file){
    var contributorIconTrue = {
      icon: "thumb_up",
      color: "yellow"
    }
    return "thumb_up";
  } else {
    return "error_outline";
  };
}

Repo.prototype.codeOfConductIcon = function(){
  if (this.code_of_conduct){
    return "stars";
  } else {
    return "error_outline";
  };
}

Repo.prototype.pushedAt = function() {
  return new Date(this.pushed_at).toDateString();
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




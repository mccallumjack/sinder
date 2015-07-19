function Repo(json){

  this.issues = []

    for(var key in json) {
      if(json.hasOwnProperty(key)) {
          this[key] = json[key];
      }
  }
}

Repo.prototype.getIssues = function() {
  var that = this
  var path = this.full_name
  var url = "https://api.github.com/repos/" + path + "/issues"
  var request = $.get(url, function() {})
    .done(function(data) {
      that.issues = data
      console.log(that.issues)
    })
}


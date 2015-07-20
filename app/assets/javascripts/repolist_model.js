function RepoList() {
  this.repos = []
  this.languages = []
}

RepoList.prototype.reloadByLanguage = function(language,controller) {
  var that = this
  that.repos = []
  var request = that.repoRequest(language)
    .done(function(data) {
      var repos = data
      for(var i = 0; i<repos.length;i++){
        var repo = new Repo(repos[i])
        that.repos.push(repo)
    }
    controller.loadNext()
  })
}

RepoList.prototype.getRepos = function(user) {
  var that = this
  var request = that.repoRequest()
    .done(function(data) {
      var repos = data
      for(var i = 0; i<repos.length;i++){
        var repo = new Repo(repos[i])
        that.repos.push(repo)
    }
  })
}

RepoList.prototype.repoRequest = function(language) {
  if(typeof language === "undefined"){
    return $.get("/api/repos", function() {})
  } else {
    return $.get("api/repos?language=" + language, function(){})
  }
}
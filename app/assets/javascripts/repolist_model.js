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
      if (repos == null) {
        $('#modal1').openModal();
      } else {
        for(var i = 0; i<repos.length;i++){
          var repo = new Repo(repos[i])
          that.repos.push(repo)
        }
      }
      // Preload the first repo's issues
      that.repos[0].getIssues()
      // Wait 1.5 seconds for issues to come in then display
      setTimeout(function(){ controller.loadNext()},1200)
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
      // Preload the first repo's issues
      that.repos[0].getIssues()
    })
}

RepoList.prototype.repoRequest = function(language) {
  if(typeof language === "undefined"){
    return $.get("/api/repos", function() {})
  } else {
    return $.get("api/repos?language=" + language, function(){})
  }
}

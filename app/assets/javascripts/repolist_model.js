function RepoList() {
  this.repos = []
  this.languages = []
}

RepoList.prototype.reloadByLanguage = function(language,controller) {
  var that = this
  that.repos = []
  var request = $.get( "http://sinder.herokuapp.com/api/repos?language=" + language, function() {})
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
  var request = $.get( "http://sinder.herokuapp.com/api/repos", function() {})
    .done(function(data) {
      var repos = data
      for(var i = 0; i<repos.length;i++){
        var repo = new Repo(repos[i])
        that.repos.push(repo)
    }
  })
}


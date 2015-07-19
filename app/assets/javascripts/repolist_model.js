function RepoList() {
  this.repos = []
  this.languages = []
}

RepoList.prototype.filterByLanguage = function(language) {

}

RepoList.prototype.getRepos = function(user) {
  var that = this
  var request = $.get( "http://localhost:3000/api/repos", function() {})
    .done(function(data) {
      var repos = data
      for(var i = 0; i<repos.length;i++){
        var repo = new Repo(repos[i])
        that.repos.push(repo)
    }
  })
}


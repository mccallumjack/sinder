function RepoList() {
  this.repos = []
  this.languages = []
}

RepoList.prototype.filterByLanguage = function(languages) {

}

RepoList.prototype.getRepos = function(user) {
  var that = this
  var request = $.get( "http://localhost:3000/api/repos", function() {})
    .done(function(data) {
      that.repos = data
    })
}

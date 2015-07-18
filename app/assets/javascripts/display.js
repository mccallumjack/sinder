$(function(){

  repoController = new RepoController
  repoController.load()
  repoController.loadNext()

})



// RepoList Model


function RepoList() {
  this.repos = []
  this.languages = []
}

RepoList.prototype.filterByLanguage = function(languages) {
  return 
}

RepoList.prototype.getRepos = function(user) {
  var that = this
  var request = $.get( "http://localhost:3000/api/repos", function() {})
    .done(function(data) {
      that.repos = data
    })
}


// RepoList View

function RepoView() {
  this.container = $('#repo-container')
  this.title = $('#repo-title')
  this.description = $('#repo-description')
}

// RepoList Controller

function RepoController() {

  this.view = new RepoView()
  this.repolist = new RepoList()

  // Loads the Repos From the Server
  this.load = function(){
    this.repolist.getRepos()
  }
}

RepoController.prototype.renderRepo = function(repo){
  this.view.$title.html(repo.title)
  this.view.$description.html(repo.description)
}

RepoController.prototype.loadNext = function(){
  var repo = this.repolist.repos.shift()
  this.renderRepo(repo)
}

RepoController.prototype.bindEvents = function(){

}




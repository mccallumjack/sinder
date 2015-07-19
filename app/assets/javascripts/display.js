$(function(){

  // Initiate and load controller
  repoController = new RepoController
  repoController.load()
  repoController.bindEvents();

  //Serve up first repo when ajax is done
  // $(document).ajaxStop(repoController.loadNext.bind(repoController))

})

function RepoView() {
  this.container = $('#repo-container')
  this.title = $('#repo-title')
  this.description = $('#repo-description')
  this.language = $('#repo-language')
  this.stars = $('#repo-stars')
  this.forks = $('#repo-forks')
}


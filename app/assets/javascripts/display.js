$(function(){

  // Initiate and load controller
  repoController = new RepoController
  repoController.load()
  repoController.bindEvents();

  //Serve up first repo when ajax is done
  // $(document).ajaxStop(repoController.loadNext.bind(repoController))

})



// RepoList View

function RepoView() {
  this.container = $('#repo-container')
  this.title = $('#repo-title')
  this.fullName = $('#repo-full-name')
  this.description = $('#repo-description')
  this.language = $('#repo-language')
  this.stars = $('#repo-stars')
  this.forks = $('#repo-forks')
  this.contributorsCount = $('#contributors-count')
  this.codeOfConduct = $('#code-of-conduct-icon')
  this.contributorFile = $('#contributors-file')
  this.contributorsPercent = $('#contributors-percent')
  this.pullrequestPercent = $('#pull-request-percent')
}

// RepoList Controller

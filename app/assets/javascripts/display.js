$(function(){

  // Initiate and load controller
  repoController = new RepoController
  repoController.load()
  repoController.bindEvents();

  //Serve up first repo when ajax is done
  // $(document).ajaxStop(repoController.loadNext.bind(repoController))

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
  this.language = $('#repo-language')
  this.stars = $('#repo-stars')
  this.forks = $('#repo-forks')
}

// RepoList Controller

function RepoController() {

  this.view = new RepoView()
  this.repolist = new RepoList()

}

RepoController.prototype.load = function() {
  this.repolist.getRepos()
}

RepoController.prototype.renderRepo = function(repo){
  $(this.view.title).html(repo.url)
  $(this.view.description).html(repo.description)
}

RepoController.prototype.loadNext = function(){
  var repo = this.repolist.repos.shift()
  this.renderRepo(repo)
}

RepoController.prototype.bindEvents = function(){

  $('#lang-nav li').on('click', 'a', function(e){
      e.preventDefault();
      var lang = $(this).text();
  });

  // posting the upvotes
  $('#star').on('click', function(e){
    e.preventDefault();
    var statusUpdate = {'repo_full_name': $('#repo-title').text()}
    $.ajax({
      url: '/star',
      method: 'POST',
      dataType: 'json',
      data: statusUpdate


    });

  });

  // posting the downvotes
  $('#hide').on('click', function(e){
    e.preventDefault();
    var statusUpdate = {'repo_full_name': $('#repo-title').text()}
    $.ajax({
      url: '/hide',
      method: 'POST',
      dataType: 'json',
      data: statusUpdate
    });
  });

  $('button').on('click', this.loadNext.bind(repoController))


}


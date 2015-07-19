function RepoController() {

  this.view = new RepoView()
  this.repolist = new RepoList()

}

RepoController.prototype.load = function() {
  this.repolist.getRepos()
}

RepoController.prototype.renderRepo = function(repo){
  $(this.view.title).html(repo.name)
  $(this.view.description).html(repo.description)
  $(this.view.language).html(repo.language)
  $(this.view.stars).html(repo.stargazers_count)
  $(this.view.forks).html(repo.forks_count)
}

RepoController.prototype.loadNext = function(){
  $("#issue-list").empty()
  var repo = this.repolist.repos.shift()
  this.renderRepo(repo);
  repo.getIssues()
}

RepoController.prototype.bindEvents = function(){

  var that = this

  $('#lang-nav li').on('click', 'a', function(e){
      e.preventDefault();
      var lang = $(this).text().toLowerCase();
      that.repolist.reloadByLanguage(lang,that)
  });

  // // posting the upvotes
  // $('#star').on('click', function(e){
  //   e.preventDefault();
  //   var url = $(this).attr('href');
  //   $.ajax({
  //     url: url,
  //     method: 'POST'
  //   });

  // });

  // // posting the downvotes
  // $('#hide').on('click', function(e){
  //   e.preventDefault();
  //   var url = $(this).attr('href');
  //   $.ajax({
  //     url: url,
  //     method: 'POST'
  //   });
  // });

  $('button').on('click', this.loadNext.bind(repoController))


}






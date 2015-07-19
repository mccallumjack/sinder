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
}

RepoController.prototype.loadNext = function(){
  var repo = this.repolist.repos.shift()
  this.renderRepo(repo);
  // repo.getIssues();
  // repo.renderIssues();
}

RepoController.prototype.bindEvents = function(){

  // $('#lang-nav li').on('click', 'a', function(e){
  //     e.preventDefault();
  //     var lang = $(this).text();
  // });

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






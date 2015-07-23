function RepoController() {

  this.view = new RepoView()
  this.repolist = new RepoList()

}

RepoController.prototype.load = function() {
  this.repolist.getRepos()
}

RepoController.prototype.renderRepo = function(repo){
  $(this.view.title).html(repo.name)
  $(this.view.title).attr('href',repo.html_url)
  $(this.view.fullName).html(repo.full_name)
  $(this.view.description).html(repo.description)
  $(this.view.language).html(repo.language)
  $(this.view.stars).html(repo.stargazers_count )
  $(this.view.forks).html(repo.forks_count)
  $(this.view.contributorsCount).html(repo.contributors_count)
  $(this.view.contributorFile).text(repo.contributorIcon())

  $(this.view.codeOfConduct).text(repo.codeOfConductIcon())
  $(this.view.contributorsPercent).html((repo.contributors_count *100 / repo.stargazers_count).toFixed(2) +"%")
  $(this.view.pullrequestPercent).html((repo.pull_request_count *100 / repo.open_issues_count).toFixed(2) +"%")
}

RepoController.prototype.loadNext = function(){
  $("#issue-list").empty()
  var repo = this.repolist.repos.shift()
  if (repo == null) {
    $('#modal1').openModal();
    return;
  }
  var nextRepo = this.repolist.repos[0]
  this.renderRepo(repo);
  repo.issues.length > 0 ? repo.renderIssues() : ""
  //Preload the next repo's issues so they are ready by the time the user clicks
  nextRepo.getIssues()
}

RepoController.prototype.bindEvents = function(){

  var that = this

  $('#repo-language').on('click',function(e){
    e.preventDefault();
    var lang = $(this).text().toLowerCase();
    $('#lang-nav li').removeClass('active')
    $('#' + lang).addClass('active')
    that.repolist.reloadByLanguage(lang,that)
  });

// binding to the top language menu
  $('#lang-nav li').on('click', 'a', function(e){
      e.preventDefault();
      $('#lang-nav li').removeClass('active')
      $(e.target).parent('li').addClass('active')
      var lang = $(this).text().toLowerCase();
      that.repolist.reloadByLanguage(lang,that)
  });

// binding to the side language menu
  $('#nav-mobile li').on('click', 'a', function(e){
      e.preventDefault();
      var lang = $(this).text().toLowerCase();
      that.repolist.reloadByLanguage(lang,that)
  });

  // posting the upvotes
  $('#star').on('click', function(e){
    e.preventDefault();
    var statusUpdate = {'repo_full_name': $('#repo-full-name').text()}
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
    var statusUpdate = {'repo_full_name': $('#repo-full-name').text()}
    $.ajax({
      url: '/hide',
      method: 'POST',
      dataType: 'json',
      data: statusUpdate
    });
  });


  $('#display-buttons button').on('click', this.loadNext.bind(repoController))
  $('#display-buttons button').on('click', this.toggleTimeout(this))

}

RepoController.prototype.toggleTimeout = function(controller) {

  return function(event){
    var that = event.target
    $(that).addClass('disabled');
    $(that).off();

    setTimeout(function(){
      $(that).removeClass('disabled');
      $(that).on('click', controller.loadNext.bind(controller));
      $(that).on('click', controller.toggleTimeout(controller));

      if($(that).is('#hide')){
        $(that).on('click', function(e){
          e.preventDefault();
          var statusUpdate = {'repo_full_name': $('#repo-full-name').text()}
          $.ajax({
            url: '/hide',
            method: 'POST',
            dataType: 'json',
            data: statusUpdate
          });
        });
        } else if($(that).is('#star')){
          $(that).on('click', function(e){
            e.preventDefault();
            var statusUpdate = {'repo_full_name': $('#repo-full-name').text()}
            $.ajax({
              url: '/star',
              method: 'POST',
              dataType: 'json',
              data: statusUpdate
            });
          });
        }
    }, 1500)
  }

}




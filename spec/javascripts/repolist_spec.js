describe("RepoList",function() {

  var repoList;
  var repo

  beforeEach(function() {
    repoList = new RepoList();
  });


  it("should have a list of repos that is empty", function(){
    expect(repoList.repos.length).toEqual(0);
  });

  it("should have a list of languages that is empty", function(){
    expect(repoList.languages.length).toEqual(0);
  });


})




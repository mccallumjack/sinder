describe("RepoList",function() {

  var repoList;

  beforeEach(function() {
    repoList = new RepoList();
  });

  

  it("should have a list of repos that is empty", function(){
    expect(repoList.repos.length).toEqual(0);
  });

  it("should have a list of languages that is empty", function(){
    expect(repoList.languages.length).toEqual(0);
  });

  describe("after being loaded", function() {
    beforeEach(function() {
      repoList.getRepos()
    });

    it("should have a list greater than 0", function() {
      expect(repoList.repos.length > 0).toBeTruthy();      
    })

  })


})





  // it("should be able to play a Song", function() {
  //   player.play(song);
  //   expect(player.currentlyPlayingSong).toEqual(song);

  //   //demonstrates use of custom matcher
  //   expect(player).toBePlaying(song);
  // });

  // describe("when song has been paused", function() {
  //   beforeEach(function() {
  //     player.play(song);
  //     player.pause();
  //   });

  //   it("should indicate that the song is currently paused", function() {
  //     expect(player.isPlaying).toBeFalsy();

  //     // demonstrates use of 'not' with a custom matcher
  //     expect(player).not.toBePlaying(song);
  //   });
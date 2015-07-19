function Repo(json){
    for(var key in json) {
      if(json.hasOwnProperty(key)) {
          this[key] = json[key];
      }
  }
}

Repo.prototype.render = function() {
  
}

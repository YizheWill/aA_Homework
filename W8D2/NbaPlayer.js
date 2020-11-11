function NBAPlayer(name, team, pos) {
  this.name = name;
  this.team = team;
  this.pos = pos;
  dunk = function (word) {
    console.log("fuck", word);
  };
}

const curry = new NBAPlayer("Curry", "SF", "Pointer Guard");

NBAPlayer.prototype.dunk = function (word) {
  console.log(word);
};
// curry.pos;
// console.log("curry", curry.name, curry.team, curry.pos);

const titleize = (array, cb) => {
  array = array.map((el) => `Mx. ${el} Jingleheimer Schmidt`);
  array.forEach((el) => {
    cb(el);
  });
};
const printCallback = (e) => console.log(e);
titleize(['Mary', 'Brian', 'Leo'], printCallback);

class Elephant {
  constructor(name, height) {
    this.name = name;
    this.height = height;
    this.tricks = [];
  }
  trumpet() {
    console.log(this.name, 'the elephat goes', "'phrRRRRRRRRRR!!!!!!!!'");
  }
  grow() {
    this.height += 12;
  }
  addTrick(trick) {
    this.tricks.push(trick);
  }
  play() {
    return this.tricks[Math.ceil(Math.random() * this.tricks.length) - 1];
  }
}
Elephant.paradeHelper = (elephant) =>
  console.log(`${elephant.name} is trotting by!`);

let ellie = new Elephant('Ellie', 185, [
  'giving human friends a ride',
  'playing hide and seek',
]);
let charlie = new Elephant('Charlie', 200, [
  'painting pictures',
  'spraying water for a slip and slide',
]);
let kate = new Elephant('Kate', 234, ['writing letters', 'stealing peanuts']);
let micah = new Elephant('Micah', 143, [
  'trotting',
  'playing tic tac toe',
  'doing elephant ballet',
]);

let herd = [ellie, charlie, kate, micah];

herd.forEach(Elephant.paradeHelper);

const dinerBreakfast = (food) => {
  let foods = ['cheesy scrambled eggs'];
  // if (foods == ['cheesy scrambled eggs'])
  console.log(`I'd like ${foods.toString()} please.`);
  return (food) => {
    foods.push(food);
    console.log(`I'd like ${foods.map((el) => `${el}`).join(' and ')} please.`);
  };
};
let bfastOrder = dinerBreakfast();
// ("I'd like cheesy scrambled eggs please");
bfastOrder('chocolate chip pancakes');
// ("I'd like cheesy scrambled eggs and chocolate chip pancakes please.");
bfastOrder('grits');
// ("I'd like cheesy scrambled eggs and chocolate chip pancakes and grits please.");

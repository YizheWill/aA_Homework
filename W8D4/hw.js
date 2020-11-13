// window.setTimeout(() => alert('Hammertime'), 5000);

// const hammerTime = (time) => {
//   window.setTimeout(() => {
//     console.log(`${time} is hammertime!`);
//   }, time);
// };
// hammerTime(5000);

// const readline = require('readline');

// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout,
// });

// reader.question('Want some tea?', (first) => {
//   firstRes = first;
//   reader.question('Some Biscuit?', (second) => {
//     const firstRes = first === 'yes' ? 'do' : "don't";
//     const secondRes = second === 'yes' ? 'do' : "don't";
//     console.log(
//       `So you ${firstRes} want tea and you ${secondRes} want biscuits.`
//     );
//     reader.close();
//   });
// });

function Cat() {
  this.name = 'Markov';
  this.age = 3;
}

function Dog() {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`);
};

const Markov = new Cat();
const Noodles = new Dog();

Dog.prototype.chase.apply(Noodles, [Markov]);
Noodles.chase(Markov);
Dog.prototype.chase.call(Noodles, Markov);
Dog.prototype.chase.call(Markov, Noodles);

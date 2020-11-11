// const readline = require('readline');

// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout,
// });

// function addNumbers(sum, numsLeft, completionCallback) {}
// addNumbers(0, 3, function (sum) {
//   console.log('Total Sum', sum);
//   reader.close();
// });
let array = [1, 2, 3];
array.map((val, index) => val * index);

for (let i = 0; i < array.length; i++) {
  const element = array[i];
  console.log('array[i]', array[i]);
}

class Kitty {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  func(name) {
    console.log(name);
  }
  anotherFunc(something) {
    switch (something) {
      case 1:
        console.log('it is one');
        break;
      case 2:
        console.log('it is two');
        break;
      default:
        console.log('it is something else');
        break;
    }
  }
}

k = new Kitty('kat', 3);
k.func;
k.anotherFunc('2');
let app = 'apple';
console.log(this);
console.log(app);

console.log('abc' + 'bcd');
console.log();

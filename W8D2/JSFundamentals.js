// function mysteryScoping1() {
//   var x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }

// function mysteryScoping2() {
//   const x = 'out of block';
//   if (true) {
//     const x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }

// function mysteryScoping3() {
//   const x = 'out of block';
//   if (true) {
//     const x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }

// function mysteryScoping4() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }

// function mysteryScoping5() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   x = 'out of block again';
//   console.log(x);
// }
// console.log(mysteryScoping1());
// console.log('---------------');
// console.log(mysteryScoping2());
// console.log('---------------');
// console.log(mysteryScoping3());
// console.log('---------------');
// console.log(mysteryScoping4());
// console.log('---------------');
// console.log(mysteryScoping5());

const madLib = (a, b, c) =>
  console.log(
    `we shall ${a.toUpperCase()} the ${b.toUpperCase()} ${c.toUpperCase()}`
  );
const isSubstring = (searchString, subString) =>
  searchString.indexOf(subString) >= 0;

const fizzBuzz = (arr) => {
  arr.forEach((element) => {
    if ((element % 3 === 0 || element % 5 === 0) && element % 15 !== 0)
      console.log(element);
  });
};

const inclusive_range = (startPoint, endPoint) => {
  return [...Array(endPoint - startPoint + 1).keys()].map(
    (idx) => idx + startPoint
  );
};
const exclusive_range = (startPoint, endPoint) => {
  return [...Array(endPoint - startPoint).keys()].map(
    (idx) => idx + startPoint
  );
};

const isPrime = (number) =>
  number >= 2 && !exclusive_range(2, number).some((el) => number % el === 0);

const somOfPrimes = (counter) => {
  let sum = 0;
};

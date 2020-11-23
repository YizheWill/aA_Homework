import React, { useState } from 'react';
import Number from './Number';
import Button from './Button';

export default function Frame() {
  const numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  const operators = ['+', '-', '*', '/', '%'];
  const [currentOp, setCurrentOp] = useState('+');
  const [result, setResult] = useState(0);
  const [operand1, setOperand1] = useState(0);
  const [operand2, setOperand2] = useState(0);
  const [op1, setOp1] = useState(true);
  const incOp1 = (number) => {
    if (operand1 === 0) {
      setOperand1(number);
    } else {
      setOperand1(operand1 * 10 + number);
    }
  };
  const incOp2 = (number) => {
    if (operand2 === 0) {
      setOperand2(number);
    } else {
      setOperand2(operand2 * 10 + number);
    }
  };
  const startOp2 = () => {
    setOp1(false);
  };
  const cal = (operator) => {
    switch (operator) {
      case '+':
        setResult(operand1 + operand2);
        reset();
        break;
      case '-':
        setResult(operand1 - operand2);
        reset();
        break;
      case '*':
        setResult(operand1 * operand2);
        reset();
        break;
      case '/':
        setResult(operand1 / operand2);
        reset();
        break;
      case '%':
        setResult(operand1 % operand2);
        reset();
        break;
      default:
        return false;
    }
  };
  const reset = () => {
    setOp1(true);
    setOperand1(0);
    setOperand2(0);
  };
  console.log(op1);
  {
    if (op1 === undefined) {
      return <div>loading...</div>;
    } else {
      return (
        <div>
          <h1>Result: {result}</h1>
          <h3>Operand 1: {operand1} </h3>
          <h3>Operand 2: {operand2} </h3>
          {numbers.map((el, idx) => (
            <Number key={idx} op1={op1} number={el} incOp1={incOp1} incOp2={incOp2} />
          ))}

          {operators.map((el, idx) => (
            <Button
              key={idx}
              operator={el}
              setCurrentOp={setCurrentOp}
              startOp2={startOp2}
            />
          ))}
          <button onClick={() => cal(currentOp)}>=</button>
        </div>
      );
    }
  }
}

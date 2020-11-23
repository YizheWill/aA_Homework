import React, { Component } from 'react';

export default class ClickButton extends Component {
  constructor(props) {
    super(props);
    this.state = { counter: 0 };
  }
  handleInc() {
    this.setState({ counter: this.state.counter + 1 });
  }

  handleDec() {
    this.setState({ counter: this.state.counter - 1 });
  }

  handleReset() {
    this.setState({ counter: 0 });
  }

  render() {
    return (
      <div>
        <h1>{this.state.counter}</h1>
        <button onClick={() => this.handleInc()}> inc </button>
        <button onClick={() => this.handleDec()}> dec </button>
        <button onClick={() => this.handleReset()}> reset </button>
      </div>
    );
  }
}

import React, { useState } from 'react';
import Counts from './counts';

export default function ClickButton() {
  const [counter, setCounter] = useState(0);
  const [counterArray, setCounterArray] = useState([0]);
  const inc = () => {
    setCounter(1 + counter);
  };
  const dec = () => {
    setCounter(counter - 1);
  };
  const reset = () => {
    setCounterArray(counterArray.concat(counter));
    setCounter(0);
  };
  const deleteElement = (idx) => {
    let arr = counterArray;
    arr.splice(idx, 1);
    setCounterArray([...arr]);
    // don't know why, it just works
  };
  return (
    <div>
      <h1>{counter}</h1>
      <button onClick={() => inc()}>INC</button>
      <button onClick={() => dec()}>DEC</button>
      <button onClick={() => reset()}>RESET</button>
      <Counts props={{ counterArray, deleteElement }} />
    </div>
  );
}

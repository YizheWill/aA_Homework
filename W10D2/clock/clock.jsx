import React, { Component } from 'react';

export class Clock extends Component {
  constructor(props) {
    super(props);
    let date = new Date();
    this.state = {
      date,
    };
    this.tick.bind(this);
  }
  tick() {
    let date = new Date();
    this.setState({ date: date });
  }
  componentDidMount() {
    setInterval(() => {
      this.tick();
    }, 1000);
  }

  render() {
    return (
      <div>
        <h1>Time: {this.state.date.toString()}</h1>
      </div>
    );
  }
}

export default Clock;

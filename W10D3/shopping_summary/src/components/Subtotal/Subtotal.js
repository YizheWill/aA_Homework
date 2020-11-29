import React, { Component } from 'react';
import { Row, Col } from 'react-bootstrap';

export default class SubTotal extends Component {
  constructor(props) {
    super(props);
    //this.state = {};
  }
  render() {
    return (
      <div>
        <Row>
          <Col md={6}>Subtotal</Col>
          <Col md={6}>{`$${this.props.price}`}</Col>
          <Col md={6}></Col>
        </Row>
      </div>
    );
  }
}

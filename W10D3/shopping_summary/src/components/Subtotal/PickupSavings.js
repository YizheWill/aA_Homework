import React, { Component } from 'react';
import { Row, Col, Tooltip, OverlayTrigger } from 'react-bootstrap';

var styles = {
  pickupSavings: {
    textDecoration: 'underlined',
  },
};

export default class className extends Component {
  constructor(props) {
    super(props);
    // this.state = {};
  }
  render() {
    <Tooltip id='tooltip'>
      <p>Go to the store and pick it up saves money for both you and me</p>
    </Tooltip>;
    return (
      <Row>
        <Col md={6}>
          <OverlayTrigger placement='bottom' overlay={tooltip}>
            <div></div>
          </OverlayTrigger>
        </Col>
      </Row>
    );
  }
}

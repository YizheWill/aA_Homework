import React from 'react';

export default function Button({ operator, startOp2, setCurrentOp }) {
  const setup = () => {
    startOp2();
    setCurrentOp(operator);
  };
  return <button onClick={() => setup()}>{operator}</button>;
}

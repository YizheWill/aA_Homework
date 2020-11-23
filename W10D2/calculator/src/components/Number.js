import React from 'react';

export default function Number({ op1, number, incOp1, incOp2 }) {
  console.log(op1);
  return (
    <div>
      <button
        onClick={() => {
          if (op1) {
            incOp1(number);
          } else {
            incOp2(number);
          }
        }}
      >
        {number}
      </button>
    </div>
  );
}

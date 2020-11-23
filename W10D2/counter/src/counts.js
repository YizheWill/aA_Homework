import React from 'react';

export default function Count({ props }) {
  const { counterArray, deleteElement } = props;

  return (
    <ul>
      {counterArray.map((el, idx) => (
        <li key={idx} onClick={() => deleteElement(idx)}>
          {el}
        </li>
      ))}
    </ul>
  );
}

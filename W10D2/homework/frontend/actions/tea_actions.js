export const RECEIVE_TEA = 'RECEIVE_TEA';

// export const receiveTea = {
//   type: RECEIVE_TEA,
//   tea: {
//     flavor: 'hoji cha',
//     amount: 5,
//     id: 1,
//   },
// };

export const receiveTea = (tea) => ({
  type: RECEIVE_TEA,
  tea,
});

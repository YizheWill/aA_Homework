import { RECEIVE_TEA } from '../actions/tea_actions';
const _initState = {};

const teasReducer = (state = _initState, action) => {
  let nextState = Object.assign({}, state);
  switch (action.type) {
    case RECEIVE_TEA:
      nextState[action.tea.id] = action.tea;
      return nextState;
    default:
      return currentState;
  }
};
export default teasReducer;

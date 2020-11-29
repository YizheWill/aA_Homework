import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
const preloadedState = { name: 'will' };
// preloaded state,
const preloadedState = {};
const enhancersLikeMiddleWare = () => {};

const configureStore = (preloadedState = {}) => {
  return createStore(rootReducer, preloadedState);
};

export default store = createStore(reducer, preloadedState, enhancersLikeMiddleWare);

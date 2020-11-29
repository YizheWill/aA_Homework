import { combineReducers } from 'redux';
import teasReducer from './tea_reducer';

const rootReducer = combineReducer({
  teas: teasReducer, //teas slice of the state, managed by teareducer
  cookies: () => ({}),
  biscuites: () => ({}),
});

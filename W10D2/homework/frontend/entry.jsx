import React from 'react';
import ReactDOM from 'react-dom';
import store from './store/store';
// import App from './app';

document.addEventListener('DOMContentLoaded', () => {
  window.store = store;
  ReactDOM.render(<h1>Who</h1>, document.getElementById('root'));
});

import React, {Component} from 'react';
import Contents from './Contents';
import './App.css';


class App extends Component {
  render() {
    return (
      <div className="App">
        <h1>찢어진 바지</h1>
        <h2>By 스펀지 밥</h2>
        <Contents />
      </div>
    );
  }
}

export default App;

import React, {Component} from 'react';
import Subject from './components/Subject';
import Contents from './components/Contents';
import MainButton from './components/MainButton';
import './App.css';


class App extends Component {

  constructor(props) {
    super(props);
    this.state = {
      mode: 'welcome',
      subject: {title: "찢어진 바지",author: "스폰지밥"},
      friends: [
        {id:1, name: '징징이'},
        {id:2, name: '다람이'},
        {id:3, name: '뚱이'}
      ]
    }
  }
  render() {
    return (
      <div className="App">
        <Subject title={this.state.subject.title} author={this.state.subject.author}></Subject>
        <Contents mode={this.state.mode} friends={this.state.friends}></Contents>
        <MainButton></MainButton>
      </div>
    );
  }
}

export default App;

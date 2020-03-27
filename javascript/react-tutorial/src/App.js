import React, {Component} from 'react';
import Subject from './components/Subject';
import Contents from './components/Contents';
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
    const buttonText= "여기를 눌러 시작하세요";
    return (
      <div className="App">
        <Subject title={this.state.subject.title} author={this.state.subject.author}></Subject>
        <Contents mode={this.state.mode} friends={this.state.friends}></Contents>
        <button onClick={function(e) {
          debugger;
          e.preventDefault();
          this.setState({mode: 'start'});
        }.bind(this)}>{buttonText}</button>
      </div>
    );
  }
}

export default App;

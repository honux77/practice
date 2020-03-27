import React, {Component} from 'react';

class MainButton extends Component {
    constructor(props) {
        super(props);
        this.state = {
            text: "눌러서 시작하세요!"
        }
    }
    render() {
        return (
        <button type="button" onclick="alert('Hello world!')">{this.state.text}</button>
        )
    }
}

export default MainButton;
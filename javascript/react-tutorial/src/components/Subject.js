import React, { Component } from 'react'

class Subject extends Component {
    render() {
        return (
            <header>
            <h1>리액트로 놀아보자</h1>
            <h2>{this.props.title} by {this.props.author}</h2>
            </header>
        )
    }
}

export default Subject;
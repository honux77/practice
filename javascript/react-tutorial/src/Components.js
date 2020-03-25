import React, { Component } from 'react'

class Subject extends Component {
    render() {
        return (
            <header>
            <h1>리액트로 놀아보자.</h1>
            <h2>찢어진 바지 by 스폰지밥</h2>
            </header>
        )
    }
}

class Article extends Component {
    render() {
        return (
        <article>   
            <p>내 바지가 찢어졌을 때, 모두가 날 좋아한다고 생각했어.</p>
            <p>그런 짓은 하지 말아야 했는데, 난 그 사실을 몰랐어</p>
        </article>
        )
    }
}

export {
    Subject,
    Article
} 

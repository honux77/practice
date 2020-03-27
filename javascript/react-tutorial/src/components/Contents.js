import React, { Component } from 'react';

class Contents extends Component {
    constructor(props) {
        super(props);
        this.state = {
            people: this.props.people
        }
    }
    render() {
        const people = this.state.people;
        const items = people.map(e => (<li key={e.id}>{e.name}</li>));
        return (
        <article>   
            <p>내 바지가 찢어졌을 때, 모두가 날 좋아한다고 생각했어.</p>
            <p>그런 짓은 하지 말아야 했는데, 난 그 사실을 몰랐어.</p>
            <h3>사라진 친구들</h3>
            <ul>
                {items}
            </ul>
        </article>
        )
    }
}

export default Contents;
import React, { Component } from 'react';
import welcome from  '../welcome.png';

class Contents extends Component {
    constructor(props) {
        super(props);
        this.state = {
            mode: this.props.mode,
            friends: this.props.friends
        }
    }
    render() {
        const friends = this.state.friends.map(e => (<li key={e.id}>{e.name}</li>));
        const song = (
            <article>
            <p>내 바지가 찢어졌을 때, 모두가 날 좋아한다고 생각했어.</p>
            <p>그런 짓은 하지 말아야 했는데, 난 그 사실을 몰랐어.</p>
            </article>
        );
        switch(this.state.mode) {
            case "welcome":
                return (
                    <article>
                        <img width='600' src={welcome} alt="Welcom Sponge Bob"/>
                    </article>
                )
            case "bad":
                return song;
            default:
                return (
                    <article>
                        <h2>스폰지 밥의 친구들</h2>
                        <ul>
                        {friends}
                        </ul>
                    </article>
                );
        }       
    }
}

export default Contents;
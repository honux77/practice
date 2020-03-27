import React, { Component } from 'react';
import welcome from  './welcome.png';
import trouser from './trouser.jpg';
import songImg from './song.jpg';

class Contents extends Component {
    constructor(props) {
        super(props);
        this.state = {
            mode: "welcome",
            friends: [
                {id: 1, name: "다람이"},
                {id: 2, name: "징징이"},
                {id: 3, name: "뚱이"} 
            ],
            msg: "게임을 시작하지"
        }
    }

    play = (e) => {
        if (this.state.mode === "welcome") {
            this.setState({msg: "일부러 바지찢기 시전"});
            this.setState({mode: "playing"})
            return;
        }

        const friends = this.state.friends;

        if (friends.length !== 0) {
            this.setState({
                friends: friends.slice(0, friends.length - 1)
            })
        }

        if (this.state.friends.length === 0) {
            this.setState({mode: "bad"});
        }
    }
    render() {
        const friends = this.state.friends.map(e => (<li key={e.id}>{e.name}</li>));
        const button = <button onClick={this.play}>{this.state.msg}</button>
        const song = (
            <article>
            <p>내 바지가 찢어졌을 때, 모두가 날 좋아한다고 생각했어.</p>
            <p>그런 짓은 하지 말아야 했는데, 난 그 사실을 몰랐어.</p>
            <h1>Bad Ending - 007</h1>
            <p><img alt="Sad Song" src={songImg}/></p>

            </article>
        );
        switch(this.state.mode) {
            case "welcome":
                return (
                    <article>
                    <p><img width='600' src={welcome} alt="Welcom Sponge Bob"/></p>
                    {button}
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
                        <p><img alt="No!" src={trouser}/></p>
                        {button}
                    </article>
                );
        }       
    }
}

export default Contents;
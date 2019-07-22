class Db {
    constructor() {
        this.users = {};
    }
    find(username) {
        console.log(`db find ${username}`);
        if(this.users[username]) {
            return {username, password: this.users[username]};
        } else {
            console.log(`[DB] no user: ${username}`);

            return;
        }
    }
    save(username, password) {
        console.log(`db save ${username} ${password}`);
        if (this.users[username]) {
            console.log(`${username} exists: ${this.users[username]}`);
        }
        this.users[username] = password;
    }
};

// const db = new Db();
// db.save('honux', 1234);
// console.log(db.find('honux'));

module.exports = new Db();
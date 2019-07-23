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

module.exports = new Db();
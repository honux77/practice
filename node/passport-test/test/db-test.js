const assert = require("assert");
const db = require('../db');

describe('DB 테스트', ()=> {
	describe('저장 및 검색 테스트', () => {
		it('레코드가 없으면 undefined 리턴', () => {
			const user = db.find('crong');
			assert.equal(user, undefined);
		});
		it('레코드 저장후 객체 리턴', ()=> {
			db.save('honux',1234);
			const user = db.find('honux');
			assert.equal(user.username, 'honux');
			assert.equal(user.password, 1234);
		});
	});
});

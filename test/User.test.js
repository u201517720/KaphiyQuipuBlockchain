const UserContract = artifacts.require("UserContract");
let instance;

beforeEach(async () => {
    instance = await UserContract.new()
});

contract('UserContract', accounts => {
    it('should have available users', async () => {
        let total = await instance.totalUsers();
        assert(total > 0);
    });
})
pragma solidity 0.7.5;

contract Crud {
    struct User {
        uint id;
        string name;
    }
    
    User[] users;
    uint nextId = 0;
    
    function create(string memory name) public {
        users.push(User(nextId, name));
        nextId++;
    }
    
    function read(uint id) public view returns (uint, string memory){
        for(uint i = 0; i < users.length; i++){
            if(users[i].id == id){
                return (users[i].id, users[i].name);
            }
        }
    }
    
     function update(uint id, string memory _name) public {
        for(uint i = 0; i < users.length; i++){
            if(users[i].id == id){
               users[i].name = _name;
            }
        }
    }
    
    function del(uint id) public {
        delete users[id];
        
        revert('User does not exist');
    }
    
}

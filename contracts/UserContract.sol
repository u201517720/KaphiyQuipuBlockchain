// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract UserContract {
    address public owner;

    // struct User {
    //     address DireccionUser;
    //     string name;
    //     string password;
    // }

    struct User {
        string userName;
        string fullName;
        string email;
        string password;
        uint16 empresa;
        string role;
    }


    User[] public users;
    mapping(string => User) usuarios;

    constructor()  public {
        owner = msg.sender;
        users.push(User("jfelixsr@gmail.com", "Jose Felix Salmeron Romo", "jfelixsr@gmail.com", "5JKIrQpthKxsTzF4kTDryw==", 1, "Agricultor"));
        users.push(User("mjesuspc@gmail.com", "Mario Jesús Parrilla Castello", "mjesuspc@gmail.com", "5JKIrQpthKxsTzF4kTDryw==", 1, "Acopiador"));
        users.push(User("aleopoldoar@gmail.com", "Adolfo Leopoldo Aliaga Romero", "aleopoldoar@gmail.com", "5JKIrQpthKxsTzF4kTDryw==", 1, "Acopiador"));
        users.push(User("hmauroca@gmail.com", "Herminio Mauro Cuenca Arevalo", "hmauroca@gmail.com", "5JKIrQpthKxsTzF4kTDryw==", 1, "Transformador"));
        users.push(User("krafaelac@gmail.com", "Kevin Rafael Andrade Cervantes", "krafaelac@gmail.com", "5JKIrQpthKxsTzF4kTDryw==", 1, "Distribuidor"));
        users.push(User("aasisdl@gmail.com", "Alexander Asis Diez Lara", "aasisdl@gmail.com", "5JKIrQpthKxsTzF4kTDryw==", 1, "Acopiador - Vendedor"));
        users.push(User("aalbertotn@gmail.com", "Ali Alberto Tirado Nogales", "aalbertotn@gmail.com", "5JKIrQpthKxsTzF4kTDryw==", 1, "Acopiador - Almacenero"));
        users.push(User("jmanuelvs@gmail.com", "Juan Manuel Vera Sanz", "jmanuelvs@gmail.com", "5JKIrQpthKxsTzF4kTDryw==", 1, "Acopiador - Controlador de Calidad"));
        users.push(User("mablancome@gmail.com", "Marco Antonio Blanco Megias", "jjordandt@gmail.com", "5JKIrQpthKxsTzF4kTDryw==", 1, "Agricultor"));
        users.push(User("cgsalvadorju@gmail.com", "Claudio Gerard Salvador Juarez", "jjordandt@gmail.com", "5JKIrQpthKxsTzF4kTDryw==", 1, "Agricultor"));
        users.push(User("jproigta@gmail.com", "Jordi Paulino Roig Tapia", "jjordandt@gmail.com", "5JKIrQpthKxsTzF4kTDryw==", 1, "Agricultor"));
        users.push(User("mcespinma@gmail.com", "Mohammed Constantin Espin Manzano", "jjordandt@gmail.com", "5JKIrQpthKxsTzF4kTDryw==", 1, "Agricultor"));
        users.push(User("pnperisbe@gmail.com", "Patricio Narciso Peris Betancor", "jjordandt@gmail.com", "5JKIrQpthKxsTzF4kTDryw==", 1, "Agricultor"));
        users.push(User("kgosoriola@gmail.com", "Kevin Gerard Osorio Lazaro", "jjordandt@gmail.com", "5JKIrQpthKxsTzF4kTDryw==", 1, "Agricultor"));
        users.push(User("jfmquintanavi@gmail.com", "Joaquim Francisco Manuel Quintana Villar", "jjordandt@gmail.com", "5JKIrQpthKxsTzF4kTDryw==", 1, "Agricultor"));
        users.push(User("eeaguilarbu@gmail.com", "Emilio Eric Aguilar Buendia", "jjordandt@gmail.com", "5JKIrQpthKxsTzF4kTDryw==", 1, "Agricultor"));
        users.push(User("rmvaqueroos@gmail.com", "Rayan Matias Vaquero Osorio", "jjordandt@gmail.com", "5JKIrQpthKxsTzF4kTDryw==", 1, "Agricultor"));

        for(uint i = 0; i < users.length; i++) {
            usuarios[users[i].userName] = users[i];
        }
    }

    function addUser(   string memory userName,
                        string memory fullName,
                        string memory email,
                        string memory password,
                        uint16 empresa,
                        string memory role) public {
        User memory user = User(userName, fullName, email, password, empresa, role);
        users.push(user);
        usuarios[userName] = user;
    }

    function totalUsers() public view returns(uint) {
        return users.length;
    }

    function validateUser(string memory  username, string memory password) public view returns (bool) {
        for(uint i = 0; i < users.length; i++){
            User storage user = users[i];
            if (keccak256(abi.encodePacked(user.userName)) == keccak256(abi.encodePacked(username)) 
            && keccak256(abi.encodePacked(user.password)) == keccak256(abi.encodePacked(password))) {
                return true;
            }
        }

        return false;
    }

    function getUser(string memory username) public view returns (User memory) {
        return usuarios[username];
        // for(uint i = 0; i < users.length; i++){
        //     User memory user = users[i];
        //     if (keccak256(abi.encodePacked(user.userName)) == keccak256(abi.encodePacked(username)) ) {
        //         return user;
        //     }
        // }
    }
}
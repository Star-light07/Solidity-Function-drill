// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionDrill {
    // Function #1 — Mappings (basic)
    // Task:
    // Write a function called setScore that takes an address and a uint256, and stores the score for that address.
    // Then write a second function called getScore that takes an address and returns that address's score.
    // No contract skeleton needed — just the state variable and the two functions.

    mapping(address => uint256) public scores;

    function setScore(address _user, uint256 _score) public {
        scores[_user] = _score;
    }

    function getScore(address _score) public view returns (uint256) {
        return scores[_score];
    }

    // Function #2 — Mappings (update + check)
    // Task:
    // Write a mapping that tracks whether an address has been verified or not. Write a function verify that marks an address
    // as verified. Write a function isVerified that returns whether a given address is verified.
    // But here's the catch — if the address is already verified, verify should revert with a message.

    mapping(address => bool) public verified;

    function verify(address _verify) public {
        require(!verified[_verify], "already verified");

        verified[_verify] = true;
    }

    function isVerified(address _verifier) public view returns (bool) {
        return verified[_verifier];
    }

    // Function #3 — Mappings (nested)
    // Task:
    // Write a nested mapping that tracks how much ETH one address has approved for another address to spend. Write a function
    //  approve that sets the approved amount. Write a function allowance that returns the approved amount between two addresses.
    // This pattern should look familiar — you've read OpenZeppelin's ERC20. 😊

    mapping(address => mapping(address => uint256)) public amount;

    function approve(address _addr1, address _addr2, uint256 _amount) public {
        amount[_addr1][_addr2] = _amount;
    }

    function allowance(address _addr1, address _addr2) public view returns (uint256) {
        return amount[_addr1][_addr2];
    }

    //Task:
    // Define a struct called Person with three fields: name (string), age (uint256), and wallet (address). Write a function
    // addPerson that creates a new Person and stores it. Write a function getPerson that takes an address and returns that
    // person's name and age.
    //     Maybe. Let me rephrase:
    // You have a Person struct. You want to store many persons and look them up by their wallet address.
    // How do you store them? mapping(address => Person)
    // That's your state variable. Now rewrite both functions with that in mind

    struct Person {
        string name;
        uint256 age;
        address person;
    }

    mapping(address => Person) public persons;

    function addPerson(string memory _name, uint256 _age, address _person) public {
        persons[_person] = Person(_name, _age, _person);
    }

    function getPerson(address _person) public view returns (string memory, uint256) {
        return ((persons)[_person].name, (persons)[_person].age);
    }

    function updateAge(address _person, uint256 _age) public {
        require(persons[_person].age > 0, "person does not exist");

        persons[_person].age = _age;
    }
    // Task:
    // Using the same Person struct and mapping from Function #4, write a function updateAge that takes an address and a new age,
    //  and updates that person's age. But only if that person exists — check that their age is greater than 0 before updating.
    // Go.

    // Write a function deletePerson that takes an address and removes that person from the mapping. After deletion, calling
    //  getPerson for that address should return default values.
    // Hint: Solidity has a keyword for this.

    function deletePerson(address _address) public {
        delete persons[_address];
    }

    // Function #7 — Arrays (basic push and read)
    // Task:
    // Write a state variable that's a dynamic array of uint256. Write a function addNumber that takes a number and
    //  adds it to the array.
    // Write a function getNumber that takes an index and returns the number at that index.

    uint256[] public arr;

    function addNumber(uint256 num) public {
        arr.push(num);
    }

    function getNumber(uint256 num) public view returns (uint256) {
        return arr[num];
    }

    // Function #8 — Arrays (length + loop)
    // Task:
    // Using the same uint256[] array from #7, write a function sumAll that loops through the array and
    //  returns the sum of all numbers in it.

    function sumAll() public view returns (uint256) {
        uint256 sum = 0;

        for (uint256 i = 0; i < arr.length; i++) {
            sum = sum + arr[i];
        }

        return sum;
    }

    //  ✅ Clean. Function #8 done.
    // Function #9 — Arrays (find max)
    // Task:
    // Write a function findMax that loops through the uint256[] array and returns the largest number in it.

    function findMax() public view returns (uint256) {
        uint256 largest = arr[0];

        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] > largest) {
                largest = arr[i];
            }
        }

        return largest;
    }

    // Function #10 — Arrays (remove by index)
    // Task:
    // Write a function removeAt that takes an index and removes the element at that index from the uint256[] array. Order doesn't matter — you can move the last element into that spot and then pop.
    // Hint: This is a common gas-efficient pattern. You'll see it in real contracts.
    // Go.

    function removeAt(uint256 _index) public {
        arr[_index] = arr[arr.length - 1];

        arr.pop();
    }
}

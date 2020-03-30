pragma solidity ^0.5.0;


// // =
// // _
// ++

contract Todo {
        // add a todo 
        // update the todo
        // tip the owner of a todo 
    string public dappName;
    mapping(uint256 => Todo ) public todos; // 
    uint256 public todoCount; // keeps tracks of the tasks/todos created
    /*
        String : DataType
        Public: modifier
        dappName: property
        
    */
    
    constructor() public{
        dappName = "Todo Version 1"; 
    }
    
    
    struct Todo {
    /*
        Name Of The Todo
        Whether Completed 
        Owner (creator)
    */
        string nameTodo;
        bool completed; 
        address payable owner; 
    }
    
    
    /* 
    `   create a task/todo
        update a task/ todo
        tip a task/todo owner if completed
    */
    
    function addTask(string memory todoName) public {
        
         /*
            increment the todo count 
            create a todo 
         */
         todoCount++; // adds 1 to 0
         todos[todoCount] = Todo(
                    todoName,
                    false,
                    msg.sender
        );
        
    }
    
    
        function updateTask(uint256 id) public{
                Todo memory todo = todos[id];
                /*
                    make sure that todo/task is not completed
                */
                require(!todo.completed, "Todo/Task Already completed");
                todo.completed = true;
                todos[id] = todo;
        }    
        
        // Tip the owner of a particular task if completed
    
    
        function tip(uint256 id) public payable{
                // tip the owner of a particular task/todo if the particular task/todo has been completed
                Todo memory todo = todos[id];
                require(todo.completed, "Todo/Task Not completed");
                address payable todoOwner = todo.owner; 
                address(todoOwner).transfer(msg.value);
        }
        
}

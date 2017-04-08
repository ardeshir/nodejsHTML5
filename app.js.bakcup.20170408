"use strict";

function Tasks() {
	var version = "v0.1.1";
	
	var adb = new AppStore("tasksApp");
        
        // adding loadTaskList
	function loadTaskList() {
		var tasks = adb.getValue("taskList");
		if(tasks){
			for( var i in tasks) {
			addTaskElement(tasks[i]);
			}
		}
        } // end of loadTaskList        
	// adding saveTaskList to adb
	function saveTaskList() {
		var tasks = [];
		$("#task-list .task span.task-name").each(function() {
			tasks.push($(this).text())
		});
		adb.setValue("taskList", tasks);
	} // end of saveTasks
         
	function setStatus(message) {
		$("#app>footer").text(message);
	} // end of set Status
	
	// adding addTask

	function addTask() {
		var taskName = $("#new-task-name").val();

		if(taskName) {
			addTaskElement(taskName);
			// reset text field
			$("#new-task-name").val("").focus();
		} // end of if

               saveTaskList();
	} // end of addTask
       
        // adding onEdit TaskName 
	function onEditTaskName($span) {
		$span.hide()
		     .siblings("input.task-name")
		     .val($span.text())
   		     .show()
		     .focus();
	} // end of onEdit

	// adding onChangeTaskName
	function onChangeTaskName($input) {
		$input.hide();
		var $span = $input.siblings("span.task-name");
		if($input.val()) {
		  $span.text($input.val());
		}
		$span.show();
                saveTaskList();
	} // end of onChange

	// adding Task Element
	function addTaskElement(taskName) {

		var $task = $("#task-template .task").clone();
		$("span.task-name", $task).text(taskName);
                                                             
		$("#task-list").append($task);

	        $("button.delete", $task).click(function() {
			// $task.remove();
			removeTask($task);
		});
		$("button.move-up", $task).click(function() {
			// $task.insertBefore($task.prev());
			moveTask($task, true);
		});
		$("button.move-down", $task).click(function() {
			// $task.insertAfter($task.next());
			moveTask($task, false);
		});
	
		$("span.task-name", $task).click(function() {
			onEditTaskName($(this));
		});
                 
		$("input.task-name", $task).change(function() {
			onChangeTaskName($(this));
		})
		.blur(function() {
			$(this).hide().siblings("span.task-name").show();
		});
                
		// adding Task functions

		function removeTask($task) {
			$task.remove();		
			saveTaskList();
		}

		function moveTask($task, moveUp) {
			if(moveUp) {
				$task.insertBefore($task.prev());
			} else {
				$task.insertAfter($task.next());
			}
			saveTaskList();
		}
	} // end of task element

	this.start = function() {
		
		$("#new-task-name").keypress(function(e) {
			if(e.which == 13){ // enter key is pressed
				addTask();
				return false;
			} // end if 
                                         
		}).focus();

		$("#app>header").append(" ready..." );
               
		// load tasks
		loadTaskList();
		setStatus(version);
	}; 

} // end of Tasks 

$(function() {
	window.app = new Tasks();
	window.app.start();
});

import 'models.dart';
import 'dart:io';


void main(){
  String? input(String name){
    String? inp;
        while(inp == null){
          print('$name*: ');
          inp = stdin.readLineSync();
        }
    return inp;
  } 

  TaskManager task_manager = TaskManager();

  while(true){
    print('----------***-----------');

    print('${1} Dispay tasks');
    print('${2} Add a task');
    print('${3} Edit tasks');
    print('${4} Delete a task');

    String value = stdin.readLineSync() ?? '0';

    switch(int.parse(value)){
      case 1:
        if (task_manager.taskList.length == 0){
            print('There is no task to display');
            break;
          }
        print('${1} Complete tasks');
        print('${2} Pending tasks');
        print('${3} Both tasks');

        String value2 = stdin.readLineSync() ?? '0';

        switch(int.parse(value2)){
          case 1:
            task_manager.viewTasks('complete');
            break;
          case 2:
            task_manager.viewTasks('pending');
            break;
          case 3:
            task_manager.viewTasks('both');
            break;
          default:
            print('Your Input is Wrong!');
        }
        break;
      case 2:
        print('Please Fill in the neccesary infromations!');
        String? title = input('Title');
        String? description = input('Description');
        String? dueDate = input('Due Date');
        String? status = input('status');

        task_manager.addTask(title, description, dueDate, status);
        break;
      case 3:
        if (task_manager.taskList.length == 0){
          print('There is no task to edit');
          break;
        }
        print('Which task would you like to edit?');
        task_manager.viewTasks('both');

        int i = int.parse(stdin.readLineSync() ?? '0');

        if( (1 <= i) && (i <= task_manager.taskList.length)){
          String? title = input('Title');
          String? description = input('Description');
          String? dueDate = input('Due Date');
          String? status = input('status');

          task_manager.editTask(i-1, title, description, dueDate, status);
        }
        else{
          print('There is not task with such index!');
        }
        break;
      case 4:
        int i = 0;
        while (i < 1 || i > task_manager.taskList.length){
          print('Task No*:');
          dynamic i = stdin.readLineSync() ?? '0';
          i = int.parse(i);
        }

        task_manager.removeTask(i-1);
        break;
    }
  }

}
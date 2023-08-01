import 'dart:core';

class Task{
  String? title, description, dueDate, status;
  Task(title, description, dueDate, status){
    this.title = title;
    this.description = description;
    this.dueDate = dueDate;
    this.status = status;
  }

  String present() => "${this.title} -- ${this.description} -- ${this.dueDate}  -- ${this.status}";
  
  
}

class TaskManager{
  List<Task> taskList = [];
  
  void addTask(title, description, dueDate, status){
    Task task = Task(title, description, dueDate, status);
    taskList.add(task);

  }

  void viewTasks(String cond){
    for(int i = 0; i < taskList.length; i++){
      Task task = taskList[i];
      if (cond == 'both' || cond == task.status )
        print("${i+1}) ${task.present()}");
    }
  }

  void editTask(int i, title, description, dueDate, status){
    Task task = taskList[i];
    if (title != null) task.title = title;
    if (description != null) task.description = description;
    if (dueDate != null) task.dueDate = dueDate;
    if (status != null) task.status = status;

  }

  void removeTask(int i){
    taskList.removeAt(i);
  }
}
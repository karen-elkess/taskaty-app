


class AddTaskModel {
  
 String title;
 String describtion;
 String date;

AddTaskModel({required this.title , required this.describtion , required this.date});

   toJson(){
   return {
    'title': title,
    'description':describtion,
    'delivery_date':date
   };
  }
} 
import 'package:first_flutter_application/shared/app_cupit/app_cupit.dart';
import 'package:flutter/material.dart';

Widget defulteButton({
  Color color = Colors.blue,
  double width = double.infinity,
  bool isUpper = true,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      color: color,
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
    );


Widget defulteFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required FormFieldValidator<String> validate,
  GestureTapCallback? onTap,
  required String label,
  required IconData prefix,
  Widget? suffix,
  bool isPassword = false,

}) => TextFormField(
  controller: controller,
  onTap: onTap,
  keyboardType: keyboardType,
  obscureText: isPassword,
  validator: validate,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix),
    suffixIcon: suffix,
    border: OutlineInputBorder(),
  ),
);

Widget buildTaskItem({
  required int id,
  required String title,
  required String date,
  required String time,
  required context,
}) => Dismissible(
  key: Key(id.toString()),
  onDismissed: (direction) {
    AppCubit.get(context).deleteFromDatabase(id: id);
  },
  background: Container(
    color: Colors.red,
  ),

  child: Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        CircleAvatar(

          radius: 40.0,

          child: Text(

            '$time',

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            mainAxisSize: MainAxisSize.min,

            children: [

              Text(

                '$title',

                maxLines: 1,

                overflow: TextOverflow.ellipsis,

                style: TextStyle(

                  fontSize: 20.0,

                  fontWeight: FontWeight.bold,

                ),

              ),

              Text(

                '$date',

                style: TextStyle(

                  color: Colors.grey,

                  fontSize: 16.0,

                  fontWeight: FontWeight.bold,

                ),

              ),

            ],

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        IconButton(

          onPressed: (){

            AppCubit.get(context).updateDatabase(statues: 'done', id: id);

          },

          icon: Icon(

            Icons.check_box,

            color: Colors.green,

          ),

        ),

        IconButton(

          onPressed: (){

            AppCubit.get(context).updateDatabase(statues: 'archived', id: id);

          },

          icon: Icon(

            Icons.archive,

            color: Colors.black45,

          ),

        ),

      ],

    ),

  ),
);

Widget tasksBuilder({
  required List<Map> tasks,
}) {
  if(tasks.isNotEmpty){
    return ListView.separated(
      itemBuilder: (context, index) => buildTaskItem(
        title: tasks[index]['title'],
        time: tasks[index]['time'],
        date: tasks[index]['date'],
        id: tasks[index]['id'],
        context: context,
      ),
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20.0,
        ),
        child: Container(
          height: 1.0,
          width: double.infinity,
          color: Colors.grey[300],
        ),
      ),
      itemCount: tasks.length,
    );
  } else {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          Icon(
            Icons.menu,
            color: Colors.grey,
            size: 100.0,
          ),
          Text(
            'No Tasks Yet, Please Add Some Tasks',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}


Widget buildArticleItem(article, context) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        height: 120.0,
        width: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage('${article['urlToImage']}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(width: 20.0,),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis
                ),
              ),
              Text(
                '${article['publishedAt']}',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);
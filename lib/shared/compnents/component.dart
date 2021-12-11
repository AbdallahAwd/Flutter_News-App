
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:learning/modules/webview/WebViewScreen.dart';
import 'package:url_launcher/url_launcher.dart';


Widget defaultTextFormFeild({
  @required TextEditingController controller,
  @required IconData pre,
  @required String HintText,
  Function validate,
  var onChange,
  IconData suff,
  bool isObscure = false,
  @required var KeyType,
  Function suffPress,
  var submit,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey,
      ),
      child: TextFormField(
        keyboardType: KeyType,
        obscureText: isObscure,
        controller: controller,
        onChanged: onChange,
        onFieldSubmitted: submit,
        decoration: InputDecoration(
          prefixIcon: Icon(pre),
          suffixIcon: IconButton(onPressed: suffPress, icon: Icon(suff)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: HintText,
        ),
        validator: validate,
      ),
    );



  Widget listBuilder(articles , context ,) => InkWell(
    onTap: ()
    {
      Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(articles['url'])));
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    '${articles['urlToImage']}'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          SizedBox(width: 10.0,),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${articles['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${articles['description']}',
                    style:Theme.of(context).textTheme.bodyText2,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

Widget DataHandler(list,{isSearch = false})
=> ConditionalBuilder(
  condition: list.length > 0,
  builder: (context ) => ListView.separated(
       physics: BouncingScrollPhysics(),
      itemBuilder: (context , index) => listBuilder(list[index] , context),
      separatorBuilder: (context , index) => Divider(height: 1,color: Colors.grey,endIndent: 10,indent: 20,),
      itemCount: list.length,
  ),
  fallback: (context) =>isSearch ? Container() : Center(child: CircularProgressIndicator()),
);

import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigate.dart';
import 'dart:convert';
import 'package:flutter_excellence_hr/widgets/appbar.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String jsonS = """{
    "overview": {
        "main": [{
            "heading": "All employee information at one page",
            "description": "Simple and intutive HR software that consolidates all of your employee information into a safe and serialized information store that is assible from anywhere.All your employee's data can easily be collected,imported and stored in database.",
            "feature":"FEATURE",
             "employeepic":"assets/images/employee.png"
        }],
        "emp":[{"heading":"Employee Management",
        "description":"All your employee information stored in one central location and accessible from anywhere"
        }],
        "pay": [{
            "heading": "Payroll",
            "description": "HRMS payroll provides every possible option for allocation of employeeshare of PF or ESI all at one place.",
             "imgpay":"assets/images/payroll.png"
        }],
        "inventory": [{
            "heading": "Inventory",
            "description": "Track every item or batch in your inventory with serial number.ALways keep a track on movement of items,in a single inventory management.",
             "imginventory":"assets/images/inventory.png"
        }],
        "leave": [{
            "heading": "Leave Management",
            "description": "Customization leave  management system of your own.Approve multiple  request and manage applications with effective leave management.",
             "imgleave":"assets/images/leave.png"
        }],
        "document": [{
            "heading": "Document Management",
            "description": "Organize your online documents,create public folders for internal policy resources, and share confidential files with the right person.",
             "imgdocument":"assets/images/document.png"
        }],
        "policies": [{
            "heading": "Policies Management",
            "description": "Upload, organize and share public documents like policies and other senstive information. ",
             "imgpolicy":"assets/images/policy.png"
        }],
        "profile": [{
            "heading": "Profile",
            "description": "Let employes update their own information and be sure of getting the vital details.Set profile permissions so that employees can access right feild and keep all information up to date. ",
             "imgprofile":"assets/images/profile.png"
        }]
        
        
        

    }
}""";
    var overview = json.decode(jsonS);

    return Column(
      children: [
        SizedBox(height: 16),
        WidgetHeading(heading: overview['overview']['main'][0]['heading']),
        SizedBox(height: 16),
        WidgetDescription(
            description: overview['overview']['main'][0]['description']),
        SizedBox(height: 16),
        WidgetHeading(heading: overview['overview']['main'][0]['feature']),
        SizedBox(height: 16),
        WidgetImage(overview['overview']['main'][0]['employeepic']),
        WidgetHeading(heading: overview['overview']['emp'][0]['heading']),
        WidgetDescription(
            description: overview['overview']['emp'][0]['description']),
        WidgetImage(overview['overview']['pay'][0]['imgpay']),
        WidgetHeading(heading: overview['overview']['pay'][0]['heading']),
        WidgetDescription(
            description: overview['overview']['pay'][0]['description']),
        WidgetImage(overview['overview']['inventory'][0]['imginventory']),
        WidgetHeading(heading: overview['overview']['inventory'][0]['heading']),
        WidgetDescription(
            description: overview['overview']['inventory'][0]['description']),
        WidgetImage(overview['overview']['leave'][0]['imgleave']),
        WidgetHeading(heading: overview['overview']['leave'][0]['heading']),
        WidgetDescription(
            description: overview['overview']['leave'][0]['description']),
        WidgetImage(overview['overview']['document'][0]['imgdocument']),
        WidgetHeading(heading: overview['overview']['document'][0]['heading']),
        WidgetDescription(
            description: overview['overview']['document'][0]['description']),
        WidgetImage(overview['overview']['policies'][0]['imgpolicy']),
        WidgetHeading(heading: overview['overview']['policies'][0]['heading']),
        WidgetDescription(
            description: overview['overview']['policies'][0]['description']),
        WidgetImage(overview['overview']['profile'][0]['imgprofile']),
        WidgetHeading(heading: overview['overview']['profile'][0]['heading']),
        WidgetDescription(
            description: overview['overview']['profile'][0]['description'])
      ],
    );
  }
}

class WidgetHeading extends StatelessWidget {
  String heading;
  WidgetHeading({this.heading});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Container(
                margin: EdgeInsets.fromLTRB(32, 16, 32, 16),
                child: Text(
                  heading,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.LIGHTBLACK_COLOR,
                      fontFamily: 'SourceSans',
                      fontSize: 20),
                ))),
      ],
    );
  }
}

class WidgetDescription extends StatelessWidget {
  String description;
  WidgetDescription({this.description});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Container(
                margin: EdgeInsets.fromLTRB(32, 0, 32, 32),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.LIGHTBLACK_COLOR,
                      fontFamily: 'OpenSans',
                      fontSize: 15),
                ))),
      ],
    );
  }
}

class WidgetImage extends StatelessWidget {
  String image;
  WidgetImage(this.image);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Container(
                child: Image(
          image: AssetImage(image),
          width: 70,
          height: 70,
        ))),
      ],
    );
  }
}

//
//  InsertRecordViewController.swift
//  SwiftDB
//
//  Created by Dhruval Darji on 3/14/16.
//  Copyright © 2016 Dhruval Darji. All rights reserved.
//

import UIKit

class InsertRecordViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtGrade: UITextField!
    
    var isEdit : Bool = false
    var studentData : StudentInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(isEdit)
        {
            txtName.text = studentData.Name;
            txtGrade.text = studentData.Grade;
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UIButton Action methods
    
    @IBAction func btnBackClicked(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func btnSaveClicked(sender: AnyObject)
    {
        if(txtName.text == "")
        {
            Util.invokeAlertMethod("", strBody: "Please enter Student Name.", delegate: nil)
        }
        else if(txtGrade.text == "")
        {
            Util.invokeAlertMethod("", strBody: "Please enter Student Grade.", delegate: nil)
        }
        else
        {
            if(isEdit)
            {
                let studentInfo: StudentInfo = StudentInfo()
                studentInfo.Id = studentData.Id
                studentInfo.Name = txtName.text!
                studentInfo.Grade = txtGrade.text!
                let isUpdated = ModelManager.getInstance().updateStudentData(studentInfo)
                if isUpdated {
                    Util.invokeAlertMethod("", strBody: "Record updated successfully.", delegate: nil)
                } else {
                    Util.invokeAlertMethod("", strBody: "Error in updating record.", delegate: nil)
                }
            }
            else
            {
                let studentInfo: StudentInfo = StudentInfo()
                studentInfo.Name = txtName.text!
                studentInfo.Grade = txtGrade.text!
                let isInserted = ModelManager.getInstance().addStudentData(studentInfo)
                if isInserted {
                    Util.invokeAlertMethod("", strBody: "Record Inserted successfully.", delegate: nil)
                } else {
                    Util.invokeAlertMethod("", strBody: "Error in inserting record.", delegate: nil)
                }
            }
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
}

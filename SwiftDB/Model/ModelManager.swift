//
//  ModelManager.swift
//  SwiftDB
//
//  Created by Dhruval Darji on 3/14/16.
//  Copyright © 2016 Dhruval Darji. All rights reserved.
//

import UIKit

let sharedInstance = ModelManager()

/** Our Database Manager **/
class ModelManager: NSObject {
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> ModelManager
    {
        if(sharedInstance.database == nil)
        {
            sharedInstance.database = FMDatabase(path: Util.getPath("Student.sqlite"))
        }
        return sharedInstance
    }
    
    /* Create Student */
    func addStudentData(studentInfo: StudentInfo) -> Bool {
        sharedInstance.database!.open()
        let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO student_info (Name, Grade) VALUES (?, ?)",
            withArgumentsInArray: [studentInfo.Name, studentInfo.Grade])
        sharedInstance.database!.close()
        return isInserted
    }
    
    /* Read Student */
    func getStudentData(studentId: String) -> StudentInfo {
        sharedInstance.database!.open()
        let resultSet: FMResultSet! = sharedInstance.database!
            .executeQuery("SELECT * FROM student_info WHERE Id=?", withArgumentsInArray: [studentId])
        let studentInfo : StudentInfo = StudentInfo()
        if (resultSet != nil) {
            if resultSet.next() {
                studentInfo.Id = resultSet.stringForColumn("Id")
                studentInfo.Name = resultSet.stringForColumn("Name")
                studentInfo.Grade = resultSet.stringForColumn("Grade")
            }
        }
        sharedInstance.database!.close()
        return studentInfo
    }
    
    /* Update Student */
    func updateStudentData(studentInfo: StudentInfo) -> Bool {
        sharedInstance.database!.open()
        let isUpdated = sharedInstance.database!.executeUpdate("UPDATE student_info SET Name=?, Grade=? WHERE Id=?", withArgumentsInArray: [studentInfo.Name, studentInfo.Grade, studentInfo.Id])
        sharedInstance.database!.close()
        return isUpdated
    }
    
    /* Delete Student */
    func deleteStudentData(studentInfo: StudentInfo) -> Bool {
        sharedInstance.database!.open()
        let isDeleted = sharedInstance.database!.executeUpdate("DELETE FROM student_info WHERE Id=?", withArgumentsInArray: [studentInfo.Id])
        sharedInstance.database!.close()
        return isDeleted
    }
    
    /* Get All Students */
    func getAllStudentData() -> NSMutableArray {
        sharedInstance.database!.open()
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM student_info", withArgumentsInArray: nil)
        let marrStudentInfo : NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let studentInfo : StudentInfo = StudentInfo()
                studentInfo.Id = resultSet.stringForColumn("Id")
                studentInfo.Name = resultSet.stringForColumn("Name")
                studentInfo.Grade = resultSet.stringForColumn("Grade")
                marrStudentInfo.addObject(studentInfo)
            }
        }
        sharedInstance.database!.close()
        return marrStudentInfo
    }
}

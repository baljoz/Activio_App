//
//  SQLDataIO.swift
//  SQLiteWrapper
//
//  Created by Cindy Oakes on 5/28/16.
//  Copyright © 2016 Cindy Oakes. All rights reserved.
//

//the directory and file url prints, so you can navigate to it and throw the database in the trash between runs while testing
//if you can not find the folders by browing then on the Finder menu at the top click Go=>GoToFolder then type in  Library or
//Developer to help you get to it because apple is hiding them

// be sure and use the readme.txt to get the sql libraries linked up correctly

import UIKit
import Dispatch


class SQLDataIO
{
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first! // automacki se kreira baza ukoliko je nema
    static let DBURL = DocumentsDirectory.appendingPathComponent("sqllitetutorial")
    
    static var items: [String] = []
    
    static var  firstName = ["Igor ", "Hekler", "AAA", "BBB", "CCC", "DD", "EEE"]
    static var  lastName = ["Oakes", "Oakes", "Delap", "Delap", "Oakes", "Oakes", "Oakes"]
    static var  age = ["55", "66", "33", "28", "22", "20", "8"]
    static var position = ["Oakes", "Oakes", "Delap", "Delap", "Oakes", "Oakes", "Oakes"]
    
    
    static var igraci = [Players]()
    
    static func PerformedSQLCommands() -> [Players]
        
    {
        
        print("\(DocumentsDirectory)")
        print("\(DBURL)")
        
        var dbCommand: String = ""
        
        // dbCommand = "CREATE TABLE test (ID INT PRIMARY KEY NOT NULL, FirstName CHAR(100), LastName CHAR(100), Age INT , Position CHAR(100) , Photo BLOB);"
        dbCommand = "CREATE TABLE test (ID INT PRIMARY KEY NOT NULL, Photo BLOB);"
        updateDatabase(dbCommand)
        
        //       var databaseRows: [[String]] = [[]]
        
        //  var id: Int = 0
        
        /*    for i in 0...6
         {
         id = nextID("Players")
         items.append(String(format: "\(id) -> nextID result" ))
         
         dbCommand = "insert into Players(ID, FirstName, LastName, Age,Position) values (\(id), '\(firstName[i])', '\(lastName[i])', '\(age[i])' , '\(position[i])')"
         updateDatabase(dbCommand)
         
         }*/
        
        // dbCommand = "select ID, FirstName, LastName, Age , Position from Players"
        dbCommand = "select Photo from test"
        // databaseRows = getRows(dbCommand, numColumns: 5)
        var g = getRows(dbCommand, numColumns: 1)
        var p = 0
        //for i in databaseRows
        //  {
        
        //    for j  in i
        //    {
        //      print(j)
        //      }
        
        // }
        // printRows(databaseRows)
        
        /*
         dbCommand = "UPDATE Family SET FirstName = 'Adam' WHERE ID = 1;"
         updateDatabase(dbCommand)
         items.append("ID 1 first name changed ")
         
         
         dbCommand = "select FirstName, LastName, Age from Family where ID = 1"
         databaseRows = getRows(dbCommand, numColumns: 3)
         printRows(databaseRows)
         
         
         dbCommand = "select LastName from Family where ID = 1"
         let lName: String! = dbValue(dbCommand)
         items.append(String(format: "\(lName) -> dbValue result" ))
         
         dbCommand = "select Age from Family where ID = 2"
         let ageInt: Int = dbInt(dbCommand)
         items.append(String(format: "\(ageInt) -> dbInt result" ))
         
         
         dbCommand = "select Age from Family where ID = 2"
         let ageString: String  = dbValue(dbCommand)
         items.append(String(format: "\(ageString) -> dbValue result" ))
         
         
         dbCommand = "DELETE FROM Family WHERE ID = 1;"
         updateDatabase(dbCommand)
         items.append("ID 1 was deleted")
         
         dbCommand = "select FirstName, LastName from Family where LastName = 'Oakes' "
         databaseRows = getRows(dbCommand, numColumns: 2)
         printRows(databaseRows)
         
         
         id = nextID("Family")
         items.append(String(format: "\(id) -> nextID result" ))
         
         dbCommand = String(format: "insert into Family(ID, FirstName, LastName, Age) values (%d, 'Cindy', 'Oakes', '55')", id)
         updateDatabase(dbCommand)
         items.append("Cindy added back in as next record")
         
         dbCommand = "select Age, FirstName, LastName from Family"
         databaseRows = getRows(dbCommand, numColumns: 3)
         printRows(databaseRows)
         */
        return igraci
    }
    
    static  func addPlayer( name: String, surname : String,position : String, godine : Int)
    {
        
        let id = self.nextID("Players")
        var data = UIImagePNGRepresentation(UIImage(named:"1")!)
        //  let dbCommand = "insert into Players(ID, FirstName, LastName, Age,Position) values ( \(id), '\(name)', '\(surname)', '\(godine)' , '\(position)')"
        let dbCommand = "insert into test(ID, Photo) values ( \(id), '\(data)')"
        
        // let dbCommand = " insert into Players(ID, FirstName, LastName, Age,Position) values (\(id), \'Igor \', \'Oakes\', \'55\' , \'Oakes\')"
        self.updateDatabase(dbCommand)
        
    }
    
    //MARK: Print Rows
    
    static func printRows(_ rows: [[String]])
    {
        for i in 0..<rows.count
        {
            var rowValue = "";
            
            var row: [String] = rows[i]
            
            for j in 0..<row.count
            {
                rowValue += String(format: " %@", row[j])
            }
            
            if (rowValue != "")
            {
                items.append(rowValue)
            }
        }
        
    }
    
    
    //MARK:  Open Database
    
    static func openDatabase() -> OpaquePointer {
        var db: OpaquePointer? = nil
        if sqlite3_open(DBURL.absoluteString, &db) == SQLITE_OK {
            //do nothing
            
        } else {
            print("Unable to open database. ")
        }
        return db!
    }
    
    
    //MARK:  Update Database
    
    static func updateDatabase(_ dbCommand: String)
    {
        var updateStatement: OpaquePointer? = nil
        
        let db: OpaquePointer = SQLDataIO.openDatabase()
        
        if sqlite3_prepare_v2(db, dbCommand, -1, &updateStatement, nil) == SQLITE_OK {
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                //do nothing
                print("upisano u bazu")
            } else {
                print("Could not updateDatabase")
            }
        } else {
            print("updateDatabase dbCommand could not be prepared")
        }
        
        sqlite3_finalize(updateStatement)
        
        sqlite3_close(db)
        
    }
    
    //MARK:  Get DBValue
    
    static func dbValue(_ dbCommand: String) -> String
    {
        var getStatement: OpaquePointer? = nil
        
        let db: OpaquePointer = SQLDataIO.openDatabase()
        
        var value: String? = nil
        
        if sqlite3_prepare_v2(db, dbCommand, -1, &getStatement, nil) == SQLITE_OK {
            if sqlite3_step(getStatement) == SQLITE_ROW {
                
                var getResultCol = sqlite3_column_text(getStatement, 0)
                // value = String(cString: UnsafePointer<CChar>(getResultCol!))
                value = String(cString:getResultCol!)
                
                
                
            }
            
        } else {
            print("dbValue statement could not be prepared")
        }
        
        sqlite3_finalize(getStatement)
        
        sqlite3_close(db)
        
        if (value == nil)
        {
            value = ""
        }
        
        return value!
    }
    
    
    
    //MARK: Get Next ID
    
    static func nextID(_ tableName: String!) -> Int
    {
        var getStatement: OpaquePointer? = nil
        
        let db: OpaquePointer = SQLDataIO.openDatabase()
        
        let dbCommand = String(format: "select ID from Players order by ID desc limit 1", tableName)
        
        var value: Int32? = 0
        
        if sqlite3_prepare_v2(db, dbCommand, -1, &getStatement, nil) == SQLITE_OK {
            if sqlite3_step(getStatement) == SQLITE_ROW {
                
                value = sqlite3_column_int(getStatement, 0)
            }
            
        } else {
            print("dbValue statement could not be prepared")
        }
        
        sqlite3_finalize(getStatement)
        
        sqlite3_close(db)
        
        var id: Int = 1
        if (value != nil)
        {
            id = Int(value!) + 1
        }
        
        return id
    }
    
    
    //MARK: Get DB Int
    
    static func dbInt(_ dbCommand: String!) -> Int
    {
        var getStatement: OpaquePointer? = nil
        
        let db: OpaquePointer = SQLDataIO.openDatabase()
        
        var value: Int32? = 0
        
        if sqlite3_prepare_v2(db, dbCommand, -1, &getStatement, nil) == SQLITE_OK {
            if sqlite3_step(getStatement) == SQLITE_ROW {
                
                value = sqlite3_column_int(getStatement, 0)
            }
            
        } else {
            print("dbValue statement could not be prepared")
        }
        
        sqlite3_finalize(getStatement)
        
        sqlite3_close(db)
        
        var int: Int = 1
        if (value != nil)
        {
            int = Int(value!)
        }
        
        
        return int
    }
    
    
    //MARK:  Get Rows
    
    static func getRows(_ dbCommand: String, numColumns: Int) -> [[Players]]
    {
        var outputArray: [[String]] = [[]]
        
        var getStatement: OpaquePointer? = nil
        
        let db: OpaquePointer = SQLDataIO.openDatabase()
        
        if sqlite3_prepare_v2(db, dbCommand, -1, &getStatement, nil) == SQLITE_OK {
            while sqlite3_step(getStatement) == SQLITE_ROW {
                
                var rowArray: [String] = []
                var p = Players()
                for i in  0..<numColumns
                {
                    
                    //  let val = sqlite3_column_text(getStatement, Int32(i)) as
                    //let valStr = String(cString: UnsafePointer<CChar>(val!))
                    
                    //   let valStr = String(cString: val!)
                    if i == 0
                    {
                        //kako da ucitam sliku iz baze ????
                        let len = sqlite3_column_bytes(getStatement, 0)
                        let point = sqlite3_column_blob(getStatement, 0)
                        if point != nil {
                            let dbData = NSData(bytes: point, length: Int(len))
                            let  img = UIImage(data: (dbData as? Data)!)
                            let p = Players()
                            p.img = img!
                            igraci.append(p)
                        }
                        // var data = NSData()
                        // var pr = sqlite3_column_blob(getStatement, Int32(i))
                        //     data =     pr?.advanced(by: Int)
                        // let valStr = NSData(cString: UnsafePointer<UInt8>(pr!))
                        //data =                     //        data = sqlite3_column_text(getStatement, Int32(i))  as! NSData
                        //   p.img = data
                    }
                    /*     if i == 1
                     {
                     p.ime = valStr
                     }
                     else if i == 2
                     {
                     p.prezime = valStr
                     }
                     else if i == 3
                     {
                     p.godine = Int(valStr)!
                     }
                     else if i == 4
                     {
                     p.pozicija = valStr
                     }
                     
                     rowArray.append(valStr)*/
                    
                    //print("col: \(i) | value:\(valStr)")
                }
                igraci.append(p)
                outputArray.append(rowArray)
                
            }
            
        } else {
            print("getRows statement could not be prepared")
        }
        
        sqlite3_finalize(getStatement)
        
        sqlite3_close(db)
        
        return [igraci]
    }
    
    
    
    
}

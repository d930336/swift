//
//  SQLiteConnect.swift
//  messageBoardTest
//
//  Created by YEH MING KUEI on 2017/3/31.
//  Copyright © 2017年 YEH MING KUEI. All rights reserved.
//

import Foundation

class SQLiteConnect{
    var db :OpaquePointer? = nil
    let sqlitePath :String
    
    init?(path :String) {
        sqlitePath = path
        db = self.openDatabase(path: sqlitePath)
        
        if db == nil {
            return nil
        }
    }
    
    //開啟資料庫連結
    func openDatabase(path :String) -> OpaquePointer {
        var connectdb: OpaquePointer? = nil
        
        if sqlite3_open(path, &connectdb) == SQLITE_OK {
            print("Successfully opened database \(path)")
            return connectdb!
        } else {
            connectdb = nil
            print("Unable to open database.")
            return connectdb!
        }
    }
    
    //建立資料表
    func creatTable(tableName :String, columnsInfo :[String]) -> Bool {
        let sql = "create table if not exists \(tableName) " + "(\(columnsInfo.joined(separator: ",")))" as NSString
        
        if sqlite3_exec(
            self.db, sql.utf8String, nil, nil, nil) == SQLITE_OK{
            return true
        }
        
        return false
    }
    
    //新增資料
    func insert(tableName :String, columnsInfo :[String], values :[String]) -> Bool{
        var statement :OpaquePointer? = nil
        let sql = "insert into \(tableName)" + " (\(columnsInfo.joined(separator: ",")))" + " values" + " (\(values.joined(separator: ",")))"
        print(sql)
        if sqlite3_prepare_v2(self.db, (sql as NSString).utf8String, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE{
                return true
            }
            sqlite3_finalize(statement)
        }
        return false
    }
    
    //讀取資料
    func read(tableName :String, columnsInfo :String?, values :String?) -> OpaquePointer{
        var statement :OpaquePointer? = nil
        var sql = "select * from \(tableName)"
        
        if columnsInfo != nil{
            sql += " where \(columnsInfo!) = \(values!)"
        }
        print(sql)
        sqlite3_prepare_v2(self.db, (sql as NSString).utf8String, -1, &statement, nil)
        
        return statement!
    }
    
    //更新資料
    func  update(tableName :String, cond :String, rowInfo :[String:String]) -> Bool {
        var statement :OpaquePointer? = nil
        var info :[String] = []
        for (k, v) in rowInfo{
            info += [" \(k) = \(v)"]
        }
        let sql = "update \(tableName) set \(info.joined(separator: ",")) where \(cond)"
        print(sql)
        
        if sqlite3_prepare_v2(self.db, (sql as NSString).utf8String, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE{
                return true
            }
            sqlite3_finalize(statement)
        }
        return false
    }
    
    //刪除資料
    func  delete(tableName :String, cond :String, value :String) -> Bool {
        var statement :OpaquePointer? = nil
        let sql = "delete from \(tableName) where \(cond) = \(value)"
        
        
        if sqlite3_prepare_v2(self.db, (sql as NSString).utf8String, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE{
                return true
            }
            sqlite3_finalize(statement)
        }
        return false
    }
}

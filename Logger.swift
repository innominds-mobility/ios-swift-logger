//
//  Logger.swift
//  Logger
//
//  Created by ndevalapally on 24/10/16.
//  Copyright © 2016 innominds. All rights reserved.
//

import UIKit

public enum LogLevel: Int {
    case verbose = 0
    case info
    case debug
    case error
}

/// Class that handles logging of information.
/// Probably have to make it singleton.
public class Logger {

    public  var logLevel: LogLevel = .debug

   /// Shared Instance
   public static let sharedInstance: Logger = {
        return Logger() //Lazy loading of singleton object.
    }()

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        //2017-03-22 15:27:00.012198
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSS"
        return formatter
    }()

    private init() {} // Make init as private

   /// Log information
   ///
   /// - Parameters:
   ///   - items: Items to be logged
   ///   - method: Method
   ///   - fileName: File Name (default)
   ///   - lineNumber: Line number (default)
   public func info(_ items:Any...,
                    method: String = #function,
                    fileName: String = #file,
                    lineNumber: Int = #line) {
        self.log(level: .info, items: items, method: method, fileName: fileName, lineNumber: lineNumber)
    }

   /// Debug
   ///
   /// - Parameters:
   ///   - items: Items to be logged
   ///   - method: Method Name
   ///   - fileName: File name
   ///   - lineNumber: Line number
   public func debug(_ items:Any...,
                     method: String = #function,
                     fileName: String = #file,
                     lineNumber: Int = #line) {
        self.log(level: .debug, items: items, method: method, fileName: fileName, lineNumber: lineNumber)
    }

   /// Log verbose
   ///
   /// - Parameters:
   ///   - items: <#items description#>
   ///   - method: <#method description#>
   ///   - fileName: <#fileName description#>
   ///   - lineNumber: <#lineNumber description#>
   public func verbose(_ items:Any...,
                       method: String = #function,
                       fileName: String = #file,
                       lineNumber: Int = #line) {
        self.log(level: .verbose, items: items, method: method, fileName: fileName, lineNumber: lineNumber)
    }

    /// Log error
    ///
    /// - Parameters:
    ///   - items: <#items description#>
    ///   - method: <#method description#>
    ///   - fileName: <#fileName description#>
    ///   - lineNumber: <#lineNumber description#>
    public func error(_ items:Any...,
                      method: String = #function,
                      fileName: String = #file,
                      lineNumber: Int = #line) {
        self.log(level: .error, items: items, method: method, fileName: fileName, lineNumber: lineNumber)
    }

   /// Base log function
   ///
   /// - Parameters:
   ///   - level: <#level description#>
   ///   - items: <#items description#>
   ///   - method: <#method description#>
   ///   - fileName: <#fileName description#>
   ///   - lineNumber: <#lineNumber description#>
   public func log(level: LogLevel, items:[Any], method: String, fileName: String, lineNumber: Int) {
        if level.rawValue >= self.logLevel.rawValue {
            if let lastComponent =  fileName.components(separatedBy: "/").last {
                print(self.dateFormatter.string(from: Date()), lastComponent, " [", lineNumber, "] ", method, items)
            } else {
                print(self.dateFormatter.string(from: Date()), fileName, " [", lineNumber, "] ", method, items)
            }
        }
    }

}

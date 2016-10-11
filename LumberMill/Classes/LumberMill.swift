//
//  Log.swift
//  PollingApp
//
//  Created by Odin on 2016-07-16.
//  Copyright © 2016 Gabriel Uribe. All rights reserved.
//

import Foundation

public class LumberMill {
    
    public static let version = "1.0.0"
    
    private class URLUtil {
        
        static func getNameFromStringPath(stringPath: String) -> String {
            //URL sees that "+" is a " "
            let stringPath = stringPath.stringByReplacingOccurrencesOfString(" ", withString: "+")
            let url = NSURL(string: stringPath)
            return url!.lastPathComponent!
        }
        
        static func getNameFromURL(url: NSURL) -> String {
            return url.lastPathComponent!
        }
    }
    
    public struct LevelColor {
        public var verbose = "💜 "      // silver
        public var debug = "💚 "       // green
        public var info = "💙 "         // blue
        public var warning = "💛 "     // yellow
        public var error = "❤️ "       // red
    }
    
    public enum LogLevelChoices {
        static let DEBUG = 1
        static let INFO = 2
        static let WARN = 3
        static let ERROR = 4
        static let TEST = 5
    }

    /// returns color string for level
    func colorForLevel(level: Int) -> String {
        var color = ""
        
        switch level {
            case 1:
                color = levelColor.debug
                
            case 2:
                color = levelColor.info
                
            case 3:
                color = levelColor.warning
                
            case 4:
                color = levelColor.error
                
            default:
                color = levelColor.verbose
        }
        return color
    }
    
    private var levelColor = LevelColor()
    private var minLogLevel: Int
    
    init() {
        levelColor.verbose = "💜 "     // silver
        levelColor.debug = "💚 "        // green
        levelColor.info = "💙 "         // blue
        levelColor.warning = "💛 "     // yellow
        levelColor.error = "❤️ "       // red
        
        minLogLevel = 1
    }
    
    init(minLogLevel: Int) {
        levelColor.verbose = "💜 "     // silver
        levelColor.debug = "💚 "        // green
        levelColor.info = "💙 "         // blue
        levelColor.warning = "💛 "     // yellow
        levelColor.error = "❤️ "       // red
        
        self.minLogLevel = minLogLevel
    }
    
    public func setMinLogLevel(logLevel: Int) {
        minLogLevel = logLevel
    }
    
    private var escape = ""
    
    
    /**
     Used for when you're doing tests. Testing log should be removed before commiting
     
     How to use: Log.test("this is my message")
     Output: 13:51:38.487 TEST  @@@@ in InputNameViewController.swift:addContainerToVC():77:: this is test
     
     To change the log level, visit the LogLevel enum
     
     - Parameter logMessage: The message to show
     - Parameter classPath: automatically generated based on the class that called this function
     - Parameter functionName: automatically generated based on the function that called this function
     - Parameter lineNumber: automatically generated based on the line that called this function
     */
    public func test(logMessage: String, classPath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        let fileName = URLUtil.getNameFromStringPath(classPath)
        if minLogLevel <= LogLevelChoices.TEST {
            print("\(NSDate().timeStamp()) " + escape + colorForLevel(LogLevelChoices.DEBUG) + "TEST in \(fileName):\(functionName):\(lineNumber):: \(logMessage)")
        }
    }
    
    /**
     Used when something catastrophic just happened. Like app about to crash, app state is inconsistent, or possible data corruption
     
     How to use: Log.error("this is error")
     Output: 13:51:38.487 ERROR #### in InputNameViewController.swift:addContainerToVC():76:: this is error
     
     To change the log level, visit the LogLevel enum
     
     - Parameter logMessage: The message to show
     - Parameter classPath: automatically generated based on the class that called this function
     - Parameter functionName: automatically generated based on the function that called this function
     - Parameter lineNumber: automatically generated based on the line that called this function
     */
    public func error(logMessage: String, classPath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        let fileName = URLUtil.getNameFromStringPath(classPath)
        if minLogLevel <= LogLevelChoices.ERROR {
            print("\(NSDate().timeStamp()) " + escape + colorForLevel(LogLevelChoices.DEBUG) + "ERROR in \(fileName):\(functionName):\(lineNumber):: \(logMessage)")
        }
    }
    
    /**
     Used when something went wrong, but the app can still function
     
     How to use: Log.warn("this is warn")
     Output: 13:51:38.487 WARN  ###  in InputNameViewController.swift:addContainerToVC():75:: this is warn
     
     To change the log level, visit the LogLevel enum
     
     - Parameter logMessage: The message to show
     - Parameter classPath: automatically generated based on the class that called this function
     - Parameter functionName: automatically generated based on the function that called this function
     - Parameter lineNumber: automatically generated based on the line that called this function
     */
    public func warn(logMessage: String, classPath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        let fileName = URLUtil.getNameFromStringPath(classPath)
        if minLogLevel <= LogLevelChoices.WARN {
            print("\(NSDate().timeStamp()) " + escape + colorForLevel(LogLevelChoices.DEBUG) + "WARN in \(fileName):\(functionName):\(lineNumber):: \(logMessage)")
        }
    }
    
    /**
     Used when you want to show information like username or question asked
     
     How to use: Log.info("this is info")
     Output: 13:51:38.486 INFO  ##   in InputNameViewController.swift:addContainerToVC():74:: this is info
     
     To change the log level, visit the LogLevel enum
     
     - Parameter logMessage: The message to show
     - Parameter classPath: automatically generated based on the class that called this function
     - Parameter functionName: automatically generated based on the function that called this function
     - Parameter lineNumber: automatically generated based on the line that called this function
     */
    public func info(logMessage: String, classPath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        let fileName = URLUtil.getNameFromStringPath(classPath)
        if minLogLevel <= LogLevelChoices.INFO {
            print("\(NSDate().timeStamp())" + escape + colorForLevel(LogLevelChoices.DEBUG) + "INFO in \(fileName):\(functionName):\(lineNumber):: \(logMessage)")
        }
    }
    
    /**
     Used for when you're rebugging and you want to follow what's happening/.
     
     How to use: Log.debug("this is debug")
     Output: 13:51:38.485 DEBUG #    in InputNameViewController.swift:addContainerToVC():73:: this is debug
     
     To change the log level, visit the LogLevel enum
     
     - Parameter logMessage: The message to show
     - Parameter classPath: automatically generated based on the class that called this function
     - Parameter functionName: automatically generated based on the function that called this function
     - Parameter lineNumber: automatically generated based on the line that called this function
     */
    public func debug(logMessage: String, classPath: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        let fileName = URLUtil.getNameFromStringPath(classPath)
        if minLogLevel <= LogLevelChoices.DEBUG {
            print( "\(NSDate().timeStamp())" + escape + colorForLevel(LogLevelChoices.DEBUG) + "DEBUG in \(fileName):\(functionName):\(lineNumber):: \(logMessage)")
        }
    }
}


extension NSDate {
    
    func hour() -> Int {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Hour, fromDate: self)
        let hour = components.hour
        return hour
    }
    
    
    func minute() -> Int {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Minute, fromDate: self)
        let minute = components.minute
        return minute
    }
    
    func timeStamp() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm:ss.SSS"
        return formatter.stringFromDate(self)
    }
    
    func timeStampAMPM() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "h:mm a"
        formatter.AMSymbol = "AM"
        formatter.PMSymbol = "PM"
        
        return formatter.stringFromDate(self)
    }
    
    func detailedTimeStamp() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "h:mm a 'on' EEEE, MMM d"
        formatter.AMSymbol = "AM"
        formatter.PMSymbol = "PM"
        
        
        return formatter.stringFromDate(self)
    }
}

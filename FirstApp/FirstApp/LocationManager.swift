//
//  LocationManager.swift
//  FirstApp
//
//  Created by Arpit on 23/04/24.
//

// factory pattern
// Singlton Pattern


import Foundation

class FAFileManager: NSObject {
    
    static let shared: FAFileManager = {
        let instance = FAFileManager()
        return instance
    }()
    // static let shared: FAFileManager = FAFileManager()
    
    private override init() {
        super.init()
    }
    
    // URI vs URL
    // ftp://jkfjkd/dkfjd // URI
    // https://
    func getDocumentDirectory() -> URL?
    {
        if let docDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            return docDirectoryURL
        }
        return nil
    }
    
    func libraryDirectoryPath() -> URL? {
        if let libraryDirectoryURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.libraryDirectory, in: .userDomainMask).first {
            return libraryDirectoryURL
        }
        return nil
    }
    
    func tempDirectoryPath() -> URL {
        return FileManager.default.temporaryDirectory
    }
    
    /*
      - isWritable
      - isReadble
      - isExists
     */
    
    func isWritable(file atPath: URL) -> Bool {
        return FileManager.default.isWritableFile(atPath: atPath.path)
    }
    
    func isReadable(file atPath: URL) -> Bool {
        return FileManager.default.isReadableFile(atPath: atPath.path)
    }
    
    func isExist(file atPath: URL) -> Bool {
        return FileManager.default.fileExists(atPath: atPath.path)
    }
    
    /*
       Directory (folder)
        - create directory (folder) - DONE
        - get-all-file
        - delete file
        - create file (write a file) - DONE
        - read file - In Progress
        - Update file (delete old file, create new file with same name)
        - move file
        - rename file
     */
    
    func writeFileIn(containingString: String, to path: URL, with name: String) -> Bool {
        let filePath = path.path
        let completePath = filePath + "/" + name
        let data: Data? = containingString.data(using: .utf8)
        return FileManager.default.createFile(atPath: completePath, contents: data, attributes: nil)
    }
    
    func writeFileIn(containingData: Data, to path: URL, with name: String) -> Bool {
        let filePath = path.path
        let completePath = filePath + "/" + name
        return FileManager.default.createFile(atPath: completePath, contents: containingData, attributes: nil)
    }
    
    func writeFileIn(folder: String, containingData: Data, to path: URL, with name: String) -> Bool {
        let filePath = path.path + "/" + folder + "/" + name
        if self.writeDirectory(folder: folder, to: path) {}
        return FileManager.default.createFile(atPath: filePath, contents: containingData, attributes: nil)
    }
    
    func writeDirectory(folder: String, to path: URL) -> Bool {
        
        let filePath = path.path + "/" + folder
        if let documentDirectory = self.getDocumentDirectory() {
            let path = documentDirectory.appendingPathComponent(folder)
            if !self.isExist(file: path) {
                do {
                    try FileManager.default.createDirectory(at: path, withIntermediateDirectories: true, attributes: nil)
                    return true
                }
                catch {
                    print(error)
                }
            }
        }
        
        return false
    }
    
    func readFile(at path: URL, withName: String) -> String? {
        
        let completePath = path.path + "/" + withName
        if let fileContent = FileManager.default.contents(atPath: completePath) {
            if let fileStringData = String(bytes: fileContent, encoding: .utf8) {
                return fileStringData
            }
        }
        return nil
    }
    
    func readFile(at path: URL, withNameForData: String) -> Data? {
        
        let completePath = path.path + "/" + withNameForData
        if let fileContent = FileManager.default.contents(atPath: completePath) {
            return fileContent
        }

        return nil
    }
    
    
    
    
}



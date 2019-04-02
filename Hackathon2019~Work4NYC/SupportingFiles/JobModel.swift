//
//  JobModel.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/28/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation
final class JobModel {
    private static let filename = "job.plist"
    static var favoriteJobs = [Job]()
    private init() {}
    
    static func saveJob() {
        let path = DataPersistenceManager.filepathToDcoumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(favoriteJobs)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    static func addJob(job: Job) {
        favoriteJobs.append(job)
        saveJob()
    }
    static func getJob() -> [Job] {
        let path = DataPersistenceManager.filepathToDcoumentsDirectory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    favoriteJobs = try PropertyListDecoder().decode([Job].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            }
        } else {
            print("\(filename) does not exist")
        }
        return favoriteJobs
    }
    static func deleteJob(index: Int) {
        favoriteJobs.remove(at: index)
        saveJob()
    }
}


//
//  JobAPIClient.swift
//  Hackathon2019~Work4NYC
//
//  Created by Biron Su on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation
final class JobAPIClient {
    static func getJobs(keyword: String, completionHandler: @escaping (AppError?, [Job]?) -> Void) {
        let getJobsEndpoint = "https://data.cityofnewyork.us/resource/kpav-sd4t.json?$q=\(keyword)"
        NetworkHelper.shared.performDataTask(endpointURLString: getJobsEndpoint) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            } else if let data = data {
                do {
                    let jobs = try JSONDecoder().decode([Job].self, from: data)
                    completionHandler(nil,jobs)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}

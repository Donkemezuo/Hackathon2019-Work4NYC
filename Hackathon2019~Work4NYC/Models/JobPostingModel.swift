//
//  JobPostingModel.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/27/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

struct Job: Codable {
    let agency: String
    let business_title: String
    let job_description: String
    let job_id: String
    let full_time_part_time_indicator: String
    let minimum_qual_requirements: String
    let salary_frequency: String
    let salary_range_from: String
    let salary_range_to: String
    let work_location: String
}

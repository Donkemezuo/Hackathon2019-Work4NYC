//
//  ReminderViewController.swift
//  Hackathon2019~Work4NYC
//
//  Created by Donkemezuo Raymond Tariladou on 3/28/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit
import UserNotifications
class ReminderViewController: UIViewController {

    let reminderView = ReminderView()
    var job: Job!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(reminderView)
        UNUserNotificationCenter.current().delegate = self
        reminderView.delegate = self
    }
    


}

extension ReminderViewController: ReminderButtonsDelegates {
    func okayPressed(datePicker: UIDatePicker) {
        let content = UNMutableNotificationContent()
        
        content.title = NSString.localizedUserNotificationString(forKey: job.business_title, arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Don't forget to apply", arguments: nil)
        content.sound = UNNotificationSound.default
        let date = datePicker.date
        let calendar = Calendar.current //gregorian calendar
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        // create a date component
        var dateComponent = DateComponents()
        dateComponent.hour = hour
        dateComponent.minute = minutes
        dateComponent.timeZone = TimeZone.current
        //create notification trigger
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        //create notification request
        let request = UNNotificationRequest(identifier: "To do list Alert", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("notification delivery error: \(error)")
            } else {
                print("successfully added notification")
            }
        }
        showAlert(title: "Reminder set", message: nil)
        dismiss(animated: true)
    }
    
    
    func cancelPressed() {
        dismiss(animated: true)
    }
    
    
}
extension ReminderViewController: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
}

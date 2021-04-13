//
//  WaintingRoomControls.swift
//  videoLlamada
//
//  Created by Gio Valdes on 15/03/21.
//

import UIKit
import DateScrollPicker

extension WaintingRoom: ControlsDelegate, ZoomDelegate
{
    
    
    
    func gotoWaintingRoom()
    {
        print("goto waintig room")
        
        self.dismiss(animated: true, completion: nil)
        
//        presentingViewController?.dismiss(animated: true, completion: {
//            let waintingRoomController = ViewController()
//            waintingRoomController.modalTransitionStyle = .crossDissolve
//            self.present(waintingRoomController, animated: true, completion: nil)
//        })
        
    }
    
    
    
    
    func gotoCall()
    {
        print("goto room")
        
        
        
        let zoomController = ZoomController()
        zoomController.modalPresentationStyle = .fullScreen
        zoomController.modalTransitionStyle = .crossDissolve
        zoomController.delegate = self
        zoomController.meetingNo = Manager.instance.selectedMeeting?.meetingNo ?? ""
        zoomController.pass = Manager.instance.selectedMeeting?.pass ?? ""
        zoomController.kSDKUserName = Manager.instance.userName
        self.present(zoomController, animated: true, completion: nil)
        
    }
    
    
    
    @objc func goWeekLess(_ gesture:UITapGestureRecognizer)
    {
        scrollDay = scrollDay?.addDays(-7)
        dateScrollPicker.scrollToDate(date: scrollDay ?? Date())
        
        initWeek = scrollDay?.addDays(-3) ?? Date()
        finishWeek = scrollDay?.addDays(3) ?? Date()
        
        let finalStr = formatter.string(from: initWeek )  + " - " + formatter.string(from: finishWeek )
        labelWeeks.text = finalStr
    }
    
    
    @objc func goWeekMore(_ gesture:UITapGestureRecognizer)
    {
        scrollDay = scrollDay?.addDays(7)
        dateScrollPicker.scrollToDate(date: scrollDay ?? Date())
        
        initWeek = scrollDay?.addDays(-3) ?? Date()
        finishWeek = scrollDay?.addDays(3) ?? Date()
        
        let finalStr = formatter.string(from: initWeek )  + " - " + formatter.string(from: finishWeek )
        labelWeeks.text = finalStr
    }
    
    
    public func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, didSelectDate date: Date)
    {
        Manager.instance.meetingArr.removeAll()
        Manager.instance.selectedDates.removeAll()
        
//        let firebaseData = MeetingsFirebase()
//        firebaseData.getMeeting(userId: 0, date: date, completion: {(completed, arr) in
//            if(completed)
//            {
//                Manager.instance.meetingArr = arr
//                self.calendarList.reloadData()
//            }else{
//                self.calendarList.reloadData()
//            }
//        })
    }
}

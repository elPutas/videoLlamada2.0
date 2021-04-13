//
//  Manager.swift
//  videoLlamada
//
//  Created by Gio Valdes on 17/03/21.
//

import UIKit


class Manager {
    
    
    static let instance     = Manager()
    init(){}
    
    var userName = ""
    
    var imgUser = ""
    var selectedDates:[Int] = []
    var meetingArr:[Meeting] = []
    var selectedMeeting:Meeting?

}

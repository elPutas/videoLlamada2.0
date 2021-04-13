//
//  WaintingRoom.swift
//  videoLlamada
//
//  Created by Gio Valdes on 15/03/21.
//

import UIKit
import DateScrollPicker


public class WaintingRoom:UIViewController, UITableViewDataSource
{
   
    
    let cellView = "cellView"
    var initDay : Date?
    var scrollDay : Date?
    
    var initWeek:Date = Date()
    var finishWeek:Date = Date()
    
    
    
    let _width = UIScreen.main.bounds.width
    let _height = UIScreen.main.bounds.height
    
    let heightCollapseConatiner = 100
    
    let icon_mic : UIImageView = {
        let pic = UIImageView()
        pic.image = UIImage(named: "icon_mic")
        pic.layer.masksToBounds = true
        pic.clipsToBounds = true
        pic.layer.cornerRadius = 23
        pic.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        pic.translatesAutoresizingMaskIntoConstraints = false
        
        return pic
    }()
    
    
    let btnLeft:UIButton = {
        let btn = UIButton(frame: CGRect(x: 25, y: 70, width: 30, height: 30))
        btn.setImage(UIImage(named: "btn_week"), for: .normal)
        return btn
    }()
    
    let btnRight:UIButton = {
        let _width = UIScreen.main.bounds.width
        let btn = UIButton(frame: CGRect(x: _width - (25+30), y: 70, width: 30, height: 30))
        let image = UIImage(named: "btn_week")
        let newImage = image?.rotate(radians: 3.14159) // Rotate 180 degrees
        btn.setImage(newImage, for: .normal)
        return btn
    }()
    
    let labelWeeks : UILabel = {
        let _width = UIScreen.main.bounds.width
        let label = UILabel(frame: CGRect(x: (_width/2) - 150, y: 65, width: 300, height: 40))
        label.textAlignment = .center
        label.textColor = .blue
        label.text = "0000 - 0000"
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    let divider1:UIView = {
        let _width = UIScreen.main.bounds.width
        let view = UIView(frame: CGRect(x: 0, y: 55, width: _width, height: 1))
        view.backgroundColor = .darkGray//.separator
        return view
    }()
    let divider2:UIView = {
        let _width = UIScreen.main.bounds.width
        let view = UIView(frame: CGRect(x: 0, y: 115, width: _width, height: 1))
        view.backgroundColor = .darkGray//.separator
        return view
    }()
    
    
    
    let formatter = DateFormatter()
    
    lazy var calendarList : UITableView = {
        let _height = UIScreen.main.bounds.height
        let _width = UIScreen.main.bounds.width
        let tableView = UITableView(frame: CGRect(x: 0, y: 200, width: _width, height: _height - 200))
        tableView.register(CalendarCellView.self, forCellReuseIdentifier: cellView)
        tableView.backgroundColor = .lightBlue
        tableView.separatorColor = .lightBlue
        
        return tableView
    }()
    
    
    let dateScrollPicker = DateScrollPicker()
    
    let header = Header(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 55))
    //let calendarViewList = CalendarViewList().tableView
    
    public override func viewDidLoad()
    {
        view.backgroundColor = .white
        formatter.dateFormat = "MMM d, y"
        
        setUpCalendar()
        setUpButtons()
        
        initDay = Date.today()
        scrollDay = initDay
        calendarList.delegate = self
        calendarList.dataSource = self
        
        view.addSubview(calendarList)
        view.addSubview(btnLeft)
        view.addSubview(btnRight)
        view.addSubview(labelWeeks)
        view.addSubview(dateScrollPicker)
        
        view.addSubview(divider1)
        view.addSubview(divider2)
        
        view.addSubview(header)
        
        
        
    }
    
    @objc func goToMeet(sender:MyViewGesture)
    {
        print("click \(sender)")
        
    }
    
    func setUpButtons()
    {
        btnLeft.isUserInteractionEnabled = true
        btnRight.isUserInteractionEnabled = true
        
        let tapLeft = UITapGestureRecognizer(target: self, action: #selector(goWeekLess(_:)))
        let tapRight = UITapGestureRecognizer(target: self, action: #selector(goWeekMore(_:)))
        
        btnLeft.addGestureRecognizer(tapLeft)
        btnRight.addGestureRecognizer(tapRight)
    }
    
    
}


class MyViewGesture: UITapGestureRecognizer {
    var posView = 0
}



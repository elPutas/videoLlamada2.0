//
//  ViewController.swift
//  videoLlamadaTest
//
//  Created by Gio Valdes on 24/02/21.
//

import UIKit
import MobileRTC


public class ViewController: UIViewController
{
    var userId:UInt?
    
    let icon_mic : UIImageView = {
        let pic = UIImageView()
        pic.image = UIImage(named: "icon_mic")
        pic.layer.masksToBounds = true
        pic.clipsToBounds = true
        pic.layer.cornerRadius = 23
        pic.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
        pic.translatesAutoresizingMaskIntoConstraints = false
        
        return pic
    }()
    
    
    
    public override func viewDidLoad()
    {
        super.viewDidLoad()
        
        initWaintingRoom()
    }
    
    func initWaintingRoom()
    {
        let waintingRoomController = WaintingRoom()
        
        waintingRoomController.modalPresentationStyle = .fullScreen
        waintingRoomController.modalTransitionStyle = .crossDissolve
        self.present(waintingRoomController, animated: true, completion: nil)
    }
    
    func initRoom()
    {
        let zoomController = ZoomController()
        zoomController.modalPresentationStyle = .fullScreen
        zoomController.modalTransitionStyle = .crossDissolve
        self.present(zoomController, animated: true, completion: nil)
    }
    
    
    
}


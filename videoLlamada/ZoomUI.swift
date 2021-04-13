//
//  ZoomUI.swift
//  videoLlamadaTest
//
//  Created by Gio Valdes on 8/03/21.
//

import UIKit
import MobileRTC

public class ZoomUI: UIViewController
{
    
    var contentView : UIView?
    
    
    var isMute: Bool = false
    var isOffVideo: Bool = false
    var isHandRaise: Bool = false
    let h_header = 60
    
    let header : UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
        view.backgroundColor = .gray
        return view
    }()
    
    let footer : UIView = {
        let view = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 90, width: UIScreen.main.bounds.width, height: 80))
        view.backgroundColor = .gray
        
        return view
    }()
    
    let screenShareView : UIView = {
        let posY = (UIScreen.main.bounds.height/2) - 70
        let view = UIView(frame: CGRect(x: 0, y: posY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2))
        //view.backgroundColor = .white
        return view
    }()
    
    let hostCameraView : UIView = {
        let h = (UIScreen.main.bounds.height/2) - 70
        let initPos = (UIScreen.main.bounds.height/2) - (h/2)
        let view = UIView(frame: CGRect(x: 0, y: initPos, width: UIScreen.main.bounds.width, height: h))
        //view.backgroundColor = .white
        return view
    }()
    let userCameraView : UIView = {
        let view = UIView(frame: CGRect(x: UIScreen.main.bounds.width - 150, y: 70, width: 117, height: 117))
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    let buttonSize = 60
    
    let icon_mic : UIButton = {
        let pic = UIButton()
        let gap = CGFloat(130)
        let pos = (UIScreen.main.bounds.width / 2) - gap
        pic.frame = CGRect(x: pos, y: 10, width: 60, height: 60)
        pic.setImage(UIImage(named: "icon_mic"), for: .normal)
        pic.setImage(UIImage(named: "mic_off"), for: .selected)
        pic.translatesAutoresizingMaskIntoConstraints = false
        
        return pic
    }()
   
    let icon_video : UIButton = {
        let pic = UIButton()
        let gap = CGFloat(60)
        let pos = (UIScreen.main.bounds.width / 2) - gap
        pic.frame = CGRect(x: pos, y: 10, width: 60, height: 60)
        pic.setImage(UIImage(named: "icon_video"), for: .selected)
        pic.setImage(UIImage(named: "video_off"), for: .normal)
        pic.translatesAutoresizingMaskIntoConstraints = false
        
        return pic
    }()
    
    let icon_hand : UIButton = {
        let pic = UIButton()
        let gap = CGFloat(-10)
        let pos = (UIScreen.main.bounds.width / 2) - gap
        pic.frame = CGRect(x: pos, y: 10, width: 60, height: 60)
        pic.setImage(UIImage(named: "icon_hand"), for: .normal)
        pic.setImage(UIImage(named: "hand_raise"), for: .selected)
        pic.translatesAutoresizingMaskIntoConstraints = false
        
        return pic
    }()
    
    
    let icon_leave : UIButton = {
        let pic = UIButton()
        let gap = CGFloat(-80)
        let pos = (UIScreen.main.bounds.width / 2) - gap
        pic.frame = CGRect(x: pos, y: 10, width: 60, height: 60)
        pic.setImage(UIImage(named: "icon_leave"), for: .normal)
        pic.translatesAutoresizingMaskIntoConstraints = false
        
        return pic
    }()
    let screenSize = UIScreen.main.bounds
  
    
    
//    var hostCameraView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
//    var userCameraView = UIView(frame: CGRect(x: UIScreen.main.bounds.width - 150, y: 70, width: 117, height: 117))
    
    
    public override func viewDidLoad()
    {
        contentView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        view.addSubview(contentView!)
        
        refreshHostVideo()
        refreshUserVideo()
        refreshScreenShareVideo()
        
        icon_mic.isUserInteractionEnabled = true
        icon_video.isUserInteractionEnabled = true
        icon_hand.isUserInteractionEnabled = true
        icon_leave.isUserInteractionEnabled = true
        
        let tapMic = UITapGestureRecognizer(target: self, action: #selector(changeMic(_:)))
        let tapVideo = UITapGestureRecognizer(target: self, action: #selector(changeVideo(_:)))
        let tapHand = UITapGestureRecognizer(target: self, action: #selector(changeHand(_:)))
        let tapLeave = UITapGestureRecognizer(target: self, action: #selector(changeLeave(_:)))
        
        icon_mic.addGestureRecognizer(tapMic)
        icon_video.addGestureRecognizer(tapVideo)
        icon_hand.addGestureRecognizer(tapHand)
        icon_leave.addGestureRecognizer(tapLeave)
        
        setupViews()
    }
    
    private func setupViews()
    {
        view.addSubview(screenShareView)
        view.addSubview(hostCameraView)
        view.addSubview(userCameraView)
        view.addSubview(header)
        view.addSubview(footer)
        
        footer.addSubview(icon_mic)
        footer.addSubview(icon_video)
        footer.addSubview(icon_hand)
        footer.addSubview(icon_leave)
        
        
    }
    
    
    
    
}

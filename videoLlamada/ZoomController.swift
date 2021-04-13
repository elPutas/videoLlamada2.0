//
//  ZoomController.swift
//  videoLlamadaTest
//
//  Created by Gio Valdes on 15/03/21.
//

import UIKit
import MobileRTC

protocol ZoomDelegate {
    func gotoWaintingRoom()
}


public class ZoomController: UIViewController, MobileRTCCustomizedUIMeetingDelegate, MobileRTCMeetingServiceDelegate
{
    
    
    var delegate : ZoomDelegate?
    
    var customMeetingVC :UIViewController = ZoomUI()
    var sizeVideo:CGSize?
    var userCameraView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
    
    var meetingNo = Manager.instance.selectedMeeting?.meetingNo ?? ""
    var pass = Manager.instance.selectedMeeting?.pass ?? ""
    var kSDKUserName = Manager.instance.userName
    let jwt = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBLZXkiOiJJNWlWS1VqUUVucERhSkRWZ1hUSEx4QWZIZnpLaHJWQVV2cVEiLCJpYXQiOjAsImV4cCI6MCwidG9rZW5FeHAiOjB9.ZYrvzJe5ezevsgqa48ExiyGAKwbTNMUflfWdB2ePFKU"
    
    
    var participantView:MobileRTCVideoView?
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
        view.backgroundColor = .black
        // Do any additional setup after loading the view.super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0)
        {
            self.login()
        }
        
        
        //testing
//        let content = ZoomUI()
//        content.modalPresentationStyle = .overCurrentContext
//        content.modalTransitionStyle = .crossDissolve
//        self.present(content, animated: true, completion: nil)
        
    }
    
    func login()
    {
        if(self.meetingNo == "") {
            // If the meeting number is empty, return error.
            print("Please enter a meeting number")
            self.dismiss(animated: true, completion: nil)
            return
        } else {
            // If the meeting number is not empty.
            
            MobileRTC.shared().getMeetingSettings()?.enableCustomMeeting = true
            MobileRTC.shared().getMeetingSettings()?.bottomBarHidden = true
            MobileRTC.shared().getMeetingSettings()?.topBarHidden = true
            MobileRTC.shared().getMeetingSettings()?.setMuteAudioWhenJoinMeeting(false)
            MobileRTC.shared().getMeetingSettings()?.setMuteVideoWhenJoinMeeting(false)
            MobileRTC.shared().getMeetingSettings()?.meetingVideoHidden = false
            MobileRTC.shared().getMeetingSettings()?.showVideoPreviewWhenJoinMeetingDisabled()
            MobileRTC.shared().getMeetingSettings()?.showMyMeetingElapseTime()
            MobileRTC.shared().getMeetingSettings()?.disableShowVideoPreview(whenJoinMeeting: false)
            MobileRTC.shared().getMeetingSettings()?.setAutoConnectInternetAudio(true)
            
            guard let getservice = MobileRTC.shared().getMeetingService() else {return}
            getservice.customizedUImeetingDelegate = self
            getservice.delegate = self
            userId = getservice.myselfUserID()
            
            let user = MobileRTCMeetingJoinParam()
            user.meetingNumber = meetingNo
            user.userName = kSDKUserName
            user.password = pass
            user.zak = jwt
            user.participantID = "610"
            
            sizeVideo = getservice.getUserVideoSize((MobileRTC.shared().getMeetingService()?.myselfUserID())!)
        
        
            
            let response = getservice.joinMeeting(with: user)
            print("onJoinMeeting, response: \(response)")
                
            
        }
    }
    
    
    public func onInitMeetingView() {
        print("start meeting")
        
        //view.addSubview(userCameraView)
        
        
    }
    
    public func onDestroyMeetingView() {
        print("meeting over")
        
        //self.dismiss(animated: false, completion: nil)
        presentingViewController?.dismiss(animated: false, completion: nil)
        delegate?.gotoWaintingRoom()
        
    }
    
    public func onMeetingStateChange(_ state: MobileRTCMeetingState)
    {
        
        switch state
        {
            case .inMeeting:
                let content = ZoomUI()
                content.modalPresentationStyle = .overCurrentContext
                content.modalTransitionStyle = .crossDissolve
                self.present(content, animated: false, completion: nil)
                
                
            default:
                print("\(state)")
        }
    }
    
}


//
//  ZoomControls.swift
//  videoLlamadaTest
//
//  Created by Gio Valdes on 12/03/21.
//

import UIKit
import MobileRTC

extension ZoomUI:  MobileRTCShareServiceDelegate
{
    
    
    public func onAppShareSplash() {
        print("onAppShareSplash")
    }
    
    public func onSinkMeetingActiveShare(_ userID: UInt) {
        print("onSinkMeetingActiveShare")
        
        if userID == 0{
            viewModeHost()
        }else{
            viewModeShare()
        }
    }
    
    public func onSinkMeetingShareReceiving(_ userID: UInt) {
        print("onSinkMeetingShareReceiving")
    }
    
    public func onSinkShareSizeChange(_ userID: UInt) {
        print("onSinkShareSizeChange")
    }
    
    
    func viewModeHost()
    {
        let h = (UIScreen.main.bounds.height/2) - 70
        let posY = (h/2)
        let originalTransform = self.hostCameraView.transform
        let scaledAndTranslatedTransform = originalTransform.translatedBy(x: 0.0, y: posY)
            UIView.animate(withDuration: 0.7, animations: {
                self.hostCameraView.transform = scaledAndTranslatedTransform
            })
    }
    func viewModeShare()
    {
        let h = (UIScreen.main.bounds.height/2) - 70
        let posY = -(h/2)
        let originalTransform = self.hostCameraView.transform
        let scaledAndTranslatedTransform = originalTransform.translatedBy(x: 0.0, y: CGFloat(posY))
            UIView.animate(withDuration: 0.7, animations: {
                self.hostCameraView.transform = scaledAndTranslatedTransform
            })
    }
    
    
    
    public func onMeetingStateChange(_ state: MobileRTCMeetingState)
    {
        
        switch state
        {
            case .inMeeting:
                let content = ZoomUI()
                content.modalPresentationStyle = .overCurrentContext
                content.modalTransitionStyle = .crossDissolve
                self.present(content, animated: true, completion: nil)
                
                
                
                
            default:
                print("\(state)")
        }
    }
    
    func update_mic()
    {
        
    }
    
    //MARK: VIDEO
    func refreshScreenShareVideo()
    {
        if let hostID = MobileRTC.shared().getMeetingService()?.activeUserID()
        {
            
            let videoView = MobileRTCActiveShareView(frame: screenShareView.bounds)
            screenShareView.addSubview(videoView)
            videoView.showActiveShare(withUserID: hostID)
            
        }
        guard let getservice = MobileRTC.shared().getMeetingService() else {return}
        
        getservice.delegate = self
    }
    func refreshHostVideo()
    {
        if let hostID = MobileRTC.shared().getMeetingService()?.activeUserID() {
            let videoView = MobileRTCVideoView(frame: hostCameraView.bounds)
            videoView.setVideoAspect(MobileRTCVideoAspect_PanAndScan)
            
            hostCameraView.addSubview(videoView)
            videoView.showAttendeeVideo(withUserID: hostID)
            
            
        }
    }
    
    func refreshUserVideo()
    {
        if let userID = MobileRTC.shared().getMeetingService()?.myselfUserID()
        {
            let videoView = MobileRTCVideoView(frame: userCameraView.bounds)
            userCameraView.addSubview(videoView)
            videoView.setVideoAspect(MobileRTCVideoAspect_PanAndScan)
            
            videoView.showAttendeeVideo(withUserID: userID)
            
        }
    }
    
    
    //MARK: ACTION BUTTONS
    @objc func changeMic(_ gesture:UITapGestureRecognizer)
    {
        guard let getservice = MobileRTC.shared().getMeetingService() else {return}
        isMute = !isMute
        icon_mic.isSelected = isMute
        getservice.muteMyAudio(isMute)
            
    }
    
    @objc func changeVideo(_ gesture:UITapGestureRecognizer)
    {
        guard let getservice = MobileRTC.shared().getMeetingService() else {return}
        isOffVideo = !isOffVideo
        icon_video.isSelected = isOffVideo
        getservice.switchMyCamera()
        getservice.muteMyVideo(false)
        //print("\(getservice.isSendingMyVideo())")
        
        refreshUserVideo()
    }
    
    @objc func changeHand(_ gesture:UITapGestureRecognizer)
    {
        
        isHandRaise = !isHandRaise
        icon_hand.isSelected = isHandRaise
        guard let getservice = MobileRTC.shared().getMeetingService() else {return}
        
        if isHandRaise
        {
            getservice.raiseMyHand()
        }
        
        
    }
    
    @objc func changeLeave(_ gesture:UITapGestureRecognizer)
    {
        guard let getservice = MobileRTC.shared().getMeetingService() else {return}
        getservice.leaveMeeting(with: LeaveMeetingCmd(rawValue: 0)!)
        
    }
    
}

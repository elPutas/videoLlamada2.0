//
//  Header.swift
//  videoLlamada
//
//  Created by Gio Valdes on 31/03/21.
//

import UIKit
//import SDWebImage

class Header: UIView
{
    
    let img_user : UIImageView = {
        let _width = UIScreen.main.bounds.width
        let pic = UIImageView(frame: CGRect(x: _width - 140, y: 10, width: 40, height: 40))
        pic.layer.masksToBounds = true
        pic.clipsToBounds = true
        pic.layer.cornerRadius = 20
        pic.backgroundColor = .gray
        return pic
    }()
    
    let separator : UIView = {
        let _width = UIScreen.main.bounds.width
        let view = UIView(frame: CGRect(x: _width - 90, y: 10, width: 1, height: 40))
        view.backgroundColor = .darkGray//.separator
        return view
    }()
    
    let logo_app : UIImageView = {
        let _width = UIScreen.main.bounds.width
        let pic = UIImageView(frame: CGRect(x: _width - 70, y: 15, width: 30, height: 30))
        pic.image = UIImage(named: "ico_videollamada")
        return pic
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit()
    {
        //img_user.sd_setImage(with: NSURL(string: Manager.instance.imgUser)! as URL, placeholderImage: UIImage(named:"user-default"), options: [.continueInBackground])
        
        self.backgroundColor = .lightGray
        
        self.addSubview(logo_app)
        self.addSubview(img_user)
        self.addSubview(separator)
    }
}

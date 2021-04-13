//
//  CalendarAppointmentView.swift
//  videoLlamada
//
//  Created by Gio Valdes on 16/03/21.
//

import UIKit

protocol ControlsDelegate {
  func gotoCall()
}


public class CalendarCellView: UITableViewCell
{
    var delegate: ControlsDelegate?
    
    let _width = UIScreen.main.bounds.width
    
    let containerCollapse :UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
   
    let containerFull :UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let img_host : UIImageView = {
        let pic = UIImageView(frame: CGRect(x: 20, y: 20, width: 40, height: 40))
        pic.layer.masksToBounds = true
        pic.clipsToBounds = true
        pic.layer.cornerRadius = 20
        pic.backgroundColor = .gray
        
        return pic
    }()
    
    
    let name_host : UILabel = {
        let label = UILabel(frame: CGRect(x: 70, y: 20, width: 200, height: 40))
        label.textAlignment = .left
        label.textColor = .black
        label.text = "Carlos Ramirez"
        label.font = UIFont.systemFont(ofSize: 18.0)
        return label
    }()
    
    let ico_clock : UIImageView = {
        let img = UIImageView(frame: CGRect(x: 20, y: 70, width: 10, height: 10))
        img.image = UIImage(named: "ico_clock")
        return img
    }()
    let ico_clock_ex : UIImageView = {
        let img = UIImageView(frame: CGRect(x: 20, y: 226, width: 10, height: 10))
        img.image = UIImage(named: "ico_clock")
        return img
    }()
    
    let ico_people : UIImageView = {
        let img = UIImageView(frame: CGRect(x: 20, y: 246, width: 10, height: 10))
        img.image = UIImage(named: "ico_people")
        return img
    }()
    
    let btn_test : UIButton = {
        let _width = UIScreen.main.bounds.width
        let img = UIButton(frame: CGRect(x: _width - 70, y: 40, width: 30, height: 30))
        img.setImage(UIImage(named: "icon_leave"), for: .normal)
        return img
    }()
    
    let btn_arrow : UIButton = {
        let _width = UIScreen.main.bounds.width
        let img = UIButton(frame: CGRect(x: _width - 70, y: 10, width: 30, height: 30))
        img.setImage(UIImage(named: "arrow_dwn"), for: .normal)
        img.setImage(UIImage(named: "arrow_up"), for: .selected)
        return img
    }()
    
    let titleTruncate:UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 5, width: 200, height: 40))
        label.textAlignment = .left
        label.textColor = .black
        label.text = "Física básica de aceleración de partículas interdimensionales avanzadas"
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    let infoCollapse:UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 22, width: 300, height: 40))
        label.textAlignment = .left
        label.textColor = .darkGray
        label.text = "Grupo 5-B"
        label.font = UIFont.systemFont(ofSize: 11.0)
        return label
    }()
    
    let infoDateCollapase:UILabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 55, width: 300, height: 40))
        label.textAlignment = .left
        label.textColor = .darkGray
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.text = "7:00 - 8:00 am"
        label.font = UIFont.systemFont(ofSize: 11.0)
        return label
    }()
    
    let infoDateFull:UILabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 210, width: 300, height: 40))
        label.textAlignment = .left
        label.textColor = .darkGray
        label.numberOfLines = 1
        label.text = "Miércoles, 15 de abril ⋅ 7:00 - 8:00 am"
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    let infoPeopleFull:UILabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 230, width: 300, height: 40))
        label.textAlignment = .left
        label.textColor = .darkGray
        label.numberOfLines = 1
        label.text = "20 Invitados"
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    let fullTitle:UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 60, width: 300, height: 150))
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 4
        label.text = "Física básica de aceleración de partículas interdimensionales avanzadas"
        label.font = UIFont.systemFont(ofSize: 18.0)
        return label
    }()
    
    var isOpen = false{
        didSet{
            openCard()
        }
    }
    
    let bgContainer = UIView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .white
        setupViews()
        contentView.backgroundColor = .lightBlue
        
        let tapGo = UITapGestureRecognizer(target: self, action: #selector(gotoCall(_:)))
        btn_test.addGestureRecognizer(tapGo)
    }
    
    @objc func gotoCall(_ gesture:UITapGestureRecognizer)
    {
        print("goto call")
        delegate?.gotoCall()
        
    }
    
    func openCard()
    {
        containerCollapse.isHidden = isOpen
        containerFull.isHidden = !isOpen
        btn_arrow.isSelected = isOpen
    }
    
    func setupViews()
    {
        bgContainer.layer.shadowColor = UIColor.black.cgColor
        bgContainer.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        bgContainer.layer.shadowOpacity = 0.8
        bgContainer.layer.shadowRadius = 2
        
        bgContainer.backgroundColor = .white
        bgContainer.layer.cornerRadius = 15
        if #available(iOS 13.0, *) {
            bgContainer.layer.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        } else {
            // Fallback on earlier versions
        }
        bgContainer.isUserInteractionEnabled = true
        
        bgContainer.layer.shouldRasterize = false

        self.contentView.addSubview(bgContainer)
        

        bgContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bgContainer.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            bgContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            bgContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            bgContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4),
                    ])
        
        btn_arrow.isUserInteractionEnabled = false
        
        bgContainer.addSubview(containerCollapse)
        bgContainer.addSubview(containerFull)
        bgContainer.addSubview(btn_test)
        bgContainer.addSubview(btn_arrow)
        
        
        containerFull.addSubview(fullTitle)
        containerFull.addSubview(infoDateFull)
        containerFull.addSubview(infoPeopleFull)
        containerFull.addSubview(ico_people)
        containerFull.addSubview(ico_clock_ex)
        containerFull.addSubview(img_host)
        containerFull.addSubview(name_host)
        
        
        containerCollapse.addSubview(titleTruncate)
        containerCollapse.addSubview(infoCollapse)
        containerCollapse.addSubview(infoDateCollapase)
        containerCollapse.addSubview(ico_clock)
        //bg.addConstraintsWithFormat(format: "H:|[v0]|", views: btnOpen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

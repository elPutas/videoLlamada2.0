//
//  CalendarViewList.swift
//  videoLlamada
//
//  Created by Gio Valdes on 17/03/21.
//

import UIKit
import SDWebImage

extension WaintingRoom:UITableViewDelegate
{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Manager.instance.meetingArr.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellView, for: indexPath) as! CalendarCellView
        cell.fullTitle.text = Manager.instance.meetingArr[indexPath.row].title
        cell.titleTruncate.text = Manager.instance.meetingArr[indexPath.row].title
        cell.isOpen = Manager.instance.selectedDates.contains( indexPath.row )
        cell.img_host.sd_setImage(with: NSURL(string: Manager.instance.meetingArr[indexPath.row].photo)! as URL, placeholderImage: UIImage(named:"user-default"), options: [.continueInBackground])
        cell.delegate = self
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if Manager.instance.selectedDates.contains( indexPath.row )
        {
            return 300
        }else{
            return 110
        }
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        if Manager.instance.selectedDates.contains(indexPath.row)
        {
            Manager.instance.selectedDates = Manager.instance.selectedDates.filter({$0 != indexPath.row})
        }else{
            Manager.instance.selectedDates.append(indexPath.row)
            
        }
        
        Manager.instance.selectedMeeting = Manager.instance.meetingArr[indexPath.row]
        
        tableView.beginUpdates()
        tableView.endUpdates()
        tableView.reloadRows(at: [indexPath], with: .fade)
        //DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {tableView.reloadRows(at: [indexPath], with: .fade)})
        
    }
    
}

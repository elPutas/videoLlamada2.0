//
//  MeetingFirebase.swift
//  videoLlamada
//
//  Created by Gio Valdes on 18/03/21.
//



class MeetingsFirebase {
//    let db = Firestore.firestore()
//
//    func getMeeting(userId:Int64, date:Date,
//                                completion: @escaping (_ completed: Bool, _ arr: [Meeting]) -> Void)
//    {
//
//        let start =  date.addDays(0);
//        let end =  date.addDays(1);
//
//        var arrAppoints : [Meeting] = []
//        db.collection("Meetings")
//            .whereField("dateTime", isGreaterThan: start!)
//            .whereField("dateTime", isLessThan: end!)
//            .getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//                completion(false,arrAppoints)
//            } else {
//                for document in querySnapshot!.documents {
//
//                    let _photo = document.data()["photo"] as? String ?? ""
//                    let _title = document.data()["title"] as? String ?? ""
//                    let _pass = document.data()["accessCode"] as? String ?? ""
//                    let _meetingNo = document.data()["idMeeting"] as? String ?? ""
//
//                    let g = Meeting(
//                        photo: _photo,
//                        title: _title,
//                        meetingNo : _meetingNo,
//                        pass : _pass
//                        )
//
//                    arrAppoints.append(g)
//                }
//
//                completion(true,arrAppoints)
//            }
//        }
//
//    }
}

//
//  TableViewCell.swift
//  cignifi-challenge
//
//  Created by MacbookPro on 03/05/22.
//

import UIKit
import Foundation
import Firebase
import FirebaseDatabase
import AVKit

class TableViewCell: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    var table = [Videos]()
    var ref: DatabaseReference!
    

    @IBOutlet weak var Tableview: UITableView!
    @IBOutlet weak var titlelabel: UITableViewCell!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference().child("videos")
        
        ref.observe(DataEventType.value, with:{(snapshot) in
            if snapshot.childrenCount > 0 {
                self.table.removeAll()
                
                for video in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let Object = video.value as? [String: AnyObject]
                    let Title = Object?["Title"]
                    let videolink = Object?["Link"]
                    
                    let video = Videos(Title: Title as! String, link: videolink as! String)
                    self.table.append(video)
                    
                    self.Tableview.reloadData()
                }
            }
            
        
    })
    


}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Tableview.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        let video: Videos
        
        video = table[indexPath.row]
        cell.titlelabel; video.Title
        
        
    }
}


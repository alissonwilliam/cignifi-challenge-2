//
//  SettingsController.swift
//  cignifi-challenge
//
//  Created by MacbookPro on 15/05/22.
//

import UIKit

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackGroundColor: UIColor
    let handler: (() -> Void)
}

class SettingsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        return table
    }()
    
    var models = [SettingsOption]()
            
            override func viewDidLoad() {
                super.viewDidLoad()
                title = "Settings"
                view.addSubview(tableView)
                tableView.delegate = self
                tableView.dataSource = self
                tableView.frame = view.bounds
            }
    
    func configure() {
               self.models = Array(0...100).compactMap({
                   SettingsOption(title: "Item \($0)", icon: UIImage (systemName: "House"),iconBackGroundColor: .systemPink) {
                       
        }
    })
}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return models.count
            }
            
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let model = models[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                         for: indexPath)
                
        cell.textLabel?.text = model.title
        return cell
    }
}



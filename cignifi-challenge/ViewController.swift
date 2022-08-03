//
//  ViewController.swift
//  cignifi-challenge
//
//  Created by MacbookPro on 15/05/22.
//
import UIKit

struct Section{
    let title: String
    let options: [SettingsOptionType]
}

enum SettingsOptionType{
    case staticCell(model: SettinsOption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption{
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

struct SettinsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableview: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        return table
    }()
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        view.addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.frame = view.bounds
        }
    
    func configure() {
        models.append(Section(title: "General", options: [
            .switchCell(model: SettingsSwitchOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor:
                    .systemRed, handler:{
                
            }, isOn: true)),
        ]))
        
        models.append(Section(title: "General", options: [
            .staticCell(model: SettinsOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print ("Tapped first cell")
            }),
            .staticCell(model:SettinsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                
            }),
            .staticCell(model:SettinsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemPurple) {
                
            }),
            .staticCell(model:SettinsOption(title: "Icloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemYellow) {
                
            })
        ]))
        
        models.append(Section(title: "Information", options: [
            .staticCell(model: SettinsOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print ("Tapped first cell")
            }),
            .staticCell(model:SettinsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                
            }),
            .staticCell(model:SettinsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemPurple) {
                
            }),
            .staticCell(model:SettinsOption(title: "Icloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemYellow) {
                
            })
        ]))
        
        models.append(Section(title: "Apps", options: [
            .staticCell(model: SettinsOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print ("Tapped first cell")
            }),
            .staticCell(model:SettinsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                
            }),
            .staticCell(model:SettinsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemPurple) {
                
            }),
            .staticCell(model:SettinsOption(title: "Icloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemYellow) {
                
            })
        ]))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath)
                    as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath)
                    as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
    
    @IBAction func switchButtonDark(_ sender: Any) {
        guard let switchDarkMode = sender as? UISwitch else {return}
        overrideUserInterfaceStyle = (switchDarkMode.isOn) ? .dark : .light
    }
    
}




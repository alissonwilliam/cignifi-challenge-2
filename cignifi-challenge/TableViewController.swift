//
//  HomeViewController.swift
//  cignifi-challenge
//
//  Created by MacbookPro on 03/05/22.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableView: UITableView!
    
    var listBrand:[Brand] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBrand()
        self.configTableview()
        }
        
    private func configTableview(){
        
        self.TableView.delegate = self
        self.TableView.dataSource = self
        self.TableView.register(CustomRowTableViewCell.nib(), forCellReuseIdentifier: CustomRowTableViewCell.identifier)
    }
    
    private func addBrand(){
        
        self.listBrand.append(Brand(brand: "Razer", product: ["Phone Kraken","Laptop","Chairs","Case Fans","Bags"]))
        self.listBrand.append(Brand(brand: "Apple", product: ["Iphone 13 Pro","Mac Studio","Macbook","Macbook Air M1"]))
        self.listBrand.append(Brand(brand: "Samsung", product: ["Robot Vacuums","Galaxy S22 Ultra","Tv New Qled 8k","Galaxy Book 2"]))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.listBrand.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listBrand[section].product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomRowTableViewCell.identifier, for: indexPath) as? CustomRowTableViewCell
        cell?.setupCell(product: self.listBrand[indexPath.section].product[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.listBrand[section].brand
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 48
    }
}

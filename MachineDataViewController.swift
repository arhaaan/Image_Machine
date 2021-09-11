//
//  MachineDataViewController.swift
//  Image_Machine
//
//  Created by Karim Arhan on 10/09/21.
//  Copyright © 2021 Karim Arhan. All rights reserved.
//

import UIKit
import CoreData

class MachineDataViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var machines: [Machine]?
    
    var names = ["budi", "basuki"]
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 70.0
        
        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(systemName: "goforward"), style: .done, target: self, action: #selector(fetchData))

        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        fetchData()
    }

    @objc func fetchData(){
        
        do {
            self.machines = try context.fetch(Machine.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch {
        
        }
    }
    
    @IBAction func SortName(_ sender: Any) {
        
        do {
            let request = Machine.fetchRequest() as NSFetchRequest<Machine>
            
            let sort = NSSortDescriptor(key: "name", ascending: true)
            request.sortDescriptors = [sort]
            
            self.machines = try context.fetch(request)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch {
        
        }
        
    }
    
    @IBAction func SortType(_ sender: Any) {
        do {
            let request = Machine.fetchRequest() as NSFetchRequest<Machine>
            
            let sort = NSSortDescriptor(key: "type", ascending: true)
            request.sortDescriptors = [sort]
            
            self.machines = try context.fetch(request)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch {
        
        }
    }
    
    @IBAction func addMachine(_ sender: Any) {
        
        
    }
}

extension MachineDataViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.machines?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MachineCell", for: indexPath) as! MachineCellTableViewCell
        
        let machine = self.machines?[indexPath.row]
        
        cell.nameLbl.text = machine?.name
        cell.typeLbl.text = machine?.type
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
//        let machine =  self.machines?[indexPath.row]
        detailVC.machine = self.machines?[indexPath.row]
//        let dateFormatter = DateFormatter()
//        detailVC.idLbl.text = machine?.id
//        detailVC.nameLbl.text = machine?.name
//        detailVC.typeLbl.text = machine?.type
//        detailVC.dateLbl.text = dateFormatter.string(from: (machine?.date)!)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension String {

    static func random(length: Int = 20) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""

        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}

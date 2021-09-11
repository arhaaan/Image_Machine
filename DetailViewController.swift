//
//  DetailViewController.swift
//  Image_Machine
//
//  Created by Karim Arhan on 11/09/21.
//  Copyright © 2021 Karim Arhan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var editNameTxt: UITextField!
    @IBOutlet weak var editTypeTxt: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var MDVC = MachineDataViewController()
    
    var machine: Machine?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        idLbl.text = machine?.id
        nameLbl.text = machine?.name
        typeLbl.text = machine?.type
        dateLbl.text = dateFormatter.string(from: (machine?.date)!)
        
        editNameTxt.isHidden = true
        editTypeTxt.isHidden = true
        saveBtn.isHidden = true
        
    }
    
    @IBAction func editBtn(_ sender: Any) {
        editNameTxt.isHidden = false
        editTypeTxt.isHidden = false
        saveBtn.isHidden = false
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        
        self.context.delete(machine!)
        
        do {
            try self.context.save()
        } catch  {
            
        }
        
//        MDVC.tableView.reloadData()
        
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
        machine?.name = editNameTxt.text
        machine?.type = editTypeTxt.text
        
        nameLbl.text = editNameTxt.text
        typeLbl.text = editTypeTxt.text
        
        do {
            try self.context.save()
        } catch  {
            
        }
        
        editNameTxt.isHidden = true
        editTypeTxt.isHidden = true
        saveBtn.isHidden = true
        
    }
    
}

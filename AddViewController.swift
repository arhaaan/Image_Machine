//
//  AddViewController.swift
//  Image_Machine
//
//  Created by Karim Arhan on 10/09/21.
//  Copyright © 2021 Karim Arhan. All rights reserved.
//

import UIKit

class AddViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var typeTxt: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var MDVC = MachineDataViewController()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectedImage: UIImage?
        
        if let editedImg = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectedImage = editedImg
        }
        else if let originalImg = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            selectedImage = originalImg
        }
        
        imageView.image = selectedImage
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addMachine(_ sender: Any) {

        
        let newMachine = Machine(context: self.context)
        newMachine.name = nameTxt.text
        newMachine.type = typeTxt.text
        newMachine.id = String.random(length: 5)
        newMachine.date = Date()
        
        do {
            try self.context.save()
        } catch  {
            
        }
        
//        MDVC.tableView.reloadData()
        
    }
    
}

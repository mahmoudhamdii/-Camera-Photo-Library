//
//  ViewController.swift
//  81-82
//
//  Created by hamdi on 05/02/2023.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imgPhoto: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
         
    }

    @IBAction func btnShowPhoto(_ sender: Any) {
        showAlert()
    }
    func showAlert () {
        let alert = UIAlertController(title:"Select Photo From" , message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default ,handler: {
            action in
            self.getPhoto(source: .camera)
        }))
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default,handler: {action in
            self.getPhoto(source: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel,handler: nil))
        present(alert, animated: true ,completion: nil)
        
    }
    func getPhoto (source :UIImagePickerController.SourceType){
        let piker = UIImagePickerController()
        piker.sourceType = source
        piker.allowsEditing = true
        piker.delegate = self
        present(piker, animated: true,completion: nil)
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true ,completion: nil)
        if let img = info[.editedImage]as?UIImage {
            imgPhoto.image = img
        
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true,completion: nil)
    }
    
}


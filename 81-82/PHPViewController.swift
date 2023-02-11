//
//  PHPViewController.swift
//  81-82
//
//  Created by hamdi on 05/02/2023.
//

import UIKit
import PhotosUI

class PHPViewController: UIViewController, PHPickerViewControllerDelegate {

    
  var  arrphotos = [UIImage]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    

    @IBAction func btnGetPhotos(_ sender: Any) {
        getPhotos()
    }
    func getPhotos(){
        var config = PHPickerConfiguration()
        config.filter = .any(of: [.images])
        config.selectionLimit = 3
        let piker = PHPickerViewController(configuration: config)
        piker.delegate = self
        present(piker, animated: true,completion: nil)
        
        
    }
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true,completion: nil)
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: {
                (image,error) in
                if let img = image as?UIImage {
                    DispatchQueue.main.async {
                        self.arrphotos.append(img)
                        self.tableView.reloadData()
                    }
                    
                }else{
                    
                }
                
            })
        }
    }
   

}
extension PHPViewController :  UITableViewDelegate {
    
}
extension PHPViewController :UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrphotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!TableViewCell
        cel.imgPhoto.image = arrphotos[indexPath.row]
        return cel
    }
    
    
    
}

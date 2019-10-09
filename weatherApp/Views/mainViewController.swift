//
//  ViewController.swift
//  weatherApp
//
//  Created by Tia Lendor on 10/9/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    
    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var zipTextOutlet: UITextField!
    @IBAction func zipTextField(_ sender: UITextField) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = weatherCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        zipTextOutlet.keyboardType = .numberPad
        zipTextOutlet.delegate = self
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = weatherCollectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
    
    
}



extension ViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.count == 5 {
            textField.resignFirstResponder()
        }
    }
    
}

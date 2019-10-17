//
//  FavesViewController.swift
//  weatherApp
//
//  Created by Tia Lendor on 10/9/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class FavesViewController: UIViewController {

    @IBOutlet weak var favedCitiesTableView: UITableView!
    
     
    var favedPhotos = [SavedCityImage]() {
        didSet{
            favedCitiesTableView.reloadData()
            print(self.favedPhotos.count)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favedCitiesTableView.delegate = self
        favedCitiesTableView.dataSource = self
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        do {
       favedPhotos = try CityImagePersistenceManager.manager.getPhoto()
        } catch {
            fatalError()
        }
    }


}

extension FavesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favedPhotos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let thisImage = favedPhotos[indexPath.row]
        let imageCell = favedCitiesTableView.dequeueReusableCell(withIdentifier: "favedCityImageCell", for: indexPath) as! FaveTableViewCell
        imageCell.faveCityImages.image = UIImage(data: thisImage.imageData)
        return imageCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}

//
//  CarsCollectionVCViewController.swift
//  CollectionViewSample
//
//  Created by Appinventiv on 10/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class CarsCollectionVCViewController: UIViewController {
    
    var datadict : [[String:Any]] = [["titles":"BMW" , "color":UIColor.black],
                                     ["titles":"ALTO" , "color":UIColor.white],
                                     ["titles":"ZEN" , "color":UIColor.yellow],
                                     ["titles":"ALTO" , "color":UIColor.white],
                                     ["titles":"ALTO" , "color":UIColor.white],
                                     ["titles":"ALTO" , "color":UIColor.yellow],
                                     ["titles":"ALTO" , "color":UIColor.white],
                                     ["titles":"ALTO" , "color":UIColor.black],
                                     ["titles":"BMW" , "color":UIColor.white],
                                     ["titles":"ALTO" , "color":UIColor.white],
                                     ["titles":"ZEN" , "color":UIColor.black],
                                     ["titles":"ALTO" , "color":UIColor.yellow],
                                     ["titles":"BMW" , "color":UIColor.white],
                                     ["titles":"ALTO" , "color":UIColor.black],
                                     ["titles":"ALTO" , "color":UIColor.yellow],
                                     ["titles":"ALTO" , "color":UIColor.white],
                                     ["titles":"ALTO" , "color":UIColor.white],
                                     ["titles":"BMW" , "color":UIColor.black],
                                     ["titles":"ZEN" , "color":UIColor.white],
                                     ["titles":"ALTO" , "color":UIColor.white],
                                     ["titles":"ALTO" , "color":UIColor.white],
                                     ["titles":"BMW" , "color":UIColor.black],
                                     ["titles":"ALTO" , "color":UIColor.white],
                                     ["titles":"ZEN" , "color":UIColor.yellow],
                                     ["titles":"ALTO" , "color":UIColor.white],
                                     ["titles":"ALTO" , "color":UIColor.yellow],
                                     ["titles":"ZEN" , "color":UIColor.white],


                                     ]
    
    
    
    @IBOutlet weak var carsCollectionOutlet: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.carsCollectionOutlet.dataSource = self
        self.carsCollectionOutlet.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
}

extension CarsCollectionVCViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datadict.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypesOfCarsID", for: indexPath) as! TypesOfCars
        let car = CarModel(withJSON: datadict[indexPath.item])
        cell.configureData(car: car)
    
        return cell
    }
    
}
class CarModel  {
    var color : UIColor!
    var name : String!
    
    init(withJSON data : [String:Any]) {
        
        color = data["color"] as? UIColor
        name = data["name"] as? String
    }
    
}

class TypesOfCars : UICollectionViewCell{
    
    @IBOutlet weak var carsImages: UIImageView!
    
    @IBOutlet weak var carsTitles: UILabel!
    
    func configureData(car : CarModel){
        
        carsImages.backgroundColor = car.color
        carsTitles.text = car.name
        
    
    }
    
}

//
//  ViewController.swift
//  RightMenu
//
//  Created by Xcode on 24.06.2020.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit
import DSCircularCollectionView

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {

    var numberOfCells = 10
    var lastRotation: CGFloat = 0
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView.reloadData()

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RMCell", for: indexPath) as?
            RightMenuCollectionViewCell else { return UICollectionViewCell() }
        
        let circlePath = UIBezierPath.init(arcCenter: CGPoint(x: cell.imageView.bounds.size.width, y: 0), radius: cell.imageView.bounds.size.height , startAngle: 0.0, endAngle: .pi, clockwise: true)
        let circleShape = CAShapeLayer()
        circleShape.path = circlePath.cgPath
        cell.imageView.layer.mask = circleShape
       // cell.imageView.transform = CGAffineTransform(rotationAngle: 360)
                if let imageURL = URL(string: "http://placehold.it/80x80") {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imageView.image = image                        
                    }
                }
            }
        }
        return cell
    }
}


//
//  HomeVC.swift
//  Yummie
//
//  Created by Ahmed on 26/02/2022.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish 1", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "Africa Dish 5", image: "https://picsum.photos/100/200"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
    }
    

    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCell.id, bundle: .main), forCellWithReuseIdentifier: CategoryCell.id)
    }
  

}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.id, for: indexPath) as! CategoryCell
        cell.setup(category: categories[indexPath.row])
        return cell
    }
}

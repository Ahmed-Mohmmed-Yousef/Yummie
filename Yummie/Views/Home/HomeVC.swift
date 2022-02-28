//
//  HomeVC.swift
//  Yummie
//
//  Created by Ahmed on 26/02/2022.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish 1", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "Africa Dish 5", image: "https://picsum.photos/100/200"),
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Garri", description: "This is best I have ever tested", image: "https://picsum.photos/100/200", calories: 35.4575),
        .init(id: "id2", name: "Indomie", description: "This is best I have ever tested This is best I have ever tested This is best I have ever tested This is best I have ever tested", image: "https://picsum.photos/100/200", calories: 35.4575),
        .init(id: "id3", name: "Pizza", description: "This is best I have ever tested", image: "https://picsum.photos/100/200", calories: 35.4575),
        .init(id: "id4", name: "Lazania", description: "This is best I have ever tested", image: "https://picsum.photos/100/200", calories: 35.4575),
        .init(id: "id5", name: "NagrisCoo", description: "This is best I have ever tested", image: "https://picsum.photos/100/200", calories: 35.4575),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
    }
    

    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCell.id, bundle: .main), forCellWithReuseIdentifier: CategoryCell.id)
        popularCollectionView.register(UINib(nibName: DishProtriatCell.id, bundle: .main), forCellWithReuseIdentifier: DishProtriatCell.id)
        specialsCollectionView.register(UINib(nibName: DishLandscapeCell.id, bundle: .main), forCellWithReuseIdentifier: DishLandscapeCell.id)
    }
  

}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return populars.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.id, for: indexPath) as! CategoryCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishProtriatCell.id, for: indexPath) as! DishProtriatCell
            cell.setup(populars[indexPath.row])
            return cell
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCell.id, for: indexPath) as! DishLandscapeCell
            cell.setup(populars[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            
        } else {
            let controller = DetailsVC.instatiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : populars[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}

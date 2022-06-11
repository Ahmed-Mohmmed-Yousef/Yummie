//
//  HomeVC.swift
//  Yummie
//
//  Created by Ahmed on 26/02/2022.
//

import UIKit
import ProgressHUD


class HomeVC: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = []
    
    var populars: [Dish] = []
    
    var special: [Dish] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
        fetchData()
    }
    
    private func fetchData() {
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self] result in
            guard let self = self else { return }
            switch result {
                
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self.categories = allDishes.categories ?? []
                self.populars = allDishes.populars ?? []
                self.special = allDishes.specials ?? []
                self.categoryCollectionView.reloadData()
                self.popularCollectionView.reloadData()
                self.specialsCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
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
            return special.count
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
            let controller = ListDishesVC.instatiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DetailsVC.instatiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : special[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}

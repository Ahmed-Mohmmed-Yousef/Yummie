//
//  ListDishesVC.swift
//  Yummie
//
//  Created by Ahmed on 28/02/2022.
//

import UIKit

class ListDishesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Garri", description: "This is best I have ever tested", image: "https://picsum.photos/100/200", calories: 35.4575),
        .init(id: "id2", name: "Indomie", description: "This is best I have ever tested This is best I have ever tested This is best I have ever tested This is best I have ever tested", image: "https://picsum.photos/100/200", calories: 35.4575),
        .init(id: "id3", name: "Pizza", description: "This is best I have ever tested", image: "https://picsum.photos/100/200", calories: 35.4575),
        .init(id: "id4", name: "Lazania", description: "This is best I have ever tested", image: "https://picsum.photos/100/200", calories: 35.4575),
        .init(id: "id5", name: "NagrisCoo", description: "This is best I have ever tested", image: "https://picsum.photos/100/200", calories: 35.4575),
    ]
    
    var category: DishCategory!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = category.name
        registerCell()
    }
    
    
    private func registerCell() {
        tableView.register(UINib(nibName: DishListCell.id, bundle: .main), forCellReuseIdentifier: DishListCell.id)
    }
}

extension ListDishesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return populars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListCell.id, for: indexPath) as! DishListCell
        cell.setup(populars[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controller = DetailsVC.instatiate()
        controller.dish = populars[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}

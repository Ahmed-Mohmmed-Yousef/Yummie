//
//  ListAllOrderVC.swift
//  Yummie
//
//  Created by Ahmed on 28/02/2022.
//

import UIKit

class ListAllOrderVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let orders: [Order] = [
        .init(id: "id 1", name: "Ahmed", dish: .init(id: "id1", name: "Garri", description: "This is best I have ever tested", image: "https://picsum.photos/100/200", calories: 35.4575)),
        .init(id: "id 2", name: "Ahmed Mohmaed", dish: .init(id: "id1", name: "Garri", description: "This is best I have ever tested", image: "https://picsum.photos/100/200", calories: 35.4575)),
        .init(id: "id 3", name: "Ahmed Yousef", dish: .init(id: "id1", name: "Garri", description: "This is best I have ever tested", image: "https://picsum.photos/100/200", calories: 35.4575)),
        .init(id: "id 4", name: "Ahmed Joo", dish: .init(id: "id1", name: "Garri", description: "This is best I have ever tested", image: "https://picsum.photos/100/200", calories: 35.4575)),
       
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerCell()
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: DishListCell.id, bundle: .main), forCellReuseIdentifier: DishListCell.id)
    }

}

extension ListAllOrderVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListCell.id, for: indexPath) as! DishListCell
        cell.setup(orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controller = DetailsVC.instatiate()
        controller.dish = orders[indexPath.row].dish!
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

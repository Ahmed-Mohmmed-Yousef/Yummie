//
//  ListAllOrderVC.swift
//  Yummie
//
//  Created by Ahmed on 28/02/2022.
//

import UIKit
import ProgressHUD

class ListAllOrderVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Order"
        registerCell()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchOrders()
    }
    
    private func fetchOrders() {
        ProgressHUD.show()
        NetworkService.shared.fetchOrders { [weak  self] result in
            switch result {
                
            case .success(let orders):
                self?.orders = orders
                self?.tableView.reloadData()
                ProgressHUD.dismiss()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
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

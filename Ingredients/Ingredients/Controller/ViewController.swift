//
//  ViewController.swift
//  Ingredients
//
//  Created by Dimas Syuhada on 13/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    let baseUrl: String = "https://60a4954bfbd48100179dc49d.mockapi.io/api/innocent/newsapp/articles"
    var data = [IngredientsData]()
    

    //MARK: Properties & Variables
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
        fetchData()
    }

}

//MARK: Function Views & Actions
extension ViewController {
    func setupView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainTableViewCell.nib(), forCellReuseIdentifier: MainTableViewCell.identifier)
    }
    
    func fetchData(){
        getJSON{
            self.tableView.reloadData()
        };
    }
    
    func getJSON(completed: @escaping() -> ()){
        let url = URL (string: baseUrl)
        URLSession.shared.dataTask(with: url!) { (data,response,error) in
            if error == nil {
                do{
                    let dataFetch = try JSONDecoder().decode([IngredientsData].self, from: data!)
                    self.data = dataFetch
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.showAlert()
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.showAlert()
                }
            }
        }.resume()
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Error", message: "Error Loading Data", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

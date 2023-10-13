//
//  ViewController+UITableView.swift
//  Ingredients
//
//  Created by Dimas Syuhada on 13/10/23.
//

import UIKit
import Foundation

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        cell.configure(with: data[indexPath.row])
        cell.lblName.adjustsFontSizeToFitWidth = true
        return cell
    }
    
}

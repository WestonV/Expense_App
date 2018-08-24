//
//  ViewController.swift
//  ExpenseApplication
//
//  Created by Weston Verhulst on 8/24/18.
//  Copyright © 2018 Weston Verhulst. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let expenses: [Expense] = Expense.retrieve()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExpenseDetailTableViewCell
        let expense = self.expenses[indexPath.row]
        cell.titleLabel.text = expense.title
        cell.priceLabel.text = "$\(expense.price)"
        cell.dateLabel.text = expense.date
        return cell
    }

}


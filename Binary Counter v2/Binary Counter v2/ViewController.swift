//
//  ViewController.swift
//  Binary Counter v2
//
//  Created by admin on 08/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var total: UILabel!
    
    let numbers = [
        1,
        10,
        100,
        1000,
        10000,
        100000,
        1000000,
        10000000,
        100000000,
        1000000000,
        10000000000,
        100000000000,
        1000000000000,
        10000000000000,
        100000000000000,
        1000000000000000,
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NumbersCell", for: indexPath) as! CustomTableViewCell
        
        cell.addNumber(num: "\(numbers[indexPath.row])")
        
        cell.plusBtn.tag = indexPath.row + 1
        cell.minusBtn.tag = indexPath.row + 1 + numbers.count
        
        cell.plusBtn.addTarget(self, action: #selector(add(sender:)), for: .touchUpInside)
        cell.minusBtn.addTarget(self, action: #selector(minus(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc
    func add(sender: UIButton){
        if let tot = total.text, let value = Int(tot){
            let idx = sender.tag - 1
            total.text = "\(value + numbers[idx])"
        }
    }
    
    @objc
    func minus(sender: UIButton){
        if let tot = total.text, let value = Int(tot){
            let idx = sender.tag - 1 - numbers.count
            total.text = "\(value - numbers[idx])"
        }
    }
    
}


//
//  ColorsViewController.swift
//  Parsing-JSON-Lab
//
//  Created by Mariel Hoepelman on 8/28/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {
    var colors: ColorJSON!

    @IBOutlet weak var ColorsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ColorsTableView.dataSource = self
        ColorsTableView.delegate = self
    }
    
    //configure JSON function
    //configure prepare for segue function 
}

extension ColorsViewController: UITableViewDelegate {
    
}
extension ColorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.color.count
        //needs to load JSON
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

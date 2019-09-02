//
//  DiscoverViewController.swift
//  HarmonyUI
//
//  Created by user on 8/26/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {
    @IBOutlet weak var searchView: SearchView!
    
    @IBOutlet weak var placesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        placesTableView.register(UINib(nibName: "DiscoverTableViewCell", bundle: nil), forCellReuseIdentifier: "placeCell")
        placesTableView.dataSource = self
        placesTableView.delegate = self
    }
    @IBAction func filterPressed(_ sender: Any) {
        let searchView = SearchView()
        if let customView = Bundle.main.loadNibNamed("SearchView", owner: self, options: nil)?.first as? SearchView {
            
            view.addSubview(customView)
            customView.configure()
            
        }
    }
    
}
extension DiscoverViewController : UITableViewDataSource ,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell") as! DiscoverTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchView = SearchView()
        view.addSubview(searchView)
    }
    
}

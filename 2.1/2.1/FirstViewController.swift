//
//  ViewController.swift
//  2.1
//
//  Created by 이정은 on 8/29/25.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var tableView = UITableView()
    let datas = ["SSG", "NC", "KT", "KIA", "LG"]
     
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
     
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = datas[indexPath.row]
        return cell
    }
}

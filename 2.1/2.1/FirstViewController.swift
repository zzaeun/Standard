//
//  ViewController.swift
//  2.1
//
//  Created by 이정은 on 8/29/25.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {
    
    
    let tableView = UITableView()
    var datas = ["SSG", "NC", "KT", "KIA", "LG"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setConstraints()
    }
    
    private func configureUI() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: FirstTableViewCell.identifier)
    }
    
    func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    
    // tableView의 delegate가 self(나)니까 실행될 때 어떻게 돌아가는지 내가 작성해야 함
    // 즉 여기서 구현한대로 디자인 됨! tableView가 ViewController에게 위임했기 때문에
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: FirstTableViewCell.identifier, for: indexPath
        ) as? FirstTableViewCell
        else { return .init() }
        
        let data = datas[indexPath.row]
        cell.delegate = self
        cell.configure(data: data)
        return cell
    }
    
    // tableView가 cell을 눌렸을 때 무슨 행동을 해야하는지도 ViewController에게 맡김
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        datas.append("셀 선택")
        tableView.reloadData()
    }
}

extension FirstViewController: FirstTableViewCellDelegate {
    func didTapButton(data: String) {
        datas.append(data)
        tableView.reloadData()
    }
}

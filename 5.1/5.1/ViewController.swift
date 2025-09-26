//
//  ViewController.swift
//  5.1
//
//  Created by 이정은 on 9/26/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    // URL 구성 요소
    private func fetchData() {
        let scheme = "https"
        let host = "reqres.in"
        let path = "/api/users"
        let query = URLQueryItem(name: "list", value: "2")
        
        let method = "GET"
        let header = ["x-api-key": "reqres-free-v1"]
        
        // URL Components
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = [query]
        
        // URL 생성
        guard let url = components.url else { return }
        
        // request 생성
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = header
        
        // URLSession 사용
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
            do {
                let model = try JSONDecoder().decode(userPageModel.self, from: data)
                print("디코딩 성공")
                print(model.data)
            } catch {
                print("디코딩 실패")
                print(error)
            }
        }
        task.resume()
    }
}

//
//  NetworkService.swift
//  6.1
//
//  Created by 이정은 on 10/2/25.
//

import Foundation

class NetworkService {
    
    func login(
        email: String,
        password: String,
        completion: @escaping (Result<LoginResponse, ModalError>) -> Void
    ) throws {
        guard email.isEmpty == false else {
            throw ModalError.emailEmpty
        }
        
        guard password.isEmpty == false else {
            throw ModalError.passwordEmpty
        }
        let body = LoginRequest(email: email, password: password)
        let url = makeURL()
        let request = try makeRequest(with: url, for: body)
        try task(with: request, completion: completion)
    }
}

extension NetworkService {
    // 1. URL 생성
    private func makeURL() -> URL? {
        let scheme = "https"
        let host = "reqres.in"
        let path = "/api/login"
        
        // URL Components
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        
        return components.url
    }
    
    // 2. Request 생성
    private func makeRequest(with url: URL?, for body: LoginRequest) throws -> URLRequest? {
      guard let url else {
        throw ModalError.invalidURL
      }
      
      let method = "POST"
      let headers = [
        "Content-Type": "application/json",
        "x-api-key": "reqres-free-v1"
      ]
      var request = URLRequest(url: url)
      request.allHTTPHeaderFields = headers
      request.httpMethod = method
      guard let encodedBody = try? JSONEncoder().encode(body) else {
        throw ModalError.encodeFailed
      }
      request.httpBody = encodedBody
      return request
    }
    
    // 3. 결과 수행
    private func task (with request: URLRequest?, completion: @escaping (Result<LoginResponse, ModalError>) -> Void) throws {
        guard let request else { throw ModalError.invalidRequest }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse else {
                completion (.failure(.responseError))
                return
            }
            
            switch response.statusCode {
            case 200 ..< 300:
                break
            case 400:
                completion (.failure(.loginError))
                return
            default:
                completion (.failure(.responseError))
                return
            }
            
            if let data = data {
                do {let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    completion (.success(loginResponse))
                } catch {
                    completion (.failure(.taskError))
                }
            }
        }
        
        // 4. 요청
        task.resume()
    }
    
    
    
    
}

//
//  ViewController.swift
//  URLSession
//
//  Created by Евгений Ганусенко on 4/28/22.
//

import UIKit

class ViewController: UIViewController {

    private let endpointClient = EndpointClient(applicationSettings: ApplicationSettingsService())

    override func viewDidLoad() {
        super.viewDidLoad()

        executeCall()
    }

    func executeCall() {
        let endpoint = GetNameEndpoint()
        let completion: EndpointClient.ObjectEndpointCompletion<String> = { result, response in
            guard let responseUnwrapped = response else { return }

            print("\n\n response = \(responseUnwrapped.allHeaderFields) ;\n \(responseUnwrapped.statusCode) \n")
            switch result {
            case .success(let team):
                print("team = \(team)")

            case .failure(let error):
                print(error)
            }
        }
        endpointClient.executeRequest(endpoint, completion: completion)
    }
}

final class GetNameEndpoint: ObjectResponseEndpoint<String> {
    override var method: RESTClient.RequestType { return .get }
    override var path: String { MarvelAPI.request }
//    override var queryItems: [URLQueryItem(name: "id", value: "1")]?

    override init() {
        super.init()
        let ts = MarvelAPI.ts
        let apiKey = MarvelAPI.apiKey
        let privateKey = MarvelAPI.privateKey
        let hash = (String(ts) + privateKey + apiKey).md5()
        queryItems = [URLQueryItem(name: "name", value: "Black Lotus"),
                      URLQueryItem(name: "ts", value: String(ts)),
                      URLQueryItem(name: "apikey", value: apiKey),
                      URLQueryItem(name: "hash", value: hash)
        ]
    }
}

func decodeJSONOld() {
    let str = """
        {\"team\": [\"ios\", \"android\", \"backend\"]}
    """

    let data = Data(str.utf8)

    do {
        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            if let names = json["team"] as? [String] {
                print(names)
            }
        }
    } catch let error as NSError {
        print("Failed to load: \(error.localizedDescription)")
    }
}

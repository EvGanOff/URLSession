//
//  Model.swift
//  URLSession
//
//  Created by Евгений Ганусенко on 4/28/22.
//

import Foundation
import FileProvider

struct Card: Codable {
    let name: String
    let type: String
    let manaCost: String?
    let setName: String
    let layout: String?
    var power: String?
}

struct Cards: Decodable {
    var cards: [Card]

    func printInfoAboutCards() {
        cards.forEach { someCard in
            print("Имя карты: \(someCard.name),\n Тип: \(someCard.type),\n",
                  "Мановая стоимость: \(someCard.manaCost ?? "-"),\n",
                  "Наименование сета: \(someCard.setName),\n",
                  "Макет: \(someCard.layout ?? "-") \n",
                  "Cила \(someCard.power ?? "-"), \n",
                  "\(someCard.layout ?? "-")")
        }
    }
}

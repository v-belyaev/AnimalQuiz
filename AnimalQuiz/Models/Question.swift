//
//  Question.swift
//  AnimalQuiz
//
//  Created by Екатерина Батеева on 10.12.2020.
//

enum ResponseType {
    case single
    case multiple
    case range
}

struct Question {
    let text: String
    let type: ResponseType
    let answers: [Answer]
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(text: "Какую пищу вы предпочаете?",
                     type: .single,
                     answers: [
                        Answer(text: "Стейк", type: .dog),
                        Answer(text: "Рыба", type: .cat),
                        Answer(text: "Морковь", type: .rabbit),
                        Answer(text: "Кукуруза", type: .turtle)
                     ]
            ),
            Question(text: "Что вы любите делать?",
                     type: .multiple,
                     answers: [
                        Answer(text: "Плавать", type: .dog),
                        Answer(text: "Спать", type: .cat),
                        Answer(text: "Обниматься", type: .rabbit),
                        Answer(text: "Есть", type: .turtle)
                     ]
            ),
            Question(text: "Любите ли вы поездки на машине?",
                     type: .range,
                     answers: [
                        Answer(text: "Обожаю", type: .dog),
                        Answer(text: "Люблю", type: .cat),
                        Answer(text: "Равнодушно", type: .rabbit),
                        Answer(text: "Ненавижу", type: .turtle)
                     ]
            )
        ]
    }
}

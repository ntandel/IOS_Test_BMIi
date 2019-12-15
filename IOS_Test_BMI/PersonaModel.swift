//
//  PersonaModel.swift
//  IOS_Test_BMI
//
//  Created by Nisha Tandel on 2019-12-14.
//  Copyright © 2019 Nisha TAndel. All rights reserved.
//
class Persona {
    var id: String?
    var name: String?
    var weight: String?
    var height: String?
    var bmi: String?
    
    init(id: String?,name: String?,weight: String?, height:String?, bmi:String?) {
        self.id = id;
        self.name = name;
        self.weight = weight;
        self.height = height;
        self.bmi = bmi;
    }
}

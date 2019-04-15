//
//  Model.swift
//  demoAlamofire
//
//  Created by Joaquin Martinez on 12/04/19.
//  Copyright © 2019 MC Collect. All rights reserved.
//

import Foundation
import ObjectMapper

public class Model {
    
    class Catalogo8: Mappable {
        var Catalogo_8:[Catalogo_8]?
        var Resultados: String = ""
        
        required init?(map: Map){
            
        }
        
        func mapping(map: Map) {
            Catalogo_8 <- map["Catalogo_8"]
            Resultados <- map["Resultados"]
        }
    }
    
    class Catalogo_8: Mappable {
        var ID: String?
        var DESCRIPCION: String = ""
        
        required init?(map: Map){
            
        }
        
        func mapping(map: Map) {
            DESCRIPCION <- map["DESCRIPCION"]
            ID <- map["ID"]
        }
    }
    
}

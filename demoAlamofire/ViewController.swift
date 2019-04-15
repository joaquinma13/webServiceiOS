//
//  ViewController.swift
//  demoAlamofire
//
//  Created by Joaquin Martinez on 11/04/19.
//  Copyright © 2019 MC Collect. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
import AlamofireObjectMapper


class ViewController: UIViewController {
    
    
    var jsonArray: NSArray?
    var nameArray: Array<String> = []
    var imageURLArray: Array<String> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //sendService()
        getService()
        //sessionHeader()
        
        
    }
    
    func getService(){
        let URL = "https://mcnoc.com.mx/ZendereHWsMovil/api/Catalogos?v_catalogo=8"
        Alamofire.request(URL, headers: nil).responseObject { (response: DataResponse<Model.Catalogo8 >) in
            
            let Catalogo8 = response.result.value
            //if()
            print(Catalogo8?.Resultados)
            print("---------------------------------")
            
            if let Catalogo_8 = Catalogo8?.Catalogo_8 {
                for aux in Catalogo_8 {
                    print(aux.ID)
                    print(aux.DESCRIPCION)
                    print("-----------------------------------")
                }
            }
        }
    }
    
    func sendService(){
        var parameters = [:] as [String : String]
        parameters["V_PR_E_CREDITO"] = "1"
        parameters["V_PR_E_ID_PREGUNTA"] = "2"
        parameters["V_PR_E_RESPUESTA"] = "3"
        parameters["V_PR_E_ID_DOCUMENTO"] = "4"
        parameters["V_PR_E_DOCUMENTO"] = "5"
        parameters["V_PR_E_FECHA_CAPTURA"] = "20190101 11:12:12"
        parameters["V_PR_E_FECHA_SINCRONIZA"] = "20190101 11:12:12"
        parameters["V_PR_E_USUARIO"] = "1"
        parameters["V_TIPO"] = "1"
        parameters["V_PR_E_BANDERA"] = "1"
        parameters["V_PR_E_COORDENADAS"] = "1"
        
        let urlString = "https://pruebasmc.com.mx/ZendereHWsMovil/api/RecibeEncuesta"
        
        Alamofire.request(urlString, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response)
                
                break
            case .failure(let error):
                
                print(error)
            }
        }
    }
    
    func sessionHeader(){
        let headers : HTTPHeaders = [
            "v_usuario": "VISITADORV",
            "v_contrasena": "T3mp123*"
        ]
        
        Alamofire.request("https://pruebasmc.com.mx/WSMovilVolksWagen/api/usuario", headers: headers)
            .responseJSON { response in
                debugPrint(response)
        }
    }
    
    
}


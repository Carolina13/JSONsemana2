//
//  ViewController.swift
//  busquedaDeLibros
//
//  
//  Copyright © 2016 Christian Arnez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var isbn: UITextField!
    
    @IBOutlet weak var resultadoBusqueda: UITextView!
    
    
    func sincrono() {
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(isbn.text!)"
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOfURL: url!)
        let texto = NSString(data:datos!, encoding:NSUTF8StringEncoding )
        resultadoBusqueda.text = String(texto)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func search(sender: AnyObject) {
        sincrono()
    }
    
    @IBAction func clear(sender: AnyObject) {
        isbn.text = " "
        resultadoBusqueda.text = " "
    }

}


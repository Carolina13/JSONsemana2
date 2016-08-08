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
    
    
    @IBOutlet weak var tituloDeLibro: UILabel!
    
    @IBOutlet weak var losAutores: UILabel!
    
    @IBOutlet weak var portadaDeLibro: UILabel!
    
    func sincrono() {
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(isbn.text!)"
        let url = NSURL(string: urls)
        let datos = NSData(contentsOfURL: url!)
        
        do {
           let json = try NSJSONSerialization.JSONObjectWithData(datos!,options: NSJSONReadingOptions.MutableLeaves)
            let dico1 = json as! NSDictionary
            let dico2 = dico1["ISBN:978-84-376-0494-7"] as! NSDictionary
            let dico3 = dico2["authors"] as! NSArray
            self.tituloDeLibro.text = dico2["title"] as! NSString as String
            self.losAutores.text = dico3[0]["name"] as! NSString as String
            self.portadaDeLibro.text = dico2["by_statement"] as! NSString as String
            
          
        
        
        }
        catch _ {
            
        }
    
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
        tituloDeLibro.text = " "
        losAutores.text = " "
        portadaDeLibro.text = " "
    }

}


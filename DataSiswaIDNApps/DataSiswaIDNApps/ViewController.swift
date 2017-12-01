//
//  ViewController.swift
//  DataSiswaIDNApps
//
//  Created by Rizki Syaputra on 11/16/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var tglmasuk: UILabel!
    
    var passNama:String?
    var passPassword:String?
    var passEmail:String?
    var passtgl:String?
    var passid:String?
    
    override func viewDidLoad() {
        nama.text = passNama!
        password.text = passPassword!
        email.text = passEmail!
        tglmasuk.text = passtgl!
        id.text = passid!
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


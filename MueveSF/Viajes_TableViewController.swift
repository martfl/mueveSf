//
//  Viajes_TableViewController.swift
//  MueveSF
//
//  Created by Marvi on 29/10/17.
//  Copyright © 2017 marvi. All rights reserved.
//

import UIKit

class Viajes_TableViewController: UITableViewController {
    let direccion = "http://199.233.252.86/201713/SwitchesDeMarfil/lugares_visitados.json"
    var nuevoArray : [Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: direccion)
        let datos = try? Data(contentsOf: url!)
        nuevoArray = try! JSONSerialization.jsonObject(with: datos!) as? [Any]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (nuevoArray?.count)!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Viajes", for: indexPath)
        
        // Configure the cell...
        let lugares = nuevoArray?[indexPath.row] as! [String: Any]
        let s:String = lugares["nombre"] as! String
        cell.textLabel?.text = s
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name:"SystemThin", size:28)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let siguienteV = segue.destination as! DetalleViaje_ViewController
        let indice = self.tableView.indexPathForSelectedRow?.row
        let viaje = nuevoArray?[indice!] as! [String: Any]
        let a:String = viaje ["type"] as! String
        let b:String = viaje ["date_inicio"] as! String
        let c:String = viaje ["date_fin"] as! String
        let d:String = viaje ["avg_speed"] as! String
        let e:String = viaje ["nombre"] as! String
        
        siguienteV.typ = a
        siguienteV.dateI = b
        siguienteV.dateF = c
        siguienteV.spd = d
        siguienteV.nombre = e
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

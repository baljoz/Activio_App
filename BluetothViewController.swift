//
//  BluetothViewController.swift
//  Activio App
//
//  Created by Milos Stosic on 5/29/17.
//  Copyright © 2017 Milos Stosic. All rights reserved.
//

import UIKit
import CoreBluetooth

class BluetothViewController: UIViewController,CBCentralManagerDelegate,CBPeripheralDelegate {

    var menager:CBCentralManager!
    var peripheral:CBPeripheral!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menager = CBCentralManager(delegate: self, queue: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func centralManagerDidUpdateState(_ central: CBCentralManager)
 {
        if central.state  == .poweredOn {
            central.scanForPeripherals(withServices: nil, options: nil)
        } else {
            print("Bluetooth not available.")
        }
    }
    
     private func centralManager(
        central: CBCentralManager,
        didDiscoverPeripheral peripheral: CBPeripheral,
        advertisementData: [String : AnyObject],
        RSSI: NSNumber) {
        _ = (advertisementData as NSDictionary)
            .object(forKey: CBAdvertisementDataLocalNameKey)
            as? NSString
        
      
            self.menager.stopScan()
            
            self.peripheral = peripheral
            self.peripheral.delegate = self
            
            menager.connect(peripheral, options: nil)
        }
    
    
    
    func centralManager(
        central: CBCentralManager,
        didConnectPeripheral peripheral: CBPeripheral) {
        peripheral.discoverServices(nil)
    }
    
    func peripheral(
        _ peripheral: CBPeripheral,
        didDiscoverServices error: Error?) {
        for service in peripheral.services! {
            let thisService = service as CBService
            
                           peripheral.discoverCharacteristics(
                    nil,
                    for: thisService
                )
            
        }
    }
    
    func peripheral(
        _ peripheral: CBPeripheral,
        didDiscoverCharacteristicsFor service: CBService,
        error: Error?) {
        for characteristic in service.characteristics! {
            let thisCharacteristic = characteristic as CBCharacteristic
         
            
                self.peripheral.setNotifyValue(
                    true,
                    for: thisCharacteristic
                )
            
        }
    }
    
    func peripheral(
        _ peripheral: CBPeripheral,
        didUpdateValueFor characteristic: CBCharacteristic,
        error: Error?) {
        var _:UInt32 = 0;
        
    
      //      characteristic.value!.getBytes(&count, length: sizeof(UInt32))
         //   labelCount.text =
            //    NSString(format: "%llu", count) as String
        
    }
    
    
    func centralManager(
        _ central: CBCentralManager,
        didDisconnectPeripheral peripheral: CBPeripheral,
        error: Error?) {
        central.scanForPeripherals(withServices: nil, options: nil)
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}


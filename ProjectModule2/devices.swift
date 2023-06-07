func addYourDevices() {
    let livingRoomTV = TV(name: "Телевизор в зале")
    let livingRoomThermostat = Thermostat(name: "Термостат в зале")
    let livingRoomCurtain = Curtain(name: "Шторы в зале")
    let livingRoomLight = Light(name: "Лампочка в зале")
    let livingRoomDoor = Door(name: "Дверь в зале")
    
    let kitchenCurtain = Curtain(name: "Шторы на кухне")
    let kitchenLight = Light(name: "Лампочка на кухне")
    let kitchenDoor = Door(name: "Дверь на кухне")
    
    let bedroomCurtain = Curtain(name: "Шторы в спальне")
    let bedroomLight = Light(name: "Лампочка в спальне")
    let bedroomDoor = Door(name: "Дверь в спальне")
    let bedroomTV = TV(name: "Телевизор в спальне")
    
    let bathroomCurtain = Curtain(name: "Шторы в ванной")
    let bathroomLight = Light(name: "Лампочка в ванной")
    let bathroomDoor = Door(name: "Дверь в ванную")
    
    let smartHome = SmartHome()
    
    smartHome.addDevice(livingRoomTV)
    smartHome.addDevice(livingRoomThermostat)
    smartHome.addDevice(livingRoomCurtain)
    smartHome.addDevice(livingRoomLight)
    smartHome.addDevice(livingRoomDoor)
    
    smartHome.addDevice(kitchenCurtain)
    smartHome.addDevice(kitchenLight)
    smartHome.addDevice(kitchenDoor)
    
    smartHome.addDevice(bedroomCurtain)
    smartHome.addDevice(bedroomLight)
    smartHome.addDevice(bedroomDoor)
    smartHome.addDevice(bedroomTV)
    
    smartHome.addDevice(bathroomCurtain)
    smartHome.addDevice(bathroomLight)
    smartHome.addDevice(bathroomDoor)
}

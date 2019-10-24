bluetooth.onBluetoothConnected(function () {
    bluetoothConnected = 1
    music.playTone(262, music.beat(BeatFraction.Whole))
    music.playTone(392, music.beat(BeatFraction.Whole))
    music.playTone(523, music.beat(BeatFraction.Whole))
})
bluetooth.onBluetoothDisconnected(function () {
    bluetoothConnected = 0
    music.playTone(523, music.beat(BeatFraction.Whole))
    music.playTone(392, music.beat(BeatFraction.Whole))
    music.playTone(262, music.beat(BeatFraction.Whole))
})
let bluetoothConnected = 0
bluetoothConnected = 0
basic.forever(function () {
    if (bluetoothConnected == 1) {
        basic.showIcon(IconNames.Yes)
    } else {
        basic.showIcon(IconNames.No)
    }
})


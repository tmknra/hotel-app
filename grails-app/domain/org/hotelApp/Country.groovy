package org.hotelApp

class Country {

    String name
    String capital

    static constraints = {
        name maxSize: 255, blank: true, unique: true
        capital maxSize: 128, blank: true
    }

    @Override
    String toString() {
        name
    }
}

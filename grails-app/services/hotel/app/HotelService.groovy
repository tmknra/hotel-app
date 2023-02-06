package hotel.app

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap
import org.hotelApp.Country
import org.hotelApp.Hotel

@Transactional
class HotelService {

    Hotel save(String name, Integer rating, String url, Country country) {
        def hotel = new Hotel(name: name, rating: rating, siteUrl: url, country: country)
        hotel.save()
        hotel
    }

    Hotel save(Hotel hotel){
        hotel.save()
    }

    Hotel update(Hotel hotel) {
        def save = hotel.save()
        return save
    }

    void delete(Long id) {
        def get = Hotel.get(id)
        get.delete()
    }

}

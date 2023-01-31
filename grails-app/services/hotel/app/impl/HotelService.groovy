package hotel.app.impl

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap
import org.hotelApp.Country
import org.hotelApp.Hotel

import static org.springframework.http.ResponseEntity.notFound

@Transactional
class HotelService {

    def serviceMethod() {

    }

    Hotel save(String name, Integer rating, String url, Country country) {
        def hotel = new Hotel(name: name, rating: rating, siteUrl: url, country: country)
        hotel.save()
        hotel
    }

    Hotel save(GrailsParameterMap params) {
        println params
        def countryName = params.get('country')
        Country country = Country.findByName(countryName as String)

        def hotel = new Hotel(name: params.name, rating: params.rating, siteUrl: params.site, country: country)
        println hotel
        def save = hotel.save()
        println save
        println Hotel.list().get(Hotel.list().size()-1)
        hotel
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

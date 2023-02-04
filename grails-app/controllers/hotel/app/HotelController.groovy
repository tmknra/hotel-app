package hotel.app

import org.hotelApp.Country
import org.hotelApp.Hotel

class HotelController {

    HotelService hotelService

    static allowedMethods = [save: 'POST', update: 'PUT', delete: 'DELETE']

    def index() {
        params.max = params?.max ?: 10
        params.offset = params?.offset ?: 0
        def countryNameList = Country.list().name
        List<Hotel> resultHotelList
        def hotelTotalCount

        if (params.entityPatternSearchInput == null && params.country==null) {
            resultHotelList = Hotel.list(params)
            hotelTotalCount = Hotel.count
        } else {
            def hotelCriteria = Hotel.createCriteria()
            Country targetCountry = Country.findByName(params.country as String)
            String hotelNameSearchPattern = "\\.{0,}(?i)" + params.entityPatternSearchInput + "\\.{0,}";
            /*
                Не получилось найти методы firstResult() и maxResults(). Вероятно, дело в версии gorm, как и в ситуации
                ниже. Перепробовал возможные версии, несколько раз пересобирал билд целиком,
                но данных методов в классе Criteria нет. Возможно, что-то не так делаю.
                Могу только явно передать параметры в метод list(), что работает корректно - из базы возвращается список,
                ограниченный по количеству.
            * */
            resultHotelList = hotelCriteria.list(offset: params.offset, max: params.max) {
                if (targetCountry != null) {
                    eq('country', targetCountry)
                }
                rlike('name', hotelNameSearchPattern)
                order('rating', 'desc')
                order('name', 'asc')
            } as List<Hotel>

            hotelTotalCount = (Hotel.withCriteria() {
                if (targetCountry != null) {
                    eq('country', targetCountry)
                }
                rlike('name', hotelNameSearchPattern)
            } as List<Hotel>).size()
        }
        render view: 'index',
                model:
                        [
                                countryNameList: countryNameList,
                                hotelList      : resultHotelList,
                                hotelTotalCount: hotelTotalCount,
                                max            : params.max,
                                offset         : params.offset
                        ]
    }

    def show(Long id) {
        def get = Hotel.get(id)
        respond get, model: 'show'
    }

    def createNewHotel() {
        Hotel hotel;
        if (!(hotel = new Hotel(
                name: params.name,
                rating: params.rating,
                siteUrl: params.site,
                country: Country.findByName(params.country)))
                .validate()) {
            //todo need messages customization
            flash.error = message(error: 'Invalidated')
            println flash
        } else {
            hotelService.save(hotel)
            flash.message = message(message: 'Hotel created')
        }
        redirect view: 'index'
    }

    def edit(Hotel hotel) {
        respond hotel
    }

    def update(Hotel hotel) {
        if (!hotel.validate()) {
            flash.error = message(error: 'Invalidated')

        } else {
            hotelService.update(hotel)
            flash.message = message(message: 'Hotel updated')
        }
        redirect action: 'show', id: hotel.getId()
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }
        hotelService.delete(id)
        flash.message = message(message: 'Hotel successfully deleted')
        redirect action: 'index'
    }

    protected void notFound() {
        request.withFormat {
            form with {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'hotel.label', default: 'Hotel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

}

require 'rest-client'
require 'json'

module PrayerTime
  # Country names and numbers from Presidency of Religious Affairs
  $countries =  {"2" => "TURKIYE","33" => "ABD","166" => "AFGANISTAN","13" => "ALMANYA","17" => "ANDORRA","140" => "ANGOLA","125" => "ANGUILLA","90" => "ANTIGUA VE BARBUDA","199" => "ARJANTIN","25" => "ARNAVUTLUK","153" => "ARUBA","59" => "AVUSTRALYA","35" => "AVUSTURYA","5" => "AZERBAYCAN","54" => "BAHAMALAR","132" => "BAHREYN","177" => "BANGLADES","188" => "BARBADOS","208" => "BELARUS","11" => "BELCIKA","182" => "BELIZE","181" => "BENIN","51" => "BERMUDA","93" => "BIRLESIK ARAP EMIRLIGI","83" => "BOLIVYA","9" => "BOSNA HERSEK","167" => "BOTSVANA","146" => "BREZILYA","97" => "BRUNEI","44" => "BULGARISTAN","91" => "BURKINA FASO","154" => "BURMA (MYANMAR)","65" => "BURUNDI","155" => "BUTAN","156" => "CAD","43" => "CECENISTAN","16" => "CEK CUMHURIYETI","86" => "CEZAYIR","160" => "CIBUTI","61" => "CIN","26" => "DANIMARKA","180" => "DEMOKRATIK KONGO CUMHURIYETI","176" => "DOGU TIMOR","123" => "DOMINIK","72" => "DOMINIK CUMHURIYETI","139" => "EKVATOR","63" => "EKVATOR GINESI","165" => "EL SALVADOR","117" => "ENDONEZYA","175" => "ERITRE","104" => "ERMENISTAN","6" => "ESTONYA","95" => "ETYOPYA","145" => "FAS","197" => "FIJI","120" => "FILDISI SAHILI","126" => "FILIPINLER","204" => "FILISTIN","41" => "FINLANDIYA","21" => "FRANSA","79" => "GABON","109" => "GAMBIYA","143" => "GANA","111" => "GINE","58" => "GRANADA","48" => "GRONLAND","171" => "GUADELOPE","169" => "GUAM ADASI","99" => "GUATEMALA","67" => "GUNEY AFRIKA","128" => "GUNEY KORE","62" => "GURCISTAN","82" => "GUYANA","70" => "HAITI","187" => "HINDISTAN","30" => "HIRVATISTAN","4" => "HOLLANDA","66" => "HOLLANDA ANTILLERI","105" => "HONDURAS","113" => "HONG KONG","15" => "INGILTERE","124" => "IRAK","202" => "IRAN","32" => "IRLANDA","23" => "ISPANYA","205" => "ISRAIL","12" => "ISVEC","49" => "ISVICRE","8" => "ITALYA","122" => "IZLANDA","119" => "JAMAIKA","116" => "JAPONYA","161" => "KAMBOCYA","184" => "KAMERUN","52" => "KANADA","34" => "KARADAG","94" => "KATAR","92" => "KAZAKISTAN","114" => "KENYA","168" => "KIRGIZISTAN","57" => "KOLOMBIYA","88" => "KOMORLAR","18" => "KOSOVA","162" => "KOSTARIKA","209" => "KUBA","206" => "KUDUS","133" => "KUVEYT","1" => "KUZEY KIBRIS","142" => "KUZEY KORE","134" => "LAOS","174" => "LESOTO","20" => "LETONYA","73" => "LIBERYA","203" => "LIBYA","38" => "LIECHTENSTEIN","47" => "LITVANYA","42" => "LUBNAN","31" => "LUKSEMBURG","7" => "MACARISTAN","98" => "MADAGASKAR","100" => "MAKAO","28" => "MAKEDONYA","55" => "MALAVI","103" => "MALDIVLER","107" => "MALEZYA","152" => "MALI","24" => "MALTA","87" => "MARTINIK","164" => "MAURITIUS ADASI","157" => "MAYOTTE","53" => "MEKSIKA","85" => "MIKRONEZYA","189" => "MISIR","60" => "MOGOLISTAN","46" => "MOLDAVYA","3" => "MONAKO","147" => "MONTSERRAT (U.K.)","106" => "MORITANYA","151" => "MOZAMBIK","196" => "NAMBIYA","76" => "NEPAL","84" => "NIJER","127" => "NIJERYA","141" => "NIKARAGUA","178" => "NIUE","36" => "NORVEC","80" => "ORTA AFRIKA CUMHURIYETI","131" => "OZBEKISTAN","77" => "PAKISTAN","149" => "PALAU","89" => "PANAMA","185" => "PAPUA YENI GINE","194" => "PARAGUAY","69" => "PERU","183" => "PITCAIRN ADASI","39" => "POLONYA","45" => "PORTEKIZ","68" => "PORTO RIKO","112" => "REUNION","37" => "ROMANYA","81" => "RUANDA","207" => "RUSYA","198" => "SAMOA","102" => "SENEGAL","138" => "SEYSEL ADALARI","200" => "SILI","179" => "SINGAPUR","27" => "SIRBISTAN","14" => "SLOVAKYA","19" => "SLOVENYA","150" => "SOMALI","74" => "SRI LANKA","129" => "SUDAN","172" => "SURINAM","191" => "SURIYE","64" => "SUUDI ARABISTAN","163" => "SVALBARD","170" => "SVAZILAND","101" => "TACIKISTAN","110" => "TANZANYA","137" => "TAYLAND","108" => "TAYVAN","71" => "TOGO","130" => "TONGA","96" => "TRINIDAT VE TOBAGO","118" => "TUNUS","159" => "TURKMENISTAN","75" => "UGANDA","40" => "UKRAYNA","29" => "UKRAYNA","173" => "UMMAN","192" => "URDUN","201" => "URUGUAY","56" => "VANUATU","10" => "VATIKAN","186" => "VENEZUELA","135" => "VIETNAM","148" => "YEMEN","115" => "YENI KALEDONYA","193" => "YENI ZELLANDA","144" => "YESIL BURUN","22" => "YUNANISTAN","158" => "ZAMBIYA","136" => "ZIMBABVE"}

  class Request
    def initialize
      @cities_url = "http://www.diyanet.gov.tr/PrayerTime/FillState?countryCode="
      @towns_url = "http://www.diyanet.gov.tr/PrayerTime/FillCity?itemId="
      @time_url = "http://www.diyanet.gov.tr/PrayerTime/PrayerTimesSet"
    end

    def get_cities(country)
      begin
        if $countries.key(country)
          response = RestClient.get(@cities_url + $countries.key(country))
          JSON.parse(response)
        else
          return nil
        end
      rescue RestClient::ExceptionWithResponse => err
        err.response
      end
    end

    def get_towns(country, city)
      begin
        if get_cities(country)
          if get_cities(country).select{|c| c if c["Text"] == city} != []
            city_id = get_cities(country).select{|c| c if c["Text"] == city}.first["Value"]
            response = RestClient.get(@towns_url + city_id)
            JSON.parse(response)
          else
            return nil
          end
        else
         return nil
        end
      rescue RestClient::ExceptionWithResponse => err
        err.response
      end
    end

    def pray_times(country, city, town)
      begin
        if !get_towns(country, city).nil?
          city_id = get_cities(country).select{|c| c if c["Text"] == city}.first["Value"]
          if get_towns(country, city).select{|t| t if t["Text"] == town} != []
            town_id = get_towns(country, city).select{|t| t if t["Text"] == town}.first["Value"]
            response = RestClient.post(@time_url, :countryName => $countries.key(country), :stateName => city_id, :name => town_id)
            JSON.parse(response)
          else
            return nil
          end
        else
          return nil
        end
      rescue RestClient::ExceptionWithResponse => err
        err.response
      end
    end
  end
end



---

**Title:** Machine Test Lilac

**Base URL:** [https://test.myfliqapp.com/api/v1](https://test.myfliqapp.com/api/v1)  
 **Test Phone Number:** \+918087808780

 **Test OTP:** 111111

 Figma URL: https://www.figma.com/design/MZxtARRcRlf8qyCpCgoJWB/MACHINE-TEST-FLUTTER

---

### **📲 REQUEST OTP**

* **Method:** POST

* **URL:** `{{base_url}}/auth/registration-otp-codes/actions/phone/send-otp`

#### **Sample Request Model:**

{  
    "data": {  
        "type": "registration\_otp\_codes",  
        "attributes": {  
            "phone": "\+918087808780"  
        }  
    }  
}

#### **Sample Response Model:**

{  
    "data": 111111,  
    "status": true,  
    "message": "OTP has been sent to your registered phone number."  
}

---

### **✅ VERIFY OTP**

* **Method:** POST

* **Endpoint:** `{{base_url}}/auth/registration-otp-codes/actions/phone/verify-otp`

**`🔧 Integration Note:`**

`You must use the japx package to parse the JSON:API-compliant response returned by this endpoint.`

#### **Sample Request Model:**

{  
   "data": {  
       "type": "registration\_otp\_codes",  
       "attributes": {  
           "phone": "+\+918087808780",  
           "otp": 111111,  
           "device\_meta": {  
               "type": "web",  
               "device-name": "HP Pavilion 14-EP0068TU",  
               "device-os-version": "Linux x86\_64",  
               "browser": "Mozilla Firefox Snap for Ubuntu (64-bit)",  
               "browser\_version": "112.0.2",  
               "user-agent": "Mozilla/5.0 (X11; Ubuntu; Linux x86\_64; rv:109.0) Gecko/20100101 Firefox/112.0",  
               "screen\_resolution": "1600x900",  
               "language": "en-GB"  
           }  
       }  
   }  
}

#### **Sample Response Model:**

{  
    "data": {  
        "type": "customers",  
        "id": "55",  
        "attributes": {  
            "name": "Akhil",  
            "username": "akhil.lilac@gmail.com",  
            "email": "akhil.lilac@gmail.com",  
            "date\_of\_birth": "1999-11-03",  
            "phone": "+919562264094",  
            "gender": "male",  
            "address": "Test Address",  
            "is\_active": true,  
            "coin\_balance": 3,  
            "customer\_code": "FQ002",  
            "is\_premium\_customer": false,  
            "profile\_completion\_percentage": 60,  
            "preferred\_gender": "women",  
            "selfie\_verification\_image\_path": "106/ZiKjEOxOGg5GZGwrT7cQgx6Jzit9otews3kwg4co.jpg",  
            "selfie\_verification\_video\_path": "107/06K6ExP0ByOQEQZc6prUaiD227xbuwssslwk480c.bin",  
            "selfie\_verification\_uploaded\_at": "2025-04-04T04:51:39.000000Z",  
            "remaining\_swipe\_limit": 400,  
            "reset\_swipe\_limit\_at": "2025-04-08 14:22:06",  
            "remaining\_super\_like\_limit": 0,  
            "reset\_super\_like\_limit\_at": "2025-04-08 14:20:48",  
            "remaining\_flash\_message\_limit": 10,  
            "reset\_flash\_message\_limit\_at": "2025-04-08 14:20:48",  
            "current\_location": "7R3P+XX3, 147/1, Ummalathoor, Kozhikode, Kerala 673008, India",  
            "current\_latitude": "11.25431710",  
            "current\_longitude": "75.83703240",  
            "height\_in\_cm": 177,  
            "relationship\_status\_name": "Single",  
            "religion\_name": "Hindu",  
            "drinking\_habit\_name": "Occasionally",  
            "smoking\_habit\_name": "Smoking",  
            "sexual\_orientation\_name": "Straight",  
            "educational\_qualification\_name": "Bachelors",  
            "native\_language\_name": "Malayalam",  
            "occupation\_name": "Software Engineer",  
            "filter\_passport\_mode\_location": "7R3P+XX3, 147/1, Ummalathoor, Kozhikode, Kerala 673008, India",  
            "filter\_passport\_mode\_latitude": "11.25431710",  
            "filter\_passport\_mode\_longitude": "75.83703240",  
            "is\_real\_gifts\_accepted": true,  
            "is\_receiving\_push\_notifications": true,  
            "is\_receiving\_flash\_messages": true,  
            "is\_read\_receipts\_enabled": true,  
            "profile\_photo\_url": "https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/3/conversions/52eaLyxLWXnkDO7KcjAh87jQzimsyzyohbko80s4-default.jpg",  
            "square100\_profile\_photo\_url": "https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/3/conversions/52eaLyxLWXnkDO7KcjAh87jQzimsyzyohbko80s4-square100.jpg",  
            "square300\_profile\_photo\_url": "https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/3/conversions/52eaLyxLWXnkDO7KcjAh87jQzimsyzyohbko80s4-square300.jpg",  
            "square500\_profile\_photo\_url": "https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/3/conversions/52eaLyxLWXnkDO7KcjAh87jQzimsyzyohbko80s4-square500.jpg",  
            "age": 25,  
            "auth\_status": {  
                "access\_token": "117|KfuqqNXivj5Kztyf8cqwU11XJXlpmraS0mayLqu58a3bf708",  
                "token\_type": "Bearer",  
                "is\_2fa\_configured\_by\_user": false,  
                "is\_2fa\_verified\_by\_user": false,  
                "is\_email\_verification\_required": true  
            }  
        }  
    }  
}

---

**💬 GET CHAT PROFILE**

* **Method:** GET  
* **Endpoint:** `{{base_url}}/chat/chat-messages/queries/contact-users`

#### **`🔧 Integration Note:`**

`You must use the japx package to parse the JSON:API-compliant response returned by this endpoint.`

#### **Sample Request Model:**

#### **Sample Response Model:**

{  
  "data": \[  
    {  
      "type": "customers",  
      "id": "56",  
      "attributes": {  
        "message\_received\_from\_partner\_at": "2025-04-07 09:28:31.000000",  
        "auth\_user\_id": 55,  
        "name": "Arjun",  
        "username": "arjun@gmail.com",  
        "email": "arjun@gmail.com",  
        "profile\_photo\_path": null,  
        "profile\_photo\_id": null,  
        "phone": "+919400000001",  
        "gender": "male",  
        "country\_id": 78,  
        "country\_name": "India",  
        "state\_id": null,  
        "state\_name": null,  
        "city\_id": null,  
        "city\_name": null,  
        "custom\_city\_name": null,  
        "is\_active": true,  
        "customer\_code": "FQ003",  
        "is\_premium\_customer": false,  
        "is\_online": false,  
        "bio\_intro\_text": null,  
        "last\_active\_at": null,  
        "date\_of\_birth": "1996-11-11",  
        "native\_language\_id": 1,  
        "native\_language\_name": "English (United States)",  
        "profile\_photo\_url": "https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/10/conversions/gYlvYiE8ZeK2ZawVmcvL4oWkzion23fnhz44440s-default.jpg",  
        "square100\_profile\_photo\_url": "https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/10/conversions/gYlvYiE8ZeK2ZawVmcvL4oWkzion23fnhz44440s-square100.jpg",  
        "square300\_profile\_photo\_url": "https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/10/conversions/gYlvYiE8ZeK2ZawVmcvL4oWkzion23fnhz44440s-square300.jpg",  
        "square500\_profile\_photo\_url": "https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/10/conversions/gYlvYiE8ZeK2ZawVmcvL4oWkzion23fnhz44440s-square500.jpg",  
        "age": 28  
      }  
    }  
      
  \],  
  "meta": {  
    "pagination": {  
      "total": 10,  
      "count": 10,  
      "per\_page": 20,  
      "current\_page": 1,  
      "total\_pages": 1  
    }  
  },  
  "links": {  
    "self": "http://test.myfliqapp.com/api/v1/chat/chat-messages/queries/contact-users?page%5Bnumber%5D=1",  
    "first": "http://test.myfliqapp.com/api/v1/chat/chat-messages/queries/contact-users?page%5Bnumber%5D=1",  
    "last": "http://test.myfliqapp.com/api/v1/chat/chat-messages/queries/contact-users?page%5Bnumber%5D=1"  
  }  
}

**💬 GET CHAT MESSAGES BETWEEN USERS**

* **Method:** GET  
* **Endpoint:** `{{base_url}}/chat/chat-messages/queries/chat-between-users/55/81`


 **`🔧 Integration Note:`**

`You must use the japx package to parse the JSON:API-compliant response returned by this endpoint.`

SAMPLE RESPONSE:  
{  
  "data": \[  
    {  
      "type": "chat\_messages",  
      "id": "1204",  
      "attributes": {  
        "chat\_thread\_id": 49,  
        "chat\_message\_type\_id": 1,  
        "sender\_id": 81,  
        "receiver\_id": 55,  
        "message": "mm",  
        "media\_meta": null,  
        "is\_one\_time\_view": false,  
        "is\_on\_vanish\_mode": false,  
        "scheduled\_at": null,  
        "sent\_at": "2025-04-06T18:53:32.000000Z",  
        "delivered\_at": "2025-04-07T03:58:41.000000Z",  
        "viewed\_at": null,  
        "sticker\_id": null,  
        "gift\_order\_id": null,  
        "sender\_coin\_transaction\_id": null,  
        "receiver\_coin\_transaction\_id": null,  
        "transfer\_coins": null,  
        "deleted\_for\_sender\_by": null,  
        "deleted\_for\_sender\_at": null,  
        "deleted\_for\_receiver\_by": null,  
        "deleted\_for\_receiver\_at": null,  
        "created\_at": "2025-04-06T18:53:32.000000Z",  
        "updated\_at": "2025-04-07T03:58:41.000000Z",  
        "deleted\_at": null,  
        "media\_url": null  
      },  
      "relationships": {  
        "sender": {  
          "data": {  
            "type": "sender",  
            "id": "81"  
          }  
        },  
        "sticker": {  
          "data": null  
        },  
        "giftOrder": {  
          "data": null  
        }  
      }  
    }  
  \],  
  "included": \[  
    {  
      "type": "sender",  
      "id": "81",  
      "attributes": {  
        "name": "amrutha",  
        "username": "amrutha@gmail.com",  
        "email": "amrutha@gmail.com",  
        "profile\_photo\_url": "https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/40/conversions/fYNwYdjGGtvGTKTME16oJnyfzios9tva300ok4k0-default.jpg",  
        "square100\_profile\_photo\_url": "https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/40/conversions/fYNwYdjGGtvGTKTME16oJnyfzios9tva300ok4k0-square100.jpg",  
        "square300\_profile\_photo\_url": "https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/40/conversions/fYNwYdjGGtvGTKTME16oJnyfzios9tva300ok4k0-square300.jpg",  
        "square500\_profile\_photo\_url": "https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/40/conversions/fYNwYdjGGtvGTKTME16oJnyfzios9tva300ok4k0-square500.jpg",  
        "age": null  
      }  
    }  
  \],  
  "meta": {  
    "pagination": {  
      "total": 95,  
      "count": 20,  
      "per\_page": 20,  
      "current\_page": 1,  
      "total\_pages": 5  
    }  
  },  
  "links": {  
    "self": "http://test.myfliqapp.com/api/v1/chat/chat-messages/queries/chat-between-users/55/81?page%5Bnumber%5D=1",  
    "first": "http://test.myfliqapp.com/api/v1/chat/chat-messages/queries/chat-between-users/55/81?page%5Bnumber%5D=1",  
    "next": "http://test.myfliqapp.com/api/v1/chat/chat-messages/queries/chat-between-users/55/81?page%5Bnumber%5D=2",  
    "last": "http://test.myfliqapp.com/api/v1/chat/chat-messages/queries/chat-between-users/55/81?page%5Bnumber%5D=5"  
  }  
}


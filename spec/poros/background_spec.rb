require 'rails_helper'

RSpec.describe 'Forecast' do
  describe 'it encapsulates and returns a single image' do
    it 'shows image attributes' do
        image=
        {
          "total": 4783,
          "total_pages": 4783,
          "results": [
              {
                  "id": "A4RpHR83luM",
                  "created_at": "2021-05-01T04:12:54-04:00",
                  "updated_at": "2021-06-14T03:22:54-04:00",
                  "promoted_at": nil,
                  "width": 5954,
                  "height": 3969,
                  "color": "#0c2626",
                  "blur_hash": "L867}^NGNIxY0gxaxENb==RkWXs,",
                  "description": "Night Time Downtown Denver",
                  "alt_description": "city skyline during night time",
                  "urls": {
                      "raw": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?ixid=MnwyMzkyNjl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MjM2ODAyNjY&ixlib=rb-1.2.1",
                      "full": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMzkyNjl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MjM2ODAyNjY&ixlib=rb-1.2.1&q=85",
                      "regular": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzkyNjl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MjM2ODAyNjY&ixlib=rb-1.2.1&q=80&w=1080",
                      "small": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzkyNjl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MjM2ODAyNjY&ixlib=rb-1.2.1&q=80&w=400",
                      "thumb": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzkyNjl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MjM2ODAyNjY&ixlib=rb-1.2.1&q=80&w=200"
                  },
                  "links": {
                      "self": "https://api.unsplash.com/photos/A4RpHR83luM",
                      "html": "https://unsplash.com/photos/A4RpHR83luM",
                      "download": "https://unsplash.com/photos/A4RpHR83luM/download",
                      "download_location": "https://api.unsplash.com/photos/A4RpHR83luM/download?ixid=MnwyMzkyNjl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MjM2ODAyNjY"
                  },
                  "categories": [],
                  "likes": 2,
                  "liked_by_user": false,
                  "current_user_collections": [],
                  "sponsorship": nil,
                  "user": {
                      "id": "t2RB-3lbgSk",
                      "updated_at": "2021-06-14T04:51:20-04:00",
                      "username": "rdehamer",
                      "name": "Ryan De Hamer",
                      "first_name": "Ryan",
                      "last_name": "De Hamer",
                      "twitter_username": nil,
                      "portfolio_url": "http://www.dehamermedia.com",
                      "bio": "Midwest -> Anywhere\r\nMy images are collected all around the country working with brands, athletes and fitness influencers",
                      "location": nil,
                      "links": {
                          "self": "https://api.unsplash.com/users/rdehamer",
                          "html": "https://unsplash.com/@rdehamer",
                          "photos": "https://api.unsplash.com/users/rdehamer/photos",
                          "likes": "https://api.unsplash.com/users/rdehamer/likes",
                          "portfolio": "https://api.unsplash.com/users/rdehamer/portfolio",
                          "following": "https://api.unsplash.com/users/rdehamer/following",
                          "followers": "https://api.unsplash.com/users/rdehamer/followers"
                      },
                      "profile_image": {
                          "small": "https://images.unsplash.com/profile-1577912636161-6a3ada136470image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                          "medium": "https://images.unsplash.com/profile-1577912636161-6a3ada136470image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                          "large": "https://images.unsplash.com/profile-1577912636161-6a3ada136470image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
                      },
                      "instagram_username": "Ryan_dehamer",
                      "total_collections": 6,
                      "total_likes": 0,
                      "total_photos": 69,
                      "accepted_tos": true,
                      "for_hire": false
                  },
                  "tags": [
                      {
                          "type": "landing_page",
                          "title": "city",
                          "source": {
                              "ancestry": {
                                  "type": {
                                      "slug": "wallpapers",
                                      "pretty_slug": "HD Wallpapers"
                                  },
                                  "category": {
                                      "slug": "travel",
                                      "pretty_slug": "Travel"
                                  },
                                  "subcategory": {
                                      "slug": "city",
                                      "pretty_slug": "City"
                                  }
                              },
                              "title": "HD City Wallpapers",
                              "subtitle": "Download Free City Wallpapers",
                              "description": "Choose from a curated selection of city wallpapers for your mobile and desktop screens. Always free on Unsplash.",
                              "meta_title": "City Wallpapers: Free HD Download [500+ HQ] | Unsplash",
                              "meta_description": "Choose from hundreds of free city wallpapers. Download HD wallpapers for free on Unsplash.",
                              "cover_photo": {
                                  "id": "Nyvq2juw4_o",
                                  "created_at": "2016-10-31T20:26:28-04:00",
                                  "updated_at": "2021-06-10T11:32:44-04:00",
                                  "promoted_at": "2016-10-31T20:26:28-04:00",
                                  "width": 3465,
                                  "height": 2131,
                                  "color": "#0c2640",
                                  "blur_hash": "LhEMa,W=WVWW_4kBjtW=?bkBaefR",
                                  "description": "City architecture and skyscrapers near waterfront",
                                  "alt_description": "white and brown city buildings during daytime",
                                  "urls": {
                                      "raw": "https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixlib=rb-1.2.1",
                                      "full": "https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb",
                                      "regular": "https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max",
                                      "small": "https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max",
                                      "thumb": "https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max"
                                  },
                                  "links": {
                                      "self": "https://api.unsplash.com/photos/Nyvq2juw4_o",
                                      "html": "https://unsplash.com/photos/Nyvq2juw4_o",
                                      "download": "https://unsplash.com/photos/Nyvq2juw4_o/download",
                                      "download_location": "https://api.unsplash.com/photos/Nyvq2juw4_o/download"
                                  },
                                  "categories": [],
                                  "likes": 2350,
                                  "liked_by_user": false,
                                  "current_user_collections": [],
                                  "sponsorship": nil,
                                  "user": {
                                      "id": "1--L3vNK0TA",
                                      "updated_at": "2021-06-10T22:45:08-04:00",
                                      "username": "peterlaster",
                                      "name": "Pedro Lastra",
                                      "first_name": "Pedro",
                                      "last_name": "Lastra",
                                      "twitter_username": nil,
                                      "portfolio_url": "https://www.flickr.com/photos/lastingimages/",
                                      "bio": nil,
                                      "location": nil,
                                      "links": {
                                          "self": "https://api.unsplash.com/users/peterlaster",
                                          "html": "https://unsplash.com/@peterlaster",
                                          "photos": "https://api.unsplash.com/users/peterlaster/photos",
                                          "likes": "https://api.unsplash.com/users/peterlaster/likes",
                                          "portfolio": "https://api.unsplash.com/users/peterlaster/portfolio",
                                          "following": "https://api.unsplash.com/users/peterlaster/following",
                                          "followers": "https://api.unsplash.com/users/peterlaster/followers"
                                      },
                                      "profile_image": {
                                          "small": "https://images.unsplash.com/placeholder-avatars/extra-large.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                                          "medium": "https://images.unsplash.com/placeholder-avatars/extra-large.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                                          "large": "https://images.unsplash.com/placeholder-avatars/extra-large.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
                                      },
                                      "instagram_username": nil,
                                      "total_collections": 10,
                                      "total_likes": 46,
                                      "total_photos": 86,
                                      "accepted_tos": false,
                                      "for_hire": false
                                  }
                              }
                          }
                      },
                      {
                          "type": "search",
                          "title": "building"
                      },
                      {
                          "type": "search",
                          "title": "urban"
                      }
                  ]
              }
          ]
      }
      background = Background.new(image)
      expect(background).to be_a(Background)
      expect(background.image[:description]).to eq("Night Time Downtown Denver")
      expect(background.image[:image_url]).to eq("https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMzkyNjl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MjM2ODAyNjY&ixlib=rb-1.2.1&q=85")
      expect(background.image).to have_key(:attribution)
      expect(background.image[:attribution][:source]).to eq("https://unsplash.com")
      expect(background.image[:attribution][:author]).to eq("rdehamer")
      expect(background.image[:attribution][:portfolio]).to eq("https://unsplash.com/@rdehamer")
    end
  end
end

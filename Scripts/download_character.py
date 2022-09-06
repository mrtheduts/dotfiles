from selenium import webdriver
from selenium.webdriver.common.keys import Keys

pg = webdriver.Firefox()
pg.get('https://v6p9d9t4.ssl.hwcdn.net/html/3887561/index.html')

def go_to_zero(elem, max):
    for i in range(max):
        elem.send_keys(Keys.LEFT)

max_eyes = 13
eyes_value = 0
eyes = pg.find_element(value = "eyesInput")

max_mouth = 9
mouth_value = 0
mouth = pg.find_element(value = "mouthInput")

max_ears = 7
ears_value = 0
ears = pg.find_element(value = "earsInput")

max_torso = 6
torso_value = 0
torso = pg.find_element(value = "torsoInput")

max_hair = 23
hair_value = 0
hair = pg.find_element(value = "hairInput")

go_to_zero(eyes, max_eyes)
go_to_zero(mouth, max_mouth)
go_to_zero(ears, max_ears)
go_to_zero(torso, max_torso)
go_to_zero(hair, max_hair)

download = pg.find_element(value = "exportlink")

for count_eyes in range(max_eyes - 1):
    for count_mouth in range(max_mouth - 1):
        for count_ears in range(max_ears - 1):
            for count_torso in range(max_torso - 1):
                for count_hair in range(max_hair - 1):
                    hair.send_keys(Keys.RIGHT)
                    download.click()
                torso.send_keys(Keys.RIGHT)
                go_to_zero(hair, max_hair)
            ears.send_keys(Keys.RIGHT)
            go_to_zero(torso, max_torso)
        mouth.send_keys(Keys.RIGHT)
        go_to_zero(ears, max_ears)
    eyes.send_keys(Keys.RIGHT)
    go_to_zero(mouth, max_mouth)


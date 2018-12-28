#coding:utf-8

#シリアル通信で文字をArduino側に送信
#aが押されたら通信を中止するプログラム

import serial   #モジュール名はpyserialだが, importする際はserialである

def main():
    with serial.Serial('COM4',19200,timeout=1) as ser:

        while True:

            # Arduino の Serial.println で流した文字列を
            # これで受け取って、コマンドプロンプトに表示
            src_c = ser.readline()
            c = src_c.decode("utf-8")
            print(c)


        ser.close()

if __name__ == "__main__":
    main()

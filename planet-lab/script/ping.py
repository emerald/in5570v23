#!/usr/bin/env python3

import fileinput
import os.path
import pexpect
from pexpect import EOF
import re
import sys

LOGIN = 'diku_IN5570'
KEYPATH = os.path.join(os.path.expanduser("~"), '.ssh', 'id_rsa')
PROMPT=r"[#$]"
TIMEOUT=10

class CouldNotLogin(Exception):
    def __init__(self, message):
        # Call the base class constructor with the parameters it needs
        super(CouldNotLogin, self).__init__(message)

def _all_except_last_line(text):
    return '\n'.join(text.split('\n')[:-1])


class SSH(pexpect.spawn):
    def __init__(self, server):
        pexpect.spawn.__init__(self,
            'ssh -o StrictHostKeyChecking=no -l %s -i %s %s' % (LOGIN, KEYPATH, server),
            encoding='utf-8',
            timeout=TIMEOUT)
        self.setecho(False)

    def expect(self, p):
        return super(SSH, self).expect(p, timeout=TIMEOUT)


    def login(self):
        i = self.expect([PROMPT,
            "(?i)are you sure you want to continue connecting"])
        if i == 1:
            self.sendline("yes")
            i = s.expect([PROMPT])

        if i != 0:
            raise CouldNotLogin(self.before)

    def run_command(self, cmd):
        self.sendline(cmd)
        self.expect([PROMPT])
        return s.before


def print2(server, message):
    print("BAD " + server)
    prefix = '  !! '
    print('  !! ' + message.strip().replace('\n', '\n' + prefix))


for line in fileinput.input():
    server = line.strip()
    print(server)

    s = SSH(server)

    try:
        s.login()
        print("# Logged in; pinging google.com")
        s.sendline("sudo ping -c 1 google.com")
        i = s.expect(["Name or service not known", "google.com ping statistics"])
        if i == 0:
            print2(server, "Can't ping out")
        else:
            print("GOOD " + server)

        s.sendline('exit')
        s.expect(EOF)
    except CouldNotLogin as e:
        print2(server, e.message)
    except pexpect.exceptions.TIMEOUT:
        print2(server, 'Timeout; skipping to next machine.')
    except pexpect.exceptions.EOF:
        print2(server, s.before)

    s.close()

    sys.stdout.flush()

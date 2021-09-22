# Password policy

### Before starting: [Debian Guide](https://www.debian.org/doc/manuals/securing-debian-manual/ch04s11.es.html)


https://www.2daygeek.com/how-to-set-password-complexity-policy-on-linux/

```
vi /etc/login.defs
```

To set up a strong password policy, you have to comply with the following requirements:
• Your password has to expire every 30 days.
```
PASS_MAX_DAYS    30
```

• The minimum number of days allowed before the modification of a password will
be set to 2.
```
PASS_MIN_DAYS    0
```

• The user has to receive a warning message 7 days before their password expires.
```
PASS_WARN_AGE   7
```

```
vi /etc/pam.d/common-password
```
• Your password must be at least 10 characters long. It must contain an uppercase
letter and a number. Also, it must not contain more than 3 consecutive identical
characters.

in this line:
```
password        requisite                       pam_deny.so minlen=10
```

add: minlen=10

so it's something like this:
```
password        requisite                       pam_deny.so minlen=10 ucredit=-1 dcredit=-1
```

• The password must not include the name of the user.
```
usercheck = 1
```
• The following rule does not apply to the root password: The password must have
at least 7 characters that are not part of the former password.
• Of course, your root password has to comply with this policy.


Other commands able to apply in /etc/pam.d/common-password
```
minlen = minimum password length
minclass = the minimum number of character types that must be used (i.e., uppercase, lowercase, digits, other)
maxrepeat = the maximum number of times a single character may be repeated
maxclassrepeat = the maximum number of characters in a row that can be in the same class
lcredit = maximum number of lowercase characters that will generate a credit
ucredit = maximum number of uppercase characters that will generate a credit
dcredit = maximum number of digits that will generate a credit
ocredit = maximum number of other characters that will generate a credit
difok = the minimum number of characters that must be different from the old password
remember = the number of passwords that will be remembered by the system so that they cannot be used again
gecoscheck = whether to check for the words from the passwd entry GECOS string of the user (enabled if the value is not 0)
dictcheck = whether to check for the words from the cracklib dictionary (enabled if the value is not 0)
usercheck = whether to check if the password contains the user name in some form (enabled if the value is not 0)
enforcing = new password is rejected if it fails the check and the value is not 0
dictpath = path to the cracklib dictionaries. Default is to use the cracklib default.
```


to check user settings:
```
sudo chage -l albgarci
```


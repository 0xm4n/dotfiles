SetCapsLockState, AlwaysOff

CapsLock & Tab::
GetKeyState, CapsLockState, CapsLock, T
if CapsLockState = D
    SetCapsLockState, AlwaysOff
else
    SetCapsLockState, AlwaysOn
KeyWait, ``
return

CapsLock::Send, {ESC}

CapsLock & q:: Send, ^q
CapsLock & w:: Send, ^w
CapsLock & e:: Send, ^e
CapsLock & r:: Send, ^r
CapsLock & t:: Send, ^t
CapsLock & y:: Send, ^y
CapsLock & u:: Send, ^u
CapsLock & i:: Send, ^i
CapsLock & o:: Send, ^o
CapsLock & p:: Send, ^p
CapsLock & [:: Send, ^[
CapsLock & ]:: Send, ^]
CapsLock & \:: Send, ^\

CapsLock & a:: Send, ^a
CapsLock & s:: Send, ^s
CapsLock & d:: Send, ^d
CapsLock & f:: Send, ^f
CapsLock & g:: Send, ^g
CapsLock & h:: Send, {Left}
CapsLock & j:: Send, {Down}
CapsLock & k:: Send, {Up}
CapsLock & l:: Send, {Right}

CapsLock & z:: Send, ^z
CapsLock & x:: Send, ^x
CapsLock & c:: Send, ^c
CapsLock & v:: Send, ^v
CapsLock & b:: Send, ^b
CapsLock & n:: Send, ^n
CapsLock & m:: Send, ^m
CapsLock & ,:: Send, {BS}
CapsLock & .:: Send, ^{BS}
CapsLock & /:: Send, ^/

CapsLock & Space:: Send, {Enter}

alt & u:: Send, {PgUp}
alt & i:: Send, {Home}
alt & o:: Send, {End}
alt & p:: Send, {PgDn}
alt & h:: Send, ^h
alt & j:: Send, ^j
alt & k:: Send, ^k
alt & l:: Send, ^l

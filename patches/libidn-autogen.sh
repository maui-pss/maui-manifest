From 69fc8f88fb958d6af441e813224fc518af5234fc Mon Sep 17 00:00:00 2001
From: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
Date: Tue, 9 Oct 2012 10:27:22 +0200
Subject: [PATCH][BUILD] Add missing autogen.sh.


Signed-off-by: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
---
 autogen.sh | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100755 autogen.sh

diff --git a/autogen.sh b/autogen.sh
new file mode 100755
index 0000000..f314b0b
--- /dev/null
+++ b/autogen.sh
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+test -n "$srcdir" || srcdir=`dirname "$0"`
+test -n "$srcdir" || srcdir=.
+
+olddir=`pwd`
+cd "$srcdir"
+
+[ ! -e ChangeLog ] && touch ChangeLog
+
+cd "$srcdir"
+autoreconf -fi --warnings=none | egrep -v 'warning|error'
+
+cd "$olddir"
+test -n "$NOCONFIGURE" || "$srcdir/configure" "$@"
+
+# Force a success exit-code
+exit 0
-- 
1.7.12.2


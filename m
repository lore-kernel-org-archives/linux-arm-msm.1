Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923E618DB1A
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789322676; cv=none; b=opPp6pMVBtzvT7r4UASt4/liV6L6q6G0NdsGqLcdh+VPdruHXS22x122Or9ZpbjYBr+sQPAFHF34THpvjL1jH4yuWM8hjHRNUcR1Up/rQ4Dt7qHPPDbkpcQSpiQO2S4X5XdaNr0uVj+9VPlxKxgSLabxTcANLsc/vIQE9A+qid8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789322676; c=relaxed/simple;
	bh=iBDKlpYSrIxEWTDJyy0WenSs+m6BqLBO4IH5of9UG88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OnGx9DdtOGKcC5YpYFxM63IwWTS9Y1FHnxDRJPkyXzB9vbp9LiQMgYtHSXNuvbRjkbgqmiJaUE+p/70LdBaP+CEpO/SH24cU0Slxx/OrhocPpc9i8csksou7FZoluuHAdrD0opvd1bNiKKKPAmVhdevPSCRti5+xT/f3Bxw0IO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZIPmr0v1; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZIPmr0v1"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-395cf2535acso2489905a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 11:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789322672; x=1789927472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByuJG/ToMKb3/GEaCPutmgXOi2odRqpn7f8I+oxWvKM=;
        b=ZIPmr0v12bDZGxvas6JF8G0TK6XpkcthUihy/OYHMmv6LKwnqbzqSZnn3aC2xwOMTZ
         D2BUDxemW0taAdwxUDlTOMLvsfJu5ASd8Dm68a88TYAIHu4rSeY8eB6sajJrbZ/xp+uX
         MbhSY2iZ6rPfp4YayuRmG2wBW0H2QXbd5AUKvIKERDdi3IenaPJkxIzyAjXjqAa+ZC2R
         uP3YGOWz0BCLCJcOo8DcYzkzogk8D93lw8pFkS+L08Hm2ZUwM2kCFWN0l9rby8kOWRgH
         5T62SUHxU5jF8vk49OwiBZATsarIZOlMYB8FysqtgEoiySvVntCZGTHA1OI6LM5bdqH7
         T35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789322672; x=1789927472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ByuJG/ToMKb3/GEaCPutmgXOi2odRqpn7f8I+oxWvKM=;
        b=oGVFgWwt0fovpGenWyWISaYnauRlKDMAfckmwAsliumwUxoRuYTn5lZVDOgmHAyn2e
         9GCcjPdGDES9Omag9itiRx/AaBiJlkVVyzE4mfOeA9D3nSOKZyKBGeI91nArkubeCBx/
         BBdabu3tysR+EwCIloBzFuSu7WslnhvC8xT+2maKOCHSmPKu962iogZJxKBnkYnW7jlQ
         /VBRHjg/C2Z9Tpf1C4oZgkCmBt2qsr2q4pEo5SzCV4vfSWGHkDJL3vP/qcmR7dJfpjhj
         hXdgL0k5cDJXRp5yB2OdgE2Vo4VCC6EA2lxWlAbWubQRrhaes2txFXaW5hLU49y3dCpK
         TcrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKL8xmC2dKYBE0vnZ6IvplQFyx/ZaQxSaHrLtJay2gsM2SNZlDnHjr5htnfVDEH0b5VAxLYwDp5Qb3joiw@vger.kernel.org
X-Gm-Message-State: AFuF++lhdP6xtSyXucKVxOQ9OUUf0JeuxASB1GAZ+aI5B0kc6tfjuoKI
	YrvEuRBF4edz58x1R2Uk0ClmASqNaHnGOUSyypbQRYNXFwIz7fPwhO1YK4o2Li0+nA==
X-Gm-Gg: AYBFou1vx4Xp9EPdhkDqOzxgWHPdkWXDgSHVICtHHlguUqnKweM9U0DgGEHGM3XJUoH
	kqFViNU2/93HAPH/CelIeCsxT/QYyTagYETNKzzGykiNT3/nhtJCD5IGX7FhfbJm8LM0CWw0QPB
	kGNzJGprmZUywfwN8blmRI3DCUiEFeDr570sotij17YuJ2KKPiRQpHfYEXj7BcO/PFpEndh7M9J
	V/TjVW6HwtGgx+a2Rn24MqelN47VA5oyl1v6uLvD/+dMXstx/gB+9szJejLzQivUTFsMnpAQG6K
	hlIGL3sy/s2URqIpb0FPZk5YVipuSPUiIC7kfejETaH0+IxUmJFb7Auf1rQz0ygkTBhDZ7jZyYL
	H/djZ/ruWs8xzPZuW27aN0bySOstMEKbrj66W9zl381ZsFkuIHHAuMGf/ODbxLrZhW7yO+MPDia
	RFUG2CLtvP0EZ2+nr+HGFgCUyibRPIQxgLZKOpXI1b04j8vu8fXiPmzp8c4sKJNISZlLpCm6LU8
	1w17mwvWTHHSy8=
X-Received: by 2002:a17:90b:57cb:b0:395:c3f7:2895 with SMTP id 98e67ed59e1d1-39dd5478bd5mr3476877a91.7.1789322672116;
        Sun, 13 Sep 2026 11:04:32 -0700 (PDT)
Received: from murali-Aspire-A515-58PT.. ([2a09:bac5:3b24:1a8c::2a5:ff])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm20636958c88.3.2026.09.13.11.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:04:31 -0700 (PDT)
From: Murali Krishna <muralikrishna2444b@gmail.com>
To: mani@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Murali Krishna <muralikrishna2444b@gmail.com>
Subject: [PATCH 1/1] net: qrtr: fix coding style issues flagged by checkpatch
Date: Sun, 13 Sep 2026 23:33:42 +0530
Message-ID: <20260913180342.8948-2-muralikrishna2444b@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913180342.8948-1-muralikrishna2444b@gmail.com>
References: <20260913180342.8948-1-muralikrishna2444b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several coding style issues in the QRTR subsystem detected by
checkpatch --strict:

- af_qrtr.c: fix missing space in pointer cast, "(u8*)" should be
  "(u8 *)" (ERROR)
- af_qrtr.c: move trailing "*/" to a separate line in two multi-line
  block comments to match kernel comment style (WARNING)
- af_qrtr.c: add missing parameter names to the enqueue_fn function
  pointer declaration in qrtr_sendmsg() (WARNING)
- ns.c: remove unnecessary return statement at end of void function
  service_announce_del() (WARNING)

No functional change.

Signed-off-by: Murali Krishna <muralikrishna2444b@gmail.com>
---
 net/qrtr/af_qrtr.c | 12 +++++++-----
 net/qrtr/ns.c      |  2 --
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 78347c937..3f4e56a39 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -393,7 +393,8 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 		mutex_unlock(&node->ep_lock);
 	}
 	/* Need to ensure that a subsequent message carries the otherwise lost
-	 * confirm_rx flag if we dropped this one */
+	 * confirm_rx flag if we dropped this one
+	 */
 	if (rc && confirm_rx)
 		qrtr_tx_flow_failed(node, to->sq_node, to->sq_port);
 
@@ -471,7 +472,7 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 	cb = (struct qrtr_cb *)skb->cb;
 
 	/* Version field in v1 is little endian, so this works for both cases */
-	ver = *(u8*)data;
+	ver = *(u8 *)data;
 
 	switch (ver) {
 	case QRTR_PROTO_VER_1:
@@ -769,7 +770,8 @@ static void qrtr_port_remove(struct qrtr_sock *ipc)
 	xa_erase(&qrtr_ports, port);
 
 	/* Ensure that if qrtr_port_lookup() did enter the RCU read section we
-	 * wait for it to up increment the refcount */
+	 * wait for it to up increment the refcount
+	 */
 	synchronize_rcu();
 
 	__sock_put(&ipc->sk);
@@ -957,8 +959,8 @@ static int qrtr_bcast_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 {
 	DECLARE_SOCKADDR(struct sockaddr_qrtr *, addr, msg->msg_name);
-	int (*enqueue_fn)(struct qrtr_node *, struct sk_buff *, int,
-			  struct sockaddr_qrtr *, struct sockaddr_qrtr *);
+	int (*enqueue_fn)(struct qrtr_node *node, struct sk_buff *skb, int type,
+			  struct sockaddr_qrtr *from, struct sockaddr_qrtr *to);
 	__le32 qrtr_type = cpu_to_le32(QRTR_TYPE_DATA);
 	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
 	struct sock *sk = sock->sk;
diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index bcb090ee7..aaf77c7f5 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -179,8 +179,6 @@ static void service_announce_del(struct sockaddr_qrtr *dest,
 	ret = kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
 	if (ret < 0 && ret != -ENODEV)
 		pr_err("failed to announce del service\n");
-
-	return;
 }
 
 static void lookup_notify(struct sockaddr_qrtr *to, struct qrtr_server *srv,
-- 
2.43.0


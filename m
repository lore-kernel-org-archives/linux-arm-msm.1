Received: from mail-pj2-f16.google.com (mail-pj2-f16.google.com [74.125.227.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C971376BD1
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 21:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853333; cv=none; b=H6B/N0jjuMX55AoaWt46CDtn/jj9NbjkcHyktYB1ed9pLUemBej6caCzPAhRKnl1eYu/MRENw07uidjLJOSRvrV6VWY+V9W1/xxceMub+k2YKBULPfQ5bTqPaqi8BJV6j0LppNlrpcq3k5xOPlv3vD+cPbtPp6D/BBupStOXDds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853333; c=relaxed/simple;
	bh=qi+8UfjOHnuyvfYtoqMX/7Q8LuPSKEg1QIzac8Ia9Ko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X8kz20x4/qwgnEqitFTBL2/JoUo5aaeIRKnQYYrxI82d9C+wr64hGzBr0ea9IEN+UvfVg24pozhNt03iP5jDmoZN4rvcck49v4qZU6bbO0b2xPquDMuSmEZIEYwu7xnEQIQwdAzmaF+tV5cX8rpnbW6k0IhHe4ddaqZc+M2EKkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9q2cbN6; arc=none smtp.client-ip=74.125.227.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9q2cbN6"
Received: by mail-pj2-f16.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso714059a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 14:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853331; x=1790458131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AV643nCtB/hqzvQNISm7doHVXi7iv2eQBCiZ3N3vJaE=;
        b=U9q2cbN6xDeijWvU4MSlyLbavSnMLfP1I/ryc16wfW9CjoVZ812oQUoSbeQiBYRkWh
         hnssi6huPOjxR74pa61XWbST8DdNOueEgQbZFQ4n2/OSl8Ca5uB0hH3GC8H0oqxyb9Ba
         5dWBr8lC/J1GDezpPYMjdttOu9g32FmNI0gpGE6rSe7TT3gZz2pdDY3QGvvkJS5q9tdV
         ZfY392Kctre4OVzRNEonhdu/xe+8/+Os1Kl+5YExz8geqEQTdlVlsLfH6l0oWkEYX+2s
         jjRyUE5lHOg0eDPH0kmUIVj1oq/cQYImyKfy4WBuY/IqpHkz0YQZZWsog49KE/CdZXWE
         Ow8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853331; x=1790458131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AV643nCtB/hqzvQNISm7doHVXi7iv2eQBCiZ3N3vJaE=;
        b=jhChrNisyOLlvCW+DoAimJbp6nzQaysc5zJarAubu2RT4fFd2y71aiqn/eskYFGcvl
         DKE0uVSLQxOPJbJhM3PmrJ4gZQgX0+Vn1eIo6DctgpWN3ZCC1CzZSuE/ielczioOs9TK
         iBjkJ75FGJJM9yFgbHn2e+9AYm0cWsjMeo5r+OjQ8LuXryOzxxRkpoA4oCJiVjc25K6d
         cEbdlKeL4lktVL58Ax9+ToeYDairkdGRDQPUubNOKfOxlHmlQzs8z6cjeguyMAxLXrb1
         3qrTvORBfx0c7ABFLQPgLvQBlxQClgrOEItFsUO+l5TrBvEFbPvjUvrRe5CfoRMcUxmy
         cBCQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8cgPcxbyArs3mdKaf4XdwpNcKiRhSa4xJfxV237A2DGgkHSjUidKFae5VTg9kl1YW/s/L2J8f6xENrwBS@vger.kernel.org
X-Gm-Message-State: AFuF++lbvRFSpgXja4uu4n7W5ZL/r/h8i/tMow66v2ZxTT3AlPS62CqX
	fAu5XEu/jsZcnZdMhllLWu5OzPaUlpOIm0xxHn1qCq/nkrd2V0Zeg4fR
X-Gm-Gg: AYBFou06cmZv9U5CKaJH6qwZpdG4YtFMxOQrV0RmF27H3kfWrR9WPDRG4tlAVMqYvP+
	oIcJdm0NUjDsrDMb/rZjPdhj03/kDwHziz24nCscyT3+wyo8rQQtmmpXu/QFvwXnwAkabq6/uTn
	jEGZHdrRT06/sSUlIxZKlTJyzNE/DXwShezvTkVP6wmuGHSaypfD/jCK23MTVtlCfV+vuK22TKG
	70S+2o9R7vPVw6h3hirDVqtabxO+ONKWVnKUKC6zB0nda2rIEWXH/CM/RxGWX6CSUJ1aU/Zks0N
	RzTySHXJuXfo63gJusHPfA4y1EdSDtC4z5uC+WauPnJstWNtjmsnpxncZQ2Uo6m/sg4Wdo/LEWo
	AhFGGTaWibtrEAiQKu/lIQDWSQmuH2AgzDsCWCYAbXDh8Z/TETTI4VaHitMVhTYlUNZHPOlK8Db
	FvYWIKs3oiKa8qschEKwhlmqZwZSD788I7lu4ksPJE8gmiJQo+giH1Ws2IwCF1zFTrHF2x1RQvb
	T0SjbhfDKFhf/DHfp/r4g/C4ee8XQNNPMLxUuaGba0QvgPjrk5JS0tjSka9AdwCcUUZ87WjdxO2
	sJAkZmRgNA==
X-Received: by 2002:a17:90b:2b8e:b0:39e:4c7e:bc5 with SMTP id 98e67ed59e1d1-39e5572d5a2mr6755750a91.19.1789853330851;
        Sat, 19 Sep 2026 14:28:50 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb3284asm6107715a91.14.2026.09.19.14.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:28:50 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: mani@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: qrtr: ns: validate msglen and sq_port in qrtr_ns_worker() and ctrl_cmd_bye()
Date: Sat, 19 Sep 2026 21:28:50 +0000
Message-ID: <20260919212850.3240353-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two validation checks are missing in the QRTR in-kernel nameservice
(`net/qrtr/ns.c`):

1. `qrtr_ns_worker()` receives control packets into a single reused
   4096-byte `recv_buf` via `kernel_recvmsg()` without checking that
   `msglen >= sizeof(*pkt)` (20 bytes). If a short packet arrives on
   `qrtr_ns.sock`, `qrtr_ns_worker()` reads stale bytes from previous
   control messages (or uninitialized heap memory on the first packet)
   when parsing `pkt->cmd` and its union fields.
2. Unlike `ctrl_cmd_del_client()`, `ctrl_cmd_bye()` does not verify that
   `from->sq_port == QRTR_PORT_CTRL`, allowing any unprivileged local
   `AF_QIPCRTR` socket to send a `QRTR_TYPE_BYE` packet and purge all
   registered services for the local node.

Check `msglen < sizeof(*pkt)` in `qrtr_ns_worker()` and require
`from->sq_port == QRTR_PORT_CTRL` in `ctrl_cmd_bye()`.

Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 net/qrtr/ns.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index bcb090ee79d4..d7e1a37f0717 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -347,6 +347,9 @@ static int ctrl_cmd_bye(struct sockaddr_qrtr *from)
 	iv.iov_base = &pkt;
 	iv.iov_len = sizeof(pkt);
 
+	if (from->sq_port != QRTR_PORT_CTRL)
+		return -EINVAL;
+
 	node = node_get(from->sq_node);
 	if (!node)
 		return 0;
@@ -639,6 +642,9 @@ static void qrtr_ns_worker(struct work_struct *work)
 			break;
 		}
 
+		if (msglen < sizeof(*pkt))
+			continue;
+
 		pkt = recv_buf;
 		cmd = le32_to_cpu(pkt->cmd);
 		if (cmd < ARRAY_SIZE(qrtr_ctrl_pkt_strings) &&
-- 
2.55.0.1082.g2b9226bbc0-goog


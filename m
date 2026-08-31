Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E3339D6D9
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 18:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199812; cv=none; b=KG6jGs6diJtlhijXRHQ/DOzB1CKsr/nVP2R/jJNC/tn2KsoaWJA0QntZoc7xtI/hxpZZLHRX9VCSh47Ymhwdsd9KAT8kwYEMabfl0oim6HHnZerU3vkZQavakB3X/BKpUMqQULAH3ETj2IvagTbj/6TV2+sxOOgZEdweFxsHqgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199812; c=relaxed/simple;
	bh=fAzFXr7QclcpE0D6XBc41/1tf7GsPHZBgP6i4rwO7jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fm0j4XEiLzsFXhxYZsasoov0nkFWdOr8k8msGVV0t4wc2u4sSWbgBlE2m5wGsjhW1YSV1zUOLqj1omhzI8euoYBzMn0+PkIz4W2yIts3U0kjiC8hHcPORJz+YzT0/IfMsGo7/4CFFj8056Bw9bwg1TMFbtl9J2WYEXinpBa3tDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYSloIK0; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYSloIK0"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2569aa5116so30297866b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199808; x=1788804608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ab3N2XZDk+KVNr1QDSMytkdAxt1gkHtn2AyrmPIO2uo=;
        b=KYSloIK0DR+tyA1ZN74oYbVTbdHrxGvNnjWLCZwqC8x9BlzS3GZZheW+wccIHChOKr
         HUUP3AsiHzVLYPXHeiv+tln5rN6qrCyx7LPxivrihXHPMVueh5h1KUUgNlYBBd6NJxL4
         zilYyxlJav8+y0cUDeD6raTroIMcFdLClqyUCDwmGuL9puaut4568lfh515rjqWeOfaz
         XAy/HWOLK4JjgeN+C4YXqoIgG+lBE0HWLs5tS0gu6AdoHe5Py8JCmT2SFHFozjRxHE6o
         YALY1LE3Y002QUGCNUPGR9Iw0c2cth2REMNcm2PQJRqiIUfxHx5Flti6iTyZRcQBcWGt
         OtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199808; x=1788804608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ab3N2XZDk+KVNr1QDSMytkdAxt1gkHtn2AyrmPIO2uo=;
        b=TpK1pDLaiy8EjAz0weX0qvKqcZKfgd97VMv7bxjPvACKdIFSdm5tyh66FkcZdL8cgZ
         /lnsPvXZbU+XdXBPkTjOuVHaQGt8GALbmoMYJRLE5V7GAVNB9XXj+3cq9CY99ALj9lrG
         yEFW7PVgxZJrxkQ8OLxDoe2hP7EM9A2SPRO4tzmr6u4RMkbGLEJhSiC8KEXt0MAPL49S
         NeljZse7y023lk9xjPFTiwtiN3Sf56rESjyzKYF+Br2E0mcfNyG44hRbG2AmpgQAevF6
         5frq2hkJXXaXzYPtlWydhHCqMy73YBT26LLX6r59Y/UcU1Q1j+0KNGKAV+ZlAAzU8LZT
         y6EA==
X-Forwarded-Encrypted: i=1; AKwUvBwG/8fTYJRPFxyCuB+qVRiRQFvw7pSeRsz4eRzKOj/kfFPBlSTms4keuVOb67OJpAWklF+vQ9YhL1VnBpql@vger.kernel.org
X-Gm-Message-State: AFuF++ncm7FMRSYd0S05jN4Tk4vBYM4PlCFP4YHx0vUoZnFkLOLzgAtD
	pg0Op1UQFWO5t5JumPim7D57UmFownXl70tu/7vpJzgezyLHZpCZY5b6
X-Gm-Gg: AR+sD13sYm/Ozd7MOMeBF6gD81dkEZDoE90ZEyb0G0amk+kyArxa3rg8jJgsoNyitF6
	yoDLagD4gnSfjIQHxV0Rhd25NjIGa1y3VsFI5hbzNwiMfQIzt56e9l+VxYfLD4B1noXpkjGZAKi
	TH+RRL6Oufi3RmISutTu7/delU4F/ZnI/HXbuwci6BiJf2py6m/B/AC/LYzFpeG40WR+bxDl6uq
	xktbgVWNuJhuOIdqy7A1vESMWsLTrsGBlc9iiDSpvyXOlNc3JxPRWC4caCmeStUSfuWhAe0UXS/
	GP8OdYd1GA0bCMcSlBwYvrjPB+7QCst57v3R6C5WlLsTP8ZmF3IE8r/k4FjUaGjxqREsunUKAF3
	Q2FcpWPXAg0Rt9gziQVHSBKOhWiM6UX7r/O25we/eWLAKlk7aAVnyLRVb4gbLDdde0jUQzJOL1H
	KzpL6W054eBbEFPiYc5soVuAtoQJw6kJylJxfELwSvrFoVfiP8VHXgtahemE8lXCc2QNW8u+G8v
	8JIiGuRM/3BSKI=
X-Received: by 2002:a17:907:6d0b:b0:c25:4ca3:dfd8 with SMTP id a640c23a62f3a-c25b90d496fmr5311966b.2.1788199807884;
        Mon, 31 Aug 2026 11:10:07 -0700 (PDT)
Received: from localhost (83-131-188-88.adsl.net.t-com.hr. [83.131.188.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee2872dsm484759766b.15.2026.08.31.11.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:10:07 -0700 (PDT)
From: Dmitry Sinyavin <sinyavin@gmail.com>
To: Stephan Gerhold <stephan@gerhold.net>
Cc: Dmitry Sinyavin <sinyavin@gmail.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] net: wwan: qcom_bam_dmux: account network packets
Date: Mon, 31 Aug 2026 20:10:06 +0200
Message-ID: <20260831181006.1382372-1-sinyavin@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BAM-DMUX data path does not update the network device packet and byte
counters. As a result, userspace sees zero traffic even while packets are
being transferred.

Use the standard per-CPU software statistics helpers. Account transmitted
packets after their DMA completion and received packets after removing the
BAM-DMUX header and padding.

Fixes: 21a0ffd9b38c ("net: wwan: Add Qualcomm BAM-DMUX WWAN network driver")
Signed-off-by: Dmitry Sinyavin <sinyavin@gmail.com>
---
v2:
- Read the TX payload length after unmapping the DMA buffer and combine the
  network-device checks.

v1: https://lore.kernel.org/netdev/20260830085400.2542956-1-sinyavin@gmail.com/

Build-tested for ARM with Clang and W=1 using allmodconfig and allyesconfig.
Hardware-tested on Qualcomm MDM9607: three 32-byte IPv4 probes completed
without loss and added three packets and 180 bytes in each direction.

 drivers/net/wwan/qcom_bam_dmux.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
index cc6ace8d6437..5bcac2ccaabd 100644
--- a/drivers/net/wwan/qcom_bam_dmux.c
+++ b/drivers/net/wwan/qcom_bam_dmux.c
@@ -177,8 +177,12 @@ static void bam_dmux_tx_callback(void *data)
 {
 	struct bam_dmux_skb_dma *skb_dma = data;
 	struct sk_buff *skb = skb_dma->skb;
+	struct net_device *netdev = skb->dev;
 
 	bam_dmux_tx_done(skb_dma);
+	if (netdev)
+		dev_sw_netstats_tx_add(netdev, 1,
+				       ((struct bam_dmux_hdr *)skb->data)->len);
 	dev_consume_skb_any(skb);
 }
 
@@ -402,6 +406,7 @@ static const struct net_device_ops bam_dmux_ops = {
 	.ndo_open	= bam_dmux_netdev_open,
 	.ndo_stop	= bam_dmux_netdev_stop,
 	.ndo_start_xmit	= bam_dmux_netdev_start_xmit,
+	.ndo_get_stats64	= dev_get_tstats64,
 };
 
 static const struct device_type wwan_type = {
@@ -421,6 +426,7 @@ static void bam_dmux_netdev_setup(struct net_device *dev)
 	dev->needed_headroom = sizeof(struct bam_dmux_hdr);
 	dev->needed_tailroom = sizeof(u32); /* word-aligned */
 	dev->tx_queue_len = DEFAULT_TX_QUEUE_LEN;
+	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
 
 	/* This perm addr will be used as interface identifier by IPv6 */
 	dev->addr_assign_type = NET_ADDR_RANDOM;
@@ -533,6 +539,7 @@ static void bam_dmux_cmd_data(struct bam_dmux_skb_dma *skb_dma)
 		break;
 	}
 
+	dev_sw_netstats_rx_add(netdev, skb->len);
 	netif_receive_skb(skb);
 }
 

base-commit: 2188569e7e1b0bc3f3b557dc97ab7a02befc11c8
-- 
2.53.0

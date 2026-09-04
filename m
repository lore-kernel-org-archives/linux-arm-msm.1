Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C55651120D
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 18:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547064; cv=none; b=OVPunmLaoEAI84jduewh/Mw6YlcPUUwv4gizxma41GYv31HYY0SuT98XGLNlQj7NAjqUVzrKY4LQUr8w1C2xVMqKLNHJ6ebOOV3sABwbSrMYJetad9VHTQCwjfjJ3a3a+VqcimVVx+vpqV5IpuGh1U+g8Ohn7t/B0bU0vDOK1yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547064; c=relaxed/simple;
	bh=dbrsGx7Z1JZFuEt3GzNTe3o3ow+LgppRDQf4cQvzgm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h6O+TtumqXPR+7/iuyuS0k02cofjl25hAeDxZ7ShE1TxHWw8kWAkZXQ1BiGIM6dGYXyUKOM8GeFh3+q0s87EjT5aJBrJ0aNBQ5TnOlYZwfZtYsi3yFLBaPNeK1WueE6q54/xcLLzE2s6JUOPvOPBktG3nB/tQIEufmtrDFBWFHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngVn+J/W; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngVn+J/W"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c25420fe973so229187766b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 11:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788547059; x=1789151859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2DA3mdpg9p97zW+otya7y9pg3R+tiPiEPhqbCYleRUY=;
        b=ngVn+J/WdeF6VDEL+Hk3AX9f4+yRfZ/htisr60xn0TPkAZ/ysZHWlC2ubVp4uXBsiG
         R05GJasX5XUeH3uiXJQ1AGmzrOMulTbY7+XoT+zINgTmIiGlrg0X54Pmg99DtxjyejO5
         yoyLLv+ehDPdmakBjkNj+x6HAzG9VLjdUlpgPjhXW2XOAjqNZagiwKC9w96vOkm6ZhcX
         dxguN3aSaIHR6qH7A7vLkFhIu+q0NQTSQw8MXEzT4Gw7YCoeFuMWiuxSRGpLH/G1zqJ5
         wp2Z7RULO6SGSlxI2hyDvz+/WMx+XyclLZ7Db88HVNoSUtpj7DS6Wr6cFvjeZEVDMsFh
         me0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547059; x=1789151859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2DA3mdpg9p97zW+otya7y9pg3R+tiPiEPhqbCYleRUY=;
        b=P0gZFgWU0NY4tP3NlxRggNFT4S11pM8QN46N+CQHbihY8gmtchJbArXMvwRiXjThEh
         POP9s/ITzHz5kXG6iJcNza1/18se9ePkUFJPdLrt4//QM7DsCc28gd3TF0tjinKs/uzT
         XDlvc4el6mHtVS5Y29heDAauSgHNMKNxa2sSUYWEDmlRzkD9/eKFvmSWfqnvtogQhDxT
         6QJfEhsl+c4XSvm0I5yDzYVydh4FHt8+SBn94x0x4gXes3E1wXzrk07LuAthpy1yIEMv
         jRQV9gg19mo1p4HKLLm6dao1WC14Q7oq7+sEfgiGmxHjqyPifEcrkzvqSTjfBzkpiZDG
         ZuUw==
X-Forwarded-Encrypted: i=1; AKwUvBx74ckeock37jLn8i07sNx8Z7TrbEY2f2AhC9IsMp1iEiVVuBWNhGjdpDMd+S/Z5GtZAT01MG98di/tftvI@vger.kernel.org
X-Gm-Message-State: AFuF++nFc8pJxOqodDLTlcvrMxFxNf97gxObTKIIAQleYk0F9sdfrLSS
	3a9NTBTXOfFJtuD9qeCMPoOFpTK/aB3QmS3OXXsKd7nrsoGSYNiVNi/F
X-Gm-Gg: AYBFou3iCqanewT77sP2RPVnYhHL17X84woN5sYply6/bNS/w+dg9osNc9I+LxNS2mP
	xJLFzVzvaVtDGF6DXWj9Fxa4/yMyqBGQpQMtd0QUGWffPrxAu4KTWBjc8SEDfWr2B3dIyN/4K9A
	gzPatL0ilKAjOdK8iw9znCYQ52Idn1sQA15JdXMOoZSDEPHN72fwybmup3U85YYxVBQDdcczPJl
	D4jwbIJr354UcBtH+ylurfoJUtEEDAb/wIkQXZK4pE4AohkYyvD/xpLep32QQzAjh2pPZ+FDL7b
	dgUnyPYcmk4ZwrZm/iDRBbWzxJ/FILtC2dvYRp2ER4nad564Id1pcEh6zVc6LS8OZzhSL4nTaaT
	qCQHhkYoqLOujmRP32TKO3PSCDXvrkbEHrqVe+j7oyaT5ctfIVIDsUrx/ErcgaDoeffbiqx4dTb
	IYfK6+tHOkUNBGGhjfNyPz2djPwAy6YYdfFj6m/AZ2N7Oi2+AG+b3eljCzH70lVMH40D6LEWh4D
	ehBH8M9zbi0LOOHm3y+Ag==
X-Received: by 2002:a17:907:7b88:b0:c26:19de:9131 with SMTP id a640c23a62f3a-c2619dea19emr210144366b.36.1788547059113;
        Fri, 04 Sep 2026 11:37:39 -0700 (PDT)
Received: from localhost (78-2-18-104.adsl.net.t-com.hr. [78.2.18.104])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d52dbc7sm142564066b.29.2026.09.04.11.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:37:38 -0700 (PDT)
From: Dmitry Sinyavin <sinyavin@gmail.com>
To: Stephan Gerhold <stephan@gerhold.net>
Cc: Dmitry Sinyavin <sinyavin@gmail.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4] net: wwan: qcom_bam_dmux: account network packets
Date: Fri,  4 Sep 2026 20:37:37 +0200
Message-ID: <20260904183737.2994139-1-sinyavin@gmail.com>
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
packets after the driver has prepared and accepted them, before returning
NETDEV_TX_OK. The asynchronous DMA completion may run after the network
device has been unregistered. Account received packets after removing the
BAM-DMUX header and padding.

Fixes: 21a0ffd9b38c ("net: wwan: Add Qualcomm BAM-DMUX WWAN network driver")
Signed-off-by: Dmitry Sinyavin <sinyavin@gmail.com>
---
v4:
- Move TX accounting from the asynchronous DMA completion to the transmit
  path, avoiding access to statistics after netdev unregistration.

v3:
- Count packets discarded by the transmit error path.

v2:
- Read the TX payload length after unmapping the DMA buffer and combine the
  network-device checks.

v3: https://lore.kernel.org/netdev/20260902124506.363174-1-sinyavin@gmail.com/
v2: https://lore.kernel.org/netdev/20260831181006.1382372-1-sinyavin@gmail.com/
v1: https://lore.kernel.org/netdev/20260830085400.2542956-1-sinyavin@gmail.com/

Build-tested for ARM with Clang and W=1 using allmodconfig and allyesconfig.

Tested on a ZTE MF283V with an MDM9607. The modem registered on LTE and
three 32-byte ICMP echo requests increased both wwan0 RX and TX counters by
three packets and 180 bytes. Bringing the interface down afterwards produced
no DMA, BAM-DMUX, or kernel fault messages.

 drivers/net/wwan/qcom_bam_dmux.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
index cc6ace8d6437..03360301c8ee 100644
--- a/drivers/net/wwan/qcom_bam_dmux.c
+++ b/drivers/net/wwan/qcom_bam_dmux.c
@@ -335,6 +335,7 @@ static netdev_tx_t bam_dmux_netdev_start_xmit(struct sk_buff *skb,
 	struct bam_dmux_netdev *bndev = netdev_priv(netdev);
 	struct bam_dmux *dmux = bndev->dmux;
 	struct bam_dmux_skb_dma *skb_dma;
+	unsigned int len = skb->len;
 	int active, ret;
 
 	skb_dma = bam_dmux_tx_queue(dmux, skb);
@@ -357,17 +358,19 @@ static netdev_tx_t bam_dmux_netdev_start_xmit(struct sk_buff *skb,
 		if (!atomic_long_fetch_or(BIT(skb_dma - dmux->tx_skbs),
 					  &dmux->tx_deferred_skb))
 			queue_pm_work(&dmux->tx_wakeup_work);
-		return NETDEV_TX_OK;
-	}
+	} else {
+		if (!bam_dmux_skb_dma_submit_tx(skb_dma))
+			goto drop;
 
-	if (!bam_dmux_skb_dma_submit_tx(skb_dma))
-		goto drop;
+		dma_async_issue_pending(dmux->tx);
+	}
 
-	dma_async_issue_pending(dmux->tx);
+	dev_sw_netstats_tx_add(netdev, 1, len);
 	return NETDEV_TX_OK;
 
 drop:
 	bam_dmux_tx_done(skb_dma);
+	dev_core_stats_tx_dropped_inc(netdev);
 	dev_kfree_skb_any(skb);
 	return NETDEV_TX_OK;
 }
@@ -402,6 +405,7 @@ static const struct net_device_ops bam_dmux_ops = {
 	.ndo_open	= bam_dmux_netdev_open,
 	.ndo_stop	= bam_dmux_netdev_stop,
 	.ndo_start_xmit	= bam_dmux_netdev_start_xmit,
+	.ndo_get_stats64	= dev_get_tstats64,
 };
 
 static const struct device_type wwan_type = {
@@ -421,6 +425,7 @@ static void bam_dmux_netdev_setup(struct net_device *dev)
 	dev->needed_headroom = sizeof(struct bam_dmux_hdr);
 	dev->needed_tailroom = sizeof(u32); /* word-aligned */
 	dev->tx_queue_len = DEFAULT_TX_QUEUE_LEN;
+	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
 
 	/* This perm addr will be used as interface identifier by IPv6 */
 	dev->addr_assign_type = NET_ADDR_RANDOM;
@@ -533,6 +538,7 @@ static void bam_dmux_cmd_data(struct bam_dmux_skb_dma *skb_dma)
 		break;
 	}
 
+	dev_sw_netstats_rx_add(netdev, skb->len);
 	netif_receive_skb(skb);
 }
 

base-commit: 2188569e7e1b0bc3f3b557dc97ab7a02befc11c8
-- 
2.53.0

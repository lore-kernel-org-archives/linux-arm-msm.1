Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316658;
	b=NNX8mo9b7n5tBoKOPmI0uGHx2ej904Mc00OTpASiRsIJfqU+nwo3kH1jGOJ0CqXTuUbG
	 ggdwtE5S8zPoCBhjQICN/sKXEqCy3jzZMGSG+BpcEShCRwC4xtjqHzBnHwODUWeZOz3vP
	 W+QkwiNCqPRQkFhlNOaYVMyZgQPTD2nAxcIrbFPngdYWXaTNUlGOfhi3C6LARBi+mRihe
	 D58muoL0wALAexj90DvyRRoN9C7coD4GkFcl49LHYIcBgqG+phSMwgYOTRuywy9FbjLIA
	 6pFmft/V1b4an6O0KQQseKheNTTDkglWDpIlzbYpPbLDkhW7BnnagTnfiEkaBM5H4NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SmC6z0SGnHZMqw33i8OvX2WsVfy3whtNtxw8axc49Lo=;
	b=MTm5q2l/IpazROrtXz9ZTGeBpThEus/5uOirOEoJdH5XmCJnpJupGKTcMgUX2Y/a7MWt
	 /QG+7mfTIAO/7VoxtLDeVW0vbSyKedaL2ebUTlchsQLTRZAIsYMYn+0Mjnm1vebV1CRh8
	 KeSol4V6ZhLOqu2tRloZa2V/cX+9yHyD3ABsD3IrwETHI4TBW4v6LHqA6i93mm9GHv86T
	 Xb2nykYsa/IeqZCqVZVSTLqRNT6j7imlTnVjNTXRqxM6bBWBjXTot5kYk6XjXA63De68t
	 +QJNHF8Rbqgt31hX/x5Sj0C87nYc/6EK83As6oTuoWdw0pQ/KOxxXnN/sZ5pGDDgV5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X8RMi/CA";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D544A606B2E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 13:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D544A606B2E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X8RMi/CA
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1107751a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 05:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316657; x=1794921457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmC6z0SGnHZMqw33i8OvX2WsVfy3whtNtxw8axc49Lo=;
        b=X8RMi/CA6HMKcE6Lk2v8Y8XdKMsZf2NhdEGCKNU31vVNOwqNB94z5UNdZMgKbu8J3b
         W4DKF863+WXJJvgMBYSnsleUlRP6TdA790cSuHpjFch+FWbFpuWJOK9bKla0xDQRJyIc
         cH7KHVdKlzcAXpjg1x7PqmYbeLKMBtxKXY/ds8llnlxwpzPczGm22KrZni+VXrIlrddH
         n83+NuIY2JdUiZL1I+wsVz7FM370xEmTz40jex1iI/bR60CmKQb6ramgKCegOjVoGisG
         OrbtsiN7vwvsorkt8xBbth7xuwZvdkV/7euiBH3H2osbKYCnHD+n3lYikTHL54YtrM3j
         hprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316657; x=1794921457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SmC6z0SGnHZMqw33i8OvX2WsVfy3whtNtxw8axc49Lo=;
        b=jiTMGs15oXAaHD5V6SPVIanvnHlMQdKh7LglnFfO0l9Se31eBCnPf5uktSUuZRcDsz
         S8kRl18uKzvq1zVRO8lxeIa/2ibhZvAUdjqSlJV3ezHOd4XVGVpL+UCU22D9/2RV2hTr
         zpXzFJ8fB371jfuY0ltyWPYt4hMG2QFWJKroyQ8az7ypWpK8QHx5ZCuDbJxr2qERFFLg
         7sO5ljHHQ2SEU0F7v/easVNyiVAwsbcF0mRm0pG/0X9UaZunVL4n/X9g1Reh8w2F6+Do
         SStxB4GcycBzP0HAVgFXD0kUxoC9dJYF6KOdibbulHUhk8zPoi7N/mPSd3P6X2jtJgZ5
         YYOQ==
X-Forwarded-Encrypted: i=1; AL+hErH9iJnI6QzlY+B0mp4VCsrmG1rNpWENA9QhsAWlsg967WxxZQRo5gGRqsMB8ED4FemzhSy9msYj/CFGAMbV@vger.kernel.org
X-Gm-Message-State: APuU4Z9djVgGJB09UBQJJT7J02OdkgD5B1DZk6IBLVCeVPwpw7niC7n6
	u6gh+9VTs4TuKofhhjtAn6LZK6NzngqObrvOtMIpI+cwZRu+fq1O5whM
X-Gm-Gg: AYBFou236Bg+Q3JqOWMEWdTevH3kiNFz2Btuxm9LjM2jpx36JPBOP9XSV3u4ACUk8xv
	UrLsijMPGgSL4fKhbcjZzEs3c0BKJWfWvjpQMHXYCtRrZGyJEABoPTYplnYNoAp+cA3V8izGOBa
	HKu8Jnl4GgDgwRimNnjCS5QwbkVqZdKxKAGFwjEdTPWVRXhRW2ppGyJTIAYbQk7ywhCc8uTefyk
	4H1TTejJK7bGg1flF67g1hqtWVvDSG4c7nK4wp2jKUIuhXUuVJN6Sr9opOc1w5MnkQBNjcnWq9Z
	4SBSg7xy+u13C5XC+6F76XvZ0/07oBcr+dNYEIjUAaeB3qN4112ytgmSDdMgT3fqJUVRwxt1TEm
	0kyzSnujMZvSmbpZGZNN+eYYFr4VhgynZ6TotZwv8nTN+CcFvKYsFBNcUt/WDrz5x1+VTHHGwxY
	/lqCvYTzF+ui8XUnzWb/udIFP9mR4sC4nfWr9ckgjjOr3SEPhcmtHmNxhrTIqMJGQ67KJlzWt2I
	DCcEYzkdVj4H7nFCd/BFm0k8g6g1aqK49r6PnWS4XIWmXHvDoPiv9QS579iw8Q2V5hxqBzo7v4D
	hmexpeKEDhls6NZWVkYozyEspEH4av8=
X-Received: by 2002:a17:90b:534c:b0:3b0:a757:e370 with SMTP id 98e67ed59e1d1-3b167a3863bmr1474256a91.42.1794316657157;
        Tue, 10 Nov 2026 05:17:37 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:36 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Bjorn Andersson <andersson@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 32/33] dmaengine: qcom-gpi: defer callbacks via vchan
Date: Tue, 10 Nov 2026 05:13:32 -0800
Message-ID: <f7d8c6b405705d941201a1b11872442dbf5682c0.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete descriptors through virt-dma instead of invoking callbacks
directly from event processing. This preserves the transfer result for
the shared vchan BH, which invokes the callback and frees the
descriptor.

Because callbacks are now deferred, synchronize the vchan before the
channel ring is freed in gpi_free_chan_resources(), so a late callback
cannot observe a torn-down ring, and provide a device_synchronize()
callback so dmaengine_terminate_sync() waits for pending callbacks.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/gpi.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index d3c3d0f35afb..e125b3a83b1a 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -981,8 +981,12 @@ static void gpi_process_imed_data_event(struct gchan *gchan,
 		result.result = DMA_TRANS_NOERROR;
 	result.residue = gpi_desc->len - imed_event->length;
 
-	dma_cookie_complete(&vd->tx);
-	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
+	spin_lock_irqsave(&gchan->vc.lock, flags);
+	list_del(&vd->node);
+	vd->tx_result = result;
+	vchan_cookie_complete(vd);
+	spin_unlock_irqrestore(&gchan->vc.lock, flags);
+	return;
 
 gpi_free_desc:
 	spin_lock_irqsave(&gchan->vc.lock, flags);
@@ -1060,8 +1064,12 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
 	result.residue = gpi_desc->len - compl_event->length;
 	dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
 
-	dma_cookie_complete(&vd->tx);
-	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
+	spin_lock_irqsave(&gchan->vc.lock, flags);
+	list_del(&vd->node);
+	vd->tx_result = result;
+	vchan_cookie_complete(vd);
+	spin_unlock_irqrestore(&gchan->vc.lock, flags);
+	return;
 
 gpi_free_desc:
 	spin_lock_irqsave(&gchan->vc.lock, flags);
@@ -1983,6 +1991,13 @@ static int gpi_ch_init(struct gchan *gchan)
 }
 
 /* release all channel resources */
+static void gpi_synchronize(struct dma_chan *chan)
+{
+	struct gchan *gchan = to_gchan(chan);
+
+	vchan_synchronize(&gchan->vc);
+}
+
 static void gpi_free_chan_resources(struct dma_chan *chan)
 {
 	struct gchan *gchan = to_gchan(chan);
@@ -2010,6 +2025,9 @@ static void gpi_free_chan_resources(struct dma_chan *chan)
 		gpi_reset_chan(gchan, GPI_CH_CMD_DE_ALLOC);
 	}
 
+	/* drain deferred completions before the ring goes away */
+	vchan_synchronize(&gchan->vc);
+
 	/* free all allocated memory */
 	gpi_free_ring(&gchan->ch_ring, gpii);
 	vchan_free_chan_resources(&gchan->vc);
@@ -2279,6 +2297,7 @@ static int gpi_probe(struct platform_device *pdev)
 	gpi_dev->dma_device.device_prep_slave_sg = gpi_prep_slave_sg;
 	gpi_dev->dma_device.device_config = gpi_peripheral_config;
 	gpi_dev->dma_device.device_terminate_all = gpi_terminate_all;
+	gpi_dev->dma_device.device_synchronize = gpi_synchronize;
 	gpi_dev->dma_device.dev = gpi_dev->dev;
 	gpi_dev->dma_device.device_pause = gpi_pause;
 	gpi_dev->dma_device.device_resume = gpi_resume;
-- 
2.43.0


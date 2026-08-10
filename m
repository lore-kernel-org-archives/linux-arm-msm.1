Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF20435EC5
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 18:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385620; cv=none; b=e6F+Q+fq6vQe9XsWrjqThQ2etRTtvQMp5F2usYC4bKKYud4AmVRqQrPp+BB+hPRJJQyBPe+G1Rvn7DEyNYN9eva8MuFTlXnk2nRTtmWTcuTYFOZHKVV8WqeA9yvQMn8bMA0zIhb5HZ3rCxwpqzKUWntlkCxY6OM4hgJJow4mK6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385620; c=relaxed/simple;
	bh=LxqzrTJv5Eqx3zrr8cQAwC8hTp+RGnUBOHgB8lVvAQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=chQj1Gf+ZCHyP7LYxJwKJtoPL1uGBQohzLktww0qHbLjltUu82uzF+PAOhEb0yArMvbeTgMLS+ftffmiLYXJZ6/SFpqMaaTpM9LVQrLFY4YgNYjzqNL5M/KLS0I+B0VTKv1mrdeMWurG3vQu5ZD35FimAuiCg6r6hyaNFaBuNnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVgnK1NT; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVgnK1NT"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e58034d05so2303959a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385618; x=1786990418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUm5zg635IdCfrd8nRe9kr7IONoPkdCFzJRsBETaklg=;
        b=QVgnK1NTnbE75IvaAwReUBn/f7Wet+iX690147bgGdoPwm1Hq2oOkHpB02YPEjrP9I
         iTdx9WCRHBZmpk/kQBDT2zWmYj1fWjw/aLkTOsW4NIKXP7l2ZduMzStIyfKnjl5KcYuJ
         0+CgVjb7N9Rh9lsRyy0YJ0wb5NoOQ/6CvQCH2WFG1Q62RItrcvViha/twwURJOPXvt/A
         i5tzplxHtJwyFYNIm8kidFKhlun7O2NJeRv55uTn4sTD2N03WsBmvbGdq7L9yLd0lkmF
         VfVEZA3aHRNQ1RxBZf9v2m3Q0anEffhdEd5j8cLdcHUZRfuvz3njNxWNXdVwI9ens7WT
         +t4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385618; x=1786990418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUm5zg635IdCfrd8nRe9kr7IONoPkdCFzJRsBETaklg=;
        b=luhsuLZnfpLhcROP6Ynijitp8fmQLTkqKVpPGx+LiUOBsq6d6JpXNO08SHxXAs+Q3U
         nxvrVzMVVqAINbsdoCfaa6RGO8Pne8a+wIk3+73glyuUJF6sIgtzplg/Fr10BC7DhJrD
         t0r3okcOzhz7ICFhfINwpzmAWDjSkfYudg0Ippiul3T+rsKe2hy1umWao6ofTUpH/QZS
         Mi0i7gPM/OnF/e2k3yb5pbtEG+7cinE1oSuRdBeB7OvWs+zs42LWDIFG6dCem8N+d86d
         ZcgIE3XgNvz2uiPDoTt2Yuvbq/2Wywcwr1bk/tOYBkm+grAAzlBBuLvNayWIPBBsehVq
         Moaw==
X-Forwarded-Encrypted: i=1; AHgh+RpEZeEo6/KSa+rsRnR65D39neV0RJhRpfYS/gSZzuRAu5igLY1Zz0g/y1f/GG5bJk5t+ulhDPs+EZG5Hs4e@vger.kernel.org
X-Gm-Message-State: AOJu0YxYASdyqdG/m9WHqXloRwbL83OMhEHg0SxpoKBafmJHTBGR1hCb
	V/EDwbbbspqs4+2aGXOEpk9PMm5KrP8nBGh9IqFXRMW13BVs5/mRuIYh
X-Gm-Gg: AR+sD13dDB4z78vSuZqa8sMMBMT7lmWriWq/owCbWqC41IRBe1f6H7wwqHrFU93VCey
	hTpxdMtoeqsIfObNE7Wj5lct5taxH9ujY3K5s9SPGGOD8m728k4URPFEi4mhpazU63+do0oHZc6
	3GnqyS7rKsJy9ZxmdiFIIwEg4MRP7Eu1ItTSuYKVW+WI+YEv24MR85Km72X7/4jskNyr5XYTHwH
	vuSfpxeTpi+8pp1lPhC+tqY1OxgxWzfMIhDZgUDtsrkKCRKad3goxj5g3JHgZr2pZ47BXjviIp4
	Ls3/7aHdYEeWkoYDOv24yF5t97HHJOIa1Fz8FWcceI7figIYetfcUbOXVssPCvdmEgkgKQBKZ85
	SDbOQZCq4GO52mkOZCvNePiG9Ok3BoxrYp08Q5Ki76PID/eh5oyc37iEiztrLFMeMEvdn09hzTE
	fNsthCSes+xRBle8V6BK9jS5uEHK1AN9Njd/WJ+sUPHsCIw4FoV03L8e+BwAcg4JlZlcNHH1Ha8
	A==
X-Received: by 2002:a17:90b:2785:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-3903c5d2f29mr48647797a91.12.1786385618336;
        Mon, 10 Aug 2026 11:13:38 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:13:37 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 33/34] dmaengine: qcom-gpi: defer callbacks via vchan
Date: Mon, 10 Aug 2026 11:09:34 -0700
Message-ID: <c575a24c789317a5ec330a4be0a6ea1ece60b5ae.1786384169.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete descriptors through virt-dma instead of invoking callbacks
directly from event processing. This preserves the transfer result for
the shared vchan BH, which invokes the callback and frees the descriptor;
drain that BH before releasing channel resources.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/gpi.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273af..2bc3a07ef092 100644
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
@@ -2009,6 +2017,7 @@ static void gpi_free_chan_resources(struct dma_chan *chan)
 
 	/* free all allocated memory */
 	gpi_free_ring(&gchan->ch_ring, gpii);
+	dmaengine_kill_bh(&gchan->vc.chan);
 	vchan_free_chan_resources(&gchan->vc);
 	kfree(gchan->config);
 
-- 
2.43.0


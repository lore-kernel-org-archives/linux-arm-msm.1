Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0874143B4B6
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 20:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184898; cv=none; b=Z7R03YAb0GabuswoKjq0Bk5Z9SSs/bZJVY64nAMKhr9rrOoOPw2vIv4CD1oklsS/rvoiuSJ3RfYLpbsoPX9LyBLg3b5So3URrKxvuLnz9CRkIyjY+43b+58GWY90ZudJeQ3nWDC4IlJ7syBdHxVIRyt8d/gLR8d/cfaC2RTDz9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184898; c=relaxed/simple;
	bh=mkvTWGl/7jnQBsumfGNrGUMVRJfBwZ0IzD784XaiKNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWkLREHBP98xAJhUfOjc5WmGZgTdckWU+GXFRyh4OYPnlt7nF+ChX7Tkis7RNgoz/v3MR2Yu7ZxpBiMlO64yQVJo8UuGD1x73VV8sg5qjEvilEj+sKawhEPM5gDFhBfAenzFKpYxyohqUI2wFjn9+KhtSmxgA55bo6EE4Xo5iN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2B5t0E8; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2B5t0E8"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so2733273b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184896; x=1785789696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZE8TVS27+6a892mUCRUCaEb8DNYyLcGJV97gPBVei3g=;
        b=g2B5t0E8E7Lmsr8ORtfpUCKVLJKzT39egs3iA/HkVOsieH/EzyrSNI39oV/tXJLl4d
         QWXSnJ+g2tRnAY1/DQMCWMaP1GitPikXuujGcBJpdrMYTTEtn7UZPsH+gs+bAtB9aPdD
         2fpefjhumawJQc2v+nMCw67kDbKgWbiEjxWwJ0T5lPcl0IbVrFD0aMc1sM3jgxvoDv09
         oRuV28/CStzTqI13SVe2QZJPBLh7p0kSHj6hUqnQOXHZvc2ixi7nLFCv3uTJWRdUxA9S
         H7jZatHKESsmwYc9tLewaiF5Lktb4N7VpJfXc1+60t1ngRUUDEhMxK4xt3wn26nBiokn
         F3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184896; x=1785789696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZE8TVS27+6a892mUCRUCaEb8DNYyLcGJV97gPBVei3g=;
        b=TlyBdMmZ6of72JRzN3OuHzPiZH48uAOKp3mA2J7wX6B1Li+9CiS+IarZODdM0ung/g
         IG79i83nKFcI/UVi27PBVTw6Y5VGtAdx7QaVhUIBx/zNCBh3C6Wt6J4Hylu4CH90/8Eh
         20LqA2PzOvVlXlG12wCf2MwWlO+joE7JBho0YUVDTIa3twhharhIhvCdEhzKgEuR9teg
         +nuujiwEVFjJfjGgbf/fdTf5MeMGoBW0UbaVRtSzKLMwO2CiI2Ly4ikQLOMcB6Yx4gsM
         qrlme6MgwpewAi+0nIe5qvsZEg0cViu4KGBL2O31mAEs2xiwbB9jbRxGbJl5e3xQGeXG
         lcnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHpWdk2I8MVaczyxsL3YVliYx+E8yd6UIYf1Pz1Jlgix7HCI6yabnnY4ItrsMZJxYjoUY1qqnqmgexVzhF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw56QixNp5gLCxHuy+E53S/6HaDTFdwhv/dqT6hylRDQTfk8mG+
	jE/sagL92K9XDHLMU3T8BjMg/ooIJENiPxjqQfdoAHlo4dHs7lz613wb
X-Gm-Gg: AR+sD11hZY33mV7vSgu7uxEwCVACDfIrW6lflxkPf8hoIdMy49/pKQ2lXbkw1xdFbz4
	HZ8WvSJlVQz4qnVCSOPgVxjGsfvW5PUQ4pOGkyV97oDUXVBHl7Cj7thXfmIX6JxyKmR+zCc8s8O
	RXC0npjKN1wDMXhybvbK/r0vAzcqfmHZjaLGrD21IAauz/HPc+5zyqpBgQynBWEQYoG9xYR2xQi
	Xkc9jYMx4lWhy05K3or25sothloIisNgYH+5/gNnpNAHs6LXnrTrMNsUOJ07nfJKZ/GrU1ADFIP
	qXs+4auIyw2U9PJJdb9iHEzptWaRYXtGpPp164ywH01fDqLH1IOcGa+fhOubRiVAiDTrb0vhs/m
	ok5N8acQTaIdPAGjjFh6gTjSesqOe+I8byg5XH9h8OKjoXfJNrbGYkwmyRxGVGFd/7R3emw5ibC
	GhBskl
X-Received: by 2002:a05:6a00:1f05:b0:846:c7f4:74d with SMTP id d2e1a72fcca58-84e5955b5b4mr7126826b3a.41.1785184896473;
        Mon, 27 Jul 2026 13:41:36 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:41:35 -0700 (PDT)
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
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 63/64] dmaengine: qcom-gpi: defer callbacks via vchan
Date: Mon, 27 Jul 2026 13:39:25 -0700
Message-ID: <2685692fbcc37b41bdef7b88e37ffc7ca359986e.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
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
index a5055a6273af..4cf68cf8eb2e 100644
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
+	dma_chan_kill_bh(&gchan->vc.chan);
 	vchan_free_chan_resources(&gchan->vc);
 	kfree(gchan->config);
 
-- 
2.43.0


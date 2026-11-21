Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297290;
	b=XC5u4fp08VkxNUqqTV7I733teiI2AWppgcAf/42k+hbk5kUlctG564obnDmODpiSHH62
	 Sq2z8BXOlGmUUsIPuE1ZVpGdQGgDbyX8KUQZxiFnSK60/cDpsqZpKsu5imLTcB9yO+pU2
	 8tGPn1UVMA6S7Wtt78cNBRaJzfksLL1sbsXF8WGLtXatZYJScGEEKAlDknKJ5LFBjd8Mz
	 bdBMw1g63huFlxlyxNoPom7+wCSdBpj8GV5U3bOxC1n/V6nQUmC34l900Azqf/ztJjMVD
	 OfB2t4PK16Ov0g3rRFQ+WcJMvwxf54SumHDqdKHRnrKxICIMHgY9hWvmj03CmxWQoVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nqAE9KZVqGmI34o9aLpAZb7QLNNzEAOkrz2b8adTiHA=;
	b=hK0Qv0AXLXTPmQ72ENpM27CzX+QO2ZgoN+lsYpCf9ZOdoe8xNANWnz/Xg6Wd50xxiDMz
	 XxYcm9lVs2oWzsXOt/gpXHl3tF9SKewkTbEi5TxLEGnB5zMOVXnLhtzk6b6rAB2lMYHTP
	 uFgyXm6/AnbWRfZsCpWJzHJnh3jVLjCjCVM3Lcei9gQQLp6Zl0qjFnJ0ZsF4aevqPJQ5R
	 40Ag0Sa3RR78yTS77Z52aYvKmI92Tc/J6oE4O0aWBaWBatKeGuyo+MPrJewbTBI0EHvTs
	 ikpTJGMEZGTgbN7/cVcX1AJDueFsjVVM88Pw4zSwp0VCwSC+znpzdXX6QL5xzJnzFjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IewuJuFG;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E1B606A68F
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 21:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0E1B606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IewuJuFG
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1280433f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 13:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795297288; x=1795902088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqAE9KZVqGmI34o9aLpAZb7QLNNzEAOkrz2b8adTiHA=;
        b=IewuJuFGIB1X0E0CXUO4s4h82dTjoc5m550vygeevXElgFSZrch3CywofO9u8cKZiL
         LAdrnhFf9y3RdO1t/Zmv3i4G89I3idhivczjSFS8Dguuq+cPubf7LDD5zuKMKSwKOcDx
         NNZ13x1AVBorh+09VI/mFfrMEKbF+32AiHroVCWnqGmmu5DkK6hNOfg2BHMngX7sbjXp
         m5REfPUptbBmJB1gSTABkXxe9sy4neET6IPzYDHT3K7bir/YREpH6PUDd2LtAJJ81pbp
         La2ijPMAuA5TbaDy+To89rCBIoKbxGoYN/QvEEscmU7ByJZRziREFDroE67ZhiOzLbiT
         XvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795297288; x=1795902088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nqAE9KZVqGmI34o9aLpAZb7QLNNzEAOkrz2b8adTiHA=;
        b=u9ci9Q8hBH0n7HWaVHG3G+GmVPSaOUHUkXJ3hw1mldUtSBBATiB63DynFhbiZ8+98O
         H1kRt1A7RVl2coOGJqsxgven7BZPlml7wUnQQeaia5N3cJ+kvQ2g5T9czPpySa8Ny1rN
         2S0EWuBgz3LbGNYylMLak9i66YrR1j78pzbwEXaCvkNCIi4H1X3tgqU2UXRKipO2ScKi
         LS7KObIwTgw1ZtcXEs+mA16KmSUQAoIMRHzNNPuNO7S8Ues0FU07JHbVzrfZTxogNfHW
         Pg8ZYtLRaN5Y2HuelvImI4d27X5Hxzx2nJy+RC4+UnzgxfbMFSCpNN++iGfpdQs3yqPq
         vGkQ==
X-Forwarded-Encrypted: i=1; AL+hErFX4JG6I9lBYsf0FHsXbzwvOiZ3vGmNboj302M1uW6ccGxoF7q1WrPZaxQVQTWcIA+sP6URTljT0tusd3id@vger.kernel.org
X-Gm-Message-State: APuU4Z8+nqQVI1ZSJQBDTlqlYPH9JkkHC6h6rb5wxsYH0WOS0hmdD5X3
	mvDn2u8Z+JJooU2/BKPwkPUCxYDnaSYZWxRl5/h1Msg1O9Fovh8Cn6M=
X-Gm-Gg: AZFdTZeYl2HT08I6WF41yPFd8EuVO94VxKWQSt38aI238CQv0kpTi4ltawwLg0vUujn
	kFySyqDEN138LWDJJ0i2BC3UDLCP1PlIWn2glXf8jUdLq6f+eF+LMoXOGtle7OakVuNDyXmZNsZ
	LqgFF3ogHEKy8qKf7aGvnASSQy57/bAT8/1ieqqaY1qMS5oclylslSMSXF+PfhqsQJW0Yya+ZKa
	YHGIodboXk3bQS5reELDCyWscUMGyNibp+d4l5p79TVWalpoErOii6oPu9YyMtGkND3hCpbHvkz
	6vbW4uz4kLUNCkBjwjAJuSGXysHts5sLp0DT1MqmGSO4qXwEAK67cEivUxzzIcLnWxlxVpfhRkB
	OsNxBp+yApfvzl7VC4yWrUdX4Hj31M2yWCs8NbX0QGSfzZCyAnnSwOvaMVF01ECCbXKb/hzBbYv
	vhY9LLqQtCB6OBVYWOQDmnjh5e0Ndw9Y9hca1YP31pxCNgdGgF5eoYD8FDjF9Fyd3i32hCEfSOS
	U1exgfCX7/+OQzSFjN9nfa9nx25vYHUi3BOx4ZoTLFdr0917XACH5TrbCmo2tjwTTUNqGXTmEY/
	EeWKsd4jNKrFSw7n3/fKCm7BZziC/JunchMcRYsiL16/V6q4KChHJi7N3enD
X-Received: by 2002:a05:600c:4fc1:b0:4bb:53e4:a7cc with SMTP id 5b1f17b1804b1-4bb88820741mr170496205e9.30.1795297288186;
        Sat, 21 Nov 2026 13:41:28 -0800 (PST)
Received: from h7015t.. ([193.207.113.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm54580645e9.4.2026.11.21.13.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:41:27 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dale Whinham <daleyo@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 5/7] drm/msm/dp: dispatch native IRQ_HPD directly to msm_dp_irq_hpd_handle()
Date: Sat, 21 Nov 2026 22:41:03 +0100
Message-Id: <20261121214105.32596-6-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
References: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
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

msm_dp_display_irq_thread() forwards DP_DP_IRQ_HPD_INT_MASK via
drm_bridge_hpd_notify(..., connector_status_connected), relying on
msm_dp_bridge_hpd_notify() to observe ISR_IRQ_HPD_PULSE_COUNT in
REG_DP_DP_HPD_INT_STATUS[STATE_STATUS].

Because an IRQ_HPD short pulse lasts 0.5-1.0 ms, STATE_STATUS has
already returned to DP_DP_HPD_STATE_STATUS_CONNECTED by the time the
threaded IRQ handler runs, misrouting the short pulse to
msm_dp_hpd_plug_handle() instead of msm_dp_irq_hpd_handle().

Dispatch DP_DP_IRQ_HPD_INT_MASK directly to msm_dp_irq_hpd_handle().

Fixes: 5043357e75ba ("drm/msm/dp: rework HPD handling")
Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
Note: Kept separate from the msm_dp_ctrl_link_maintenance() fix so this
patch can be dropped once Dmitry Baryshkov's and Yongxing Mou's
in-flight DRM_CONNECTOR_DP_IRQ_HPD series land.

 drivers/gpu/drm/msm/dp/dp_display.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b8373740275b..3a3123dbe417 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1015,10 +1015,8 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
 				      connector_status_connected);
 
-	/* Send HPD as connected and distinguish it in the notifier */
 	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
-		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
-				      connector_status_connected);
+		msm_dp_irq_hpd_handle(dp);
 
 	ret = IRQ_HANDLED;
 
-- 
2.25.1


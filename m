Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316651;
	b=yqLJRxVL/7KJKsck4sdf1UfDCIPjuMB3n9xJ4VErxOPClTcbHFaOlgzGjo1RccFxuD9e
	 0g+TtVQAEtHrEelQhQ6zCXNxKFzBZgmqMYcu2wTIbPrONkiqJkaYqPlRYiOjpnwV98yf4
	 qJcobtjS7grIyo8GgedJiaoGqZKXAqSBAy6L2HVpKiHUS6H+ruvu3ryDmB3gfHPKty3vD
	 T97sTv+lp5HkXqLlUXIDD8+zcZrcu0vUB7aHwFbSzEtwo1fUbW8hE6FGVgFU2/0zU6HXq
	 zSthfHbjJ1HCHu9Fcpm1K0RfwJcVY3fq2epmCuc0m7GrYvrAzhqOGSLvp+Xi71UVP/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=By/i7sgcs2TsgsHSYJ6msNCbQEDAMlEmmU84bw7WV0o=;
	b=C9zAewfR/EqI/xLdrlynxufmME/a8FNIbw09XUhuMKDIuJkvu9T1KD5qGwpIClRUxGrv
	 a+m+6jkHxP3KIORxlr9A/EfFMI+xMax+EBeyOBr9iMesp+jr8FOlHCevaMatCSyLj+/nd
	 PYXTmduEGRvH5bnwZDaq5/au/rSJJfM1VjCssXfx4hXEkO0x2gScOXvMD6ntR4EuqbHo8
	 GEaZnlZWZFaDKZYHqYZq9SWm4f+++Jb+S5/g6RcleEmZwZpMR1TDnQg8owRNMaQdYTMJE
	 p4LiBYX58wDVcJrra0VnQJ/W967gH/79h2mg49lmw9pw1nFF/c0BhPN7vKGRVXOPEEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwqZ+l7P;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272F46071E51
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 13:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 272F46071E51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwqZ+l7P
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so1245758a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 05:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316651; x=1794921451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=By/i7sgcs2TsgsHSYJ6msNCbQEDAMlEmmU84bw7WV0o=;
        b=hwqZ+l7Ps+KRYUGIvP07EumEH2t42cEuZ/4Sqch3YflI2QnBexnmBFTxioaM2IPW9Z
         0FIeg8IctMBQm+pDLaHrEjl218GqSmEfRQIMnlWEMLrB5/A0+iXR+YK4xqVKiY5POVjT
         FDG6xBNKaEN90oUvA2We854jVaTt9SJNxEenG8gxVShYMYgkvdemDMqD+WDjUGIIdXJq
         6MWabFFizpwUQf8qIqT1hXuGmkMOes0m82ft4vZDYC7/doPc1he44EX6xMhR7rB1Hj81
         t2cEc9jJkOjyX+hNBGOBrqHEs7qfmoHYgmSTpydLQIiFh2FeJO3NMjswyZJG0VQ8pkBD
         jpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316651; x=1794921451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=By/i7sgcs2TsgsHSYJ6msNCbQEDAMlEmmU84bw7WV0o=;
        b=zJ6iMMW2yXpLq28H+6xvvE1XbVaf6u3OzexNfnWdLxzjOkhMxXfEiyq/f8FdiWM6q/
         LIFQOYvY+ugXVtbtwkAlO3fD/nQdwJ8qRJMagGUNJF/i848FIciDJ60shtig5mYsb+er
         v4NYu2a09J8QwHUg/rZ9APBXdOWCdORjbd4rzeEpWQn6iN/rUih6PL2zmJ2d4/nhFl0U
         sQXSCMyVvjzD33kPO+Zz5lWD3wkZQ6V1q2flYpL3W4uGPRt2P4BEvK3Wq232pnymgS6J
         +vE2woci701dlGVfHCicoS6tfgvNnCBWbx//4+ITZK3XOTtqqy9zxotdkr8+O8V4vUsv
         E69g==
X-Forwarded-Encrypted: i=1; AL+hErE5hlAkymDZMtVF50BWlels3gnh5v2wAWyCjeu5a4p2fXO3jZ13DAAB8Exzp/t+xLYa+D4Z3x0SFKIxwlcV@vger.kernel.org
X-Gm-Message-State: APuU4Z/PJjMxlnObpCpICwjOjijY4bqCxqCPbsw4eNjot6l+i7G5kpUw
	hx/ZHoIeXBGQufR0GG3KiEhCBEONjfjiVXXyIKq4dD2XlfvITBowrE9m
X-Gm-Gg: AYBFou0p67keSWsSUCbQnUlunrj0sIToNuGJyKJ2A7HJfoPW9BVy3dCkWUgG6kZvglh
	U0wLQK9EHMe3gqxQb52qIbrF8jf1mC/USyqrZF1ojDk8g03u07RSchS8wuf5o2FY4EzMYuLj1zg
	maSzdYkvsWbzxsOKx9bT+vLZqbqXiLMojy+rZ5fX4EqVo9rGJ7JsSLZ1n0+Q0S2y3Vt/9owkDKl
	jO5SZ3YAzc5/XVAk+RefPq2XolwMpoKrRs69LaEkxIIMV81XnvAcsL4gkW18vkpEQpjdMCXhoe7
	G0dRqRUFWOmTuHuJgMzEeK2FNsxh1MKxmEl/7QzfgEqmoKSoaWrlv1u6u6WYoRSNATXRWQz+ug+
	Y7FLJwKUqKonf8weuE5EfQNjSJvh9/Sy9H6T2KYPTcToIJrQO9FJX2boXjY01dDJRElRSgveBg3
	KLE4ORYYOOMi/vd2C37hb+Ok1+PDmm7LkpJYzDQ8tVbdFm39Wj/GQr2g9wXH6PQlK8xPWjuGWQh
	oSZG6GmrkA12wI1lVDsfhVyUZvLjzPsSJagL4T2kBgiwfLoyXVB87CnPqA1pf/MtIdOK3uZCsKs
	FAIVxbWzV2EVH9tSjmuzO8MumahJ3tOD
X-Received: by 2002:a17:90a:e7c8:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3b166d1a008mr2747340a91.52.1794316650614;
        Tue, 10 Nov 2026 05:17:30 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:30 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sinan Kaya <okaya@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 31/33] dmaengine: hidma: defer callbacks via channel BH
Date: Tue, 10 Nov 2026 05:13:31 -0800
Message-ID: <1654bf0a77be77ccf3a2775a838d1accf604ac4e.1794315350.git.allen.lkml@gmail.com>
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

Move descriptor callback processing out of the low-level completion
path and schedule it through per-channel BH work.

Since callbacks no longer run synchronously from hidma_callback(), drain
the BH wherever the driver previously relied on that ordering: provide a
device_synchronize() callback so dmaengine_terminate_sync() waits for
deferred callbacks, drain the BH in hidma_free_chan_resources() before
the descriptors are freed, and drain it in hidma_remove() before
hidma_ll_uninit() tears down the TRE pool that the completion path
reads. Kill the low-level completion tasklet before that drain, since
it is what schedules the BH.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/hidma.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index 85844965f0d8..2cde0cd08b1f 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -155,6 +155,13 @@ static void hidma_process_completed(struct hidma_chan *mchan)
 	}
 }
 
+static void hidma_chan_bh(struct dma_chan *chan)
+{
+	struct hidma_chan *mchan = to_hidma_chan(chan);
+
+	hidma_process_completed(mchan);
+}
+
 /*
  * Called once for each submitted descriptor.
  * PM is locked once for each descriptor that is currently
@@ -181,7 +188,7 @@ static void hidma_callback(void *data)
 	}
 	spin_unlock_irqrestore(&mchan->lock, irqflags);
 
-	hidma_process_completed(mchan);
+	dmaengine_schedule_bh(&mchan->chan);
 
 	if (queued) {
 		pm_runtime_mark_last_busy(dmadev->ddev.dev);
@@ -203,6 +210,7 @@ static int hidma_chan_init(struct hidma_dev *dmadev, u32 dma_sig)
 	mchan->dmadev = dmadev;
 	mchan->chan.device = ddev;
 	dma_cookie_init(&mchan->chan);
+	dmaengine_init_bh(&mchan->chan, hidma_chan_bh);
 
 	INIT_LIST_HEAD(&mchan->free);
 	INIT_LIST_HEAD(&mchan->prepared);
@@ -529,6 +537,11 @@ static int hidma_terminate_all(struct dma_chan *chan)
 	return rc;
 }
 
+static void hidma_synchronize(struct dma_chan *dmach)
+{
+	dmaengine_kill_bh(dmach);
+}
+
 static void hidma_free_chan_resources(struct dma_chan *dmach)
 {
 	struct hidma_chan *mchan = to_hidma_chan(dmach);
@@ -540,6 +553,9 @@ static void hidma_free_chan_resources(struct dma_chan *dmach)
 	/* terminate running transactions and free descriptors */
 	hidma_terminate_channel(dmach);
 
+	/* drain completion work before the descriptors go away */
+	dmaengine_kill_bh(dmach);
+
 	spin_lock_irqsave(&mchan->lock, irqflags);
 
 	/* Move data */
@@ -813,6 +829,7 @@ static int hidma_probe(struct platform_device *pdev)
 	dmadev->ddev.device_pause = hidma_pause;
 	dmadev->ddev.device_resume = hidma_resume;
 	dmadev->ddev.device_terminate_all = hidma_terminate_all;
+	dmadev->ddev.device_synchronize = hidma_synchronize;
 	dmadev->ddev.copy_align = 8;
 
 	/*
@@ -913,6 +930,7 @@ static void hidma_shutdown(struct platform_device *pdev)
 static void hidma_remove(struct platform_device *pdev)
 {
 	struct hidma_dev *dmadev = platform_get_drvdata(pdev);
+	struct dma_chan *chan;
 
 	pm_runtime_get_sync(dmadev->ddev.dev);
 	dma_async_device_unregister(&dmadev->ddev);
@@ -922,6 +940,10 @@ static void hidma_remove(struct platform_device *pdev)
 		hidma_free_msis(dmadev);
 
 	tasklet_kill(&dmadev->task);
+	/* the low-level completion tasklet schedules the channel BH */
+	tasklet_kill(&dmadev->lldev->task);
+	list_for_each_entry(chan, &dmadev->ddev.channels, device_node)
+		dmaengine_kill_bh(chan);
 	hidma_sysfs_uninit(dmadev);
 	hidma_debug_uninit(dmadev);
 	hidma_ll_uninit(dmadev->lldev);
-- 
2.43.0


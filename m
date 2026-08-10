Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD53D438039
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 18:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385613; cv=none; b=UFXOwy6b2v3Qf3geh69cOaAy85CahBbFbWyAR6cSrGoLLMLXynoYgkDujSOOvOn3Lzz36R9YKNCdWbZ0/WXcxgxB7ni4BlmAUkwsyhxci33QhC3QRLJI+zT04gyheksMF2W7S2xag3fMqQYiB1DkdDBITTN6QqSO4iFHSeHebXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385613; c=relaxed/simple;
	bh=28om5El0TdZ4S+gnFdSdluPfV8TV0Ds5qbfPBcio5bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/XclmBlQiHQ9G/zcWa0+eI2fJdhjwgPIxdcaFItlvPK8lsMMaKRT3peQ8SMSDJGP/ld4Zm1HYsJW/nYeq2AiA9Sns7Cddn3uC7hrF38pYe3zCzUdh6VmYljobbC3AAVFJuKgFDApMKjFWFyaw1kcGsDQ7+xaK43Fw/T5DX6jlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ao6mXLe9; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ao6mXLe9"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1849798a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385611; x=1786990411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whlCZPyT2KYXXz/hQHK+/7ZGUcx/5GtxWUD+aYLMk64=;
        b=Ao6mXLe9JHP69qbmh/F4BxBWpG5bnPxrdmzs+YEbZKsBbAtzvFMKBKP3b0jGt77eYL
         BMYozG4siHNIYZ4utTLi6tO0F+rf7R5KSv0KHMCImB/BiQtSy5Ed1iD3rM4XLtqZkS3T
         8O4oREC4H4YSVoEjzQkaZrwv71Id8IDPJYmZ26vCMacrtVf/+TjIgt8hDqF5DEEhO8yF
         SvSXt8xhc2g+JmJLqJiSbzVDwyFnPwB8d9WUtOHnV+xoNhvh28tat7lE7Y772gFcqhiD
         /8z3mVoTF9oZj6gX2t7/GVotPWe/zyBGy9AjudeTmT7sgkPUHQRohHlQdPP5GsfUin1N
         KGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385611; x=1786990411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=whlCZPyT2KYXXz/hQHK+/7ZGUcx/5GtxWUD+aYLMk64=;
        b=he6vDTQLYKIIoQsICZ33BofQ3xFxQ6j1mCVRmAZ+BXDdzLG0/15HYyWRG1wkgdIFkN
         TpaLpvchlQeR+hJemmL2CXuGu0xZB//rdFXKwtgO7CSJKtvXffS8AsXf26qb/XcHTOKE
         UrIglEqMuY7mFcxCeyZpBeusRzgd89AJw+qaX/sxjaHVVbYxkWYqzqJk3h+gvzjxtEQo
         0YPysaKWnr5NLHR50WdSC1mnps4iumNmnnm3tHgWS6O9ed6sF9XqYOKRSwefi/l0knaK
         sZKQOdiebUW5MUK52Wxm5KAXKHER/ANMMqSkozJjp3n3BWI5fuw0r9/ZfXSTBZzja6Vj
         pAhw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+ixRGV/K16kRQL4q4r344OlZ5vBjAAwKysALP7a/ucFzyNXZgUqBsKO2MjyfeFct45F7nf2YjbxMg5j2j@vger.kernel.org
X-Gm-Message-State: AOJu0YxrR0IToFgqz7bi2m0+AQ7l0K/I8XXJOGp7/LpHnxCZsbLt9gSv
	eSKX/ORzpZ56MllYXUghftFvj8UzuHe/PIvVeuOfH76gvVrLeypQs7uy
X-Gm-Gg: AR+sD11Lm07gVoQ2Tc9pGJL5J9oc16v1LuSizZ3m/IVHdYkSkBi8dwVZUzQzavyJqFs
	0XpiT+qYQIGg49rD3sz6fpvTRo+64kjebN/87zApgF9w7ueVH/2ngrMNTV+5ZfOIqgkJQTZ9EIg
	JH9JbkYLFxZ2sA6skuaCkHqX8shA6A96Bl5AWvESwWqigRBZPhomRIJrZmacI5B+M1CSUIiOMJz
	GewRR1qUH9n3oicxvbvYqNUTMsGlAXYOR+Dt1zR2oyV509AXVLxcaRNmcmzJyIA7KlMoO2RTtKZ
	zOmsAvoDEDAR3agDuwbzpUcoMi/IjxuHW+WMb7aFwLXa6m4ffwW5D6Gthb5FwJwqskBh7vUD3th
	5XIJCawpAvQRhNitT/+qlNXSxcCh+gDrSaI2e7o02WG0H0yG4OMH01tKzFqBMf535VkFKsxHf5+
	90mFN988gwledisVBYtU9tAs6IjcPOFdXy04eSjgqfx+VsYOy+VjbO8MK4ukHl9Vw=
X-Received: by 2002:a17:90b:5446:b0:380:f389:447b with SMTP id 98e67ed59e1d1-3909d89bad6mr31304315a91.11.1786385611271;
        Mon, 10 Aug 2026 11:13:31 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:13:30 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sinan Kaya <okaya@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 32/34] dmaengine: hidma: defer callbacks via channel BH
Date: Mon, 10 Aug 2026 11:09:33 -0700
Message-ID: <702687c28f440bf017c6e57f630bb65d22d3b217.1786384169.git.allen.lkml@gmail.com>
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

Move descriptor callback processing out of the low-level completion
path and schedule it through per-channel BH work. Drain that work while
freeing channels so callbacks cannot outlive channel storage.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/hidma.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be21d..486a2c61a9fb 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -90,7 +90,13 @@ static inline struct hidma_chan *to_hidma_chan(struct dma_chan *dmach)
 
 static void hidma_free(struct hidma_dev *dmadev)
 {
-	INIT_LIST_HEAD(&dmadev->ddev.channels);
+	struct hidma_chan *mchan, *next;
+
+	list_for_each_entry_safe(mchan, next, &dmadev->ddev.channels,
+				 chan.device_node) {
+		dmaengine_kill_bh(&mchan->chan);
+		list_del(&mchan->chan.device_node);
+	}
 }
 
 static unsigned int nr_desc_prm;
@@ -155,6 +161,13 @@ static void hidma_process_completed(struct hidma_chan *mchan)
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
@@ -181,7 +194,7 @@ static void hidma_callback(void *data)
 	}
 	spin_unlock_irqrestore(&mchan->lock, irqflags);
 
-	hidma_process_completed(mchan);
+	dmaengine_schedule_bh(&mchan->chan);
 
 	if (queued) {
 		pm_runtime_mark_last_busy(dmadev->ddev.dev);
@@ -203,6 +216,7 @@ static int hidma_chan_init(struct hidma_dev *dmadev, u32 dma_sig)
 	mchan->dmadev = dmadev;
 	mchan->chan.device = ddev;
 	dma_cookie_init(&mchan->chan);
+	dmaengine_init_bh(&mchan->chan, hidma_chan_bh);
 
 	INIT_LIST_HEAD(&mchan->free);
 	INIT_LIST_HEAD(&mchan->prepared);
-- 
2.43.0


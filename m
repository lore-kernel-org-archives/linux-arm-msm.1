Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580164;
	b=XoffK6a63gliseeVDxOxy1cMJ6vBGSYfGm6TUDdA/Im2yknyqPGmeMrF7ECDZM/x9KJq
	 9h8czxQ0FQjQVq9GDv/NvTkzakJ8FFUfta4kgbaVVTp3XtNctk226ojTlOIdwU2o5Rldp
	 3Z43v+eGVKoiJyrSC02FkiMe1ZJs3yUgr6TfHMUIrQGvz6PQluKNqHiiMqWbp/LsRcMLv
	 ihZvcchs3RHcT2bYrAfmTk35xT89ti02D4DVdzOcW3Gk+qIu5lsm+zCRWmBERkRhGpBS+
	 D/ch0EVGsI7HUIvimvKS+NEKc3KD7w1GpdAQ9ZOo610snlxlWSD13nGvFGg5xvd28Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=I+VroZ2GYNA2jcrSiuQoC4x3Pm5mFGOG4aOL1GzjSEM=;
	b=h+IgTKTwsf+9GtLduPCeR1W9tmiVrjBgF8pHmsIJOa5DZTxH2AlyRkep7oBLnHDqOttP
	 S/dvldG96Y/Ql0LfLyS9DqKFNwHf2cazwMja0e7rCPj2BxBuXb93VfvKR/oHrljruJGLF
	 FyGygR6fTPrF4MFAp8tQ1z3I7BwFjhCqsZ+xsSFffHJcw3wMETqyiRHCbK56gJSmQouwV
	 hQplJwRaRcEdbiKr+EOPdRMdM1On2dATPC8rz7bwDJqbfWlVwpeJPVVwX7HA0KGquCK1m
	 FP6eC8BLiNbc2yXvpe3Mn4aPJtjfjlcsip/K3H6upcJKQRjG7tKljlr51BDKAGWcjFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=biTSeqiQ;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CC960A2636
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72CC960A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=biTSeqiQ
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a359b714f8so5450585e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 06:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794580163; x=1795184963; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I+VroZ2GYNA2jcrSiuQoC4x3Pm5mFGOG4aOL1GzjSEM=;
        b=biTSeqiQbBJ9B1EnH0cCc9/h/4WnkrIYihcjZY/l7DQKyamyrhfrlZwlRRN0JLKVI5
         CvRW0KxYbsiyo/eFsF3HQSO8WLeZs46qCCVkRQb06tzy+WPiBEiEu5z3pclkziw24EZu
         lunh0szUsqLMwAVK4ZOW+O+3ANDu65bR3JtR8s9yn4aVfw2jTWajbYlKZxgfc/+fztwk
         +7ss1wYwDbb0r5rU5XU3t3lo2DoSM+hu51C1cw/iKHMQo+uaWcLHdLMi9SPyxjE9FRDE
         IR9QpS6OHUkFw2Y9AIdcV519cbfv+h1eMv5zZzdE38PsK8+DqmHQrebkv2qAU+VfXbEX
         TD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580163; x=1795184963;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+VroZ2GYNA2jcrSiuQoC4x3Pm5mFGOG4aOL1GzjSEM=;
        b=xtL6AplMV4TL1o37kbldAgGD64eDdnS0iokmbXZiN16KHbN17MSzTdT38TNEf+EEsF
         msLAFtOXZPaOOm4VN4TvwM/GfU0cG7UD/vwQY0qWcXejEcanw4YKQ+ptqLPhCp2l2Hzz
         M4AVNJ9ZnIhg8nn/YWnZ8yJvL/f16PGlb+avujRwM3ggmjbnCGjV8PEhh6Endl42rF45
         bP7/m1buURd974MRyf50Z8xZRfUSuyB61HC0UsmcWJ9ET3A/fMij7V9Xn1ydGKV9VXzB
         NoPh24IqMZuKlg2C+gcOKTG+/6WvtmoC0b5+6LN6IyGAZm2hfiLBXjTjA+c+bOBs5fcV
         Vlyw==
X-Gm-Message-State: APuU4Z8MiiPtUpb4bCfpGLtF+ShBbuMcC82s24fL00IjrhAbkMCNgWRf
	IqhGJZQ71yw9gKNTi/UKKoaXv+zF9IIgixfldho6xgB0/Q4DHlXSf66Gx1RzZwx7vZdUSyxMmri
	5kV8X0L82+rEkTA==
X-Received: from wmbgx4.prod.google.com ([2002:a05:600c:8584:b0:4a1:cf4b:72c2])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f96:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4bb55a4f43fmr57729485e9.16.1794580162603;
 Fri, 13 Nov 2026 06:29:22 -0800 (PST)
Date: Fri, 13 Nov 2026 14:29:10 +0000
In-Reply-To: <20261113142910.3477757-1-smostafa@google.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113142910.3477757-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113142910.3477757-3-smostafa@google.com>
Subject: [PATCH v3 2/2] dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, Mostafa Saleh <smostafa@google.com>, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Unbinding the crypto BAM through sysfs on X1P42100 resets the board.
bam_dma_remove() clears BAM_IRQ_SRCS_MSK_EE unconditionally. For a BAM
that is controlled or powered remotely the register may not be
accessible: the clock and power of the block belong to the remote side
or to the consumer of the BAM, which is why bam_init() already avoids
every register access for such a BAM when the DT provides num-channels
and qcom,num-ees.

The write is also unnecessary. On a remotely controlled BAM the driver
only ever sets per channel bits in the EE mask, in bam_chan_init_hw(),
and bam_free_chan() clears them again. Both run on behalf of a
consumer, which keeps the block clocked while they do.

Skip the write for both kinds of remotely managed BAM, using the same
condition as bam_init().

Fixes: 5172c9eb89d4 ("dmaengine: qcom: bam_dma: add controlled-remotely dt property")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/dma/qcom/bam_dma.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8a1f4e5d24d1..e01f0fec1599 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1407,8 +1407,15 @@ static void bam_dma_remove(struct platform_device *pdev)
 	dma_async_device_unregister(&bdev->common);
 
 	pm_runtime_get_sync(&pdev->dev);
-	/* mask all interrupts for this execution environment */
-	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
+
+	/*
+	 * Mask all interrupts for this execution environment. A remotely
+	 * controlled or powered BAM is left alone: it may be unclocked, and
+	 * the only bits this driver sets in its mask are the per channel
+	 * ones that bam_free_chan() cleared.
+	 */
+	if (!bdev->controlled_remotely && !bdev->powered_remotely)
+		writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
 	free_irq(bdev->irq, bdev);
 
-- 
2.56.0.611.g1030f0b940-goog


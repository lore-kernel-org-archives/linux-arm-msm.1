Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520354;
	b=an8p+9rCrbZ9JYNCQKSd4lXorDQtZwdAyV8qJDvpuJ7JkzILhFv/d7wNKL1+zeQmoErw
	 NHfJ+7cdszkO/9IGOeSztcYDi+zJJI2NsvcxEZE4Ttuf9gG91sG4CPF97h/jMZX1KWmMQ
	 Xl+INhsOQvW9eUuB647I0h2u2L5ACoxR4KfZWAO1DFEzkyiai1Ji8eUrr4GliZc3QVH96
	 3m9al3qmBidhEaJsFDMnNaP3KZIN7sFwDqw1iQkpv/WkX8XrI7OcNKMGc7RRfZrnIrHi9
	 LcWT7ohypMLazP0feMK1GDWMv9i4ZnxuAev5ZWnEuTf+z0ZHb5+wdDI9EgFIBsRWUuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=8ImmY1A1gNWSeQw3sHZE62qy/18d4XJL1KnxNgP6u2k=;
	b=0eVaHHgl21Gcm2mtY/ZB9roTO+mwGjv8et1RglefPuMflVsoiYs77rF70bnYZChnk+Wl
	 oPiuFY8aahixyQuJEWjEnOTpstLWycy2D9ifmtVhwMfBVh9/AvP4ZLxkRphaNrjBq3os7
	 EfEsLDfyf1A+IktTGfE7ljHbza0BWHskFdEWvTpA57rUQ6CYFiDBXCZbmzKRiLwGpwMa5
	 fOpWvp2z5TZoDhbn8KM+0kBqbHW2u/dRLVjhTqox8EdLV2sfGL1pkOO2ZEL8hyZjYLevL
	 3EvWXbaxp5p+upz5nNLiwjhiwX80fyPAlJw6KHVseK5KBkd0RxBT8qr4RTUZ/dvXOZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="Jl/ktade";
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FEB60A2616
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 18:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06FEB60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Jl/ktade
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1e3efca9aso29995755e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 11:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792520352; x=1793125152; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ImmY1A1gNWSeQw3sHZE62qy/18d4XJL1KnxNgP6u2k=;
        b=Jl/ktadec/H3O9gByQZ1sspJMj09kc09nFjExTNa/XMy0Wtn56UC2pHBeov8wUdBbr
         /3AFhZSPyEquwX3TC49ypzEDjRkfQ6T1gBDXfwFk3aKSFNFhOSk8qL4TQugDRY7xpRgX
         h2VULTIHp/qFM7/u/F0Bk2p4PCngsuaZAqjMua44bwWJakYkx8JJ8TWQywl45PD3sifB
         9F6ouwV+saw+lwb0lf+slIdddT2QGnqG8sYg54YzJsmURaDZqB1BvQvt4yi4TW3KkKjy
         0POaLQinsg2rC1R9AOZ7DkgYbV2Np5zcuQk/cj84AQA2i67IFK7yXS4d2/ymj112Y3Pv
         1KKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520352; x=1793125152;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ImmY1A1gNWSeQw3sHZE62qy/18d4XJL1KnxNgP6u2k=;
        b=Ndxpo+zx6h1KY7uvflZOL90EkGuLA4vGSnUiM0xN4EcOQfadjFvYD7mPB2HnKRr7qz
         g2y97izu0IgttyC03p1rQvXAwE/L9wpVkA4/hnNAFm6xm9qwm+Q/E96sbGy+dA+OJWK4
         Qc/qSXosM+0jQ0Ydr08oytNUdDmJyk4bCltnKjeVWO0uV3tueoQ9DVX5RSu+5AFXyEaY
         VVQzwB3SUPhZWLowPnxlW3G3RxOqWUGFMAAKDPdv9l/FVnYsmqCZfJe1XeYBAVdlJ8d4
         wSbhybrbTTpD8SNr/aSLq90kg7Gx1es5RH4fkWurXBItuQ1vi7dbkKaccMWlaKKz2Dup
         zV2Q==
X-Gm-Message-State: AFq9FYJsif51CcQu1H+uMIbymeyNzbgPM8nXmOUt1U3fL7L0WQMhhkpQ
	V4+PPT/Ep2mHEirLRTSK9UCNLGcRIm+Eo8Io+jeaAgB3P8e49IS+WNlOURIno4AeHpDMHwMAYQ6
	n+JQvGM24vdZx2Q==
X-Received: from wmc24.prod.google.com ([2002:a05:600c:6018:b0:4a1:e348:29f1])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:820e:b0:4a0:174:579e with SMTP id 5b1f17b1804b1-4a1d761637amr244812425e9.28.1792520352280;
 Tue, 20 Oct 2026 11:19:12 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:08:03 +0000
In-Reply-To: <20261020180804.140766-1-smostafa@google.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020180804.140766-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020180804.140766-3-smostafa@google.com>
Subject: [PATCH 2/2] dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, pramod.gurav@linaro.org, 
	andy.gross@linaro.org, Mostafa Saleh <smostafa@google.com>
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
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/dma/qcom/bam_dma.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index bd583f78e0c1..d818fa1dba57 100644
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
2.56.0.212.g129ede20d9-goog


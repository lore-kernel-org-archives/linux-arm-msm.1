Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377287;
	b=rhkBPIZruKFLWcuBT8tI7mEFz6sl21XJ0F5CT27P7JlSxze52EEsUPk7xtQhV7vOWHNv
	 lso0syJn3VKqSbEo68YM+3LEPn6B1A7udx9pMhxJav3Jzjdq58sKjjoxnh9uUKCl2RJw0
	 yZ1yui7NiZuravCHlJRxHS8KEOZ+cq58qBijS30ZHAHEzgGLujjBh4D74uSspQLqQma4b
	 NHRvFdf5JIZIWfnzqKVLJmK5IU9mWZu8SYX3VfpK69KAJlcODN6MmO7r1E/7OhbdNgVbQ
	 jdo5KzfvSkM2Rxzvyzi/J8mt9M/75XbKduIsMUOYNXEwVZWD+jtWVXyZVeU3NKc0CIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rW+txSD0sfyruz1SXJMLcdacKGqqaqe7nAfUTotQ3Nc=;
	b=BTWuw2rCiHXjbxGe5/l0Op58COtq/vUlez9Jkbs0PxkLhDT35eJueNeMcoiGCZ0fKOgc
	 nxR/UxtJJ/yTCj5wcteMy0f26NlY1fVW6S1m9HHWvbDq09yCOSXI2lYWoEuJsFTJN9ho7
	 DWTfqcGj/YZvAxenNthZXgRWBPpX7svj7MRit7SkveTTbSj87f08auYWUJLZiMmKwaWru
	 xPXkJi7P8ApeBJ6bVvaYLi1cZJC1rYiX4L+xeVKh/NlwTht4V2jdM/P63485MfA9ptgdb
	 euIKYHKBe4wsA2l5DlX1RA+zYbl4VZ0YxWXHfgG/G4m6ks1G+OFTbbI6o0M6HvCi8Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r9hKOIp7;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB872606A325
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB872606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r9hKOIp7
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6e560e00a86so619097eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377286; x=1793982086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rW+txSD0sfyruz1SXJMLcdacKGqqaqe7nAfUTotQ3Nc=;
        b=r9hKOIp7VuGPspbF9w3Xm0rrfHlhiOaOoqydRoCGyAbB6sYHjPsIvWzs/+jM4wsOAG
         H1oBXzBF2xK+Ve0Shp/BaXArEX1Hm5zBSldNigj3HdA5MQP2qP2lkGsO1PcP2bCBKGLC
         qmQtzVXLe6onR/fapIdoHXxLvJrJdstDKxZRCvrvuB10/O7neCsea3VhZI/RKrvk1Hod
         fWwceuKmv40uTigZQyJv7jy51uZlW7IrRR2QKxPsofO/RL29NEcf+/juhWm0rr5x9+tM
         +n2Ma1ISqyVnOu+ay+vN+EQM3xyilk5SLoGrU+/xC17gvAzK1/Zlz5asQZSdjWkwPBIT
         fJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377286; x=1793982086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rW+txSD0sfyruz1SXJMLcdacKGqqaqe7nAfUTotQ3Nc=;
        b=iXWIjNlDfVisqoz9mVhjfhCmM8O/WHKqC5pKIRNoUIROvNHgIq/NkLkqbAa9zdjD7v
         Kx/VVSUmhXhYEv7BW8F/KdY+vuK/zkPgzauxyQGpZAACd0F7f5cZbC3O1E/FffxPF+ig
         pXeJi2BK1SqqOgg8anI0zxyBi53YutRDglSQ6QJ6glvsXvIPQqhJ9NY50X/YBqG65ydi
         RdbrO0ey4z3I8tSUnPjiLyaF/MfGxrBDcU+zh6GcNgcYf4k8bx1jx/b55g3E2TB0yM1N
         GvzFSAElnwrxHPOMCiuORX+q0j5zcNLce/LgIFogdzzstrAyNtMFr+CePeJW+UBSv+q/
         dkIA==
X-Forwarded-Encrypted: i=1; AKwUvByuN5lgo+koV0Ndve/6PutH4rTLzuI7aQb/E40eVPsc/mf86epHg/Cv37PBy85QcKT37eNAYAGtkXVPVM6P@vger.kernel.org
X-Gm-Message-State: AFq9FYIk19uA8CG+oDYno9IVZrEIrvs39tsLgw5Xu/7IndjXXLg36mik
	k8Il08ErBFQHOpaHRIFN/nzTRYjS6gULtyBK0DrqTEyPkvx1I95VbPJSZqyt8UkoChA=
X-Gm-Gg: AYBFou2RzmdO/SjyRmrLXtRvjVGteGjyPQdT49o1SQgAwnG5rc9dVsoX3NubMJ/dN99
	cfm2KWYv/WMwwwOAUYODRB0bxwb2bfIehU/2xTtVabCj/O6VU347+bb10voZB5sR4FlURF/BZp/
	TZbI9h2PIT2x9ck+Rv5prkdJWqp6TTOFMPdvzIzRBZFuVdTWROIzfroYOyOM4Q6drMgWF1WgDs3
	C1vXFIymvvCwAtHLLaMzrN1n/iaPXEYf0LQwA6ZEPcEgGa/6/VSmNCVEpqbrlWkViKylpbJ3LyJ
	UIluwvsCPCWBNDLmoNi8x70AXZ4qAOfOVG1a5puh92Yq4qy+DhRGPePWr7NaZQlwkoWqHD+9Uv9
	oJXkG7ZWUiphpA8kTrXIERCcd1k1QdU+4C39ErS3wGZbwXy6AymIeVj/+qfPXo7rUvJCxDFTokD
	COWouegAJMSCzRb4mKeOLwWeUxYZYyqptzoGlOrmJMxL/E6FtE5HqrKiGHZi4Y43YXwktgN3hJa
	B4m5K8Pm1WZx/WwCMlMNcPX/YQtKmKJwtLz+I9DI6CBuWrtT3yYz6BKjby9idkgfaF+/CNWHi4c
	nD/ilNP7tN38hhaFD/rhX2qBdjwseWGSBpfkPw09+1BCAE6hnBf/y3iDfR1+On6AZe02z11+4+R
	A5K3aS8tl/2oRGEJCsLkiTejJVxwneMeE7Swk18RLxAHqz9OOGq59F20ZdiFcuYqZmGqspJJJ7u
	ZKucDJ2/fhryZB4G56dOsHu+PVBN78J+d3v/hV
X-Received: by 2002:a05:6820:162a:b0:709:fa95:9929 with SMTP id 006d021491bc7-714f2552f3fmr1853395eaf.62.1793377285762;
        Fri, 30 Oct 2026 09:21:25 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:25 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2 6/6] mtd: rawnand: sh_flctl: use dmaengine_terminate_sync() on DMA timeout
Date: Fri, 30 Oct 2026 16:20:41 +0000
Message-Id: <20261030162041.2998170-7-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
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

When DMA completion times out in flctl_dma_fifo0_transfer(), the driver
calls dmaengine_terminate_all() before unmapping the buffer. Since this
does not guarantee that the transfer has stopped, the DMA engine may
continue accessing memory after its mapping has been released.

Replace dmaengine_terminate_all() with dmaengine_terminate_sync() to
ensure that DMA has stopped before unmapping the buffer, which is safe
because the function already sleeps while waiting for completion.

Fixes: 83738d87e3a0 ("mtd: sh_flctl: Add DMA capabilty")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.

 drivers/mtd/nand/raw/sh_flctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 97f733e48..8bf9ae7ce 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -430,7 +430,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 				msecs_to_jiffies(3000));
 
 	if (time_left == 0) {
-		dmaengine_terminate_all(chan);
+		dmaengine_terminate_sync(chan);
 		dev_err(&flctl->pdev->dev, "wait_for_completion_timeout\n");
 		ret = -ETIMEDOUT;
 	}
-- 
2.34.1


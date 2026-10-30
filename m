Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377277;
	b=nUbUlnaY72Fzq+5jsUb6jpazQQLrLTHXDxw9+nQo/4Q2AT8tViVFoYEcnnP8Luc5XGx2
	 0ZfoJQ7SONNdOIOCjzFuUslE1y4JU7GQfkTFQHjnlbEjsUgeIp2uQNq57Wj0kSzet144c
	 qXN1L8tLKL6XfAXHRYCm/gaWhfdtqVC5qJe3HbDP2Rxjb4eSysajHHiCgas/9yNIvaLUc
	 WRrJ5eE8x20vwWgu8kzQz2YMDKQgUQaXW87bttwMv47eRZrp3zlY5lPqAQzKsEYTM3+75
	 xyuPS28TaKMttVMU5B3JaRVE2WcKj9IwOhkOXOaHg2hoMR6hDb+DgveE5SxMBqHjb3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NiCv4TzAu5z9UeTUiidIChOBFFfvn1mb27PyQpvB9kE=;
	b=PszMZvURVNlR4O5I6MdtW7q65WsG2K1jnhQP1gCW81NOOxha3eOImPJmMPisuLYOBMVH
	 x93IJLDNbL8e4E1e9pcSHaUT91cMGuS4nTtGCZ+KLQFnNfPXD2TvhmCp4+/yIm/oTpprI
	 zDW+EtaKU6/SwCyvNBnpZP3YepcEVHuy23dktvX2lJAhRMe9jqDvxz3/1CQteerQ4/VsS
	 f/b7DTx5b0KRsfuuHCmUbX8ogIm/72bRQ/nlTff5aa1qQjet527h6vY6nq1W8SNFhhoN3
	 6nLtZzu479EMLP/cPZmqUgcWUXlkkz4ZQ/X51JbQWMQKI8RmVndbmJsC56mGV+Lis2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2AFWnrQ;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79861606A331
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79861606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2AFWnrQ
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4a75171af39so225756fac.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377275; x=1793982075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiCv4TzAu5z9UeTUiidIChOBFFfvn1mb27PyQpvB9kE=;
        b=o2AFWnrQOwPhuS49gaxhb1HgLi4Eu7sqSP3MFnax3w6vq/4ch92RT3cUpbl899YW4l
         Oe1p7MCHutef6NUdpbJcWfBWfIF3ythh7UDTq91BMd98rvXFr7lFcZK04V9TxKcT9FzN
         n5gU9QShTcXbP8SPbFgA/9kfoFbSOvwll0KfLOt3QsgLVfLAuRFJ1CKjMNAsjI/4NJQu
         5TnUOp/wzKiDiP5KLNzVP1Fx/Zu8ENGgv9tvb4uOy9JKpUTyWIR/o0WK9da/nFewanZb
         rc4ayD2XcL7E1N4Qc9qSJmgf2SVn6swyhY+o4tV3ynhICQfdWAhnnkLmn8Jpihn92xNd
         7ylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377275; x=1793982075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NiCv4TzAu5z9UeTUiidIChOBFFfvn1mb27PyQpvB9kE=;
        b=yfyiQ1zy0NQxn7gl/y9JKfqfScCgOOKuVv92IMZ2X47YDtORfYqwDaa1goUomy4Wql
         Em207c/G02nJKEakCESUv9rsTMJPRTo5TtRezQU6fLmjMrRg8eGfgYy/MdhzQYUk5QdG
         1A2tisQJaIsClNJ6KoEZ7hGkMb77+Zs2LmK5rXE0SXaFa/PaGIuOsWq0Z08I23HZYKmw
         0pBKomQ8lhLB8HPIsAWzkZ4oWVXDR4WPkChHkwx53zYf+relSayWYYmFBjQVCDigbtZ/
         bY57nvAhKkC2x8lIYCxTr9QSw2ITnwikUi2GBYpHkmUEBiXye2KeVi6SLu3yzctT+p5o
         nLJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRm1egl+tOGm6TzTiOKQAWbLxyxZDhW47Xa665ihnF2kugo4FQ5ylCZYLZ/xw6cg1/b0udcU5netm2rG/W@vger.kernel.org
X-Gm-Message-State: AFq9FYIEc2IYJ+UspR9w8AGqNuOF9nQyfhSAS/tFUFXrZSGrWlcYtd2t
	G0Co4cm80rLY5w07c2s+8tC1cjaHoU3Ot1hynryx3HvnYXUmlqM/GNWF
X-Gm-Gg: AYBFou2ezt6FZmyJ6cVPi4hK2l63TTMoo7hO8qAuqrTHO90v87CqEAz8wqpiYZ8z0y6
	5q8orK+hK/rZfGKvkaJGsdDHWMsFVoa+vmJTX1kvx6nXudRrYT9t0PIrrmu9qrwkBiDAhW6p6VZ
	QWSGk7NdqXUxJIo0CoCSH7byeXNu3zJUmYgDACRIhRB6xyIxmBKsZBtC5u2NzSBvLVtr9tgGSnO
	clx5/WVTxVDhBr+vBGb0MVfhmRkzK9GEtj0Ed6g5jCnKDhggsIGXrwuKFVR+Hgo4SYcxE4s48iC
	aCmRq8vjSTFScuUnp+hBr4C3NdeT5ejr9Qqdt0x7kjXxMocpjCrjIpzgPdgqJPNw6T+l+bqrAjk
	FAK8H4i8XMat+QpAxLxbLTwEAaecEJliuzvrUziajuJNf76I93mqg8fcuCACWqQP/1wXzRM/cfB
	lXx9opb4sCHqZ4nYtzuKKKaxwE+s+xD5iaB6FUDTGCcmbcEsWZy+USl61+/iprLgSr76DQ9+d1G
	LfK9Jrcsw0F4lq/dyt8JeXJtaH+bHdXG0mJJfxlUQ0kwsJ+iPY4Zg9jjg3zw2v7rKjvXXMNsR1A
	6cuCjp0hhsucv/1M7yF/EEg5QTv1dWur6WuFQVJBhJTCRTapIB6PP5Z1pMF37xtU8XvofSRJsdh
	fKtCTWHF0wiKwG81PYWPDJEDyF5/eoRP5BF51y/OSJFvEXDOAb7UdCr+T23tkqRJm5GtvGOElbn
	i0p8uTCCTbY6tmyOg=
X-Received: by 2002:a05:6871:3149:b0:4a7:4323:3fe1 with SMTP id 586e51a60fabf-4a9075f9d96mr1952103fac.20.1793377275138;
        Fri, 30 Oct 2026 09:21:15 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:14 -0700 (PDT)
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
Subject: [PATCH v2 4/6] mtd: rawnand: omap2: terminate DMA when prefetch cannot be enabled
Date: Fri, 30 Oct 2026 16:20:39 +0000
Message-Id: <20261030162041.2998170-5-samarth.colleges@gmail.com>
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

When omap_prefetch_enable() fails because the prefetch engine is busy,
omap_nand_dma_transfer() unmaps the buffer and falls back to a CPU copy
without terminating the previously issued DMA descriptor. The descriptor
may therefore continue accessing the unmapped buffer, while its callback
could also signal info->comp for a subsequent transfer.

Terminate the DMA channel with dmaengine_terminate_sync() before
unmapping the buffer, ensuring that the outstanding transfer has stopped
before the fallback path proceeds.

Fixes: 03d3a1df6da6 ("mtd: nand: omap2: Start dma request before enabling prefetch")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.

 drivers/mtd/nand/raw/omap2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 552f36da7..b6bd4386c 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -417,9 +417,11 @@ static inline int omap_nand_dma_transfer(struct nand_chip *chip,
 	/*  configure and start prefetch transfer */
 	ret = omap_prefetch_enable(info->gpmc_cs,
 		PREFETCH_FIFOTHRESHOLD_MAX, 0x1, len, is_write, info);
-	if (ret)
+	if (ret) {
 		/* PFPW engine is busy, use cpu copy method */
+		dmaengine_terminate_sync(info->dma);
 		goto out_copy_unmap;
+	}
 
 	wait_for_completion(&info->comp);
 	tim = 0;
-- 
2.34.1


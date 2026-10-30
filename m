Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377281;
	b=TG0H3Q8R99/WteqH5HMtES6zB13HojYRHWlYOLGOn760dMMTw3OzrnJhBsBIZJkx5LJE
	 NBa0HmlEGc9sEbFJyDuEP9z3In14H0gsxzSRPxS1A4kaFUFZ+PIhVA7KQaGpgccH5BtIV
	 rzqE+jbjevVebKHeuo4VZ7of2sXEUh3swmUc0E2ASqiOXBNhBUTupt8RkY8KJw1pBFrqm
	 IeIvvhP1oQdG8blwV1qBqUERmalydrnAR/mSxjP0fvwDx8UDg189L+asc3Kq4tGIyrrcb
	 hYrGa71MU5mASYCFZGcQiG2FFHhfIGHRm11pkZMInnOYjzP2T4IuJeseOiBo+CbkPvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P3sMZdQ8vNG+NMmxWGi58o4c8YdyyCQhTB94DmlU1wU=;
	b=NFar+ZOusjgIkq/NY50DQpk7MR15NzNKB+hke0GeXiKqcxSDL8fQLAhtGZ2hA31AbXbG
	 ZUYXZh1cX2oMtfeJarxeY+ahIITALsWnvHwUoEUpPvDnLHGJiflYSdDrIBHUKatUpVOlX
	 aHHURG4QUG97F1TMeBs0kVgIYbZEF2CxVEx0HnC+4uo6JBV6uzxkQ3pTHUTypb6WR+Ak9
	 Y7BzBanVruM35M3yAIjFzrztPpG44seKYnwKx4k3msor/oMS7N47llt1t3y1dczywps3Q
	 RNkAqE6rARKQtyWoUPQ8abhY2XQg9fN9WSlO3s1R2wLJ9qgMh3clTOsZ7/EmwLGiSWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJnQIGuQ;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D21260A2601
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D21260A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJnQIGuQ
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4a755bbe158so623423fac.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377280; x=1793982080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3sMZdQ8vNG+NMmxWGi58o4c8YdyyCQhTB94DmlU1wU=;
        b=MJnQIGuQlLPZonf3ey0zhT869dexzoA4QU8naKaMl6T5gjA/WRI4KoPDBmVJE8qay6
         rLukk756sikUoEXt6Td73pH7mFMlPcFbZ08eb2fw4/JMkkv5tbXnQET97K+UlMRfy70f
         NJe33P7WRI+2jxJ2bRFVF8rv5CN6+1dMjdOBSIxIV3cAWocLSu66s4oRADFP7iXW9CUm
         0yfiVz2M1qvP6FNqHZZWzpN9X6Q78oLyJo4xYE6hJalw8uB4tJdbIWVl3Z4as/0EYcWm
         2E0iHweU9P6XNDkDyal2mfTHeEQ7+ERAZLil5nv6i4HqhONM8qlgjF8v73jsNsj+2CxQ
         37ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377280; x=1793982080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P3sMZdQ8vNG+NMmxWGi58o4c8YdyyCQhTB94DmlU1wU=;
        b=RLF/VrcHRYnj0u7XvCA3dPJPbn/qk+g1C9BspChOl2Wzy8CZ2NISGlUgdZy8XYi9tr
         I9IvK/JSoE3UWIDcVp4XBRwpqLM2pLR67ujaB/MLHXYtJy+RArPuXMKl0bvrQWaagIAH
         4h+9UTBiu/xxRKDAgqPB3LTBgXPAbVnBwlIBI/EbVi52ddsepVb+zp3rDMRI7arw9I8X
         318rYKOhvswa6tXKn8/xWQcRc6+2j5UuSRBLr/FZQGkBJ7PMLCbTc5J64MP0EjsKiILc
         XHdeJQlJE3ZXHZ8VDSdiYbzabWDaudmPYlVS5nrm06fDhMmGjVJ8A0EwxmU9t9cvhu1w
         RblA==
X-Forwarded-Encrypted: i=1; AKwUvBw+BjUCeTC90rnP0/MGOgiUv2MHyzsFQE8tzQ6GoRHK1lfFEK9j4suBaJPrW/sJ6zcy2Ih1wUYfFbVmDPU6@vger.kernel.org
X-Gm-Message-State: AFq9FYL5jjuV7uHALN4IkKR/L6Tyz33IpUCuw1AklpfM1AsRKVoTI+5/
	lukKQIUvcwcwGAQE8jCHPsG++CAJchdTx1bxYYC40DnMFUXzT+4y35L4
X-Gm-Gg: AYBFou1S5YB/0Ar02oMXu+fU7fDp+2MHn5K/nSw7B2PfM26GUBq+oZrQ3P+TJknJ+/V
	TfDbLbYFG/BKbEbmKkoNZOhqbZ2devHiSTy5fw92/HmeCmDQ71Lk4tEYTieMXLAsvOG7mObnXYk
	sx49eItYUZLxvlhjrXGnHZuc6knQFj4z5OZWFIrUsYqyp41FiEyc3VsKvq60yEkAoCVmFmPBZdv
	xfxzVWX3Q69qwSs5QEatxMAorvf0k7FOZ2QHTNf12QcF0geQdPfkIYhRJJKaO4om+mPUZPSIq4W
	1ZqRPnXZvPqmbAl7eH/zYGBKPPW/hlR9+tnvwXbn5JELf8XYGNXyY/HlFPsIR8VjKosm8MkNfJT
	yNJfGaKd3H972wPQLb8T2+A5/jnE4skuCAufDKsM62WAdw67I5iq3cdL9HoMrTsrEGo1Yy/RZnQ
	mVoPpgsYoIZ6E8wpOydGhHJj/RSF60040Tx/uivxJ5I5+HgH94fsMmxinbYj4eK50tzZdGL3UBd
	0nPMualfQUlXORu/2EQ4R1zZ95M9EeO2e7Oc+6tQEco0IQYeD1dNwJDmqd/f/zM0zGP0zCTOzVu
	Mr54FB/5QF/dD3K2xkAPFAReyaJyqTTVoCWAT+9u9Dyvfcvb0AZv+4FbBgPPTx7i6We6cMTi5xv
	ua1Yb1SpBqj7SWhSK3X80BDO3L+dxKOhnZzw9Sm/p0BPqsOYw2XYCfPRIGwakrSrAvFyuccHRK0
	W/qr064ZApy9GVUNtbWobf1W08NLxtBtmFFlI4
X-Received: by 2002:a05:6870:c191:b0:4a6:d831:cbb1 with SMTP id 586e51a60fabf-4a90767d2f9mr1286539fac.10.1793377280468;
        Fri, 30 Oct 2026 09:21:20 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:19 -0700 (PDT)
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
Subject: [PATCH v2 5/6] mtd: rawnand: marvell: stop DMA before unmapping on timeout
Date: Fri, 30 Oct 2026 16:20:40 +0000
Message-Id: <20261030162041.2998170-6-samarth.colleges@gmail.com>
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

When marvell_nfc_wait_cmdd() times out in marvell_nfc_xfer_data_dma(),
the driver unmaps the DMA buffer before calling
dmaengine_terminate_all(), which does not guarantee that the transfer
has stopped. As a result, the DMA engine may continue accessing the
buffer after its mapping has been released.

Use dmaengine_terminate_sync() before unmapping the buffer on the
timeout path, while preserving the existing status logging before
termination so that it reflects the timed-out transfer.

Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.

 drivers/mtd/nand/raw/marvell_nand.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 38b7eb5b9..a342a48e2 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -900,14 +900,15 @@ static int marvell_nfc_xfer_data_dma(struct marvell_nfc *nfc,
 
 	dma_async_issue_pending(nfc->dma_chan);
 	ret = marvell_nfc_wait_cmdd(nfc->selected_chip);
-	dma_unmap_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
-	marvell_nfc_disable_dma(nfc);
 	if (ret) {
 		dev_err(nfc->dev, "Timeout waiting for DMA (status: %d)\n",
 			dmaengine_tx_status(nfc->dma_chan, cookie, NULL));
-		dmaengine_terminate_all(nfc->dma_chan);
-		return -ETIMEDOUT;
+		dmaengine_terminate_sync(nfc->dma_chan);
 	}
+	dma_unmap_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
+	marvell_nfc_disable_dma(nfc);
+	if (ret)
+		return -ETIMEDOUT;
 
 	return 0;
 }
-- 
2.34.1


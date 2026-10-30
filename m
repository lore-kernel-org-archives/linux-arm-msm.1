Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377256;
	b=RNkn1Qq5jYwmy+rA5lOgGULEDQeFQx+qtBhjSC6OKKbn99rACN9cLERrbYmItTZStDRR
	 Uum9HgtK8L8VPL8jbfG0fusnlMqTAXodWmnJYMUyxJU7Nv/cEKleOe1Hw1Tw2a8e9GKyX
	 K5G1qWkbaDIj9OH7LMUDvji9iO0JRSaCXEstL4e0z7H4n0dm4IqgRKcCJoQxAxGTwsLY9
	 KRPgV+AxzTLUpP8nGQTQuIw6ld2wSZzSJCfHzX0KhMOqtuCU4DOGeAUzOSuUNomwrBD53
	 Bd85jNK66UgOiy+SAtattltFEu5uuU0lcGhjiaityUvb3Kd1DnZ1a1UZGCNcgi44r+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iaMtQnbofJSAxTx/DkcM6OMXQPU8wWZ6SE6xw52uqKs=;
	b=duo/7q8YYko0+vun0pb86VS4hHKUQ0MBKkvz6nVEwhm0vsvK5FP6Otser/dieCVtaM5S
	 Y2Dlh66nUDjKygq5aTm1jqka4Vqp/jhwRkZsY6mKj5FoAwuPhfYg9Ti+9/bQagrT4Md0B
	 Xud+MZqiEEPUxWChO/Top2vV/rLaLgOm8O+Gk4Hqvu63i0h0TMYDJptkKx7QrIny8bw/H
	 YMCieFJOsmM/LGumRSdlsKhfIxKcXhc9P5/JWByVXk0UlHfb249QkaHnFbOVpMZOKHGyh
	 Es5d7UK5J6tnJvko8x6dMqFMmOGdHS4KQArIJfzAcP9Z7dnTrXfqs6XttjTsbJ23aDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uht1v+iq;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB44F606A324
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB44F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uht1v+iq
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4877837890fso572987fac.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377255; x=1793982055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iaMtQnbofJSAxTx/DkcM6OMXQPU8wWZ6SE6xw52uqKs=;
        b=Uht1v+iqUJcWRZy06lwzLvcycSp6R6ozrVk/cVPLZXcERt85Pa3iVcTSb6bidQj9yb
         CsicUJaZ2QEEWuHIiAbylCAVphtR3IvLOu3kmmaVcvTb+t8qqSWsXLcssLNBZrT22ObE
         SAe9SyQaEGj2OUQ61YgWh2SO/u8UxB6st6HBNiD+SyLtU0WussPppr4UB1nHhDHFeE4I
         x9rGrZgRyqBndsxZXqGeOsSb7c1hMYauxWSuZsDHZDfh5Ji3QSue7CXi3UNc1ZTAFy8A
         97SEtdP65b9DU8HEKj2yqLKNu/Xpx7DURZBtnTZ4YTZSlSDsgG359BWbjP5C9sLfD0es
         LoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377255; x=1793982055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iaMtQnbofJSAxTx/DkcM6OMXQPU8wWZ6SE6xw52uqKs=;
        b=GWA6G+/82gUjIJ5ShhPOzewkJTW72oolGQA0wm4wC/no3Po+9ocHNdhDXPBiVFPS11
         A2BfeNOLTZJqdhhK4uKNAn/sCjaXHJQlHOS4DYzLVeszSkeDMZKIXJCSkge0VhvZhwod
         XRq5uHkYhyPDvzn/0sVlfJRE83EabfY+BwLQ6ALfoCkTnV7MjMT22akGpEir6KnIw9++
         6rmtPcuTwlfCd2MlKnBnJLV3a0i+mr1mVMmIWv2XqVHprZ4LNDSteb/TwNw5iDXGP2GU
         Y2r4UutYbjHjMij6C/Lcs04NxmPFFYrYa261au1OTpR2RkIFO705WMDgLS1PEINyB0QV
         CQGw==
X-Forwarded-Encrypted: i=1; AKwUvBwbC7S4zTMYhr53Owslo6vhv7a8lhwgINisVKkFPR4TStfKEOfgTlsYyDZxMou5HkyD3RQd0mfYqZ/0r3rn@vger.kernel.org
X-Gm-Message-State: AFq9FYKp0o7xMSeeWgiJkJLMVQGnSyC5HfbJ7G+yIgzir2pFfV2DxbWV
	S/Haa5qGyJDLYorrAy4SZCjJe5+Y6lUWjPwkb2e6GP8i9x81CpShDp7z
X-Gm-Gg: AYBFou38cemvxy8i9WHGTWzFfPdrHR6XufoCjeTrHlITqFI8T5tfwIVQf8+Xq2fgu1H
	xAA2GK13ifIUuD6AUFpGMxWoeFMCqEhVqcHX5xTdEu2Zy+p7lcVEa4MnKhDZ3KI9MulOhz2nMFI
	ji+FINwvBGthT7ou+wvlKchzHtgo5rrJt+yTS63WlqQ+X7EZni0+TccS+htsbMHxPjSpakl8vNN
	aLASBJua6x8yM4ArehT+Zhv06/m0h2yncgdmSKEU+xHC1mGis+KxcmRfD9+tZ1yql5wYLOUjGr1
	3pzaskB9kIGb+eSInjW0Mbq/TQIlLsHXlizLCrBAdY6oERepN87g9x71uf/32AYNglgKffJllbC
	GxoCABAeZasAZmc8Bfmar/UlMoXhPI5yicTcw9xCnbUeRniKX9NogMuRSIcNzVdK3mwgKJ/C2gU
	G1buIXdxhCOZd82yN3Rz+fvN3YPSALXXyw29CachjT55+5InWdAVQd/d/sNqYTXjDq4+okY+RYi
	3r5fgsmebh5qyAqt42sPKYlAl3L7KRfUFCOuqQZf8bNr0WXoYTW9L/nTzEnLyi6cXYknxbRUFn7
	aH4xMrLTA0hlGX/nQS0CMi+SbPewnnXYTy3OlTvgixw2EEkJRxQ8TX4A7m5//Km20rGS8Umuzab
	Uruss+YKYrNae/Nl/Vydd/STWOaGRhInYe40M7YfF6nsT0g8OMAjRy2J4iaWT8LLeUhn4Hb/DsG
	hM5ktsgWoiJ2cI0mI=
X-Received: by 2002:a05:6871:a1e7:b0:49e:334f:312d with SMTP id 586e51a60fabf-4a90764b81amr1805240fac.16.1793377254766;
        Fri, 30 Oct 2026 09:20:54 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:20:54 -0700 (PDT)
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
Subject: [PATCH v2 1/6] mtd: rawnand: gpmi: terminate the DMA chain on completion timeout
Date: Fri, 30 Oct 2026 16:20:36 +0000
Message-Id: <20261030162041.2998170-2-samarth.colleges@gmail.com>
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

When DMA completion times out in gpmi_nfc_exec_op(), the driver unmaps
the operation's buffers and returns -ETIMEDOUT without stopping the APBH
DMA channel. Since mxs-dma leaves the channel in DMA_IN_PROGRESS, the
pending descriptor chain may resume after the timeout, while a
subsequent operation can append new descriptors to the stale chain and
cause the old DATA_IN transfer to execute again against an unmapped
buffer.

This can result in DMA writes to memory that has already been released,
including buffers freed after ONFI parameter page detection in
nand_onfi_detect().

Terminate the channel with dmaengine_terminate_sync() before unmapping
so that outstanding transfers are stopped and subsequent operations
begin with a fresh descriptor chain.

Fixes: ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc..86163a552 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2659,6 +2659,7 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	if (!to) {
 		dev_err(this->dev, "DMA timeout, last DMA\n");
 		gpmi_dump_info(this);
+		dmaengine_terminate_sync(get_dma_chan(this));
 		ret = -ETIMEDOUT;
 		goto unmap;
 	}
-- 
2.34.1


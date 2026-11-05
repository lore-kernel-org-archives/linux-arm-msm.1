Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864578;
	b=kv/7BCHCh5VjVGAkMS5qIQfu1yZ3OY2pVbPrgOjf0GSEd+rNzGSAIwDecvnNpgI78Y8a
	 OM/fiCEuU6B4Y/ghyDSTlmRfMa1DKattPLuvfcHvZdkKkZtxPIrbCH8Gr4vZXfAvmNU5L
	 FVdgCyTw92necYWkBPONcgIs0qIoTNY/EUdiRX1tffR+wjdUpsJRDOM73bueMv8fjvqO8
	 a7LpSOq1uQGxJQERdgEAtECn+lUcIXztWHU5HM7Ugf+YBjOLYi0Er0RSea/Tk6kE/kHWs
	 luL+GTOIzdLJnJkqrN+yuS0b2wyl8FLyjm688zZUPXmKxaZgS1+Cy7VndCkb+WDtgCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e4YnTjIG+CDujm7r7VgOZzRW8vqo6YF7xuCzjl3AIV0=;
	b=uaLgRLj9CC8YVTXKCi4pz1rRuLCmVKDAQI/pwkvMt3VCn0ZWkH0fSmH4O9uaLu1jHT0Z
	 LD6r0F/Ofa2DAAE9Aj67HQSrRmmat3jYZ7ofUpJGrm5zC4rKfIQsYNV0xW6aLLfQ1jHv8
	 DL6wpeC5L7/wsYX8Cqwyh7SlP/7QGbZOxrPuCGOqdOapD6z6cloyh/RFQDEpW/FT5uLyC
	 tUekyccR8B7hWlJmIfBKzZd9cW3Q8Bq7e9VaKodoh3ZGYhDgMIioShhC+71UB1x0TNzMU
	 F+pVfVdNe0q4nY2mIIMkYk6twFReuulZTi19uxmgusnI3srh5sPAh+0eZAVb7nsJbhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lf5ovjXP;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BD2606A329
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 07:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65BD2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lf5ovjXP
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed0b03ce3eso5430235ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 23:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793864578; x=1794469378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4YnTjIG+CDujm7r7VgOZzRW8vqo6YF7xuCzjl3AIV0=;
        b=lf5ovjXPfiAwfRtwPVaQ/Y2DiVU/A608Fb2fb9QbOIArj2CV3NIcqyYnedI8inTMfE
         Z8oBVQk/nt/o8B6ieR01uqnGyhVYvwBNMZBAL2atEyhil5qiMrAXGPCVrhMelX8cABaK
         ywPFOqm6HeEuFOsOvtnblmyfbzzSmTfR0t/pPvIkMCe0YCaRgJ5+Aif5ZGg7pwCSXb2I
         pqKLj5GVv9oOsqUi7k51ITOlgA+ZsrnXf5d+5xaKOhFbDGi9oj3x1yvPWa87Qz5BYhws
         ifpUhREziSygdoeAeTpL1KBBkedn7Pz5gbgH2rCMYYasVX/puA72ianyJVKc59KwRQWA
         9oSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793864578; x=1794469378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4YnTjIG+CDujm7r7VgOZzRW8vqo6YF7xuCzjl3AIV0=;
        b=dXwE3ZCy89HHyrEqCYT192GjsWjaqxs85UiQpEX6wtIXeAwr6N/2M1oukD/x19UZ7i
         uH5j1m+KHQXAqqiUI6QkYesWJdfLNTBmykpLkU34KQmeMfEldesiFhY19DAqoQ5Hu9nE
         qPR7ANx536hXXMS26Jdl2ZE9/ik+M9gYIx/XT1RqU8k0hRJ67SWf2XF/0e3VCK2WFYfL
         bLZWsuxKeVF2z0oXvbFIKaFxzdCgTEK2Vn6o/dNr00tgmaYfPuJVK2R1fj+lzc7dM62Z
         g2BN489d+PBdk8dDSffQqE4uccfgQBAzr8qvRLepoYboA7M8TH9A2uEowvf5wWmQbR6t
         9H6A==
X-Forwarded-Encrypted: i=1; AKwUvBx/Ob+AhTbPYcGfdoljeB1yA/hzQIpOc04Y9i7zYmlbeAtWqX+pbjtjo/cyJ02LrvBpovp3vCi/b92dlAuL@vger.kernel.org
X-Gm-Message-State: APuU4Z9QzVhP6LLcVpQInrXFGKJpTofACVCC+8RVz32WvhElBwFKGuP/
	GRntLYkk2I1lxDSMNMuA+3l1fsmQosikQkYqdDJHums/Xz5uOycrXLg=
X-Gm-Gg: AYBFou22GtmY3RtB57Csm1Eq0QdvxH95M4C8YHD2805TjqaEcP4xGMSaMmKz95o+L/3
	yQusVPuEq8O3JTkAGUWUHhr2/sK7qzJePUpNOHGpyKTUVckrLdX4fuJ32nvE2GnphWCA5AKhV4v
	TbWDhsoDmU5KSmWryfq8VUcHYbrluWtKbLDTw0UnZS0Krq5zHNxREBLP5LOMFtuKlklhuenX73P
	konJ3VTVif6ELDak0c4KZVh8rnJ/Ftm/akLsLyKaU0kj359cRbUQL+FhaSFBtrsnfqrRCcm7jbf
	KO8LwKX2yCyp2QjPIWzX8QQtTtheUSkeNHGlRguzS/aMOB4DWJ2NTARgb5Lcwrrc2RPa5YdhOVL
	Gd9AGwqTReE45Xh4vmLpRnRDKjHcP4OTPZt5ldaxKAP3lNuJWP8VyIWYpUONFS4OFIPHqxx+muh
	5lvej5HXNUH9mBh4DK45q2OU036Wh/ONqCpECO6JJSfqbXWNWLDjDEOvv3jHp9l7c0bjz2fCzWT
	h4KaxG3P5RTe6MhR+dtRCgtFEIxuYbYt679yvopCHxOfNjnMVLP437UsA9xh4BhBs/hmCcPGyWB
	sEeFapYYUe4igaDW9cLZM6eg1yoZw3YhHyMsSXTxs/OKvKgG1ASqNcvDHA==
X-Received: by 2002:a17:903:3205:b0:2e9:5714:608b with SMTP id d9443c01a7336-2eb364b11ffmr182159575ad.34.1793864577662;
        Wed, 04 Nov 2026 23:42:57 -0800 (PST)
Received: from localhost.localdomain ([202.51.247.22])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091c83d5sm14942345ad.66.2026.11.04.23.42.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:42:57 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] i2c: qup: Release DMA channels if interconnect lookup fails
Date: Thu,  5 Nov 2026 15:42:44 +0800
Message-ID: <rc-review-20261105-vc-48-dbf6a486c74f@gmail.com>
X-Mailer: git-send-email 2.50.1
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

qup_i2c_probe() acquires both BAM DMA channels before getting its
interconnect path. If devm_of_icc_get() fails, the direct return
skips fail_dma and leaks both channels, including when probe is
deferred. A later probe can no longer acquire those channels.

Keep the reported error code and jump to fail_dma to release the
channels. This avoids the clock and MMIO cleanup, which have not
been initialized at this point.

Fixes: d4f35233a634 ("i2c: qup: Vote for interconnect bandwidth to DRAM")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
Baseline and patched target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance was used for analysis and patch preparation.

The error needs an interconnect provider failure/defer after DMA setup.
No in-tree QUP I2C DT with the needed interconnects property was identified.

 drivers/i2c/busses/i2c-qup.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index ce30634e1f40..671bc41a5abf 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1786,9 +1786,11 @@ static int qup_i2c_probe(struct platform_device *pdev)
 		qup->is_dma = true;
 
 		qup->icc_path = devm_of_icc_get(&pdev->dev, NULL);
-		if (IS_ERR(qup->icc_path))
-			return dev_err_probe(&pdev->dev, PTR_ERR(qup->icc_path),
-					     "failed to get interconnect path\n");
+		if (IS_ERR(qup->icc_path)) {
+			ret = dev_err_probe(&pdev->dev, PTR_ERR(qup->icc_path),
+					    "failed to get interconnect path\n");
+			goto fail_dma;
+		}
 	}
 
 nodma:

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043

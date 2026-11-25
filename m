Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614208;
	b=Sjj9tPUOcv8R6w4izNoW6m9PWHu6t7PGSt7KdH+GLKMKNf9TBOSSiAp1dT+pAI1vsEG5
	 3YD2JpqvHDremxD3xgPXNMAOUE5oo+vSVROxCaAFXL4AtzbKunNRxMpiFthHvKoe4o1MX
	 y3ZEtQxqze5KDvad9QLW9T6y4jEoXKiayaOxM+FMhZi9WxBt90i3tUkrpp8k2swWghVWO
	 aItqrMJlbznu5m9unI72CxktsJFAV64MLe1o62BeDcQ+bD8JZFA4pfKaaxBOHe0ki3IbO
	 czHOvC14lZCBHyDkBs0sled4fcbwEgo9+a6az/mYuGZW72AmzUVAKMPG56yyG+ikLiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lyPzL9qDgC5NPyyWRyU2xpYxCkn2FwWXZOnIDyXNGvw=;
	b=lGcnwaQvV5znydrULrXHTsOzsPF5BUM3zn9J61pU13XSYeB4jNiiwfhX3Cvs/oLB5v4N
	 i+D/Xtk/vUOpbNy5H8KJmZ72GYN2e88P6ptf/x4N0a4AztKd8543mOfaPpdI0lsKyi1hf
	 qBa9xM3i77BIcv+e8zd7KevorSeUkgwxSB03foRu4/DSoVUisG6S5qzbcaGREJGdpvF3N
	 EDRWkjo6LjAluqfnjnFxDWe7niA4tsgAzI+8EBikdAZ2E8mTWcGmFtuR+W8uW2al8gngj
	 McJHkoLCqkqz8RFPPp8TMndgvg2sGFCRF+m7k/hH23/tkPp8uN8H2u4+W2nJEZe007Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S/ivv2sZ";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357BD606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 357BD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S/ivv2sZ
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386c71feeeaso2059649eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795614207; x=1796219007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lyPzL9qDgC5NPyyWRyU2xpYxCkn2FwWXZOnIDyXNGvw=;
        b=S/ivv2sZrFfQAn2czE8r/0ql5zt1R0HFKjY7C1HFMkpX2fSxKA32NOSiKQyRCaqQGD
         GpgUqDytS/+Me5QztSNhy3TsSPhSLheEAKynuT7iFIeJs1qDRmpplUgp/PPySvn0G3h2
         4hjfRd1L8xFQ0KwdvO3RTcXWWV3EhJdEK6+KxmYDZ8ZbjNVsQaz7Cxjeu5SvqEmxVZkt
         ly7gBxHHpfW0GqGvYOdnSkOr2SFzm1pkiYBkof3w15AVQpxJA7gYtLufLzblG34X2hDY
         lHpoBQ2L79mCPq/GZ03INg0FndsQ1Xl8EcoZhNh93VSOQ9JJzmwq2e+GAMYYlCHUnK09
         8ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614207; x=1796219007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lyPzL9qDgC5NPyyWRyU2xpYxCkn2FwWXZOnIDyXNGvw=;
        b=Xa+cO6PlIs1uoyb0Xn1KVS2ZNDac99l5zcBydK+wdyS8b/ePLLUlDQo7GzdzWi4T5j
         L40e1nJyWwepONqCe3af2AhkwpVR4ft6yqpNWKYO/VwbwK6mQtKMqWhkqyApr9YyqKFD
         7i94qpFkoPsVIOS7mgSNZVH1CGTuM6iihziM8MhN9U7sNkL36wd2ctp9bDU+TUUh5APm
         yjsVgfMGD18IZk/qEqwlRHn7AAO8oYg2mg2oh+0Y8rlcm92iSR4eBgqnOkv6Xv43R3xO
         vVJyoteJEBcAU5te35e5f1yf+fRG9dJsy7ewJQk1XUBwckkJWCkqVsy+Lr8kOV4AeHBL
         QcNg==
X-Forwarded-Encrypted: i=1; AL+hErHeRtMlv+nl4zENcsepEGkc9WG25+1zMimxCVgPKmPsRcGl/jHp2iAVacYVBskA+Wv3XL2eVHta/APOd0aN@vger.kernel.org
X-Gm-Message-State: APuU4Z//rDXouN+tAEZWwrpTtB+I1fJHH1vfLsVCPscu0In8jaH3team
	GWWY4KPC+X10E5GM15TIIf73f0Sa2Ekke51mM0107ysklSg5DBjAOGODNQCeOA==
X-Gm-Gg: AZFdTZdgfabYyXuvE7R4FLIJWW6Smu9gGfCu3du0BHCaUrpxeEkHPQKCkj1ZPtDPXfV
	J+cTkHHUGx9zPv+hBfKSIdqhyvdkxhxXEvWrL4/cw0HbHhYCA37ApbrrsuwjIi2zQMsfBrHTZBJ
	coUzIvevAurLBFzG6ZHL7w7W6gmrPoIg3Rx4SA75d899sV5n2ABHrG2VjunWOVXHj+9Sg4nqHfq
	rN2nlP3sHkMUHt2LUFo2DPNfnMWGCLZvKrrFCBfpNhtp2QE0Mn9SsyAVua3v+smluTZUJj7/Ybu
	CxqzvB7osK2JPxXJG1TaPhkXDMFTGH9qd2kLEoLLkTXboz2O+hIbDUZBKBsHwqdy2dWpELHngxU
	956XRhWQtAFbIHtXlEqfS07lECDOP4cTA94he6IZyTHd6h7iCt+s5ROH5Ut4t7+EyUgDAdiilFz
	0N3nF7Pf3EkXlw2nxiKGSJc+JGVh4uboeF4+5qPITrKF6ONzxJgKRqHHCsDTaI4ftyvTs1OVPKB
	/DAF7BKGjjdR+1LowpSnqCrJBNek9E5P2qScAXyrexGZ+isBrLzH7uoLzxPh3Squ7/vnarIz1iB
	sNCHCaTI7cU5s8mcNybrH6oa+M77+LYgk+XK/R9VDOUGp4A=
X-Received: by 2002:a05:7300:1c95:b0:385:8851:fa4a with SMTP id 5a478bee46e88-385885211c2mr18419448eec.6.1795614207200;
        Wed, 25 Nov 2026 05:43:27 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm56773511eec.28.2026.11.25.05.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:43:26 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: qup: release the DMA channels if getting the interconnect path fails
Date: Wed, 25 Nov 2026 20:43:20 +0700
Message-Id: <20261125134320.2701213-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

On QUP v2 controllers, qup_i2c_probe() requests the tx and rx DMA
channels with qup_i2c_req_dma(), then gets the interconnect path. If
devm_of_icc_get() fails, for example with -EPROBE_DEFER, probe returns
directly. The channels are not devm managed, so they are never
released and stay held after probe has failed.

Every other failure after the channels are requested goes to fail_dma,
which releases them. Do the same here.

Fixes: d4f35233a634 ("i2c: qup: Vote for interconnect bandwidth to DRAM")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/i2c/busses/i2c-qup.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 731bce9f9a92..53e74de5244b 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1784,9 +1784,11 @@ static int qup_i2c_probe(struct platform_device *pdev)
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
-- 
2.25.1


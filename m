Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794089716;
	b=cFBQdA0JYFAgBhlpENKAaIe/M9YLoiH9i1N8AnDt+i39gTugOJdFkrIEWnYkKO3wm7v9
	 7LP2FX4Di9cPsdel9aXU+O86aC1O7bezPNkxmpDovxJz3e7yd2HErHCKdW/8JKhvIr1Ip
	 ivOUJN46zE+8U8k2Ou4TioxjiRQv5yn0HCvGIxwVxSKzhCR0RnBeGX/jVNSimIq+RgUO8
	 fwYu7SsYWW0Hs8ap/Hw8fxmFZ5JxbaH61WzCq6bfgkBN/KU7vq+KEz7pFarRidltnAi9p
	 xm6X+I5tag9eDJtKGzgf5IMeXdYVfoJMxim5iJ9lx50oJIE7WYiuUYAEsNkuugahbrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rtChpQ65eeoLVdZ/dFUA18szw3uQepSIX2YdKa6qr4g=;
	b=XCmpQ+LC+LnfAusvE1fHsTsNQpBMVfFoTjtEl0xmOOf+kF30SAtJifNhdp0cI73gog/0
	 x8KZUwMp5k1tru3HDu2UDXyxFTiWWBeiEjew+7HiCSDcU04V9PBySmEARj72ArzRuSy6F
	 dUf9QsiEju2hH96F5QN/igs9WOSG2K2FoWnj5oVwuS5wdWngx2ukdbuByuaisf7trkxO6
	 pZOdEsJUa4ru27x3alJr825hpOqFbIBPzmv8mEidJsQEEv9A+uM25I6EyTsE5LhcJ8VfE
	 RyRfoEOd10BOfatjzAD+OpkQGSNYzFYv49SmG3ZLDw/5vyzu46u4nXFkAMJx+5DS0Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTpmOR66;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6A5606D817
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 22:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE6A5606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTpmOR66
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso154355eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 14:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794089710; x=1794694510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rtChpQ65eeoLVdZ/dFUA18szw3uQepSIX2YdKa6qr4g=;
        b=kTpmOR66dBAIZkOKjeV1xswlTFvCGfcB1D5HxfKVUivRzVFMkk/UcARm7blrsZiYwZ
         isqPtifc+JRwjb+eRX0uyk+d8xiaSsOfHL/MH1ezmplm0akBw+v6bDmQdO2DpfCGDH0m
         2IDYRwjzTSqsgXTWTs5Ix5qBq4g83lDPefss02DtmhWSPRzZxxTP2oztUTWWW9D83m4d
         5YXjrxqut0QXpRhkvz3YRAX9vmlqnkpKGdexKwYEvUJdkn67VaQWvHpjApQ884/2VK/J
         ioGgxSWAMjcVBpKkgWCCT8y5dyAjyNQeIdpoz0bmLnfMorwgk1wEwb1Up013iZzd+8PY
         2ZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794089710; x=1794694510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rtChpQ65eeoLVdZ/dFUA18szw3uQepSIX2YdKa6qr4g=;
        b=rlmykamX2gwDxRokP1t1iUNTkRqNsYoYPJRlmdfQtYcd7evJYaj/FxDQH37AEjk8ce
         n8gnLwFA86lYg4uiAWXb0zUTfzJTJs/7br+q/vFG/QVmWQmiiASvFagjJGwqE52vn73w
         I8nOU3eIaQyb0n1E3VAOh1EB11bsNPZsr5p5+HZpJyIwGOunFfNab6fg49riRMNQ4Qr1
         tXat199593RtY0lCuuVVr3yxpSrehwbGer1verApap07tuO7rZSY11DaPkiZZ0sdwENt
         scSy3fCRXnp/O9mK/niu2aQ2hh26RtWgHyR2jAQsF8WQTPxAxxVs5gKOLMjOtilET81C
         XYcg==
X-Forwarded-Encrypted: i=1; AKwUvBwX+LZgRbBKYMda+DfEXmFyjJ2u30mnRdlmCtMySxssfWQP0LbGUP9lSPRffGr0LpF4CoDlURplkwI0/48N@vger.kernel.org
X-Gm-Message-State: APuU4Z9vvQx86GWu/WyHPyRd4PME95bptujFgs7i88yUA82Kol6uXwAe
	KnJ06ZoUg+NXjfdE9srf12vO7Lk/PcNu7qVboAKo6RaLIDt07jMOeBcE
X-Gm-Gg: AYBFou0IyHsc67rM1BebskdF6SUpyIwkt+HYXo1+UNxzSBZZfuNxRE2CI3+nWOZ0uM6
	jn/XiTBVis7IUGhQVGZamQv6DHnxMrmc6qEUGLM8g2C0pdLiV3fqjR2vJKpmssWI8RWXamtWnri
	W1n0hD1lexurl5ER0YEHn6zGasqK9tcDFQIXEhBxpiQCn0bfEpLzJ7fvQ9rj//nTopEIRM497z7
	a6P8k1byqiuV9bKHcVVzIVR3wkGgBjwNQ34yWAdteZw9BswjccBp088TdYRMa/o0zgAFC/bsb0z
	qdBrewfXUKgjvolKC23myw5hauvsOISkWWnyaocl3Hbqayax6z4cj3GKSGZZx47GL9zENBq4GzQ
	Xc25a0x7Zv1rhfRXdGoxCap6/aYeORppvUNiud2tJgHLl7QRQelrZ8/ZmRZ5dMMnVhYNv0O1Sep
	sCfAjH7kZc924S009IvGqus+HwlR+V7xRcSOJU+YezppkLCbIOrlrduWUck/73l2ATWl4ldUe7c
	k+kjkuHfJwdpQ0ppTZCXRDC7lMu9X9N55ZrTpDiLXOrzqjClIItsb7K40UeLtAT2GgjSyeLayMQ
	MDoEPFDlOvlLkPDDenLeS3dHJ/RAwEmdA6HyEik1VjImO4A+PZWg/KYb+X4BbYhjzGp7pQqjrnw
	AywsdX1TCOasS+RuHKO86/DFOujcfHFx6E+Ouyw==
X-Received: by 2002:a05:701b:4348:b0:163:bee9:b250 with SMTP id a92af1059eb24-1b25d321963mr8857586c88.22.1794089709615;
        Sat, 07 Nov 2026 14:15:09 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm1465914c88.4.2026.11.07.14.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 14:15:09 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: okaya@kernel.org,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	andy.shevchenko@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] dmaengine: qcom: hidma: avoid world-writable channel sysfs files
Date: Sat,  7 Nov 2026 22:15:00 +0000
Message-ID: <20261107221500.96825-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

hidma_mgmt_init_sys() creates the per-channel priority and weight
attributes with S_IRUGO | S_IWUGO, so any local user can write them.
A write stores the new value and calls hidma_mgmt_setup(), which
programs it into the channel's QoS register.

Attributes declared with __ATTR() are checked at build time by
VERIFY_OCTAL_PERMISSIONS(), which rejects world-writable modes. These
two are created at runtime with a mode passed to
create_sysfs_entry_channel(), so the check does not reach them.

Make them writable by the owner only, the 0644 that __ATTR_RW() uses.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/dma/qcom/hidma_mgmt_sys.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
index 9672ef9ee8fc..53b991752e80 100644
--- a/drivers/dma/qcom/hidma_mgmt_sys.c
+++ b/drivers/dma/qcom/hidma_mgmt_sys.c
@@ -265,13 +265,13 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 	/* populate parameters that are per channel */
 	for (i = 0; i < mdev->dma_channels; i++) {
 		rc = create_sysfs_entry_channel(mdev, "priority",
-						(S_IRUGO | S_IWUGO), i,
+						0644, i,
 						mdev->chroots[i]);
 		if (rc)
 			return rc;
 
 		rc = create_sysfs_entry_channel(mdev, "weight",
-						(S_IRUGO | S_IWUGO), i,
+						0644, i,
 						mdev->chroots[i]);
 		if (rc)
 			return rc;
-- 
2.43.0

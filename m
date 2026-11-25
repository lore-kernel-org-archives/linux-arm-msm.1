Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600957;
	b=3MOGEGzCOYJBThWajxsF83KTNGCBD+/ECHpL9Fy6dBOlsxgpA5ql/IFk7Q+8ZYK8pJO4
	 Ut0G0rk8i40LsptjB9bbKXnhtggnceSaBVaNvr6gCG3/I2ga3b1E1B5aHxslBBSQjk0f9
	 uB6Yxhic+CyGktI8vRVMpVMcTAkaw5M63xSsDXefUjsOYJc2RRzEo1N3Sfxr0nXsf5eS7
	 laaaVLU5oHc8qf01sqv3uanC5BR+E+OK2EzCU7ci5WFCiRLqse4W/Sh8Cv9IItu+rij0S
	 WOTOKvp4yutpVuPrt5u6uYlllpS+ENjSaoMKacZiE/HJ+GkhwH/KDA3SV3ZXb6HtKZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600957;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Nq2/xsD1/bPhVwjAcgFQSmIZfUvleItc+w9jXUbfRwQ=;
	b=jEY/ntT7gDXA5u4GHI6luyQN7f55c2RlA6A/16ZcHm787TguGJVYHMq/C2UrgSGqBphA
	 zETzNhxfMPm7BvfAbwWMdo6hT6JMh9NWwdz5/C5SIRhH04SYGuGll9/mehVhNH2Ptjxyg
	 zWt1iVBZKJgWZK+HuR0MdjfCYxgOmh1oZGw0BXSCJZ85CxKpz76dfKnDOHqrwG4zsU4Vz
	 yR8J+eZxzodj1FM18eo4wHtm0+kImZocpMmrVGlVF2/KER+zdIBpqrd2LozLR7W2zpgQI
	 40O2mdzVwsWpYTgmtPvb7ZUhtOgPfd3lDDiaESqkhwvSzCQiHF/qEDm2lPh89QJsdIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QUhEUUq0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68162606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QUhEUUq0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93391F00A19;
	Wed, 25 Nov 2026 10:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795600956;
	bh=Nq2/xsD1/bPhVwjAcgFQSmIZfUvleItc+w9jXUbfRwQ=;
	h=From:Date:Subject:To:Cc;
	b=QUhEUUq06x9L7t1k5xvAkiPxZCp8MFTRpltuAOaVTCR0MiWPA7klbECnog5tMUCTj
	 E/kpbQQM3GHGEQzp+it5rAtJc26U+HFZfuPk79cvQLCieIuIsaWe/3V8vIryPK+qmb
	 Sh0mpK/Em8/Cxdk4GxJOb8INuqZNwRsmNFa4zamdIRLFB/ONeiu5UGJL6uGvuGVVv1
	 bfrBb0NTEc+/Y8n7m3CfTGL0OWdYAlBwZkT0tN7CrzT37r1Oo6pS0rxGbKp3rKurl2
	 /Fpkq8F8knh15Gk6SL4NgiHO77IBj2CEnqB/MGOpklGG/LPCh+yefs0clNZKq470EO
	 aFrsj2AqBQ0SA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 25 Nov 2026 11:02:31 +0100
Subject: [PATCH] soc: qcom: ubwc: Don't use swizzle-enable values as flags
 for UBWC7
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-topic-ubwc_hawi-v1-1-235e2e6e62fb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWWuiI66vIiJag7FAWrdE+u6K5
 Gy+xflvsGSYLJTBDYYOtrzMHjIMQI/tPJDgzhswwlRKTMS2rKzFrk7djO3JIi6QJOV+GYJ/rYZ
 6vr5iVf+2u5pIb28GnHsAS/3u7HMAAAA=
X-Change-ID: 20261125-topic-ubwc_hawi-392e1e81e872
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Aditya Choudhury <mail@inferno0230.in>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795600954; l=1409;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Bqrxt6L+r1mVEwInJMRCBglNK1bVE7LAd9T75f4YLt0=;
 b=kXievXFwfKlxGXOCXjLF3UYsxUkPtcyVrRRl+yP/q62yHzKahu0ZuWc1T5jfE/oDiXzYe74TP
 vyD5bUN32REBMKpbFD/CY5KdZ9JjKfkHc2b9ty2eCKPG6ddOLoAtQ3o
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Since commit 31e1c3248586 ("soc: qcom: ubwc: sort out the rest of the
UBWC swizzle settings"), the flags field holds swizzle-disable bits, not
enable bits. ubwc_7_0_hbb16 still sets it to UBWC_SWIZZLE_ENABLE_LVL2 |
UBWC_SWIZZLE_ENABLE_LVL3. Its BIT(1) is UBWC_FLAG_DISABLE_SWIZZLE_LVL3,
so level 3 swizzling ends up disabled.

Drop the flags so that levels 2 and 3 stay enabled.

Inspired by the patch referenced below, it's the same issue.

Reported-by: Aditya Choudhury <mail@inferno0230.in>
Closes: https://lore.kernel.org/linux-arm-msm/20261123-ubwc-swizzle-fix-v1-1-2dc84e31e22a@inferno0230.in/
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 456995699fdb..395bef00fbfa 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -112,8 +112,6 @@ static const struct qcom_ubwc_cfg_data milos_data = {
 
 static const struct qcom_ubwc_cfg_data ubwc_7_0_hbb16 = {
 	.ubwc_enc_version = UBWC_7_0,
-	.flags = UBWC_SWIZZLE_ENABLE_LVL2 |
-		 UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 };
 

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-topic-ubwc_hawi-392e1e81e872

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795752947;
	b=5mAm7joMGMSw34Fldfb4+ifr5eVm9W1IZ/Z0CJvdP+/AOQTWlGeroKLpnLeud5JwqMJn
	 RGjbtSVSlClaBCn47++1w2T7GQWbCw47u7Q6RWH2UmEK46CuUaxY8TtIZ9rvnQ29wol2m
	 w9+7kPeHz5pJ800oxza3kfjM7vC2nMSWvfFO1Qe/47M2VSdmDLFTArfpPI62vhoVlz29K
	 KbXSe5wEbp8GbIKUTb3By1BWKzwU/wo1JkTJzkmTbQlVF57NUIqE4bI1j7BY4yIMiyF1Q
	 0X9wD/XXeW5XqdWDitvcLyvtaVFGQAxkXWbGA7roPz/qf1Kfakxin/LPX+4FPUYF+QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795752947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=vU4WXd1242fratlMxOP9LX0Y+fpiNIU1fLb8H+x9r9Y=;
	b=dd7XZedmlhbOkwMQRna34h1ouHD5xNOgBt3662K15xp4DUYEAmk2JFI/KJwxGXfrnRw4
	 4/iOGj6cvvl/gsS5H6OB59RQMdR/iFb8XdhRAyE6ZwnLZbABTVVPLV4ygHc1w5MApUDxI
	 B9VRh1aUdkERZFzx2PyNF8f/R8NSIlB8UAgmgT2eDQonFMrYnqMurfPuldjPdVg5hZssF
	 Ievya/fY+QD6inf9JqJVdGXd9Yv0Lrl/UzZhpGPxx54bnnnwUGdVJio385lFn6bYtF/YR
	 9sADAYXVL5HnYE+oiasuZcIKVJeB5O40L0cUycQvONhb7poX4JtPazwMXYUwSv97q8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zB6eC3Ya;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E25606A338
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39E25606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zB6eC3Ya
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso94350105e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 20:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795752945; x=1796357745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vU4WXd1242fratlMxOP9LX0Y+fpiNIU1fLb8H+x9r9Y=;
        b=zB6eC3YagXHocn+XsSBZH7eMHxV2MEu5BtR6+XSndywssf/GBfU5UhcLmIKecRWxm3
         SWamGWsSru5lHMfPJE4zoGbolDBB+tV3cVEwWASKmms1iuGDLQF+x5UDO/mknvMOvmXe
         O1xHc2NKZMnbs14UIMraaBzamo1bLWBNRotNngnULS+FJwVNChBMGH+SEu8Eln5O1bml
         Js0TxU7kRS2pe0S0V/OY6euD6X2MnlLhST/DxLs//y5QgzjhEUYooqiZCiLL4/4TqMvo
         sSLlTdULClt8vUXb+XmId7TWTGl3/qAMNC4ZOlxBVDJyellGy/aVv0kz99IxoeqdFSOe
         yiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752945; x=1796357745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vU4WXd1242fratlMxOP9LX0Y+fpiNIU1fLb8H+x9r9Y=;
        b=kJCvcoFlMnWjVzEUTnLyjL5qTqrZLmYrjUtEo5wfji1porFB5Ufbv6CcjqyD0iNcGg
         /pOzFxC860pVVyx2CIOnJJccIReFr9Oh2Qvq8WLNF9yKnhlxDNJKCWWIBvveToTLTSpM
         uefPR5TFwrwZJ3dQCzeSqKcKfkPVAcnaNRijtOy3VU84EZcHkOFwUpEH7UW+S1WOidZd
         VDsE+rdJt5RWKugsAezYFTLewzjIt8R+uSupOo+58E1w9wqzG54BiI+Ep8X/uQbMFd58
         QeC//olGUTSrq5LJ1c71KX9wgPgdmtizMudYs80HHuM9WehviY+ARP1+AGNCoxI2MOor
         CYFA==
X-Forwarded-Encrypted: i=1; AL+hErHtf0CSSXFZYZ90hNgXSuPKazqNy5KmhYJeH17MKMwPtQmrPDadKk/NeV30NNBiyVgIjDnvoGbpl4ji0FIj@vger.kernel.org
X-Gm-Message-State: APuU4Z8mhXliqnSXJX0yFN3Di/IIPvXBFrSmApUve83ZuxGLSxZxIkNw
	7CeGwMw8CqTcE2PrE0/7fMUQPl2fj3qnBKvOyI7Y7/4fXCQb1JqaHxvIRc5q773KV84=
X-Gm-Gg: AZFdTZfPTJb572cJ98aYWAyG8Xch1dBlQLkS50SLb/E3mSkARK23ZA7jKfCGsivo/QQ
	BI+Z6Xr/3TBYooQ4BUelXIUet6YDp3ZXMUQrAImmNUxjsznexAqGoC7iGWGawzNX+67Z2D/GMzk
	eWTbZ4cmZ8oqbWVbR5/1GDVChT1w1oRMERF4R9zA7Az661/lmZbjWwmS+jG2B9LMb9Z5gzdmOu7
	N/1ydRUNqZTgje+wq9LKqeK4YHHuHxDsHNs/OdsiWQWuKAzLYkvH3kUqoh0JyUVDqKd4Qvvc/1a
	+nQIKZqiEsXO82s8qYczLCZjYg3RXc8gSrP/qjjAFRxFNqdhLVxROz2lEjg/U2pPG59A0B8GyDC
	XA9SNhPKfi7Av9MMafbtuhYA+SljKEIFryzyifbKS2gHkwfLfAw1i4zYc6qSbgUlen54rGNWp7d
	jG1xyGdMHbjz/zz6anRNKFeGece34QV7PPZPYp5Px8DXXi20eGhqZtp+0/oszVhpD3XAtsY5+PM
	GvLVDFq3FCBgml7sYr2Z8wMW6LMxLFvIMsrnK59J8vzul11LvA9W2UERQCFF29L0HqFryFQ2TAg
	CctJ3ct3Z4+6XUmCyjU=
X-Received: by 2002:a05:600c:638f:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4bb8880607cmr431259115e9.13.1795752944755;
        Thu, 26 Nov 2026 20:15:44 -0800 (PST)
Received: from [127.0.0.1] ([109.79.27.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm686987465e9.2.2026.11.26.20.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:15:44 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Fri, 27 Nov 2026 04:15:32 +0000
Subject: [PATCH v2 3/3] media: qcom: camss: x1e80100: Fix CSID2 routing to
 nowhere
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
Message-Id: <20261127-camss-routing-fixes-v2-3-b7152f0af49a@kernel.org>
References: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
In-Reply-To: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>, 
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847; i=bod@kernel.org;
 h=from:subject:message-id; bh=jUjgq8L2jsVn7bHs6QQ0lJ9CXtV68QwT4B5NJ6rERdw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCQPp0rzo2ASWG9yYggxffLSBFnl1HhrQXUrMc
 kfUizBlNC6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawkD6QAKCRAicTuzoY3I
 OtmJEACOpqIwgOqxSoOE/8kP6hPgRSGZuJ9y0ud9Z5HLs833JvdKvr3jY/CeoVtsERRUIyx9V7X
 t81iaaOy4vd8+ScdLqv41Bclxx/k3ETiyGvGBuAQOjb61IMPkRbRaUPzx2MkHI622dFobaoDKXN
 raFZen6ZvVaraZ10dGagmwlGOIYKjhV+MUvS2v4cUQKPHCxxTS2qiVFQPC/zBvtB+6n//sd7/L0
 j0NXIPe10fQaQYhwFg7SlI0V4K5Z/HGqJ3wjOtSKNF0ZEYCR76+0n5vUGktIdHwnnQWsuD5DsTk
 GBc/43sBM/vaADtNe/5Fh5IVRMciX0Fpv8HwEQ7fggxOJTaSO6DnUKMeq1jY4sgpSqAJVUtVbFq
 GgsMd/S1osiXNMEesqv61KQDkInIBhr8VuxuHb7S/RgMBEel8EaazYaC0zu6KELybmoFxFoI5fn
 1heTOCgszLt6s5+q/UtKxIKwmVr3GvjdtAp6AMVdaz+Qx0YX2FjQIBV/CaQv96q/btEQwGNHGYb
 3DXMw/3fTfPSYqfAKImCtkiqIjR6oh4rSnxjmN2aUZK+zu0AGishCirtLTAkClNsjzcq3ehvhVH
 Yb9l/8uPC3kxAPlyHhqsrWp13l/Jf11w86+NMXgFWIzEXHdeGn8lFZ720Bo34JcrlRLk6aK84hX
 4dlvtDl4E2aKABA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

CSID2 doesn't actually have a corresponding VFE it can receive CSIPHY input
and raise an interrupt but it can't drive any VFE write-master. This is
basically useless and not worth coding around in the upstream driver. If we
find a real use for this we can turn this back on. In the meantime drop the
definition, it only confuses things.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Link: https://patch.msgid.link/20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 0a0af184bc9db..86bb1df811ea0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4686,28 +4686,6 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 			.formats = &csid_formats_gen2
 		},
 	},
-	/* CSID2 */
-	{
-		.regulators = {},
-		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
-			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 64000000, 80000000 },
-				{ 80000000,  100000000, 200000000,
-				  300000000, 400000000 },
-				{ 300000000, 400000000, 480000000 },
-				{ 300000000, 400000000, 480000000 }, },
-		.reg = { "csid2" },
-		.interrupt = { "csid2" },
-		.csid = {
-			.id = 2,
-			.frame_sync_en = true,
-			.hw_ops = &csid_ops_680,
-			.parent_dev_ops = &vfe_parent_dev_ops,
-			.formats = &csid_formats_gen2
-		},
-	},
 	/* CSID_LITE0 */
 	{
 		.regulators = {},

-- 
2.56.1


Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16C642F707
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 08:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299999; cv=none; b=plkXgpwIDxDDrc+V4UK9iHMx1M0xrj2jbBb0PWh7KzYuJ/DKlc+vBbdU6zHiinzWgXEAcdNG7PGxgF+ckHY0QI4w9Y5KH0IDkv22nNea6i4VzCtiu/Tiikzu1fvr7VDai3HimmSMJ4V+F4WVAJZmoIL8Er7n8czjQTVOz2Fld9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299999; c=relaxed/simple;
	bh=tl8CA4rO92JFIY1onO2td0Y/lwEd1GFGGF+FJg0LZQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8X4AmcJtHgC+7FtsnoRNthNvgbiWgePXZZjGaafKC2ZSgwLC5NFkGE8t3eb5JioipyMSyQpxQKqgyUfaoea+M02Ffs70yaQoXFr5Jb+yFxaFQwrFeiANiRnDEUsgmvlelBrn/OetkmWc/CQg7+vk4A22kFhoUXF/d+2w3mdeok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONySzn9Q; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONySzn9Q"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so714012a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 01:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299998; x=1787904798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WL9wBLDLyR3Kmyj4eYH49sAL8oSps6Ww6VMxUCrieY=;
        b=ONySzn9Qoe/stJqsxPqed9cO5RnTwV19LT5SkLY1nBoX6n0xowFriYJDonjeuNkaZT
         nsSzPFxzYojg24SytFVcQainBFZoueX3KirlQ+lNKxFDYju1oxDa2GpFrZ2GULj9HbTh
         huGEXMInU1yAWELXesZWdw8LJUhC0ckDW+un7YBqWx8fj+Gg2v3GDs1WDM/rmTaWpPGK
         CLmqhnjVw4yrCK5XbY8OUWr/DaLHi2cAeMOshooiakEo87LexvSq0j7Oa2PR3E5wVG5O
         99Hg2JwnD6S26Y76GaXq70Lxui0WwxOZ1raaJLIN/cIJ0q11xtBZP9tlfUYnx787bTd2
         1uBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299998; x=1787904798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WL9wBLDLyR3Kmyj4eYH49sAL8oSps6Ww6VMxUCrieY=;
        b=MlgWli11kpPGhz9tdF2Bja9lp5/X/ko79SZZSTDC4WB7FBVipTkd3NiL9aVmTPzSIW
         +DZxLDZ/d03kRfa0x6k/wTZLkLCyLZss2Ljo1BGuGZmMfaukriZLpOKDjkZcLJYikl3M
         p6eJU+CnEhmmSoOHac8MHJdQcmwkkXNUK6n3U5Eph4vByAeHS/tRosnPZYh67Z7A/de3
         V9RAKBR2ahzt3ofJypGGKfXX6y3Cg2C+p7oTgdvFtRkJx+CnlOEaEkSz9d4LkMuy/+Wd
         8zIMQ0gjt0Bt8oo80zHNBiMxvz33fPlNyNhHz0vk/9/V5rWkYIF38s6a7i7WGLJQCfAB
         AGRA==
X-Forwarded-Encrypted: i=1; AHgh+RpeGxM31tM63EBubwtJ2WLEbnA9l6P3tVSgGz3tMnmW0UYc+v5fvrTQ5GokuYXLkB2q1YWMou5NINeCPmOp@vger.kernel.org
X-Gm-Message-State: AFuF++lvfaPefr5FJ6WkRONzmIsKAqfWiXLzPBfWtlS/H2lutWLZ8K/U
	Iq+LnQYcBnHd0kyXBnbagU0DxiaLeHsTAXD397yyGXh2a96ice4vmSwT
X-Gm-Gg: AR+sD103ftmsXjf5MhvlHSeaJmcLsGgbCiW8Qjn1ywwCtzcWdhhYZat+SetATKL7Ahz
	rLmWJzFKNk/l0+33iZtwRrTWLP/QU2utuUfULzWy1mCc9GOFbX2I6gLe005wIlFICD1jagrMHHP
	R6S+KSYdejkBVM8StLxpH6dEbA7LwU3hyPEJwQFc3Zblv4/DAIIfvYJJQmlGhvx3gXLzKrZDmRJ
	fCKz+nhNfR5W3suCReqhIEpD/4qL3Oi83RO/OnylMfqpmTXwr1Zl8/1glJqemd2kPbWZs86e4QD
	UhzUqKZUp/Btx5FUrre3fWsJ7bjAC5T5kSJkWoSCbzKg+ejL5mRg1fHtdBPuUyXNuzi6qie8GMi
	QQrLz7JEbFuuMVIzOdZsl9REPL82XbRlti2ScljwZl0TeJLGY8uzPS2eUAHRYDIdESx6stk92zt
	lSHzq7YhtEGP1zbKOd5zEJFFc7Jp3LtAAn1h0MUIbGctu4X0UUXkiXuJSQauJOtSpCJZRDCO2Lr
	vTopZMJGOHd
X-Received: by 2002:a17:90b:384d:b0:393:19a3:4e5 with SMTP id 98e67ed59e1d1-395c386a056mr7511738a91.16.1787299998040;
        Fri, 21 Aug 2026 01:13:18 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:13:17 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v3 08/13] pmdomain: qcom: rpmhpd: Add RMPh power domains for SM7250
Date: Fri, 21 Aug 2026 08:11:20 +0000
Message-ID: <20260821081125.4522-9-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RMPh power domains for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 96e4bd2f5..70d0ff5cc 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -490,6 +490,24 @@ static const struct rpmhpd_desc sm7150_desc = {
 	.num_pds = ARRAY_SIZE(sm7150_rpmhpds),
 };
 
+/* SM7250 RPMH powerdomains */
+static struct rpmhpd *sm7250_rpmhpds[] = {
+	[RPMHPD_CX] = &cx_w_mx_parent,
+	[RPMHPD_CX_AO] = &cx_ao_w_mx_parent,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_LCX] = &lcx,
+	[RPMHPD_LMX] = &lmx,
+	[RPMHPD_MSS] = &mss,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+};
+
+static const struct rpmhpd_desc sm7250_desc = {
+	.rpmhpds = sm7250_rpmhpds,
+	.num_pds = ARRAY_SIZE(sm7250_rpmhpds),
+};
+
 /* SM8150 RPMH powerdomains */
 static struct rpmhpd *sm8150_rpmhpds[] = {
 	[SM8150_CX] = &cx_w_mx_parent,
@@ -910,6 +928,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sm4450-rpmhpd", .data = &sm4450_desc },
 	{ .compatible = "qcom,sm6350-rpmhpd", .data = &sm6350_desc },
 	{ .compatible = "qcom,sm7150-rpmhpd", .data = &sm7150_desc },
+	{ .compatible = "qcom,sm7250-rpmhpd", .data = &sm7250_desc },
 	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
 	{ .compatible = "qcom,sm8250-rpmhpd", .data = &sm8250_desc },
 	{ .compatible = "qcom,sm8350-rpmhpd", .data = &sm8350_desc },
-- 
2.43.0


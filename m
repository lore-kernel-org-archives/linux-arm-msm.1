Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6008336E489
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 15:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583833; cv=none; b=pugYMa/2FN2aPWN5xAiLSubpdg8JtAXtoOCMWGbSFoSwWFI4EzDDxPBDa8bSbAptVt+edM3+KuDe1fyDNsUpKVWz4+7v5AVYO4Ay4y8EsseBvcWDx6a29MttsXLaJZkarKUCuQToaPF+TrhAiaDC0+VoB+APe9FeW9dJMJkWKYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583833; c=relaxed/simple;
	bh=+m7WxzhF7QuTKjSt0vk6t6LsZP/6AIR8o4P2rlZl1RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MXFYhuAS93dL16ZOCGdbSiB/cfVnv/WFccgtXnjt2HtajDcA8nQebf0kF3y5MvKGHdLs7r60U1ufZd0O7RYQQTkpbNm9cNAVTq05a0NTmi4HFAXUtt3+WUPnqC0fSZF1RK/LwgZUEK3+PODD54rztfk6nS/EQgn01ljxjQRYI2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkrhQHDo; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkrhQHDo"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-448b0ff4a57so4934639fac.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583829; x=1788188629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=VkrhQHDoc9z7G6sv5pr0hTTsb1AeiZUryAkvZl0Ykr0nyawl+9oVrSc1rRZYgKSRLP
         xJbP2yVPAhuzZVuFbVCMGrohJRCPR+sKY2+bqk0iII/C/iXGjvn1nmeyWq1TjrDk2BKG
         H496BFApo4zPo78nv1a4l8H5TlO+UWdHXYUhatsQo9fOctSZE7834OkMqeasDYJKqyi4
         xFrApOYkri9skrFy1vZMQidzXfPr2i0HuJHOB612J0hgktCavPW7LFtZqGG7QMay6K0L
         DoHe4LN7mYyWfQBdeJFHqqlJLihUp01SMZnEBzWGdwMAS6JnqEAMbyHs14NW1QIhWDGT
         sUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583829; x=1788188629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khMXXSisMw9dgBq90MQcu6P4BUMmcXEpcjfAoZEh/Pw=;
        b=h9qo6hZUY59byuJthVngvZAbRSEPGfvq2BkSIQpeGQTA/sQhfJ7AJ/G3Tpg+ki0KiV
         tU9pViCpodRgEld0kcy3YQ/KtSU0G9W42fyQuUkt8cZsmfr+BpsE1VdNncy/CJSKZAZo
         dY8G9TxSeu3FEcl06Wtu8Prlkp83WtW7Mfja3EKpS+rNkKvDF4SjeEua7L3YjX4Ymi7r
         gDg4+NEBrJokqcV/b/w1mDEWmC4vZ5CuTm0vnRvE5zgDi8K08qzymkS41+9dODBRGsv2
         NE6gFVHsqy2A1K4PFwlrZt3qY5c//rP0y1q3RCftog/O2wMvcv6MOXH32rhZcPvmzF/D
         EuiQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwcNLaN0NouOk5lT/8wbyznDvQQ5zLzPqSusU24YXOUt3DUxoSOIqm6tcZlnRiL5tEud1J7cTVw38nZNzO@vger.kernel.org
X-Gm-Message-State: AFuF++lWuahJUIqLAFHXpTdYWMte9b7tD/9SrYYACHk6wIFYIqUHNl7h
	kUzqV57Z6X9T284QcVUYy1fLN8Ki2MF+ZDYGW/BBpFCC5x8CTTHncxd0
X-Gm-Gg: AR+sD10Pova5hvUfQE89VEG28KHqJYBXvoXGazsnP1sM7EygxF9xNMJZZYm1jzjf2LH
	84JiIJ07dBY9MMfMIOanYMk0gWkneucHKqC9mrP39E1fs4WOlnAxeDOYOIgBryEB5doZjKwPGw+
	rSHEAqt8/id1lkx6GBO0Ee3z34vD82Qno/74KUxbpvgH0nOKqskhrhagzQidJt8raMQ78hzmt/U
	bWk48RRUP1x8ZAK3CNNWTkaPsrtsAuQm1qmiPwIvPmZhnVSLBsRjsiltsUL1PY4zdIet5BWaNQe
	0W03vWvTNbDsfA4KHA1BDhY1qq0cy+D30+88587QXz2CIiPFhXCq8+PruxOh1BDg8KQXleWYyqJ
	XGfJ8qP5jclEhOigcS+oPBDBvd1Px2ItgwRHbHASYkcOD5LRxNy/22y7E33Pm9gz02wk5rjY+PK
	XnnNX8nsjLWUzcj0vMgb+ziahEHFVabPHzyjInv6lsjxbAEm2ltsZJDVMK4+5SjzX60z5kJk9Js
	XuuYb9dMYUpe9Mf5Dw0nO4=
X-Received: by 2002:a05:6820:1513:b0:6b1:4cfe:ea6 with SMTP id 006d021491bc7-6b1593eb71dmr26836615eaf.32.1787583829120;
        Mon, 24 Aug 2026 08:03:49 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:03:47 -0700 (PDT)
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
	taniya.das@oss.qualcomm.com,
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
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 08/13] pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250
Date: Mon, 24 Aug 2026 15:01:51 +0000
Message-ID: <20260824150156.1310-9-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824150156.1310-1-sreeshankar0910@gmail.com>
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RPMh power domains for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


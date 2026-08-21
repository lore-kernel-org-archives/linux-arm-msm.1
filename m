Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01E938F95B
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326937; cv=none; b=IZaeuyMSFDWa/fOJl0BrMTs4cpd2bHWE3xKR6/3djBwrskQmGwikkUMitfeuBXnUyiyI+BFkizOwBLMTGdNYC3wlkdz/+Y3QIj8yMSeyghAzlpW4VO3z2ZH/xHjUPJoF/TTrXjt3d+NaP93P61lUkLOO6gysBrKEz/b/CRPEAnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326937; c=relaxed/simple;
	bh=tl8CA4rO92JFIY1onO2td0Y/lwEd1GFGGF+FJg0LZQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YQFy/uBmBtk8z3KNSWJoGrULfGmCvva691USihmm8oj28y9KTMOFTT4LhWRYoptTUE86iJKum20bZF0hxczde6Q+TlnFGNCzpD7SYhuo1eUlYD5rDqX8rkEWRlUHPQyotUCxG2TpfYlDx2bwPagpk0rqVsrD5//exVflnWEf39A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUdno89Z; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUdno89Z"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381b831d535so1503408a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 08:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326936; x=1787931736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WL9wBLDLyR3Kmyj4eYH49sAL8oSps6Ww6VMxUCrieY=;
        b=ZUdno89Z0Mx1jozhvrp+opkWT3J+9EVlf9iTlU6thcG29Od+LiLH0Wvy+Df5YcLEu8
         odElmPglDW2SdbIVcpyCifTBd7swLKsl/PohjRr3VGZ/57nXSHXjsBx2UDFbp8Mgjoxa
         ouxPdtnf5AeU1TNlr87LUiQHWJ31k2XrRFR5z1MQCVyxdmK36W0obEGdn/F2rblRkd8W
         Rjd75t6M2R9E0n9U/sCg5qzeapDnKLBBVY8RDxHTNdr6Sh+tsLz1NWpL8huIG7rNgLNZ
         3xUjxjBAf31uFC+WSceJgohYXSG8eJyiWj0Hfhp0haus0bGiOWivRSRT2gkKFof8hikm
         7fvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326936; x=1787931736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WL9wBLDLyR3Kmyj4eYH49sAL8oSps6Ww6VMxUCrieY=;
        b=RoBmXUs5HC9Kvw57Us1AjFUuUr0BshINpGO1Wfz8sprLr2apY3aO2YKwBCIwQcTRL6
         QqDe/zNRSjrPM6BiF15mJc8B3sNwkM12eN2fFVG/zMyL08VojdKbLk2WCMuu4JbcoZ/8
         +s/r2kitelX8AH786/Da8kEn2smM7dliOoWKIxhgxjydkDPik1KV+yUI2F0GJb/klq2q
         JosCXfC00fXcVVfQtdPvLuZgp5CvAy1FHyHDSiJFJXSzF1aZphwsfi20E5HG1tq9ugps
         tmczGdGVodGNCAl68i9bqvBFsqox0vjIBWrHmbjLIltVTlGkRiWeQ/UD+kp6pY4PI72j
         ax7A==
X-Forwarded-Encrypted: i=1; AHgh+RpC0FarZc/YArQq5CLg30zBqRMiSzFS8T/q+aEehV883WkkgzfkGR1gNd4bjOxMb2ZhyqFt/vorCgZMhbwl@vger.kernel.org
X-Gm-Message-State: AFuF++nm6bXfnyLAhyNZFnbVWsVzfoedevqWlT7TeyGnRwPBeImmFn81
	6wCaJCU6W39L8dmRTE7h/+qwUR5ae97ql18m6fEGMY22YpF6IaaurgJ3
X-Gm-Gg: AR+sD104BreVZV6pprXHR8Eo6m/6QaIl3pr7MINNYYryRG7eXG2dxV6rTPxsfyP3G3t
	XuPvJVnETCTc5EFINnlMRjfEA+CsjDWjGuiTtTHuNI7Vo5gavFzLjbMHrwoQCW4baITTr3eE9uB
	nIoHig5QaP9FZLTRHOMad2EjtsMZxAJVrs1zBm8vJV01b2auh+Q2D/a/x9MpkLdD2RnWMJFsT32
	a2NH/G9okVWztbUPxLJTHJpiecdVX1gAkU0sQcR7DqvFFAfAZartzdCE8Mw55NI+WLN3mC1G4e+
	vk7I380fmcf67iKNGy+uKn50cXx50m8kEXE+WPSowrBe30HpoZbM7Ji2AqokjzB0i4OeJhEPkir
	joROcRgckXRd/+vJCn1C/P1a9BtC0va3VNj9GMuTuB17WCa4bLlYmtOpfG7xmW5M+uyV5fP4ddx
	YCD8VIRLLoeG0ymE9fM1coWg6pTPwYvhs+ZlmJX0jdp8KjpKsfrPsku/6HxxtkwSTeWjTrxuF01
	ET80cAyzLli
X-Received: by 2002:a17:90b:5347:b0:395:a7eb:a4d8 with SMTP id 98e67ed59e1d1-395c3a4bd22mr14090197a91.14.1787326934261;
        Fri, 21 Aug 2026 08:42:14 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:42:13 -0700 (PDT)
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
Subject: [PATCH v4 08/13] pmdomain: qcom: rpmhpd: Add RMPh power domains for SM7250
Date: Fri, 21 Aug 2026 15:40:25 +0000
Message-ID: <20260821154030.2514-9-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821154030.2514-1-sreeshankar0910@gmail.com>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
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


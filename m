Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1D841D4D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040576; cv=none; b=QA0h3wL9lGGNy3JY16rxAwTJrV6s3dGqyoItlruxwMuOAegBjRejOUfe0n8n6S5SXbGylvI+PYiX8G6HukY3VNa2gzIS83hpYya42JPEjZGslpRovVTHejDompX+XYFEkFeeh6Lt02PlxoFJSHlfBUpfC1HIWfqlbP36oRa9dn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040576; c=relaxed/simple;
	bh=hrc0R6KlKcRZuarL4/2xinfYS5AgbkPGLDVTEkPPZ74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPo4C82VMOdVmA330nuX/iwOrhOirmS5t1OZBSEajX7t2ak/Nk+xhpMpvgX/JfRsYtJO/P4C1rd1k90zjcznj5w626B87Sr6HJ5YX8rU5jhEP9/W4mocPUZ8axLulJtXgntrUt/BooTTNRQPxueWc5HVQ5HF/wjrpvPUEWw+teE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kq47DFGP; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kq47DFGP"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso3380427a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 01:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040574; x=1787645374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nFL4XLJFCNL3jRTkLbh6D9yBXB9KUubku8W2Rf3apf0=;
        b=kq47DFGPvRJcz75Mi8zmusYZvrGwBi+gNHXdUCS7+A5Oo0m5Hpot7zqZiA4rw1q7Ka
         NfIQNdy1X9ekRSEc9pYsr0i2qJPAQEtEKEBXn4JVTeoAWZPWE2NJOji/N1SIvw3XZVdf
         qqyR3yithe8Otr0fBgJMCE9gnQNaNtG2zoN827L4CAgOViVFYUTEQpKBGzUgxNi4t8x9
         bNE6T6TCCj4K888ZR+lz4Ahcz85RmndunXg3ZGedGdM/Pi4gan7TX9SpEF9QPRS1D3sd
         ys2dhqh9zjLi6PcU3UorArwmlxPKE3vhMyokQlQDtjio019tL+5nvdFQnfwBZKxAw1ES
         UBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040574; x=1787645374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nFL4XLJFCNL3jRTkLbh6D9yBXB9KUubku8W2Rf3apf0=;
        b=fUw+q1Tm0ikEsdKvbjW5VPKX2FsCCP0SBlXcU2sJRVqtf2ucopvmK2MEF7XUViAh+m
         CmYwkhOjQrdE6Jyy0Nsih6XAuSaew5/qXTFyaYqVjMgBeyJQaNRfl6aXxSiQOUbdNuH1
         A8c7zqNz3QfOEFxBMft267j/Z53oo1A/h8Vbt+XTtFHAtUOsLWDv7SvhrjMHtNHBP7hI
         /i99YQSOCvwoshwGHnWQhp1XgEDFG0KYIc62mzi1/AitnNBk03leDMCgwVfdgYwQZuYO
         Op6S7xkva7PVHIggvmc12lWD3n9f6ziBTur5E4XgezKSFB7P5lTUF/BkrPgPEvEUXmEb
         O4eA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1zsX/2uMpDj6ocwUdOImSA0QPF7l1NxZnPgSqvOKuoDLYnGUjyaWt5q0lSjG8fRzP8dkY/yLgY8o9oX6d@vger.kernel.org
X-Gm-Message-State: AOJu0YzjQUqVQX0YaoH4PWsLXpTwxvWrqxFudKa7rF/1j2fxkvFokj1N
	cw1fu+kcS2w9eRPQ+syCDF4vzjYjcbo5cWc4UsdNTLQQ/qDr49BhpzhC
X-Gm-Gg: AR+sD11RbGtK1040TKURf168luB5z2nTsXWIZjs9fJtEGlBRDbguzihioEVwMwv6TYE
	d5sU2inPeFNYArUBRMQHh/jscbUqeiNP9I3pLyo3eMKfe5NrL6usYqUsPu+8g2+xLGOXF4hgsqO
	XIOmUXZq642W2l60ews6Zqc3h7fFyutsZt3mYytddRiG6IaawcrLF14EaTHvjArkQ05Hjn5UgL/
	iPhZ6KXuQLlcZaXlA8M2FVL2KEyYKTFeKlvfOlZVFyIxJleAdfLYVwNB4oqFJCo/4fWyUD8UkRj
	/7mk9eIaLxRvYn24qm8Cq3oz4/yXDHjjxwj8/38iUqwc7yY0l/2vGHgyghNXeZ5+BpGPdwcudJD
	VC7a2Qfq5YTJjmN/L8eG+YEs6KXdD+zLXVzW70Ml8xMMYh+WusaATSqJ5nUy+YQ0T+Z4HebwfiX
	gmGoDIJ4G/kBvv/Z6HZDLMyetAe8aecFCkbRkcDFaQHbnIyMAfYmy3nZgfajadAMvewJZULwvgi
	dDBd80jrXI=
X-Received: by 2002:a17:90b:4cc1:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-3933bd0dd0fmr38889309a91.2.1787040574404;
        Tue, 18 Aug 2026 01:09:34 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:33 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 08/12] pmdomain: qcom: rpmhpd: Add RMPh power domains for SM7250
Date: Tue, 18 Aug 2026 08:07:50 +0000
Message-ID: <20260818080754.4362-9-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RMPh power domains for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index ffc46de8d..6f4bd6b53 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -494,6 +494,24 @@ static const struct rpmhpd_desc sm7150_desc = {
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
@@ -914,6 +932,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sm4450-rpmhpd", .data = &sm4450_desc },
 	{ .compatible = "qcom,sm6350-rpmhpd", .data = &sm6350_desc },
 	{ .compatible = "qcom,sm7150-rpmhpd", .data = &sm7150_desc },
+	{ .compatible = "qcom,sm7250-rpmhpd", .data = &sm7250_desc },
 	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
 	{ .compatible = "qcom,sm8250-rpmhpd", .data = &sm8250_desc },
 	{ .compatible = "qcom,sm8350-rpmhpd", .data = &sm8350_desc },
-- 
2.43.0


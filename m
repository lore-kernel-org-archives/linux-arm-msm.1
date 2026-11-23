Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437369;
	b=xfWWQEROQwtI4aEDfxUDhQIFlz8OuSrxOChVq0rcd6098TpX9fGO0L7xquV5gck8NgsG
	 DQpQ8nlLBEnL2eG1DQKrzpC2Pr4zLkj1bvrwLTJAQFgQGCln0qHdOnDB8N2rCfe9ChZDV
	 2hmV5NsSKRyPzsuUeoVkdiV1eiUDjG9VrQ77eNvm4XmNLxyULsZ1AXWmVQ9zQfZ/BlQZY
	 OihLxy1UOygdqmhX71Pu+ydbVx2krGHm7yIsBhiDHDTHK4gzYnmB6EhH6nPMAk4qRsea2
	 wVjLEJceL51d87jg1v9Q+fT2wGEvHNMiVEfPINvjkv2qNCrMb3ck+BdeGqr8m235kIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qTs6qt+I479MzVm3TzmSF9iYkRLfWtY+RBYI0Kg8HgQ=;
	b=jFUIfAw8UYtRXKh8NU0iW8e+G6AM7rjU9AVxv/ZWc3kTaOl1uUuEW3owOC3vFEo43HaJ
	 i7u1W8EeDIeKFd+eHjq2kxkmwhrZOEXQ+JWFoZvIfN7gJWSAIozIoyKk7UYRqC/oPSbQK
	 00Y1JNlL4UaDHPAeRv4M+dSPx6d1RbQ5Xtugsl32KYtlpuEngSsgCQ1/OkhvFRfM4sLL1
	 pTCkt2+4YH0RFIXQDRTWahRDbj2udTKRGH9ehTUK6QMm41TD5vTfS1oag7hZt89P8o1o5
	 LW/4RIMUJUy1fcJri1iJ/CT1VfEBSNAsaYeLPZKKzRr63nauHRtylssjPb7jv9lW48A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alq+xpW8;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80350606A335
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80350606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alq+xpW8
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38431138772so4119543eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 04:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437368; x=1796042168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTs6qt+I479MzVm3TzmSF9iYkRLfWtY+RBYI0Kg8HgQ=;
        b=alq+xpW8lvIvn7LcJwzSvomTxbVuQXitCohB6cKUBQAR6jW9xKij72us30SL05FkMa
         H3Poy1cOtIZ4Sy0okJijmUSOBntFNr6/Oxa43vJbYWKncSm6Do4G1wHQS2tDipyPE/lJ
         fwQh+u8cNBxIiNdUK+P/pbNoutc9ywa4rJr/Geb/7NAHIHIGl+GlkvwtU8NaxtVNcE6x
         3vMPNKRFxg87rC0bZNZfq9UgV+4zlMY6+Jh9w7xb/LhDIVRk8EgnbFP9ID41wPMuZYrX
         e7Cx2HK0oF7JaWx+jgqk+gcKRJ38vpli8lP3FgvCI2JX8jt+O1Dj6VtscZ6JFVBd+4wg
         f64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437368; x=1796042168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qTs6qt+I479MzVm3TzmSF9iYkRLfWtY+RBYI0Kg8HgQ=;
        b=KfQ1apAHdzEvAR6ZSPtqNx2wkmf4sVEG/f+tmkSPO9I6OhOUUNIDvsw60HQ1aJD+f2
         BDk+TyrfewBSzwqPgiEUUjbbCnvhvkl5KgVMpTJexAlTpcLD8/9iHFXbP60V6sghGmj6
         NCLGHQYI+TPJI2aAH0sgH9q3Wntu7UYnNWbr71zlt6YJ/wAgt6mvNPEUbawQsOk8KKeN
         uneYOAymwLJ9paZ9BK7S2Apq4gCbfu0qZvN2ppH7me3LIrQiiwi6VHvflXHIYoxY43e2
         4tqYZi4i2/p5bfg7l1Bfa8hBizFxeraFJza+vkPoL/IVGJ0plqY0wii//sNqF2/ygAo6
         7pnA==
X-Forwarded-Encrypted: i=1; AL+hErGLTMumR8Yq276bFFmBQayM8IwVWKQ/k1zMjKz8Fulg7rdQjJFBZHyW0oCL8IgjB/Z4sulC6Dwfq8B2UCB4@vger.kernel.org
X-Gm-Message-State: APuU4Z89DKDSQM1guCGWC/RfOFewHWSApktRXO3qnFFsjtKWgCkj/pHw
	YOrLKfvSq2/9NExY/j58HT/bdTEUuyfnL9gMNT2kGkG4y3+C9Zsdi3/H
X-Gm-Gg: AZFdTZcJnzjOnxrRHMLSqGNw1EguIEiwc42blip5hQHOv7qKPaBITDXsw+2qu3u5cHo
	Lf9TOsxuU51xNDuYUlR4WijByOrO3jsKlXkT8uHYvR0dhDrN+uHrWcJeYUhF7EgO/2NMRGjOnib
	6KevF06vqsRKy0O6cjytzgWmnsoxiBbwXi065AWLUKDxXeCDnhb2xdgGc4sLElp3Ycz4a3HGZs1
	YzuRREwj1/jWG5uyb0cLsA2ip4gIKM6GA6CpPxPCkXR78BOVkityuD3j0W2m3Y6xShl6KMjc7Uk
	tXZJVWGzz+X2Ux9aeUfk/eNCCKxfaZWdV04RKg50e1bzi0SLmJdUC8qkXusS5iq7UENqk2zrIIG
	4TJR3ehooW+EbWpHztx6FmUYaD3ajZPODdo9U6CZ5Pvgu+M7Zmf+0Gv0GWMJMWsl7HNm+OPXz4L
	gsejb1wpH2rn2FNRsifEa/ek39tQRMkOizAW+uDu3jRC0tBNpab7Z+tpTv7lPdlkU2b9di/j5cQ
	2TtJw88fwch7SRReg9bF8fTXKKlnOujBvzigX6XzKUSJY5GZrZ3W0vyVXUyT/3TEAA7TZupahMd
	xPhejIiPTOiMo860S6ixV9NRYhaiaEvDLWLln0ljAAijWg==
X-Received: by 2002:a05:7300:e60c:b0:386:636f:c25e with SMTP id 5a478bee46e88-386636fc6f9mr13059014eec.12.1795437367601;
        Mon, 23 Nov 2026 04:36:07 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:07 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Mon, 23 Nov 2026 19:35:40 +0700
Message-ID: <20261123123546.152162-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
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

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with
a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on
MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Switch the 100 MHz parent to P_GPLL0 with a divider of 8 (800 MHz / 8 =
100 MHz), matching the 200 MHz and 266.67 MHz entries.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index 8fe1d3e42144..8aec5600e837 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
 };
 
 static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
-	F(100000000, P_GPLL0_DIV2, 4, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
 	F(200000000, P_GPLL0, 4, 0, 0),
 	F(266670000, P_GPLL0, 3, 0, 0),
 	{ }
-- 
2.47.3


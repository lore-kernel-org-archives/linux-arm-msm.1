Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669153;
	b=fEju7PiAbg+/llSyrNnPvLEufVGASawazM63qJjhiJtFUnmTg36tU2NYGY0PUyk2qPJU
	 zx39EmPkvIPXyqmk22Lt1hd2fn/QINiRp8T9skjpsdwXj+2JNOEn9fNsprIBA8QLi3+jw
	 EVrpBcckfz9xeR0sVhLEW61galarIyMC4D8kOBbVNOCJEkUTVmM5Cx+0ESzzNOgD4fH9b
	 PV7xenx71hPqbAtJjAdSeJzLufAxA14Lvk0t4hgx/R7J887DQ2Wf3mK60YwV+9LxOaGkG
	 TbG2fseiMWD2FkLEDi8bSkflffSvLjvyePghpzQ7LhjgRyEczML36PxJqqW6XgMOoyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=7W+Utv6ErnANSVtZoJdOXISdTZmsDEokunlRl1iQvcA=;
	b=KEhA8oYOO0UsfC5y14C52wjyrLvQWlJu2bJ4H+a+y0eKqlpvOqksEsvnplFNOFIRwSjx
	 5UD5ZJVKAyiSULfMzwzXrVm6jD1qa53VU520FpZCFixlHmVgpPX4IePa7oQ01WXY2SaaD
	 uUJI5s4xIdzPsY25jQwkDfsseAQNRHHlnbl2MCOTdAbhP1FTMm1FtvSDAFXIFYj7BQO0Q
	 Z0u/53z/UDBtp+vnTZCuZFg77ZOHWbOs4fl7w+SiUO2XgMUSKAjRb/bseqFKa7h6phxci
	 WvS3Utjs0IZT4IjBlYGVUwFyfb4P5vYEjDnOZxHBIHmGzGnqqNgS/ygJ3sGc0bqaxsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JBAaWCnk;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB59E606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 04:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB59E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JBAaWCnk
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-385d8a00598so9744056eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 20:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669152; x=1796273952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7W+Utv6ErnANSVtZoJdOXISdTZmsDEokunlRl1iQvcA=;
        b=JBAaWCnktxGn67IoGFG6qtca2/FGJHbS/o5pCtX40CoMLzn44WHvDkixf8L4USkTiF
         U8/i6EIhvZ3oR3JjM1oOB1nJ+h5xv9d9skuODTB3u568pUZ1zyIU+92fNaoLYLCwq6bp
         P3n6kc8y3Ch8M+/MJp0BRscOqkd+ZejdH0DU5L6d3TadpJO1m15Op9yjDXGVA0jP52XV
         xxsJdHljARkLeWLsFPBxZck1/mCeUEOLA0JpHMCtuVKKr1xxfCNF3f56ZDF5dtwcJpDo
         aZGkCM59+DE1YBMT05Ddkl4/URdA7twSKN0dW+IgCPDePaa4HpnJ7fjb9QEucKzh0pty
         cjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669152; x=1796273952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7W+Utv6ErnANSVtZoJdOXISdTZmsDEokunlRl1iQvcA=;
        b=YHpEPVmotT36YtIj51r/jhVMnFFplWiQEaV2uako1Tfow8crgG0q8qnSP7PI1Dc3sD
         9/BOLzayrAyCeAZnE34rKQahMWol7k/A7k6svggWjYfP0mJqCFByp91WLm9GcdyFyxqc
         70ayo3tsaRNa9dwRFbWNOSvq4ew7bYjho+uWsZhS9gF/XRtL0EtqvorYEMvtxP33sBPR
         271bnuqSnSM49utlsEIbTxlnosLwiVvzPMGg2IQcfYtNgLzG1WHUC2mMsRbHYF9W95L8
         C6niwes/Q/3/1s03dTcUq8FvMVxKbMIJicG/wnqUyS8vD+uIqkQZHq56/mVeRONtdNHS
         DZig==
X-Gm-Message-State: APuU4Z9ywGQ5IaSTvXjzqLoMJUmeCU6tNU19UF3iszBDVXBNkfGL0Wh/
	1O+gFUExdTC88zUSc//GLYVAaskZEVsLdveP6c9xHlz9KQI6P+YHcy7g
X-Gm-Gg: AZFdTZc0UU2ez1YYAic6chqGSK162pxn/m0B2cSBG87x/kAT/AqcXg8EE08i9B/iFQN
	6PZ7nUXejiXuVuYaO5+f17ocTFZrhOsqOu5A2kU8GXE+EttBMLeTMgC7A2XQLsStxCPjhPhWe3u
	7Av1FUHBIkHpE5G3cydnUOsgKQE6eZSd6od7fEmuoj9VQMKtpfpeoP7hBZOC64YXajCT/4aymHQ
	zlv228DHkiXtsfLeh/azqFRA0Gljn/LYVHpb/qkuOPmxb0Se5/gUQdrpJ4m85nmziHMUEq5T4hh
	pLu+CdB5XESewS3PtWwK1TqgXu0XRUzLjAiAFi1r81GAv7+MhPYnBYbZrgG4JkJQ2toPG+sc6VC
	mmj47NQkJxPfmgdas2IdzuToVhinsDmTxswk9pK5p+DYYbVT6fWk2C6mxfteP53NrrVM61qKUF8
	Ya7aA+pR/RBEgI4bR4zQ4woIzfc2gseMbVuoVWKC2V6apmgJshxMjT/AL6EANYPD7ftAx8Me95X
	hh72uiCsIFprehadruNGa/UUlPpvt5AXpsCE92ibphjyGUHNb6WtJXwQwHEHv+PuGP02KqSAqem
	gX8VD4nkr5sCXj1CtwrGUo+0iscbREADJ+3/KmdcTNnwfofKCNszphwRMV3G4VE3wTnLituLWo5
	lWDrEjh0=
X-Received: by 2002:a05:7301:211a:b0:373:5561:8d06 with SMTP id 5a478bee46e88-38570c36e7cmr18120325eec.37.1795669151957;
        Wed, 25 Nov 2026 20:59:11 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:59:11 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 26 Nov 2026 04:58:10 +0000
Subject: [PATCH RESEND v15 5/8] thermal/qcom/lmh: Add support for Qualcomm
 SM7250
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
Message-Id: <20261126-sm7250-v15-5-492014ec0a52@gmail.com>
References: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
In-Reply-To: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=1844;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=CmS4WbY680s9pKqTHyEMhgvx1KNZW8cXDQV3gT7/gA0=;
 b=Ga2DAgQsD+OSLjC/t1+7JMhzX9ceiKoXjPPuSvw2ydQoSjGeMPgnJo3R7FzlzjUfAhvf1RPJ3
 KRdCd432vBxB/rgof+ozY7KtJgtnGPh5wnc/X6WkeTPmwfD1QMBzpYC
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Qualcomm SM7250 features an asymmetric 6+2 core topology where the
Silver cluster consists of CPU 0 to CPU 5 and the Gold/Prime cluster
starts at logical CPU 6.

Add the SoC match data defining the CPU-to-node mapping (CPU 0 to
LMH_CLUSTER0_NODE_ID, and CPU 6 to LMH_CLUSTER1_NODE_ID), and register
the "qcom,sm7250-lmh" compatible string so both LMh cluster instances
can probe and register their respective DCVSh interrupt domains.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/thermal/qcom/lmh.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index de3fe64c3..ddfdeb3d1 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -110,12 +110,22 @@ static const struct lmh_soc_map sdm845_map[] = {
 	{ .cpu_id = 4, .node_id = LMH_CLUSTER1_NODE_ID },
 };
 
+static const struct lmh_soc_map sm7250_map[] = {
+	{ .cpu_id = 0, .node_id = LMH_CLUSTER0_NODE_ID },
+	{ .cpu_id = 6, .node_id = LMH_CLUSTER1_NODE_ID },
+};
+
 static const struct lmh_soc_data sdm845_data = {
 	.map = sdm845_map,
 	.num_nodes = ARRAY_SIZE(sdm845_map),
 	.flags = LMH_ENABLE_ALGOS,
 };
 
+static const struct lmh_soc_data sm7250_data = {
+	.map = sm7250_map,
+	.num_nodes = ARRAY_SIZE(sm7250_map),
+};
+
 static const struct lmh_soc_data sm8150_data = {
 	.map = sdm845_map,
 	.num_nodes = ARRAY_SIZE(sdm845_map),
@@ -266,6 +276,7 @@ static int lmh_probe(struct platform_device *pdev)
 static const struct of_device_id lmh_table[] = {
 	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_data },
 	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_data },
+	{ .compatible = "qcom,sm7250-lmh", .data = &sm7250_data },
 	{ .compatible = "qcom,sm8150-lmh", .data = &sm8150_data },
 	{}
 };

-- 
2.43.0


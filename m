Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132BC47012B
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 12:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711711; cv=none; b=uNLnhEhkuJ28okkjoaQ0YK1nWz6gHBlE6PCpaGdzEDm+0raVZJgZbrQBfjmEpn4O/rQmIWAOmaQlBoUedZNn75OpKs1bb4ajSNW2IA6nCMEnD5n2zeRwxV/43RBlEeG0mQihhDBH6XnLyQjHD6QsdlLHlCYDuNN8XyQxmbTJ7og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711711; c=relaxed/simple;
	bh=rYEH2hOmN90Pzm5/GtnrvfT95zh4bYDFMfksSoLkIBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iD+WR82rG5ocvR+1P5nNFtSi7PvaYEeUuMNzQPSRomcEayaiUWuttYJD7B3gRUmIA94z8MHpI+s2xCs+Sqs5qIYwydX+gQ/La25Breo2DBEGivEMjycMHq9DXw49kU4Hot1DaHmPIsGnyku9qy+ueT0IXqh/eu5UZnddA5bIOrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pnh1b9Hi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RTzLWKPm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pnh1b9Hi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RTzLWKPm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAbAsY1412993
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 12:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YwW0Ulz18p/B0vYugO7IL4Pe1erKm9sHJgbPBmFga+8=; b=Pnh1b9Hiu6qQiwG/
	7Rzdq3L0zF6/vXw5g6w5Vbzevrn1mCeNzAA5hBmCTehWAAsaKsv3T30110Czw9ue
	vDI2GTh6BfAj2oQA0Zn4n1uFizXKc3FUotSV6eQ3UUx4HK55c7WCANsu6SHnMDqt
	Kk2zHgxsbvIOw+TH/4hSzXdnBUJ6TzaFgwTpUO6KxEMuKhNpWLjFu+r6ROt/IzA8
	RFq0Tlf2zUn2Imn1WK3RXqHuLRTwHTddaGMzU+g9u7gpaGccu3CWUq4u7VyrU/46
	SnRA6VyhnQHvGnd+ruWyXyy4aQFjcHaLZeZIbtSZzg+LRmLbVjPXuh2m2+deJxkx
	uhQgSg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20638usf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 12:48:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848d21bbb55so1294820b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 05:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786711700; x=1787316500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YwW0Ulz18p/B0vYugO7IL4Pe1erKm9sHJgbPBmFga+8=;
        b=RTzLWKPm5sBvXnQr1m8YU+9s78TKh9uYW5P2ht/XtspD+8FsDQZbKmDvwoxDidQRSI
         5xp0hMGOQtWIK913LyaSS34FvlFP5x2TJTHnvl3n8qQk6asldkHBZ6qMfM3GrD8ABISp
         HO3waAYl9V+XUwWypqCuoTp4+HFBY3SA951ZTyeBQwk6DUPWUGXjcyJ3BBQqXQExhBlF
         VdNfOmjgOYA43YfWu3KiupX+/eGpMLC5htKPbK6NuvAdsLrXxSq8gzQuzQEE4Jr/1QC+
         W6/dpAp3/a2uVQLlybRiJOuBPEu2JvJQ+uNch/Pg29VRzy+Swe5CyRxL13pFOJrpYJUD
         KEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711700; x=1787316500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwW0Ulz18p/B0vYugO7IL4Pe1erKm9sHJgbPBmFga+8=;
        b=NuSjPLobCVDo2yqSAF/MEAPXiHW0X72lE2VmT9a2BwKMXaTarpMsXR6oD07bGblRl5
         aK3dRDdEhQKkU0Mi8L4J4psfNLPO++oXQvvDMUyfkT3H8GyopgERufuy3YJlDYtK+yqL
         wXp1gqY3Y7nHBceiqnI5PighTfpTLi9fm+patU5BXez5QpboMn5uwLqJbCguOS6vR2xs
         Twj7rQ8Zx/xP9rIPHooQoCL7Q/T/lhQMbRm7htWEli4qoTtNAWVSbBw1CPmGLNdk+gXe
         QXemDkwaiCID+k8QTJNg5q6bDmL6Vv6qTIJ2AHJdu8m3R7hJ2dheLGCwqk/7ySSZrzVH
         xCmQ==
X-Gm-Message-State: AOJu0YxmUz4z3LUvPGGrJP9XJxhnhqBwamq7ZpgdWYsYfMKDIBahc3Jq
	RtszbiTJEdN/vfx4TUz/KqxUw2TbRQnoSwyKsldwrVUi7L+TfrLqGugdzRf4P5MKlcxIckQBQIW
	onrQkjasuKJgrZBVKj1PYeQY/6q3zl0j2UpkzPmChBJnt9jWidxrGcIWxSqlqFw3R9IkI
X-Gm-Gg: AR+sD11B14OrHzREZUbw6Uwyu237NOXVTaEjtXIYta7Tig+BhS7O8SAfj+Iq7G7uAWD
	NGvHhnHtcB6tieK2a1bSB2QXlXajsfxldgWr3J2SXwrGFKZ7DM0oB0tkg06lC4Oc00AoU1c/zf4
	PiWPhdVcOGVdhzjWTD2wu+hH4zzcHu3YvQVnU2MNW3a9YBuqoGxSQ3SRBhy06Irf1242UBM9Yf6
	WHHIfLzF50ukxF2RDWdsEf7medWiSyx55BAYwsa9PZEuO+Wlzo5e5mHJJwsOUb6McFpfCsz+f/q
	RoOgKyZ9kvOOUNA2/Cj5GFe5UiSFnk0JBPnpumvwj59C75PEO7XL28/R6QqfgjtSv+bffW5cfcK
	XzQKMqEX06BxsJJ8D91V3jVU6S9kW04NiOGj+NeEBVb4=
X-Received: by 2002:a05:6a00:13aa:b0:848:4754:28e5 with SMTP id d2e1a72fcca58-84fde00c9c5mr5301944b3a.16.1786711700453;
        Fri, 14 Aug 2026 05:48:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:13aa:b0:848:4754:28e5 with SMTP id d2e1a72fcca58-84fde00c9c5mr5301898b3a.16.1786711699933;
        Fri, 14 Aug 2026 05:48:19 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26726bsm405934b3a.54.2026.08.14.05.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:48:19 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 05:48:14 -0700
Subject: [PATCH v3 04/12] clk: qcom: ipq-cmn-pll: Register CMN PLL /2 clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5210_cmnpll-v3-4-21c3db378611@oss.qualcomm.com>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786711693; l=3575;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=rYEH2hOmN90Pzm5/GtnrvfT95zh4bYDFMfksSoLkIBU=;
 b=t7SlWabUPdfJAzNkMUs6gHqSul1Kdr6eIdIijoKW0AxLT78hVX4om8jtZMPnumDWAw9ZR/aNZ
 569DRXjCgksD9tf86JF/GyNfcLiryVh3rrWyrojyq3IE7A2ljpxZPQ2
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX/i15RE1r8CQk
 0hf8x6IijaUQhB8JvH0MwQ2/jQIvX7D+IBifOJ1ut0bchrvB4o4pxJBcyNT793nLHS/NF16mK4w
 aCjOjb3a+qxLoSvfjogHzy32EckV4u0=
X-Authority-Analysis: v=2.4 cv=Z/Hc2nRA c=1 sm=1 tr=0 ts=6a7f0e95 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iNtefrAnPnN0Ez4j4CUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: lezC7fS8BwvjvqCp9rC5Pn95dUee3xJ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX7uBKic6t6Rqa
 N4ueRDd9LQECvFw6jAqwA3vg2eOv5rHJ2ItW8Ug5NmJuYbZgYxza6bTa1ZYXEEtWd9RJUSt9B93
 3JUZs0DRNKf7CChS6bH4OG/k7CnqurPFvFrb+fXkDV6qV1idKj8QHGigiB9ej1hVckYakfzASWY
 af+6s6eGSOtJD2kUcYJGYwCARAPQxddQVO6oI3UPXjLZc4hpZZvH7yrA3lbz4k3M6FylJ6zta7M
 o/2Xjj9Cx6dRXikhFbwQjSOO2q8TBUixsu4i9YzFlddBqvS70aTOg3wGYCuE5V+A/xZPAEnBw4z
 yxm/Dtd7aACSGrIeiC96/FmLhFP1VXaHzzPuDsuwER1kIkdX97hajTrkNOoPxahTQpTYe8r+Bfc
 waLQ+TnK/OZ4SFF7CpJk6NwljniBfcFyPMBrHH6xWTmztT+KRF+97Jae+a6HaY3hpTCdFPQhEl1
 vSG+Mve9q1L+ywwGzYQ==
X-Proofpoint-GUID: lezC7fS8BwvjvqCp9rC5Pn95dUee3xJ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140097

Most CMN PLL output clocks are derived from the 12 GHz PLL output
through a shared, physical /2 stage, ahead of any further per-clock
processing: a gated fixed rate (PCS/ETH0/ETH1/ETH2/EPHY/ETH), a
configurable divider (NSS/PPE/PON), or a rate-select bit (EPHY-RAW).
This /2 stage is present in the CMN PLL block on every SoC supported
by this driver, not just IPQ5210.

Register this /2 stage once as a fixed-factor clock, "cmn_pll_div2",
and store it on struct clk_cmn_pll so the output clock types added by
later patches can parent on it. The two plain fixed-rate outputs,
xo-24mhz and sleep-32khz, are the exception on IPQ5210 SoC: they stay
parented directly on the main PLL clock.

On SoCs other than IPQ5210, every output clock is a plain fixed-rate
clock (CMN_PLL_CLK_FIXED_RATE) whose rate is a hardcoded absolute
value rather than one computed from the parent rate, so this /2 clock
is registered there but currently has no consumers; IPQ5210 is simply
the first SoC in this driver whose output clocks are modeled as
depending on parent_rate, which is what makes the /2 stage significant.

This patch only registers the clock; later patches wire it in as the
effective parent for the output clock types that sit downstream of it.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 4fdf78f6829e..bcb51a5f559a 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -96,10 +96,17 @@ struct cmn_pll_fixed_output_clk {
  * struct clk_cmn_pll - CMN PLL hardware specific data
  * @regmap: hardware regmap.
  * @hw: handle between common and hardware-specific interfaces
+ * @div2_hw: fixed /2 clock derived from the CMN PLL output; present on
+ *           every supported SoC, but only IPQ5210 currently parents
+ *           any output clock on it (every output clock except the
+ *           plain fixed-rate xo/sleep clocks, which stay on the main
+ *           PLL); other SoCs' output clocks use hardcoded rates that
+ *           never depend on a parent
  */
 struct clk_cmn_pll {
 	struct regmap *regmap;
 	struct clk_hw hw;
+	struct clk_hw *div2_hw;
 };
 
 #define CLK_PLL_OUTPUT(_id, _name, _rate) {		\
@@ -362,6 +369,7 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
 	struct clk_hw_onecell_data *hw_data;
 	struct device *dev = &pdev->dev;
+	struct clk_cmn_pll *cmn_pll;
 	struct clk_hw *cmn_pll_hw;
 	unsigned int num_clks;
 	struct clk_hw *hw;
@@ -388,6 +396,20 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 	if (IS_ERR(cmn_pll_hw))
 		return PTR_ERR(cmn_pll_hw);
 
+	cmn_pll = to_clk_cmn_pll(cmn_pll_hw);
+
+	/*
+	 * The CMN PLL output feeds a shared, physical /2 stage ahead of
+	 * any further per-clock processing (a gated fixed rate, a
+	 * configurable divider, or a rate-select bit). Register it once
+	 * as a fixed-factor clock so the output clock types added by
+	 * later patches can parent on it.
+	 */
+	cmn_pll->div2_hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, "cmn_pll_div2",
+								       cmn_pll_hw, 0, 1, 2);
+	if (IS_ERR(cmn_pll->div2_hw))
+		return PTR_ERR(cmn_pll->div2_hw);
+
 	/* Register the fixed rate output clocks. */
 	for (i = 0; i < num_clks; i++) {
 		struct clk_parent_data pdata = { .hw = cmn_pll_hw };

-- 
2.43.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E36F3AA9C4
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 07:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260483; cv=none; b=nPHHb42nkydCSgc++Ah/z2MIOdwsLT6gP+MWxiikYJB7VKmScITDJ1GVT9JOjlE3vMH9yrQb7pIaP4XViIgKnkY5jnVQHFCrDN+06hsOyadSjIPdGW2f5P9TY0lEZ2DFR81WwWmGpTXjbqTCtnrEbiyoJ5ObyICM/BbsfBlccXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260483; c=relaxed/simple;
	bh=8BR4rtVhwYePx7OtiyyvFiqv1zeYmDvcmqStXzdoc6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kdOfUXBK5vmKlQ2xixPc0aDGSkeYemEYc5gj1cBAbT6HwjS/LTBdCpukDV6o/Ta8rR08nUNP0EvHBp2+pzaB6zwgw+1LSPNhS8Yyshc3YVKtWBq2jP/eEmqKNM9s9RPJ+sijF1VNFJpAn3ZQPneAGQDG8LdJvI/KxroazEx2Vck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rq4Oqh0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AM763D6X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rq4Oqh0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AM763D6X"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795cidF1902714
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 07:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yIm0jZKXauOTDvdwqOD46DoyhqsTr6m8BML4p6crnEQ=; b=Rq4Oqh0bjk9alcCp
	SzSl0GW9LFJKQDFyd9i3tae10bor6flIZJhYjmGklKEkHb+9774dxDcOcCf9/78a
	7cfCeJXA1C2SXBaeuW2ZlqHjTAYY3xNWy0amYZ5/eSsTHVfY6n3Z2Pml4kIhzZ6K
	CF+g7wcuxURZTyWurPQMFd/nz0ao2+G8rINDIvojHzCpb69Jpw/uTlLWLWZZHfkC
	KU5x7O6ldRQPYnZrHIaZpw0W2JEfs0J8iii1Ms44RtijhRMwS44YtJ+nSFHQQPYN
	SyvCrJacFqQ5KPQ2P8kNowjSnYpsWeO6EYzWrDjhltJyiPjRlssNYsvoL4jWnJbz
	uEcm9g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvhvafn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 07:28:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb92868263so1153677a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 00:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260480; x=1786865280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIm0jZKXauOTDvdwqOD46DoyhqsTr6m8BML4p6crnEQ=;
        b=AM763D6X23Tqr6YcVYewDDU97+cOKPNNnrWJFj6jQEL8qznrhoBaaEfoJWAF4oSuBm
         SO2JCFmH5+nUbEWbv+jPJYk1etMKNHJrctYYOBL7izBLujph86BRbc18M0c2EdEWlhz6
         aSVF1wCPGog+uqC3lZpfDNZKGC8I/eOI04pI5K1oyiMcb6tHWHj0xFxRDw+oeCENBY9r
         lv8uDTZ+gbXhouNVwHIvqvRlNnO7s+jJRSIljgBW50HqdmwowUjHZSdzXB3PuPJKphyT
         JlcZO/LNhXwsPD6toFnGHRKmyCmzhdXOEIrV/jN80yAOOLZTe0mGlpbNiHnH8Q0ZgkLD
         +kBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260480; x=1786865280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIm0jZKXauOTDvdwqOD46DoyhqsTr6m8BML4p6crnEQ=;
        b=o26VfvibAdzD/K3ROZNNguDZcfgki1OWemT5SzyfeQ4BO8/zz3n2tth60UOATKcEWU
         JLP/sloHvZAAplGn0pUxjdbCQGaQsml4SvRamNa1Gaop93WQ/VTJjUscP4nsfFbjJQU0
         LVzLYaEXu0zYsL9bQTAf0HPoNSvmykZUBUZujU1HkwvoGton7P/ySi3Fe2QFrXV+GaHx
         DpPaBiZOZdJYghyuGPGlntmdZWtcfvAuseWYmxU1DYNzyFBRqxydtak8p4v3PCkGM2lT
         CZQr/7kgK8ZzDVmYdDh9UcKMr7mbQxZal/7e4G9eJ/2HcGYwHnclrDH4FykARWUbd6C7
         VVjw==
X-Gm-Message-State: AOJu0Yzwcb4RjdfnvOYOMEoZ9R7vOCQVHc018Qwm6WOrh4wwxm66N6vM
	QqYtVilU1hzn0bi8qlpzGB+k61DXR1s5ROXwn3EJhtNdZtEVc/+zd6TpbO2baAbI0N1GSFCkxYZ
	e4ol6Ckwij/vUEzJS9v3p7iG5ojS39PnJZDmleHMZF7LjtG9yqip6YWDU6VVnuYuDDg1t
X-Gm-Gg: AR+sD12RRaetB3uWKr9YIYDHtN/nY7ghmb4/R0JiTbWQulyayXVa8slGIKBmIx69ZLp
	2g5dhoVJoFSVawfLLZk1RRZCeDPkbBEdQtTZpCo7XmMp+ciPeGmWdKNJ5wBjPJ42UvZmppdnvZZ
	ZY831gNlMeVbrvQQu624q3G7Sv3AV0PYR9sMId7iGDGIiQ/6C7+DCTZWgKAaxG7//wvPXOVxbXn
	34iyl/lEkEm/33Ce4o6P+prMPO14leN/qiXiMHbt4HqRn+LoWSZUGRxx7IBJujwN4ZdgLQA+ROn
	yRpENsxQ7BnI/c19My9Er52NWFcHSFjR2HvuuoeJ5rsprCdP30NtYG/TCKOq6c9zkiK0Be2grxk
	i5Q502sqQX4hqk0W1lSfRtGdw5v54snYsPCR3j3JBkX/kS+MyeddCB2yW/K0PF2A9Wbpnhr/vHy
	QRkPohZSAtk46LvtbDSoRkgwk=
X-Received: by 2002:a05:6a21:485:b0:3c4:3b16:2979 with SMTP id adf61e73a8af0-3cb85f0397fmr44015007637.30.1786260480336;
        Sun, 09 Aug 2026 00:28:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:485:b0:3c4:3b16:2979 with SMTP id adf61e73a8af0-3cb85f0397fmr44014968637.30.1786260479773;
        Sun, 09 Aug 2026 00:27:59 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:27:59 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:04 +0530
Subject: [PATCH 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-5-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=1953;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=8BR4rtVhwYePx7OtiyyvFiqv1zeYmDvcmqStXzdoc6M=;
 b=oM+orUQAPBHzZHp5jc2/qebVjZZltxDLCGWAQfXWkQ6aLU4WvkutTSjn5WVErv6sbrMedwMW+
 Ik07bfCbxY0CLjMcgWq/nD+skzV7Z82JetCFKudS4cr/LqMJU+NSoky
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=eqbvCIpX c=1 sm=1 tr=0 ts=6a782c01 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=81ep5gnlwPa1PUBqnVYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: wDNyKsTUejmUyboNnSdfSkwayDjnF6dy
X-Proofpoint-GUID: wDNyKsTUejmUyboNnSdfSkwayDjnF6dy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfXwwrVYo7Bz91G
 jD3NkA8ZCanCFsO7vmYu/6IP2KNRfGjkS5Kc6+uOCxNcbnR8kvrJPauwSQCtNamaNelmaz39NLS
 ty72JYqtUjKPdCVdNAXbhc7omxiQtq8RBD9xY2No4HFaIn/YqQShcQAYzwMuHiCOE0b4y54OOn3
 h49xxjViLWpvJdSPsAnYV1DDs6niHQg068uRN135yghEmq8+u+gSIYPJCt472mrUGXNVd/GjFck
 DEutmg6tGPV0AJaUBeLGCkNA3pL3pcoOKDmKhgAjC6GFbCVw9gMP19GVsfTZDycntNOCawdISfs
 OvwCR6YJRqRRHjJJHRkqd/HKwCtQ1MQv/OQSM+XVKbWLjWWqdF2ei0X3K6wNUZaDoFkLOO/1Z3G
 8z2eWivK+ikq0e9w2SSlUCs5wy9Lmn5KsUT6rs041uPTb3NAEPCiDYGXSLQQ2P6kj6I0M5hS5Zg
 O6I1TxTRmhQOblNGWZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX5dQaD+1IvC6l
 THC7Z80usnA85jR0QRqvtT2tTSb96kZ2psJt0y63Fo+2o3MRRV38edyDvi/aGz1cj+WXqzcJUi6
 4bwu62hxfufzGOxk/lEVAXmy6ddwmFM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090063

Add the RPMh clock description for the Qualcomm Kuno SoC so the
qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
always-on variant), the QPIC BCM clock and the IPA clock.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 6367b2a5a4e0..d8c3a6b12d4a 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -943,6 +943,20 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *kuno_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_kuno = {
+	.clks = kuno_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(kuno_rpmh_clocks),
+};
+
 static struct clk_hw *eliza_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -1103,6 +1117,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
+	{ .compatible = "qcom,kuno-rpmh-clk", .data = &clk_rpmh_kuno},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},

-- 
2.43.0


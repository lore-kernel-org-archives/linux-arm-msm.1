Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08C5470137
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711720; cv=none; b=ny59kLkrwUbvXR5qfLliunuBDZQi6zI6OyAV+4KJ88n1LYOx+jtYFKKU8UR28fborx7+JofxSrDhOf+mVhqO4nGDA0wJW+G09CG/4lwcIijjZ4IhXSmi7WOxz9+HrwYl/nSm3oj1Syw2MMQMdhpM2HlMo+P+3pokByXOFOnRZc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711720; c=relaxed/simple;
	bh=xb7jRYlB1XJZ2ikl81tfQItsu2u2gXXfn0VCM3meJ4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l7Ktp1s1HX0E9MrWgJWbIBZiidq6n2+RwfafwgGie8QMHBGeyezNrCt9omHQHGuHX995kZK4sCISP1mvDsSxT/yFzmi1T6h0pF/0SO0Xz4bGpb5gr+CE1uFASzKApBbqfIsqHuEWOz4bOeR3SKm6MYLXwRqIGW4fQImlzNiUfkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qy807JTj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hwIyeH/O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qy807JTj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hwIyeH/O"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAbAbW1099510
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 12:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ZkRewFnc/202mmz0z02y9mO2uNrj17ROB+iEIkeogo=; b=Qy807JTj0jirTGJv
	7VZ5lXgIyfMKWvVJ+yw75DlCaNM4I0luQCydjI3Nf7M/IVGR6bbWe9lXu2WdvPrA
	I9y8KtX/IxVVh63wUodbtHOzi+q4Yvk1kQiRji++nNeFrGEpeYepVQv378Jf6kmu
	hxgMTSo+0B2mGvJPhWOV7ZSc71E/P4hnfpq6hrUVCuQlE7f/DyYJnQUfXCchJOOW
	Z3Bsxdc5wPdCbf2hjXzEpDnWIO2Dn8cE2t6OkBMr/WJmz/5WhAWkYcHA45637IeP
	DtNl8k2tiubfSZ+TGXg4n4B1Eg//322W5ez5WYAcsAUM0UlGUA4r2tDuJH1vCInV
	NMGJcA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20tr0n0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 12:48:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848474825ffso1273653b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 05:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786711708; x=1787316508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ZkRewFnc/202mmz0z02y9mO2uNrj17ROB+iEIkeogo=;
        b=hwIyeH/ONVvkLIGR7t6LG4BNMOHBTukzOFDWhakHAW1Ya8QjjQGXyIIKbLK8yTZqtW
         6kujp5kPAq13XRmDRvYPRInzPksx++TD3UeEwO0tosnrjdw4QoXdcEIz0RSYAPVC1hwa
         fRM4vniejRaD2JKfOBQ5iCd4rRB5Lt/gjMmIxKsSm/e64r9GSkKRkU46iryIhZjstoM9
         KVPCmMQkrD+55ejSiAqD4F15Zelm3KuGwr5DaSxv5nCbNP6C0EfkPthzypwNMECz9UAV
         HX0ZPt7Ru/A5fkznPrxR4/qag6vVBwyVY43cxJJAlMmQ0Tob+WqF/mQgVp9ieWTx7yGS
         epPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711708; x=1787316508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZkRewFnc/202mmz0z02y9mO2uNrj17ROB+iEIkeogo=;
        b=XRqCQHFfAQwNhXmDm2qZDauvLJ35qQkX2GhTqgSpRHqllvkGQE8nK0ykkjxyG0biTI
         M1o4u1BaWnvyaTX1hI+ax5KTIwi82o1b99gu5rqko/M24sWE0k5u5/6pLc7DHTepRgst
         cZctlY6LEjl/9D5MGwsqvTjHf0vp17WBVZX9fmGrPPq0arsBLPJrKe0vp9zujPv2ZA5w
         m+GGTDYf36gVSNnK/f2p1DlQkr+MB4f7Ay1xkauI0j+F6BBTshcWChVSaYrI8aC/+XQC
         630LJ6eswGhqZ60F4SywGK3DtxNFm1A7x/CSC60NpdUbFOtPCWhSKsffuJHhipBqhjhR
         SQyw==
X-Gm-Message-State: AOJu0Yzj4GeDzFl0jEbaFLDlmTprUhyAF54vpuOWsU7wEKHRlcMVIQFx
	WO21hARyU+zqNELk1nDcmNBJhM714xA+d4nn7+IkfjH2m13RqRC1RMZqh7NwfkOCbPxZb4641gY
	vbSymGvGwvcA5fMeqqRHlck9GYnIl2nhvAhr1LP9HV/IBcO+I86hg8rcPvhLlJtW964u7
X-Gm-Gg: AR+sD10MzCtS4oYanRVCYUghmfeQkgAL/otpKoXO2kobzBN7HWDxTMqw5kT6PLDGisC
	eU17Re020BdmlRmN4bgJssCuweVcLC9DGzFWCq+GlVrqBH/9d4JZyl/7DYJqxxg7R9xyjrydrPa
	Mxwh/jgjTjWDJb3dAkXoM6KnoSjYX48JGWhLg5oDrIFuPp7jQ5ycVwUjQXi7oy3bHYdyGbsyqnx
	+OiXD5o+Rg0Wbp+5ivHultJSS8Qz/plug1NhyCY0JsS+qOnxNdJqGIfKLT3DmWV7Z4WJdZO3sCB
	mGTF2NFi66++fAaFsJKNIv3QEnqCBTOwvJxquybgZcGqcdEBFmbP/1dvEQNUGYf7jWoLoXD3LHE
	+WWd9TL2KtaTWURZLgQlPuUhUamnGpVma/PPDPUxpxVk=
X-Received: by 2002:a05:6a00:808a:b0:848:2a69:97be with SMTP id d2e1a72fcca58-84fdc77ab7dmr4889108b3a.10.1786711708500;
        Fri, 14 Aug 2026 05:48:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:808a:b0:848:2a69:97be with SMTP id d2e1a72fcca58-84fdc77ab7dmr4889060b3a.10.1786711708056;
        Fri, 14 Aug 2026 05:48:28 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26726bsm405934b3a.54.2026.08.14.05.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:48:27 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 05:48:20 -0700
Subject: [PATCH v3 10/12] clk: qcom: ipq-cmn-pll: Add all output clocks for
 IPQ5210
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5210_cmnpll-v3-10-21c3db378611@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786711693; l=3700;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=xb7jRYlB1XJZ2ikl81tfQItsu2u2gXXfn0VCM3meJ4Q=;
 b=n0DlPjFFGX3HvHXRcMoCS+2Ph0MK5Fa+6Fwd5GLyd5rFVCT+RxYwKoztPSpkg08XTSRs7N7WY
 6qHGzerujBuAAr9SenhtIhWnYXILJ5IzLAKMy0OuZDb0nLHUmG0Vf8Z
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: aUU-eq83z9trLz9V1R9-me-N_KNy4481
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX8s6SVZsgisXS
 ZdtLN+xK/uRnP+b8stzyl4vaYIX04r0gE1TGfd7P87Pjq75nOzJtfsmR1N173Le75z/uVSPUIsX
 u1C/4qFyGFG/H34m/8/P6ehnIfsOF6RP3jjX7YjHkfgE7uUKkPQRFXDExmjVXVyM019BEEluzec
 ab96sJ0gQvMnWWMz9bKPwsZT+0ath0gbj5F/3FDL0jIHp67LG6EiXiKp8nDISPXjdguhrRrrjZu
 D6NCC6Mnb2qKb+Z9TpUFnYlUb+Qib69S7zRAUDaBniMi9VEAB7f+sbUUS3rsYSlwdyoQg6FQUWq
 mxbOmOMh6ceDJcGHChTMQLb6mjYbZbJpyM/Q4MTJ6oPSUKXyPh5gqjacXDc0UcNkxCfFmSNAaTU
 9LPg9C9/ueWbImpFZCKPr/2sFlU5pj06c642ZcmTb26uM8pqgbhxkETWBrjXgNpdNMc8mx+4FF9
 NyJhLe8zryxCG/lC+4g==
X-Authority-Analysis: v=2.4 cv=UrdT8ewB c=1 sm=1 tr=0 ts=6a7f0e9d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=P04cmAjberRrbCkX5BgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: aUU-eq83z9trLz9V1R9-me-N_KNy4481
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX61I8QpzxgOZw
 ZWRnZC0/r15C7Kxk9M6lqsO/a3EyjyPK+Bh5kSjuRS4f48skS69ELNmPy6JdmDIeiqBaY2hrSNb
 bpncT3G/x3HZjSaMHNBrRFUoh9pZ9v8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140097

Add the IPQ5210 output clock array and the device match table entry,
wiring together all the infrastructure added in the previous patches.

The IPQ5210 CMN PLL supplies 12 output clocks:

Fixed-rate:           XO 24 MHz, sleep 32 kHz
Gated fixed-rate:     PCS 31.25 MHz, ETH0/1/2 50 MHz, EPHY 50 MHz,
	       	      ETH 25 MHz
Configurable divider: NSS, PPE
PON reference:        PON (enable/disable + 8-bit divider)
EPHY-RAW:             125/312.5 MHz select

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index d5eddedd01ed..6234e7cf3f01 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -55,6 +55,7 @@
 
 #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5018-cmn-pll.h>
+#include <dt-bindings/clock/qcom,ipq5210-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5332-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq6018-cmn-pll.h>
@@ -189,6 +190,18 @@ struct clk_fixed_gate {
 #define CLK_PLL_GATE(_id, _name, _rate, _bit)	\
 	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_FIXED_GATE, _rate, _bit)
 
+#define CLK_PLL_NSS(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_NSS, 0, -1)
+
+#define CLK_PLL_PPE(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_PPE, 0, -1)
+
+#define CLK_PLL_PON(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_PON, 0, -1)
+
+#define CLK_PLL_EPHY_RAW(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_EPHY_RAW, 0, -1)
+
 #define to_clk_cmn_pll(_hw) container_of(_hw, struct clk_cmn_pll, hw)
 
 #define to_clk_fixed_gate(_hw) container_of(_hw, struct clk_fixed_gate, hw)
@@ -207,6 +220,22 @@ static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
 	{ /* Sentinel */ }
 };
 
+static const struct cmn_pll_fixed_output_clk ipq5210_output_clks[] = {
+	CLK_PLL_OUTPUT(IPQ5210_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
+	CLK_PLL_OUTPUT(IPQ5210_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
+	CLK_PLL_GATE(IPQ5210_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL, CLK31P25M_EN_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH0_50MHZ_CLK, "eth0-50mhz", 50000000UL, CLK50M_EN_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL, CLK50M_EN_BIT2_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL, CLK50M_EN_BIT3_BIT),
+	CLK_PLL_GATE(IPQ5210_EPHY_50MHZ_CLK, "ephy-50mhz", 50000000UL, CLK250M_EN_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH_25MHZ_CLK, "eth-25mhz", 25000000UL, CLK25M_EN_BIT),
+	CLK_PLL_NSS(IPQ5210_NSS_CLK, "nss"),
+	CLK_PLL_PPE(IPQ5210_PPE_CLK, "ppe"),
+	CLK_PLL_PON(IPQ5210_PON_CLK, "pon"),
+	CLK_PLL_EPHY_RAW(IPQ5210_EPHY_RAW_CLK, "ephy-raw"),
+	{ /* Sentinel */ }
+};
+
 static const struct cmn_pll_fixed_output_clk ipq6018_output_clks[] = {
 	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_CC_CLK, "bias_pll_cc_clk", 300000000UL),
 	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 416500000UL),
@@ -995,6 +1024,7 @@ static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
 
 static const struct of_device_id ipq_cmn_pll_clk_ids[] = {
 	{ .compatible = "qcom,ipq5018-cmn-pll", .data = &ipq5018_output_clks },
+	{ .compatible = "qcom,ipq5210-cmn-pll", .data = &ipq5210_output_clks },
 	{ .compatible = "qcom,ipq5332-cmn-pll", .data = &ipq5332_output_clks },
 	{ .compatible = "qcom,ipq5424-cmn-pll", .data = &ipq5424_output_clks },
 	{ .compatible = "qcom,ipq6018-cmn-pll", .data = &ipq6018_output_clks },

-- 
2.43.0


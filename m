Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9746A1E5B64
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905230; cv=none; b=SOP6kTAQsE5UZgekwzYEp0NSXdII4wLuWOu3b9QtY0S2+6EgODFU09xQ7QzYMye0DUIY2PyRezKFb87/OsIt3UegJro1L/nOqbkaVgCqMmTYa2XOKGfvWXvufmGlr/QOSwlOv+eJulnMkV3cDz87axzJs4cmQ5G4ACh9Y2MWSeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905230; c=relaxed/simple;
	bh=DqJuOV/GfzjgmUgcYK2yXmABHWZdkEen47SlyOIyCNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tj04yCQwUtcKoDnO4BgGTrlhwrpT8h8zwY6DHC+edtz+sLGZQv7rUCTTLt0VUzk2oEe0UAXALkzMmKL+GDPZ/DFGenfiySD0eMo5xJTu6SfyNXIik9yJF4PcbGdpY7c2hpdNwCuMPxNBa78EBkkerKHNy0ll43qx8wEqdAah91w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBv/lzsX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4nXEzpS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBv/lzsX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4nXEzpS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbES93089466
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JT+eLCrf0c1leO0aAexnGhyLa2ROrC88G1ZCfe37suw=; b=TBv/lzsXEEpQCVHI
	CUybqKqgxXfQM0QfC3dhLdQSpSvmgbL2U3tdVB0j6UFv2eH6InCARPEz0WUKlUoY
	gG/7sGG0AdQBpCet8zDai8fHfCAtz17uIvm0uz7q1dVSzAuMw8JqEpwhBrdok0ex
	uy/XBEl4XJDfiGyN3vZ5uPPIdlv3rg/IurffK9MY7pJd+hmGqw4lR61NVDuqqOMv
	DSSaHJ9iKwWRfgfBeNbl86xZ317EPeKKjSs3BMl6k7MWruxXYJRRXNYIgXxoPMuo
	YxcmgZKpYPdz03otJIhg6kJJjZ3oqA+LqeXsvvEnDsuFABnPOkp3FK9HtEcXfvs2
	gfpIEA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgggbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cec4226c70so9236755ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905227; x=1785510027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JT+eLCrf0c1leO0aAexnGhyLa2ROrC88G1ZCfe37suw=;
        b=G4nXEzpSJnb3DqMxubvL6fMff1DTEaCqgrRbd04PvHZvAyMR1lm+kOpm9aztAKV2bB
         no4SsBAvCItuDysdDbXypY9s1jQDwLpyvX4xGl6RB3IwsE/uxZc1Rp7FMCbS+PQMH52S
         Q9r4ENgPUH7uS+fUNEpX3FNOOAhNwP13Hp/XZFl5tXpcP0Bljd0HCIBbqTpLb73v8+1Q
         BiKoha+iJyf++iSP6tODXjIcn7xe30sdnjBEmi+GSVTOTyLIFm0aT4IpwAlSxOzi62Kd
         3f7q3VAeeIUZ916RTsAwf64FnJ+D17oCBfgYBgSwqGnaH/PlEc3B3ORvXJzVXfvTt+oJ
         Elsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905227; x=1785510027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JT+eLCrf0c1leO0aAexnGhyLa2ROrC88G1ZCfe37suw=;
        b=tUKt7wonvyOol+mFaz1lI3/HUSEhQRiyhp30v+78jQdULcW0vFnG91HAfgpNvQ8t3P
         4e0E2Sbi3j1r866mXsizIao7JD/4l9z8AL/R8Nt07Hj2CUhg67jsnYquIHnMLEAb3D71
         a/u1/9pfepoGz5kQqNsaHNLkaXxiz6B2sTcQS0RbyXHYyQ1+tqlKdTkEczlZoEOU9ghT
         b6ajVwV75+G2POunNoxDSa0OyY73M1Dmivyz0JJy/Lk4UYInGhAsWvf/9UwOHznks7G8
         KWMfxM3wR2lXxmtOIeJuxQzIYmN66yeszqE4gH6D2y3aVBKwraxTBoCszlTY/qCXWFPQ
         quUA==
X-Gm-Message-State: AOJu0YzaAd3JuJINjLYobhePQCxng8ALtptMLca1HV7qk+CPd/alR7rY
	XNw+DH5i+OB/v6UJgeybChjwRT+9WrBV22rqOSmS9UlT0uIfhQQQR+5c3Z6M3vSchZKUCNuSlto
	yHC6OJTTrO3rGRWWz3XB5gPuPtsoPhklPj6x/yiUzSOqmnCXCxLKFstT7xnWdZXyiGkLi
X-Gm-Gg: AR+sD11RthJHEJhnRrWoRhrio5yAza59XcQ2tuxLb/iSuwy/+X0Oa8WgZQ8XmoWFiw4
	Ci4zBXEX7pgjIJ7Aq1fzdeN28+/u0tF37vfb5r4KryZV36+SFyM2IZsBeVmiEH1QKQ16xDersWz
	vGBC9K15YMl0AIkMKL/xwu9IN91UyrUuCTdB4C5v74Y1y8MYY6fTz3hltmgKDwGuanmY4zlOyBe
	Vn/9B73GI5vIAVdgkgStAoG9F0epOR94hc30esnlv8nJ9nIhU5tiZbqa7HdNlts1WTnlUi155YR
	JsMJIA3n7U2DkqoYH8PzntEBgwJcIP+lqS53XkV8cXZYXeTFA1Fp9PdXBkTZp3itrip354txcYZ
	GTVBr9rFfG1SFdo1KUfY8LfrvFtySOLEs+bPZ0h7Ga0s=
X-Received: by 2002:a05:6a21:7303:b0:3b3:f46:1efa with SMTP id adf61e73a8af0-3c44b18ce94mr8154493637.42.1784905226995;
        Fri, 24 Jul 2026 08:00:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:7303:b0:3b3:f46:1efa with SMTP id adf61e73a8af0-3c44b18ce94mr8154427637.42.1784905226446;
        Fri, 24 Jul 2026 08:00:26 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:26 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:23 -0700
Subject: [PATCH 01/12] clk: qcom: ipq-cmn-pll: Use
 devm_clk_hw_register_fixed_rate_parent_data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-1-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=2855;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=DqJuOV/GfzjgmUgcYK2yXmABHWZdkEen47SlyOIyCNs=;
 b=CszzAwQHyV2LxSb+MI94lZAbB6BzV5kYZovqbPvnzvbfQJILWHX8TUww4jdO4egkurl12hCqh
 diGdeDFvY21D7+uwcMrca5hXrzPnYP0AIMgZ+rELhF5LKcSUvKnxBox
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX/uB3WlN5WRGa
 /pqCx4Ifk1cID+YDGJe8XZY2E7jHfhS9xvy5n5SyKj0tRvzgLXdesKXt2N7RQI38wcYxBSv1L87
 fgzBR31rLNGKw3rKUQ5OTyabA/N6dv3NLIFqZFG/VIJZC1eH/xndWOHdo5zIlJtzul8a4pQWE7T
 DghDqw37bSvZHUV72gGVCaeFMkaFm3XeEsgoyhnC5RNtzDAytUFx10krqBRb6thToiCgMC3/dNU
 cxds/Un2KPEty9s8gZe3Jbq42hu9bQKkbr/IZM2RZzzkzcwMPCipLng2GAWGxi+Bz+PKm3u63o3
 oHTvGYjbknHi4xSvqwgkpJ1lXRvgi9cJcc36gq2Jy++8SCnWmojxPXBGuZSrYBMOWnCY0lCh4Yz
 8qodhxNz3SwkG4nHYiz0H9unvtgTYgkNI3qglfzmP0wmqqL4Rnx+tVl5glDHoOkYSeK2TZq/Vk9
 YjCqEJrwEP+cmGbPk/w==
X-Proofpoint-GUID: NK5MRkrBfQ6NZqFfdHmG2rNBuNVrN8Gy
X-Proofpoint-ORIG-GUID: NK5MRkrBfQ6NZqFfdHmG2rNBuNVrN8Gy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX/3jtxXD/ZwQZ
 /62ru3l/APip7So++QLTCNPcTzK1zBd/jzpnR2ilgMRovp3jbWikjnHFQz/A43NiK7/9nKhiVDj
 2XQi5r4EFI6NVkyQhWstK8prbUgnHz4=
X-Authority-Analysis: v=2.4 cv=P9sKQCAu c=1 sm=1 tr=0 ts=6a637e0b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=abD0O5-mJzoiGkpUKuEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135

Replace clk_hw_register_fixed_rate_parent_hw() with the managed
devm_clk_hw_register_fixed_rate_parent_data() so the fixed-rate output
clocks are automatically unregistered when the device is unbound.

Since all clocks in the driver are now registered via devm_ variants,
the remove callback 'ipq_cmn_pll_clk_remove()' and the manual
'unregister_fixed_clk' error-path loop are no longer needed and are
removed.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 39 +++++++++------------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index dafe8c1738df..4fdf78f6829e 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -390,13 +390,14 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 
 	/* Register the fixed rate output clocks. */
 	for (i = 0; i < num_clks; i++) {
-		hw = clk_hw_register_fixed_rate_parent_hw(dev, fixed_clk[i].name,
-							  cmn_pll_hw, 0,
-							  fixed_clk[i].rate);
-		if (IS_ERR(hw)) {
-			ret = PTR_ERR(hw);
-			goto unregister_fixed_clk;
-		}
+		struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+
+		hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
+								 fixed_clk[i].name,
+								 &pdata, 0,
+								 fixed_clk[i].rate);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
 
 		hw_data->hws[fixed_clk[i].id] = hw;
 	}
@@ -410,17 +411,11 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, hw_data);
 	if (ret)
-		goto unregister_fixed_clk;
+		return ret;
 
 	platform_set_drvdata(pdev, hw_data);
 
 	return 0;
-
-unregister_fixed_clk:
-	while (i > 0)
-		clk_hw_unregister(hw_data->hws[fixed_clk[--i].id]);
-
-	return ret;
 }
 
 static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
@@ -462,21 +457,6 @@ static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void ipq_cmn_pll_clk_remove(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *hw_data = platform_get_drvdata(pdev);
-	int i;
-
-	/*
-	 * The clock with index CMN_PLL_CLK is unregistered by
-	 * device management.
-	 */
-	for (i = 0; i < hw_data->num; i++) {
-		if (i != CMN_PLL_CLK)
-			clk_hw_unregister(hw_data->hws[i]);
-	}
-}
-
 static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
 	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
 };
@@ -494,7 +474,6 @@ MODULE_DEVICE_TABLE(of, ipq_cmn_pll_clk_ids);
 
 static struct platform_driver ipq_cmn_pll_clk_driver = {
 	.probe = ipq_cmn_pll_clk_probe,
-	.remove = ipq_cmn_pll_clk_remove,
 	.driver = {
 		.name = "ipq_cmn_pll",
 		.of_match_table = ipq_cmn_pll_clk_ids,

-- 
2.43.0


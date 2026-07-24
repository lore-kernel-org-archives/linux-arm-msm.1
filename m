Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475C533D6D6
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905230; cv=none; b=nQAcU+UmXSkq6uYLaYnLUxSpP0/3TiqAbqPdOcrn3ysLZPsfMbMXCEHGFVZRK0wVNuE+K7Zc1MapTg3nXb1vOG9QNYXBaoun4ZS5GB2Yb/N40R7Fjy9CYY3saDnvC4M7jm94dqpyMc9/wb5FxN4hLeMwDFUYyRxKrNFF8B4/Adw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905230; c=relaxed/simple;
	bh=OmaK7bW37P3eyItSwg18nRl9g7bQTw6jSi8315C8gbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VKLKaVdLF6peMLlAWdRbSmJFdF8OSYOoR1NSxEgDIlTQ/H1Iz8BtV+GZnAyZfeYnvoqh/2f4x7+HqWbAuiyQ8djKSjvB7RWxP7QmQEKJd6yVxTdcqEiEXDYRmVBFN9K+qSUox5WCbGbz6hjdrSvcs6x1KZ4DX5z2hdhv7OqB5jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJuM5VtO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HPD4Rh6Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJuM5VtO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HPD4Rh6Q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbBDg3344429
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYw5UkdMRwpjTZEowMSfHMuoGLq532YdN1bxt1k3YXQ=; b=HJuM5VtOwNieIN1Q
	mg5m35zE7TYxBJ2QKSu/wF949ndlNMVwFGjEqDqr35hm63VS/sczCeE5WXSVngdB
	Vf/jd7qkyXgOvn8JQDPynRVu8cAY5geTRkcpqhHw2SNN42QJVEL4ONZUCZ2dPRVv
	5g7lzcuehLNH7gxL+LbWgeGE89ae3cBLrH6bSK365uqR0vcP5kco23l5ez8ROCYy
	QxJGaxDtSNil1lPzsAej8fKNk0N8QcH6+K33Y3yPCtchERQk9wQ7/wZbeUDHH6aV
	0xAC+Fycp4mMXwtIdltsawLvtZ7L6ZW90rvjR50uLEIBm9h5leUB6RChIWJwVQwB
	Sv8CWQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cf0gxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so9407215ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905228; x=1785510028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYw5UkdMRwpjTZEowMSfHMuoGLq532YdN1bxt1k3YXQ=;
        b=HPD4Rh6QBaGK05snemxBonzpE8G3g6YYnePBEUwDOQnKsOjVb75LjFR/9WkKhuQxZ7
         lnFKzFo532D8Ocjxl3hhavakacFs+f9CWAs6Ny1675c+xo8WYD7Sht1YAjZo/F4AC7fh
         lceR7BbOGugG+yWhaEl9DwMl34EFr6B9pNzUr9sPcm/yu1v72/BOGnKYs+nuoJqKd+oX
         EKDesfj+/nELYsTiIWb6zpALPsvXnTtOeHJiZ7ApIESXYlJVB6WR7V2hRIsoaZhqw4hh
         JsUl2sENg4dPw1H2wTZMQw1wW8v5zVrc9Ttr2rNRM1LNoKHesIulN8nJCadrPXbsa/Ns
         soHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905228; x=1785510028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYw5UkdMRwpjTZEowMSfHMuoGLq532YdN1bxt1k3YXQ=;
        b=h4jK2ZHRZZdyfFTVGS5ysw9Ofnj3TgwT2ArXAMFcth1LRF+yEBlEz6uOcqWYx+ha1Q
         3OWjdlCRGA+KT9BMTUpVpxXvSFKk0F4PV4+YFrIyLgQdXQS+WlMlmXrUOW7rMhtLMbpE
         gdpLwGPmTBGseo7eH0D+TBb0/TLurITSQjkn7Jvc18q6lVU+XQDPp8kJ1Bykj4slATOZ
         OO/ROzjDoZJP4wzro5SgO3FRJ90HPEa9vAxCdpBP/ZIPVcX8/2dfSYhsUJc85LJZ/BAD
         HNMnHvmSJLPHBNFqTcqcdCiTdqebAxtkPk3IP2FG2ZFpdjOrwITv/O3OJQxMKPhjIIEY
         I4Zw==
X-Gm-Message-State: AOJu0YwSrkaFskJhPETEx6oG6tRh+FvwTWj9GSIaC9+m1FhREVBhpVvx
	DaXRMU7h2wrTdjvfeegZCmYWBXRFvwqEQIC0Ap1VvjLiwT5N0C0ejvidyNrDKY403ZmNXiy27JA
	lSLNQgvi6AvaNY8GXgtcPku4t9UlciZ4pJssdlp0G+WmMqS/YCiVbjkffVfMTVTtWdRVo
X-Gm-Gg: AR+sD11uGOooD5Qy27w3f+qaQTIkKL/Zl3OU+xWhxX4PoC8vWoCpbPJ/6K3m86GZOaQ
	xg1rid2REBuioxhAPrtITBnLlTxx5wr3vZK2VG67QjhBPApPABc3ZreWzAd/9rWpo8AXHacH6jo
	mzTIhvqXZJpJoYfdQV36E2xyvbTC1QZUGq0zBmZUxNv7ApTQUrBLR+sYo4IeE+/d9TZDjDgafHM
	xZiCnjTmQbwWPYnCws/b86CNMmSqpFugmRDlzhMLPbaAb20PAKJ1cNddLGwLO9EIW4PpBG0GAQM
	J7GtIX6Q/0FW6Ug1CNkXh48DCJ70L6hq0vDlZDpQsdd6i5th0w20Q9IS6VtpoajvCJSKAE6/hNS
	DaEjdJlXg2OvRPol/pvC1/7ntx0DBSNGsEoxJlwIE4mk=
X-Received: by 2002:a05:6a21:391:b0:3c1:85d:fa2f with SMTP id adf61e73a8af0-3c44b1b525cmr8250340637.36.1784905227718;
        Fri, 24 Jul 2026 08:00:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:391:b0:3c1:85d:fa2f with SMTP id adf61e73a8af0-3c44b1b525cmr8250285637.36.1784905227201;
        Fri, 24 Jul 2026 08:00:27 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:26 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:24 -0700
Subject: [PATCH 02/12] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5210 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-2-a8b8679d215f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=2318;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=OmaK7bW37P3eyItSwg18nRl9g7bQTw6jSi8315C8gbI=;
 b=bzQYwQhEvEZbupdmcH/TYEA48nhJq47oGzxIKwEndpNo163MkMgnQ4AU8pCYukjEefFUuDhAY
 OuCV2B3G0JFA8vYvoVEt2V33aTsTIJf6rC1/JUToWw7PBEUvvsByOPv
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX/6yFKKtSBOcr
 mLJeSmsLwjIrzeYXqUBnrQT8HJFlSFsruJG+84V+4YONlJRKg5HuJS6c1JrugNNPzxmkovLKA8h
 vEIahZI7P3+6R61r9wF/gOTIkG2S4hk=
X-Proofpoint-GUID: toz626vTEO2LcLvUcrVyxzIVtXUdS5lH
X-Proofpoint-ORIG-GUID: toz626vTEO2LcLvUcrVyxzIVtXUdS5lH
X-Authority-Analysis: v=2.4 cv=er/vCIpX c=1 sm=1 tr=0 ts=6a637e0c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JRX5g_4sfBZTL3UlNIAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX5Wkyigxhy/VQ
 fuYvpv/EsCk+09LkWj97WoO7OEq3HNw12WS1zwMdrEULXNTAHZslBfzcsYftcExTmtMoG3Ya3dF
 fuqvBCFE6adf0fX07yvzYWZqo9IxtGs5ZLNTQRsCDVIU7MN0tq2JwXhNBK6WFPI/u1hapX78XZ+
 hyuWIQ0eewDYWtQeuoR3foTU/jiVGPijxbCZ/3kxznxzQlMNEDXPZDBSEphKnGwLiRkBhAS2xF6
 /7RkE4Ee/vRNTYQlICJDsgAvVQXQgAPEIyFJQ5W6RK6qWfgMkfsL3Kv3R6x2YpZlPaBEOVvr8S2
 zHcpVJYqGfaIpvx+i4S+JbaJO4RufA/Fb8HERdN28+1e7TN7tTZrV6+grjfv/b0JBXyoA1R3YS0
 QLlIPjdUegwdWLROK7Pej3cy/8zmkoZYIcBf+8UqW5TqAM1hy/sYrtLp39njMgCegN75bYwybIq
 tjrylGDOodBjzbJ50lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135

Add the compatible string for the IPQ5210 CMN PLL clock controller and
the dt-bindings clock ID header for IPQ5210.

The IPQ5210 CMN PLL supplies configurable clocks to the NSS (network
subsystem), PPE (packet process engine), and PON (passive optical
network) hardware blocks. It also supplies a raw EPHY output clock for
the integrated Ethernet PHY and several gated fixed-rate outputs to
Ethernet PHY and switch devices.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  1 +
 include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h   | 30 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
index a4f9af8fa187..91e17f126a9b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5018-cmn-pll
+      - qcom,ipq5210-cmn-pll
       - qcom,ipq5332-cmn-pll
       - qcom,ipq5424-cmn-pll
       - qcom,ipq6018-cmn-pll
diff --git a/include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h
new file mode 100644
index 000000000000..191589fd5311
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_IPQ5210_CMN_PLL_H
+#define _DT_BINDINGS_CLK_QCOM_IPQ5210_CMN_PLL_H
+
+/* Parent clock */
+#define IPQ5210_CMN_PLL_CLK		0
+
+/* Fixed-rate clocks */
+#define IPQ5210_XO_24MHZ_CLK		1
+#define IPQ5210_SLEEP_32KHZ_CLK		2
+
+/* Configurable divider clocks */
+#define IPQ5210_NSS_CLK			3
+#define IPQ5210_PPE_CLK			4
+#define IPQ5210_PON_REFCLK		5
+#define IPQ5210_EPHY_RAW_CLK		6
+
+/* Gate clocks */
+#define IPQ5210_PCS_31P25MHZ_CLK	7
+#define IPQ5210_ETH0_50MHZ_CLK		8
+#define IPQ5210_ETH1_50MHZ_CLK		9
+#define IPQ5210_ETH2_50MHZ_CLK		10
+#define IPQ5210_EPHY_50MHZ_CLK		11
+#define IPQ5210_ETH_25MHZ_CLK		12
+
+#endif

-- 
2.43.0


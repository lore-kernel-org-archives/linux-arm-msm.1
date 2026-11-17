Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905233;
	b=jBFZkI7v1AryfFnpFC2sMtlemygEKnNN0NisBM8yyEk4ZqNsJTnYYX+tcIz7CzWcgC4z
	 gExZ5n+8nv+JO3oDwmqUZPFsvB2ldqY+kgd8S722Y9lWKXp9GPuVBZq+KxMZQe481qOvF
	 JSVqDB4OYNUTnT7C6+Y5A/wGfSszZiUuz6WAqUuTxb1C0et7JH7jDxsJs7oXi8jCUCan3
	 bxnU5XzttimukuH/axAn3bb/mivTeaDIDS1fGtsDOy7rylkqJ1bJXwNi62dWB1PbRX+kz
	 FES+MalhZYWDd6fbkTWKp38kwude87WF1TpkcKaCunkfniX63WleZPp6qEgqjHSvB6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905233;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bUxU8PH1I9mJtRraWd2nqFJmyWXS1n0HHMiuvPeEeZ8=;
	b=dIJpW6Ql6UbdfGfzhYE1i5MxBG7fvKzoaGTZO2Qx9PAFUgrAstIaY3W0gaijLNiwIHZv
	 IMfeRLNTD+yWrxYRQ5vMrWfH4cz2gYfMSwAWg6bl83XiFth/3WJQIPelHXXNtrrk62QLo
	 cxMqfW4q7It3GfRbvioWzdLKo+rLDDesiiPLNRY685gk+IOhObUoWI0el3XFOvBF2h2ba
	 /9tOBKTy+9ROhw8EQU0Be324SCLRuT814qRQcAZ4H934ouTXFytO61avKjNZE3qGV9/A8
	 JGydnWYWIGJtzIb1oU0P/1mosDvVaDFpeqbYklsuy584gzwcCsgsMrZEUugZvzNFg6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dSUV6kj+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CT4qNDOh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE05606A330
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE05606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dSUV6kj+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CT4qNDOh
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8iiT7200048
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bUxU8PH1I9mJtRraWd2nqFJmyWXS1n0HHMiuvPeEeZ8=; b=dSUV6kj+gygW2NVZ
	AL+MOFizMxnkrzsXpa1s/Mg2ksd9/DLQn6cATmbzC0KlIKjPtjuMlZQQdSqPC6VF
	EcNBKkWWgqRs8nctPmQQ6+aaurHjs8pvLd9UI+HxrmPVA7T9TfKxBk/8vEPT5Mzh
	GIOCh28DBk/tmyjJxZg2G/ovI8JmHUIFM7XADEWYqXtCmtnwsYKHAtMRbwmBwquO
	rhZ3zxN+Ox8ynWnmAMlzAqk+gOrVjHuaZmRL35RLrI1VA8rGbHMw7UqjAWSuewfz
	iVclF50QzZf/3HmtneF6pNvuRrvG+34ipFJiwR1TeaGSTubB3om9dU+qFZWxGxrf
	mDAhDQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038mbvfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:47:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3a74ee77fso690280a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 00:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905223; x=1795510023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUxU8PH1I9mJtRraWd2nqFJmyWXS1n0HHMiuvPeEeZ8=;
        b=CT4qNDOhn998Kp6Fp9j8Bmg8ebSEYIfttxRyeGWmQdVvP1HYQmw9FePn1/WY0IH1gi
         wZfoQDoobbx1FnZkQC4mg6YIJyblg1Lw4GSHfCbBvrLsbA71YPAAY/jtRGYiPBKKsrfF
         C8MxmmP5UmI7S7Veq/3J37Abw+O6jow0SV5GJC/lBrX39w02GhMBF5ZBfP7NWYX7pVPO
         ENd14424sRqLasrZ20fNwQPGRb1qexxf6VmAGkLIAkYj7VBMsR3HwQXrXSOvAyVEuIlb
         WZGe8/b3A/QGu6S/Mvm/wR12BBnp2JtPuBsfVtBC2/PfigaK8KqOXVEM3TrXyqib6wgq
         R7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905223; x=1795510023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUxU8PH1I9mJtRraWd2nqFJmyWXS1n0HHMiuvPeEeZ8=;
        b=0mMv6niqNpdoyzZsjRUkuyIvfdpdpNr0aJ8/xrbPMFL6J4y4Ikkhuy7rY0gpfqLK/7
         uRa5awXEA9gA5kvdhyLEJe9lYvFEr6AHScvUEAcv3qAggKg+XtJoHAcCLvxTb0o+Vtaj
         631AJEOqU3BKpUQ4sV649tGWWni8sOr1B9aq606487AOo5VCHxo8S4ppNoDX3bkkxkir
         qAN37e5r11UF1paetkcZlZQxo5KEx9x8J61LrZVb52wsvx7ACGZidVrnCYsXZ1XqLfYI
         pCZLX2TVOVoPza3VOlFZfm4JYc9ihtMVmj1MH8mwvRsR3iXa2RrEyteZ0l3K/wtlpylc
         hkzw==
X-Forwarded-Encrypted: i=1; AL+hErFSEDjOeSGCecw2cAcOCmZf9P3BM7hPpJNWxEOAk7RKnBuzPuQQ2xlYQhc38gNtXKuS7eohuvXk/Mdx1/lI@vger.kernel.org
X-Gm-Message-State: APuU4Z/AjZEmRMjE4SIYQEPCj52EYAlcInj9SoZ2Y7BstyfpV4nBN05k
	OmIOv6fEIEnkIdgiJoWdxhjJq5jB4O8IlU6oS2zb+9imI1f9I8iGnec5ScXEhoDY8JCUTB0lGM3
	5hSSuzSur9GX6DgePzaI5g4HRsX9K9Qi22CTX0b4Y8SW/m9hz1L3rzxfXWE27AHb8feZB
X-Gm-Gg: AZFdTZetf3E/WBiiMIOmcFgDdHi8ryZ04mVBZQDZbHRHtgQ+52CuhxDu3TxAQ14lKmG
	VlG7myNBoJ930KoHs6fSWEI1ggyjeAR0v9LniRwGJt2X3c2ZqYGZebHaceAmgDTv3O2AAsGQ6s2
	LA9mCI30Hd6Vkiv644LNEozSinEt4B1nzuGYinR17DwyXguHso/hYNaaDKdOifyCHFXO0ep3l+n
	tO6N6ecCSLTwZksiJO1Y1mAcyw7mIuK6hvVcOzyLkXFGAqE11WzBiMNyioy8as7c/PkL8Z7i0tc
	KeVfUcZUIlT3eUhMdAmVgpjFQrNmaVJKcoUaSIVkEGNNA9pTfNpKRzmVjvzaxF9TDepTn1O7kfU
	RsiTnIMCCtjkhRFlmg3VNADN7GP+O/3V5wsvopPPl+T6BnrPhP+2L2krToAoT/LgTseGlPIyFCn
	AOuw==
X-Received: by 2002:a17:90b:5585:b0:3b0:ae41:2711 with SMTP id 98e67ed59e1d1-3b1b0a12f15mr11754441a91.24.1794905222463;
        Tue, 17 Nov 2026 00:47:02 -0800 (PST)
X-Received: by 2002:a17:90b:5585:b0:3b0:ae41:2711 with SMTP id 98e67ed59e1d1-3b1b0a12f15mr11754401a91.24.1794905221742;
        Tue, 17 Nov 2026 00:47:01 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:47:01 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:28 +0530
Subject: [PATCH net-next v4 08/10] net: stmmac: qcom-ethqos: add
 per-platform NOC clock voting
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
Message-Id: <20261117-shikra_ethernet-v4-8-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=6563;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=ydVlH1qQv29heCiLhOkMA2wLLBxXjI79R7JegvlpMfw=;
 b=S/5GLz8zAvWfZjdeL4Y7hB6T3Un+F6NsDm++mtLCc4Thra+HtC1v7ZXu6nD5gB++5SjJzuUT5
 COIwI8lD57CAITdb8xnFUigaVPzEgyr7gFO6r44/6kDKLzqV1ZoDwFF
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX2QXbG+CbIw20
 XbYu4a4JcS32luvJ07Lc6ntJLF5I1ZL84QPwp4GLXC4tZwhv1ZciP+lTLmwRtfiYT9HP8Lngn3I
 jdj6iVf3kyaTdnWzhUKGnFAjG9hgR+DqWmT7/NQCtaRL3gSJvI3wMg0HKRzYlA0oRVbeOhan9aO
 vcr6Whb9DQhCY2ZcKtCnCNL1L4JhN/fGm22DO+zT1jW7VbgGUQzQuU22NjPUjTMAwcAN1Yc7J2y
 DlbfrFwLTu1rwxbCbezUJYTZOi0aUOBToytWSu1r3JDssV3YMW+7Zw7e9Yr+pEf0rGnsm9ZgwX+
 cgTKX6oq7mHsXqREG+TItA8FDNGDMLoBTkGa3BcRb1Z5jtqgxNXFodmT8X+o41t60ErcakS5PAc
 ALyH8rLPMYLB2Fu1ILEiVD9VOXYghb6UEh5GRQKiMQqlli8WOGsSGQlrfgzPy28v2+nM4FwVfcg
 olSAvqatsJEaTscHQ0g==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afc1487 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6_iyOJkiw1WCeSr2jkoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: NS_gY7lOUEVLylPcOm_axQEhiViBzILt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXz5lDZfrUB+gE
 NGfJ1KW+wS1POrne65JbV9YMuKJAY9jr33j4dlE2JgjuO01ytjBmHMeJ/16cHijZOEjwB1MOavf
 EmkU1t+f05BZdQGes/eLj9ekBS4YWNA=
X-Proofpoint-GUID: NS_gY7lOUEVLylPcOm_axQEhiViBzILt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

Some SoCs gate the EMAC DMA path behind dedicated AXI clocks. Add
per-platform clock-name lists and configure them as a single
multi-clock OPP. The OPP core programs every clock rate and propagates
the required power state.

Select PM_OPP because DWMAC_QCOM_ETHQOS calls PM OPP APIs for
compatibles that describe AXI OPP clocks.

No functional change for existing compatibles. This will help us when
we add support for Shikra.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 103 +++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index c6559e749c0c..15639666e837 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -146,6 +146,7 @@ config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select PM_OPP
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index bc443793539b..15385750b3e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -6,6 +6,7 @@
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
 
@@ -102,6 +103,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	const struct dwmac4_addrs *dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	const char * const *noc_clk_names;
+	unsigned int num_noc_clks;
 	/* Fixed PTP reference clock rate, used on SCMI platforms where
 	 * firmware does not implement the clock protocol allowing linux to
 	 * query it.
@@ -119,6 +122,8 @@ struct qcom_ethqos {
 	phy_interface_t phy_mode;
 	struct dev_pm_domain_list *pds;
 	const struct ethqos_emac_driver_data *data;
+	struct clk_bulk_data *noc_clks;
+	unsigned int num_noc_clks;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -725,18 +730,61 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 	return ret;
 }
 
+static int qcom_ethqos_set_opp(struct qcom_ethqos *ethqos)
+{
+	struct device *dev = &ethqos->pdev->dev;
+	unsigned long freq = ULONG_MAX;
+	struct dev_pm_opp *opp;
+	int ret;
+
+	opp = dev_pm_opp_find_freq_floor_indexed(dev, &freq, 0);
+	if (IS_ERR(opp)) {
+		ret = PTR_ERR(opp);
+		dev_err(dev, "Failed to find AXI NOC OPP: %d\n", ret);
+		return ret;
+	}
+
+	ret = dev_pm_opp_set_opp(dev, opp);
+	dev_pm_opp_put(opp);
+
+	return ret;
+}
+
 static int ethqos_clks_config(void *priv, bool enabled)
 {
 	struct qcom_ethqos *ethqos = priv;
 	int ret = 0;
 
 	if (enabled) {
+		if (ethqos->num_noc_clks) {
+			ret = qcom_ethqos_set_opp(ethqos);
+			if (ret) {
+				dev_err(&ethqos->pdev->dev,
+					"NOC OPP set failed: %d\n", ret);
+				return ret;
+			}
+		}
+
 		ret = clk_prepare_enable(ethqos->link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
+			if (ethqos->num_noc_clks)
+				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
 			return ret;
 		}
 
+		if (ethqos->num_noc_clks) {
+			ret = clk_bulk_prepare_enable(ethqos->num_noc_clks,
+						      ethqos->noc_clks);
+			if (ret) {
+				dev_err(&ethqos->pdev->dev,
+					"NOC clocks enable failed: %d\n", ret);
+				clk_disable_unprepare(ethqos->link_clk);
+				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
+				return ret;
+			}
+		}
+
 		/* Enable functional clock to prevent DMA reset to timeout due
 		 * to lacking PHY clock after the hardware block has been power
 		 * cycled. The actual configuration will be adjusted once
@@ -745,7 +793,12 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
+		if (ethqos->num_noc_clks)
+			clk_bulk_disable_unprepare(ethqos->num_noc_clks,
+						   ethqos->noc_clks);
 		clk_disable_unprepare(ethqos->link_clk);
+		if (ethqos->num_noc_clks)
+			dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
 	}
 
 	return ret;
@@ -773,6 +826,52 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+static void qcom_ethqos_noc_opp_cleanup(void *dev)
+{
+	dev_pm_opp_set_rate(dev, 0);
+}
+
+/* Some SoCs gate NOC access behind dedicated clocks. Acquire them here
+ * and set up an OPP table to vote for the required rate and power.
+ */
+static int qcom_ethqos_init_noc_clks(struct qcom_ethqos *ethqos,
+				     const struct ethqos_emac_driver_data *data)
+{
+	struct dev_pm_opp_config config = {
+		.clk_names = data->noc_clk_names,
+		.config_clks = dev_pm_opp_config_clks_simple,
+	};
+	struct device *dev = &ethqos->pdev->dev;
+	unsigned int i;
+	int ret;
+
+	if (!data->num_noc_clks)
+		return 0;
+
+	ethqos->noc_clks = devm_kcalloc(dev, data->num_noc_clks,
+					sizeof(*ethqos->noc_clks), GFP_KERNEL);
+	if (!ethqos->noc_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < data->num_noc_clks; i++)
+		ethqos->noc_clks[i].id = data->noc_clk_names[i];
+	ethqos->num_noc_clks = data->num_noc_clks;
+
+	ret = devm_clk_bulk_get(dev, ethqos->num_noc_clks, ethqos->noc_clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get NOC clocks\n");
+
+	ret = devm_pm_opp_set_config(dev, &config);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure OPP clocks\n");
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add OPP table\n");
+
+	return devm_add_action_or_reset(dev, qcom_ethqos_noc_opp_cleanup, dev);
+}
+
 static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 			     struct plat_stmmacenet_data *plat_dat)
 {
@@ -780,6 +879,10 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	struct device *dev = &pdev->dev;
 	int ret;
 
+	ret = qcom_ethqos_init_noc_clks(ethqos, ethqos->data);
+	if (ret)
+		return ret;
+
 	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_base))
 		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),

-- 
2.34.1


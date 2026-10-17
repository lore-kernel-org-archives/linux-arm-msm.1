Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341654052D8
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230412; cv=none; b=PT0VSsPRJNcPzxJlks28LO6hsp+C6hebeT1nck1jHuOKj1vFyZ5b6v/5U43hbEkUGVtKnfXVG9EPqh7IcbKYwxF6xlFHBM9US0rVU47kKoK12ClgzN/W16SEXNZolBSNvbAJIiSGqYK75FfdlRFAh2wAxJ8xec/HZtpPljVTvnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230412; c=relaxed/simple;
	bh=9eVv8MAf4LXIE4/rruuWX0tApHl3P2+ZhsZWI8Gw7IY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iHeD2kGayRPy64imoOQGzlIFiqtubGx58KlTc8+ZdR282shCDwIZlopK2umSnoBiEYT/+sT9qSYGw3Y/xnW35KXFFGQ2epAAVQ5z0o6Qu2mS0r8Im+ZAQTC0BSNv8AGeB1nKxPbvsX3FGFFVoV+E/OhlTdUdmoaVZzQUtWHG+LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OnCyP+ra; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZpJ8hapg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OnCyP+ra";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZpJ8hapg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o1rA389388
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OxJd5cO3iWIuSrAJ+9vQi0/59AxdxBAufcniJITxJnc=; b=OnCyP+rarJGQiJvq
	VjC3gS+8JO0e8AHCY6afLZSzvAkqpvil44cQCjYmTNR30Yw3L/4Xu90PSRO2/fhF
	2bYXG2ea7gUPcYsLol7bPsNoU4Gtc2Z2NfQ+638cAUSqzIem0tW8819zp194BwlV
	iGkW2KsvX6sFzSkmL3o0MBOJc4tN8hPckwq8vkE/fa0YM58D9X+okU9UnNMm1Mx7
	zNQB6uKJtrpV5Y1vZ1xjqKuSGFKTbRPXv7e4C/sLs/OTS/Snk3e4GM3VCXr596Dk
	ZE+SgNNbabVNdMaZIfvDy+9y0jDlIx5vgGMma5rZsD1eKCZFzDtOJeycrcCMbMtQ
	Ju0cNA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1838mpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:46:50 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-152d1363a29so2691159c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230410; x=1792835210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxJd5cO3iWIuSrAJ+9vQi0/59AxdxBAufcniJITxJnc=;
        b=ZpJ8hapgw6Nzm4jBmcbyedJuJDbFFi3CBw1mzEhjIVfwjdE3AE8/UsXSlDIY7uNGKX
         uOZI20r2bzAiuNCWGjMvh7sco/VQp/wvS8Q3aLUT9ZIbSNEjBcPfmRH4XO7IihWyeDxv
         SYqHA0PTcAjUZNcYf1TrvkfFmTRPTGg08d6DARmzbpgkkiKzDIYuDbWqfDfwuGdtZvFw
         ZCQFLA+Hch55HmR3ERcGI7HEN3fzcGfXqwk+SKimmmMQIOl5sPIGzjeDDbFMEKzhrY77
         r8sGTbRY6i1qSaziDXUsnlFgG9frqPu5rWB4bgU6zVqvsrj0j6u9C4P2aqLm7SuxvKKa
         8tUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230410; x=1792835210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OxJd5cO3iWIuSrAJ+9vQi0/59AxdxBAufcniJITxJnc=;
        b=WpCbJzfA49qW6qlUpLTjOdc6IKakLDcB+FYfyNoecUYWJmvT5lg9iTO8Xr8aUlNFkb
         pNGQIrxHL+Z2Nb9gVxNSEcdW/F4ObosFVdNABvNQtn1ZwANha42sv1G/e/TvHkRc8sSi
         H43tK25x2imHVc+cNgdRnCknCG5mKZfnvZ484/tD7cDNDim3NhmYSSNYiuuov6Y+CZ4+
         uJvVf3MMw9VpBf1C5jYXJ5rb63EMZPrNlU/MRu/qfRntOGrkuzazvXmTZ5ce5JQZSHuq
         yz3l5IHOz7bEDX0+XMws3t+9NiJaKhfnF0Z+v0izSygv7kn4orMJMmR5jUG1O22pA7X0
         iRYw==
X-Forwarded-Encrypted: i=1; AKwUvByC48JcdkAlsbQmHxOWITQi9zqK+FHMBsQbiVSUs14OOxfOxACkqIi4SMZpz7XJJc36ff6O9ONScUwAiACp@vger.kernel.org
X-Gm-Message-State: AFq9FYJsYY6BDbApOugNJ/XUyh96nClWnn70E5w5SZddCioegXRMAv4H
	V/L8uf8gS5Mamk62Y63pN4hgeulVMQUSUaqXXEnrtlWy/db2H2r/+5s5tOAL8LKUZM66z2Mg4tK
	xAQ9syWdTTZf4q4/PizlEB0R7pORBpCUozu9Kt1Ujb0sTZPoL2+6wJdyWEjHRscvJLveG
X-Gm-Gg: AYBFou0avjybely37OWjnI3ZIvFfRkUkN140jmJjcnchgxfnw0j0UGO1XNsTiiaZec+
	hB2bpfhjOaWvpsP26/bHqU8ajBIN8dxz1vifOVECo7YCYhJU8PSJMwKlKJ2Sx7RAxo/fJGRHPeJ
	nByIjAl6j26AJbYB1hIiMggsuEtTjkTvFB+d1zVjFN1D+6WAGs80hM8ke6pjh8oQotMhNYgfnO3
	UaEPxBEDnK45aYso4ueH4YjYrt8A4u1pQj1KqARV+OI/6iJBcAfkuLLG8keYBC5Wa9pWz5DZXke
	dfnJuhXwvnVEExAri8g0maS4/YfedFt391NCroTBUSW2/D0pxc2fOxDz2tVOipYlyl5hBe4jfcS
	KfPc4dNZJsBmQaVQ8e8aKLFZ/0NaLNg==
X-Received: by 2002:a05:701b:420c:10b0:164:475f:1a07 with SMTP id a92af1059eb24-1850ce9ee1dmr3500606c88.1.1792230409494;
        Sat, 17 Oct 2026 02:46:49 -0700 (PDT)
X-Received: by 2002:a05:701b:420c:10b0:164:475f:1a07 with SMTP id a92af1059eb24-1850ce9ee1dmr3500569c88.1.1792230408783;
        Sat, 17 Oct 2026 02:46:48 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:48 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:19 +0530
Subject: [PATCH net-next v3 8/9] net: stmmac: qcom-ethqos: add per-platform
 NOC clock voting
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-8-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
In-Reply-To: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=6570;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=9eVv8MAf4LXIE4/rruuWX0tApHl3P2+ZhsZWI8Gw7IY=;
 b=lXZAEmKZ17rfPjuthen1QPZFjUXUlWzYJGN4j3PW5NuK5F8UyAlHLfi7pC1PbDuzfE/vwVXJ9
 j2kY2ymIWl7D2AE6pPnGyFnfGZQLn/mRPDxg9IRkwAlv5Shj4lcvVoK
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX9kCuhdZhEpQK
 sCYCJGnAGWJqDVM297ZIrpb/3AykaqrK/OfAO08jldWXaw6gx+lWZN7Bn4FPrb3xKJPN+oQtsRM
 yFNCG46Gq7PuFfmLWGXFqWb65EYiTnw=
X-Proofpoint-GUID: noHTthc8JIjoFZi_C4qG38OiZhKUIJS6
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad3440a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9mpPtdtZZqvod9v0kJkA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX5maPvnVMfVrp
 GnCWiiDSt1qM+Sq0FypvYm/vio/GU+B6UNXae8iL/Sk/NTyJ4uhipBgz0jBJVQ+nj/VvbD857CY
 av1LRKuIyxkTp6idqJLxEbhofcxhZoA/xBq5FmFD5NObsEbykd6B92ak4I/r77oU9ztr0nMM6n7
 Mcp2ZVUGH4oHanHnYwEVj3ZenDeuctqY6EPtfH62NsCYz/l3tjWYJ1kCltxkaR6hTwDkAaa0rB6
 16C1o3uUBfFw/qPRRh5v+ykaT5qo3T2Q+DKk30a9gGTwqAJqERwQymWeO5yBwTjlG9shfW9zutR
 S0pD0wvOuYrvo+YvnSWs6mGbpskpa+Cdm3YQHx692Z3c6P88mLzJ7g0xl72d+DMKjczbdiATxvD
 MDM1jDi2bo0xhCVPjBhI/pglmvNGwf95Q48GTCvyEwZDQ+lnOeCvpBVwz8+ALaQawBCNDDj5e3Q
 RMj9RQ6PbXlWsg4XrkQ==
X-Proofpoint-ORIG-GUID: noHTthc8JIjoFZi_C4qG38OiZhKUIJS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170038

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
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 104 +++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index ab3c4cf964239d724945651f7f7b5448118ad5f3..c86fbe2680ad46b6d444c1469b90872dff9b26b4 100644
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
index 370eb05caabc00a20d887ac88c1ffa4473bc4021..9c602755532e141f4b822721686b1481b29b7d4c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -7,6 +7,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
+#include <linux/pm_opp.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
@@ -98,6 +99,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	const struct dwmac4_addrs *dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	const char * const *noc_clk_names;
+	unsigned int num_noc_clks;
 };
 
 struct qcom_ethqos {
@@ -112,6 +115,9 @@ struct qcom_ethqos {
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	bool needs_sgmii_loopback;
+
+	struct clk_bulk_data *noc_clks;
+	unsigned int num_noc_clks;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -673,18 +679,61 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
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
@@ -693,7 +742,12 @@ static int ethqos_clks_config(void *priv, bool enabled)
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
@@ -721,6 +775,52 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
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
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -782,6 +882,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
 
+	ret = qcom_ethqos_init_noc_clks(ethqos, data);
+	if (ret)
+		return ret;
+
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),

-- 
2.34.1


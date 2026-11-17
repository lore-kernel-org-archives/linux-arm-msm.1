Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905194;
	b=2FZE7J3W7o5ApDjKccByMDgM7bq/5GwcHD6zOkPP1US21/e3AK9/n1IRJ9kmu+k0QFP/
	 N047NOCDU6DlA/yntYpEqxFkgA2HCNkOSkupQCXmkhFbXgn8Iu771rWn11G+UIVOaCrXZ
	 5zwiqHAy0DJ+mJsPhginBBOkICBD926cbd/aOmtF4PDzu9HmRf/DVH+X5xYKIFbnjKSuX
	 y4rAAZSmo18DsRUhyXrrFEnlemCp6Mj9I3a/n5T0OW22NJQuqoURYPE97nTYa5G05iPsg
	 I9MIzP6TZiGVeK0v4geF7w9G60YiFQ5npBCN2fUr4a7f4DcQoFQBRBegjdW/bOYxLeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=axGLWmtidPhO3L+75bMr1aFJDxlJul/pLSoRq58+U1g=;
	b=0iQEMsRrCBPinOL+FYG6zrLvTYejI5Q8gHzxc0DGSFWpJlux4P2DRX4HtQYIOFN0fceu
	 OmSsSXJxTcx9DlJ2y/gxfAIj8Swzf3ydOBi8JZu1ULiniuJYgNMaD/poU7sRsVygJmQ/K
	 I50Ri8Z/Axo9947NjkrpgDe1md/sfMYar02tsnJ479hKQtBYRAwwaCBnsPeZRIfvXu6is
	 2BSavc8Mb2UfTmzpQoSoBSyN2+nC7GLXCoD4f6eX1awdofBTdTCipkJTyZHofWfS10pTH
	 8WyD4TiBX7BmMhy2lNSt4WAK2frbchrIkxPT54SngQ5aHxOZDdjsL9mJSGxiFeJ7DLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WXp8YkAf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A5159sHG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82119606A333
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82119606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WXp8YkAf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A5159sHG
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH43xJp1699103
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	axGLWmtidPhO3L+75bMr1aFJDxlJul/pLSoRq58+U1g=; b=WXp8YkAfLNdBX102
	2b3V5vWFXZCOY1QzwlnF/dlNFGn9Le1yo2w7uog/MdPNGYyLa5yVO1vsOorCAu21
	U9DhTd5Isbqzba9iodGbWVYpsPvOhTyudhvNDdL5S030XsW3hWlEPrcHROOubwle
	qzNWy/Cj01rXlBF0mP9a0luAWjc1+9rz2fbdhx+Y2lVVYrDV6426qIX4nNhYzmlm
	IEZVoKxZEu48vXxDTP11ckc76eJi8ONs4n4vBDYDuo9j7V6aWVN8nIRHYs7VB4Ym
	0pKljB80K+DxUk7OKlUVeICnMZXxiXcgBn/5zgdZQ+neoF1rKtdgcf4ALPHJv8Ki
	ZQA1TA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0fjugynu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd48746a49so2575715a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 00:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905188; x=1795509988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axGLWmtidPhO3L+75bMr1aFJDxlJul/pLSoRq58+U1g=;
        b=A5159sHGM2cxzEd05P4xfNynbUYrSI0jqhG/O4z1Ux/Re0lvYzHOM7cxQit9lHVBuV
         e5tLOfemBr4SGjATifWrUEZ3M6+uZfjbOVNq7MccR3kcKbGtE6eD41jclFyw2DAGDrvP
         jWC5T1UAEh+Tbfz4gKSUvuWarPb3bL/QMEUjbWH4gWOb0pdKaeeCAVHYHgbZHP7P29pW
         K0FIOKo5uhDHPhb9eiQalAmxH/YJO6YlkNSTBZhAb7JyM6hJnymRUMEOiSC0DKXsqdlD
         BG/WGuOFBYor8kDhBWOyPq/srLq8py0MvQYmDDOPlnFtgapxY6r5dtHhbkpKhkkqNdVn
         v4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905188; x=1795509988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axGLWmtidPhO3L+75bMr1aFJDxlJul/pLSoRq58+U1g=;
        b=W8ayUjEQJlpQu9HakvEXdeJwN2cscMTEZxe4jh/hraqoxoXswT1Bolna8dC30tZrbR
         8sGXhSGIbowLm7BDS+9V0E7GM6ZWYJPa6/yaupZBO9gtxPyF8qBSdpFP6XHNUtrL+NMn
         CagG/y7A1iYyZapG0RJudWd1CYxbdp55aU+OL5uWpoRP9M3Npghmq4g6PfKOHx9rDQO3
         qjxHZUKz2TKjJfhmP0nuQKL3753LxMcVbEonTg1nKHzB/hrWMxBpL7HKbEQMgYXtW34m
         VQ/NAGbHuTF6n4dml2alb8HPSJ2qUzutsnFw0JJYk31LPMcMBfQD2qNgDRCF1NF8My1w
         c1Kw==
X-Forwarded-Encrypted: i=1; AL+hErEpkiv5B1PracMIBTPhHMXR8NX6XlP3ffTsKg+p7Jk12c7ZAeC43ZMoBS0W3/qgKPwNO6KC0gMl0VoffBbk@vger.kernel.org
X-Gm-Message-State: APuU4Z/9fBL1oD66e8uu/6yhNbqIe7g+5pk0CAD4/AMj2Y56yQ/8kgJM
	G0uh82rxvvuG8AMrGb8cXx3zD8FPNvwmtZF6hZWxxkvTc/cm7wNgUyxX2QFavFhh0y2BvRw9Q/h
	07eNRamMxOy/qjtS5C8xkhpDLQOoZVHW3+p44Zydf41bJh9811nzzhXVni4qiBFnqamWH
X-Gm-Gg: AYBFou3LAEWoMG/VTNJJ2r6N3cl6UGKFpI+dZuGh4RHGr+0HYt1pgo4Ura7ePOtrTue
	kzU5eFQRJDrLcrl3DHLPyzbcIExTzx4UG3ZcAMa3CL2oVfGVKXn8mFsvH0SwthZmxYmXj8xzXZZ
	O4mnqnxP7At1KMpcmQtcM951N3yNAa93UhkMJjlBrDPm+bD29X8jESjdKEPAPdXHC20qIzA0ZL6
	0qty4Adb4VmtW7lbI6fhFfEDAlFKnKhtVkNqlkqopWI02Vvb559FPYuItPT7pS/lIM4kYtWzksQ
	3SF29+GS1A0sXWu/efLb4BnrEXDmitTWByyORzYvNAu18/kbRmzBvlJj72/VYMB+aid6/68v+WW
	pA0CfZ6hT76CUSSytzwQdIcd+OTMaRY8kTNxtsrX/yxd+ibOqiDHS2rPqL8x+4SD6p+f3Lt3ATL
	hr3A==
X-Received: by 2002:a05:6a20:da11:b0:3f9:a6b6:e16f with SMTP id adf61e73a8af0-3f9a6b6e4eemr8182582637.65.1794905188171;
        Tue, 17 Nov 2026 00:46:28 -0800 (PST)
X-Received: by 2002:a05:6a20:da11:b0:3f9:a6b6:e16f with SMTP id adf61e73a8af0-3f9a6b6e4eemr8182547637.65.1794905187603;
        Tue, 17 Nov 2026 00:46:27 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:27 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:24 +0530
Subject: [PATCH net-next v4 04/10] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
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
Message-Id: <20261117-shikra_ethernet-v4-4-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=1924;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=h8iKXwGfP4z+zw3C5X6I1w9ChDSEwoK8RxfNrBe96t8=;
 b=kQD6/F8/rCLDa03R5m7H9YJ6yMZIibUFFYNTVT4Zn796GNjmnhaMoEYXuxPnHy634R57WVUR/
 DSZdcFderHwDrShBS9akj317sJ08LUX1Z6LInvVrBAUvzLKN23VSJ0p
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX1AoHQRRvGJYZ
 TEdg63AQ551G6/dIFohUyDrNqBZuoUVwBrJ20qbrrh3hOLWcqv/bQwKpAlV7tbvpHAFHkcT5euH
 Q9WGHXnFLhlP/dYos3r7eEQ8fWzd/PlAlYYgz7+/VR+2KKS4JW/KGV6YC2aDCGmArvN4k3p0PVI
 UgW48qbY1K4Gb3AdxAfPhixDy/IkzyPyg/0kP5H3saPrGd6e7Thf2tgMjhloYfpE3lW771I5KPS
 +2bdUdcIMaRBpiJtM9Ea1PdDTO7v0u9cq3ZMWcoEbunfT0caeWts+q1J8NM38BKuUBuK3eFwVvI
 BwYactjQWl5nqIHGp/dqG9uAd03mJm0Km1ZLHHwcb9zPnF+N4WCZfypZEpkM8e5FR7iLx9B/PBu
 suqI4Eh9G1WGR7S6I+u9IHA4z5Z6RcrLw57URXlW/OkkPINXz8UXFZSip0rU87MKqPSj32iyMee
 ZjqAwLPjU8Tz1df933A==
X-Authority-Analysis: v=2.4 cv=JfIpPkKV c=1 sm=1 tr=0 ts=6afc1465 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=Vjzh3eGJV6Wj_RHhdNYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: JB5tiDsJIDSk-PbCfWlStz_eX5fsSXd1
X-Proofpoint-GUID: JB5tiDsJIDSk-PbCfWlStz_eX5fsSXd1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX6arUvtjTkUw/
 c5Unx3J6trq0t9ALRvzwoS5miWYjDlkuy2Ec4ubADqbsNfcA2wYrnyi7sSk2Ea64RMCOGB2w1qH
 LvGRlPYdSPvLnNdbJ5aV+gXNz40SMZQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

The return value is never checked by its sole caller and the speed
validation duplicates a check higher up the call stack.  Convert to
void and remove the dead code.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d24509a4b4d7..f2428f0467bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -411,9 +411,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
-static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
-	struct device *dev = &ethqos->pdev->dev;
 	unsigned int prg_rclk_dly, loopback;
 	unsigned int phase_shift;
 
@@ -424,11 +423,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	/* Select RGMII, write 0 to interface select */
 	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
 
-	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
-		dev_err(dev, "Invalid speed %d\n", speed);
-		return -EINVAL;
-	}
-
 	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
 
 	if (speed == SPEED_1000) {
@@ -519,8 +513,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
 		      RGMII_IO_MACRO_CONFIG);
-
-	return 0;
 }
 
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,

-- 
2.34.1


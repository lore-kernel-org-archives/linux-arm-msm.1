Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67F549E5E7
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 20:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812670; cv=none; b=VuBXmN1MI5Rj8aOKtIH6lPT9+H5kYwEzHvFT0aoqukfk6F6DBsPvnn0gRflWsri1dRN4D6SMzYROf5omtSFUzfYcqlCdHYndIkOoeqBwmsLGSikoKnz5E3eviQULnBnvrFaVkndcQeKITRNUkk/ICG75mrClGFkeqBSCZmOYFgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812670; c=relaxed/simple;
	bh=H1FwwnCAzH++7RGqPRMDkA7lx0MXBiHM+RuBRtHZzLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ne9iTK91YswhJoaoACO2LtD7lHSk99q9qYbgMul/Gh/cq7Luh88+EBbo7qlSnPiBHa0iq9y3gZCHysa9e4xIHMAqJIrkkirjM1t4tbxjjjWCruwPI5iOXuhmuEogcD8J08UzMnHg6V/cVjXrNX0OJeFduA3NkJTKpbAXUYDeF3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXXlmoTR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fT/0u1za; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXXlmoTR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fT/0u1za"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H8UC61315550
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 20:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cSW22gDP0aHXM9uYQ6GNqbB9X8L4peq6obrroaX1pIE=; b=oXXlmoTRr1saKrev
	F840BrG63g+79L9cQDvQOUzAdtHc15i3Iupnmogi2qIfmG6JAdpPmhvwBrvWHoPR
	Fp5koZlCQIb59yiobyKict0sA9mzTDNZHGKKLMEryt5YaoOsPTjpA0NvZML2H3gy
	aTunk1oAcu0ofjoJhgJFRWHHGMwtndrk5TXMcL7hDNVH7UzPTqQVOJGEI152mKOC
	hCxvt/lxW81UAHxRzgkXGGReuovfYmxOHRc034IizTCEmddyuP9cUVGog4HZBRLT
	v00BI0NU2Jz4yiBtWhmfZaeAaPYyE/uXxtR2OzanVdMHQlr2RPVLwRXNi7R7x8jA
	1yF64g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk9uw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 20:24:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so7595200a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812667; x=1789417467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSW22gDP0aHXM9uYQ6GNqbB9X8L4peq6obrroaX1pIE=;
        b=fT/0u1zaIOyGUpe8QJCzxmsnrfRTk1cjxMQ8Y0xbqqc8T9g73Mjjk01DcihlTyAP4E
         lrS4nNAbtvSfN7ChKTpinXz34G1Bl7YZoq2zP2Ta6WGs7ju4MDIsxOW2fYGcaTsMhJEZ
         C0NZEYMhiA8YMSOni31wSYhXLbY1/KgsgHlZHw3YgaDmkrAAsKNiSQ16EurBVrZLTdC+
         hjDkoPEgye5B0XYJ+0SjS4zBujOuB/ggmcRKE1MwK5lOJes723TATw/7pUZkrpDvZJS8
         yJOg67i5l9jFXGMHCFHuB3wlzzXY/pfGBfL8lVWiHYgAnb3Jsf2SxPNuYQIq+3ISl3E4
         YaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812667; x=1789417467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cSW22gDP0aHXM9uYQ6GNqbB9X8L4peq6obrroaX1pIE=;
        b=poIUvoDAXcrFtbGw6chCmJ+wuobv2syFx8PsAq8pII3FZd+fdHQI/J1Ve12B6y79Pt
         A8SIyp4i7yNJGTIFFUCiYg9BHLjbRptPRZ4woNxB46/vSCgl/4Hq4O+1lUI3z5qKvVHD
         sarA6hCvNxFQ4gkMhXORV6Grtopi9cA9q1/O3jFmMiThpgsuRTxzyZiH4/biv2WBIMKo
         9h6Rqvdg9Gwli7dfVaaWGKAmmwF9QSSgHzVPDRV1Vciqf04Xl5JJB/a8Ox1aZd4aoXiv
         ceX1JKhwPH57aJB7BZxgYsTJdCsDT7T5qVh0rv5hOQXmVLrPP3j6hEK1UqEB/Kbn7er5
         n+GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwQ4vxMT7rWPaAvG0Oc9hM7GKnGxcxjEVS9Au8hNZYaoaffojgpUMwTubnbMkVJm3oAT6Iww6/XtlAi8Hc@vger.kernel.org
X-Gm-Message-State: AFuF++kzxAcBG0RsDBuf18z/GmQjk31FL+irSoUciCqRSfo/tWRKeaDy
	ISNwJpqPtfDZjskMr/V28MqM14YOxZhNAo+S7Iqb6pWus+ozH8tEKzsX82n0ITrUDkmRznlxn39
	CYf8HbB6RTo2anPAL0YK1tCyhuxm7Y9vknub6uyKVnNZNyv07S72qfs/fs2/yZ5LZVNNc
X-Gm-Gg: AYBFou3hHeGhq86oSxU+NbCZ2Yy1p3Xu/8OL0R5EYhWJ2MFWcMyhlmKVRMY+LVo8mFS
	pmn9gwI4oi25PrhD6awOfyYTzvZcabvdVNgyNneMUatOW/kjetvbh5twOMbGlo4vM0/fZZFXX/+
	cmGBkLOsNJQARfkKRoeDihGI1XxvD0dEGyIEOOJOo/T48n0tsXdbK9zqoaYMu8Iwb/qUHLk5SEG
	zrtoGY+3YoNc1YkMlDpPrPJQc7jeSjCX+ReU8VDWgQUFSBvpqg9/hj68igMQI6ni2WzXE0nA2ZL
	sYRMNfrYMaBkh1MdHbwE+8sFon280/a8mzlQJizI46eDyayJoVZtCw4/LF9G1l0jJd3l+NQp4fV
	LzZ35bcgVf/Cw5YJOgCfmySM58yLlsw==
X-Received: by 2002:a17:90b:280b:b0:398:c315:fa6f with SMTP id 98e67ed59e1d1-39b261cfebdmr34880045a91.14.1788812667219;
        Mon, 07 Sep 2026 13:24:27 -0700 (PDT)
X-Received: by 2002:a17:90b:280b:b0:398:c315:fa6f with SMTP id 98e67ed59e1d1-39b261cfebdmr34879983a91.14.1788812666696;
        Mon, 07 Sep 2026 13:24:26 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:26 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:17 +0530
Subject: [PATCH net-next v2 5/9] net: stmmac: qcom-ethqos: fix RGMII_ID
 mode to use DLL bypass
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-5-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=4883;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=H1FwwnCAzH++7RGqPRMDkA7lx0MXBiHM+RuBRtHZzLA=;
 b=rz5FzNCKy0hd45LxMN56ldZNlxCT9C+l66wapiVjvwVNMp4Wb0CADNuNN+/vQqvusiXsWP5nZ
 2qR2KLNcUABC/i79ckJMTAgQrKraAz1CKhSKic/CFTpMB7eOlwdN3M0
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfXxW+LNKAC/8xI
 1GkI3HsfVqUM9GAxi3n5ybef5dmFKqBSlKo7Y42+ASG8+C6PmERmCFjoIESIxHMEW+OG4OJCbmG
 mc9s/QwaLbgboIfHsZBJJoVtaSSxc2o=
X-Proofpoint-GUID: 70HtXRlchGeSMNVOJTPDdP49eEkRCGQN
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9f1d7b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ctJ5fWpjfrpFC8ASC0YA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 70HtXRlchGeSMNVOJTPDdP49eEkRCGQN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX8D7nm0GJVNWF
 wuJGHr5PsLniadzfKwfvFnVrYEhy0omQNFz+bihFVanEwWvUnfqNW+YH/7YSWe48azYQSeyJX3N
 ouW0mTjGaWBbaPHqREfxsyyv1ENpl5LeEP9ftDGYaCwDWZGT63NSu5enNXVCftoVMmasvKAnuB0
 CeE8ZPpSpPn9n4IXoek/ax+jQvxlzLsnwSJIG2wjQXVY8KRlePQTMxyaD1pBggVSyXNoC+aVG2C
 +ZKdr5OiBlTmHbsoXP/eeKDuHi+3IGhcIGnU/i+df4JTXp9AY0AdNyg9Fndwxmu3U0TlLBqW6yP
 7NEGdSuo1TuLdObI+VbWVYkUzrAME10sCVqGkpXxjlw4EE85Zebyob8OlV5/UpjT2MiD6c2/PmV
 SJqEQCaER9VoPMcUPW5SKL+m+ZwXOYDqog10vzO8bF6AU/PTG2P7LqBxfJira1BfiTaJlejuT5P
 pS+wvvVtEcNHB8nGWhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224

When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
the MAC must not add its own. The driver currently falls through to the
generic DLL initialisation path which programs it to add a delay.

Power down the DLL and set DDR bypass mode for RGMII_ID, then program
the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper. Also fix
ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
100M/10M, and remove RGMII_ID from the phase-shift suppression in
ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 67 +++++++++++++++++++++-
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 44270c25d874f72e7f971757fec659d36468c315..53fb9de4d92c7f1b3c51c183064024f06150444d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -67,6 +67,9 @@
 /* SDC4_STATUS bits */
 #define SDC4_STATUS_DLL_LOCK			BIT(7)
 
+/* SDCC_USR_CTL bits */
+#define SDCC_USR_CTL_DDR_BYPASS			BIT(30)
+
 /* RGMII_IO_MACRO_CONFIG2 fields */
 #define RGMII_CONFIG2_RSVD_CONFIG15		GENMASK(31, 17)
 #define RGMII_CONFIG2_RGMII_CLK_SEL_CFG		BIT(16)
@@ -183,7 +186,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	if (rate < 0)
 		return rate;
 
-	return clk_set_rate(ethqos->link_clk, rate * 2);
+	/* Clock Rate Requirements:
+	 * MAC added delay: 250/50/5 Mhz for 1G/100M/10M
+	 * No MAC delay (DLL bypass): 250/25/2.5 Mhz for 1G/100M/10M
+	 */
+	if (ethqos->phy_mode != PHY_INTERFACE_MODE_RGMII_ID ||
+	    speed == SPEED_1000)
+		rate *= 2;
+
+	return clk_set_rate(ethqos->link_clk, rate);
 }
 
 static void
@@ -405,8 +416,7 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		      RGMII_IO_MACRO_CONFIG2);
 
 	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
-	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
-	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
 		phase_shift = 0;
 	else
 		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
@@ -475,6 +485,42 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		      RGMII_IO_MACRO_CONFIG);
 }
 
+static void ethqos_rgmii_id_macro_init(struct qcom_ethqos *ethqos, int speed)
+{
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP, RGMII_IO_MACRO_CONFIG);
+
+	if (ethqos->has_emac_ge_3)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+
+	if (ethqos->rgmii_config_loopback_en)
+		rgmii_setmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+
+	rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP, RGMII_IO_MACRO_CONFIG2);
+}
+
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 				       phy_interface_t interface, int speed,
 				       unsigned int mode)
@@ -493,6 +539,21 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 
 	ethqos_set_func_clk_en(ethqos);
 
+	/* For rgmii-id mode, the PHY should add the required delays.
+	 * Therefore, power down the DLL and program it in bypass mode.
+	 * Program the IO_MACRO as per the settings recommended by the
+	 * programming guide for bypass mode. This will ensure that the
+	 * MAC core doesn't add any additional delays.
+	 */
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
+		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
+		rgmii_setmask(ethqos, SDCC_USR_CTL_DDR_BYPASS, SDCC_USR_CTL);
+
+		ethqos_rgmii_id_macro_init(ethqos, speed);
+
+		return;
+	}
+
 	/* Initialize the DLL first */
 
 	/* Set DLL_RST */

-- 
2.34.1


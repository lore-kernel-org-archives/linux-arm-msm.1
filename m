Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459338;
	b=afKKB9mZ7cF5rletPss80loedya8SVeEqqxWQ3J81I6vJdbSVNvRXDyzu2E6LJpKiFCN
	 i/tx/A9LyfjRz39TardM/kivzzhVe5wP0w1fqiveTgVujdAj7Sw4Jjbl70NRTot+jGz5y
	 2kAMftMNrxjs7hDcrRMezFFnAnNvHPbJEdsIjsJXc6XTcGrZl/KsdcZMhBW99h55WFofS
	 qhBPbBpzWBReuWO/lWpwtwWFX2BmUHOg+w7bncD1lBdBF4SkfY+7F84YZtUPlMtGQjwA8
	 gb21n+rVTok37SdtNdpCW7hzQ0QB0TaiCqt9CaVihpMaUvO0gPTPGQ7DciuX+kA2lNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459338;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T/Niwkvx7jD/HqZzKM5KDfggJp03AHVcot/PfIKMqxw=;
	b=pbDn0AOJWH2Yq7WHVSOXS37P12D7x4WcX56LKIDEgYB54lF4Sxsm4Oo/8eYvAhfVt8vq
	 Qz8nBodfmkdX/J5EyBMc+ZFmkdpGh1gFQYh+5BUl8qDtFqTF8gOfLQHLD/roVlV7guOHc
	 zmY//WCIqrdlT4D2BQ7qslXpOF5VQeruk1uLRpQlCcFH/4i5/0metXoxqxrBlReojufmR
	 SYLFqOa1i+wR5wtwflnjRuodtX4Nt4mD5mE7CX6S3wczQo9BivmUS3QJZBTtNL2d5/p/S
	 riHqXLnESjey+JlIZq/MbrwYAebQZHfyP9zcmgdzc3UquQ0cNec8mLHqKpqhMrev3Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iIuBBZlq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bXbfnadD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260C8606A6BA
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 260C8606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iIuBBZlq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bXbfnadD
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGs8V846532
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/Niwkvx7jD/HqZzKM5KDfggJp03AHVcot/PfIKMqxw=; b=iIuBBZlqDjeUeJLx
	VzJE/2NGa3n9eGsHohiCG6D4Eb9GjHh9ZipO1MF4siXpONxaq9eTS/HYnmpjKt8k
	80kX2W47Op+MVK+R3f1m3ZpLVY/kS7M6OW22SYnPcsQWMcUPeRr04AsHdZZXl5c+
	9gz+1cUd3WscsLA0kD9GGtSFR67O1RiA2zwyveMD2zZi+aBYyfSGY2fOuLm1xVg/
	nZ6nFOMcArTnmXo4WRSifJnd0OmugNqkUH9Ulhfkmk1RL6MrHB6eyI7hAXXcA4hv
	Mm7ArZKJXRKbvR2gf4YlAs+RykQKa7X3OQsOMMcUb+PhhtuxSY9c/P4siOkFpnep
	XGZf+A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g742xgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:42:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0a5868265so9351255ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795459336; x=1796064136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/Niwkvx7jD/HqZzKM5KDfggJp03AHVcot/PfIKMqxw=;
        b=bXbfnadDsphkPvkSZDc9yY7y1JUgiEgnet8Mqw3cX+c7lu/YxMu3F4Na8Ngh3wgiKH
         84GVn7HcTunQz3qY2M8w8GO67IRMgOnGPEBq1sDKKb5TSUnVhd2/A+guXk7EL7hUwnF4
         S3cN4D2A6DcKN1SJWqH98Fsr817KZwBhSMnrE0MIK07jTrJ40DuHKNZ1rW8KyLyCikRp
         24qfgXxq+d6jZNZV8m4lgwPZoaUl6m/9W88mtuiNXTpQoRyBKefHhDSakeGgIQhn2RN9
         az5N4hq8X+ezN60PuIo3RxNUIygiEfgtH63JVyGZDSn8mkrzu3GlC+2ivPkt78sUW2lV
         l/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459336; x=1796064136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/Niwkvx7jD/HqZzKM5KDfggJp03AHVcot/PfIKMqxw=;
        b=07p2gY7sDgIt63vUZwa6+iw0vkWNrS/8wHsQ31TvJqv2AU7BciufJoIQdY0uhE3HWx
         oMduDgOFtfg0S/U9+aJFUslmW8nB2nHcy9MjfRIai9tgMHoijk607vlvKwOOnpqaNQCa
         H88FxAw/AOrSosMZCsxA6xLPrMCrkvNaxz15F7BVzsUJiuc7h35iwr1zAkva6cOIWW7j
         W7UP3GMB2MznRWHM1teTk0X83woI+okEYQuBFRAPa63wCa6vH71jOqp/rjTwl1+JvreM
         LO+/8gV/Yf05ovAMP4k0l3FiIMIo59c8kX+zdqnWZ0wznBY0kF4ARTVzav5C5YLvvGy3
         AzOA==
X-Forwarded-Encrypted: i=1; AL+hErEz1mYUA+gtr8Vi//aw4QalOdOibkaA6oQXrPbxfoYCc7uGdOhkpA//htAInL0VhA9t+khKMjgmdZncW8nY@vger.kernel.org
X-Gm-Message-State: APuU4Z+G8UBmcKfaLiyGUZPuY2aj3bglrCaz4GzcNPUHEDKfNaTNlUN4
	q+b1ysXOhko6Ew4WfigsvSO6z6APOa9LTzeYPq4dDkh6tawOr37/MaWIJ7XGZf8DAtzsb0BwYM2
	PrBS5Yz0OzSAopPaqq4TyzvtaZ3nHrRa7vCdE4ytIMwmzaGu4hKTFmvr/QpCEJCpkX522
X-Gm-Gg: AZFdTZchCApjSs4NoOxeCb4gTUZ+wDKjPT0b6ZrTnKJmwnk9UTYf7rbURGsTlbQP7Jp
	V3OvjN7RWy+2aGukFnODBPvPEosW9xSWtDdGRAZpbg8VVLEWd17gJUmfXjAl2ck3Oj6PRrwFZji
	GuyLSpoWj4FxcG5MagzWYk7bPSVILW8E0eOfaRQ5Rpswb72Z7nHr3y9+ec03Bum7E/CY16e2dp7
	AJi57qN/71YSfqZakF4wphgw2+dJ2k7k5m2y375b2JOyXbP8VANPDhVE5X6xhEtebOFoWodFP2P
	IX/9Uv++MNXs+C7op+ol4ltKxgGT//D1BsA1aKlp9HLwn61F+4rlhj2lHPRf+WR2PB1XD+6FJE0
	dW6qWiMQLhBbFUEhqcQyVvFdjjNZSEr2MvsoATAUf7zVfnT4+mo//mDAthKjzb1dRo3sQsveOwP
	YtmzA=
X-Received: by 2002:a17:903:2306:b0:2df:e95f:70bb with SMTP id d9443c01a7336-2f03f0c1eeemr107107705ad.4.1795459335964;
        Mon, 23 Nov 2026 10:42:15 -0800 (PST)
X-Received: by 2002:a17:903:2306:b0:2df:e95f:70bb with SMTP id d9443c01a7336-2f03f0c1eeemr107107375ad.4.1795459335372;
        Mon, 23 Nov 2026 10:42:15 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c7dsm57984705ad.55.2026.11.23.10.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:42:15 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 00:11:46 +0530
Subject: [PATCH RFC net-next 2/2] net: stmmac: qcom-ethqos: add RMII
 support
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
Message-Id: <20261124-ethqos_rmii-v1-2-1754643d593c@oss.qualcomm.com>
References: <20261124-ethqos_rmii-v1-0-1754643d593c@oss.qualcomm.com>
In-Reply-To: <20261124-ethqos_rmii-v1-0-1754643d593c@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459319; l=4504;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=kRxGmpwxWiUKde3lWav3sfKZe4+naAB+GV/j9yR3r+0=;
 b=Pdfz7iFpCQkw9TBsYCpYS/k5mJLtRjDjxLB/IUsCxPioLlsre71Li5Y2Kv4ilRh9E8OSSFXTi
 6qCFxJvmEnlBd+ZnizPKBDyZh2nvBJPnINaHmBt5YuprQcwFvoY4bVr
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: _xFRScLvNeGtqjEDKgT_L9gXJJScrwP4
X-Proofpoint-ORIG-GUID: _xFRScLvNeGtqjEDKgT_L9gXJJScrwP4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfX38vI6zVfSxKy
 SZZnO39FDB/sCL/9VbsolwoSUqIsKdkRc45Tq+7sxvOcc/sPmng0w12QIMUmc/L80lRy9B5hCGd
 waZUAWYj6WcEPwIZeomHsGzzoIfWl4A=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b048909 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=DEAQ98Un7x_38zuDVC4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfX1WmJrcBmScY4
 MMXAH4Ks+5zVu3hO3d6YKZjp9okUyJgEbuEdcp8i0CrJUC9mUgzrogatLGHAeON5EZGo/PuNnom
 dZDOneOPONuPq+qnR5wi6s/Dx3Z+EPL0Jg7T4cHM0ExPG2uiiUdh0SXDAv7SHJ19yhnRWPyfFmI
 pYx41+jTkXBvlI+B3RLKO6ldb2xVzancuqBRsb2K+21B95lSV2MqlRYlHhr/yk6nAeQgUqe2xWB
 1XT5/IgtE7ANT4ZGDarOxjZ2tBW6ECekzlVZeeXoH0gtp4Pxxm5gTtPQOnuchrCEi2QFlf+5U0B
 G8mzYbPIBNOUeTz3dbwyulAJq+kW5IB0mJwTdrpNoJJ6UaYaqsH9ECnFq0+VSj4WS7y9Ryx/ezR
 UZKIk65O3kUwyWGOxbK25d/yBsQD4Zd3oMVEBTX3rhjNWcgav4/J7tmys/wctFeze+V4hO7BbPK
 /cOqSC0pAyJqh4pXRTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230074

The Qualcomm ETHQOS core supports RMII in MAC master mode. Add support
for it by programming the required IO_MACRO registers and running its
link clock at the 50 MHz reference rate required by RMII.

A brief explanation of the programmed IO_MACRO bitfield configurations:
 - INTF_SEL = 1 selects the RMII interface rather than RGMII (00) /
   MII (10).
 - DDR_MODE = 0 selects SDR rather than DDR.
 - CLK_DIVIDE_SEL = 1 selects TX_CLK as the divider source.
 - TX_CLK_PHASE_SHIFT_EN = 0 implies the use of normal divided clock
   instead of the phase-shifted clock.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d24509a4b4d7..683c6c3f3f37 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -71,6 +71,7 @@
 /* RGMII_IO_MACRO_CONFIG2 fields */
 #define RGMII_CONFIG2_RSVD_CONFIG15		GENMASK(31, 17)
 #define RGMII_CONFIG2_RGMII_CLK_SEL_CFG		BIT(16)
+#define RGMII_CONFIG2_RGMII_CFG_REV1		BIT(15)
 #define RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN	BIT(13)
 #define RGMII_CONFIG2_CLK_DIVIDE_SEL		BIT(12)
 #define RGMII_CONFIG2_RX_PROG_SWAP		BIT(7)
@@ -81,6 +82,7 @@
 #define SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN	BIT(3)
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
+#define RMII_REF_CLK_RATE			50000000
 
 struct qcom_ethqos;
 
@@ -182,6 +184,9 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	struct qcom_ethqos *ethqos = bsp_priv;
 	long rate;
 
+	if (interface == PHY_INTERFACE_MODE_RMII)
+		return clk_set_rate(ethqos->link_clk, RMII_REF_CLK_RATE);
+
 	if (!phy_interface_mode_is_rgmii(interface))
 		return 0;
 
@@ -523,6 +528,38 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static void ethqos_rmii_macro_init(struct qcom_ethqos *ethqos)
+{
+	rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
+		      RGMII_IO_MACRO_CONFIG);
+	rgmii_updatel(ethqos, RGMII_CONFIG_INTF_SEL,
+		      FIELD_PREP(RGMII_CONFIG_INTF_SEL, 1),
+		      RGMII_IO_MACRO_CONFIG);
+	rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
+		      RGMII_IO_MACRO_CONFIG);
+	rgmii_setmask(ethqos, RGMII_CONFIG_LOOPBACK_EN,
+		      RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+
+	rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CFG_REV1,
+		      RGMII_IO_MACRO_CONFIG2);
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+	rgmii_setmask(ethqos, RGMII_CONFIG2_CLK_DIVIDE_SEL,
+		      RGMII_IO_MACRO_CONFIG2);
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+}
+
+static void ethqos_fix_mac_speed_rmii(void *bsp_priv,
+				      phy_interface_t interface, int speed,
+				      unsigned int mode)
+{
+	struct qcom_ethqos *ethqos = bsp_priv;
+
+	ethqos_rmii_macro_init(ethqos);
+}
+
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 				       phy_interface_t interface, int speed,
 				       unsigned int mode)
@@ -710,6 +747,13 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
+
+		/* The RMII PHY has no clock until the I/O macro drives the
+		 * 50 MHz reference, so it needs to be programmed during probe
+		 * itself.
+		 */
+		if (ethqos->phy_mode == PHY_INTERFACE_MODE_RMII)
+			ethqos_rmii_macro_init(ethqos);
 	} else {
 		clk_disable_unprepare(ethqos->link_clk);
 	}
@@ -771,6 +815,9 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	ethqos_set_func_clk_en(ethqos);
 
 	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_RMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rmii;
+		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
@@ -897,6 +944,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->phy_mode = plat_dat->phy_interface;
 
 	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_RMII:
+		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:

-- 
2.34.1


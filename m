Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2447453978B
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074396; cv=none; b=PbgqKTUpkCmwjVvoHgHgEOtZu9PSg8sdtxLA9NHyZS0KlXqQlJFthVkaL2ouGD+mGWsLdLCMp4R3YtSfMLssMCEHOnMJRUpQTC1nUQBkwrhS03eI/HQdqtLYlIHMoqlrbGn/RYVuC8EiLg5ok4eP7Eea/H+0Zwy0w5LLffWdpIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074396; c=relaxed/simple;
	bh=L92wgefYXvtbzOMdFEhUTkLwtCR1yYb0ZcvRRGDMuNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1u/IJ+Fd3AWmU7PfEpsliOF0e+d3es3lJyd3rSb0oHgmto/LnNUmg4a3IbYJPKlJv+Dyh/tqRkCfSSkjNfRErYUaB/zGy3gpQsj0+SFJkxyFwVfElfhQ0jca0XWx2qN4T441aLDaXiz+6g1l3qal3Y5f7bnG44MQsFQ4Y6QItc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xw+nnUMX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RlTbl1rg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xw+nnUMX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RlTbl1rg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jG514077444
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cPeNqGPMRBWAfsA5CvuzYdqPrDk9qOkztMDjoEMaK1o=; b=Xw+nnUMXYJLgyFLR
	sgenKLp2gy1/pzlHNA6p1TwDnLe7EftRxd3PhapGoPbvljnOy+/Y/4qCM33jk1HQ
	Sxw+y6smKXcWD5SO2xNB/oxoY+PyYO7b1C9Zkq/KAmMgRT8pT0L4TWtgfrqwDjYg
	68qIFv54NdN6GtES8WsEnIBfJVIqkwU7kNo4JIMchhSBFAWEYwO4MnN0VwCUy24M
	B8tfk763BKDKIeiviXvivxge/iMhBiGWb43298FP3p8ZQKM/p72C6VpwEvvWn1qn
	vjCzaDUYIHUkcLg62wC3/8ub4IX+FfhFXAwv+LusR0mmSalYYk5D7XwjuNLNPPVC
	ljFEVA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc15yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:26:26 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc06b9ca9eso159014137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074386; x=1792679186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPeNqGPMRBWAfsA5CvuzYdqPrDk9qOkztMDjoEMaK1o=;
        b=RlTbl1rglvqpMqiMGMBxpRyBuAJTlL+yFJfqEClIM6fLWmXn/h3+F2o77X5uic9eO8
         ep0YSPuIzvYsp5iKpjbxkbV2ojGsTqoHziA3qR0//JwvId2nrSS2Ir+qabLum9o/GHbC
         AmJ1mOt81lkuyoor1BUBMTWCsn4Cm2FU1rgP8IRRMmPHmGaBXLomH8MTd3ZslKbMUPik
         W39BvrTGUHlk8t9nIbq/g8wKTAcuELJ+jH1NavEDRocRX7HWMrM95TsyQ+oggs+JKIBR
         REyQALlCzJLaEq3ArcxjZtZVeM8pH7jEeeM7HWZI6XFTj4vHCRn1R37y7mm2bdVUBFtC
         tfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074386; x=1792679186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPeNqGPMRBWAfsA5CvuzYdqPrDk9qOkztMDjoEMaK1o=;
        b=ztjSs2n3vHO64IklBuyMVezJ0yHkEt5gqUkXWXUj6iM1AsYxCBYdNWAJvk/iUnW8HX
         wK1vXoGXqBszaXbukeHKnvipzgFuG3TysAGgMIoZObiUlEuST2E+mGnCJqpeDo8hqUvG
         PP+2QF2RWUydR7PkzvI9cdxQ/I/hsLU8d7hksgGboho0YHJBLqj7wGRduUuBmHO/s28z
         FCuO9eggmGFcIuFP9YUyBQ30efJ8BQ4XIdARp5r8SgbllC5Bhv7G3VJcRuj84KLZcDWv
         thXVG7sb1ghrM+B7qlkBR+FIEOkViDc6P4pXA6/ywVYtyclrKY9hm+/Tr4zxiEFvMxGz
         4UeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxueEFkYe6b3/SL134McDq2ApfCXQX2qo0lx3OSPlwZKnrMSB6s9uO022dPRA78a3h0Btp0XeJzuqxi/gwu@vger.kernel.org
X-Gm-Message-State: AFq9FYLumFE5uWv0XyxguXBoQHg44WNdJ4wwbNzPKlbxhSnqIc+iwSFf
	z0tuZx8/nt9iJM7POVwrjEeVWzQaLYsJG74ULZA3JrXRI+EG04kB/QrREo0dKeB9uet+Cu/GWkV
	XvMzW6+ruXRt2WQSTnlr6Oc3TzMlwsvDYvgwRJcX3VTPF4drdToT0j/ogwslUMQP6/2oC
X-Gm-Gg: AYBFou3HfQICQwV1qKm0eN0Sar95rxA/ksWJyicloAsoyEiNryWp570SAoAk6qyjuY3
	ucGaYhnHWizhyJP2m3D9AP3iBafP6Oy/DMTvhD/+1pcVTTrcCxBdvnsWLpiZeylroOO0RcMteK9
	oNcpzxhAL/P9mTXlatC+3krhOtRZZKQMpdsE30LhOi0bQtVN4yShKlyM/XyHf50b+z7zRB8rTcz
	UV0Wr3JZrSC2G5jTGMRhovA1Bus5bTpVzR5+5BRzbBeKylMIy8I2wqNrmj+0Td0mIff2RzRWsH8
	gHSimPFT+928TojyrrH0u8c4qoEGBcyI9fdGOPPYIQKlWcuYzVuQyLN83EC+gbnaXpFjz3iJHos
	EElxe1JPCkECddKu1GNVKipVtgCchQk6qtmEtoq6qcFfhH8qYeoxl6JdHJuwHYicF/vSv8qJlQk
	ZPvbv3WIcPeqED994jdHN7AoFhGl6WrkyU4eQVhq1lXR06Om67r2g=
X-Received: by 2002:a05:6102:5114:b0:7c3:3890:6076 with SMTP id ada2fe7eead31-7cb37250532mr5104308137.6.1792074385429;
        Thu, 15 Oct 2026 07:26:25 -0700 (PDT)
X-Received: by 2002:a05:6102:5114:b0:7c3:3890:6076 with SMTP id ada2fe7eead31-7cb37250532mr5104279137.6.1792074384767;
        Thu, 15 Oct 2026 07:26:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd6428b3sm69083145e9.1.2026.10.15.07.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:26:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:26:03 +0200
Subject: [PATCH v11 4/7] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-block-as-nvmem-v11-4-f890ac74f87d@oss.qualcomm.com>
References: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
In-Reply-To: <20261015-block-as-nvmem-v11-0-f890ac74f87d@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0e292 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=bEbww9rD5qa0LKludeoA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX6YY00qruSofl
 G4vLqSXC9H0K4vIk+yEZqByk2HsQcm7XQTRQ0F/Ep5GzyDA9+Bko/fsHexJr7yMhNaf2a6NsCqB
 6ViD6VfOP0/X0q8LYbaL0PB1TPAObQI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX1fJRAN0ZKPFc
 ce5rfvlzq7zBEkDnFcNe8aKFWV7GcSn1nWLQDgOQehc+QNIcTTiQVwRrva8E1UwCxNSBUFrayJf
 T0koVUfaWICXIu/tlmbBV3cRgK/0rgQ27Y9VPBoWG7FAJ3bGmjWhw2bLz3LafVtEPw65ldUXm4A
 lF/VN2JhqIJr1jgmO2pgMIAURkmV6+M5Eh9ECv2Aw7zdx74hzRNlZ6I3lTEt7V0oFoVgNevZRt8
 m0k+Gl2J19PLLnKdrAbk3n4PHFXeAteWt37OOWLkbD29PN/gO17dSx4276U4Agzt/Uu6is3LdkE
 ijLrpGMDnDmg6lmo7jZ7Y8Bq5LuXWVuTKh6PhcLGOD9j9jj4lmDPGqlvMBuavzt3nKLlxVj6H3a
 baHC5c3erVtgbkiZmu81byeh7cdvQfS8YqwDYudSM88oE7X+xOwg1wFGKoiUNItw3zLhukJxFNa
 vlLsmOzfOPPgMFRbTlw==
X-Proofpoint-ORIG-GUID: njDW6HWhKZAnav1DWayoetS7gr4Sytfu
X-Proofpoint-GUID: njDW6HWhKZAnav1DWayoetS7gr4Sytfu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150057

Factor out the common NVMEM EUI-48 retrieval logic from
of_get_mac_address_nvmem() into a new of_get_nvmem_eui48() helper that
accepts the NVMEM cell name as a parameter. This allows other subsystems
(e.g. Bluetooth) to reuse the same lookup-validate-copy pattern with a
different cell name, without duplicating code.

of_get_mac_address_nvmem() is updated to call of_get_nvmem_eui48() with
"mac-address", preserving its existing behavior.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/linux/of_net.h |  7 +++++++
 net/core/of_net.c      | 52 ++++++++++++++++++++++++++++++++++++++------------
 2 files changed, 47 insertions(+), 12 deletions(-)

diff --git a/include/linux/of_net.h b/include/linux/of_net.h
index d88715a0b3a52f87af23d47791bea3baf5be5200..7854ba555d9a55f3d020a37fe00a27ae52e0e5dc 100644
--- a/include/linux/of_net.h
+++ b/include/linux/of_net.h
@@ -15,6 +15,7 @@ struct net_device;
 extern int of_get_phy_mode(struct device_node *np, phy_interface_t *interface);
 extern int of_get_mac_address(struct device_node *np, u8 *mac);
 extern int of_get_mac_address_nvmem(struct device_node *np, u8 *mac);
+int of_get_nvmem_eui48(struct device_node *np, const char *cell_name, u8 *addr);
 int of_get_ethdev_address(struct device_node *np, struct net_device *dev);
 extern struct net_device *of_find_net_device_by_node(struct device_node *np);
 #else
@@ -34,6 +35,12 @@ static inline int of_get_mac_address_nvmem(struct device_node *np, u8 *mac)
 	return -ENODEV;
 }
 
+static inline int of_get_nvmem_eui48(struct device_node *np,
+				      const char *cell_name, u8 *addr)
+{
+	return -ENODEV;
+}
+
 static inline int of_get_ethdev_address(struct device_node *np, struct net_device *dev)
 {
 	return -ENODEV;
diff --git a/net/core/of_net.c b/net/core/of_net.c
index 93ea425b9248a23f4f95a336e9cdbf0053248e32..999ca0e9258c41580823b80e0ef6db26617bc968 100644
--- a/net/core/of_net.c
+++ b/net/core/of_net.c
@@ -61,9 +61,7 @@ static int of_get_mac_addr(struct device_node *np, const char *name, u8 *addr)
 int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 {
 	struct platform_device *pdev = of_find_device_by_node(np);
-	struct nvmem_cell *cell;
-	const void *mac;
-	size_t len;
+	u8 mac[ETH_ALEN] __aligned(sizeof(u16));
 	int ret;
 
 	/* Try lookup by device first, there might be a nvmem_cell_lookup
@@ -75,27 +73,57 @@ int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
 		return ret;
 	}
 
-	cell = of_nvmem_cell_get(np, "mac-address");
+	ret = of_get_nvmem_eui48(np, "mac-address", mac);
+	if (ret)
+		return ret;
+
+	if (!is_valid_ether_addr(mac))
+		return -EINVAL;
+
+	memcpy(addr, mac, ETH_ALEN);
+	return 0;
+}
+EXPORT_SYMBOL(of_get_mac_address_nvmem);
+
+/**
+ * of_get_nvmem_eui48 - Read a 6-byte EUI-48 address from a named NVMEM cell.
+ * @np:		Device node to look up the NVMEM cell from.
+ * @cell_name:	Name of the NVMEM cell (e.g. "mac-address", "local-bd-address").
+ * @addr:	Output buffer for the 6-byte address.
+ *
+ * Reads the named NVMEM cell and validates that it contains a non-zero 6-byte
+ * address. Returns 0 on success, negative errno on failure.
+ */
+int of_get_nvmem_eui48(struct device_node *np, const char *cell_name, u8 *addr)
+{
+	struct nvmem_cell *cell;
+	const void *eui48;
+	size_t len;
+
+	cell = of_nvmem_cell_get(np, cell_name);
 	if (IS_ERR(cell))
 		return PTR_ERR(cell);
 
-	mac = nvmem_cell_read(cell, &len);
+	eui48 = nvmem_cell_read(cell, &len);
 	nvmem_cell_put(cell);
 
-	if (IS_ERR(mac))
-		return PTR_ERR(mac);
+	if (IS_ERR(eui48))
+		return PTR_ERR(eui48);
 
-	if (len != ETH_ALEN || !is_valid_ether_addr(mac)) {
-		kfree(mac);
+	/* Reject unprogrammed cells that read as all-zeroes or all-ones */
+	if (len != ETH_ALEN ||
+	    !memchr_inv(eui48, 0x00, ETH_ALEN) ||
+	    !memchr_inv(eui48, 0xff, ETH_ALEN)) {
+		kfree(eui48);
 		return -EINVAL;
 	}
 
-	memcpy(addr, mac, ETH_ALEN);
-	kfree(mac);
+	memcpy(addr, eui48, ETH_ALEN);
+	kfree(eui48);
 
 	return 0;
 }
-EXPORT_SYMBOL(of_get_mac_address_nvmem);
+EXPORT_SYMBOL_GPL(of_get_nvmem_eui48);
 
 /**
  * of_get_mac_address()

-- 
2.34.1


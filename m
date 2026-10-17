Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3FD4052D8
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230383; cv=none; b=FQwm9o+hPpeZATqOSKABSvJmwZr+F0E3p7QmX87jjIFYB+fCqnK059KokHSOYx+uQBshlbV3H5SFtwGE++OumIctpIuNzsPvfhxYNq01oGGtIiPvi6VM5pGAMWBaK2EunOtShDnkf/9d5YzY4EXKS0262EoS0QJoIJDTjVzyonQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230383; c=relaxed/simple;
	bh=OvmGJXWTrtFVyiq8kkMO2myxFyrf9kt4/dp6hHNffZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gFSTOU5YNdFq73y/fmZMQbo7k9Akdwh+gXhRTsdDR0OcqEzjSmOHYFd0escmWclV5BkkN6vL/r3Eusfjn1WMoGBvZhVOHuPrX46DdkPqLY/sPpA/K9x5v7LF656Bz0bo6dVZpQr/Silr/PsBbTO59IZbuu8LI1PYgt6/VRmBRFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oy7JcGWy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvT4uPx/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oy7JcGWy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvT4uPx/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o4WG1470600
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=; b=oy7JcGWyEuzYQ3r8
	gYpKhW6DhfMXbdHV339j851MenRdV+yKSLpKD2DxeqzhPTy8ke0XdBDG7qj+KS3n
	ANukqof2EimQ0gc90Y2/8LkzgdpHVkAa26wgJSReWJHXbZXxpuWwXpK+B+Fp6/DF
	kXkWemia0zysztzlcQp0rqQR6rTJKcZOMeA3vyGlS2TOkTyxNDTjpvnH0aYyRZeS
	KPGGwCvEL0ce1N/HOdQILTcI5gee4KXR+Iw+InTFdrPTwt+QeeOougt0tM4umtHl
	luC7MZMw3ass6PuZ0QmaEodmQcJyJ05llYeAChOx27ZnaLzvoAsZfm4aff6UMq+D
	4njxXw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxqfrxmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:46:21 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so2509759c88.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230381; x=1792835181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=;
        b=fvT4uPx/voBnzHp/eSZ9q5C6RsQX/5sXAJHIlJYD/9bzULKgZcv83p4IynWzUGsy5F
         eD9Puu+yrJIdr2LfSzEce45Hz2qNilSvujSFYrQJvnVUQ35BbjYte6Xdjsm47uASoHQV
         1ULMK6QMZHdTj56rryFIaviGTHWt4SttOweCDAusJSKiUcPDXv71hTsKvcTZj95D1NTO
         UUuCvVCsXJpV+8zN0ZRt6mDAMBqyUVuWYfzGn9feLSXBRWdWPOT06sbsMnDxQzAqNEwv
         FHNEfuxxx/++L+z8ETZtOxrDuNGocd9mZeUwqfDb/7EX08VKnue6SUJ+0Y3XKKkVRIV9
         hvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230381; x=1792835181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=;
        b=LN89Ml036iPCNQniqgOEYaoW8ZExsnryjGSPvCWayF7+Jda8H7yRxT9oKEebGoeXr/
         N2h08xNo6YqG78/7gGtkFeQ9qalo+kjWxuNqE298d2o1zQEkCOkWef8Z67pNGoFL3CgN
         FEO5mx7xIGyoepqeldFjD9Tb80X13y27M9z9wem6aHW6yTpv7zUjnE8oByXeqRJa3ij6
         anpDC13DVgi2HmRa7UlvIyd6hMKTMI0mtc2A3Gkaz2TExarKHOm61u0wRg2adNgoMzMX
         XR6woKypzIJu9r2JVM69G99CHFKwb8OvKb3c/VM64KfQDJdzaa6UjKHpXNZ19PkVuIs4
         Smww==
X-Forwarded-Encrypted: i=1; AKwUvByd14qXQgrPi/CeJncPu1paA26oRHJQ7sAwDLqeDG4mV1ZF7Mfu/tFv9p4JzniwRc7ngsCru7tCyMCBwIfF@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4eGkq3O8+VXb5FeFpQ/APKErMixEAK3uILLaeDLVCc4PjknGa
	wzxxogqwxwkSOQ/G8i/QCwjCGaEZE427QrrngrgNwdUr++y0obTXOmQSjSnfrPasGGgNo5hcQGf
	8Od8b31lh/zKkYQx2rlbNuDDSjVxMnPUWujnR2KdMxnGYmu/ms0c4rZpgidgRsQAx/GcA
X-Gm-Gg: AYBFou0pOBFQ0bmeY0SWSHgiHn/kjAaPodJcbBIlZ/ojP+11lYYwdpu4DptIhIbppSC
	O/uf3L/44D8tkmT4Mkbuu8CwpT6mJBGvT836MzZ/CxXJTlZB3U8ilHK8IarMrTDNxQpQyMS8Mp3
	x7Ls9xTNF3njG7DUSoL0JiGHQm8qR8Kbr+pFj6IWHbeUnQWOCgYEpVfsokoSZvRkxnmNocZE5yb
	WqEJUY4ho29uDsIYOgmOrzzAdF/D8xPZtjE3naSP2c1XQqNSA27FEwnwbCAE5yemk0QCxcCntAr
	4c6qvV6kn0fxqzoSbkgl8FCbbSSwOsb/vvWKfM5QXekP8hUhEbNN+2qQ3obBq0VK1m55kEctfY7
	+Y5JwbrxdwXmC5sCQeSgFxSsLhk4BEQ==
X-Received: by 2002:a05:7022:ea50:b0:184:ad2a:d1fd with SMTP id a92af1059eb24-1851434f3a6mr3139766c88.37.1792230381154;
        Sat, 17 Oct 2026 02:46:21 -0700 (PDT)
X-Received: by 2002:a05:7022:ea50:b0:184:ad2a:d1fd with SMTP id a92af1059eb24-1851434f3a6mr3139733c88.37.1792230380448;
        Sat, 17 Oct 2026 02:46:20 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:20 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:16 +0530
Subject: [PATCH net-next v3 5/9] net: stmmac: qcom-ethqos: warn about
 legacy RGMII PHY modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-5-26a8beb44b8f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=1435;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=OvmGJXWTrtFVyiq8kkMO2myxFyrf9kt4/dp6hHNffZ4=;
 b=ZnbcXm8Z2hi1B/lA4I2DjR/FLx1XW9n3Nru6ekJc69aowa7T3fWHXOPwCuPq/FxiJ/AKG4EC8
 Xn8j+raOiQ3A23k87poAvNp7QKPVaWHVZfXDNKxbKGRYZMUyb3vkDZc
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX6lHI9em58vsE
 2PVG16VUCSYdES7ytWOwhrKleaySXPxzPEIjXYOT1JveCsx/a0EnZ/a2fJdqxOc6qWAc7k8t2Hx
 8pQxZnTOihstBxiOkUMHDkV4kdB9ERc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX0QhP0ntW/Exi
 0CDBVtzitkV0o9XpkOc8ypNzXNS5hzr+qDdSf6Kcq8AzxElHPVmCY1/LDxCeZn7gO1gCMfmNM/G
 JR+UzqFur47mg+z4mc1NbKQu+pgfnW3OIlkOI8pn54c8O/t8QP0ItE8nbWDr3dix7VpIaYbLN1S
 slKqBuG0LKXK10vXHdfflMRqFLRf9YtBhEzu8OLO1hzFpyw5kCswmpxTxEhRF7C1rTtFpuxTSQW
 +Ts+8xwR/tMwldBD6nzFuSyGCBBDyItOHiaIyIlxtLKDEdoyGDyWo52w6QSrtyw/ltsW5crdm8v
 lPng9ujqgbwoB5FpjO57p2uEXn5bm9WxIohLYxiMs6/GUBClN8p+x6JKnqzBkYd7NVGhDKBa5rB
 K//dYvOiPaL3QphPFS/ldi36ymhs9AapKFlkENe2lPX6j6soMkLyggdYd/osTsZ8EEOqCD72IdA
 m55oOzCykIgDK3yu11w==
X-Proofpoint-ORIG-GUID: 4oeCaoQrNZgWkVYfUvc2cNuQypshSkiI
X-Proofpoint-GUID: 4oeCaoQrNZgWkVYfUvc2cNuQypshSkiI
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ad343ed cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VSm8jR0bnqFplKljzc0A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170038

The qcom-ethqos driver is moving towards using "rgmii-id" together
with PHY-provided delays. However, existing DTBs use "rgmii" and
"rgmii-txid" and must remain supported for backwards compatibility.

Warn when either of these legacy PHY modes is used to encourage users
to migrate to updated DTBs using "rgmii-id".

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 53fb9de4d92c7f1b3c51c183064024f06150444d..a92bf4a6a2dbd987893bd4a3890df770bb7a7e56 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -764,9 +764,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->phy_mode = plat_dat->phy_interface;
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
+		dev_warn(dev, "legacy RGMII phy-mode detected; consider upgrading to a newer DTB\n");
+		fallthrough;
+	case PHY_INTERFACE_MODE_RGMII_ID:
 		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_2500BASEX:

-- 
2.34.1


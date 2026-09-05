Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13A317BEBF
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 15:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622172; cv=none; b=pk0NBNlSmvTbr5E7+jbnBU/BS7zHDO/QGh8MvKI8DVnHGTajVc2vmKrsC22elP5fOLBdoE+3YVrYAD0xlagzLNiPw2wsVRRT6qt4WZO5xWZa8QFewHwd/cwImlpcNTfp8W965VK6WlR9adY8nOw8SVgbWdWjGQBFt0uM50uD0oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622172; c=relaxed/simple;
	bh=Uyo7hXJaEAF1gH4XY+cmoRAczUbVpxvWUGMccuon35U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pV2T4kPX+vB9IhOqZ8bmlQpQ46oR5F4sdBrU5RGwDUss5SXedLWREyBaF94QEEnX8giHahvHlrlnVLfPNxFwlT3GerUml/+78F81YRtUoF0LboczcT//opLLMXEwdCMW9iF6jDbobI37VwQ63crEio/NbBZCwGwzIGt59uR9+rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuzICB/w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRVit5UN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuzICB/w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRVit5UN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685EhKr82001997
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Sep 2026 15:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tTZTpwickzeEOAwCmlEb7yO25dW4SXzxijxCeKA4O0A=; b=TuzICB/wAXrp8Auc
	kwsrO/t2aw8fVvtUQ0z9ewxvcdYOx7mwlTxf6BT4wy6hFLCGEldJVOpZ7cvSlcGz
	WTfhOiGXYpRlaFwh5yJe0E5cBK4WUBTQEKLITfLV0AgL7SMiN3MchU2nKuLKezkX
	lopDAHhDBrHKdh2hpjVn6aO027Jledi+sACKgWu2EgJ5EDrGChJ6tSQtvlcsqZty
	bDPnWCmnD3SyFNq3eDhoTahU+BApQBXZ8C7bxHXF15FB27hQ8Rh5gAFWhzVIIOJS
	xufNEkGCIz2chRcNV7uEA1wRAITPwLAT3xhJV2p3nJJvWaUQzflRJND9HhD3aGHG
	hmKKlQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbf8heqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 15:29:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee1ec30f2so23780755ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 08:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788622167; x=1789226967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTZTpwickzeEOAwCmlEb7yO25dW4SXzxijxCeKA4O0A=;
        b=fRVit5UNs96qcm5AuPVWPOIYerMiR2IQmx1pnvaj5Lw13W6qGeEzYPDYV6Y+QdhHyP
         x1cct5gy4vsMClh8VO+wInZZTs604RRPSDIBxMOHbhFYnEcbA9QzXoLjtr+qKaE3MH7p
         zHRXUZp6onL4rGb8FxXaYPMBom3ps6C+pSyfHbsxNsuWrncg0ZgJBZDf3gnh6OFskGeQ
         XJJWuxqDbND2Z5eHE3ZG5a/ddifktcyC1y05kR55Q3gwguWazjV/BOsEOuxOO7v9p1JF
         XSn6EFqxkxJiGJ3HIGCTKGlfYdMBqISDNP+4QK77ZRvOCNxRt5ocKgYw17etczTXtsgh
         hMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622167; x=1789226967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tTZTpwickzeEOAwCmlEb7yO25dW4SXzxijxCeKA4O0A=;
        b=foLNYrbVTe69cAmSl3p8jb0ycGxlEnCVFQ8iqaiTvyU2HQu/3byXjY7Q0n2+LbFx1q
         cfXMF9lyW3dxxDerIH47KFIpYkLhGsFKMqtmyprkX/U5wicP0aHFoecfFXFlVtiWXKOc
         1NfXLfEWQF+K+CPuO3+f1UJGJI4Hf1cUf31Y5KA0UKdevU3ubjvooIRzsKt3x6MK33ok
         e8n6fsgwP4uWZXO0moVLaCQbn9RTlBCEQQFZxHmNoXDplmu1zMhUqybjn8BSBIlIng8p
         IoQdldD3HNQfaCI0OlbNNGo4wpjV2culRGdIdE3ZLCEw7y9wkIEJhnUHX2ylFqXUXNOd
         iiPA==
X-Forwarded-Encrypted: i=1; AKwUvBzKmjMoLwbBPq9acAokz6Sfv4uj9fD3O/lZIAXBkAjEYXAWAN6GspK+tCv/F0sb1OoM1wakNlBRQpoRfASq@vger.kernel.org
X-Gm-Message-State: AFuF++k622ezJDn8uLFglhtb9cUthUtOk7sroDiS6nYJNgSGMUo+HZt2
	t1VW6+GsuD00qpG+SSPK5J4YibiL0ss3XuN+RRJYHJbpUAxtE0QrVPRF538vWTB0tUT7Z2LDvxG
	ATuAQyEymTH0EAuJUwuRGFtDQYKIkgMAovK/zGx2VGebZm6IYy/GBS5/E9L7yJWuLxCq5
X-Gm-Gg: AYBFou2G6mdI8o3nQyE1FkJgb5iQyChaY4ICL25VE8g3Dis4+gtUxm0MCzoeX2zbaNh
	GPxhS/1HIZ2wN7FefBXUYfljL7SnZxD4Ai5GS9IsgaclQ74VqbkaVQU6eOTePamIGUkkdCwcJlj
	SGB420SWsZtLjnlOBEVFuvSUt98T87bOTB02+Uh2An74EajIGGXBGAE7scXE09PP50dSSH7umSz
	gwyfNwlEblYSNDifz+e19qfNYfAO8l0dXDXb7cpmDqcd5Y3WiLs2g1S6rxl/TJvyX7QbuldjgaA
	4Qj+C9O5Cd9uktHPpZJFIPYDOdBRoyfSajLi7AvL3AmQFwd/t2NjN4OTrMKxgNFpKogw76QwHOu
	wEDAogTVoIsnSY6WocLciMhFvVaLqzEm8HUQwrIVbaWQZnW0bWOBpT2eqxl103fLh3FeFdQ==
X-Received: by 2002:a17:902:ce89:b0:2da:e967:7953 with SMTP id d9443c01a7336-2db125f1626mr175066075ad.12.1788622166544;
        Sat, 05 Sep 2026 08:29:26 -0700 (PDT)
X-Received: by 2002:a17:902:ce89:b0:2da:e967:7953 with SMTP id d9443c01a7336-2db125f1626mr175065495ad.12.1788622166057;
        Sat, 05 Sep 2026 08:29:26 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm23592635eec.16.2026.09.05.08.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:29:25 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 20:59:06 +0530
Subject: [PATCH v7 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-eusb2-interrupt-v7-v7-2-820cf5377a70@oss.qualcomm.com>
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
In-Reply-To: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788622149; l=2281;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=Uyo7hXJaEAF1gH4XY+cmoRAczUbVpxvWUGMccuon35U=;
 b=5QchFc35Jg6+fBq4P788nJWtG3L3Yo+D9VMtZnp/+4UXnmsYyJtl1KAulTFo3ukVADJW8/zVL
 EO9jE2yBSFXAqy2xcHlyjnIwE1iH+gBwcfKMLdKiiGKeMp3F+K8ENgt
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX9Q4zt8+SGoJh
 ssVD8oKgAwK0RY2JrGisWB+ayCctZuCE9QcGDhtAn7gzua6d0SUrPUUXCU0AsEsUKAbTe+U2lRN
 +rnbhLAawjS6UWgpqdpDw+oKfQNg7MM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX5c2vzdId5mv2
 7de0pLT8s9VqtDiC1q0j31+G75CvZDRoKIS4M7/J7tuxfHj+lAlDnQt4AvnfX1uLR2PQj2MfKUN
 GAF4RP9Qy3Jmk4UujXuSnT+esCfOgipD2lfwhDEnGCB/xotm9ncdMgBcXYhamwyGIBTAGGeMwCb
 hV59XNRlX9/9Cp0QAVwva+0pHoq7Bx8WaOWIMjhb5L1V1uRsfgqNlvqR4pIFy9PwayEo16f4kEU
 FXjVnKS5c3yh83l9JigMFMtkc2r6kL1EXV0jAywxyQD7wNHj8kvM0k/3M2s//FoAucU7PCSFrWL
 SehYL/pslXyNHY0p1cj984ZpqlCd+DTu82sVuPuN+t5IWtwc6d6YSv022sP2y8zJ/1x8LQZl+zN
 lpmiUovb5d/B6jGITPSznZyb/DzKT0FTtMzWPOokpH5phVTIFbtRiGmZI0tFn4ssKhEwrntC0Oj
 8M35VklAi70rYjLwMAg==
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a9c3557 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=YrurubeZKOWHlXb_luAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: rBuapzObpYXmM-ZxGvzjAsy1h32oFgo-
X-Proofpoint-ORIG-GUID: rBuapzObpYXmM-ZxGvzjAsy1h32oFgo-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050170

In cases like USB High-speed phys which can be either USB2 or EUSB2, it is
required to know the type of phy (rather than the operating mode) because
DP and DM interrupt lines need to be configured differently for each of
them.

Add support to cache the PHY_TYPE and add the following helpers:

- phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
declare what type of PHY they are (in this case PHY_TYPE_EUSB2).

- phy_get_type() for the consumers (like USB controllers) to query the
type of phy connected to them.

Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 include/linux/phy/phy.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288a..038c2b58bbe1 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -21,6 +21,8 @@
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
+#include <dt-bindings/phy/phy.h>
+
 struct phy;
 
 enum phy_mode {
@@ -152,11 +154,13 @@ struct phy_ops {
  * @bus_width: Data path width implemented by PHY
  * @max_link_rate: Maximum link rate supported by PHY (units to be decided by producer and consumer)
  * @mode: PHY mode
+ * @type: PHY type
  */
 struct phy_attrs {
 	u32			bus_width;
 	u32			max_link_rate;
 	enum phy_mode		mode;
+	int			type;
 };
 
 /**
@@ -262,6 +266,20 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
 {
 	return phy->attrs.mode;
 }
+
+static inline int phy_get_type(struct phy *phy)
+{
+	if (phy)
+		return phy->attrs.type;
+
+	return PHY_NONE;
+}
+
+static inline void phy_set_type(struct phy *phy, int type)
+{
+	phy->attrs.type = type;
+}
+
 int phy_reset(struct phy *phy);
 int phy_calibrate(struct phy *phy);
 int phy_notify_connect(struct phy *phy, int port);
@@ -393,6 +411,15 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
 	return PHY_MODE_INVALID;
 }
 
+static inline int phy_get_type(struct phy *phy)
+{
+	return PHY_NONE;
+}
+
+static inline void phy_set_type(struct phy *phy, int type)
+{
+}
+
 static inline int phy_reset(struct phy *phy)
 {
 	if (!phy)

-- 
2.34.1


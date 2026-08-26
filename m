Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2AF33D6FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 17:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763851; cv=none; b=BUwF9ozRx+EWbslZUEK4W/igf7XAprOVeu9D/PpjEYqjFLg5cLZ3GfgqadPiTszlp3VGaLUrpMa8FDgdZjI+3SSPWJ2qPYPUMFNi7vd52874EuFGthG//6dmuoet1xnExYFc01sThK1onKyHIwrRlRajPWlrlOUe60wIbaH6MPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763851; c=relaxed/simple;
	bh=XU1ptAM6EfnwzxCKISypTLGtRTu3B+bY98zEVbWVya0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R7QhGuaIjWGj6Qe4pCYU4JrVd+9bwNLYaAiQIyjqHVhbhi580bi8yDyjVwm2jntoWU7frnrKfmv+gHL+AVA4ttAkCE6SHZiiozp2dOWdtcTrdsnaP21+zEQSMWSDnhmLLawrHWyCcswVAkPv21KxIy3K10jM2uHj7/Kq+YGyygw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2Ms9lGQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+WArVxj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2Ms9lGQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+WArVxj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGuf322548577
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 17:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0k3+H4B1qpu4qwyjsM0FEIjECEIpbpZmm2blkY+EjPo=; b=J2Ms9lGQoNzDyXdW
	1jty+4rgueJGi4vXkfNZluUY8TTj7tMwOFbBDIeVODLIdsHjOhGrLbz90xrYmxzQ
	HViZhxIVHEgfBSQRo9s5TnA4LThVNywsxwHTsid4SFDcGnOExL6wYQZ1C8iHkT7I
	nTgon60/shyhhXco3pdsGWeigqXXVMB78nK5i22smYTVT01VadIorRRnltSVhxMI
	zZ0K4bNfWz6YSk7DTZYS7cIyvDby9wcWOm+5I8i8vXB5+3EfnZua8iNDaeixxMQA
	/EpWIXxnElftHrEFrTBP0ekRLZcIV7NQyfr7w6vviVPmByUTaN2qmcicaznaTkgU
	8+LXyQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1taup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 17:03:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d63bad3d09so18785905ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787763827; x=1788368627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0k3+H4B1qpu4qwyjsM0FEIjECEIpbpZmm2blkY+EjPo=;
        b=W+WArVxjUpMJ14gSDzyr4u3OQhATPMViJk6noSNZ78yyivIFp2GuCF0uwEEdjS2VOE
         EgtV37IknyUg4NWptbK9/UJrJFadDEy+DUyDPLXq95cIXd8A5e8Hl/xvj9d4V9cX2YXC
         DQ038ICD0g+KWoDT3JVJcI5addKj4mQqBjywA13u7bqtQBT1HUkgtlyGZf2ExzieKptG
         hWsUSuoZfP0DEDfgpkpQ2yIGZH2KUOSKMCylaioCVd0Nh0wfMz6P8/FOmiP1OO9vDKMi
         WUbkaF9i6VDUFAjaMGd9+ykcDB6MS3QegSfhkCX6NngXqYDJX36ZiLRsFGyu/iUrIBHa
         KzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763827; x=1788368627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0k3+H4B1qpu4qwyjsM0FEIjECEIpbpZmm2blkY+EjPo=;
        b=rLQjdu6PG7VJBW2SJU1Wh+TjhgOyVh+53KsXg7HHPFkx23SEdyvfpFZfIfJ0klOYie
         uziwAqWsV34OYBT7La/4Zrbuvaul/SaSYiUl/TaVzaQ/PEhAdFTMcu5b3w4VbB97vxWk
         t4a5QtcXX8hggNmhqlN0EYqxpC9T9YXm1e3jd1FPqZFoM8jEYeNsqG1wQqOYhS1nxzQa
         GvZk2dzTIUjaaaKhZhOZJG28+gFE58jHxVj+Lq/NzPa2B+lTObYYXXe0wncFxQa/h/lv
         z8a/W+URlcQI+rCZg/0GSef5mcyiHX9s3nn158lgvOHs1pY6zMwrYrj1IHeSD+/B3DTv
         T++A==
X-Forwarded-Encrypted: i=1; AHgh+Rp9SCUiUInKQdUU5LHPE3ehrb8ycw/Djn2Y966o2eNN/RbPFDIF+a10Nie981V6niTmp9vU5ahfBWULGhWl@vger.kernel.org
X-Gm-Message-State: AFuF++nxu8HdIFnRec9DRLGUWmpqSYCVvnXdVNgj8+fIg0eyUXbnDu4B
	NYVME6FJzRjXrbeJ0Gtn/ch8Xh3l/VwgHZgdXSCZ5kjLgOZJ6WKqS3Ib/eEPTfKck50ip4UCp9H
	p8rIhqedG91JhsA1uDzYHdM9FdmG1+gFgibV6QJeT2v5/S4ZydeVqGXfhzWCNblFdRi+m
X-Gm-Gg: AR+sD12mZW+BHfviiI2u+jTUANXDGwPsHxK0dcydHHvLz9HEaE9xdu2/3tYoJK0ZhPg
	5qFt6BpZZwgPCfDMyVuxyDiJBszXJFROZ2tYC/6kQzBfW9qUxw4et3fVbD6zmD25KK+DPYGMWRW
	VMeaFr5KuEQLCjSH0LORRPvi0HJEKWT9T9LK23dJz7lwXxSLj6sH6+KRpSnhQjyICEbmPgmHJor
	DJvjnpOngTJwCCzM1jDhDHXSx+fkk0Zl9Dh91PO4LSJHgZlVF0V+a4HTIFlVf6yxstOBhmo5BSg
	MXB0qpyOXzB0YhZ+XHjz24AxMuXp6fS9OgQjGDJJGJIz0yqJaqzoLwsKEPb+TDAVwFfnZ4nqgP+
	mD1f8YnJd8a5LyuNT9/K7yH9LIlg6cuwh6XqLW5EuU1OY2T3uJZKMNjZp06o3v+LaWmrQfg==
X-Received: by 2002:a17:903:3243:b0:2d7:2677:4355 with SMTP id d9443c01a7336-2d7267747a2mr9960545ad.3.1787763819625;
        Wed, 26 Aug 2026 10:03:39 -0700 (PDT)
X-Received: by 2002:a17:903:3243:b0:2d7:2677:4355 with SMTP id d9443c01a7336-2d7267747a2mr9926445ad.3.1787763806509;
        Wed, 26 Aug 2026 10:03:26 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70498ca3csm9938285ad.31.2026.08.26.10.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:03:25 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 22:32:52 +0530
Subject: [PATCH v6 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-eusb2-interrupt-v6-v6-2-ae2601cfa80c@oss.qualcomm.com>
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787763791; l=2226;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=XU1ptAM6EfnwzxCKISypTLGtRTu3B+bY98zEVbWVya0=;
 b=nRTL3Gl/PRzPtuvHmkGijqsbLBwsSkFNJsrC/6RaBj8Eqzt4P2wULurs7hkAe03n1JhDZOq//
 hRYF9nz4eFDA/7aNXVlgMEAMFugpOdBb37GFCakBXzIiuq8K03X5sXH
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: M8Td8cgoseTibXoJrulxU-B9Ba-tG81s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX5QILMjekAnJH
 ii0hPy6Y8GpJg5gYOe53Nhzm0UPd8BmfPkNVwnTF6GVTNfoEpvicWiGZKBqD50zqlkMp8Thhfid
 3iza2wLKC5w0fbuJAuBJvDt70iOrb7PZCqkPkdBinNaP+K3geA3hPdD805Y1DV4wCq9WUe5FLKi
 fRWgvpSk/fCvb/yU4yXYR0R5jOazX9h7g3Uf+tzgkhcAl8dvaBEFm0/7IZjlcYSCkEGXBFQp0Zs
 /oaC5Yrl933I6WAxyzibsWW5weKE0k8m0CuHnr6PbzOZ3qptoXzw/XWh1bUp6IcxYxZMGJbUmvk
 SwQULt0TDwIgVsEEMl7IWW/ENAaU5qCLGyDMS5DQiGRY/QbL0CPkBz799eQICrdPApl0DTdWjb9
 Tur4t52BBc1gbANYFAG9btGpGZa+T0tMm7ikgo0EmAkNWRbfTAdxf/Ri+hDSGpLslhPaHshm4Ye
 vdJqapBQtBjfOfGHk+Q==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8f1c73 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YrurubeZKOWHlXb_luAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: M8Td8cgoseTibXoJrulxU-B9Ba-tG81s
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX0zhokmZ1d09H
 Qyg7FEG1nalJoOZvsMoQE6ZCLXhTDnOjQfbSi8NRda3r0Da+nfh0RpIbI44LfgocX1y0al06STg
 MVlEyT6S05AoGFo06JuwEScbohm6bwM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260141

In cases like USB High-speed phys which can be either USB2 or EUSB2, it is
required to know the type of phy (rather than the operating mode) because
DP and DM interrupt lines need to be configured differently for each of
them.

Add support to cache the PHY_TYPE and add the following helpers:

- phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
declare what type of PHY they are (in this case PHY_TYPE_EUSB2).

- phy_get_type() for the consumers (like USB controllers) to query the
type of phy connected to them.

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


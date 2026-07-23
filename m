Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024E943CEF7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803175; cv=none; b=EGs5ublvpHUbttTNOcFR4lNszfHYUJOkbfySQwSpQ/s01lh+DiRnB2sSH/xg+dN6DOso1e4J6JCUmDpj1/s2zWyclwDFQRSpJsCV/GVp1K8jk3kE28qrqoLB/S7I+GotTku+bDGyrkh+CBWqrbagto1Wt6Lglj6YWzTB4O3RVNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803175; c=relaxed/simple;
	bh=N3OAJXy/DJfnjpR6c+bQ2PAdkb6tUhmZWSabZ7Y5klE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AeBUg0WKaTp9Z6T1PrH/rWy1sHT3S8KjdRQ72tQNirop0kgr7EwbSscWYczM9Hjss2cE+y/mt+Q59dkM1Uabcc/SzxeOjJGnCIA1s7z63rCn8fD8pGZWqzpWzEzaOQSM2z6PhMFar3z+2YJrSeuLxx4nDAh7GGGjt3PkAOm/0s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zj6fyLMV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGT8cWsm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zj6fyLMV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGT8cWsm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qfLw3045134
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H+7dF2lLb7dqWsPeNHtr0YlPoxYnTk1l+rcmlZpTPpk=; b=Zj6fyLMV4Oj9ZjWa
	kO7B35dVsQ29fr/KD6bQkwsBBNFarsEh65TrDBlJ1Y+XRxAQE4aGFzP2tqzcspJz
	0dsTu1aJ82/UAnmPKUH2zvXMWSNeNnmM5wUbZ/53T1g3TyJg1i0xdPje4ufPZUXI
	fxt+CcOXSvfI3smxVUwqAdXaGqhL3hn+kqJJED2+/a99oMW/aNydMjj2Ab5sLdwE
	QfFqMNsDczk3ramMTBhkGaPjLFpudFlioABaTs3LZQQ8UjqKNaDfjBeh3tpvH5cK
	Nq87rrCl8Joqunq//bqLnKA3UpbLNsIpQ1npjGFVVVGpJsnADaLuWuggGnlKon/r
	LSvvbA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq8nka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:39:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84842381150so1008122b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784803170; x=1785407970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+7dF2lLb7dqWsPeNHtr0YlPoxYnTk1l+rcmlZpTPpk=;
        b=eGT8cWsmbSHVdUcvsSkjTIbNsBEiVZmL2HkFN6UbqADguS9a5ODk9XKFJoqdulH9FT
         3VVNkA5BqzOMJQqbyxnzw1/fN79DMH+uJS2wPjg8o9rQB9T0655WBgrvHtQ3WKt1NARB
         dcvvzkqciJGuC2QW08RYN1eWOQMjc8UHaQtn7kQc5TcPoYUNnbq2+iVle/Ly8cclGW+f
         wCA8Aze7rj6SXsJm5LR791W6IrccmFc/NLR3efcimmU3D43Zz+RhdcMsi6+yKQz/XF91
         HKeR7ZtLknVX5OTmmLTLGAnM51fD9QxuTo0qzjLBWVrpF3I2MldlxJMv3pInJtMTjWLq
         rzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784803171; x=1785407971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+7dF2lLb7dqWsPeNHtr0YlPoxYnTk1l+rcmlZpTPpk=;
        b=munM6RVtIAvYSrG6DZuMD6ev+wNAo70+zbLn/ciEHQl0s8tu/BLBo5DB02c/E8xYY+
         YK4Qy90tpOzEC2Z9ek+/AHApCJywooG/NTJdx9LlRY64vi9FFXiZNhGquqU531ZdEF1s
         yEqKHlJtEjGLWRGgMNBmp+wl/Bn3q9ZwI8/hBj+gkVOPmaA4msW43ytmqVhr3RhodQiX
         5t78Wdx8h8vUGr+IOOHPQ0xMzZA8xuJJOxZWYTV99hOsXZs1H3ja7Bf70okWu7b0E05O
         pZc5A3OYuRdGG3rqpVXp4INfLOe7GztepZ46IJ8shn03VFASBtFlCrwYUMj/tJPwMX/8
         2g/g==
X-Forwarded-Encrypted: i=1; AHgh+Ro8GO80aaHfhk1/idTaW5EpG2qSh33udq0bMhYNKgNm2mw8KnlYn42tczIYPeo0Ns3Dr/HBV69LY0Et8hoe@vger.kernel.org
X-Gm-Message-State: AOJu0YwN4usaJQJN42iObvcxW0CwsOn5JLk5wTSgB5McF8hWOAc7Ku0X
	et9PpqPVdaQ9dqF1VxdnLbY4aCv0NQdQw65YOueF0bHpKHrkBD9KIzu10UbYfeB5aM2KNkIug3Q
	0v8gV2HE3V8ty59wUj+CjqRvi4ZGZe6AdZB8KuCEyEmRXfXM0zl7wasuF0XfYTq5GqoyY
X-Gm-Gg: AR+sD13R5AvRBqIPbEM34bU/t4lHyolZIflZbZzjJ+k/TxbPIUAmDw6MZLDD29rnec+
	WqvIbRf43iyFwB254+FsLt/i9qxYrXHEQWMvt42iUwlPliw2TvBFQwuM58awj5dounL1xL3QEIK
	3JtOajo8izodWcawvtFPBV+7erT/H3OFEOZQ1tSKLvpzDMbDZfeYVd3gdPfXwnTiZ5eve8dXq7/
	gAd1WvQncm8WyWJmrmeIyngywLdKXGDlIADrXjWDyds/9k+BlxPnJ4wHi26Z4FgyuD1CK7X1ve0
	m7cG/4f6/TE90Aqi2iCUxCtWE7zYHM381TM0P5t2LFYCrjF42f7eV3BSf4hQfPlnJHpubd8/Mkt
	4ET2w1DcypMSQiW6W2xhX2QIUfFg9NH/bzcfD+BdRlnp6NDVLMCDx+XIoJSJhYEqfBMUDSw==
X-Received: by 2002:a05:6a00:e0f:b0:847:7f3c:b5f5 with SMTP id d2e1a72fcca58-84e2b7f6c4cmr3099742b3a.11.1784803170571;
        Thu, 23 Jul 2026 03:39:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:e0f:b0:847:7f3c:b5f5 with SMTP id d2e1a72fcca58-84e2b7f6c4cmr3099721b3a.11.1784803170118;
        Thu, 23 Jul 2026 03:39:30 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17604a46sm2864469b3a.60.2026.07.23.03.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:39:29 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:09:06 +0530
Subject: [PATCH v5 3/5] phy: snps-eusb2: Set phy type to EUSB2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-eusb2-int-handling-v5-v5-3-f32ea6c1a318@oss.qualcomm.com>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
In-Reply-To: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784803149; l=1048;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=N3OAJXy/DJfnjpR6c+bQ2PAdkb6tUhmZWSabZ7Y5klE=;
 b=IrTCqLlDsSng9czw0n3+5OOJ9rdmt9xIxdfQaiZt8bHlQYnXCGKX580gHG0QeUW2qyZBbxbJu
 /wbs1oEGWSNBQRK2lt9kYaK4oLr9Q0zxCxPMsucCeht7FKKTr2dU0HQ
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfXzqHPm5Fw/MRQ
 4S7e0ddFcQEstxO4f8398vqHeZtGoXxradTXfYwNcY2NAuBG5+VuMHcRy1q3yLc1pIOICLrSARl
 PqjR4TOxoZ9qkA+s8vp5bW5di+I+Q4Q=
X-Proofpoint-ORIG-GUID: cUHpaD2M-0Awlzez0iInI1-_mx2mARxW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX/WLzZec5m8s1
 GwMObz1kwnB+nVDHOxUsi//5Ai4Cj+NkGsCcgJDQh7vyiIG9XAZk7qV6FhudN6hiY8OrPHYV5+g
 /9B+EpZFeaBzZ8XbJgH41BqBulihIZU7/iUP3el/CQufFd17JShFqL2KRsV9GZwAeWdIhmrqG+K
 WR7NzgneVTXFaQfgiRJjTb/oIi7xXiwrJxUz99VA4dDQVK0pdB3lE2MwHfzK4v/8PFOoVkugsBk
 0695boIVpTXUi66D2iH5IntqLShP+J/lSFIitkiwjdFTQM0165bxBMsoxudaBkfknmII47u2pq1
 OWoSTEZdv1xOMYgHIWuck8DzrnyIuCdLLyFteH7VLfHA2bwdBfdgsSZOxMIcqqJWLjtyWKuqqEK
 Lv/etdL67qojf3XoSohfEVHnBTcwRFBTOLaUmxG+Au9O+7eA7Yf/FgtEQ4fY1ezBoZXysFpmpGK
 xLaUymVkagI60h0Jt5g==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a61ef63 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XHtVRzMgxm0A3APenEAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: cUHpaD2M-0Awlzez0iInI1-_mx2mARxW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230104

USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
connected to it. Set the phy type to EUSB2 to let the controller know
the phy type when queried during its probe.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index f90bf7e95463..e139b17bcda5 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -13,6 +13,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
+#include <dt-bindings/phy/phy.h>
+
 #define EXYNOS_USB_PHY_HS_PHY_CTRL_RST	(0x0)
 #define USB_PHY_RST_MASK		GENMASK(1, 0)
 #define UTMI_PORT_RST_MASK		GENMASK(5, 4)
@@ -597,6 +599,8 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 		return PTR_ERR(generic_phy);
 	}
 
+	phy_set_type(generic_phy, PHY_TYPE_EUSB2);
+
 	dev_set_drvdata(dev, phy);
 	phy_set_drvdata(generic_phy, phy);
 

-- 
2.34.1


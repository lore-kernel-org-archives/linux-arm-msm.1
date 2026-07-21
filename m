Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E364B2C1594
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637977; cv=none; b=iGEfOEpQVWiVJHVHSA72XDzdbTw+O3RIRD6vsWnyKH16hAvfHmo1XjpG6mizzUxQpsvo0hZyYPl+LWMRGm+khMTPNrQUMFgk0emhZ30Kj0wFDz6gXE8AaHZIqdwB+S6Gz2kQVRl4m40k5kXj9EPqTdUt9EKdvicqFF30aWW6NYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637977; c=relaxed/simple;
	bh=HjBkVmiUU/P5vmEBl+OrwDdSuOYE7uInCAohSie5WvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kwfzqNLZHGT758qJs99jNgsPtObzFeO1YZS7xAa4IkMlwXiCvMZnndsekoqBZoABoWqitPXGKuvmV+GpWsDsBif4FqvgqqavJN/3OKSGvFJwf/ggF7ogJgU+8USh2r1rN7ZkgSBp0XINg8Nz4MDltHVKPE+m0jvvbqAXP41pfXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFZdtmXH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TUP0HDq9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFZdtmXH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TUP0HDq9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARPG81482215
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i089wZS1+hm/uZCiwjShV9RCkdFlzWrKsI3lK7jIBdc=; b=mFZdtmXHOYI0DsnR
	yPfXavZwe6IQO+7t8le4c/Oum6GApRcXOdDbU/KpTnSN9+x0l/Fk8dIUBTkQ/PzF
	Bk8uR28ugXN0POPQXGI3m5T3reVLKq3UFkK5HZlFSAr7HAxXjVz1sas87V3j5iOX
	piyx1/C5U3Ul9c1YTlAX0flIg7UXTRGGns177DEB14kJW12FbJr21iC9QNgR1dPD
	n/B33OWMK4kmLadFR6uqzMFrUtdWqEwjz28eXJlH9USZWBwAbf9LidTJAg/6vWll
	pcxtpMFQKoAur+7xQbM7iGE7v2IGuJFjtyg4I2TtdpjxEZUFS4KF+rKg9pMfX1Qq
	6/txTQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqnbd29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf1c86963bso42935895ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 05:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784637974; x=1785242774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i089wZS1+hm/uZCiwjShV9RCkdFlzWrKsI3lK7jIBdc=;
        b=TUP0HDq9wKUYIcE25E+kdZaXeZUIMlJIMLy61nnpVEy4S8RhOXTdcOMqCH1icHBiYO
         74g0TwNbAMfnr7xLpUxHLtn4XCWTInZIcXtW9rsCkMxeAC/skiaFj2N79H0n3C7AG/1n
         MzwciNcgTq8WeEmeDirGqnHXJRatF4C/5pbcyIrbwkpaRHa6AOxwuICfF1OS94H/F0R/
         rvYsS3jnW36Hzrma1ScZKPsupCbTIsZJt25eaVXWWteZ4biPuzZTecJQnxQQTevTRrNU
         NoKU7xL14D0FH9M4iLnPdqm6rI6EDQUor4wviVvUY6jUOD6tTwaexMOZKxmL3GeEehSr
         YDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784637974; x=1785242774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i089wZS1+hm/uZCiwjShV9RCkdFlzWrKsI3lK7jIBdc=;
        b=Uu+yJs8t/Xg32FP8GNtR7nLuYFga5mvOYbabgCslyhQNxuIh1IDaDdTh+Uxsm5WEZl
         887vVVXS2q9XaE5FnSoXtuveI+BCNaW+X/4GM2eMjr4vwN6SIUblo3XyewSJi3UAFVPm
         Oc+syU6LCPxcU1qsx97fkj93bVKF+KwsgJPXJK+BMS81xOKwxwRtE6dOVTK1lXR5+bAu
         4lynJTayUXE4oCOxwUr5nbBDSZ7ijUofd4u1Kxeobsw68pRSX4jVrbZNI2jJaJH4C9Sg
         qmX+CNVo53Kg3weoOWU3+Z3VXmk4wUV/GWQPP/YCuG/qN527R4XByfzMgypTZ/ggwLNF
         2mhw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7Rzbn4jF2vB63iglRceF3HT0VvAvjvQx2+w/dhEQNnwjrCdEjk2Cr+bT0wfGv2U7080gfsM39EaSXG+kX@vger.kernel.org
X-Gm-Message-State: AOJu0YzNDmkLW6uNAPorLS9J7JZoypsHYHmjLhuA8QqfWCZktPHtBwhO
	hIUTN2OGty38fZahT+RqXqtkaWrNBj8edVRf49pbExkrxHxa3cKlDc7YnwryfRojUCAwxHkTMr+
	QJnYD1InLfhBvp1JG85HjRNbMh28DnI6+hJjxhQiWlPu1Tu6VQr5rQ447HviMcVfhpGV8
X-Gm-Gg: AR+sD12VJWPHkcZACrlvCWs+etf7CiDvFR4NVbAsXPXVA0XUUzXB4SsSb8rK+KKusUM
	P1zQCodIirg4NqJbn12ZlwVybDRLzeC684SAeO/DOk8z0Vz4viqL8p+UD5RHu6iffJY9dy7eX0S
	PMfBU5oQEkhWyIHNgdRFDvBs1j3rHNXiBRgFxA2vucfCd0QBizaE9NTQ7kvK1tYppSk6l5Qic9a
	rmR46a05ffp4/Po32WcBGPvOiNsBsM/sJ+4TuD+MkbWguy8qHDbIDdxXHa+8AzNayuQ3oYhRx8y
	75CdYxl44QYfsaSG+SXY5sKHg9Snsoh47uurt2IfMZ3r7gjm1tYQp0Q3LYkzGoosXz7G4dm7D4C
	AYJnlEE7d/QUoMaMHn7CUyz59YSOxB43gmK55w/yPOVGEMRnyP3dmq4M=
X-Received: by 2002:a17:902:e884:b0:2cc:a08a:7743 with SMTP id d9443c01a7336-2cf1f4f2a94mr237661385ad.20.1784637974359;
        Tue, 21 Jul 2026 05:46:14 -0700 (PDT)
X-Received: by 2002:a17:902:e884:b0:2cc:a08a:7743 with SMTP id d9443c01a7336-2cf1f4f2a94mr237660975ad.20.1784637973742;
        Tue, 21 Jul 2026 05:46:13 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bb62sm45258359eec.2.2026.07.21.05.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 05:46:12 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 05:46:00 -0700
Subject: [PATCH v6 1/7] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-add-support-for-camss-on-sm8750-v6-1-a5f841061d18@oss.qualcomm.com>
References: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
In-Reply-To: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <quic_vtumati@quicinc.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfX8GQxtjjB9Rr6
 TZbN4tAXvOUATTaAwUqmDma23W2dfUlR3MFcd6D8Bkhh9ECdx6lHfjXdDx6+vmnSNhlaSGquELV
 95KkMG0LAvcnrKtSK0+szjREhpcHKgDwOKioEGky3lWG5V1h74er1dqQ15fch2UPvFmXZrWuQNi
 oH5LRLsWX5K2UQmtf4wzYjeYVI56/61XYFLFOd50/sAPI1jBwQBU/ttjEOwkeUxMu09qi12Vh8Y
 Ux7Ky9zX+xS07QlRyEBB55KnW8gly4EC1aZsSZaqDUrv9SVWUGlnBya8uGU5mzDiDDOZPcQFsAP
 13MmVsg3AJkJIplMIAQ8jie2w3jO4I453OAdWMNHfY+FE19f7J+WRwUSEouqhNPPY8EcujiIjD5
 uVPK+GKlJrFvzVCDFgxWrtMHIoRAWLDp/NtTm0TCICV3ArYmN4m68hy57KbvYE0ubMkywQpcn7b
 dv91ycEPKvkwsuUVxaw==
X-Proofpoint-ORIG-GUID: YoyZc2mqLXBmrL2AL5KyzFvWRNV-rmM8
X-Proofpoint-GUID: YoyZc2mqLXBmrL2AL5KyzFvWRNV-rmM8
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5f6a17 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_XPIB_xIY-Pt3-ArhVsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfX+4dP7Mm/nnKI
 6XOc17ezKfdQc0VRVqHLeqpRg+ODxDdM3ujZuiKpFbPquNBMPfNWc2oGjsHgFZTiuszIipHqJm5
 nv1MWfsurRazRCnDztq6tRZ5HbjnZNU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210134

The SM8750 camera subsystem exposes six CSI2 D-PHY blocks that follow the
same programming model as Kaanapali. Describe the SM8750 CSI2 PHY using a
"qcom,sm8750-csi2-phy" compatible with the "qcom,kaanapali-csi2-phy"
fallback, so the CAMSS binding can instantiate the CSIPHY nodes as
separate phy devices.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml        | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 7943049834f9..95375efb2597 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -16,9 +16,13 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-csi2-phy
-      - qcom,x1e80100-csi2-phy
+    oneOf:
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
+      - items:
+          - const: qcom,sm8750-csi2-phy
+          - const: qcom,kaanapali-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1


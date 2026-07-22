Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4804644AB74
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717763; cv=none; b=S5pXgnaXK+SgQ1HO0S0zLAEL99C1PVmcvFazbhDMj6TSaBaaGJdJNvAN/plS/NSpTZCf9CpwOTE+olgicFkNBhbKOiISYQgaOpMT8qw5FbaPlSETLNcYvfcRP44x/6ipFeDF9tqBqGRfEyx4XiBJoFd2lsr+qsjhbNUX+sOBcdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717763; c=relaxed/simple;
	bh=7lAnEboM05pxKLJKuQkUK/+Xj0N55Uc3icMOdr2M+eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DV4K25/EUhy+PA2VYrP1VaocC4nCNskrJ5RH2GpCSgv7YgBIWpe1t2Cl5xtIJc2MEmS5ncPlNWhlz9W2jrvPxV6rE/e4DD6U2oZxsI6rqRkmRCnxHEAt0ueOqjenkGMx9Qal+0hRW7QKB3PK4vB909RFZUAkwPB5doYjHb3LFEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzWGUdwH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+X4zF4i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzWGUdwH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+X4zF4i"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xOwi238226
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=; b=RzWGUdwHqcKuvZ/r
	InkWr5Ui+x9yrHQGGn791tSZfXfQihsMuUh4GuKlMTi91tuncT5y93T0vlUZodQF
	nWu1Hzipb1RphmcbHELQY4L+8sDCTVG0jvbVKokyEdTeF6zXxbLgZ9PVHsdfpCVy
	8rQU6LVboMs+7XTEwqRorMte9I+E3uONBPoFT9SJzXzyGpxL4/SE6xYNLRpZCQ4l
	pY42+V50cXSzd7sCkAnzmGXOsZWiaK9TgXhOjiODLCTVeYlF51kJfo/Hxax64N/S
	g8LImcW/go0mmpJWMlnr9pIe3DhwbXY35jkiMQvn1YsO0/ayube3FdfE/9MuNszJ
	Wufnbw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn1rdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:55:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so8735086a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 03:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717759; x=1785322559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=;
        b=E+X4zF4iPp60spcRgDP2NNw6u5dK0ds6jbCjAAut7x1sHYSQgeaj2/aacWMiTsMjHo
         y6vzCXe7+IX74UDfY/7l6eSMk9F2GYjuwfe30SPO1qMF2i/5PWAZg+y9ReT/dPYVZxap
         hMZu4bwh3vSQVeH+TrkwHVM7hB6MZpdoNbuwyiFYQ7V+kWEdTZxHvTdMAeQYtuUc6yyK
         NAziin84AQ3HTUv4TO3mhKMXyoIo45TiQrRPCUP3JmDpn847INL8ABUNL//kBmqInY4W
         mL6PCNNHlzRifwRtDvonaQzsWkGLELyehKKvPwsVP3pTfJT7SLZW1TA0kWjZaJ7fe2pc
         GXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717759; x=1785322559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=;
        b=LMX9Yt5hrRRTmtIk33w5i/30AStmg5uWBRNdog2hFpbqw1lh3uxDn+9dd+j5yvs9Jm
         CEavhAXR58Fkp/U9IRx33ACWB26GmdNYn80dp0a6MR2WgXpxp2f3pu9HgQEJBmLsJZ+y
         BB8BUfaS59jh5YwBhdZbDxABy5s0iTZ+EdjCQH3683WZ9DgmKxyRjF7M6r4FXcSyBRDv
         K49PmpRpJKsQPQstYDO+03vD4EeCfrDSy4F7+Jf0wy4QbtOPo05PP604zoDr60j0DLo+
         lDGv0KDs75dSeA37s2MtlGSTtdW4p68KCUupbZlEttAaI2eZO1dygLHn1U4pghq5hNDQ
         SQ7A==
X-Forwarded-Encrypted: i=1; AHgh+Rp1MUhFm8nzBoRMfuQIZPnBZjdh3tNUUvHWqjHXfmS4FCJZBExDa/Xmo51adsS4Hjga8MhOt4HRk9kyi0SA@vger.kernel.org
X-Gm-Message-State: AOJu0YycXw/HYCc4MMEe9+Wa5XA072/LEfOZomlIU1Mr0qiYDo79761X
	2wn4Ruakfm0F46FtRw2e+0BeR155P1uXyOymlxGHYcWs4iVFMTOrg4yljs31pqvdpcM5qPi1AZ0
	kYXoIBxjGVnLksK9Je7MKWtNuCQklCduW1IV2qUQedpgbKOsdWIJuBIwhsL+Lalin27OA
X-Gm-Gg: AR+sD12Kb3GUkc2X1zvhhzlinOOhUBCAp08uu5oFL3WtFQtlJ3aerk7aKpmqNWfmbYL
	/FZaKasGkACyejaH7GhisIVPAAM5UDiP1+raxGvzHR7iKUHRR9k/zdnIaq+YFLFQywmhtPCbB8K
	Eu7u3VetugBzPfhi1IzefKoYHqHvEDTsA/B6FceF+M/TV1fr0BWUA0yf3vkkZcyPmtnK68qcFyP
	48BL2dwCkof9A7UKUBG/Y4znHwNxLCfNBpQ10JQZu4baBi07YH40aQOx8odZcqjS6rOyQnpM2zm
	IsKIql8WcA+gASnt+VMNX6QmJXI1w/TkamXvJfYnxlcvMaDU3v76BGwALwEsvtkKtWvya0TctAU
	VZfm2GRuDGzq/BPQFukFqPG8Jf7/k4iobhL9xvcb+R+7EktjlbZ7UXLbdgkhR1Ydg
X-Received: by 2002:a05:6a20:e292:b0:3bf:63af:859 with SMTP id adf61e73a8af0-3c3ad973443mr23554006637.45.1784717758757;
        Wed, 22 Jul 2026 03:55:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:e292:b0:3bf:63af:859 with SMTP id adf61e73a8af0-3c3ad973443mr23553980637.45.1784717758324;
        Wed, 22 Jul 2026 03:55:58 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1302659fsm5809160c88.8.2026.07.22.03.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:55:57 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 03:55:32 -0700
Subject: [PATCH v2 1/5] dt-bindings: arm: qcom: Document Kalambo SoC and
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-b4-kalambo-crd-v2-1-32d4addc1ac9@oss.qualcomm.com>
References: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
In-Reply-To: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784717756; l=1039;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=7lAnEboM05pxKLJKuQkUK/+Xj0N55Uc3icMOdr2M+eM=;
 b=moMSMC9lQ+mFCB5zRMLYsvw/XJySl2l3P7UeGhibDAkq3tLK+dvaZMaXdsRUFrU8okcf0Glfw
 0crWhsHESv8DSnsIAlpy+Xg5gg/n5IhcGZ8VhBuIfeju/0o3cKDs0HA
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60a1bf cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=p3IoqaKxkAlDmzJvLqoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: kwDeDBtDsJ3RgpG1k5qTKiiU5-ZPusRV
X-Proofpoint-ORIG-GUID: kwDeDBtDsJ3RgpG1k5qTKiiU5-ZPusRV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfX87xPdII9wZxB
 CD8+BDKck/NHsfclrgQ+iW4CQvL1SXXw9UkyikDYJ9NvZBkNWlo2SHhOlV+Cu9clvhpJq8Vf/4w
 d8FP+g/BuSPAgfpU92x1Z/0WrWwyNlE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfX8X7y7N4DKgbR
 fY2bsAIL4vKGc+aluwu2/c8TKinhPZrwKSaXBIWlj7n61R1ENhM3+p0tqKjugYoCqdhlg6MJ5i5
 y7ysyPMnvuNkSY5JtrJHGBQ6Azhzo5JHtcuFeVWGrOF7Sf8NYCzIvEgn971MY5tcLBBvK01LUbG
 qQFZhI0oRg26DbAHeCKJRw+6t9EzS3jlJOrQvT1xk2pYW3FJ81SPysPrHhivoPXA6S0DOEFyXAJ
 ZZzzAYn7ZMh4aHYhH+feQc9EYjCCIBXObEBnt+u7Iu4L+YRZs1zrOoLS4UiAAHBih6nIRjdgiOT
 DgQ79TcDxK8nLLL3dGaGcnlR2/cPf4ZIzLICF52jG2yhlAyRLNo0IOlgRMjOLqA8OY4Nwx1VLOy
 a1Ln2QCH2jd8km+1jwDJ8s62/v0Ag0Ww2vPQ5UYUiVzJxXVWclkmhyY60IQb7AVStS+LUGD08kh
 5rR8TPJ3dkca3EbX6VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220105

Qualcomm Kalambo is a derivative of the Mahua SoC with CPU cluster 0
removed, leaving it with just cluster 1. Document the compatible strings
for the Kalambo SoC and the Compute Reference Device (CRD) board based
on it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..b0c07a57bda6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -174,6 +174,11 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - enum:
+              - qcom,kalambo-crd
+          - const: qcom,kalambo
+
       - items:
           - enum:
               - qcom,mahua-crd

-- 
2.34.1


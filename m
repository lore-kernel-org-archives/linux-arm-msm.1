Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AAC433E80
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 10:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785578426; cv=none; b=pVm37ySjDNp069IIHJEMibyz1DN11/YWbDTosTdM0X5a18Fes4qYrfKdw+xEr0iKgB05aM0DiTjP1Fhs8ItVB1pQ5EkYbz6c1jJtTwdiH3PvZFvPOnWasbpLXo2PS3k6s1KlPYtKHMcdVC8ug+tzigaN3ydnJcyuQ7dBhLIuLNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785578426; c=relaxed/simple;
	bh=7lAnEboM05pxKLJKuQkUK/+Xj0N55Uc3icMOdr2M+eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r3SFyRw0FOW4O/EGZWhsD4khqW6Tp3HhbVkY5Mm0MgTgho8e0u+8zaKL5KLOyhsH1jeCM8fcW1QW6m2bjXWw6VD0UpGitARbvMowdTWZlVgaSGgsk8uUVbPya7DRM2IlYPPsbjTFJbgWtK1DkmXjbUMoTiO83OkWCJj5DdtX2do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYQ698dq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USG69L2x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYQ698dq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="USG69L2x"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6714CeiU1782018
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 10:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=; b=oYQ698dqQF06k7S+
	2eSVha6AwBQqu0+qGFVDyJ/uHbKbZi3aFG/fFy9pT1A9eKJU/sLV6r6E0gnT1mx2
	CHwi4jgadzGMdyGKMsnozwFfLeJmXcsJEAFFSltBbUv/3UnQBUofxVoYQSh172k7
	yetRgFRh+JHg+xVO77jG5qu5n0tMtW7mPLd/kciXn8Dmgyg0BBrJlhoEQX0amyiV
	Bq6JTL+sIOz+5AyvqUUJlDjjXgbBLiMDiv5wqyrjgG/qhsweHSJRoEQtsSE9W2hN
	UxEI+sTHl290r1fZL2v1anWt6xPKuNJbmEoMfdChd7bH+iMqGy8xnHijsyvxSq8F
	34TjsA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jfrhp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 10:00:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so4405316a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 03:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785578423; x=1786183223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=;
        b=USG69L2xpAe5fN2oilR9+pOSXsfaW7OPzkNss0X2zdjHfYanq+Ipnj2z1cEavTGqU9
         poyDplgDdEfMLtE7pyw2hroQ/28w41uF6iPoXEqhLhKXkbR7HcZ5bmQWPETpM5EslTRF
         AyuIgI85RHj1HWyGFit9KEePoWEdGOIqtrCXJltlMqEhHyt1rbga0kOrzmgKyGDmEjnA
         UbHiNWI9+qnALvu81jTpr6oEDPSVAGlPwTeJ9+xIz8CbW5eSebbS1E0n3yklv/IP5yRG
         Lp2KAR3L3H0vtKRRRjaIYQ6frATHzxWyuBGpdZtnP7lfFyMHGtnRul9jyulUYo/QUevF
         k1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785578423; x=1786183223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=;
        b=tQbcj6SRkZDH1hyC/eAAbmWvjN51i+ZtiyLDKuZjQL9NehnsNre49B91bkIPvKeOui
         aEP72HbByEn/BZFr8sIZJl64JxrxzkSfEb1NQpVgg6uhLK/bA4yylBckUHiJpbR5iizX
         cNSvRdV7Ery8Gdp0KZCxGOOcDTtxwRqrF7D5WcUZtExx5RIueQiampjfmY4/2msfIZh7
         RFmF/uaig0h8MXH25/kannOG71nCFUKZMRMQgXT49IaOxkazM/EUiwSb25vNA9VhRi6X
         Ct/6kLHDBmzYeM9KVU5rw3fmg8yIpbclJx8sRmpfmTgYkEa4+aSSBsi1RXXS3o3uNFF7
         GS3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpJSUtIoYPpEbhSFcJyFfQDn4V+jZvk2IPFdfEo5w5MLwaRvJwMnMi7Pwql3IVdgsRGB4gfJUwT8S+N4cf6@vger.kernel.org
X-Gm-Message-State: AOJu0YyP3kdxCYeL/wdqWP4X/jj6KlPbE2SQ489Xf+Wg18Yc2fPC46Nh
	8VvLhJzBU5dCcyARfJ8uIKNXPfITXRqbwxIXEjSV2ofUcenkyOILqwa0HsRvfr2fa7oHHSWHn+8
	ndOvpKMNuv5RokwrCP3vIHnuaQyp+uzh0R8HzCq5VCY6lChmWUzcfxPYPjSde3oWxpnP0
X-Gm-Gg: AR+sD12urd0Jwl2EueVydpnH4f3WSGG/iEhkTRbSaQcdCU2u4z4A56KHBPrhRYLIQUB
	7kmw6qHDltVe2mvaPfgyVaLDWRKH6ayBLvUhddXpKqh0umdblnTvLUjsbOqv9f6psJTSj7bZYvc
	KaoFtoDNa1a+XmIc3UOFKVVTOm9eh8HUqOezMVpisndRC1YuYtaGZb/Ou5FFfUOZqEfW+9mxgdC
	csCXHV2G4otjHHdsAlRcPZEjtjEzvA5NN5erJjr6gHTd0ZN1gs7E+ufLrNTfV9dx9+Fdexbjg4i
	5zufxsT34EhW6iVWJPkHr3Jri+f3Np5pYSzLYEqRVHPHb5ZS2HHl5xQ88v7dw2myxbTisXWerrK
	LTtJAwSMan7iNIy7esH3W4Gi733l7bgPbol0f0dmTRoEYAMZqghdIX4jKlJD3PxgH
X-Received: by 2002:a05:6a21:4cc5:b0:3c4:46ca:3339 with SMTP id adf61e73a8af0-3c92a85eb6cmr2666982637.39.1785578422939;
        Sat, 01 Aug 2026 03:00:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc5:b0:3c4:46ca:3339 with SMTP id adf61e73a8af0-3c92a85eb6cmr2666847637.39.1785578421302;
        Sat, 01 Aug 2026 03:00:21 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04506csm16290600eec.17.2026.08.01.03.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 03:00:20 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 03:00:16 -0700
Subject: [PATCH v5 1/5] dt-bindings: arm: qcom: Document Kalambo SoC and
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-b4-kalambo-crd-v5-1-22160abacf3d@oss.qualcomm.com>
References: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785578419; l=1039;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=7lAnEboM05pxKLJKuQkUK/+Xj0N55Uc3icMOdr2M+eM=;
 b=aQrkBpmAO+lN6OTtpZop4zJ3Obiu53Qg/+5PeproPVP+eh1uuhbOV52L8eyxAdvvlnPFzKM+r
 o5ZTJ4Z/7/eBTA/VCFSYlQdUqv5CW82CtPKqpnzh92o0g2ZfgruJ9T0
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: mGWaX5GUo9ZKp2NO2I2rnCVZ0ArLf2el
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfX5pCBnGm3gXU2
 Tboawki/2rN0oW9F52Tj12jEfV2js8M7EEt4wvptMM2wEYpB3/N1b3BOcNApFYrfGyPKvK4w2Yk
 xqc/cFdmyBlXSx9qkMHBYGyr2dNmgKwK8wiHKKJO7BB3/5VfFFNli6s/0reGWXZf6yZyYFREh7A
 HD2X0xE8oYX4+6rUKMfBSeyhHnwrfOnpnM3F4KZAbJ/kQqUJWr0WjMQqYotEAr9tisle3zacqYD
 DRAPZFLYZHPZGQQZ3fHQ/LQgGxtSv39zhuCNvPCLuUViS7X57QDmAB8knTGq5evXySc3rqSQomb
 5jEyL3mIOIXCVlU+6x5lHzUuS3MaGopqtekJ7fL1WmjMKFJUL3tIS7TFgoXAshovw0T6mKOl+5k
 PKOHJYN162EsSiyHrbq91jJ+ovvm+Nm85lioY7lp6pq6TKfETJfuYlXOnIyNVm5PPD+mBsyDb0a
 dM7Hf6zgDOx6gyqDP4A==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a6dc3b7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=p3IoqaKxkAlDmzJvLqoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: mGWaX5GUo9ZKp2NO2I2rnCVZ0ArLf2el
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfX5IOkYclJCDgx
 UoVm6C+FVsA4UjlSe1EXyrMuWvzemVSRvTrZBAYXKVksbiJuGwXaXxadi0QGRgIMdxKEfirgAuI
 v1HrYuWcy2g1ed5dqWRp/h2KFlbA8GI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010075

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


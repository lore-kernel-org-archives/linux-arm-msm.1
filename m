Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABE04EBAEB
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972113; cv=none; b=dcxR5C+qeGXVDFEk25jJHbp0eVN0HBssLBSiocDqFZiRqyod05d1PscTgMBis8OdJBfB8Ni5nrpMQ59QibrClfkcYmcdNmHE4NCohinVtnUnSBBessULMimcsWGl02g6tBEXZudoxIP4c3OP4kLzjR3hMbFBPM1JTSS7vdSuq5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972113; c=relaxed/simple;
	bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UVZlbG7AEscj1UX15ZfRJxlQN8xT+Wbq5+wvRG9Cu5SoEhPP+XluZzJo+qJ0hRrc0USY5UuQoAZQ6QW+UL0B6C7dCXli3xu4sMOiyS3NiZm5aIBfNO/+nkUPkaE0YbmSOJIQ10X1Ru9Du55axErq0Ukk6pYDtrYqpuw7oSmZ/Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HnIfoncM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aveufr4J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HnIfoncM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aveufr4J"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E6Wf0M2088269
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=; b=HnIfoncMqut518Pp
	KF99unefWyv6KwxN/qzfWnOjeXIfZtPbW6wZWzwN3xcnMoKP/5TDHC+sMHSpkI4d
	sHFAUqH94BRe/rnyGUvoeagY1zaxel0sNwDWaphzw3rNlP13YQ7OxRyn4xX8BRNq
	bMrjdWRFUJl5KkdaQe0RUMJlrfrfSAaxa0o+Q0UHzt5mOcD/RDPyoSBeE8xKbrKr
	QBUXHphKyNRSk8a6uRe60QOY4KtsoXEf/dK8Q6G+sVdAXPMuo+s23EKs7JSitPUM
	ZBl5YGry0XJx7NzyW+sI1TeM1IecJvdmbW9bX4bSAjnT+S2dxKVwYdqafM5BhWQq
	ZkiR0w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49j8ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:01:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c039041433so132644137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 03:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791972110; x=1792576910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=aveufr4JOSrsH4763mUDWXFYZduuQs7q1LoFd8osKHnTAVdfPz9omdZ2ZNO/57IkCK
         HEtzQfskKQvelLZb4pY1tUXgvArwKgu9iIdDEYWTfd9BQYvmYTuxWu7jw/uxZP4GvCNv
         WxPZ/fz3u6Kpqy0D6v3M6Emm0brtY58LrpNRoYgt/kkHqwl8FjnE/m6InhY5a4ahwV3b
         rd5/RiZKTBV4teSEnX3l/F8AB3iJ0lJTMQiFoL5Oo3SNyRSzIjEryKnvNxHJnhfCoiqO
         W6nh7XeKsGOnwxvfyOnFH+RQvmuHslPVG3tqPC3zR+J42n7B1fuzimK9Edlj1KswaO9D
         cOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972110; x=1792576910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=cgR0dqTMkxjOBjjMypXzI/vS8panbC/tcJiwPbLYvL5hQETB5kCu1IQddJk8Iee9mo
         4G2BbKrmeO6UqqySasIW9voVl66g9emRaIBj8mwQJjcIQSKUC1SI7Q+UhzFunw/rNLND
         EX5EPG34dP4gmk3vthkz17jkrGaYB/EIhl60dPPKpTsKfQXiq+KbZd4FQLz63W55S3kk
         pvXmpPqItg2aABK7WfuDJj63oDEorTiepcP1WPGv9tDEfxRuhPFgIkzU2ou2UV1n+pEI
         6x3AQuKPD9kY5tsh7ofN9qSP61qzUhZtoC9B7AtmgdZpgrwAvyPxRdm6J/Ed1fTjfIAc
         Lztw==
X-Gm-Message-State: AFq9FYLw0vBmSMcCOxm5a7m0KKgevDoE8IRVHxPKMonD6dKLjvTaFIvP
	hbBlFl5Hs5swgeKAvOuqZXZlha090gmpE9hC5ULy0mthe2Wtrwt+xOUZRB40g6diJxaO7taSzZj
	NQjhk37IwLXuFyKrKJqyDQMbgvybZ8qH+asF4QWQ3+88RsGjzfpKltSkC2q6tMurcRK8+
X-Gm-Gg: AYBFou3PMgWwJVO8kVmdhZgTrwGa9gFOmV4G85Xy8RdMOayNE1UeWNHItRYTA1yxnd1
	ZmnJ1LBEOTLAHK2VcKmjW06J00gOfJwb7jP/YjHpEXFLzF3vwdpliXrb6XinZSbObBd9+2A/Ye3
	DItltTC5IyF5bdYDB0YL2x2A829s07XwrKt2ZTA+xCHxatwNmVM8X59XSHTQ21s3YTmVRT9OUc5
	9ZfT67rsfFfTVSkjiGv4SZQQObiEMlcbt1aHIB2q58BrJfV1BjSDOvOVNZnFNTSRap6rpJ6rvxW
	Tyuw6zhXe9Rs2dvVwYlyJbB1O8aMNoCRhfegiFeVbLS2GTWW8Bjr4neGFm7teVwnxwk8F90thn4
	uVhkY4O4bUmozOQFX7Q4i9Uznjohn
X-Received: by 2002:a67:e713:0:b0:7c3:c0b9:8d50 with SMTP id ada2fe7eead31-7cb37311326mr4327364137.21.1791972109987;
        Wed, 14 Oct 2026 03:01:49 -0700 (PDT)
X-Received: by 2002:a67:e713:0:b0:7c3:c0b9:8d50 with SMTP id ada2fe7eead31-7cb37311326mr4327351137.21.1791972109436;
        Wed, 14 Oct 2026 03:01:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm10382169f8f.54.2026.10.14.03.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:01:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:01:34 +0200
Subject: [PATCH v16 1/2] dt-bindings: phy: document the serdes PHY on
 sa8255p
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-sa8255p-eth-phy-v16-1-6310fac52e85@oss.qualcomm.com>
References: <20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com>
In-Reply-To: <20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz1MGPCatuhXBWyqnGPIrQoLYFB1FN4AG0VT/9
 yFM7KKje4WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas9TBgAKCRAFnS7L/zaE
 w9KmD/963fQjVivQDEGeX90B9rOqkHBd8uzEGRyI5dKkZ0jgVY4+4y3zhvRzzTASXWM854PVC3/
 CPOT+jUys2jUnmCf09Q0+KFJ9I8Z1xUZI0Oe6raazt6su+HETNI6MOnQ5RaWvKXWO4xP2GoA7+K
 0YVCwhsvmOTr954rElIvsCCo4+3v0jqrHsd1+nbqlh6zCRHdvWEARkTLz/Z4Y+qd/ORuewWLQCe
 6K8K+IaxNfZzafBg7nT5Opv1JsTtclZuBfsPsrHAWVpwmLPIrmCE/I8l5pgM21YvTmN35lKCmzO
 oypRAm1JCM10N5zqYIzQRo8+NcBD/lHqNy+1SmI/3pokUE0szMHhxElXhjqSPdB4xPyjudYHHlp
 wmV6vd4oU6j9skDpdmPx3HkDJCDJUHutFLBk6glRULVIp7tH7cXo14U+kflZc9TOVH54QJMJdsw
 aC0dT5zLny8qi09RuuxgAG+f+qYqW7etVO09PjNtBe08n2oR8VZmGTooBUfJqOHwSGCDjjEc1Dt
 2vOj+UKDNg8vFRwudS9tC8QPMrPEU9yJg6oaI5JG3KoUA2oHd7u6UP0Z+WvGesjYlhhNgbFpJAY
 Dvye+wSjHrwh368r/S7GFXzb4qz0Sy/k+JcvnLx70F6ETwzEMz5ZU2Z2l7krwT5TEN6rGOQnAVS
 fCNk+lCXul4yqyg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf530f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfXwI/9nsrNlth0
 gUYHZy/hhQMhLm9U94Y0yyJ76E9RL9Cp2K/9OfiLWAuTxmLABb9YmG+BqmGE0IItQF/scxOblZB
 4sSLq7v1RPIEuz1hsVs7tNtgW07gcTwG191xU/PuTe00wh6gh5CV0LoaZPBdeEjDoWI1ux7PyAf
 cD4BCqZR3PVa1BOE0QMLefKJBdD2O+l+0Aq/rq3U7DheQXDbLmKw8SvKSsdHmLDkd9wlExMWZJi
 KpSvaeR0jr+exZEwkaaInOMnBEli7Bmd8/CNTBRQ+KxWSMqrXEw6v+zkXsK+aM12/AqEWFDKejL
 G9DzvyWbcPDG6W12KUaglatO5JaNsqCfCItloFuxdDfYE4tDi6Z6Xf1U/Y9A/BWpFdeaaFWrhVv
 cZj7AvMWQzF4z5LDIjCzYk+Mpg2GyN4E56E9//G0XgfsHRewGQdyh4Hm9xBfp4N1fHEFs/yqy34
 99dnpcNMAtDdfVV8xeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfXyij+8pKopsUq
 J5bZj/VgJhHQzdOv++ouwnGUKKSuBBCjf2yEA3OpRQLDXzIHG0dcPfNzmxPwI68+U8ZUL8O+q9r
 sGP3MrnlN8aP7S8ggOnf9Bs6OcMt6tU=
X-Proofpoint-GUID: 1x-HjSA1hn_uAV-g9QKqNSCQbOIfaWpB
X-Proofpoint-ORIG-GUID: 1x-HjSA1hn_uAV-g9QKqNSCQbOIfaWpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140039

Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
This is essentially the same hardware as sa8775p rev3 but the PHY is
managed by firmware over SCMI.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9e846e381555514bb32177f884abf0cf2c942948
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SerDes/SGMII ethernet PHY controller (firmware managed)
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description:
+  The SerDes PHY sits between the MAC and the external PHY and provides
+  separate Rx Tx lines.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwmac-sgmii-phy
+
+  reg:
+    items:
+      - description: serdes
+
+  power-domains:
+    maxItems: 1
+
+  power-domain-names:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@8901000 {
+        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+        reg = <0x08901000 0xe10>;
+        #phy-cells = <0>;
+        power-domains = <&scmi7_dvfs 0>;
+        power-domain-names = "serdes";
+    };

-- 
2.47.3


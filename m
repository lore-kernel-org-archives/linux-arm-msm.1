Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A413A7F4A
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352085; cv=none; b=XI33HO9UMjY2VuXYTDjMtu0vVBJQ/r4ToWZp3oFWc3VR2XTnB27+ctTBAx7HUeR91pyAZpeCoVLe1/CUQD4exXPRH4266Bmy6uk5aHFbKEe8A4Ip2dP5Ur4Nap119mZIVyCHfcC3pkFJZUfJdKL8JrGb6wMo50WWHg+ie+tWqPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352085; c=relaxed/simple;
	bh=Al0TkMOkngkbtKrhxDPxgy+P4AI6IDkdVPa0O/qU6Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nmoaidwJftRsFUedqUQc5QlY/jGsDdJb5mGiw/Ej7fhKHtyNeVnSQb35RwH23GGA7RGdnbIi73jfP73O9nokNecpCYQa2F6Gz91Aj+gD7Eft9qggOLvWr8aV0Igpcu+IFgjUsaVUiJf5+R+ygNTDaFsBOIQBF16JBgZZx0Ow4dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xg7ylk5N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S5Tj98Z/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xg7ylk5N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S5Tj98Z/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5HbMA1771465
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hijlqIfFPAeYApXa1CHNHdVzOOUrc/IFvltMOqgR+5Y=; b=Xg7ylk5N+dJkkuZA
	1VeAoO8PjqYSKMkUZRJFgQ1dM1EIifipzIZYwOSua0hmOnJwrM7XgRaEPxxbQwze
	IAdfV/o3bt9JPIPnLd8J25FCUo6UNg+XxqVumemZhF+BPmBFUwmG6Q1zpvSwqgYt
	AyQeJeHX/YitvuGe6QlyhKXaAdx7qOALcSDOYL6FBECDH1QiQGg5LIAVGhJ78KuI
	gj8YSLAPxHDWX4RLsMUpltnbezGUqOD336GtcK9jdo+uq5f3AsLOs3D31S9U994Q
	HyJ9LgdS3RN8BdudgaoLaS0uUF6EN7tbDCUiCHbhBmGZmKnjq53tQQLVRgA9Xlnc
	dEe8/Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy19khn31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 08:54:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so1929208a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 01:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786352082; x=1786956882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hijlqIfFPAeYApXa1CHNHdVzOOUrc/IFvltMOqgR+5Y=;
        b=S5Tj98Z/JcrT//1UWaw7KCjXPReoNOkigecPweMc004LW635HhIjgieNp4t6zDktFG
         RPTN1w0I0qYLyxOgoAL7IE5/9JH6wmWfVXuejlsBZEv8IkOYWPi3509pJkZs/fETnquB
         AL3Hrud76uGBpaAfMsCGqraQp6qlnnNkN4RP5lb5PSxjLdOVjkab8Xnh9h4aVHzhLD26
         HG/VJU32KlOCb6H8ySwjk6/F9WjZPK0ItVff5TGlfbKoIvwg/lcdVLB2ioBNX7sq5f8k
         zx/OlYp4dfyorcKr2AK1sdkas/I8sYMzDGsL4ssQoTeoEqjxSxORlaolRd7OUzp73fMK
         hBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786352082; x=1786956882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hijlqIfFPAeYApXa1CHNHdVzOOUrc/IFvltMOqgR+5Y=;
        b=hkCLqwkq8F7We+0r9kBK3TR5VeBjoFibRejqkvqWRqV7Rp1INtwnyxfyYR7hHBeUBU
         7JD/VCagczSvJ8iz7pvgfUcuR0rYrDx59DPkyCesXnyMktHCGIjrekMMYKt1ySpCcMLP
         DHZ73B8POV15s1SHGNLUn+dQnnooalSPVe0P2z7nqUnZTzajEmbjBYbpR+0Aq5d/yBB1
         nbOLhwSL0j0sO38z7yMZugfm/En5wLoNmu+uw5bES4hiqTgyFDascfvmxk9O9H89vd/h
         ZFD8Frge+1P+ngohHpfkLngYorLGkmvfLzxxcHbaFsYb6L0Ur/qa9hr3SLCD9ew/mW4p
         ulXg==
X-Forwarded-Encrypted: i=1; AHgh+RqfxBU+MrOR+8T9C0lQeravM5uohAMBM2VqzoOAUiIR3Uz+oL+fOKr/GZTUhU8BX4ars8nsN5ds1o6Gx9N8@vger.kernel.org
X-Gm-Message-State: AOJu0YwksKstyU/1LG/dU0MGUezXqUPJxOIVuTGc6WuAfLlpJ4+0kPLT
	/G/FmMKxjbbpN/NSp8s2GTeZfwbky5uvFt5zdhYAcErK/K+bFoMeKYML0mftUTpslUzeIo+q3Dd
	mHC5xynvZgcLd0aCS4IGXJkHdjepfh7qeMQK15yLCO96ka+Big6BdVVw7fHh9ZGsnDtYBRARTN0
	cHDYc=
X-Gm-Gg: AR+sD11yFW5ucFiCX2Ftsl8LF8cvhw+9rtWdZbYCKeUkSKf98V61BDHj2Y4DJvEUXi0
	OMkNqUiX3nqpkSFM31hFaaLxdZhsw7Z8A2ZsG3Mqn63ACJli602JDoMHFHrjsJJXYiy7tB3Csfd
	y11WDDofgIrF0pM2oOHnHLX4d9DOXY2o2RNqrcwsTxdsMG6oPUR2as/4p1qLv+dlyG+uiE62YU6
	WFjQTioVakzZVUNxZkzHmX7lZGWGuZJaqVfWx7GRi1JRV3wiWGg0NQyFJXSo5jDQp97GbHyFMrZ
	UKVTcqvBu0Zn9BIPOov123fmExrELSexVEVTZVB8DojZf4SUFnLHbYY/7l2oLW4uFPZd8TqG5Wg
	4UrwuZ42eeNJ67Ek55PUOm5PeX/O0Db0GqNTrntKOGcur1WarIQZAB2nX+SuI0qFA
X-Received: by 2002:a17:90a:ec85:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-3909d8075eamr30780205a91.7.1786352082432;
        Mon, 10 Aug 2026 01:54:42 -0700 (PDT)
X-Received: by 2002:a17:90a:ec85:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-3909d8075eamr30780180a91.7.1786352081957;
        Mon, 10 Aug 2026 01:54:41 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff69eabsm11840085a91.15.2026.08.10.01.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:54:41 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 01:54:32 -0700
Subject: [PATCH v6 1/5] dt-bindings: arm: qcom: Document Kalambo SoC and
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-b4-kalambo-crd-v6-1-744e8ad1dae9@oss.qualcomm.com>
References: <20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com>
In-Reply-To: <20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786352079; l=1039;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=Al0TkMOkngkbtKrhxDPxgy+P4AI6IDkdVPa0O/qU6Js=;
 b=r2zG8YM+qsjfp34Wu3qVvM36a1R1jX/pEyNPUk9dLRtmk9/d+hdSocCapTErh1EkcUF22QZiJ
 R7T6SJVVl3rB6QWwgFwBoNYx5KozJkg0nc21ltslGqqUguMividMwCi
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: HgKIv8iPEJRT_I5WVHWm9YZTyjZBNjxZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA3NiBTYWx0ZWRfX0sHTj2Kk8gPH
 X99GZ6Pl0p4hg0eGrDhrkmQRJBNxnpACjAo9jXzpEGFE6/sINLKNMPxweY6ZMIPnygS+GyuWU9Y
 dcFYmt3ZDFQBEGmQMWSj6uYf9Jti68lHZtUbeXOSCxxJIPFImvDh+KccKitgs/YgAWCxfVgMqgu
 /xSCXaqL3QNOxEq1tYFqhGDGPyJRKVOUGkub5T71o//m+khj8xQPY5uXBctyWgAwLmVtOsZ5Mt5
 GLF2IVK9oGMhoSYUg9KlD6Pd4zJvEMn59MH0hwlNG0FPY2/gl0Ou6gxFKsM+qRvsAarZxicq4+H
 BZcPT4qpzi2McYgXHlxngDWjIbEcrH6WudZpf91Ph3YFRKRXMek9DdnN1j+j0FX+qmbJ6xs9B3w
 JFQJ9qB3LqNi/w2L4WRC6v2AM0+1vGTU9z5iywupzdSLtzpUSFzAvzhgmYaFT60wkuUFzEzEZyF
 AEXBS8E4TdYbAmHsxIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA3NiBTYWx0ZWRfX209kn8USLg8s
 G5j2MG2JER2Rn02f476/dOUJAx3sikqBR23vwGVaQqFhMh501/Bg+3lxPa7eMvPICjroosTzuN3
 0RBkmqJypaEkdM0G/W7u2pszGLHDEZw=
X-Proofpoint-GUID: HgKIv8iPEJRT_I5WVHWm9YZTyjZBNjxZ
X-Authority-Analysis: v=2.4 cv=abxRWxot c=1 sm=1 tr=0 ts=6a7991d3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZiHbJPZkfdm0JMYp6GgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100076

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
index ff8a35df7862..763f5e55d3f9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -175,6 +175,11 @@ properties:
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


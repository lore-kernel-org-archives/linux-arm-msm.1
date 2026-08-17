Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD537424D6D
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 15:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979361; cv=none; b=jRa2bpmyel22FhB5B3cP+VGycqYVgGh9iuEPNn4azoOAiqxx6z6Z0q6tvRh8rNz+U3z41Nxo+2aWOQ6ABN7prXiWE99rJpsN0OFSa5v6rD8DC1ZaADU1ZT5t4E3LPaBWiCEqdg4uOiH9DnLiMLMzMe6E2toSNnGD9UBaAf6roLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979361; c=relaxed/simple;
	bh=W2p1gqkX4AQ8Th8f33I8eROJT74xXZVBij/fNQ25/NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oY1fLfcukAzQVsc+k3q3JXcf3JKNEB/l/CRxaUHKhblRN/UyTsVo3nv2R7Cq234cm1q+oJm0MWqT9dkV9c2dS8Zxst25jyYP4H2NpOw24bWlIjHpm1uYuVseKWWN7if6d1Z1zVMUv//AAwcfVB8eh+/Vh/6u3O6V3eUiBjoH214=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KP/dYHWU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vg933Yyb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KP/dYHWU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vg933Yyb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6HJ72937144
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 15:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=; b=KP/dYHWUjbxiPlM4
	CUmlGsaMssJKPghsvUj53+0yMcLKUP2beZV1stc09LTxMBkOXcT4fVqoPaVTmy6/
	Y9NQekE2aWv11tkWFa7pVBtBmzm1+j3iKqoMLLVIjCxQGAoujsa1kFTp2K2+Dk98
	Neucu5ybxJbNBJk3Xq84PB/oto6Ch5c7gkiV0s/PwgVfE7AHenu+iS93uhQywSS5
	Ml9XtSn2zLaREe5SKMiRQQSn3ZE/euZr8I37JFHCGDionQqLDXm+Mr5vwUm5m9JP
	tD0ZCBpFGcyG7T/Bmqr+ZIUKvsAfjtJBAHXHaMdWzWCz9spOx5Bpo4WnrZsR8J1V
	admU9w==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wm7su9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 15:09:16 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66988049306so4020501d50.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786979356; x=1787584156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=;
        b=Vg933YybH5vgb+ISGKDYn7RtwvI52U1MVn2vgQRkcyBuG55yyyWzaNvKRySVuBpe9F
         WRiBeqIFiUourhjyP8FFu84pZZMpFLEYdBFp3bJrYgudcsRlfTGdk3y6/aoCB5MTxvII
         xJEVOhjWo8mjo8EwUN+RS+zFHZf6mdj79xC69IrW8zXRFqIKOjYqd1Tp6g4iY0kwgd3c
         Ok7iDtmBSL1mu6ISG4kC3gmWyExahJwtwXzf4BySvhlX04Ac+eJT7dt6/durFXn6tdFi
         6xsRr0ANgNBbYoiuYC3MChX1m2PWF0qoh58OgcSvugSgFsw6TtN/eAtuhbuNt2AWjdM7
         +vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786979356; x=1787584156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=;
        b=pJZcmOccF18ET1GEbz999afysoBtTpu0WrPHCu26IWdhSt7JdKEyHfIFUDY8e8EvG3
         AADTHhPyPhD+u1ya6u6CE1IP1to2drQFkE46DqTfi22O2+YnR3OSoHO+LbDDLysZ0Z+B
         oJPWc6aOzlErgbFwmRMO20jK8Q/glQTJ9l5Mtx1u62wrtu3DoZgmF3IBVPSyMfMflzrk
         KdpQTSQBDTjhY8NSKJI9PopHQOR8mCSg14wtYRSixl49YYZjYI0HI/Ea+xpXuXjXYhuk
         O3RroreACs2Zhq+ryRnLLCh+ehGXftAmhAJnDC8zN+tOcEIxAOUb2NoWzgfFqZ2gMzxN
         B3qw==
X-Gm-Message-State: AOJu0Yzf5Eh/bZgf1Grp/8gvvGO+MSb2YElxA9BW+SrHOLHMbsKq+o2c
	mnLwx0T5gmGPPfWUpBE9WTm5nPXQRN5z3WS4tGcJ3OzG+Q8ITFdzsFx1M5HjifrTXq6Qpey8T94
	0EbSFSvsdA7+JVxHC2OrWeAP5pZlxjrFhcyUf5+HSKi4V43Z5ee5te1dIJXi9R2LOJP2n
X-Gm-Gg: AR+sD10LXAbuwuzwmziYimUvrp3eUxxPmyNdRS9fD2OG4cFyUtkhfLR9UP+psxcWkjb
	MwtT9LacEHGR/TsrPklC9ZdHmohURUE7oN1k2ch45/Nf9Pq954d+KGl2aK7PHX8GuHZY7MIR8p7
	W60eKTFZeJ+4nDavpUGD4ephWGZBkW/KASgoWwVWlm66K6q4mvCoaSblpShCSf2NX+uoFLEamti
	vEb5qTP4o7gYIfoZRCJWAT/U1Jrlr5ieiYe13ySa0NogJhMBKIlUIpbG9Omex3GxQo+2bCH/s1M
	cvUJ05zfl5NJMIxlsOYnALYmsylYhzDQ5IHeoDcK3d3zhkUyvfSi6WclrukkHmuuHDlJ+lO/zeb
	H3Xz/QgzYBa3xA6JDKm1W6h96XT+CkO1PT0YQh86JLH0KxvrV9w==
X-Received: by 2002:a05:690e:1244:b0:66c:4b0c:3cad with SMTP id 956f58d0204a3-66c72e9edd0mr8210309d50.53.1786979355926;
        Mon, 17 Aug 2026 08:09:15 -0700 (PDT)
X-Received: by 2002:a05:690e:1244:b0:66c:4b0c:3cad with SMTP id 956f58d0204a3-66c72e9edd0mr8210296d50.53.1786979355549;
        Mon, 17 Aug 2026 08:09:15 -0700 (PDT)
Received: from agents-mac-mini.lan ([2600:1700:b450:a0df:2c9c:bdd5:b705:b119])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cb3d377bbsm938108d50.0.2026.08.17.08.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:09:14 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 08:09:09 -0700
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Add HP EliteBook X G2q 14
 AI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-glymur-send-v4-1-3fb89cec703e@oss.qualcomm.com>
References: <20260817-glymur-send-v4-0-3fb89cec703e@oss.qualcomm.com>
In-Reply-To: <20260817-glymur-send-v4-0-3fb89cec703e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: be0Ti8t_7qya5L-npvKVDuVHwIA8H76z
X-Proofpoint-ORIG-GUID: be0Ti8t_7qya5L-npvKVDuVHwIA8H76z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExNiBTYWx0ZWRfX828vZxmOt9QP
 oHtX6NKJ+MnLCFtq+lnIO7g1vTM7WtNIE6q4NjOx0nZ+SBNd9OC3OQgzaWVCSMnnknobWVnP7JO
 ftpuCPed7jGzvZ4PvdstJC0HdLM7GN+7jqdD/e8u7V8vRXd+Le7c2A0IU9I3yWVFnkx/j4OJXFX
 55u0myKiMPsXZNXJJBPJuZXBUA2zVBz/XDnkSI/EdNqV83PtkQXKrgvNHvcOKtsPjb8t5fNI7Oi
 5/JqZbtv8fPyIAZ5N53rM2Zmg0cTSKv0/O++oZkrkeh8v7y4QHqNNSeftnAu5k9VJvINL7g8BVc
 qEi+0QUsLNP01fBGaOospngPi8Xlp8oQZhZUbM51XvZTHtA2twMu7+xpdgbVve2Z3ru+iqtdtSh
 NuuNnivuPxbFuD0p77F3Fm0o5uIL9uDei9ocWhJS7ZyqkSkDmourGz7j1NTbAIAqWEFc5yvxqjx
 N9dyQ54wFCD0OqP0kQQ==
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a83241c cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=FzA6eXefDna1RhwR9dEA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExNiBTYWx0ZWRfX9Kpvkdd4qQUq
 eR6tH3iom9u4AGWu7w2ZWjSZafPyrxRuN6U4caXI9TtM3oRhPANlY5+LAVOFzpFAglEADOCuLOW
 EFV+Aygd7w4zxRYCjWeVKfTurvTE0w4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170116

The HP EliteBook X G2q 14 AI is a Snapdragon X2 Elite (Glymur) laptop.
Document its top-level "hp,elitebook-x-g2q" compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..d141872c2b28 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a16-ux3607oa
+              - hp,elitebook-x-g2q
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.50.1


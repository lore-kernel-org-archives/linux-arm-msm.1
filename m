Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796BA51616F
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 12:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858828; cv=none; b=AwCUja/JeSmDDWdbkxxF396j7w1KbLdJA2l72G4BIatje2xdayfl3Ohs7Ht2ZdYqDzhW3bvpeoe4SllWu0knUEGhGe09sNQVhdi2pgd2aS/AthpTk2W6pIceyAMLGaFxHgzYdLaubO69mi+7nrPnxtj+J3bpUXkP+oXYtr5O7Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858828; c=relaxed/simple;
	bh=6tlCPBQqSMxcoVXtilOkI4PTIRoLgatFwb92wyZ/NXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rss/yXSsmi3/NGwVUvmRNZJVE2tsw548kF0xZYypwVkBKbyYclXSYh9mlVVIk1HxRmGZEhcCNIN69SGSMl1uBtb5lltVg0AMDOsWrpB3fH/L9fhpoYXfxvsCaywEtvhXKi+c930fbF7TYXiYBx5W4eR6IILK/UHmyj6sa9HQxzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YIlOyC90; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ejb6+3+f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YIlOyC90";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ejb6+3+f"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691AkBAT3388120
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 12:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx7XquVkrYTfZBCGvyqx6Cyz/aYbbdYjH1W5oDABB1g=; b=YIlOyC90XNammilL
	l3wTRW2vJOtE0wptkvIxIZqCLke61Kkszu9jNooJL4Xs9qi15HZCbL2tWt31AQy/
	dEek/947FxFaFkPIBK/w1pkxwn0ioAfX69VyOkBil+RYhWZDu9exekht5IlS0qjN
	2xSPNeMaO2vTcap7QaaGn0QVUOqUcEw+cHGmcHPl/C9Kh4ygbq8uPDAOmPMQ71i0
	czN558efSTZ3xeBcRJM1a7Fgye/7kWHt2m+vaDxQXRTC4RaEP4u6oFeWhuvg4hsP
	4U8pIgI19LMPeuDcegO7xGGWpFZTkA9SYBecvqVyBZCof1SxtpmzFccJ/MSnfHoH
	ZESvPw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1p2b8e99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 12:47:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a0f55a3941so6272376a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 05:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858822; x=1791463622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx7XquVkrYTfZBCGvyqx6Cyz/aYbbdYjH1W5oDABB1g=;
        b=Ejb6+3+fl5QcXy/UO/2fIGOhCbYQK91VXykTO9Hy5b0H0JUDTl2OpH5DHiEuJrcwnH
         sHExCGDPaNtzT9UlutVxMjh0Ds706Dw94EnMMKubGTq7p2pga8gyW8ZuT39ZCysH3Z+c
         xrZx/AnXsoL7OLwLLD24gHLbnbMiGoUl5IrZ7kBWrXczeVq9sSgm9jUObKgL/xjPBJ8b
         4NcquVus8IvqLqR1kM6XWKYISn6kTPu7EcA6TNacvWhYHdxl2YkK1XnZNNmSQBticGxW
         ZKH4pu5K0DmHlQBTYyH1TAeBEtgzsC15GT647hIYWazQlhMMBb3431dYT53lldQIWlZX
         baIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858822; x=1791463622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx7XquVkrYTfZBCGvyqx6Cyz/aYbbdYjH1W5oDABB1g=;
        b=vP5Vzk/xyS9b7FkBD2BUBG42U9xIe2xtEwfOhWAcfjI1jfJGMTu8LYAkR6GxMy57x6
         jVPx5e21Qwef8oRbwIHtezOhUpCttL0Ww5WmrCxTXWH/QrdngG0gnoho6RB+Rx94hAiM
         mwVQnSorD0LqhLCcRMPT4kjB32C9yYGrKrwR8PJK3OsYcGJYssWnMjqNN6p9rbjA6+JV
         /dg8V4qG6nBWQkuojkXwfMQk8g2C93emCMNFAHHyiFHRJCwdSbeyc+as5Irr7k9tRcvn
         yER7KRDcDhs3VyPBL9Y8FofQ5ONiYJEextSCEEYsBLP31Sd9iylD/w3Q3ns6yWOvLj2x
         YwgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVz3FYsAfSxhkCxwOgUcsSx1L1gtF9xjQjM7jsiaWqDa5Ojg7N1WJd520ziLmMoycspnoiSSYXoAOtv+3y@vger.kernel.org
X-Gm-Message-State: AFq9FYIpScddj0X6ziLZJ3alfVLYzjfxNWTzfO9wqzQ/ZVu1/abGm5Kq
	8hrh3sijoJdLYBToy5o1VNUhuqkfPDOCkhVNa3FEqYGUFSvR9bXiAshde63yFJhDA9Hnal2moCo
	Ded0d5ux6pFF7mP96Hb/Qro2MPYys1lrDxFOOMimnsbSHDQH/jdnXErqc2ZL0Dc0VLFYR
X-Gm-Gg: AYBFou0iaiu2yP5V+cI5Peiw6uJpPAA+R2Yk9MiE1x6APM++DcWJpROoGtTolA2FLt+
	DkpNy/Y+9HDbjK8EWlf38q58ZZh4a9U8vaEeCDAXDdtkAQLgkRBOwf+ebPU7lDepfCpOBarmwyJ
	97F3Pjefs586GS0fwoH45aqV2TW/wycZ60GXS41WbnPkv+PpVHH1PZKw+XgcForJznS+4fRNYZ1
	ErBtC+mXI7rKuZSaq589ytdGyt7d2hodEfCT27ushwg06aFkZYULR9IJEY5skhwP7yFZ/x55+Nk
	ojtS7lwcyzYH0Ax6DWE6bSQSClq97PryNUB8EYlEl3PKYxS/dRzKFqy/aK6Tei+VR+CxhEoUVTH
	HcskXmAW/I1tvIKGr0hw=
X-Received: by 2002:a17:90b:1a92:b0:3a2:b20f:21b2 with SMTP id 98e67ed59e1d1-3a4d0f022afmr4109379a91.8.1790858822161;
        Thu, 01 Oct 2026 05:47:02 -0700 (PDT)
X-Received: by 2002:a17:90b:1a92:b0:3a2:b20f:21b2 with SMTP id 98e67ed59e1d1-3a4d0f022afmr4109352a91.8.1790858821695;
        Thu, 01 Oct 2026 05:47:01 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f479dc9fsm4567467a91.15.2026.10.01.05.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:47:01 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 18:16:30 +0530
Subject: [PATCH v4 3/4] regulator: dt-bindings: qcom,rpmh-regulator: Add
 debounce delay property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-regulator-off-on-delay-v4-3-258ba9612da8@oss.qualcomm.com>
References: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
In-Reply-To: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790858803; l=2783;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=6tlCPBQqSMxcoVXtilOkI4PTIRoLgatFwb92wyZ/NXA=;
 b=HvbdIjGg/48LiXQtEk7r/pVCd+EaNdhLzbrS/0UtdBYXN/SvhyUM+oBaGhRp4t0ulLbVe17vK
 bPc8xQ1GqvcBgThPLB9pHsMNQ2XH41kgRPrYWvHwAGqIhtGZg3lqLvg
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: TQygsdWtjr-h_FyUY7YcyiP2gyPLr7ce
X-Proofpoint-ORIG-GUID: TQygsdWtjr-h_FyUY7YcyiP2gyPLr7ce
X-Authority-Analysis: v=2.4 cv=O8SsLx9W c=1 sm=1 tr=0 ts=6abe5646 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fIv7m2FGvZx8uhHzWWEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX4k/eJl2sAJ0R
 qj2447k0fncQMytPiM1sWHukU10XM1p+LrYfKrB1+fpkhVNC36FJnV17SAyIEnsoURiUFKOdhBb
 sLMmKSj/Mf/YXgaJWzR5CIX82MJRXeo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX3E+vb2upyrJt
 9Mre5mTzU1s7W5uUXalf1Zjg7tnBTPP6hxOnlxeiteo/et7n9gsmKoG5CcWou4HnB7go9qUNJC5
 L4rcUim3xKYEIybr7P5BWhJorUsOqui1tB+F9w5ZgB8DZZn0uukejdyysSMarxCvHsg4lHFodRc
 UP2WjU7qjHxIopnVGnTHXxWb5W2p5GZdy2WtvGQ+ER/KHQuEVE0/dn7tRFNcGdsnof4B7UAoleT
 HdrAed5EL1MrgOExEd/RIUwCENptDX+n7pbGtyE5eM9cldJ2ZaJ3QAw96MQBoVmPyiMd21chzer
 dIWe1zrtS/XqBy0F+OLcbaCjz9S5p69DDGjN6xCfaIQTQq1hz0yB2W63u4w1pDaIE59i20qBZXU
 sfBOTCS4L08hZDpbmszBedYVoXyS7oLA0O1TO9UGFjSylyJZFKbcMyThM+azBz1qEcLNBio1F10
 /pmYIXdzxIizIY9uhXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050

Add 'qcom,regulator-off-debounce-delay-us' to describe the time to wait
for an enable vote after a disable vote, before actually sending the
disable request to RPMh.

Some consumers toggle a regulator off and back on in quick succession
as part of their normal operation, a behavior this driver has no
control over. The appropriate debounce window to absorb this varies by
which consumer(s) are wired to a given rail and how they use it, so it
is exposed as a per-regulator property rather than a fixed value.

It is placed in the qcom,rpmh-regulator binding and vendor-prefixed
because the underlying deferred-disable mechanism is specific to this
driver's RPMh command handling.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 .../bindings/regulator/qcom,rpmh-regulator.yaml        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index eed2ce7fa861..a028f1a9c194 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -135,6 +135,15 @@ properties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
     description: BOB regulator node.
+    properties:
+      qcom,regulator-off-debounce-delay-us:
+        description:
+          Time in microseconds to wait for an enable vote after a disable
+          vote, before actually disabling the regulator in hardware. This is
+          needed for consumers that may toggle a regulator off and back on
+          in quick succession as part of their normal operation, a behavior
+          this driver has no control over, so as to avoid needlessly
+          power-cycling the regulator in hardware.
     dependencies:
       regulator-allow-set-load: [ regulator-allowed-modes ]
 
@@ -144,6 +153,15 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
     description: smps/ldo regulator nodes(s).
+    properties:
+      qcom,regulator-off-debounce-delay-us:
+        description:
+          Time in microseconds to wait for an enable vote after a disable
+          vote, before actually disabling the regulator in hardware. This is
+          needed for consumers that may toggle a regulator off and back on
+          in quick succession as part of their normal operation, a behavior
+          this driver has no control over, so as to avoid needlessly
+          power-cycling the regulator in hardware.
     dependencies:
       regulator-allow-set-load: [ regulator-allowed-modes ]
 

-- 
2.43.0


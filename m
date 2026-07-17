Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C655F3A8749
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273556; cv=none; b=OuSUgtaXbSR1Kpe2g3e07bPwdC2QEW973RuZPZT29Uns/JCVGOy6NzKzlqDqng2TihPx2rvcEG0dU7xdNDmaLP+l3gjTUn7dJZZLsUY9YmwugP7QmaH86b2DmbO+3g1PR4O+R3U8IQgsM+lrURmriTkRwP2eiJWN9B9rNahhs0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273556; c=relaxed/simple;
	bh=B3TLsDqArP03LQKcA8ngy2MaXdpHgeOMi+R6ynsdPHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XxAZt52HfQHHaDnsxLc8/RBtM9MFkqbnVnWPX6V0YWr1b5Szc6d2VYJ5HipAa6SzfCSHLraWgjrb0rBqtBu/WZlmxRp87JNOGdx9M99l6rrTB9yfKwgiTiBnMKOpc3MRDvS/Dpvx1VFVfxdSun0IMFrzl4IK0DHZ0vIzR8rkuac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VzVaTHXf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0jR1hK0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VzVaTHXf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B0jR1hK0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cHGD2098520
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=; b=VzVaTHXf74prcAeU
	DSBgbbdmA6hjw1hc6acb2iUzSr87Qaml5boUwtfa23hkMTlAFLEG9qjjXdro9+Vz
	WeR5tzOMyI54FhnwIv/6uCAc8r876pjTzf5k9pTs//bGmbkRhaL74CPdpketAfF1
	VjDwKIzVbHUxHwWIdNhKpcPwTvt0Nlai3hOs7srMAR6di2ASksiTVTuYTbHumLzl
	cq0+uWdh7mWnESq6Jp/s3PZ+VSd0gUX9w7+e76kiCbUOPwATu7dzK0iI42wyeca6
	BYXJ9kVc8M5QkNW2Kr5RcCfc6wYg6xYnE4OJHWyt+GTEFyEScdVmP58Aw5YLlCjB
	a8Df8g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6jk5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:32:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacd6d37edso102608785ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 00:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273545; x=1784878345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=B0jR1hK0XtA0XeXGAXmJuZulGJLlO4pXDciRoJttoa1KfzdLyF7wL1NvCtnnfmbs3q
         kHtEOJrVNz9yq5qt6tjuE+YFZ5LfUEjyjK3JGjHVEbLZyixjcMhP8C2QfocOsTJpVlk2
         JovcG2xLd52ZO9kDA+FOT4oMhr3cdyJFTQqsC0FpCx3DYnwjCdMB4NP0EIcE5Z8UBpfH
         A2qxBjypEatOv10cSE7MMl//uROHz/iz6d7v/DwZdE3MeF8CIkY00OIWg/Xyn/fRQtIm
         NizKn9uDpCn9P7EFpU3RhRsItkcYhs69+fMrdgW8Z1gepgezqIayMqdvHzMukbD8wp1X
         r7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273545; x=1784878345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=XIdYt///R4n3doo+Gf5hmt2xSzhIHMda7/cRefEa1pWrrpHrISQBPVRW4GFr+hmuj7
         7x4tcTAa9lvRSu68B7rG9ec3WffMIWGG4BAsLulvDkig9jSaqhmOSSGw829yHTXWrPnF
         kLxeVySqZOIbWn2U7qG0sl8qYZg5iDTkMIWRmu2rBC8rHL/4PQKkaJ9ph1v2KzWEyUm4
         7C4pejVgkD15zksz/RKxgiRUYvQCa9MhQS+nnkRdhQGjMii79FP+Sh6SlPt5yOF3JEct
         Dk+rt94gYjAKntoQa5x8VDvQubQbZcpzxWa4AmTMxBm/e8+kSlYK4akEY0PsT3nxor7s
         AayQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWCvVgZpU3y7N9z6aT08vwDLZ0fObF8iHspK2SbkZ69aXbBwrXd/2LqZEq3siOl+G2aLOOwY4VgXoHV8le@vger.kernel.org
X-Gm-Message-State: AOJu0Yw//KEGLadTnrr5qbKjpRVy2RcOCRveZu3I3c0XiwTpkvnO61fo
	q2ch2kBrl/+Clg4dTA9CGnS/Qg4WMq9u4kJf1jYuRKL7LwSdegyBccEWfmdrga2Kn6ril0WfsK/
	Z0N7T8Vyc6zSigTngqe2KjC1I2zwLiltbseIGLZN2iS3j4+XunYB9D35M9Ot/kdXvWNUj
X-Gm-Gg: AfdE7ckQfmXGDYHsJ1T/n2boQyFlHcdaoS6H+1RrPUY8O61TAUFRFFWuhTjj72FQFjd
	qg3lvSxO5uqlVEDlhWiF0EaV+t6MEbQULLqoCHR/B5Pa0A0Ady8LrcW5N/hVhx7RFJdHfv8Hd49
	QPRPdPHM/8Mjl2aZzXH+6mD7FVnUHFDoiVmbRY88SYjb+7zaLyKPHaakB5A9gbGwHoyt9H7vCBd
	LUcWG4LyOlv1DiNst4JrDWJmZrqKWB2yFRvUAkVYVa4AKmaToO0W/BghDBh0vIvLb+EUTDTvuad
	sWs3PwUPiV45cVRCONO6YaCqfAd5Z0RtNe+OQkHEUhYA7Irny+M4v9pq9DMS3cCIblUKULjVldk
	cfqGIYYLjRQr4idnEtpzDi6+E
X-Received: by 2002:a17:903:2a8b:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2cf3497f5dfmr16503185ad.25.1784273545161;
        Fri, 17 Jul 2026 00:32:25 -0700 (PDT)
X-Received: by 2002:a17:903:2a8b:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2cf3497f5dfmr16502845ad.25.1784273544677;
        Fri, 17 Jul 2026 00:32:24 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:32:24 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:48 +0530
Subject: [PATCH v8 04/10] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-4-5cca1bef2e48@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX/lEulJd0s3UE
 2dWCQrgDVow3zJ0RMQ9b5FepA8kYKcxbIGHQ/HGljvPPhYxPFS8sOo1G2M6fQTBhmvXPaEnpvFu
 J3PtNV9u+inK3lhM1xJzXGxnJBYGtbFFe+uikPpEjaugANIIeu4iOL6/DzLslHurLNwDlrdICkX
 9g/kATI4NEdfa4hK3EuWIJuDwLy1xteA8I7eUT4hUi9kLrSzfPP/X/GZJbbdRQAuWxTpBhPKXn6
 mD1OKe3eR560KZ094mFpufEUozxqeEpEVNxsIELPWpr1ie0CclY5N0NoGfRTnEM0wRwaVTiVcAe
 zlLxLvpNIRcq0WfdsKeZYEIjxIPTopUA4QaV3UFmcnsCyplerJVL77jZXEAcOw001DVm5HGbPBb
 9fYarmZJ9YdTvbduv/AkGiwFUf/KTY5+cHiTBa4xjt6/IWPGBojcWV1Hrs4Pt/3vJ49xBGisS3O
 sWnJNk3RHCh2RCy+S+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfXxCe2fdthN0ve
 fueGpi3bxgWc1VagySFANCPvNUurf4SOsdiEYz8JGuwIEi7CL6Tnnj4T6k8dzue2akOc/4nqgGE
 cMi0f2lE937yPBIFbRtjpNpeJpnxSVM=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59da89 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=hPke8q22Y-dA_sy_I1MA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: BQAOuwC9nrNVh2TRP-MrSydA9a5iR6Oq
X-Proofpoint-ORIG-GUID: BQAOuwC9nrNVh2TRP-MrSydA9a5iR6Oq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170073

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

The video clock controller exposes power domains, so '#power-domain-cells'
must be present in the device node. Add it to the required properties list
to enforce this in binding validation.

There is no ABI breakage and no impact to the existing devices, since the
nodes using this binding already specify the '#power-domain-cells' property
for videocc.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 4d8d109cd304ef0f5afc5c3fc7961a6156003d4b..08898f1d74e4ef0a3921eb7cc5f13d14bd02975b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
@@ -41,6 +46,7 @@ required:
   - clocks
   - power-domains
   - required-opps
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC1F35E93B
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785477233; cv=none; b=uADF0vmwbTEcEIUE5GoEQsX01yqF2yZLAvcpG6cdrq7DlDnKqKiHFJdRFYBWpszP2WgmAVkI0me9YckPMr/n24lojBO6RqRtrBzs6+Q/4opOFktklGbdsRUXlxAWKeLULPFMaqrXAhkk/TrkoPQjtXZCnsFozhaKlrpmWgh/+bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785477233; c=relaxed/simple;
	bh=e38rX0l4uVxIOcbqc8igZXZ/CMjDHKSXoW7V/dIp8dA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kI4PUiMZyjJ+toyQYQ8lcEjHr7Cb2k+4hfZyFeVO/CG9Wrh3klyrv6t3C/KPrjFXzICOb5KwB3qvQMV1D5YFo+dBJqC6P/UdTHsx3oofIQMoYfCIGTT8ktG3HKpN+8lieT+btNBlzp53vPm6f5bJK8oyiVXw5RA1SAEf3XaKm00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wvg3mPtU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkBiXV8y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wvg3mPtU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkBiXV8y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5FBVU028661
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sG2maHNBlRhpFNm0jTg2CG
	r6GPIhTgnZNBndxYr+Duk=; b=Wvg3mPtUahQQ6qwritD94y7ddMmjjVyZe1Shi2
	jHUIcAIzEqujNwhe9YgnNRd5UrmCo6lw/8Id6aKF4VdhbQ3kiJZNAq0A2OAiZHjS
	413eg3u1WTevrT+mph+OslSjun5odq4z1WhilCb4uZw9Ui+Tbi8OiZZf7uYkwBFT
	FFYNaeNwgeOgiiTtbGxU5Y0oJ+1pIw8ayXIPOn6cTMqNYUxg5/Sp3bzIueoOJL2/
	HxerYZHbCpCvWISJuutAt+ic5jkmwniqhQ6nTEpXE6Cy0cz2QMBO7ttCQr9POfr7
	smvBHyAvfbWY/4LOlYMnVsKHRnMsvXP7cXnjwF+ydXtHFVfg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frnd5844f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:53:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab041eced3so927378a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 22:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785477230; x=1786082030; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sG2maHNBlRhpFNm0jTg2CGr6GPIhTgnZNBndxYr+Duk=;
        b=SkBiXV8yPRnT4J2a1sJ03yC6NYfgyIzxq1CMdwnEryEZDvQBK8rfddQ6n7l8ukbLX8
         XIumLEKl1BIokdXS+eB4p97ejS1ob7PwUodGJ83GKY8FsDKrk+KjK5C2jf96EvPBi4CN
         06L7z1UIXSd24C2IHOPBSVMZUq2mAyDTa9NwZvaszuDGzmECEJJe3SjlUwpD/HVUuQau
         XT7/QGkljwK556fodXtIM5q8UTFicg6a5lmg5Wv8YfgTwG5TUzg4gxdrwQQ0icpN3Jqe
         xo9CDawdmLA6vdnjTyoyhposs1KxOFQRrf4fVKoLlvkuoS7sS0taVDDVQRynlU6A4Lr8
         9q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785477230; x=1786082030;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sG2maHNBlRhpFNm0jTg2CGr6GPIhTgnZNBndxYr+Duk=;
        b=RRZchl11in6XMTNZB+65ru1aDvQd0cJrPC1q1fHDVIYVHd329QvYNX0lz+jPl5D04K
         VXHOvA00N0OxbtZe8mt7F2M/0OOGD7DJkOYLubyU+teFnXw9X3PJXOBytTaQyzeT0WTw
         q0/ZzOOngjP7uJ3N6RTroLq+cxvI1blQgtWVRzfKLiTIOX8a+V7Js2rieQk6a3zxouN1
         wRNUY5QIl9wmO504tTctDD4BleNRX5HYZucdK6atUhhzuTUeqZKjmxH8xte1zxWtc1cf
         IB5g4XAoKWgFmegq4q/n7WuaJLFXs6nDfi6igFwnm9v7d2bd+Kfe2G/N7316zNlszSQm
         6EIw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5KYeo7TJcmZj1T2HhieeCkeAyU4MaDmELOCvotoBMbjFppcL/LfUmZqgG4rjsvN9FescTLm1F4U8mIWhA@vger.kernel.org
X-Gm-Message-State: AOJu0YyDBcMaq/KRSYSqEmLJ7Qra8tsqlTbuUOpayJLB87eK+SXgbthi
	t4A0iNN2fEm6iXAelm42WypPbO/uesJw5jlwXhJD2irZtJJf0d9RGRz/51gqKxRouG3bb87WFFH
	NhT9y9426P4r1SFiE9/OwsoqnXQQYvN1RnDvEjMgJ8PjsCnXoV21JCh6T6hN82mGkgAKK
X-Gm-Gg: AR+sD12N8R3CUpBo99c3852sW4erOa6fKo+jv3q6qGeO4LSCnDH0i/iXjP27CwfovWr
	5V7XzoIfD7nBxXJOZw7NGNytI/yjkzlIwxhBe0tUGvIBZBQaXo4Q0cvR17PTy6ffpkbK5YojGSv
	o71wPaBVsqJyiAbgGTNkZOb2PKfv6woH29cFG8A1yA45lPAly8R/DP9536eTwKnf/hz16DNK0+e
	FIHxVfRrFaP3QHv7X8GbnIsJS99+8Dsc2rbD/njxT9UFoNkrmM8OYL+mYh/98/hmbuVA9fx169X
	i1fwgplqPBT0n5qG4jVZit+3eRodKlsCZk2ZqUwTJ5FDW3klAyt/NQ/FYeVHhNq6YKIph0x2ywY
	VQb3R0teSZ+/OHw/Fb8u5wlYuAcz6QFx1xQgsSV1N8tVOSwnBZg==
X-Received: by 2002:a05:6a20:258a:b0:3b4:b340:411d with SMTP id adf61e73a8af0-3c91b11865emr535670637.24.1785477230118;
        Thu, 30 Jul 2026 22:53:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:258a:b0:3b4:b340:411d with SMTP id adf61e73a8af0-3c91b11865emr535650637.24.1785477229662;
        Thu, 30 Jul 2026 22:53:49 -0700 (PDT)
Received: from hu-doz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm1643675eec.7.2026.07.30.22.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 22:53:49 -0700 (PDT)
From: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: Add GPUCC and GXCLK support for Hawi
Date: Thu, 30 Jul 2026 22:53:47 -0700
Message-Id: <20260730-gpucc-hawi-v2-0-7bf618ab8a34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGs4bGoC/03MQQ6CMBCF4auQWVtSCpTqynsYFs04wCRCsRXUk
 N7dSly4meSf5H0bBPJMAU7ZBp5WDuymFOqQAQ526knwNTUoqbRsZC36eUEUg32yMFjWVJRG6w4
 hDWZPHb927NKmHjg8nH/v9lp8vz9G6X9mLYQUSlXUGFNhd7RnF0J+X+wN3Tjm6UAbY/wArkcKH
 asAAAA=
X-Change-ID: 20260705-gpucc-hawi-8c35e13866fc
To: mturquette@baylibre.com, robh@kernel.org, andersson@kernel.org,
        conor+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, taniya.das@oss.qualcomm.com,
        bmasney@redhat.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785477228; l=1652;
 i=dongfang.zhao@oss.qualcomm.com; s=20260706; h=from:subject:message-id;
 bh=e38rX0l4uVxIOcbqc8igZXZ/CMjDHKSXoW7V/dIp8dA=;
 b=KUggpb9+KqNXldhI2q8TbnrZZke4Vct/nVbk7naRyJUW50oMX67yPg3WFDIfiz5rxqg6ozIqI
 wDbmCXmSBjDABIQIR1nj3lRClJImbocrsOj+sQEtQvWIJghiBx4Ornc
X-Developer-Key: i=dongfang.zhao@oss.qualcomm.com; a=ed25519;
 pk=oRbMthG8BHvTvcxks87U5rUBoZiRXWKs6KZR6lV5C64=
X-Proofpoint-ORIG-GUID: qcUlFla7QzY4-Puf3y7xzy-E5WVIQJwO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfXxGBHu2Hxp6UR
 +edoqlfuz4N8RlcF7bZMgPghm06fjRl8FjjskRRDnxJx6CY1vyMAIlE357UM25UdGG42UDfJO7G
 XG8Z4VfzuWQs73OIRzv51rV6Hp2wIHuyX3fKhODFvk7WeG3Mb5mhUsWgnjM0GVKlqBvcar7XXrD
 r2GJWOY++sAF1dWAPGxvQlvrFCf7ORkzvHmM7sUIjg1geEgo03IxSIyIf1U6wRJASTZ/0wPFHJX
 KW6sRO+GgEQ+VfW2r9qjG5UUg684CVBRwidmcs+4XrQ9DArWhPLvRfriOu+uEpofAy8QdUPld8f
 9ZFOi3EqeZ/GIrYBctjU9kv82YSnULkGUIRWkg1YLifOmnFyliiJn8zKVpcSjfhh6vLqDZy9jd4
 GFA+khOrL09r/HP9XI2c1V2Aomjir8aVdBl7BALsnaf5K7gaACun04gUjaj4Jbv4e4lOETP+cov
 2MaS72UBi+jOb7KGGbA==
X-Proofpoint-GUID: qcUlFla7QzY4-Puf3y7xzy-E5WVIQJwO
X-Authority-Analysis: v=2.4 cv=MLBQXsZl c=1 sm=1 tr=0 ts=6a6c386e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LjwRoHMMlgVm7myvQdUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfXykz2YOrdBSfu
 U3/lBCRKPzQxMVCFnUZPtfiWe8o5/GRipn4vPrTk2IiIjZYF47bXpTxcrMcnc5DSWb7dvs/rlDL
 xvRpHaJ/cQBv4QyNzC01YVBxbGhsm0M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310038

Add GPU clock controller (GPUCC) and GX clock controller (GXCLKCTL)
support for the Qualcomm Hawi SoC.

The GPUCC provides clocks, resets and power domains for the GPU
subsystem. The GXCLKCTL manages only the GX GDSC; remaining resources
are handled by firmware. Hawi's GX clock controller reuses the existing
gxclkctl-kaanapali driver via a fallback compatible
("qcom,hawi-gxclkctl", "qcom,kaanapali-gxclkctl"), so no driver change
is needed unless Hawi-specific behaviour is required later.

Changes in v2:
- dt-bindings: qcom,hawi-gpucc: reorder power-domains and required-opps
  to MX, CX, GMXC to match existing GPUCC bindings (suggested by
  Krzysztof Kozlowski)
- dt-bindings: qcom,hawi-gpucc: shorten required-opps item descriptions
  (suggested by Krzysztof Kozlowski)
- clk: qcom: gpucc-hawi: collect Reviewed-by from Taniya Das
- Rebased onto linux-next (20260730)

---
Dongfang Zhao (2):
      dt-bindings: clock: qcom: Add Hawi GPU clock controllers
      clk: qcom: Add support for Hawi GPUCC

 .../devicetree/bindings/clock/qcom,hawi-gpucc.yaml |  78 ++++
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |  22 +-
 drivers/clk/qcom/Kconfig                           |  12 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gpucc-hawi.c                      | 461 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,hawi-gpucc.h        |  47 +++
 6 files changed, 613 insertions(+), 8 deletions(-)
---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260705-gpucc-hawi-8c35e13866fc

Best regards,
-- 
Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>


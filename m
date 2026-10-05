Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D828D490BE8
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 16:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791218765; cv=none; b=C+3ORhFL9q1U8OgRJVXDUkzyWEowgoV9sz985d6HbpfxALpVTzzOCzEZGwLP4+d0BT1y3bPvBHPfX3KT87jy6eY+Ok6jIuUpTJ6NEieEDCd1e7Qi/s9+dPL6IJwhO8jwaW/PapOj2398jpKo5FcPOPr5LQNJEHgaMtQjKZXH2IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791218765; c=relaxed/simple;
	bh=vuxpQQHSHpogoXgcj1g6nYIyqWnif7Aqe4zqMtU2VSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YOny5/7AgsSXQ8/eCbm1oFxHiaOllfRilFAVYt5x+3B9C0uZhPK+JJnM7furk5p0Z0voHvNEtzTSLqAokRSb//o2GYUULY+5dM3oou8NXOqFOzrosvg8M1hwdU2cohJDZ3XBkok8iIA6gvozgCQ0+uW7YCVW5Ck1YAuGVs/stnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVdadjHK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bAwVzQdz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVdadjHK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bAwVzQdz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EPwNX762340
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 16:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	312B9C6n0UKKu6NJESvzkUE//S3M9JdnPEV0pkxNzjc=; b=RVdadjHKRDFdePLL
	+B3B6fED203OnFhhjYuocbbf9WN2gYd1eD6mUm3oA7wa7T/vR0qimuJJ+Sxf0KTi
	hjdf57cxmIAnK7zltI1nHqPImNvutUsX2IjrEchEBypCl29TpHHt7hmNWYGkDJJ8
	ctCptH2n/6imq4Sfr2gvI4pB5xUZ2QlX+v1BBG/n12NIKGrZIl6pxwjkjD5YMCid
	htIrsvqUDthHhKnhOBauqnjROKe85EQaCYZu3WukUXZCjvqfexj5RlthcvE4iPJV
	/sj/14kFVKwMOCJqhsrG+KYQEDmMKo3OVA3Fo1d77j5FDhP/0YmiFEJxqAMXorXT
	zvEInA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4dncgkpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 16:46:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e2f2bd5256so13295265ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 09:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791218762; x=1791823562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=312B9C6n0UKKu6NJESvzkUE//S3M9JdnPEV0pkxNzjc=;
        b=bAwVzQdzi/K7UAvO3VtT1FcKRerQol2DmLtgQlvJLIAQRYUGzFaJ8mWHc6H6XPeCEJ
         fhP1Ip5odVQ2gre7q1fUiLOmNNFyVHTmqKoKdfBUg54HmI62HggEnnYQeEZ6ZkSZ1pSK
         eOxipafOBS+q3pgp3bzUzd16Z/wU6NRddyG78sddAbEelqqT14zYiGKNzzTDOewK5Yt1
         uUF1Hqu2fdZrc44/vdeMFDqPUwjlhTR0oKhl0PapRF81ZDlgJ0WnXaU5tbYHZWqmDhhI
         LjZkbnf8p1YJ1m6wM5lZ0DD0brTcLzJe29sp2mc/CaXHarhtGXPm+tIz+cfStGYpPEu+
         KM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791218762; x=1791823562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=312B9C6n0UKKu6NJESvzkUE//S3M9JdnPEV0pkxNzjc=;
        b=PceRQzvvDOoll7HwjiDmaIZBum3mGdVDKmGduI6SEBZF60COsT9CbLIcq3tKO/hqa4
         aDKjDLiLuuBHX7OF3y2lMZ4s91D0gGPFMBuhQvWVgDqUgWCh/zTsOLEumD5OGvoMhqam
         7Z3Z9sdY6gXP/gBqSBWVcVQZAdTxQnqvv33/5fcwVBRc79aEt1jOjPRnR36p0a0NaFoh
         SwgBMiBdHrNB0IysQRHnWPTQouI2HzFD3vVAZXNb1kp2C2qvAKDQ2Efbap2KYsn2lg9s
         ucEvPjWxP3C37WQP1wg0v/vT+F6ZAmd5DQ3JAx70gz3cLsTR0NcLyVhDd6dGqHMAWXzO
         HBmQ==
X-Gm-Message-State: AFq9FYL2o+O8X6m2oFDJv7brUcRCDq6xHqpInuiL1qxVm6kveX18HOek
	by0eOx676FqjmtcPZZLTjXNg33otHofTvY7881SIXUvcHAW/tCYqg+3QyUuSufUIzbt0yA6/X3D
	LYINmQOekX6swGfvceZTiZb+orucG6iYm6tcxnWgBv5pdrZJvIb60P29OjAHPNX3ah9vzr38yD4
	X2
X-Gm-Gg: AYBFou3U/IMZgQNDjCcaF0InVbK7HKSZNTS42memOZek9bMJchcw0VaReVtvZGOB+JN
	WTGTHBBmOX0YFiu4yxJtBmEsyVr8IiGPD/S8mbt2UjEXO1Fne9XK8v+Oqj2XYe6tQRZD1DJP/+U
	RsCqHpFdsDud36JgHve7IgXsyXO0GBTE8KFYLLQ0KSbjgIXZo0pVEGikCmYGiLlgf0eS4YcjqOG
	woW7WUmsn9Sv/hMyDF+zZfilEfpDyOx4eUs1N+cfOXgUyg9ldQC53sFMeEQGy7tBvpK8g5aU5b8
	YLIZDjRCASovfD9gsGFsv8It13mPkx2J/fdxf5N9X5yIXZImXvdDVQHZChSToV1cAwB5MwbZCsy
	TX0zDgamu16n/BIV3ARNLDT5Y5QVvlR0jtsc=
X-Received: by 2002:a17:902:e5c6:b0:2e2:d77b:e584 with SMTP id d9443c01a7336-2e49b652159mr106114185ad.13.1791218761886;
        Mon, 05 Oct 2026 09:46:01 -0700 (PDT)
X-Received: by 2002:a17:902:e5c6:b0:2e2:d77b:e584 with SMTP id d9443c01a7336-2e49b652159mr106113895ad.13.1791218761385;
        Mon, 05 Oct 2026 09:46:01 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a55b6161sm10665605ad.1.2026.10.05.09.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 09:46:01 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 22:15:44 +0530
Subject: [PATCH v5 1/2] dt-bindings: i2c: Add Qualcomm I2C target
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-i2c-qcom-slave-v5-1-6254cc7c08d3@oss.qualcomm.com>
References: <20261005-i2c-qcom-slave-v5-0-6254cc7c08d3@oss.qualcomm.com>
In-Reply-To: <20261005-i2c-qcom-slave-v5-0-6254cc7c08d3@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791218753; l=2790;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=vuxpQQHSHpogoXgcj1g6nYIyqWnif7Aqe4zqMtU2VSg=;
 b=qlo/yCL/da/k8bjEDYuBMYX8DIv6a6sleDD8q3TXdZR3mAF8G0KYj2LBdEmYA+ZbNAkcN8WRj
 Wukk0S5AI/mDx0fb2LyC1o8vBh3NvLCfosD8tAAlALF6Oz+bIt/eOi6
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2NSBTYWx0ZWRfXxgjKGXFc5xhD
 jqJKIIsys2bI0ear6dU/kEOhszlj1DI3xeuDCBdRcVLumPP5QMak09NKKffRYVC+ejrt7LKSDaO
 gQFObB16zfuFxzcyeigCj5slraQG13w=
X-Authority-Analysis: v=2.4 cv=Vdxir1p9 c=1 sm=1 tr=0 ts=6ac3d44a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=64-jBHeFNbSwsrqMnDgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: PEWtzb0OiaqmnXWHHJflq5-fL45pWID4
X-Proofpoint-ORIG-GUID: PEWtzb0OiaqmnXWHHJflq5-fL45pWID4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2NSBTYWx0ZWRfX1SXTzSJF2qNs
 Mc3jU8ICsqvkMk6Y5aNY9G73NKp8GfRwC0TzRjp9psV+SX+V76toV+r/4XFyYkMfIiGVr9seH1b
 e0hEPnWzLYP2Vjusg+ath/YiYOHc0qeRkrBg+aZ5FhscMib2LU85q50X5K7cnTojTKq3ufvz4Vb
 Tp8s5P/Iuxx5tAYcE+QoEEUBYP16HHLTnT+I+qMvMsG7ubRRUEafLCPjTfXiXyhkuZ6s/YHG1Za
 ZPcL7sOaNsaQ65nUj10BzgGvVa52yRtAoQKFBLCoi6eSwaGwmgqYUf9iKWphmJp1xEpy2NNsuY7
 UsK+OAmC+xT5DGg70pkEZYsjwFsItHB5/m2s1oWkngCUSLRe6lyjJ662llFaDxKduMwwZkJXLI/
 +WeMNDmGGiQ75hPZPtK6e8fL0Sn9+gQko5FD6sqJLWEPv30g/jIkfHHsdJFfPN6VltlVa8VNKmS
 4qRjq7keaqQyFTVYCuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050065

QDU1000 and related Qualcomm SoCs include a dedicated I2C target
controller that operates exclusively in target mode. It is a distinct
IP from the Qualcomm I2C master controllers (GENI, QUP) with a
different register interface, so it requires its own binding.

Document the MMIO region, interrupt, XO and AHB clocks, interconnect
path, and optional pinctrl states for the controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 .../bindings/i2c/qcom,qdu1000-i2c-target.yaml      | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml b/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml
new file mode 100644
index 000000000000..9a6b08f0ab0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/qcom,qdu1000-i2c-target.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm I2C Target Controller
+
+maintainers:
+  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
+  - Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
+
+description:
+  Dedicated hardware IP found on Qualcomm SoCs that operates exclusively
+  as an I2C target (slave) device on the bus. Supports FIFO (PIO) mode
+  for data transfer.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qdu1000-i2c-target
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO reference clock
+      - description: AHB bus clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: ahb
+
+  interconnects:
+    maxItems: 1
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: sleep
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - interconnects
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
+    #include <dt-bindings/interconnect/qcom,qdu1000-rpmh.h>
+
+    i2c@88ca000 {
+        compatible = "qcom,qdu1000-i2c-target";
+        reg = <0x88ca000 0x64>;
+        clocks = <&gcc GCC_SM_BUS_XO_CLK>, <&gcc GCC_SM_BUS_AHB_CLK>;
+        clock-names = "xo", "ahb";
+        interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+        interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SMBUS_CFG 0>;
+    };
+...

-- 
2.34.1


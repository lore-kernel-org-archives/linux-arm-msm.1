Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2A54E4335
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 16:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352694; cv=none; b=RwuqrwdhwKd7J2/FEUd+Y020cF7t8QO3dam6r3+0ApZcFicHdgKy3B8G4bKSXGk6e6xd5m2myxzKVd53ymu/x4Ju0ZejvHVBZ6nPODg3jeQ0vKInnwfIybTBGUCq4v+AXJ8Jfw42JeW/8Ks6Hr5xMZhbF7rq17tjk8dEvPoIQ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352694; c=relaxed/simple;
	bh=GnvEtx+QtTm6eOQJ2pxM7uY2LfcmkLojbvEhnOk9Yd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZfxd+cgi2KT2HWqmy7RN7GRoLWKmb0i7//nhoRU3R6jtC0pMeuvLQ//O884hXrywk6/0awX6iTlxL+wGR9C2LxjdlYmRCuRVQ1Z4WZO2bTOktBYHpk3xeXJr8ZF1RAp6jSIsDZJxaxV/tDTCJuQ+fpUAMY+SOfLEk1XmlqiJqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1OLERAA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUKy5tT3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1OLERAA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUKy5tT3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0huW1964774
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 16:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1tuESQhPlki
	sArk9a4PkEwsub/p2wo9Bvg0Lw9vYWmA=; b=p1OLERAAkK3PGX6ACAZmAOi7A4B
	ACaa7BesmSoBT9z4W0b5ZYO2wTbqhxYTXHDC8HEwDnk118mi12aLomAABGRgVCmu
	nwI6bJYHc/nXCKgJ6qduanX5ufiVLuasF/qozDIVVSRAs7cu//4LBekZoKAmO/GW
	CUMfC1mPKeBkiyJ0OxyxRAyYFx7sohuS9sxM4VPjuH84max62d/q2a/zZB26pG0/
	2UGruQ0QSWCEm+6qldyN7cEPeOaiSSM1qvVK+x14uwcBa9qDg01wOUkwc4Uo+Das
	1sd/+GzIhLTq2xXZezl8UykVm7MZVuBTPUDvSUtuzf724J5W4fcqQjS5Ahg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvt4a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 16:11:30 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9855e11e5b9so996490241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790352690; x=1790957490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1tuESQhPlkisArk9a4PkEwsub/p2wo9Bvg0Lw9vYWmA=;
        b=kUKy5tT32DAYoYUikfm1OFbFQzVWvcuz833rozkQmoJuQxyOtn7+H25r2efYBP2wOp
         xlpLBS/o3vVLdnVT/DIF6hKxGqdHsNolC/0tf9GO5WIfqnEDsdhVVwsvsBXzlm6el2Xa
         Yx/mauunpsuqyHM5tsLK/otucigFYHIJNx+REseGs+ZAYrT15Ei04BJb5S4sulHZq6iU
         E4ZH78R0rrlXEnWpW7LSfoWvf7t2T3JrZfOuCgj+8JM5MfqlBRkzqb+oQZmtmuNjqe2H
         +fuxvK0hfmxX7WzqNMrJgUEgDFk8nrLXxmrHvmieESblUhfDdAHfiIsCPg+m/4FAZ8Iw
         FXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352690; x=1790957490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1tuESQhPlkisArk9a4PkEwsub/p2wo9Bvg0Lw9vYWmA=;
        b=jfTb8gy6FKRDElNDwV4gfzkQ1ODbTOWzrh2QsaJZpWL/ylKBNxC3A+ZVdtbMniK7K0
         y6Z2dt7IL11aDBQf0ArP+SZp4KY06JTQYWeNEq2pqXSBlktUYlffRzeQs311nM5O6aG0
         9ue6Ld36zqGze3E3WT2oL02WvM2s+84+n+a1sFrjFJXSrPkdLjmtiuy8AvLHrrZRoygE
         BZ8/HKEG7j5ja7s1grEhHeNLm2tXZ/97Ds2KdkHxwXYbJkGyAqEvm+E3uvNtPNL8qhQn
         4PgBu/UrUwHHr+lLWD2cpU8Nz3u3GCqRQrPepYXgNb7dOAggjtZKu5ZnYaHQaAmr4Nn0
         4FRA==
X-Forwarded-Encrypted: i=1; AKwUvBwSuq7eEhVgZoIizw5Bx/rpD94gbjSdOET6xDiLPXiB64qxp5BiK2WOVgpcaLabeMICEHQXDqEzQw5DcpxQ@vger.kernel.org
X-Gm-Message-State: AFuF++nHHgZhSHgeDQ3Uq9bU1VbSV1UAZ4hNSR13hZoXFe5qjjBSAlcx
	pTbOUCo5y8IojtWXVb0KxoeuhuowEDoXZBvtPu/TAPnzYy/c8AOBDp+TyAQ6aSeH9opmkH4Cwgk
	a6CVYeAMOKN1tCXQwX4MLd+7hyzx/ggd7FZwrTn6y/kQbICz3JTLBfkuQjXs37kRtSUXy
X-Gm-Gg: AYBFou2G1O6RuJpw4DHqX3n00ylo8OJWSQWwQaf5aDsZ9jNQ6PTcBM3nfVmtFGro5KC
	u6oxjIbqDCVjhUQmRGX4kU3aT5DJGCoYMFs18Njg1dVzBzxW2P8YgjefJsBK75FWxeMaJdwzJkZ
	bXlcZD+11sP5oC6pnkDeU8+/paxahkqItnj5dVXwX7gWeZKTa/x6+uBDNGrxNQnPWJyECmxgqW4
	0wbpG9+A4oUpaVry0ZqxO2+Lx+bOW/5DaSSRU33mMQHfjiq82P3vbFOsRfT0Ouj7+pcN/YiN3Ux
	LcusOwaPeNix85ahSCumMk8muXw1DlcOQmcYNfpE1Dd7igZf7Mj45TtQ3D1YGpWekJHAwC+746S
	kK1b1/jcWs0Ve
X-Received: by 2002:a05:6102:3ed1:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7af1d6c2588mr3149818137.23.1790352690087;
        Fri, 25 Sep 2026 09:11:30 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed1:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7af1d6c2588mr3149789137.23.1790352689629;
        Fri, 25 Sep 2026 09:11:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b4d45sm73019505e9.7.2026.09.25.09.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:11:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 6/7] ASoC: dt-bindings: qcom: add Tambora WCD9378 SDCA codec
Date: Fri, 25 Sep 2026 17:10:47 +0100
Message-ID: <20260925161049.758913-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5ci2S_oPyvjyYnqesCulxzj3C1v05XSP
X-Proofpoint-ORIG-GUID: 5ci2S_oPyvjyYnqesCulxzj3C1v05XSP
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab69d32 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=fAJwNmJgYEpPzymNVfgA:9 a=o1xkdb1NAhiiM49bd1HK:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfXwHEwW3dyeKe+
 2xG5p3VIKH8JofnMJumTVo3av+DLSEQTFoKgRp4Ftqc8LjUZIMZmYDC4MbHWMiOrpFEV7Z+JXV7
 A5FcrrgqfdzSnjJq2Zxi4Kul2IC8pmo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX+JEplsxGfRlW
 smoWzRoCRCvi3LiWTxGgMTdX+XtFOesvxAmG8MovxiZFlXCudV1zJITt26Tf89YnouAUrblNHZt
 BbWHtP5K+2gKmFRu04Pd3W9a3RrXd8CZkEXRJm2xQl5uxFIqvao/H27NFMV5KJnJ/zKWCOGNtYe
 ZhAY1WXiDmMCxkofP4anWX7On2XK+czABqc2URRtl0b/NH+EUHXsm90Tt43JYRBxs6H0CzV/iU4
 510+UZag6nmCZ9FDUfJQhWPJYu1aKzgwR/RrxIOjHqv9iG9lEgA3fq9bW1WwDkzFkQ2asS7UH6V
 ETkKbeJiifvp6k7IKYO7ZHvjfEkUrgo1nhPpU8hX2WpfFBSeZJ+H+I5JduZyrToT/vSmO07tPyO
 hsJwoQ6U9sEQcD6yV05nkUpnuBQJaNmGXeAS6/4l8HKoPGNXl0taHwKhUAfkL+21OXxUNRlo4AL
 FPPqV3OR38LO5Kf2V7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250064

Describe the WCD9378 SoundWire peripheral which is SDCA compatible
soundwire device. It provides SDCA SimpleJack for headphone playback
headset mic capture and MBHC jack detection.

The same silicon is integrated in two ways and enumerates with the
same SoundWire class ID:

  mobile mode: two slaves (tx, rx) on separate SoundWire masters.

  SDCA / compute mode: one aggregated slave on a multi-lane
  master.

Note: both of them have different bus toplogies 1 device vs 2 devices.

Currently only compute mode is supported by this bindings, mobile mode
will extend this binding as required.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,wcd9378-sdw.yaml      | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
new file mode 100644
index 000000000000..62d85b1dca7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCD9378 (Tambora) SoundWire codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+
+description:
+  Qualcomm WCD9378 (Tambora) SoundWire codec. The same silicon can be
+  fused for a mobile (non-SDCA) mode or an SDCA-compliant mode; the
+  qcom,sdca-compliant property selects the latter and is required by
+  this driver.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: sdw20217011000
+
+  reg:
+    maxItems: 1
+
+  qcom,sdca-compliant:
+    description:
+      Present when the codec is fused as SDCA-compliant. The mobile
+      (non-SDCA) variant carries the same class-ID compatible and is
+      handled by a different driver.
+    type: boolean
+
+  qcom,port-mapping:
+    description:
+      Each entry maps a slave data port to a master data port.
+      Entries are in order starting from slave port 1; slave port 0
+      is reserved and not represented. SDCA-compliant mode uses 8
+      entries covering DP1..DP8.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 8
+    maxItems: 8
+
+  reset-gpios:
+    description: GPIO used to release the codec from reset.
+    maxItems: 1
+
+  vdd-buck-supply:
+    description: 1.8 V analog buck supply.
+
+  vdd-rxtx-supply:
+    description: 1.8 V RX/TX supply.
+
+  vdd-io-supply:
+    description: Digital I/O supply.
+
+  vdd-mic-bias-supply:
+    description: Mic bias supply.
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - qcom,sdca-compliant
+  - qcom,port-mapping
+  - reset-gpios
+  - vdd-buck-supply
+  - vdd-rxtx-supply
+  - vdd-io-supply
+  - vdd-mic-bias-supply
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    soundwire@7630000 {
+        reg = <0x07630000 0x10000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378c_sdw: audio-codec@0,3 {
+            compatible = "sdw20217011000";
+            reg = <0 3>;
+
+            qcom,sdca-compliant;
+
+            qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+
+            reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+            vdd-buck-supply = <&vreg_l15b_1p8>;
+            vdd-rxtx-supply = <&vreg_l15b_1p8>;
+            vdd-io-supply = <&vreg_l18b_1p2>;
+            vdd-mic-bias-supply = <&vreg_bob1>;
+
+            #sound-dai-cells = <1>;
+        };
+    };
+...
-- 
2.53.0


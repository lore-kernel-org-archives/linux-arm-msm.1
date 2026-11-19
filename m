Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078930;
	b=Lollc9i7fl+9c1wYQbsZYGwwl2QQFX1NClguIk6zMgbwDr45kxAmzHuLhKaaeH7ihTZ3
	 xpj1OuZ7WJynfBXSmF8q3NqWHfzwvIZrw6PvvRoIWrojxUDugiRr92Fdtf0BjHISU1VsE
	 DoXnIJ4FD1IUr01ZhCDng7YgVyFwT3xQGL0HY8Eb7yWoroi2PPF4WLYI7EvgMXKl1FbMG
	 QmtmEfvFSns8DtgAalz9nPipFRYhyvMwljNciBYTWowKbFZZ5TNKaB0KurM6ThLvBUMSb
	 xsgO7A6TDI2sa/8mkvp38nnr4CryAfVcYEablIUqyGE3XPr0WOBtF7JTqhJYICUblJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078930;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NBVISwOfmrZOEZAe2XEjIrH6tbjCTBf5/CjV91GZ2hY=;
	b=EhdPHJeuqI2+FtL0OvKksfZP8u+wiz2e5eifqCDQaha3aV1kv9jBMGk/q2znNWqCtIRa
	 q3dBqublotQ3Qg2t2saRxCJnNpBqTM2eQUaqo3LTQq12sXzCFdkuBI7Pl8G1bSb3Lvct3
	 XLIBVCdKGVeHvLdix/bC/YBszYm4AcZpSC0M4895m4vKDrnk1+HaR+FQ7sbITzeuH2MDw
	 uYyPqYi5MWVmMBvx/r976jASv4DCrE0KzeE1jVuDm+comL9XtErJ81dD8+jVbyD23wQ7Q
	 J46JCzVegmghgVptXgWbsMrpaP2zKz7464adwltYRQ0glFuB2bZe6hAsKiH/UD3ZCmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FHMBTSRE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZzTiH49;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9F9606A325
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B9F9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FHMBTSRE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZzTiH49
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vGS61681211
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NBVISwOfmrZOEZAe2XEjIrH6tbjCTBf5/CjV91GZ2hY=; b=FHMBTSREr5mIO08y
	yQCkB9UucDuKOw7ofazDrvbyicvSwW4qnmm7x8TKXlpP0CX0h95+UjWhVt2lZIgw
	hPsrGjz0bBUXHYIsJ3DW/8dkj0Z80HdGQQr9QxQAvMfLZPLql+VL95anmr+L3Y0Z
	3G8lobjAlD6aY5bsC/Bk8J4c5dpUG4MUTOSocX+p5BZXyvrg4CFjf3kdIt4Dxccd
	QO0QYfgFqJ9KUE66m8+O9usOzzSNm2mulU6ZarKfzVLqu3cHdKdpdVzus/ie1z6O
	TKmalLkWDZ2h7i4Euy+hTGzARxNHINGfAjxtJhkY/VAJ++0Oka2eEDwhdfuIekWL
	y7hRZQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdcsxmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:02:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eaf3f829b3so17822045ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 01:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795078928; x=1795683728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBVISwOfmrZOEZAe2XEjIrH6tbjCTBf5/CjV91GZ2hY=;
        b=KZzTiH49obi+wm/uPVad16/gzKnpzxRyH3uaRxAgqb37pMwNiUZpSPGxr7fGSqrHC/
         Fe3PbbSU0QWYS/lKEzAe3OYX+cTyrOYPIGXygLWlnmKtaAHFn6Iil7KbvntkAUFyHDV0
         grNR+12amfppqRY47VR0JcAlObcwKKHP+dsv8weGtdoeWs5NyRfXudXtPfTPOMmsI9zC
         Z3Bi6gUhbz2XCGMESHWma3YFLLLAAtYaV1dNgs7c523Q7dXBJ/9wO+d6/UO3qMaUY9Xl
         TiunLJ5hEnBQkWPpSqPva3yHw036cpLr1geRR05RSORxLOhHqGG92tIx3eir/dYJ/0e6
         smJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078928; x=1795683728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBVISwOfmrZOEZAe2XEjIrH6tbjCTBf5/CjV91GZ2hY=;
        b=taaZWjiiXQHFXkeCTq0llVvfjvFERHKGb8umOsKA3mHAEDsUk8FLAWrItwwxNrH2EQ
         XtdBZmPaa2IzVrACOdK99Ti6SxdMbzAXZjbTwA8lVLvGvHY9T0S/ZNBtBLbUtzyVR+9a
         kN8/Vjh+dRkSP1bBKNH/63sWpVT8fdZb9BbDEVAQbKRos6YWNlYSTgOjkZkO1IFkHDDD
         jAkWRvqVs/F1250J4GE34Kvm0RQQZP7n5lGIoW5rgZK+EaAsF5SGUCfBHioX/pqFJkQR
         7t56PDFnFVFX/baVCH0SNm4mb5fn7GyS0TIm4oACDSLgSlfreo0c1HfxJ1jEOaWFay2k
         loJQ==
X-Gm-Message-State: APuU4Z8i0etW5ghCR2UiW+JixQ8W4XsmEhV2306cabIHl1og2HEuPXea
	6DzaFEUY7DEgf6WVc5Y3H36TKseWN+cv/D4FP8N8SWWxpO8QFjG2AFSnXc6Wf1S9PROA55rkrTG
	9UcJXvPJrnbSck7gXNKkHIzMNPz91tXWSK6ZMRergZSUWG2l9tcNV41Gkq2QBaNahmUdZ
X-Gm-Gg: AZFdTZdfaDphmvcvqIR1x4sdrMEKpnZmzPjAOw+GJgCVwzfCNdMM3ZZ2YPcY3c13w+l
	KU15r9db2GtayM1HbBx/Cxnr+3zzOJHlC5NMCysPXuvDyPIWwl0yB9rg2qEWfbezkYqoZR5kcNh
	cKezNzikFukcMNE9EjgHgm9WLt+BPrx6Qa4ajM7te4Xv4lpcm/ZiEvuzJ4c3QfrFNli0hzBeTKA
	4JOHFXQSzzp760Cy/KpYm/kVdyjoTIEo/+bFQECdOQGZtLTwiJ8s+jqGHIA5iRxuBh2zXRY5a6G
	7+HJkmJFInPfZ2y5se+vZav0/AkNdR0KCKFgigOrXfjNkRXBpS0EXm9GwJnNckfJBsrfgQAtn7X
	eFeZjWQskwWG8DstOXbowiRE06JQLy6O/xNh44RzPyUviaWE1UF0XSse6+GoMtC265RhvQwtD+1
	+TR3b7D9/RqcjFWvfgwOQLrKjFqitxcTef0ow5
X-Received: by 2002:a17:90b:1fcd:b0:3ac:c98e:345e with SMTP id 98e67ed59e1d1-3b3d07d46c4mr4499501a91.45.1795078927815;
        Thu, 19 Nov 2026 01:02:07 -0800 (PST)
X-Received: by 2002:a17:90b:1fcd:b0:3ac:c98e:345e with SMTP id 98e67ed59e1d1-3b3d07d46c4mr4499443a91.45.1795078927185;
        Thu, 19 Nov 2026 01:02:07 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm1689539a91.13.2026.11.19.01.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:02:06 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:01:18 +0800
Subject: [PATCH RFC 5/6] dt-bindings: arm: qcom: add QDCP TMC ETR sink
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-introduce-qcom-qecp-feature-v1-5-b1a730d2c57a@oss.qualcomm.com>
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
In-Reply-To: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795078891; l=4416;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=jelgm6FkXlnlRRjcFxO5QXgSIFxo3R/qeZJuul5NPmU=;
 b=0KFbQ+RRcWK7I6gRJBRP5aZwm2CzM0bIde4M/8osVHP1eD3kVpIaqXjnI02wJDCJ/sUD2hnFJ
 34ql7byF+BcDB47Dh/BPtxQaDQ3l/n3zIQUjA/VlM0otvD7y/YO6xyW
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: Eyc71qgDagIQICIvFFRYgFPS8igAjdGQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX3bdPzThYD8qp
 YFPMS3w/LGc8lMZDzFYiYI1+C+4s2P88XfwVCylKYNMZgq8CWsiQsgFIzyxnNyJu6YpeWs8dT4Y
 8uw4IGrwVPa/OVD42hQQf6Ox1uorx4A=
X-Proofpoint-GUID: Eyc71qgDagIQICIvFFRYgFPS8igAjdGQ
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6afebb11 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=v8kvHvLVYYS7D221HvgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfXx6G62gfE1S7X
 6aZdmvrBly/LVj5Wo2vxI/a0jaz6Xz6oAxkn4wKmPgfRklKgJGph0uCxU9Ot7GKq+zg8AwFE/gA
 i95FwrlXJvENCxV2Lc+ySq86wsSKWpdLNFQpJ/XymAY4wt4cWdavLtJI4FsOBnokKljG0kwEj0A
 lUWqbqVbSpJ20VQXvuySqFd7117WFpxDxrNZ+NSyClIkjXEXf4PAsRuFr+VGxBwfhdXRpRUSTPu
 g8/en28ZFd0EnalPQ+mGFFOYUWQ8UYIkQff2za/eZCPQl8J7MhWqfuNMviPsNV8ccExNuI9E+Mv
 vzKgUGpi7KfLsWOOl0bjWVigXJhKXY0KYn/4KHiro/WkxDmk+TKwU7dV42U6NTbqIa848V9oJO/
 4c3mQXKtlx34YMI09q+wQYY3vZgPrt9iOeLRCdT+WFoW+QPwZo3Mc6sMZixs2sy7mySGRczcc5R
 OEgyAP/L7vB/tk3HFRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190035

Document the Qualcomm QDCP-backed CoreSight TMC-ETR sink, a Trace
Memory Controller (TMC) configured as an Embedded Trace Router (ETR).

Linux owns the ETR trace buffer allocation and sysfs lifetime as usual;
only the TMC control registers are owned by Qualcomm Embedded
Co-Processor (QECP) firmware. The qcom,qdcp phandle identifies the
Qualcomm Debug Control Protocol (QDCP) firmware provider used for
buffer handoff and TMC enable/disable, and qcom,qdcp-tmc-id identifies
this TMC instance in QDCP transactions.

Firmware also controls the block's clocks and power, so the binding has
no clocks or power-domains properties. The input port must have an
endpoint so the sink can be connected to a trace source.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-tmc-qdcp.yaml      | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tmc-qdcp.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tmc-qdcp.yaml
new file mode 100644
index 000000000000..03a9dc18f13b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tmc-qdcp.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-tmc-qdcp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QDCP-backed CoreSight TMC-ETR sink
+
+maintainers:
+  - Jie Gan <jie.gan@oss.qualcomm.com>
+
+description: |
+  On Qualcomm platforms where a Trace Memory Controller configured as an
+  Embedded Trace Router (TMC-ETR) is owned by QECP firmware, the AP cannot
+  map or program the TMC control registers directly. This binding describes
+  such a firmware-owned TMC-ETR sink.
+
+  Linux still allocates and owns the ETR trace buffer using the normal
+  CoreSight sysfs buffer lifetime. The allocated buffer address and size are
+  handed off to QECP firmware over the Qualcomm Debug Control Protocol
+  (QDCP), referenced through the "qcom,qdcp" phandle, which enables and
+  disables the firmware-owned TMC and synchronizes read/write pointers.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: qcom,coresight-tmc-qdcp
+  required:
+    - compatible
+
+properties:
+  compatible:
+    const: qcom,coresight-tmc-qdcp
+
+  qcom,qdcp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the specific "connection-N" child node of the QDCP
+      provider (see qcom,qdcp.yaml) that owns this TMC-ETR's control
+      registers and services the firmware buffer handoff and enable/disable
+      transactions. This must reference the connection child node
+      directly, not the top-level QDCP provider node itself.
+
+  qcom,qdcp-tmc-id:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      QECP firmware identifier for this TMC-ETR, used to address it in QDCP
+      transactions.
+
+  arm,scatter-gather:
+    type: boolean
+    description:
+      Indicates that the TMC-ETR can safely use the SG mode on this system.
+
+  arm,max-burst-size:
+    description:
+      The maximum burst size initiated by TMC on the AXI master interface.
+      The burst size can be in the range [0..15], the setting supports one
+      data transfer per burst up to a maximum of 16 data transfers per burst.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 15
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description: Input connection from the CoreSight Trace bus.
+        $ref: /schemas/graph.yaml#/properties/port
+        required:
+          - endpoint
+
+    required:
+      - port
+
+required:
+  - compatible
+  - qcom,qdcp
+  - qcom,qdcp-tmc-id
+  - in-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    etr_qdcp: etr-qdcp {
+        compatible = "qcom,coresight-tmc-qdcp";
+
+        qcom,qdcp = <&qdcp_coresight>;
+        qcom,qdcp-tmc-id = /bits/ 64 <0>;
+
+        in-ports {
+            port {
+                etr_qdcp_in_stm: endpoint {
+                    remote-endpoint = <&stm_out_etr_qdcp>;
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877C9550DD4
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 14:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878835; cv=none; b=D53ZPDL/7w5MLgVpJCWNqeBvcSqyOUzzbBa6zL2tM0KPPwAHRwgkDIMffEMQ3Gx3KwrsxSx3CzlWqrj6iXFCcJVTEFUfaEx9F2wZxj5KFBElD4Ud2UGnmrkFoZ10ng1fky+BQY8PPdUPyN0L+3Jqi3esqgtezTkJCpggmfvqRZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878835; c=relaxed/simple;
	bh=xTJjfD5LOLFQIBHTyKxlBjiEn1EV8JlKMGzF8eRjNwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FbKbYLoxQ1jmcl61P50KCnxkcjH+A5BfNnCxfUIO36X24oMfNc0S7owWZUwG5Msxx1wBTw3rC2s2Ue4Vk/9eYsRTj0p3W2IpVtrzyWM69mGJT+yn+dKA7vcFnXTxzgiyk1QbliUq/xb5ieEnmYbXaNQJxlwNz18LDTTD6DV2KiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgJRwNhu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6fJqpPN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgJRwNhu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y6fJqpPN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EjaeU2067478
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 14:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ST7wDY9QZk1oGjjrN6llgg
	nO0dFwmF9Svnv+hjQYAyA=; b=BgJRwNhuUWBhQXkjeKX0A+aaLb2C236cUyWi+Y
	lPpZhFfKBKlf5sPNedjk3dvDcQiU9vH/AkNjma0IkpquFUS8OxkQqRNu4XyIkXze
	hbJN7yJ5a9uMVH+aD2QjC3uDi6LJfEgUUnF0LJUNOdJyZxHExONJugpiGsqYAAzF
	ANTbXxYTS5iZ7I1TLlhcx2I72a4QiQG4sOMGfCXrjQ4HnSvUaGiOTOv2y37pebbj
	RKpAB12Av4Bixtl0JZVmoc0cFbU3+pbIQgx0Z8sXWzTKFxhqYGK5zrQQQX98RAwa
	2HQsrl+MhKWw6aW7cxPcFCOc0VjEO3fXn41z2CG1/eW4xD0A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjkshr7nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 14:47:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db050d469fso31149275ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788878824; x=1789483624; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ST7wDY9QZk1oGjjrN6llggnO0dFwmF9Svnv+hjQYAyA=;
        b=Y6fJqpPNB3YteVoeL/6vkt4CkOyfwseqxYIASgDYH7igzawO+htZo71HRqX3Bd1ZM4
         fPAz78xI/PJrfO99U60ym2XINRTxFAHIEbuVsyAhO/t/BhBWEIJW6I8vClcdwaK9Ml9l
         bIypR8GFRL3uzifOKaos8+or1PCkn1sOTfPAqW3ekAFd2Env3HAoLVYexMAw/WTrHn8m
         0szHcFvLFWBq2bVfJ7BSGrPV/hk/VP9yulyekXzCNQ6iqF4tBuBE0KLQujBNgCfYIQLU
         7d5ITRgH1PzFSg23w+U4fky/XKjEx0yG2MZfqWh+bOcmJyvnaujSv5rwN80+Rb9eLGjn
         PR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788878824; x=1789483624;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ST7wDY9QZk1oGjjrN6llggnO0dFwmF9Svnv+hjQYAyA=;
        b=cCvhkMJQvzZb/zXiihvAX7L5kT8QrdZPHoIONcyz9WvphRIEtp1oFdq/JlFJ7VWu3F
         m4FGQj/0zvFNGgprjAZCAecLbAp/6+tFwzLT6K5SCxGj2gGpyQhFb18qB+9/6i71aIvK
         q8+53t5g5FHdfilV5mt1Na1nmGLZHNpcpqHMSZt3dYqO5bg0cyGRIDFw7KYE9BAoLYK4
         8PKXKLXFJS+Vw/ASlNnK8GRFKA+JHfsyDEus43QHDrbvqako+/vhrSJeJn7d3MqqunB0
         jqaJ2sjTvV27yvfQm6KNqd5E6S1uTQPvlQwzpyYikEdtmnC4MFoH1F0uRbJ0wVj2IzT0
         ahig==
X-Gm-Message-State: AFuF++nBKqY/LqIZ06en6+U8+JI8qiSaWfGs0Ppk6pTexpp1eKCm6aHB
	rnpOGIYz8vXLKD/5xi1Gn6nGz/m9mmdpSlOoqYy+FwCMtKYD/3s4C2hkPzjxaSWy96rZAp4x9Av
	F87y8i//BSX6Vg5i8qKvDpygaqMkNgdh0PecKnpR/IQ0vT0Nwk4TdSFrV/plrbN3bcs39
X-Gm-Gg: AYBFou0yVm6M7VOyfbmyGQ+AzYabtgX7T8jWubQco/SGQ9GGbAKTLclZ8zzWxZx46lU
	Pa0ZUMykdPzA5Up7HctRB12x0jf3nIP3R/sNVEiZgTKa2ThL8QDE5wEyPD6guAHlBjVqDaSPXvU
	1uMPZIFbqlO2JoCPelnpLRkR9VK8S1lqNqDHH3O7QcyeP/O5l3NUcbwDbJ/RaiVHYBsEKHwBIqc
	40o+eeAxqN2Zj1xdftfZg8ePrSun0upMKGu5SmLFlboG6PgEFayQFhKzgPKFQmQkINksH979g1e
	vy0i0teOqjIVYMt08Cn8AEVUvx57FjIGrZt+Yr2DXyFgr+IbVlwx0KaaSbakEvR7WopD59rDNWW
	xoR+HLOomJ9yTrRob5NFnaX6+cTeqcWFRsNZS
X-Received: by 2002:a17:90a:e7c9:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-39b07f2f51amr38609775a91.1.1788878823557;
        Tue, 08 Sep 2026 07:47:03 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c9:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-39b07f2f51amr38609705a91.1.1788878822944;
        Tue, 08 Sep 2026 07:47:02 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm37018331eec.9.2026.09.08.07.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:47:01 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 20:16:43 +0530
Subject: [PATCH v4] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 bam-dmux subnode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra-pas-bam-dmux-binding-v4-1-6044889e7e3d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANIfoGoC/43NTQ6CMBCG4auYrh1Df6DFlfcwLkpbYKKAttpgC
 He3stGFGjeTvLN4vokE59EFsl1NxLuIAYc+hViviGl13zhAm5qwjBWZZBJCi0ev4awDVLoD291
 GqLC32DfAlC6qupQql4Yk4exdjeOi7w+pWwzXwd+XsUif3//cSIGCyWheGmm4s2I3hLC53PTJD
 F23SYc8+cjeyfI3yRJpVV47rYShgn4h+YtUlP8meSJpITWvqzyz7BM5z/MDQCvLW3MBAAA=
X-Change-ID: 20260727-shikra-pas-bam-dmux-binding-28a6bf97857c
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788878817; l=5433;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=xTJjfD5LOLFQIBHTyKxlBjiEn1EV8JlKMGzF8eRjNwU=;
 b=D3EiykkSbxrcWm38hRsxB6VTUWXZEET42Pcgy8jgmvgFQuF58Ds79vOBbAIakrak0rQQ/JZ8e
 /l1VH2SqGxhCMiuUpFayEp/ZeqrniTItldmp/y1Mi3OPhGNDaYcwHOt
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1OCBTYWx0ZWRfX/NtjDps48h3S
 YaJGjvEjwFEyxWbm+FK500B+vHYgy3OprPzxtw4MTiKjwT7qZzM78Ddhhd56RXfZmOCuzOtAhow
 llhHbyQDyQ4/7gXJTk3W4imiY4FPZrc=
X-Proofpoint-ORIG-GUID: EFHQbEfGee16RF4vRADCd8YHm4xS5uPl
X-Authority-Analysis: v=2.4 cv=TammcxQh c=1 sm=1 tr=0 ts=6aa01fe8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gmyZvYRh-Lm61jtpQzcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: EFHQbEfGee16RF4vRADCd8YHm4xS5uPl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1OCBTYWx0ZWRfXyndL6Ebue9p4
 KLBLTcWpJJ/6J8H69nF+Pje7XN85v1VidHLKT62rDaQHAlKEqITdlSoW1ek0EkCOaA+ky1u7/gC
 +zpht4ZYixj3sm1H4puRI3VTrgqy2ezwhv6iV/WI/X3BTjmzKiE0jM8L9orhGA1J4UfzpXhyezs
 dAlbCxYg5IEE4XQCLIMR6CCCuB3sL90ZxeZ70jgD2ikXHVL6uQkN4ILl/auo7ByZf8yTSA4goCu
 wBOJHY7lkIDmwvs0kfepAoKAGckO3HKxonqk/3rXRBeWzCsLwCSlMrNZzQi/y74jUh37IF8eUhI
 mpf1HIUW2JHVlsrxRnwoUlv3LEf6Tbp0rvtNleGfrWszWkCU8eP/NoVmHdmtVKUgTwfZszEMk2L
 uD6mxC6IF0gKnllb1/mb1rlhDrn6i+4MQuLwcEsMzv04zrIJKpRWIWnOk01+5fmq2384dPRTJwM
 LjSAS20sPC8qDwrR4jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080158

The Shikra modem uses BAM-DMUX for its WWAN data path, but the
qcom,shikra-pas remoteproc binding has no way to describe that
modem-owned child device.

Without a bam-dmux child node, the binding cannot model the relationship
between BAM-DMUX and the modem remoteproc, and userspace cannot
associate the multiplexer with the correct remoteproc instance.

Add an optional bam-dmux subnode to qcom,shikra-mpss-pas referencing
qcom,bam-dmux.yaml, and restrict it to the MPSS compatible since only
the modem subsystem uses BAM-DMUX. Add a second example exercising the
new subnode for dt_binding_check.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Changes in v4:
- Reword the commit message to explain why BAM-DMUX belongs under the modem remoteproc.
- Restore the original CDSP example and add a separate MPSS example that exercises the new bam-dmux subnode.
- Link to v3: https://lore.kernel.org/r/20260813-shikra-pas-bam-dmux-binding-v3-1-167a3fb50d21@oss.qualcomm.com

Changes in v3:
- Reword commit message to keep it scoped to the binding change. 
- Retarget the example to qcom,shikra-mpss-pas and add a bam-dmux child.
- Link to v2: https://lore.kernel.org/r/20260729-shikra-pas-bam-dmux-binding-v2-1-d85fea84c141@oss.qualcomm.com

Changes in v2:
- Restrict bam-dmux to the qcom,shikra-mpss-pas compatible.
- Link to v1: https://lore.kernel.org/r/20260727-shikra-pas-bam-dmux-binding-v1-1-c0159c7c3ed4@oss.qualcomm.com
---
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 253b14eb2b598f0ca91854c8ff4d0b785090e621..da66034311522ba36d160959172c1444c5999509 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -44,6 +44,11 @@ properties:
       - description: Firmware name of the Hexagon core
       - description: Firmware name of the Hexagon Devicetree
 
+  bam-dmux:
+    $ref: /schemas/net/qcom,bam-dmux.yaml#
+    description:
+      Qualcomm BAM Data Multiplexer (provides network interface to the modem)
+
   glink-edge:
     $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
     description:
@@ -117,6 +122,16 @@ allOf:
         power-domains: false
         power-domain-names: false
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+            - qcom,shikra-lpaicp-pas
+    then:
+      properties:
+        bam-dmux: false
+
 unevaluatedProperties: false
 
 examples:
@@ -165,3 +180,63 @@ examples:
             label = "cdsp";
         };
     };
+
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interconnect/qcom,shikra.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    remoteproc@6080000 {
+        compatible = "qcom,shikra-mpss-pas";
+        reg = <0x06080000 0x100>;
+
+        interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready",
+                          "handover", "stop-ack", "shutdown-ack";
+
+        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+        clock-names = "xo";
+
+        interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+
+        power-domains = <&rpmpd RPMHPD_CX>;
+        power-domain-names = "cx";
+
+        memory-region = <&mpss_wlan_mem>;
+
+        qcom,smem-states = <&modem_smp2p_out 0>;
+        qcom,smem-state-names = "stop";
+
+        firmware-name = "qcom/shikra/modem.mbn";
+
+        glink-edge {
+            interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&apcs_glb 12>;
+            qcom,remote-pid = <1>;
+            label = "mpss";
+        };
+
+        bam-dmux {
+            compatible = "qcom,bam-dmux";
+
+            interrupt-parent = <&modem_smsm>;
+            interrupts = <1 IRQ_TYPE_EDGE_BOTH>, <11 IRQ_TYPE_EDGE_BOTH>;
+            interrupt-names = "pc", "pc-ack";
+
+            qcom,smem-states = <&apps_smsm 1>, <&apps_smsm 11>;
+            qcom,smem-state-names = "pc", "pc-ack";
+
+            dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
+            dma-names = "tx", "rx";
+        };
+    };

---
base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
change-id: 20260727-shikra-pas-bam-dmux-binding-28a6bf97857c

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>


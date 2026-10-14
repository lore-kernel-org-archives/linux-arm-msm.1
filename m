Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660D5361651
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 04:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791952721; cv=none; b=XDpJ+h8ohsdYdlYPPB4J2RAC0FZmFPzGikftdbn6kgJEDedvde1fGOwmPzAcPfowd8aw9q8JR/QNU0+iwi18IU0F/lJTe3PpJT4J55bnq0hf7Tp+5QKsDety+Zus4/6d0lcPG7+taUKQADQfraHVRF5mxZgH/AgzCSDsNMzpYx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791952721; c=relaxed/simple;
	bh=X4t5+8WXSWcDrlOMviadtgvxoJejJH86561bik9TCh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NQRccIh7Xj5atYRjg6yAXuShvgijkY6ym2Sexo3u5Ct72qBXGnpIVDkfHArXLY7UKlEVCOoQecrCXHhuiZLg9Ht4yU7fxkp/7K5iOvve3g4ZaU/mmYkzs080iZI2lWoBmacJlyUj2qEUf8ahp0Q/yebTMFIcDtQs1ZoL6xY4xPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qzi73vjR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iO2XVCSU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qzi73vjR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iO2XVCSU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DKOa9k442768
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 04:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSR5yGjst7ree4hGlYQQdXPDFqVHpG+6xoKd0iwANhM=; b=Qzi73vjR5NnEQ8FR
	YZlPtRUAKLOYVmFPCL4xGGdNqmNhKBSLwHz43gf6UEW3lGLPn2nZyWAOCLbL2t8/
	Q2LJJ137RyhB+wP3Gb4ftemTlE5FtwP5vuy2qnUBuxHUuM4j50/jfjHvY6EjSU5A
	IQktWRcUppALZCkni3rliAHt4jBFS7uExGpwj9FOkuuQ9rvvPhyn0CmmIknwmHKL
	QL3jTvmXDydFnDym+CA7ZAx2udOdR7BGfbWUT5werMnBDsRp7WUA1+lXVPKtlR/E
	UiHm50ZE5B0ctJ2HfsYkgLEZDafN3A7R5tcUW4Bcl+Z8QuvVHZ/KPfe+L0nfQYvS
	m//mVw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9n71kjnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 04:38:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-533928ef33aso49792851cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 21:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791952718; x=1792557518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rSR5yGjst7ree4hGlYQQdXPDFqVHpG+6xoKd0iwANhM=;
        b=iO2XVCSULXJyBLKPAVG8s2X92yYl6COw3DP2BLizUHgcTtcP9Fxl5l9DUtdV3knqTU
         ZUzJ/2GQjS0/0AjmIlZbYnUX56DNGUHAU+y8VxKVTYP9Zr3pUgxSh1D0BvOKAS1e6o7s
         Kpr0yyyVmpOM2WcPZm1A5flXsLj50HnoSJikA/FLM58WnluoTehSkndGjANBfAJIpbsy
         VXppph6MPwBGhfvTogByb5fgwntgH18XusQuRrWUe4B0qFd3ZL7lyJ9+Y5CAKwKD8opP
         b5cu6VDPZVgHYuAOwWQ/IAijmMQleuaHOU0ZNOabYxSo47U2RownvY4RSTlQy7bj4Yvl
         +b2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791952718; x=1792557518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSR5yGjst7ree4hGlYQQdXPDFqVHpG+6xoKd0iwANhM=;
        b=OV5YF3quQCaX5T3WvB9XI5yTsUrBPTD04+OY6MZLSBwOqjhdnfSfHlRE3IIgmKaKIc
         QI00BtPNR57yf1s10rUUvLXqaaUZGuxmrbiCKx78KcfEyFBclqymyi19FNEANQdUyYoc
         ILiHwJu65tFUtOxABF7owznuCx8K1q0gNHw3+hONGGVkwPzrPZVmI1B0ir4m3zepUKh/
         jTnOigl4GIVjkNhgVnIsL6YVrq5AjtXWji7bFuEhc89qD/Aq24kEtSJjrzeWAmmjJMBn
         xkhkZVFlOMjO967l/6JPD0flqFKVqZ7H18SSeKL2kaH88YuoA1lMrAKHJFyDbTJiDXtF
         tKxQ==
X-Gm-Message-State: AFq9FYJzBXto1fT232+tK7SE8s6nuoZwHFI7N7tk1JDmpdu3Ea70+n9l
	i/SfoXQYfS+Fb5O1JSRr8CIj6sF/uRufb4P6arh+NknRJZsDusY2qEiGF/WhoD7GJrsNBBgLtY5
	uFsTS+t2LgGHSIEd9HrZEZkt/nlSMRCC+nXrMzgFcUlB5mElrB3aHpksBZBr6v4zbZ2Ka
X-Gm-Gg: AYBFou2NtSmo/+769b9FbKHh1qR3U/p7WvF2dITMZwtO9B1UCNcBoftbSl8xtHhjuoa
	JPVbOT31Y+Mr/2BySXQyCifKR36J1H9guDy0VrqmN57kVL7f0D6YJMEcHRR94QUtjXrIwJmvxZH
	ZmZb2nXJTYi361B5FmCly9plwL61QarCz1hkgnPSm1aaAWWuN6oGQdvnYQbV7GuUKliFfRnXkNk
	ycf+bB23F+dBEFSS6tCKgATnDlt6PM3yRkZFoIbllCraibidonoaxzIbg/Zd3Vmaz+zB0GJUZ3l
	CHsnAM1qCDMaCFpZldcRzHkV5EGuy8mxfX2qfXfBxVQ+VO8H1pBHtQSXZ0C2tTnewZu8vzq8Odp
	QAwHPLMV+Bykw29IGX9wDwkoEC/L/qpKu4tZrcLibRLrGqN1g7YQ/W+M3becsLA==
X-Received: by 2002:a05:622a:e0c8:20b0:535:a5fa:ee0d with SMTP id d75a77b69052e-535a5faf24bmr157458941cf.77.1791952717535;
        Tue, 13 Oct 2026 21:38:37 -0700 (PDT)
X-Received: by 2002:a05:622a:e0c8:20b0:535:a5fa:ee0d with SMTP id d75a77b69052e-535a5faf24bmr157458781cf.77.1791952716986;
        Tue, 13 Oct 2026 21:38:36 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b755c35sm116809651cf.15.2026.10.13.21.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 21:38:36 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:38:16 +0800
Subject: [PATCH v3 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-msm_gdsc2-v3-1-f1ed69014416@oss.qualcomm.com>
References: <20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com>
In-Reply-To: <20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791952700; l=3637;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=X4t5+8WXSWcDrlOMviadtgvxoJejJH86561bik9TCh4=;
 b=49ZhH3GuWNSITYuhFpsrQO0sphIX9MFQeSGVqv9dWe3wjkgysi/1pwye4t4VUQrYX+P+AfuH5
 mFd/C5RgUbRDD2A4a52jIorXTz6fmjCB2Hp7FlyHpyAomW+eTKXG/U4
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=FuqQbGrq c=1 sm=1 tr=0 ts=6acf074e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vb5kALK8DBTIocmybfAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: W7RxLkn9XNOww8Y5fQoSM5t_zglhGC9B
X-Proofpoint-ORIG-GUID: W7RxLkn9XNOww8Y5fQoSM5t_zglhGC9B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxOCBTYWx0ZWRfX3xSTXvNRy+X7
 CRNymdDjTAxFIAVnq7K4aOQaZ+Oa7fnVMo3mKQoAVEAB6tV3bSy0i2Y4PECXN7RGuQEpf1XdqmV
 HE+V4ESINUXqTz6OLNWJ1KEgpx5H2bIjtbHvEyjEhMWgHb6ixcHW51XHz6kqs6ZWZQUnUxkdOzJ
 SuGRwVZ1vkSMrtH2XTLxVjk0wbhJN/fyxux9BmBlgkC2urtqRrKe+aqIaB0kKQ2F3PtDH4qPNyr
 BJlkWKPfZxXCqOfrEZp82jw3I2FvjpjmCWIvQpQHKbfmP3fisHERV5d0nOzocgvin/uSB8RLTPi
 QbdDJYb9K2iE1I/bFk6KHabaRjGpsDsg3rKBcabs+V+R77sTCAQFtzqapmU6RkMbGEQxOF61Rxs
 YlvpWxr4w9xtxuWg2ksQi9aYx4Wp7uevbBhxr6a/XXv6T046u29TkEmNvvf2DqQBRK5Z1P3z933
 gRAFl1ZcSBkpadX4/ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxOCBTYWx0ZWRfX8wAtZ/twzx1U
 AG9zBEaXNCjYl7TJqYHEnJN5JF7lCmbnBec96houd1EKWeN8W1AkQklNRyMGaCv5jLViYZYZEeY
 zUb4XZmC5CicFR50WUh1ilzeYQKPpIQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140018

Kaanapali (SM8850) has two display GDSCs. CORE_GDSC supplies shared
MDSS hardware and most of the DPU, while INT2 GDSC supplies the
VIG2/VIG3/DMA5 source pipes. Without INT2 GDSC, these source pipes
remain inaccessible.

Describe CORE and INT2 as power domains of the DPU device, matching
the hardware partitioning. INT2 only supplies DPU-local source pipes,
while CORE also remains attached to the parent MDSS device because it
supplies shared MDSS hardware. DPU performance-state votes on CORE are
propagated through the genpd hierarchy to its parent MMCX domain.

Restrict the two-domain schema to the Kaanapali DPU compatible, so other
platforms sharing qcom,sm8650-dpu.yaml retain the existing single
power-domain constraint.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dpu-common.yaml | 19 +++++++++++++++++--
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml   |  4 +++-
 .../bindings/display/msm/qcom,sm8650-dpu.yaml       | 21 +++++++++++++++++++++
 3 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
index 3f953aa5e694..19b791a857b5 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -25,8 +25,7 @@ properties:
   interrupts:
     maxItems: 1
 
-  power-domains:
-    maxItems: 1
+  power-domains: true
 
   operating-points-v2: true
   opp-table:
@@ -53,4 +52,20 @@ required:
   - operating-points-v2
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,kaanapali-dpu
+    then:
+      properties:
+        power-domains:
+          minItems: 2
+          maxItems: 2
+    else:
+      properties:
+        power-domains:
+          maxItems: 1
+
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
index 9f935defd6b1..6d6391970d6b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
@@ -125,7 +125,9 @@ examples:
 
             operating-points-v2 = <&mdp_opp_table>;
 
-            power-domains = <&rpmhpd RPMHPD_MMCX>;
+            power-domains = <&mdss_gdsc>,
+                            <&mdss_int2_gdsc>;
+            power-domain-names = "core", "int2";
 
             ports {
                 #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index aa0cf0ec5b93..512143402083 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -61,6 +61,27 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,kaanapali-dpu
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CORE GDSC power domain
+            - description: INT2 GDSC power domain
+
+        power-domain-names:
+          items:
+            - const: core
+            - const: int2
+
+      required:
+        - power-domain-names
+
 unevaluatedProperties: false
 
 examples:

-- 
2.43.0


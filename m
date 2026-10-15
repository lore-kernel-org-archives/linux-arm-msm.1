Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9043151CF4D
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058128; cv=none; b=EZyf0Iu58OmP7AV5ABPlGFC48AKfa4QxqljNQYxC2wgNdPfQM2C0pajhae5RKYBMV1e32EPLUirQyJme3/ROTiK9DbqlI0aMheAZ6bT3LikeI/rzMrkNbvnGtIZGbUJqFbU13uREhDUzjG6/zNjYEit19e+5AIRv8j4i/WFgAyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058128; c=relaxed/simple;
	bh=KUEHUBPe/fn8mPYYNLva7h/Xl1fyUiFTYnaelqktlMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TOdxGrGZ8wOm8dcTGfuxx/ZprzWwLqsiBJOBw/aZlSPCM2KGjv5Dory49Ed/JP/5dtqfAmrSi/3SpxJbIvgAKqDnuKXyA8dKXcPNJRF65z5U01cwX53T+h5VbqZLE0ZPXA8mpqCEC+FPYUYnqlHp5SzXtQwexMqb9brQzCBJN9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cbog5p3N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWuez7Pt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cbog5p3N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWuez7Pt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTiC2809328
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gvh+Pd3D3uvOpYm33562JNzfr/Hgc20K0knnG1EMfRc=; b=cbog5p3NFk6uvDvW
	RCQxAiR7P4oDuwK22erMzrpGhvtgAC/0kEK7esX3pjgny8LJDieORWgTGyW4/bAQ
	vPN6ysB1ZaelBGPIjXrqHlKw6fc4iAPhyBkGIr71yn+EqMK1+oTbrCl4DHeVFEYQ
	uSAZWoz7FsaMUXkWCAH6Y0x8M+BfqCMCfUdmZINFHbUsA9s79cQkXinqDkQbTNgm
	1ncqS/lyi5VIlftYc+c2bBYUkUvyAHbFhn+59fhrUeLGwQW8n7LygMKuqO1VrwM2
	IdndfGqIcAwn4GmYZUo/ixYcfbAKQbbKFXtcm4RHE6WVSehm2ffc8YYrBLZXgYoV
	A4QUIw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54sxfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:55:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso3545878a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058116; x=1792662916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gvh+Pd3D3uvOpYm33562JNzfr/Hgc20K0knnG1EMfRc=;
        b=HWuez7PtPeVE9JcVVvTT4ZJmGcom67osgSeALobc5JGg1FhKUINgvDTBx70MHsnGXe
         uz337MbP+w5b3k554qat+BgHOPrFrrHu0FvT8z7SfPyZ4iuDfrdaz/AraSTkzcjlc81n
         YUuFLi58gEVzY6I+w4CEeqxrlqcxnC5Iex9Ad9I1ed7oQzJt3heFyieAig4dqDObq7Ds
         KOSHBuR3+1b1/YRDqJ40bYq0uW8piGeq/He/Wxwe8gRrO4OZuoqwgiRwv0pzkvEaIY9F
         xflCLUAwE7vgTO0zm79BK9rm8HzpiVfXC/iKu9D9KtHxp9mIFBbfpDiUY6GwBdgBIs5y
         0OFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058116; x=1792662916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gvh+Pd3D3uvOpYm33562JNzfr/Hgc20K0knnG1EMfRc=;
        b=15nLh/l89nYgT4GiBcM27D4xtmSPZqKwx5g3quTd9WjRsQFPZAjqrlzEbWjuYf4c4B
         1Y9WWWx3J41Wr1zUEXn0Fvm3qEKvWcR8RU2Ud2HC7Q+yAvihn2bp9O6TwIuMIva3o5fz
         D71C4nM+JpUG6lyTwuKmR/m0zXCKAWPAdTSItyLzsJuMxVtjJjUvSnYd5QcuHKoAc5jJ
         WVfdur7COZHWk1i2emh2PbMRZgslXTL+IqsMjefqEJi9t4CI+ajPYzUxaikFHqaoL+Qs
         dj+dHtUr2hIQ+cEHAm+Ra+KkkzoBNwoHVQeIGKn93nFYyxLoxC3jiZJmrlPysJg2RrKP
         qxKQ==
X-Gm-Message-State: AFq9FYJCa+l8CiLf6kLUL9DENRjJfsnuUd5JOB9MKUw2RVyFiuRK1pHE
	+Vc5Wg3K8vDAhc4gzgKndr60rkBNDLUIOpMFYJJjThOSlsMBltFtxZZ7ltRhh7VpwaHz8fuM5hN
	5viKCjiv4tPL7CiOCH0WWuMToamQcVgklItXLs2r+RoXwzWwq+RnXNhIMKsJFwgI8L40F
X-Gm-Gg: AYBFou108SngpxCbYTsB233Az+un+6txPs8Q0K2hM2zOyhaXRzcMpHtSadbPaTFg09p
	oEcCQwFfDu55xXEY9TWUhbPi2mhrslEWUPcFMMcfkfWcc9q/iFFhodX0dGzf2T5O7Fn6SiPUoCg
	4Z/ihu+0L4A/8cUG0zczbJxZ8iIU2c1Zuxpmw/aM4XJOrdqHV6oTl8mjboiqghxNA6gQRaS3M6W
	UFFYe+3loNvKZEsfSugpK9/yizm1WVtSMMf1Yx5eHYtGqXn0LPziPfyBs8238pCqQWPVpOpCG/6
	rA+vLoJ8vgK0V39BJ1N1ezvzG4DuZt1ahEE9cEbGtKUmvAFnXU4eKx16WBuwNrA2gdkefYnYuiY
	ttgzpDCUqu6/kbMQk8WvjYrFjtTdgU/1AHVCk
X-Received: by 2002:a17:90b:1c04:b0:3ac:9176:e83c with SMTP id 98e67ed59e1d1-3ac9176f205mr2470064a91.12.1792058116324;
        Thu, 15 Oct 2026 02:55:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1c04:b0:3ac:9176:e83c with SMTP id 98e67ed59e1d1-3ac9176f205mr2470023a91.12.1792058115786;
        Thu, 15 Oct 2026 02:55:15 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e1a11sm3612322a91.7.2026.10.15.02.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:15 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:24:32 +0530
Subject: [PATCH v2 1/5] dt-bindings: display/msm: dp-controller: Document
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-kaanapali_dp-v2-1-c15cb83d9140@oss.qualcomm.com>
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
In-Reply-To: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058098; l=2211;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=KUEHUBPe/fn8mPYYNLva7h/Xl1fyUiFTYnaelqktlMM=;
 b=jJjbWunLHnUWwxQDX4nnUy9L6muiboocim1vSEKrd2ADhoYhYivBvJirbOOzAj3UJQEb4qzvH
 wsiPzxH2MpGCoIjxMpZYx8VBep83kESwIa/R5dq4B7cgvfcSiT9tzjT
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0a305 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=V3dFujuFVO17DJ7hoKIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX9BJiNNvelRFT
 rXqK93KRlPn904S6cq06embcnF9ytzoLMBdl5e8pr2cS7YGkbRneadhyYw5+S1MYwib7wGDFzqa
 QlDyIdYr3cC1wOGreKe7ir/p/Bnr4yG/forvC2xQwP57TE9qJPHCZlAksASiR6/jZXqhdFfoTaF
 0C0KLEcxb7Vc2w9vR+5u0bLPX9GabrvWKT6YEiKbBuoL6fLwlZIpALErJExaoOLmx0+A+t1EeN4
 FpUBa0+cIjaoVin0A9d+2kMXO3g7wHteari4u3uQ4dGGGnGM6Vw3Z0tHgjFFrIekVliuFbsdeQn
 7J7wj8O3doqhrA/1P0KLZNP6uBBQGmjdc0y/0F7pkNWWgyiz1hGOCRnf0Jpk91kgsnPVUx9KJry
 Cgk3kP4cTQ49hwgDVf/IrwmSfn7gS6oTZ6ibSMYbvwPe05dV0THvB8dwrvFi9J+kYIJVvkUP7Tx
 Iq+IIX1b0qqufzIxE9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX3+cXFpzPqlUK
 scqe3YsQ1JOuEOHdbEnhPlgDqVSAFQ4cYUG9ao1NXVuaHuoMyYyAgypPMFqZ1RIxCwvflSG1PKI
 V1ncgax3erdiRi6BxGKHNmOqUK+z224=
X-Proofpoint-GUID: QnyPEtLMLeaaEwhk5ieXD7_tkKns4wPS
X-Proofpoint-ORIG-GUID: QnyPEtLMLeaaEwhk5ieXD7_tkKns4wPS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

Document the DisplayPort controller on Qualcomm Kaanapali.

Kaanapali uses its own DP compatible string and has a resource
layout with five register ranges and six clocks. Add SoC-specific
constraints for those resource counts.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml           | 19 +++++++++++++++++++
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml     |  6 ++++++
 2 files changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 094a6383bb77..0240e3c1a6d9 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dp
+          - qcom,kaanapali-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -290,6 +291,24 @@ allOf:
           minItems: 6
           maxItems: 6
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,kaanapali-dp
+    then:
+      properties:
+        reg:
+          minItems: 5
+          maxItems: 5
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          minItems: 6
+          maxItems: 6
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
index 9f935defd6b1..83e3596ba0ed 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
@@ -48,6 +48,12 @@ patternProperties:
       compatible:
         const: qcom,kaanapali-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,kaanapali-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     additionalProperties: true

-- 
2.34.1


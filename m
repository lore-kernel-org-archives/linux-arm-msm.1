Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6BE484230
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159260; cv=none; b=hWBKkviVsMyAqP0zCEiBpeKW2bQPM9RuVl2kcpMa447f8aGlfZ+sbxdNlz/LKU+fsVBBak4f8+x/e4EfmQ+gg6BVpDbVdjHhxHBPvbGHUc35XW1O57FnSdLuIZZdDPpr+t/89q5Q7aAmebC/gGP1dDejmhD0ffF4MF8aVmVnf5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159260; c=relaxed/simple;
	bh=dPgaamYjOu93/yM3gV2qF9nzfgiS4ZPKow7lnCe+mLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DwbZ5Tmf9s4NVy3WVIJ/O4b1ie2yK607cODLbLILf867lp8abfjdkS33gCVlw76Z1tu3iHoWH8vennUUBMuENjiApZ/YbUmyzGNXawBN+vEzbiuJYDonPkb5g5dfxy6Tzw//mlEWtyCffHffa7XXuXnp+p6rZ1GXVAZK2l8M/6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Trx4Xl6U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JbmHYqcB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Trx4Xl6U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JbmHYqcB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2h2X3208437
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1NuOH1NXcB2AiI/hLtOWQM1XgjcXBrhm8FLEPIqXD8M=; b=Trx4Xl6UZKDhwbvB
	eChrg8GkrK1mFLFBmIrEvDMVX0t8RTkR21kvIGY8qvKVyur/LyYRza4GDeDo2rvb
	KRVf4mb7VSOkjrdSOZVcjb7jpUztFUTGNn6Me+1/JYoKR7LbWvDOtdrvFGTRycsF
	eoZS4vzTGk7nAx6OgeEbho/96E44Uuk+Yh/X6rm5tpMajQtGh9XVqyL1zEp7Olr/
	BiU+ttXtpvcnSJO5KLXYmIWHpwDC3aZtr/mRZq7SN97/Nn2EIfDvuIs6hbx28oZY
	XT8bF3H5wRFYhwraK7Qh6enTlhhC/5dR3hQV1yV1NoEksWGRt6HhiLnzpcGP4Aor
	06ChCg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n1gq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:27:33 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1384427c3efso1297175c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159253; x=1790764053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1NuOH1NXcB2AiI/hLtOWQM1XgjcXBrhm8FLEPIqXD8M=;
        b=JbmHYqcBT5WXl9wYJDFteZ04+i5sHEB9dMooxBuj1ApqKVsOb+hckYIs8R+4u2Wwyj
         /xKTZit/NOjtYlgOK2kQGSoYkyf3CFPUA+kx9MViaLpKQJ56mne3we4fqu/U7Ki/t5Jt
         O95TIEKGzQFQz9GwHnqn5XqHy8H69MOqNTaBWFbSTkgUtz16MEap+9st0YvAiCerWdl9
         K59zd71N/Adr5ltuvtmPjpP7lu5h3J7abwT5EE6tFkHiiVR6nieESheViuZKUQVZzZeq
         0cdvPw82Mmf1mbEr5DLby/hAxNgvH+Qi3L+3Z10bTmXpYbvyTDlTaDp/lqQZjn7Thhmi
         GheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159253; x=1790764053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1NuOH1NXcB2AiI/hLtOWQM1XgjcXBrhm8FLEPIqXD8M=;
        b=Papbn/lnWGUqADPTlhtC5fWjQrzihw6o6mO1rUIRf1IEOWfp35Av5dU1RbEdSqdfTR
         YlkHuJShaK/RNfd3fp2Pv22Tpqf8mG4i7Ki0w9lwy0gt/o0TIeWQ5XA2GGEKsYZnHTrv
         Lnb14a0Ds5AtMqhpMc7FZ/Y2zfgGftPo/Nb2sWHCbP992aOUehl5fDOwFz/xZy4trtL1
         b2N1P3Zi+T+ffOR2zMffEOs/hwPiWahAzkThWP9tYwv+lnXDzIVfTcCrxgwBibrcosqJ
         kqxNjGsFXpC2BXC5roraJq0UmDEurrgOBSzS7iN8XRRldvKWuYZj68thVESH59LZV0+0
         2XMA==
X-Forwarded-Encrypted: i=1; AKwUvBxFMJK/hFYbzc04G1uVR8AGdip8d9dtNEB30VHKblmT77Cmsz1z8SKEGYuZT0M2Az4BiX7xuMStfFRmh+QX@vger.kernel.org
X-Gm-Message-State: AFuF++k34E00iUh5yAGwimpt6cZ00PoVlcrBc2jKi9D32q7aM27Umw5s
	KkUgZV5+hFin/aerZzxa8PHU3rp+K6IpVVEvnDuKrasK75tlbLo5XbvaTrNYVvxGkIAwFBof1Kl
	+xVJ5VZc6Fqlnifeou1MLVXTvajtHSao0DvV2BaTzGsB58gzevdDVnerWXHHi6kIV3BvX
X-Gm-Gg: AYBFou1yREA0G8s5CgIHOml06+DzHdyUtzfEoZdJiQ4ZH1itK0zVG/Im3PxNyqreYiy
	W9n65BUH9InjgK41taNAc7rNPs4ZPEnCGOL4OC83HDFlEVCukoeIvmXc4nKxqo/XFzoQMQH7B2F
	/w5n1tpm+Q7nx9/HXv3EJ51JSHQRrCjlmrMp+IwCZwB3KGDYhq4kKxQt1G8z0YVHobXd3xBvIDw
	vjjvmJF3CSrfGGtD2WiAOpXbYaWpHi8DvDkGcwZ6X59/MQ2Gyv0hbqrBcHgFA5uN3m0uGT8gTJy
	Ibr1k9CBmXmzxw8v631lC+gs33BwTGaxo4uWvTzYpAs0gNQJ8K9j0lVUxG37XaPTsrosnsGj3c3
	L8ZP0LcoMHwqlQRUdUBVnI7E=
X-Received: by 2002:a05:701b:4187:10b0:144:ff51:2d5f with SMTP id a92af1059eb24-144ff512f97mr576946c88.33.1790159252654;
        Wed, 23 Sep 2026 03:27:32 -0700 (PDT)
X-Received: by 2002:a05:701b:4187:10b0:144:ff51:2d5f with SMTP id a92af1059eb24-144ff512f97mr576909c88.33.1790159252108;
        Wed, 23 Sep 2026 03:27:32 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:27:31 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:51 +0530
Subject: [PATCH 11/15] dt-bindings: display/msm: Document A845 GPU and GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-11-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=4840;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Di/O0uiu9sPfgbWZQ+DWpyFRPmaRlm3RFUo2LVR7Grs=;
 b=oSIRTIhIZTWgDC4dXD32uIpXePSFy6yeSCHpm1fL/BJX72Hrv/9/RdQGTvztY59Hyg5ntcCm4
 jHdUKpXw1dgALp5yZOyf/ttjpjDm4SFkpgAu8+0TssXWGH1uhbPRZd8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX1G75j4f+Ak49
 DtD7lH6N7ORm4v1Gha3tra72+NEJkYzRO8MzZoW105I11/od0o4M+UTf/OUkbmBJWFc8rBXpJCt
 UCEnq+3QP/dZ1wNSFzzOPIjXScrSAp0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX4iJT2Dg3tYTd
 aGgYeXYxoabRlrzdE/yPq5A9JjOVeJVQQobBvBZDSSFAM69wNk7wkvbD7RoP3RdH5nlXTxgW7xM
 lV70wA/kitGa0mLtdK9NDIFcx1N9irUhNs6Ojaiakl28sxMB9nIQdf+3ma61n9GfEEg13zKDxrl
 DdTVNpazhCQPb+FtzkAgQW6jpxtIcQzBfxFAKoRBS09ukEkN/CXzqp+WTnvDGdl72yma2xkop32
 v4QFqZlMPk3slvXLQJ3kiXr53+MmXYR+95tyTkX8p5OS+WtdLMUPD0gcM9EagZrADHhuBImtvHP
 cIgCTaFsKe+4TbNl+KxCpazciHd/ZMVuhNo+1NudxxMTkR5ofNmcs0yr70cXmNfM3WqnHqWei6J
 7GiexGJCeZlSQSZMo7STs/WGe5qCzclROUkc86LrhcgipIm67aUB1lKrKkMDAUgi8JGORxcsZIx
 fR6PL89BLgupQRCr9Ug==
X-Proofpoint-ORIG-GUID: 05jFmcINTj1n8IA7ySiDVDsdLW26SfCq
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3a995 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0V7fMRHxbeNora9F6bUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: 05jFmcINTj1n8IA7ySiDVDsdLW26SfCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

From: Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>

Adreno 845 GPU is present in the Maili SoC which is very similar to the
A850 GPU, except the MALU block. It has different set of power
configurations and the GMU clock list. Document this GPU and its GMU.

Signed-off-by: Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 54 ++++++++++++++--------
 .../devicetree/bindings/display/msm/gpu.yaml       |  2 +
 2 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 875fd1242528..be4feb87f274 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -367,7 +367,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-gmu-850.1
+            const: qcom,adreno-gmu-845.0
     then:
       properties:
         reg:
@@ -380,7 +380,7 @@ allOf:
           items:
             - description: GMU clock
             - description: GPU CX clock
-            - description: GPU MEMNOC clock
+            - description: GPU SMMU Vote clock
             - description: GPU AHB clock
             - description: GPU MXG AHB clock
             - description: GMU HUB clock
@@ -388,7 +388,7 @@ allOf:
           items:
             - const: gmu
             - const: cxo
-            - const: memnoc
+            - const: smmu_vote
             - const: ahb
             - const: mxg_ahb
             - const: hub
@@ -407,7 +407,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-gmu-x285.1
+            const: qcom,adreno-gmu-850.1
     then:
       properties:
         reg:
@@ -418,42 +418,60 @@ allOf:
             - const: gmu
         clocks:
           items:
-            - description: GPU AHB clock
             - description: GMU clock
             - description: GPU CX clock
             - description: GPU MEMNOC clock
+            - description: GPU AHB clock
+            - description: GPU MXG AHB clock
             - description: GMU HUB clock
-            - description: GMU RSCC HUB clock
         clock-names:
           items:
-            - const: ahb
             - const: gmu
             - const: cxo
             - const: memnoc
+            - const: ahb
+            - const: mxg_ahb
             - const: hub
-            - const: rscc
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: GX power domain
+            - description: GMU MX power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: gx
+            - const: gmu_mx
 
   - if:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-gmu-wrapper
+            const: qcom,adreno-gmu-x285.1
     then:
       properties:
         reg:
           items:
-            - description: GMU wrapper register space
+            - description: Core GMU registers
         reg-names:
           items:
             - const: gmu
-    else:
-      required:
-        - clocks
-        - clock-names
-        - interrupts
-        - interrupt-names
-        - iommus
-        - operating-points-v2
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+            - description: GMU RSCC HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: memnoc
+            - const: hub
+            - const: rscc
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 3438eebf2fa4..a11a4dba838d 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -415,6 +415,7 @@ allOf:
             enum:
               - qcom,adreno-44010000
               - qcom,adreno-44050a01
+              - qcom,adreno-44041400
               - qcom,adreno-44051401
               - qcom,adreno-44070001
     then:
@@ -453,6 +454,7 @@ allOf:
               - qcom,adreno-43051401
               - qcom,adreno-44010000
               - qcom,adreno-44050a01
+              - qcom,adreno-44041400
               - qcom,adreno-44051401
               - qcom,adreno-44070001
 

-- 
2.55.0


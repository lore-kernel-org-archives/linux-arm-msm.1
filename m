Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31444E4323
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 21:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284536; cv=none; b=oJqi4G1Ci2JwSUsLaYLyHG0HnL51OX/6OB9snQeL36y08/nrUdfrXgCijGGwNvInFG8zTKhI/xEMfx2wQyhf3JMAqI9CvtYXXo9dGheT+9yhrjSfK4ATrqdKNCLGzEVZNGDAANqaZ2FJscFWt6ABmRTXpalqxYZ2cZEcz+SMqBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284536; c=relaxed/simple;
	bh=dmWP87UxI7uBujY0f2nbWfb3eJIAq1CPzDfzqVzPMAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tT5nlJdrXdjwgqIiYZ+drnRaYiArQX1AH8sxlCGEAUJJvBqZgeZiGqRpTj7+mtGiVqfEVNPIQbw0c2AUYpKCSBMn+L20kEyoBgsQ0e51bfVLDzwCp2Ly6cpfOnNYkRNfCMdEAwJbG06boaFzhxfYh7AfddAzqkZkSVQ0ADYaYpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVMR9lyd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pbl7pmvH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVMR9lyd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pbl7pmvH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIdhKM2496528
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 21:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tdcekugkB66ivyH706zrRjgKb9wjBOeIcQvd77Bs0o=; b=cVMR9lydDqbJ2eM0
	G72iokSL9QiT6pKIanwZ1s8jWrDZ4g/wIY+JhOxxFyIDzvJraI4SxTcuxc9G3WWX
	0xpfN47PJGNIKeVj2hUTvT94k564NGArOkbNekewDQPQfE7i/BxfmyQH//CTfYvr
	2B+bt37+AI0O7qCaFVWWbVJf1nFhMm0+GYY0gK8gXzTBeuP5idvzYzLP49Vjgc6Y
	uQAbU5XLo2spsBTVHA/X8EJWn1N+6VQsLT+8IhGeoLYe+UZN++Hn9HD3m1trvt5k
	tx0wN4TzhWCNYqlfMpr3wtzyzs4K5mzOlyg7rLdBJNeZaCAKY5784Pwxs5bb87a3
	Dv7I8g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e1hcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 21:15:33 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1437272611eso426813c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 14:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790284533; x=1790889333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tdcekugkB66ivyH706zrRjgKb9wjBOeIcQvd77Bs0o=;
        b=Pbl7pmvHHwc8p64Jx36717p+1jwWjChwg/jOW3E/9YtrbmMmbwv/nYi7KfN8Ypkky7
         xmduFIQH4mS9kDyBaniT+l5ib1TMHFH/19A5HTerKV7J74RY7ryJYRU+zmbi/hXHyrQl
         F1bJB96+3o59FDiF6mCapmSq/o2j+mppmyDNSxki4LMmCfNcDjqqynaXRNCyWoTS+NOn
         wmT4MZ+XdGVF6O2Pmf6ctRk5EcDXdGcjA1H59vtOhdyIQKj9xPCddr9byZgqiX5SfnlW
         FEgfEfs+WnYPn3r5syTELCiPqzIGuKjULkdbp6hr8W9pakLeFmYswdKdRQsMa1fSu/ji
         /bYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284533; x=1790889333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tdcekugkB66ivyH706zrRjgKb9wjBOeIcQvd77Bs0o=;
        b=qRcA16VNHI+iacuMvF2u/bPeLP704dgB5Q4X2GKfPARYcwGWksVMQJa76ytb+u+f+F
         GiTLlKWebX/Q+u3yrHQjtzjQaWiHBNdQ9UHJranY4nHRxCk1Jzp9uqdFqwFrIy3XM4n4
         5TsOhoAjH2y6zcqg4q3YgaWZbwS3wEGcsLNFl3f4VHZ8ZWu8KkycK+vLL4e4qiBSYrZk
         dpdxIQc0RrlpxHcB3lkZMtBkQZW4f1MJjYKDF20yojlc3twr0T+G2vl+LTJ5B2lyXPcF
         gO8Nbpo4Lzz3prtCVIooUZ1AfO3DIXNhWDI0/5mIY5OX/A/YntY7nyudkinHvX7u4hXp
         AE6g==
X-Forwarded-Encrypted: i=1; AKwUvByC/2BJJRcOvA46Yy4xUOjZJ+trS3kSa+6hsgYy6C7kPyjAsjDAo25h0fZU7PWz447cJ3p4fHVZc5dFw3fp@vger.kernel.org
X-Gm-Message-State: AFuF++nZUidPL+wyxTTjQD7S0HpX1IAiZgN4Bhi6k1ZziP/vFeUuhD/S
	1C0hYBBl32GbVaVeEnZc3SQjj0H8kdF+b3w0zmbXg/+SXnJGQJljFq+6ShLfUbpNa9lOEdF2oDg
	RhW+kyUDDkS32xgr8a1tDKTe+COVdfVH0efuHf6Q+8ln4CZK76RDQ35Wsp9aErdK3hi569ItWop
	ns
X-Gm-Gg: AYBFou1K/pWFbf/DtZGwSHVNErfmR9m5vH4tcZdqnOhmhgM02AGRxgxyj3LhDKjARPR
	uDJGMJhLwlUMTKxO/kNx6pwq7Jk3G4Nx8K47cs0HvbSdRELsADepxI2ATwlS97NZ3YSmtqEl/QL
	9B++7snQNRVjHkQM9MZe2EtVS2v7zFEVnyac67gMYiB/v/mQYDvFsfwHnXEqm6DpAaG8krCXsB9
	GWquXMme0wi48O4jzxQJg9Epnjeizsx6X/39fTpAf1Gp/o6RaxINagKeG2poiCsvVSburOMo2TM
	Qq/Y2zW5n0q1RNmVB/LQBFdQR4g1uiDlTP3znjHkQ5WsmpUk2y1ZegZgvgscykMR2e36Jle5rv/
	RC9nHaH1p5k1RhXkQk1SA0ZM=
X-Received: by 2002:a05:7022:3f8b:b0:143:50a0:56d1 with SMTP id a92af1059eb24-145ee902dc9mr57120c88.17.1790284532692;
        Thu, 24 Sep 2026 14:15:32 -0700 (PDT)
X-Received: by 2002:a05:7022:3f8b:b0:143:50a0:56d1 with SMTP id a92af1059eb24-145ee902dc9mr57096c88.17.1790284531715;
        Thu, 24 Sep 2026 14:15:31 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm1323776c88.6.2026.09.24.14.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:15:31 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 02:44:35 +0530
Subject: [PATCH 4/5] dt-bindings: display/msm: gpu: Document Mahua GPU/GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mahua-gpu-v1-4-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
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
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790284491; l=1718;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wFWuC08EWZRz11+MVbDa+H+VKqlWAF1+MEP53XMoALE=;
 b=k+Zpqxr+yNVuWSBKTLezYW3OVVU34ewiwjumOVOdyNbZ/VJePl2XAynAMxxfbm/xhPbHYjeDB
 z8R2UG9USMACf0QCKKlrU+RZeBDQVbQpTOfSVYPS4Xm7ALM0l7K/y+n
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfXzDRM1kwzBVbM
 T9oL1J+a0/IO7DH1V26BWD6yoCjV8tPTl8zUrTLbI5ugdiDO+/LCU507rsF2phuKSQvId8u093e
 j3BnZQpw+CqDcR4/WgQeGUt3u2ZMt9mu7M5kzqBzQHslfZXlBunLngnnF50epuH1HpgfvxqWLCj
 d9stP6myV63r0yjzo1oVO/aurbo8E4EkO3hi6xgtE3HsFhPwyKGbXfbLHHhX7QX1Ql22AGtP8Jb
 dgWABG9BrphfKlpqd9AV9waTZX9R3G6V5kvlTN2WV+8pSu6WlmKmN0ZokIjGUGFGgzeNhFmiKX1
 HjvHLVu1HrwMMBdVCSq8RUE0s+V8cEmcHjaPFi6sSosqPphmN8aTDT8KCLmlj3Z1YKZNtrtIWRm
 YCGcaZLnqRmHfmDOoo92pB6nGbrjzPThqk1sPA9PAWKfeqGwfBKFMvtTOY8UUCMA3dh2BOueqRX
 Nccr+DMRvra8nUd2frw==
X-Proofpoint-GUID: vBYagQdtCzssGcsr0KXD-Jls8N2z-eAu
X-Proofpoint-ORIG-GUID: vBYagQdtCzssGcsr0KXD-Jls8N2z-eAu
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab592f5 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=I0ZAm1zAenetWGxY4hkA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX//4enSiWfMiM
 0lHAEDbngBQZrxdWdEopWXIeyLa+gcYLBDqh97D27Q7lVfhKs6L3ECYyn2IN/ioHpMjvMNuKJNI
 RKmueBG4iUhAmEHRgfH5ePf0aCm1kYU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240086

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Adreno X2-85 GPU found in mahua SoC belongs to the A8x family and
is a smaller variant of X2-90 with fewer slices and smaller internal
memories. Update the dt bindings documentation to describe this GPU
along with it's GMU.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 4 +++-
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index f22661447e7c..d10d6147358e 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -363,7 +363,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-gmu-x290.1
+            enum:
+              - qcom,adreno-gmu-x285.0
+              - qcom,adreno-gmu-x290.1
     then:
       properties:
         reg:
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index e5efe2d35ddc..8a103f998dd8 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -452,6 +452,7 @@ allOf:
               - qcom,adreno-43051401
               - qcom,adreno-44010000
               - qcom,adreno-44050a01
+              - qcom,adreno-44060000
               - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node

-- 
2.55.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A253612D8
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 08:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239322; cv=none; b=XdaGaLzg2koML3i4pjHeqNMFwiDcAVZbCFgDsBAOVpXlBvFb4xqJ9fEdtJxyuVhPRYwgDddyTJO5lurQM0Q/Rr2GYuB5Zw2U8lo9TOhfdW9O6unC/T0FjQFt7s5sUTUoXKNM68epuGMlIHiFAp5FiInzFkFMg8ko7KBUhlMMIWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239322; c=relaxed/simple;
	bh=UMZdQAjPrlgpjP/uUPVTHH4TbLaE85kc8y/6rSTbteQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J4wzFnke1ywXemLzT1mVjwxiEKDMkZ2jPANEZF+ZpefafCKwxj6O+uNh0dW02mGK/CTn0TqIHPyCAjjeLhnFm1QnlfGNGY2094YqK4o92DaitSGIQbl6cY8OMZDxmNd//cXi0cud+ypfwXPEdMGSSyFONDV8Dti2BAfElnR1TrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GLqsR38d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSnp+v8J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GLqsR38d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSnp+v8J"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665171nB183363
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 08:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IpSk/sxlXac8sHwGv3xl9A9ZxePRN+0nqtegrBdDwFI=; b=GLqsR38d3s0O+C3G
	ha/Vk5wbBipwboDBHv0FtJMt7TquCLSezQRxS1rHaQVrLikPi+USFxAIofO8X2Tu
	G33bNA9Fh1OPc+7BmajK7Bq5kQTOIbqwvVkPtnXUBAbj3nZdEzquYpZ15MFSuFqi
	10egRU1BM8d/r9dhlPKw0QPcOiLj98U0vd4w9IMcWg0/7YVCt/0UWC5oSHbu/H/A
	+I0atb2HmOOJQfgM89EunmAdHsdDG2qKX6wybRS63Y0oEQavoHuPJC/3Qx1duOV2
	3Tn9Itr4lXKoPb6rB5cBI81q5a7ZgxcjXcaTXQGwTuzqm33d8vcJ1dmGLYPNp/sZ
	RW3vvw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txej8b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:15:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ca5d2474c7so46344485ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 01:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239319; x=1783844119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IpSk/sxlXac8sHwGv3xl9A9ZxePRN+0nqtegrBdDwFI=;
        b=XSnp+v8JnfNjzQdpjsnS+XZNOhiUWth8u315peMcZjAX+ijhAF/nzpJHMxSc1Fwcw4
         FxPVPt1Ly9C0ueJphVBr1yJCVxekJn7L/vRjOqWUSfmUaVcBMp6U9I/cwffkshIycCrR
         W/FUouN7RY7g1bDR6lFO4r00wRlZ0CEJT8UChK73DpYfggZ2PFcczlbe1MoyOHNZvccX
         UmcGdCAFcFtIiSFMxoNy7Rvuv+l9UPboGBVITQAABTT/e0tN9jJC9cCcETTxRbGVbi0+
         juoRjN23CHYB9GjIJQoita520Fc5FWes4Ombf/LG0/SN560ZDZIt9m51rWKsDsLTtnsl
         5bEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239319; x=1783844119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IpSk/sxlXac8sHwGv3xl9A9ZxePRN+0nqtegrBdDwFI=;
        b=NNtnsdjLj5pxbZN7kfmh+3oRjd5b0zhSOC83nRTZUdaoyRDJSp2qswriKvo8VdzmU/
         KyndEzz7DGxOZ1XzAe/rnwDcgpyTekSlMS3PLSgl3++SSFVwT5ibSEj8Jg9XMm8CQ9nY
         r0jvTUoIfMm++lrbJZl+A3guW4eUG9nclpOEzNyTXi6jzYxFeA5rQTM5h+ackfZhpAeV
         fpn6EGPjnGgwBrO7ow6h4wMISVg2b6XFy9qTqgTaMhHTL9eyedDHFfLqPQcMXcZ6tEJP
         34k9UUyDymKXOd3tcv33U7vjxqonJXELLTmqOMIuQ+N4AegJGPnoJKeUcR1YNeRFU96k
         dMyA==
X-Forwarded-Encrypted: i=1; AHgh+Rpxw/rsQ6RObsVRKhJZyN0C1718yA81yheiq6jbCOqTFsg4/pV6XH+BKlqnglEuvO9z7oA7+aOsbkn22wwU@vger.kernel.org
X-Gm-Message-State: AOJu0YwtOqngRAT99zdNBHJOf+XZB3j8op9D2V6UUfdZqrLykiS4Q3DI
	LIQdQYmtnPMeTapwWJ2UiY6RCA2iInr0Ch2omWFcguOcAbRL0SIKFH+cm+W7/68w7SQQ/zU/zmk
	13d2Q/oMWxEtm0l3j6qd6yB4FAXKdDqfX4ULn/PgFegsXdegNb5V+W3U/Suct96XBc59v
X-Gm-Gg: AfdE7cn13CCBM15xw0ZtqqCKtGlDbztzi3XvE9pLUUevekjsMdAZUHyMsnjwFwE4mNJ
	lmuiCKSqI9oW5DUfl4LKzkjftZe6zn6JJWs/LnXtMEl+fGIbkStoHrPEDJ0O8T7Fuj2ZWyBEQut
	fHXEBDt0pHGw7nNYIEaQD06Qm4vea8dXjJpfYrSMVb84yWrUwgoR4IbTnET5mK0CCvQM6atoG5D
	BkxQpFc5tYOgEjz5Vj9o0bYneHmHzNT+mPa133JYslsfAW4JQziFWl8rYdYzB3dhQ5BLpeNhu/s
	atNOcmYYjejC2tTnvoG7nbYrw+dRnv90e1xPuDh+zpMTIhS8y6kUBbaGrbsYw85Drk97a8nUuCM
	PeKhNjInOdSxAJjfHIBE3bz8dTc5xt3kTgyg=
X-Received: by 2002:a17:902:ea0c:b0:2ca:329:3d96 with SMTP id d9443c01a7336-2cb97e432afmr54557715ad.3.1783239318303;
        Sun, 05 Jul 2026 01:15:18 -0700 (PDT)
X-Received: by 2002:a17:902:ea0c:b0:2ca:329:3d96 with SMTP id d9443c01a7336-2cb97e432afmr54557425ad.3.1783239317878;
        Sun, 05 Jul 2026 01:15:17 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:15:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:20 +0530
Subject: [PATCH 5/8] dt-bindings: display/msm: Document Adreno 722 GPU and
 GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-5-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=1907;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=SYs6J75vDEjoACg/8a3Xl+R9WIudj3QmUdBCIW4Akd4=;
 b=pgyLEEFK+ZpQAfr6m8Tw3cgMFBAIXB4mjqFjEtA7wyC8js//XGYK0pV9c7S79qGFwGMWPQOEd
 aGXOOqZhfZ2AqPhfgXlTvu/igiit7d6XcfyE5WWNIIiLyd8Zzh1MKgx
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MyBTYWx0ZWRfX2wV62q1HrYfe
 IMbJ3AErArlgKAmIw4+OJQHBCYLOkkEKL362UEfbo2FB+WEkUUPPDQZFMiXor0L3Xg+CCorn7oX
 JUrtrZ2DmIfR+uVrX0kwS/p8WjzyX0c=
X-Proofpoint-GUID: AAh9TX3n2DosDilX5VW4btWrEI1mugjm
X-Proofpoint-ORIG-GUID: AAh9TX3n2DosDilX5VW4btWrEI1mugjm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MyBTYWx0ZWRfXwaJrf1MaXZIQ
 lORzW7Rqfin/v/MJSmPh/rHGoD36a4e3iwQ0f9OqMWl0fPFMuezG/PSF7HVWVSOuoRX3pmIoRNk
 et6zDiuonUlRY4aKJk8OTnYVi68ru/A5oTiQ1FNCSydPmrYtgF5CLLBb1BAviWoNHnFseuAxuRz
 oQJdeczy+uFSAavOg/raO+Ba9Fccwm6VTYKcsmw0MA53mR5DY98RyfV5CnXpFz1lecFhk3QnRz3
 pb4XW50SjzY8j9LVOBmrz4DPgQyqXaBj/qxihSpTaOXH8vDfDvFxHSzCP1aruVRG9MRJcr5vyBu
 D3vkytSmic0q4E7kLZskjZYc+eTKc+ALWPgKIi8srJ3n+e5VFW+RUBKyiITTwvh4HBlHog77J9U
 FftFYmvPqSCERsoChUQ4KH1huP3Wwu33PCN4SGKsiUnX3pEbJ91xN+E7+1SVKDDoPF3nXyrYCIc
 m9Ka2Fy7PWZsxuOPhaA==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4a1297 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=byR7QgRKzgUKQ7cIeKEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050083

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Adreno 722 found in Eliza chipset belongs to the A7x Gen1 family. It is
derived from A730 and shares the same IP-level configurations: HWCG
registers, protected registers, GBIF CX registers and gmu_cgc_mode.
Major differences include lower cache/core counts, 1MB GMEM, no
Concurrent Binning & LPAC support. Some of the peripheral blocks like
RSCC are from A740 that resulted in updates to RSC layout.

Update the dt-binding docs to document this GPU and GMU.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 8578c2f8122e..9e459f12ce3f 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -262,6 +262,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,adreno-gmu-722.0
               - qcom,adreno-gmu-730.1
               - qcom,adreno-gmu-740.1
               - qcom,adreno-gmu-750.1
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..d096632694c9 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -443,6 +443,7 @@ allOf:
               - qcom,adreno-680.1
               - qcom,adreno-690.0
               - qcom,adreno-730.1
+              - qcom,adreno-43020100
               - qcom,adreno-43030c00
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01

-- 
2.54.0


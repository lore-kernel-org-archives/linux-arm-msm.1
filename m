Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE2A372EFF
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Aug 2026 20:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220650; cv=none; b=O/ltpHbUDgiVzHRYeXMXMjndHhBJaqpm2/qVYjNSNBB4LuRipYNcemAyvYd5Prvt8FjZZS6IfaeoW/aCjBWLbS5RTkApc/gJdcW5/Y1PZ8Fr0Vz0A4MCc3CQaUgmd/X99VjvCr4L/R0bn58pJ2Y86Wdenu2/SjR2nE/onXm3arw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220650; c=relaxed/simple;
	bh=iDieC/IXjVORu0I0IBT6FMQsM32OIPRIq8KrWM2UNhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ti0TCt64tXw+k6XAoDCNKHJlLd+XKSq0Nl1sWLHbZ2PYnGSKRR3FbqbKanDV5caMpAaQjMRAguH5m8mr7dkRtIp4c+4TkrKYyC2qCqGevaDCJsxBMCIOxENpMZ4wD2RMSJclmZRocFgpiI4UuSeXf2fRjrODY+Khev0TiINjJA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FlNcJ0t8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e4agvgXz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FlNcJ0t8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e4agvgXz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678Jvt2h682269
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Aug 2026 20:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	01u6cdInuZafszhJdWqPh5sCL8liQnvk2eQtr7otZ5g=; b=FlNcJ0t8cBMZQlSo
	uh/lPuAQr7QH6VsnLDgUNI+a0RuhGBZIDnGgQEYcsIB/kQBd9FKApWNXS+0qcIlg
	da0cI02Fci0Q3KqmcYMWgH4cFvMwHc1cs8pCsuLNIS1utHDXw0UHYGRfmOMVOdJ0
	K5YdMraYExRGCTcIs39NYMfatpsdwMyvuQymKNwmtFRfC9Ygu76rq4acaspIqDEq
	rJyulnvbBu4RApGUEuOvD9bNW/n2uLxIr59jD3fMzM9I8fucaNqPZokQon9t+n8u
	gLrao9pSZvHLNV8NNjhIm6TuuEa0AnxBIz5tIYwm47BOx97sPudlmjJpPNqFid0j
	K7MZbA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwush1r07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 20:24:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so745123a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 13:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786220646; x=1786825446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01u6cdInuZafszhJdWqPh5sCL8liQnvk2eQtr7otZ5g=;
        b=e4agvgXzorKlTWtjAKHzmcjxbBQ5WAZmqPLWWeLflyafggyoknNrXwBaPGy+oDDh7g
         06SV+4eIcImveh/oNroiS4bkxK/vEPVB0MFABjl9tDZFlosP69gKQSwjnLScxIT2oveg
         ROuuQXlgstDIDp4nY0FJj97y6FHLUieEW8YnXkXkbeTYG5jJ5IdSa7TF3HJJ8SrhdiLo
         PDKrz6kqk3zRwnIDbktgcwwGUfxPsVYz9RI2gy6onaszTi68Bs3INe4z+f2frUPxw6rO
         Plmdf1QSn0yxKPvtCyuXpaqVPIyAQ8YI7Sy5bkbMkXBRvGsjEu8qxoR8iM1Xus7uP8yH
         NgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786220646; x=1786825446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01u6cdInuZafszhJdWqPh5sCL8liQnvk2eQtr7otZ5g=;
        b=mPAUmOhJeq+9R2DL8+JxrhO0iAXDDGHQ55bG2+4dIZqeNijNknKy1FEikhOe92JV/n
         5P0XGRa5dgmtpJfx8G5NHhgrEMeclxdYQ2Sa+e6A/O6UtfCg3YdxKSDb0i9jjwX8iPiZ
         alfFlO6mHGVfPYQ+meuZV7rcTf1HbfMpR00Pd2+TMEvNP9FCN3d8qEWk4+ac3WHHhm8r
         CY2P+1EnlhuixthdC8ahH/KI+yJCeShdOAscbYQMv7Kt0vfjXWd6iCqb5iKJRcP98zeJ
         8xzYCbqYF8vv3oZxXPpk046md7CI/E7h5P9gdS0RZipdVjbIPapEm4LLrDob3A0K2y/p
         pZhw==
X-Gm-Message-State: AOJu0Yy3m+V1VtjBoXaN3AjkBAdI1PRTGqfrwOKSc8ERXDTfmw8oa6fR
	iNDc5DtLNWu2btoGc2eXoT7WPHahAQk66ZfIuypjn+ttGjTi5Afi9kIp4/A5EJRW1MOIkS9ecOV
	5RKtAH65h7OZh1sLarnRWPQJMwuLpocKeZsXLQX03NXxw9FYNkZqOdiojEtaDhlfq5QkJ
X-Gm-Gg: AR+sD12GUzdFJd3pZlJPpJLOrQ4MFKGS6U/olbPMjf2HxwQfek4MReTHdrRc0kXeZbT
	lqtZZLQCW09qLUMSIky/QXqhMHCdttqBkG0z3ny2clCg7mfsTqODMEEvruxuodnVmnTjArvVTk8
	QAh5RKGdPB6NtmfIdtW8c86XC/d67IMcIN3+p/2CyDQi5CBIY5OMc7qhGWNmfOW1hhxeBjiX3sl
	PKwpp1a06p75UGhvLEcdnU03ZMPasn92WADmYGiFvU4ByP9wnjS3bMQLNtlrxfwcOqQUtXJbEYq
	HvLWIJ1+g/NgeZPmE1DkgYuTpalHUK1iqUBmtWZ8Be3cHGaw+/vbVIB2FyZbLRhA3e1Sj0qkj3S
	tq0c0ArrsKk/S3P6mPxghUSR1
X-Received: by 2002:a17:90a:dfd0:b0:38e:5ab7:ce9b with SMTP id 98e67ed59e1d1-3909d928d54mr19724765a91.21.1786220646147;
        Sat, 08 Aug 2026 13:24:06 -0700 (PDT)
X-Received: by 2002:a17:90a:dfd0:b0:38e:5ab7:ce9b with SMTP id 98e67ed59e1d1-3909d928d54mr19724736a91.21.1786220645731;
        Sat, 08 Aug 2026 13:24:05 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86e917sm26357417eec.5.2026.08.08.13.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 13:24:05 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 01:53:13 +0530
Subject: [PATCH 6/6] arm64: dts: qcom: sm8750-qrd: Enable Adreno 830 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-pakala-gpu-v1-6-207ad1fac1c7@oss.qualcomm.com>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
In-Reply-To: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
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
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786220595; l=735;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ymhS+3e4NByeoLtvhtUzi1OU8oKq9ZdqernyZjiEAeM=;
 b=uYjdjbJ12t5VAKxIr+XNECqLJ2vbrM02URqAEEMTZNYKgw6+E2KGMRbEYVaJ29qV+aCEKIHAx
 j41pxbg/WIACKFH84SmDpzBYVCFukR2yWvTRz2H1vQg2XjMQYUVYkpB
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: wlcEsdfysJWvEX8cnWPrpousOH_0SOVs
X-Authority-Analysis: v=2.4 cv=GvpyPE1C c=1 sm=1 tr=0 ts=6a779067 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: wlcEsdfysJWvEX8cnWPrpousOH_0SOVs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfX79py+DPMHhbg
 tOAPxg5Xd19zGmIfZ9pNvR/1qMaTw7NES0cuqJ4x8AiSgT+cLbHsn2uOeqwulyE01iZ14gUwTKx
 2Ic+AU+jDpH1qn7Qj8HNseQUxBd68r72K6sx/veoZuNB3Sey7pfnN+1OzkO6nm9XApmkD++0Cat
 6XkrPsW3SCUXZQ34tji5XxhB2I/czyBlmvjGwS3AVw/6+04IyqJdGtMCKWi5sDx+23Ky790iNU0
 Z2wtYjnIkNS1Fzj4QEW/EKs4596Fs9d5cLLwA5cuCW3kX3DVFKQMi/lcC7E5jvDOBQ+rv55q+xZ
 Y7MWM/z7Ohd22i4/dfz4gJZGl8MakQMu03m1hH08JVN9sPSbhyrJ9rHFsGgldMbhV7hhhlq1kdY
 3vf/pMVuc8zSthjanjeOI0L4iBLPMbMABxJlNhpPFioFUQ8rpSD2m4+Lx25rsgZMHxUheNHCarl
 VMZPxNg9iJ3RrJ2Rx9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfX4breGQK73JIu
 quQYuLeJ73jqV23esk7TEOh1Gj+W6/qa+55GQB/I4VvyfxnCXrwjRTD/PPq0brCItzU6ksUCWgM
 XZ2OFYe7o1pTYgHJP/mUpjdsZhd8PlQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080176

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Enable GPU for sm8750-qrd platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index b56317cfa9fc..75927e1f7b9a 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -858,6 +858,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8750/gen80000_zap.mbn";
+};
+
 &iris {
 	status = "okay";
 };

-- 
2.54.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0E8379C38
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785152692; cv=none; b=JogrurdMCkv03fg1R5i1Rbt8smZ1jF3omFT8EWma6veCfSavwJbNaYIcWy6pLgA4mDctBLU+2Ww3tXCbxEKIebysmQiVFsXtY5y3WU8m7piU67c/6IGkDwvz4R5Jo5TuTa92rUTA44XFmTlMs2JL7TL7N9vynPmGe3AewvN8rpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785152692; c=relaxed/simple;
	bh=31skLf4iiwFS952ubBlklKN8tmnqwQ1LMs6YR77V2ak=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IGtrlV4cRoXlcZOmvpnfC6y53b1JoANQAXDbpn9FX9gpJb5+60tZsiznTLHT4RMYLghdLk8LEFZGxZL+WSZOUy9lP/yYa9QXRxMemK628zsUGQDgqVscLXvIdX3KOA2tL5P9PBfvIxx5nm10DP73Q5vSXbVxuz+mRGR1G0KO+BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHjJtIZk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJwzdtIj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHjJtIZk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJwzdtIj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RALwhX3570807
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TyCC+k3n4RcEpi+MH7iCBT
	y1l6ImeYdo5JDFJLRQ10A=; b=KHjJtIZkkPpkpE355taEoc1urcSE7vBf4Yu5M/
	ZlXFgN1ajtTY6aOz3p4PHKH0GYe97U+2gENVIus7TK0oOm5xedC+zPWjY0YQBqto
	8FzxfJUQ+f0drJuZUvYJrUIN0NglQpigpObwWeNFAjyDZ5Qc8Grj1Z59z8k7bA3e
	0bCGahjlh2030hBUHcrCjjEg3tnHgaIGA4v8VBO/txNYzHfEOgW1518EPYndStVZ
	o1QnsU6V4ri5eH0uxzIQ0ef9slLI46dqY+yxFvvq8Z1nAWFsue8yRhc+HlF7NprI
	tZmWGM9yCVQKxiizHlqFviRz3UwJ90wRJn9b884msS+/Egzg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp30g11c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 11:44:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso51187601cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 04:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785152690; x=1785757490; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TyCC+k3n4RcEpi+MH7iCBTy1l6ImeYdo5JDFJLRQ10A=;
        b=AJwzdtIjwXscMN5DpuB3BPPDMUf12CiMnpGYn2JgtMsqTPQ8CxpNGelBInjEHOVnne
         dgGI3dQRmDsCKeFheFo9gzj+N2X1zeAHfOioeqXoZNlySu/cltB66IBp3n2aTcPiVP3w
         ZWz9juWxw5AW98qoICVOvxiwejSlNAYrf8U2PXAt+1rPaZgY4MCRhgeNLf33kW4cCVl2
         ybDvIg2FLBH6jRdkVAFW0E/yFRiFEPfmESfUtRBHtSaoCqtU1SUQIeQy0oEVcZjn7eBu
         7gRpOmdGSnZf5IsDk1nlCKcVqoC5z/8GG36dROqU5LNp2Oi42LVSOKgSriHzuwXNN5+L
         CDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785152690; x=1785757490;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TyCC+k3n4RcEpi+MH7iCBTy1l6ImeYdo5JDFJLRQ10A=;
        b=HcEp2LZJH5GsGLYwfOVa2g9VD6UGogCGL/TRRisiSPuQCXF8AUdLHEelvUbszboSwR
         MDiVDKq1Fa7ZinYV8aR/iCcB/GNshrzguk8wScEv4uFQz0CABjgbMNicPhDD4+TO0kMn
         XrXaH4vKRkzF/gK0tiwXjISNgvKHZ4uvtmgGcMy78w/WnElN5P1AXInjoMv7Xq1WAl2E
         FNvYYDus1kXSTrKtDqemGuARsAQw/Zsk48un9+SNyFwUJDP6wlJJaT0bX8S5uO0Dm62f
         /cf/Ih/DCjhudQKNNeER68ZJgxE47/rPzvT/xWxGu2ELVpPZY/i5kXMQydHdVUpc3EtF
         AxiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6kXp6IAo/b6RzXTYtZilDktZ9Qe76C2CJYetnkR17TkkQ8l5f7p3stK9CoUU0A25LAVhadtVCl5TLks//@vger.kernel.org
X-Gm-Message-State: AOJu0YzkpiX/BxKimRmZeMYCUay/xJkHIQt1jhm8AlgeV3nLNM3qAYfD
	j5uqPhd7ZVHjVHkk8YA2+FePxdAm/nyVV/Q6lOCDU5ZGQcZoJU6BCX3JPDro8/XZFP1e+SBuV5Z
	1OIIjAhBW01r+F48remORvN9YcUJLVmSzCjvfCI4JYsNCXUXZHnxCCqWcgaSxOZj7B/9p
X-Gm-Gg: AR+sD10FIwYFNALbWBMMl0PknG2TEaoMfx0l0ufJNGOXT4q6xXPbTJrqSoyFNRkKBdD
	+c2GcWO3e5W3dU3fpKEaHbpZazxhINWcG1ridSvARuduD+6MjAnHFt7CVpRkVDaT3mr3OTZMcGd
	8mgAauJln5rqWyu8rsm95QPkiODRcO1ar7hhKN35ctAh+Sr8jVVkmBWpwb4543aj7UrS+woSG9m
	YSdnZMkxB3ezoxshZhuxStdm4bhoufkSYm0UkCF0UKwmXYwDvrt8Gqpk6HOXOYcqUi0RnfbiOnM
	KIc989Ue9ZVYPEZwrYPkDWS4S1hlDVA5j7FBMGyv9YbqsPNEA6EHT8kKOvw4GfLPHY7ODQNk0t+
	qjqyVBUy+nqfF94N0qXgXBC0X
X-Received: by 2002:a05:622a:4083:b0:517:599d:ce19 with SMTP id d75a77b69052e-529a86c3620mr90276111cf.48.1785152689800;
        Mon, 27 Jul 2026 04:44:49 -0700 (PDT)
X-Received: by 2002:a05:622a:4083:b0:517:599d:ce19 with SMTP id d75a77b69052e-529a86c3620mr90275891cf.48.1785152689424;
        Mon, 27 Jul 2026 04:44:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6e9a2sm50301883f8f.35.2026.07.27.04.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:44:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/3] irqchip: qcom: Add sane defaults and drop defconfig
Date: Mon, 27 Jul 2026 13:44:42 +0200
Message-Id: <20260727-irqchip-qcom-defaults-v1-0-ed80ad83ca53@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrB2IsangVcRFTMY64m9GpSDev
 akuv8V7JwgFJoEyOSHQwcLzFJGlCbjOTh9C9tGglX6rQhfIYXUdL7i6eURPrd2HTZBe1mtjvDI
 mh9gugVr+3t+qfix705Pb/jO4rh9hr1PdeQAAAA==
X-Change-ID: 20260727-irqchip-qcom-defaults-e4ad255d0553
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=957;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=31skLf4iiwFS952ubBlklKN8tmnqwQ1LMs6YR77V2ak=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZ0Ss/NOweHA1tHvwnFk3ox3Wfos5ea4X7Ja7y
 npwT5dFYgyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamdErAAKCRDBN2bmhouD
 11j7D/4lJv4r1WUS//RAQT/MEN4fN3ij5Z/LnTBUJwP50vOie+c1K4J2o5V8027F4HJdCSyDa31
 RYx7sj8CFb8CvYrpmyfUKm/4FyChHJbZT6rGHjrjdWLS4lByVQuFRe5qgMu+L4YUiNPinIF0jHG
 uR0Qt0GTfpuqWGAlUphLzECmqSkmcNiHTdvTjl/bagf511gsun807gaUdTiPkX2Qi0QLBXtzm0s
 MbRRm6nhyYpx4Z9T+krf6YZCJ+HYzoAhSd5F9Sjb1aiHO6mMBRZV92MJKifK5IuVx2V6RO3al6t
 PyT9YzWBPIsUbqlJeTHzGX5XwO7mSWY0V8N79nOBW2JRLX0umQS49hw60VCLE+ZwVf7e3dhrntO
 xD78GdaE+8u/nq3y8+qdVv5IB6L5j7uL42zl4BwcsbNvDhrKHKHO8pbqTb9/5qPuoiPcKQMbmkp
 1ajakGhoYeJS03y4cqscANYeuIe+u4iqg1Hb+63avIEThud2jzWXJDFYOCBIdFGFGC0KPzyX/MF
 Jp8S1SHAtEmtPGaduVEk49nIOE90g7xU5CFCqJW8Gk9vruHvkC6Ud6bmefRWIkRBFotahuDmcig
 wexff+qphDI+r01NWUwZ2YhSigNZZ1jUwNfRnOrV9jvCMq31PI5zkX/S6xJCaydVuIaqkKBS3sZ
 MOsTOQZp0LuUTEA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a6744b2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VVKwIeE5ZUnF4mX-9KUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDExNSBTYWx0ZWRfX1wM3frSdv3AN
 HOxb2BXw5GAP6imCZwitxHh8V0S9FAlTmdpBMF82d6WVdjTZ9AVTJ/iR5x69Wpfl+dD9JtgIxO4
 wPs1UJd+/2Pgdy7eOC/JMGOan3B8a8k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDExNSBTYWx0ZWRfX8+SJrsBTJUVA
 DsHHUxCoFVIuZiGaOvGdDEfF29pfKm9kmzOtvTp4rxDyQioMiVclxvgw9V11Z3YJrCTyEoVqoYC
 bbRZ42GqCqg77MLL+SRaTXe3XbfcG0avkX0udZSEvfdQ3dDn21wSr8UK7FAbKIddsO+2d8oGIk5
 sF4kDRWaRKoisKNOeAUR6H71EUh5XeaBubVZ8NbyTvam2xZPG8UsQCMpfuh2EDoaWt4wZc8+H2y
 c/C9ama7Kycbwkgw4/mmOwFfKEbuYVHB3Hkq+QSozTJEz2sg9kSWrUJrvUpvIs4J3DT2z+kej/K
 I13PkP4GqEhr8EEHlQa7jpmVY0JPfTkDl/DH4jNstA9ZDO82AxHNyk/50uHxJRbQqAY6lT1cz1n
 kMTb2RaAEN5joZoldPX3LpvrM37RoUUDvJ0HoQBVzPQuq6zTEVttTiQwW5ZkGXSa4oUwZZFtNXQ
 z88u5fWvyB0Gwdh3E4g==
X-Proofpoint-GUID: CYcBkpsoB1cnMUiH-wHYQs9me-riecpp
X-Proofpoint-ORIG-GUID: CYcBkpsoB1cnMUiH-wHYQs9me-riecpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270115

Merging
=======
1. First irqchip patches via irqchip.
2. defconfig next cycle via Qualcomm SoC tree.

We should not be really asking whether to enable internal SoC drivers.
This is an obvious choice.

And if it does not seem obvious, then consider [1].

[1] https://lore.kernel.org/all/CAHk-%3Dwhigg3hvOy7c1j1MXFy6o6CHp0g4Tc3Y-MAk%2BXDssHU0A@mail.gmail.com/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      irqchip/qcom: Enable compile testing for QCOM_PDC and QCOM_MPM
      irqchip/qcom: Add defaults for desired arm64 drivers
      arm64: defconfig: Drop redundant Qualcomm irqchip entries

 arch/arm64/configs/defconfig | 2 --
 drivers/irqchip/Kconfig      | 6 ++++--
 2 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260727-irqchip-qcom-defaults-e4ad255d0553

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


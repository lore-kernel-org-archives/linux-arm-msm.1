Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57DB4D9916
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 13:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786070; cv=none; b=Esav1hxBX9/hm54oWV6EDeQg0+L5F+dYH/lJ62RIun5AapGlEYh3D6IIGn8AQ/ePY7IGStBoqte11a8f8o7KFdno4R/XEcYLq/w5kBOYDZeU7yDYpMvTZBbl/lyeeS9bff996RMLH651Ov4UP+V5F4NjLXtUiRdJ5bkhkQhDFRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786070; c=relaxed/simple;
	bh=ZRj0b4CjBJiY+zbzfjhuo2OcOIwPPNsvrYbekJ6R8r0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BvpLnTGVLI8NX/jm+kdU1jmYyqp3aJnNUKfXMNwnPbAv9yw67kqDOksbrpUbbVK/dsosDtWQzCVYDbcgyNywMG65ntZ9Lmh+pNAvF700cBCTZwRK0CS0w99yOXRMbB2puSpLG5/NgrwT4ehQp5u1TiOfiO5uu6+4EjlOCsdjMP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqtCptda; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRFcCa9c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqtCptda";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRFcCa9c"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An9OR004092
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 13:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGtKVbi4qmH7perY7eTj05kWZ+nIVJ906qYqVXk+WkM=; b=eqtCptdaQTArUrq9
	g+YYDgNZL8xz6P55yHV8P9TugFEVvLfjnZG9WaD6pz0SXa00xXJCmf8P0NXmzKNk
	dKjozeCc0EhLW5lDT0zS9PjwLCUqS+9IAjE19ql9DRDLZpT/DVG4R33Uca5oXe/v
	vhrEtKJJEaU9Xm4nHHWqA8sACbErCenB3DlCSEQI2xTjYckmk2cRqcO7XJPMlLGy
	fz+hrqdyj07xAlTCggL2WFxaaQyZS1zMWPRP+LHDFm3yL58lbPUmrPhik0Xc2/HI
	eH+S6YQrfyuGFFiqmeeG30zXFDXpqv1obIKD4VhZlPHHDUPFc3CMbduRO9RlbGme
	96lIbw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg13aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:00:44 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso2571994241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786044; x=1789390844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGtKVbi4qmH7perY7eTj05kWZ+nIVJ906qYqVXk+WkM=;
        b=fRFcCa9cFX6yO6uU2FmHzh9cICU9w8OukChyqv1w7PEw6BiR7rv3S3s1ypTuTkbpVh
         bJyQXj8n2ELCfVBd8oBP5ptSvRTg6IQvWgnhVoAQ5sQ1iatbXHPQ6rn3hd2nVbG416ik
         CJqC9W4XkOma1I/303G8QuN60hWiOn6k/7Xz7D8wphIsWNkd1a63VzoTpZcWzdiofMBI
         PSvXBB5skQzqelGWiMlsarn31WQzgUpAu7QNyEvhwBvClkQtNHlyhmDbZ6dGz+m2URpj
         wSRTz7eqj0XAdd+8ODGYj2s/0Rc+LBv8BjWq2+k8zV6ccndzewqOr2vJbUTM2IxcesFA
         ISPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786044; x=1789390844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGtKVbi4qmH7perY7eTj05kWZ+nIVJ906qYqVXk+WkM=;
        b=ZFuizScK8+HS/NmSfEhXxWArsPwDFF47ihMprwbA7zVJu/j2L6zdSMa26aw/EBobs/
         kq35WClF03tHWrZ4+xGCriVhD0oLYaBtN0ywetqLaAPF1+W8do7O7TvI8e3IpGi55WVN
         WfBx1NLdsyVuJB2h7usl5Qe1AEOMQLSnhPQ9KPJKSwvyGN4NETs+O6uOcotIRpixs5vM
         20VCIbh4jMNCaWIrmYy4dY97mP6PoM6h46YWunjBTAMXlUMgbcz5xINxN/gZcvyPiTzb
         hw9SBNPcCxLSIZczLVYw8x+m9eDQwDoauoRfMEs1cAz+pbcAX316Ia+DyFzMzfCv8wPg
         V7RQ==
X-Gm-Message-State: AFuF++mm9rK5SNM2Gq4jUV36HmiyTu2aVR7xbClh97jGqdtVpa/R2Bjh
	9qaJTjXQYJ1g6Nz4eJkPPB6KWKMrEwrn4uddd+TUfCUSGekKSMOa3d8YQtIft/trrz9eN94Ya9T
	MRqz9K96ziq4DXrdzAw7AWxO9gasXPDnSGTN/VGG5QHxuQqvdEr9R5OIVItHb0RnTRteD
X-Gm-Gg: AYBFou31iBLaBkzdft3Ir+bvzTW9EPQs2rClr4eKwJJg4EYrIP9aBMMrrzjklPTrw00
	pQwKc09VnRaVZ2GQNlTlv4DX+M1aHTZ+CPEAS73ntG0fk+16wYiPkPdYekdhMrc2bows5XRyWmg
	TeYkuDNWj4WzelCEe7cSLWYuGZry2yZngC3qQgR1lQf2bQ+tFJ7HhvSYtOy0PQwq3vMaRwNEVFp
	mGtuyzICLI/mqFpTxoRrTI+ieBu5zzaQyNoxoPzF3thh0jIkSO2xegIv8k3kiUH/H0cMpQ5r2ym
	EAHadHFsGAJxb042Pmi9pwSoU/bceMPIIwX6s0FU8fCcyrLuafrUrF7jrdDNmflm4iYcy11b9x/
	Enmm2vEKzClpcZ/bJI6dP+F4=
X-Received: by 2002:a05:6102:6b03:b0:77b:ae7:1bba with SMTP id ada2fe7eead31-78a4a72eac3mr10147543137.3.1788786044395;
        Mon, 07 Sep 2026 06:00:44 -0700 (PDT)
X-Received: by 2002:a05:6102:6b03:b0:77b:ae7:1bba with SMTP id ada2fe7eead31-78a4a72eac3mr10147506137.3.1788786043927;
        Mon, 07 Sep 2026 06:00:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff81c9b5sm198751205e9.4.2026.09.07.06.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:00:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:00:19 +0200
Subject: [PATCH v2 5/7] drm/msm: Properly handle msm_ioremap() without name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-5-b097cf1eac77@oss.qualcomm.com>
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
In-Reply-To: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZRj0b4CjBJiY+zbzfjhuo2OcOIwPPNsvrYbekJ6R8r0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqnrVnrY6Un3qGaV6R6PpT9owSV1PPsQRqJT1Ex
 C2z7Fs67BuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap61ZwAKCRDBN2bmhouD
 1205D/9oWdKMeZv4Gh96mdTXW/owcShNTFOLsw4lBV1YwwAj4kNcymfEgy2EQ+YIaU+Aovimm/E
 t4YfGU//Ef5YuFn99vyC63ba36uJ0Ym1iC4htCpHQ23dv5s8qJBhobHPRFoetDR2MphnyIBAhWs
 9ODbrE+woaW8W7gqhAxhiNmMZtS+TEUMdX5BJTEQ7th10nq5BcPx2tEbjgIegl9fwXvprv70WkB
 r7cZVQqUfC75A+Fq9G5vJii9nlLWZoTkrbQp3OSiSO5G5d03a2AY0VMB4WhU2z1Xjp52GpPl9YG
 SNiBoFtffa4SJ/jrl/xsPV3uO+TNt+Du70F2GTu9Vfkn+mC5dz4GgUcn5X3oqJ9BMCZNmaeUFrN
 VAgPMpfPMWJTYjw0VxGK1/kV2rZ4iMZrmD3nvaAKi50JIZbqEjjvKM7ZURTehO8apsMIK1Uypd3
 SNN8Pw9o0a5oDhA82eGLQM01Gb+IdJoegdBCmJGm8jnOWvIDLJmE/I7f0H38IdDlnOQKkVPtIEL
 0bVuLgxfq9rfD6FM/a0vrICd2Bcs2ReYsXeNUoAhKiAPz08WhnDxkdOKA0u7jfwL8HRj7+TPEKD
 nzZ8sUPIS/ewcSwFtvdxnbplBnnOneM/1WlezQfRxHzprfKcMjrCVLMAX+uzCgxIF7YAKxphMg3
 Pm5R9KUrUBX2DyA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX9WK2Lzd95RhK
 RXVq9uHPolB5rGk25Yzp4X11ljybCU9U+LxsaTesn2mDJUWM2npup5BxSMJfh92O3VabCZrls90
 WSRcOGxoV7egSAtLV72EDFg+jowLXZWMeswuHHyFuMMmwMuEiXzOMIGhljsZo3J4G9OC3Um2ZaO
 J2U/lIuTImxA+2lwrikNaz1jsyHwsxtwOjiGHrQGZiv2/3vOE2H4LonEmll2cc4Rx2tPrVgut2h
 S7qH3dH4rqk/NoTc8aRu1LyDodGN2QqCxbXITGqBhjTJwTZiNVgXuv6gw95P/5IWqR10xILRpPr
 YE67v2GdWVyDHlyrp/juN9sjor/8nqD4FuNXXuS2eozcEbdYYMIR99TYRprjR6yNte5IW4HVKJX
 LKUjlRmn8EpZF7sN/XW1Y2gH2ZqCK0RNkYeNQHdDfc4ryPPKyaVTfe0X1+PZKiSm3ZBmcFY6mRI
 yObI4V17lsofkWTLWLg==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9eb57d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=or9nyMeYumr6D7LEzWYA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: TXScArrQbSLPXdKGgUjEi5slNlRZohKH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX3yOHLQ1bNBut
 pP75+xpvoIDD5wl1kuXXQD0/BKEaQbM5O5XsJYipVz1Ha8XNPZAuiIYGoTUVBOulH1QdDxnIC8U
 ztEUq58/ahUfGWzJxSXK7TuHj05/0hw=
X-Proofpoint-GUID: TXScArrQbSLPXdKGgUjEi5slNlRZohKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070143

msm_ioremap() accepts being called without name of the region to map and
in such case maps by index 0.  However error paths still use the name in
error message.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_io_utils.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index a6efe1eac271..0a4ac0fc5fb5 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -77,7 +77,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 
 	if (!res) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n",
+				      (name ? name : "#0"));
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -86,7 +87,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 	ptr = devm_ioremap(&pdev->dev, res->start, size);
 	if (!ptr) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n",
+				      (name ?: "#0"));
 		return ERR_PTR(-ENOMEM);
 	}
 

-- 
2.53.0


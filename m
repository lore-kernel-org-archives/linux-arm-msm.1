Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DE0346FA0
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 20:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110939; cv=none; b=OLHyGoUk1zzCuv+dD/pB9lX3Pisq2V6Xk791szla6BnAeLwDAxSbXBWqlefD6nf6RVzGD5qbLJXQmR+pM3enKgicr/kF5FFVGLKxL9AaKVGn4Z0xk0R3HSBPHr2GGgFRT9104OB0IEVDG2E09YV+BEwPZpzFTQlDv3JORb0JeqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110939; c=relaxed/simple;
	bh=49NOvaGVwlvi581GKoxSpuUe/4IKdws2QDL7UFNjgdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V80DGo6L05aK+RMilpHePjiszcbsBXuvUO9gYd30jwe/N5XSEXckxnJKSWLV9VUBOKMwFnffWSKRoNVpDOIqKKtgxIQhqCpj8PJ3ehJwUae2YIZtJ+BCNXJre7tbsWnqOrtf9KpY0g5JEy4C+mhpnuo97rbBG7uDvUnUbiUU/JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QK0bT6ac; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kt+H81Ok; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QK0bT6ac";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kt+H81Ok"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPuHl1031407
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 20:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=; b=QK0bT6acctMmVRcC
	2/da5Pd4TXGhQi4kOuWThCPpHrSeU90ccV7oPPbEG/ts6Xwajo54zSQS7shMXiVf
	z90g5tuSbTLKlK0r+3Bpt+Woe9V5rm0OQMqW1zbBFCpaTITAsTBeFZKUTBRXc3gp
	Aw1lsRCA1j+A0wJ2aPqhSjkvjzJMR15gBUCHJhR+RE+axWX3+lmfVbNZqPEIqOgp
	H+Tns85ndROt4nEsfLIYKbPGq5wDmrxdCygCHlpmYqMJLkN11fX2/PAiTyptGVyH
	jjLA5cauqLhul+JvsmQQ9I/SwdbX4KhLdw+fMl+mkNOZ1lGTxKMb0xKH3N9PiM7R
	5p2wPQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5bw2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 20:35:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381e93bfcacso774669a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110935; x=1783715735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=;
        b=Kt+H81OkCcThB5CkFrirLlhoZQ2iyHcP6zFsE79in1QnpiCNY7N+K5naTXVETLra+0
         q2jdoQihjtVYynrHAswy6xufXU+e4ke+fMRiEJDSw4jRSyNl9RTf1DF6JuBTZjFldy9M
         TS/5COysK7eYDwAJHFhHcNiogYph0BMNRa6hJAREAapl5fizjj8/SIHL1K0V/mIqch9O
         T/4bkhxfspP64KIcAKdPXK7cetEkhiMuDfX3qElBE8waPwtfLADtwYaUNOtfajOdvj95
         wZzKWUvdalXokfYRmoIRLXrh0/MrNd3mFPQPH6BvGBV6ZtG7Sa0VTJNxOl00MKvNldwL
         ryJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110935; x=1783715735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=;
        b=aPHlIbNqer0vh9XJvZQMFfAufdT234tI9qGBLQ+wGxSCCIGr9tsRzNfS3TEK0y7NOy
         lDSe1MMFqykseENmEEyDMa+9nyTAYwwK8zy5buwuNxyx6MSoPd8jxGiaEPHX+74kCXBG
         nWGfxcaM4rSEQCuomReQiF62Qh/PPQvPg5Ll0TgeHqjl9IQ8JaZTs4/31nVpcH8f4E5c
         lYLVtwshZ7u/QHSYp40FpTQKUTBDmiXWqLVE7osfJN0BKvOEBoVGb4jdbEUZ0o+gjBo0
         /xM28jxByc+BeAcim2+OxXDzd3NtmKsCoKNhUoRmKHzgXsf+XNgHcXk9l4JC7uogGiDw
         ao3g==
X-Forwarded-Encrypted: i=1; AHgh+RoGRuKHaVcPtUCL9nY6vqqSdu1fIlyXup+0HvoXy/eC5a0rzhhC+sLrciDZB11fNaV4xmQxMvV8jWLvTeDX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2xyKcCt7KSFD2lVOnHxwo9BzL44+t9/pjV6XNVgWamlUFTHRE
	ugjyaeTO5ZhB4KnVxeRrbKtz9Rw64zfkx/7cqqqeJHxeSHkHn0H7hVRdPhiHhpoRpFN2bzDSGQd
	Cwc2aaJClKv26DGo6M/hXHxnvFmBUYzgRyBRJ2PW1E4jtwkyIkaByVAFvOhd3yav+zmkS
X-Gm-Gg: AfdE7cnXAX+p9h/jiBGVOEvJgidMACV6B3pe6cF4mrzYmMeK4x0AbGH52AOr0DFonrW
	Le2B37RUH0Flt9K6jN77jUE7a0fJiOpMpbdIvRj1DrhbDPG2kO+zy7QrJk6IkEc0wqhW4spctvt
	JoNTsZuy6KGu+9T+JsG9W8lPOI+w8EYy3AQ9SULK4CPqBxiwSxdlanQ7cveD6yw8mK9Pd8uRsL8
	oL4ABQGs8FUzP6953TpiTxx1cKE7BuKKE12itBvrTWTNPoXXPCLa4DOLvSY+CK4QbrgUJQDn8fB
	wZN4hdKtGSqeG4N9SudMKJc61N2bOpnFZ6jg4IR8u+GAM1on6WOrXEO+0SdtDrAdPibQi/sZTVP
	jtD7K3bhJskWh4V3lSNNsdw9ujSkZGrw0Jx0=
X-Received: by 2002:a17:90b:3c0f:b0:381:939e:adf0 with SMTP id 98e67ed59e1d1-3829fbd7827mr851936a91.31.1783110935542;
        Fri, 03 Jul 2026 13:35:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0f:b0:381:939e:adf0 with SMTP id 98e67ed59e1d1-3829fbd7827mr851893a91.31.1783110935077;
        Fri, 03 Jul 2026 13:35:35 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:35:34 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:28 +0530
Subject: [PATCH v4 2/9] drm/msm/adreno: Add support for A704 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-2-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=1210;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vmi+IpVwDwItd0JsdKwDI4X0C7GvFEMaBv3VFip4Ixg=;
 b=cN7pn2+JEuwNoT9wv704PT5FWDf0yxNfWzcSdWVP2z7Sjet4xiZVOgeM2KvXBFueaSmGt4kuy
 CcHPa+9lH75CVOuJgzKjvkpem+q3xyNaj1NqF1nIpvU+/j/iI6FWZIZ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX5iCYlsTfw8Fz
 C2mJ/zcta1nPlC+1RmVnTBmnF2O+iUjByZT9GDuhEvPIi2r3Dkp+xJ1kSmZV/GbjdaSZthldqz1
 trBABX/Yurhal7lyQ+F50dC6qwqbNDI=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a481d18 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XFVbiEAxaSnpWCc0n_YA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: _j9IfmJU_toiuqWxN0Ze6Xl50HCP-hwv
X-Proofpoint-GUID: _j9IfmJU_toiuqWxN0Ze6Xl50HCP-hwv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX1eqIvV5RvG1v
 DUocOK0rPXe31aGR47bZpXfZTz3/QQ4YEBMxgeTADg0I4wc3Rv9o3KoAlEW3Cb/TRHfBkADqc7j
 gFuCJElxi4BnmdK+/Zo7NvwAvut/B1cvgH6z/LAsnkRMxDTL8iaDFP5DgmLso4aJHNpjsaI+4te
 ojnsFuroA2MJTnpNaHnPVQmu/Pvk301nsfc3FPrMLmS0myiso6ixxkwmn570LoVEBJ9xcvTUoPl
 LWivMMHUdl/nulNWG35HKBalC6jVpx2VKylAEe14GFJ4GFhiKwWKTb2mlUTbgwTt2+/Hvdgv62k
 JqFmVLcAu+VxFd3mnScOvEVhmGJBduzu4OSkyT/lapC8CSt9iHFh4SGLycpZBBsV2BBgStjsQio
 6aG4Hbnr/TEOte9uKlPOkCJNZXsUF+6QmSm5nPuw9eUfacK/WXI5H1sH50UCGJ6Cc2fdVBM/9P1
 o8z2fBC1rraTvEaJ8Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030208

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Just add the new chipid to enable support for A704 GPU in Shikra.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..2de3ab010135 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1454,7 +1454,7 @@ DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
 
 static const struct adreno_info a7xx_gpus[] = {
 	{
-		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
+		.chip_ids = ADRENO_CHIP_IDS(0x07000200, 0x07000400),
 		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
 		.fw = {
 			[ADRENO_FW_SQE] = "a702_sqe.fw",

-- 
2.54.0


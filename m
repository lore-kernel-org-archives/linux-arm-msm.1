Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837877;
	b=vnucYCIGc+A9OL/V+EADtrJN4UCR7v40LUlaNGtKSiMM8+0afmq+rr1eSd4DuhQkwaAy
	 uLqb6MUb0jcHJokLgKP1s2ZENTv/xs2HIIEO9XTGVefgPA/CR94yYVHpcXWd50e1obyIm
	 ZMUfmrJJcuhaBH6Ru5cHBZGgAFXHTbAifjPk8GyrG6WfbzXeYrTQcmt7ZWXlwOqVkD+pw
	 uwZxe0cbVVBZ14FBjU3ZRaKFrSFY9ib+nRskA1PzSf0m/ZO3rfeyT3WyPYqUwXsxifvva
	 CWsZjf2o6OW+mmbIbj1IHiJBJd261sL+TGe3ka9eMoHzWL1n+x0hZqP0m9vthyf0txQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yVmbznb/9DErXq4djUHi/SV9iaCO3GJadLn0oXVswrI=;
	b=mTsH9KobeWRyMWD339O39sJn+mnzcpZHBIHKv29iq3bGrwcnxRTIfm0zNYM/t8vyOont
	 wqkuem9gTLBkP6vvY/C4CPjsVe8n0cGw8ANSua+LP7Fs3O4t6kzkKdtldDes7OB+wXqwm
	 ZyzHFeqBfkH/R4bfqfw6Vr/3kpJPPtHdNUoos1IPlIlzPd+MXTCndmlP+bZYCq4Zf4Kiu
	 vQ3WRrIGSAEqWafYhPvryxJZ2yaiJt0QkTIAu7PjtN5fIy2lu/6M9WEgZQ3Kj0UYV559j
	 G/wOUsIZ/h4+KxM3cP3xl/s1WXPvu5f+zmXOIndKwhoAiLlLRY3G2EEG3FGKvP0wLmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=POaySfmr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z/E/16Pk";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C957606A322
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C957606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=POaySfmr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z/E/16Pk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8oKIU611424
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVmbznb/9DErXq4djUHi/SV9iaCO3GJadLn0oXVswrI=; b=POaySfmr2zWvxh07
	3S0ZVpsfY7f8Y4FE06+L/2UfpZ+i8jSmmb49bIUm3JyBejnwgh2UXSHHzLITyyTN
	mgaa8TsVm77gV7XEcNCWJHYCsLqz3GQYjUteq7i4/aza/DgaIBbB3psihXKmKaEQ
	LxVJkp5Y4NXEBLlN27nfx6suryimr4Woma7c8NU6Mz3jkTa2LjDNEyECTTt022D6
	mQnUZgGS4wLJvtHJswPt4D0wV3P/xxNVwtRxr4QgDlaNyHNy5nfqy8Oq2j6lHmwn
	0b5ICZ0CbLmpjxpfCHbkEWwMBBijMoUM7QWCFYf0vCYzgClugx6+ahtaygWR4hIm
	rHU88A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnehgmty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:31:16 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-156b5338d4bso298694c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792837876; x=1793442676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yVmbznb/9DErXq4djUHi/SV9iaCO3GJadLn0oXVswrI=;
        b=Z/E/16PkQReVFYDWeDqmK2UNsaHor02sSc3WnIUhldzdb4dIjTAdY2uB1mOVro9alp
         R3zSZjSj13SMPkgJSmgoh+OjwIl0OAauQ6PlZ8lJd70GhlSouunfbI33CXQoiMeSaTIe
         CjX2g/XHJlCFWOH65CNYF0t4z8SuaEmjWJEIZfKf4jKAx00elPneI8iwrJ60CBiagY1i
         DO6y3hEmflAp4vIg6JCnwY5INADG4BGbMKsBoTMOIfECMuZj0TdObJia4nGRMX4ZbpSI
         VRJhlDy1cO4xMUnEGCfMyQTJ5V+Tx9jzQEL5YZbTkuyCO56ly/6WlG+Y3ksMqX4ubr9u
         DyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837876; x=1793442676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVmbznb/9DErXq4djUHi/SV9iaCO3GJadLn0oXVswrI=;
        b=kjWF3uBLh6j693aZ0hEHlEqfPCEewn/0WmnKS53pRjpi4x8PwimD4qtU1VtSqE+xjh
         PB88yU0hanmGHIxnBFTzbGaVUL+aGPmK8bRkN21ibYa1+V/+AHZvztyiwRFpRRXXrfuu
         UQp6Pt1pLB11F+gB9AXEeu3WpC60rQppZ4PUMvjLUBUJuy0mTq8pmmx8Qs+Y3pOy1+XR
         HJW8Vx7HMpsx55qyFhmLTqxREql2ae5F9fyBje51W7nvkg9aRnJUd646EktJOaaX3w+W
         /FlSt4AMfRRrY5bqDt1oPExIce/PfT6hKnQaGRy1ePFbXhAuefHtI/lUje7kISWAiIwn
         PiwQ==
X-Gm-Message-State: AFq9FYIG2tsJkSAeZ+MMbsHWLZPCUPin2Y7kxzpKJXybnu/wbBJeCSiL
	vnIy1jaBFN8WrYAPgWmKz17mdm87DlCR8BDx00haQPAOtjqw1Se5Ya8kQbjwRmOwlg26G64Fj4U
	XrVFoCM/jSMqx5BhxgRVjWOZSry1wUji98i6+vqFAYJtcouLjXnu1oNbrjHlixqCmnI7H
X-Gm-Gg: AYBFou2kaplwrmFts3X/LqVv7oL6BzUQGotdR9XcIeUEuIe3Qmf/DCPc4AwgGbLPjQy
	QRgObxhk7VoyfjTTJRsFomNAtL4L1Z/0ym4qbVIekaRCmVhbGhKrjAC0obzgOLCLW87pBn1eLKy
	U93DDdxx+pf8QcIG/13RAcNo4YM0FTuEdv8b7IUX400UGGZ9SN1iTGyADwKkqsOhBIuaRXC3bpS
	h8BK2quItGax1OKD2EymeDBAwY2m9Q8jvmVXoke/nZWwhRN8NbnyE4+8aaWUyiyNYq6xPKX3vUt
	CfXTMicKPoyQAopBLRqL5/IsJFT5xyfHz2ChHwWe2TEo+UZaS9/UzM5D8/h9QLBSiMFpqtyflbh
	FRxINBxmMab8C0z1OVePX5pc=
X-Received: by 2002:a05:701b:2311:b0:16a:8ffd:4977 with SMTP id a92af1059eb24-199363a356emr2026588c88.17.1792837875835;
        Sat, 24 Oct 2026 03:31:15 -0700 (PDT)
X-Received: by 2002:a05:701b:2311:b0:16a:8ffd:4977 with SMTP id a92af1059eb24-199363a356emr2026570c88.17.1792837875267;
        Sat, 24 Oct 2026 03:31:15 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm6009441c88.1.2026.10.24.03.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:31:14 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 16:00:14 +0530
Subject: [PATCH 8/8] drm/msm/a8xx: Add AQE firmware to Adreno X2-90 GPU
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-assorted-fixes-oct-v1-8-2977f974ddb7@oss.qualcomm.com>
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792837816; l=758;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=6jmsPstXRSfknq1XodxmYZvUhspzwwQE2hSVoneLg8I=;
 b=Hx/1/hc3l+NGbzYOE4B5IZ8a9HEQEd14sU4mikm18b12ltSKrCeyQdGfZiLcmnEkmV9KRmVWZ
 2nhiRi5Ya70DDbbG84Qw3t7aDbYMJye+XM6j65PhrewxK1J542MF3J8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfX7BTMlkezIkNT
 8zjmN1448RcR+xwAr2TGQb6FuJbW/PnfjUV8OcXtkp756YbMU6T/X+i6yjGAj1uigARYISGkR6I
 jT8YM//w4Om8bJ5jvachxKalmI6ddlI=
X-Proofpoint-ORIG-GUID: mbRg7t4Fm1qJbmHp_pwH5kO0F4Ynwv3b
X-Authority-Analysis: v=2.4 cv=d5tgWhjE c=1 sm=1 tr=0 ts=6adc88f4 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Kvm9o7dbxh_Zzo95XxIA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfXwoyD8q1sNjGN
 BMusyv2iyqKJZMzqLFYsx2VoadYc1zlVaXga1ZICeFJTjGb5hr+PcHh8q6Z5qhsNN5SZkD3mG3L
 ZAg7mApefU6E1NRdZnIJol+TsVDoz94ujJLGslobdmWa3C2G0k+I3PJcXndfTh/nChl4b2xtq0+
 IoD9Q8y6a6627CIu3WkXQpdBNHqN4QKN1eAoa3hWEf8qymCJ1ssA8l/llGqgJXttKNclqnoj5KX
 j6YZRnUxr5H33DDAxXi0Pnl3Ih6TZw8YLpCBgKubUvbZqmE21n3uC0goI0cOCRdTRDwbBG82Bul
 Vmaa542YTg23cYl2tD34KNy5ThMu3IbmkFNJzWOXTwZly22ee9u/tLaHOilkSRnuB10Xk7Ll/6l
 CPXhmJ+teCRiiLp/ozpdBwNpXinnpVp9HlFwQBOimeoR3QOwRhAwpF7NeoaT2iQEXtknrsTzPwO
 pbb5TQp9Yup4MVV1l9g==
X-Proofpoint-GUID: mbRg7t4Fm1qJbmHp_pwH5kO0F4Ynwv3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240041

Update the catalog to add AQE firmware to the Adreno X2-90 GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 55a805ab438c..775aca1964ee 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -1582,6 +1582,7 @@ static const struct adreno_info a8xx_gpus[] = {
 		.fw = {
 			[ADRENO_FW_SQE] = "gen80100_sqe.fw",
 			[ADRENO_FW_GMU] = "gen80100_gmu.bin",
+			[ADRENO_FW_AQE] = "gen80100_aqe.fw",
 		},
 		.gmem = 21 * SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,

-- 
2.55.0


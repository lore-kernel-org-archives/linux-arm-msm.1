Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837871;
	b=ibAtm7vtXf6QOPAjF48X+eojhScHKGCzUalIq/ShnemUvRt1D35PiD1zADrzi956oMlh
	 M+UyDVAFT/P5QjeLbOGjpKYZSImyrqt8oZRXvYSzaIt8/5PLJDPAM/7CkF4REmCRQNqMm
	 F+gcnbeX7KFV01vvyvBfbjXWV26CrTBQuEQaPa+ea9HEL2oYwl99C/SY5T2rRinp7RFyY
	 p8qDOXhI5Y384FKVckLvENNUEHNVfClky9SSAIGlcM5bEGvuUlU2pqMRmgQl4/WmudtZp
	 XpR3+D+XHQMjGfrOPExmMxAQk3CTySMeUbOMTNs2aktgY0QWtTiFN7/l1ZaareOz6yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ecgpGIqf6FUlCAfUyGUDHXzcM3+nvbVKBJYxSLRhqgI=;
	b=PQMfZAnjH1DexLaTzdMEWrsCo0z16rE7uwIpP+JZ9yqnt9zcy8YOUMgoQKh1vSJDmYO0
	 ls5VtujdOEQ3QT3a1FU4ld/gH6sHvuzX55TUlQ3ySuj8s/5ff+x2zcQ6NDASyHHR1aX88
	 yas3OGXCfgD1stHYyWLRwln9gavzT6quUK32ENrWJWtsmzSbieDIfVxNz+uHFhzUYwTce
	 rtRRVV3GSGDPpygwZzzUnAT5xPuVFJ5N+wge4GNi6WRfA1/Gy4ul52ESvw2sqfCGX9Tu8
	 x1T65B/gC1g2y7XAm/v2GGhj8B8Hb3m5ZhHj6+aAeWqAfWR01q0MwID+ismWVATwqxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jK3gg1sf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ghfaBNqP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A60C606A322
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A60C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jK3gg1sf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ghfaBNqP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8o2PH2217146
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ecgpGIqf6FUlCAfUyGUDHXzcM3+nvbVKBJYxSLRhqgI=; b=jK3gg1sf09lSDDAD
	QOiyM+RCjrZF/qXHPMpk+XgYPvB4+MHz6Bd8qKbfqyjA3ltEcVkQloIrY1n/hgPP
	iQfrGD0O0wZXmcIX9+UaMjVyxJpqtC4B32j7HOkm47TFgvl/1o7u+Q8efC7EFK7R
	4z5oXZKyBI3cpxc8Sspfp2hUp/doDtjsvMRuXbyRgQbEKYYJjPwz51kwqlPllf66
	ZP6E9+VubLZiWp42sz5R965tpL3EaSZR2Y5LyxwDF87J2IcWquFA32kmHgwnMZHu
	5mS7VQt5SD/6GvS6OL3VQoTPbkG4Ry5ZDtFTZ0FLovGmCK/gaNwKGP7XMFfTlS0B
	AZCgVw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgs1qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:31:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35cbea41088so2387181eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792837870; x=1793442670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ecgpGIqf6FUlCAfUyGUDHXzcM3+nvbVKBJYxSLRhqgI=;
        b=ghfaBNqPT0Qi6+RUMf3BHNh1q9ziaeBrYU6BucLSlWgJ2Acn1lP39Wb7qQqAQCbtaq
         TtKEGW+K3CCQPcnd0ffHnqFTB+25Jgz/75uujaDN2hW0wnEJ9yWwXsmu8U4sbnZiyITx
         u6uQjpH6MUNQB8P7wcvmm68GB5NBv9nrXu7QXbRqwjbgtcAmj2lZYaiTARBDIM0px+2p
         MbqmJqsO71doBfqGCdZ6iaKtqQnpQ8caQd+OXKdJ74OzZmqPfaFYYtlaorAWmwu/MCE6
         HBofePDGv5zW+2cDkW/x6nKj5IP2vjljhv0qQUrIICG1Ans0+Fqfx9M3d6uRp9KS84x+
         viNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837870; x=1793442670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ecgpGIqf6FUlCAfUyGUDHXzcM3+nvbVKBJYxSLRhqgI=;
        b=ve2xmu4pEzhVEtmu/HCTYca81DQJOMsLxPjE6m5M4IJOAWsR9nRPrTEDpPICFH4hVX
         0msSxDqNnnRxpAGEam6WEQ4iB1g6DmNq06qgIAbNu6Hg9GP7P/f1FmttpB13ssuqOx/F
         A4MSztZUZKh7VFWTukGTKwHBrmkfFEvUlKuzSbyovMvxiYbPvIabU8I85/QtJs+cxbBl
         /UAmwOi9Xt80pklw19j4Ptt7h79ZNTYi2LRBJ4/cbRa/LJg7RpszYVSGI0U6XbBVBuA/
         Z361QHVvapHKiYUGPPW6BM/sCgUItF9tSDQfgqJx2rnnoH2lCU8IR6OlSUla30QelJvQ
         piwg==
X-Gm-Message-State: AFq9FYKXqbZ9390K6vLCG7jDP3vCbjHN/G8WUvwlzcAyUf69lo8fIgK8
	wIMB97kCNefLY1pvq0W/CjDOEAp9O+gO+TM9Q0FRJg2/VJSuQ0OLcWYdhuRIdEvflbYH0LxVJwd
	Tgaq2iTLm80ScO0AF/O7K287QUb+gyNb9qSrZAKf0VL/BtrVJE/QBbmNyAXR8G5Ab15fg
X-Gm-Gg: AYBFou3S5Z2Vzz4qA/uO9vrv507/fVOhWfqXF84hKX5mCOIT3RK+u+fEXEPQwvw9zkm
	sPGSB6n6IHPvSOHksRvER16ghtcq7zaS8uZ1lpx9jhxiyTPZXlizoWd70gccxGXDdZYnMtLE2aQ
	LA7VzZOfnPm5o7/KUIvQzaBg/Rw6sg2zYU2vTn+aqGQETWJE2LPTqbbDfFZzvvR5V1MKEzYwNim
	xCiTuWSvvlQ0OB0u3AsK4ROUG7qwb1aNbwaBi2qdIU+DphU1SHiLNJ3RQbBAFzfnMuUmxGlXUm/
	OhqHLQAzvdVVqpJXodgbDip1CWggvWVb6sH3g08SOdrXazcyZTWTXw/ioK5D06p7C/q3CFTYODf
	cnqxnx0SnCT7LpLvAX0NBfQo=
X-Received: by 2002:a05:7022:e803:b0:16e:4723:5f86 with SMTP id a92af1059eb24-19936a60764mr2616162c88.29.1792837870064;
        Sat, 24 Oct 2026 03:31:10 -0700 (PDT)
X-Received: by 2002:a05:7022:e803:b0:16e:4723:5f86 with SMTP id a92af1059eb24-19936a60764mr2616102c88.29.1792837869307;
        Sat, 24 Oct 2026 03:31:09 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm6009441c88.1.2026.10.24.03.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:31:08 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 16:00:13 +0530
Subject: [PATCH 7/8] drm/msm/a6xx: Request CLX enable from secure world
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
Message-Id: <20261024-assorted-fixes-oct-v1-7-2977f974ddb7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792837816; l=1301;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=f62WUqPk8JPeePU+Bm0XkICywuM1HT6Ax9xW96mzE4s=;
 b=WscAtm2o3l9CuzM+yZyAhNMO4ROOr682SdqdY3B1OcYV8NsoR7qljmwjsKmFf4kVDrTUY7a01
 LA5ob8zUl7YBrSjAk9PR2k85RLWiddD/HL3Vmz1um9xkdx7xUQEMeTl
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfXxzOhhPjkZg0N
 83lCAFo6womJVibGZJPESQ8W1naMKOAs17/+x/rVXe0v7oBmmj45Tc4jnuJy+1LHXlhlkm/anMy
 Q1hb+Rlit8THjEiRGq1IveQXCZErPR0=
X-Proofpoint-GUID: Gb0n0ycsCgJgv6IywE-MAEcwG100eAe-
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6adc88ee cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=p4fv3_zKGVfQUpdSR-gA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfXxVZGe7/YHqRO
 7JjPJ4FiU7mlz8VhQNUvcKpmmr3u9bvRx42iEECti10g2cMg8JgRe7ExBiJ9bzHMzkdlMkiVDLc
 Pj+FpxGgZaZRV1t0SiVvtemE4vqhtWc2qVpIl3csuGj+rkeDTgHOF12hMckcWsnht0y6J7JTJVe
 v9a14bcOt+1K1S5kRCuVSWXonyJMQZl4ccYvM91QxcjC3O89bLFrf6XfEGCTitRSFGUDqiOlU7A
 ejQxcXMtww+qxIJCMYDbrfmABL4B05y8OJHFE+Yc9z60xHVZvMKbIu5wQ5UAJrvWM0Q7vVd+0cC
 APNGjstePXwYsVVCvIPapaoaWYP9ZnNr2mJP5NMPRZMVpEVtP2rZxiAnZA9vq6Fo1JvTHkcVfXq
 icdsySdfbCVxpvIjQzv1pMtAQ9iRKpRI3Pd6EtHuZGPeR7PLH8xkMOfEZhRiADSdJQGEhrBRPGK
 6TiiRt/JaisqbJ0QlIA==
X-Proofpoint-ORIG-GUID: Gb0n0ycsCgJgv6IywE-MAEcwG100eAe-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240041

The CLX (Current Limit Extension) feature also requires the secure
world to enable it via the GPU init regs SCM call. Without the
QCOM_SCM_GPU_CLX_EN_REQ flag, the CLX tables sent to the GMU over HFI
are not effective.

Set QCOM_SCM_GPU_CLX_EN_REQ in the SCM request on GPUs that have a CLX
table in their catalog entry.

Fixes: 967e62fbeecc ("drm/msm/a6xx: Add HFI support for CLX feature")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 991db3c9cd96..a1561ca41a5b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1247,8 +1247,12 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
 			goto done;
 		}
 
-		ret = qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ |
-					     QCOM_SCM_GPU_TSENSE_EN_REQ);
+		u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ | QCOM_SCM_GPU_TSENSE_EN_REQ;
+
+		if (adreno_gpu->info->a6xx->clx_tbl)
+			gpu_req |= QCOM_SCM_GPU_CLX_EN_REQ;
+
+		ret = qcom_scm_gpu_init_regs(gpu_req);
 		if (ret) {
 			dev_warn_once(gpu->dev->dev,
 				"SCM call failed\n");

-- 
2.55.0


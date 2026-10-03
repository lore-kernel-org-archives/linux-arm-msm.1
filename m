Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1CE135A53
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985788; cv=none; b=fCiISiObuR3yMecAC50WzYAHsQMi32qak8ZO0YTtVrDwohQkHX7eSMU5e6Gd98lvwOti7KeOYviMkqtYJN+sNPaf+HflbmlgEjzOvY5m24iUNx775vCQ+2WhmUaATdvdeJocnZ9hEWkitoysal05Qj0bC+Dq0v8w7wXFm963MmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985788; c=relaxed/simple;
	bh=CB7TT1T8j14Q4FhQymiBR2ZXNhb0URD++uaqz/WDp0U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U795p4Z4vEFlDtuGVi4UbakVEIyC5XQc5AARAgZ3NkeM5O6t1rUhD1pm7l8gAyEuuIkLTAXDNPDBHSCKDYUBZ6wHAIs7BzeVSwJfOMPZCi0WcMxROt0B2yiLuSeYmaB5tvav+IOLE+VnYDHLB9t6xDeG9xLzwlzUf6BpkXT5egs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jzlOieA2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3lVvBxC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jzlOieA2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3lVvBxC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeOhd2928444
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UYl7rUnBPLsCQuW2++FZMG
	zexo3/dnPWluINOMY+sz8=; b=jzlOieA2zbTJCghbHSHqpALY/DXtNpO/Tv0UWm
	i/n5akSbkGhzui+kh+7HeCN6tR7G0a/+MrT3Uh7VacbtuaWiDfjrsoHLkqEpsVr5
	jiSUjpjMTDz4HhZofvIavTeFKVHVHFRqsKjO9fCpb/zLj5ulpwBoAnwzke/cFYbF
	/UzK6lJmGvy6vfULzKGxZGiPF9EN++UXiHwoxCxYNJkEZ/UTqOEWSfLZur2L+cTS
	UvDKWAGxnCH+qWDz53u2IPhVjARApOk9Zj+quXaaaL6iAvKJFgcXhS2j3zn4yNNs
	JWZiuPSrsLMR3VFVClaiGe+ciaIubLOpINGaH2l+dAmOLp1A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nfvsyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:03:03 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988bbb0ed9aso58449241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790985783; x=1791590583; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UYl7rUnBPLsCQuW2++FZMGzexo3/dnPWluINOMY+sz8=;
        b=Z3lVvBxCT+64u84M2uyYxN03fz9acVJs7mUpJrquWqzj0E2cZcBv2cES8Pml6H4bnE
         45tdNQA0VkeQUXntplDsiQgxuXdIT+WQG6G+hs6NJHbF51Wuddg0UzM9qcJF4bCrx3qQ
         Lvg+aboNirKoJCjlLj9TURarNs0nJkuvbsr7qAsfUL0Qscs11MaXuxKECUILfgU3vEms
         Oyz5P8EN65AokAqInbKCd8+HD0CdEMrFGZMCp7K1j+1GTYQBdlNH0k8GELyOkSTSADp0
         xWPO9YG24bmInRWIynSTZ3tSPFE2HWbnKAB++30m5LQ/oCZjsdleNaaXyDELgyhXlcjO
         jD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790985783; x=1791590583;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UYl7rUnBPLsCQuW2++FZMGzexo3/dnPWluINOMY+sz8=;
        b=2OPPbyVv97ct6qIBfTSSwKptUgxSQFlthoRw5VWhnvZUMbEk0WgCfNzCGNntZlF9X6
         ZooIn3CJlq8BQSUvdabLsvYkh7SD1h5p6p1dQFDbSq5VMClhO1fvqbgS5wcqKO1tmkpB
         LBax9HjDAo9I13gu+gr1SdU29zY6wOHd2p0J3o6L5pxrsHrIveLal9xRHPFWQAKUDJvw
         ckz8vm9KzVRVJH/o1DdVoLpA24mRvFqNUwW8IXrYfmhFvRAc9nr7bxG0cqU+4AuS9x4R
         JTtFqiDW7iwvVxp5s/V4h9unLsRDwmUlNYK1VA4dc0awgivFmxhvEuls4osks6QhI5QA
         UM6A==
X-Gm-Message-State: AFq9FYJ/cf8ob7qLfSpqJmhplRcECOyz3hX5BF/521hm6hJikujRZ4U0
	VTTTFDNpeQJoqEpiI3E+lQ7Yibu53dWG5UpVt2VRD0SEsTaKm0+uKHVoQOHGAUB/6+NQuQhN5De
	3qugRB1LfCEBU6JwidNh+wXFCyqqrA1bTKxDhXYSz3FLH8C+zQykNt094zrfqNLB6IldIoF2Fff
	s3
X-Gm-Gg: AYBFou0r69Ze1+90QLhUTf7rlA4L4HTgIOB8ncRXab8MsKSHexhP8lStYEdX75YQt+G
	/rRdvRWcShKoICNfEngztAQqvxATV6hGlsUBD9XVrHyGwwzdbNRMzEMA+tI3ySXXIg3C2HiiAqA
	F7dTA5bTsqYIfOx/SGx8mPuZKPWBOQ/DIXQyZyBet8wU/mFprUm9BTf8TC45Nb45p/0TnUKl9fo
	OpfvoAJd2iQPocI+N4x4wCzkL5PezSArfP/Qd6vwgnrXLDM82UWqsmnAxXkJTS6zwIw60D90sia
	PxS+zg0t4vQ20zV4uaFTJ81PjCWJxxuP7nVe2y5VPQh5iu3yiQIb+VRhBWHD7UOBKRGdlA9WxoW
	g1PYt/JN4EFASAYix5PdqdoikMeNFW/g4h0nVdN/sACCojN2xbLlWxr5cLLk4lPJS8KEBwUNz8d
	mqEjRKW6gJUrfZ
X-Received: by 2002:a05:6102:418a:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7c0f1adeaabmr1313727137.1.1790985782676;
        Fri, 02 Oct 2026 17:03:02 -0700 (PDT)
X-Received: by 2002:a05:6102:418a:b0:7a7:ad9f:53e2 with SMTP id ada2fe7eead31-7c0f1adeaabmr1313709137.1.1790985782097;
        Fri, 02 Oct 2026 17:03:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f7b4esm14234531fa.14.2026.10.02.17.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:03:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/5] drm/msm/dpu: enable quad-pipe for DSC and dual-DSI
 case
Date: Sat, 03 Oct 2026 03:02:58 +0300
Message-Id: <20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADJGwGoC/yXMwQqDMBCE4VeRPbsQrdjSVyke0uxotwebJqYUJ
 O9ugsePYf6dIoIi0r3ZKeCnUT9rQdc25F52XcAqxdSbfuyMubD4xN9khb168Kx/CA9W3A3DdXa
 wVJ4+oA61+phOx/R8w201RTkfL9NQiXcAAAA=
X-Change-ID: 20261003-dpu-quad-pipe-fixed-4adc8e47fcea
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jun Nie <jun.nie@linaro.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1350;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CB7TT1T8j14Q4FhQymiBR2ZXNhb0URD++uaqz/WDp0U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEYzvoCt7nCZ6n0xqzTkFn31aUEGmgcqvVG2n
 VdWUhbxNniJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBGMwAKCRCLPIo+Aiko
 1VFJB/0UOoeV+HtNAiE80sGXuK5ZPP407S9pJEHtD2lKLDH4sJRzX9MCfy/+0XnNTDyomYPY3Yz
 2j2oxoaYoYMilCvr68ia8F0R/F+r6ai6zEaYhGTgElisQr10OahII9UjYNU5Al1M+13sP4wnZut
 8E7X9+qaS4lrSf8XfLY2bCd1fazX29IRP9E4MRrWCKdCWfkDICK5NuZ/tdyrf24xfxkw+N60vA3
 9jlYNS8HEGow1uIfZs1INsEyzfSMBYKdQdysAcXrwzEn1YSAeaqSFMIyNt3yGTjUzF9srBQgzfg
 93k+24hh5E6yEWY9kSVtlBVl7KnCoWEPN7w0+uVOR5Qi05ke
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: sVSXFqMfGC8tqsV3DSJXEOZ1_gcwo0q-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfXy4dE+r19OREi
 8X15dx1xyNPb8NNQgVtCdvi4JhE25LD21hpnLSoQVTYbKF0yzT6bRpFTD+UMsGc3cvoj6QJevXw
 0NxN8BTWxq4v1g/GRF7Mddzi4iw1czw=
X-Proofpoint-ORIG-GUID: sVSXFqMfGC8tqsV3DSJXEOZ1_gcwo0q-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfXw5l8jy78yKFZ
 6+VR2vdXn88i2uSk8z1YcHwg8CzxqF7nL1KuYsK6AeobEka+/oP8rR55g9iyurPapYxi2qAYuYf
 lZPuNjQOUrfNq9XuaSX98p+gH0++UkF9OIUti63E5HtyJCZMxGKQj/V7Dpb+Aj9XcCk5nm0nohn
 dmI6IiyJ4kTLqkyYCzfvCz+ymdzXIQMwHKhhHU2vs1KAatfWlJsqNCf9dBErZXQpMaryYpLdMxa
 cIy/pcpxL7wP7wEByFRYIVQqlvM4QZhpchQenNlSRl6KPVy07hGg8KJzzmP2r413yIT6lkHt1kO
 zA96h55n4TVL2v9NBlQ+2sj5Oh4tJAAVfOnBWq58x3ssmiyKIJs8vaptUYI5QRT3kKEcr/Z4eem
 R/P8+VrDjaaxPK6N9H23ykmb8GdSdeX2bmaYA3Hh38FgIP37tfAkcN1m5m7uh3is35HY8+ckHYz
 zYXfbl5Ye3D1x8UtPww==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6ac04637 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=0EwCbC_-MHmnvNcu6akA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020095

This feels bad, but I ended up picking Jun's last remaining patch and
reworking it until it stopped producing issues in my hardware lab. This
patchset is based on Jun's v21.

Jun thanks for your previous work.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      drm/msm/dpu: don't flush a legacy CTL after its interface has stopped
      drm/msm/dpu: don't count the cloned writeback as an interface
      drm/msm/dpu: assign the mixers to the CTLs per interface
      drm/msm/dpu: enable 3D merge when there are more mixers than interfaces

Jun Nie (1):
      drm/msm/dpu: enable quad-pipe for DSC and dual-DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 64 ++++++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 43 ++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h      |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  7 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
 7 files changed, 63 insertions(+), 63 deletions(-)
---
base-commit: 820493753c467135a7083379f0d547a942b56db3
change-id: 20261003-dpu-quad-pipe-fixed-4adc8e47fcea

Best regards,
--  
With best wishes
Dmitry


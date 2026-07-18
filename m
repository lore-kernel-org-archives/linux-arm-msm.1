Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C5E35979
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 14:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784384508; cv=pass; b=EgDwy4eEmqygz/MuySv4pnxJQmftRw9N8oqOhXBhcUi4rjxniKO3zzMowfsBA3dhaYZ2rGOk4fNNheHC4WB4eK2W+nFslyS3gQ7eWR1vglfR7YqBM+vYT3ZCyE68KaJ0/v8cK7cZoiIkMe68tFlW1Y5jXcqo4obgSoQCdDu8zHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784384508; c=relaxed/simple;
	bh=bosjcTn2pIH6tMnMHx2oYXNrYEuhyJIbSRTQoYGztok=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Lv6wIGRoLYUZWFbO+hsWSjDpz3kHqizdWSkQakx9b2WDwl1khD2Tfz+yAhsO0LovWB5CuGilW9j1FLBSkw0+23n+3LFgLlSwy9U42fAf1MNuD0lJ14KlatFrgGzmOqHsrlCSRjgMD2aFwWL/HQNIRRYKaTSeJMAiE1wbLy97G5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLb/8G2M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eRljqg1k; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLb/8G2M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eRljqg1k"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IDCuiW781152
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 14:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:reply-to
	:subject:to; s=qcppdkim1; bh=qJbihdpS5pMhZFxXprWpaELXaJzDUAQpSlA
	nQGYaGus=; b=NLb/8G2M6G1oy7nK3nwILVH9ch7NkWR7pTCOKcxyA/XCn1A152/
	/7pMQxc7elw5nOijGtNTXoFcyQKXhiNpa450nOFsZkajYU8EWwwaZ82+XjRDtJAM
	ciFDQbpmDNfigp1IydDYO3MzMYPQWGwJk3SRuJo1z1DfpExw5DRES3ZvCzt8JzFE
	dnghWC15WU0ZlmUq35CgXopkGHSN+PJicGCsWwE5GCI+crtZwNEAE+7bAMpxNjsv
	IPqkVDzB9xF3kAwhL1Vdsj1gMPoJnjpyRqXwgUWJp7UmrpX8nugrLrqXA1wNmXSn
	VwQ7kqyjkF0pA957b5HNmEbVMS3tO1FTcRg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2dc0wfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 14:21:45 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-43ccd5d5357so5224750fac.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 07:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784384505; cv=none;
        d=google.com; s=arc-20260327;
        b=WpKF7mFvhJEvHrXqhT3/hu0xIAiZMR0EIlM3IR3+8zACZh/hqu2JzCah3Aj3nPJ1aO
         6JebEH58FC7KE/yebC1vgdQm8YSOgxU2SOQu8ECMpgKI83uHSXSFGc82aLVAdNNyCh6K
         tq6mK+miAqPLsBkbzjGOERtyxR1QPlDlQljp+rD+HTeccvvhH6ZL3a3OfqJzBhLq+uFH
         kw7eR6PLiULwaAZKCehEMeIBENKDv5Gtr5WwJDEh6usm//8hMbLwc8qerrDg5HGHwXk5
         QskBp4Xd/59p5O9zofTtgu/lNlY9RzUD9xGLwfqLkpOhSIYGMk/5ztXqk12RA1fQ1DOI
         6cLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=qJbihdpS5pMhZFxXprWpaELXaJzDUAQpSlAnQGYaGus=;
        fh=mIHGzPWScBb+KnZvKGxLmI+7WZZSDy+tlmbw3tP781k=;
        b=eNof0I1whPJUuscD/pW21OnkPiuvfWerxj6fDN1Eygogeg3nH3dlThS2O8vV9QddaK
         xG2hfkPJxGr4oRWHGIknHcSJ8Zt9JTsliV0SjEdBZfYIJ1PZ44wDdk4Fa9a46IvMmtPu
         QWnMfvT8cYAtneSJ9pNm0GBFbjaCWSomBOAcb5N+rrbNm1rpKlwZ3YevxZYNrdm0ifQs
         23WRTB+0x3GnHamC9wADpTDVlBVs+Yp52axCNxvbLa1XPJpxDphGW0zEKJ9n/DvxyXD6
         pVt88oNoz9HFneu65MHi4o+3BQTvKdiGJu1K3+vtIWI9LE/Oj1ouQC1ArxQKfsFltNRW
         /qxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784384505; x=1784989305; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qJbihdpS5pMhZFxXprWpaELXaJzDUAQpSlAnQGYaGus=;
        b=eRljqg1kbfAyZNDhU78o6T/YpsBkYbIUefnNPqf57HanOsDaTiFVa1L+lYOJotJidO
         keUuUARNjlW4X7HN64ST8osC33iertXSpv2sP0/3WbZkhJ+0ICVp9ZtRoLwi7qcNfplM
         Nb75/W64wKkICLwH2SKmaF9C0aEEVroKHeXr6o57MJjPKHWjuolAGc9OpAtxaZf5CBDb
         DPeJHiRlh1kkH9vujzqeH6ATgtTPnqmlxuqOLRTZoAcdBqzh0Gx8qIt06VoUR3w9GKZH
         cW4wApr1F75J2K/5EIGYKpFvw8BKPfHoo0DLKcZJ2Lzx0Xtzt5MPROVj8Huus+eGR8sO
         SxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784384505; x=1784989305;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJbihdpS5pMhZFxXprWpaELXaJzDUAQpSlAnQGYaGus=;
        b=ip9Z6HQWjOdwYUTkf5JsUagzu/x4mecVHgk5s8gShj8BNFeeUhfQfw/9Sm5asJTrxd
         TW3sFn29plXyluFrKDwlftAQcI3m1o1k1Lkr/z38H2xgbIOoaepvomv3t7IPmv8Zcyy/
         pTDFUwGD75gf7ChPKTnbm7rrmX5j6vOJMaEZ0Be9OKhGBF2BWZcEm/COQ5BxsA+nilGW
         Oyg/Ip/FzbzezvRA2h5noMDltn1sVi/eut/aYtqg8zY9+V7V3j5/0US3qY2Hv+qm+SGV
         pdxKeXgMfy4GOQwNhCi5PwV4LQv5Tcq36JRCA2vXpSybMURfkLPrLP5v58x4pbwkSq/u
         D/+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrKnF/phuvxALzxSmbQlEyIUYM0vWi7li2xR/sDg9b7yfhLU1/lkTuOn7DvRvy4mAiMdFWoWoj5qp0SuwyB@vger.kernel.org
X-Gm-Message-State: AOJu0YwjIFpFMsz9PafYG3roq3DH3liJ1mLZcYAiRojLH3GKqMhduf7y
	4E26Cl/po7quBruIUF/xeW5rTVESusCKN53YGmDE2WhBD3oQffszn/GTZzXXfQj799FDHR7y/Rh
	uQkBD6g6LuQ/QdFwa7hB2CUOk2Wrmf8Nie61RNq9I+7l6X5FXRa/K/HVzVHa9EnTBwDchhzpC/M
	sTahspNjKqpuQk2bCL0pYPEus0DOF5+YlajANCT6Vifo2a6vIU1xiOFg==
X-Gm-Gg: AfdE7ck/w7hxO5hMi3HthXtFFPRlRvI3K2ygalimut0Hb8KJTQt7oWfi/rCnXYzQKsB
	seW3F3YxN5erih3LhAV+iKJWthYDQK91ygA5qDuOuPcWnOMkx9W8BBz6jUQaiCLS+S77ASlMD3M
	nxX5C9dss443RSQCkInDz3Y3XgNfeFQMRdwi2l3y8FkuvOuw3gqLGC4nQe
X-Received: by 2002:a05:6870:36cf:b0:448:558c:d820 with SMTP id 586e51a60fabf-4569042f516mr3046261fac.35.1784384505226;
        Sat, 18 Jul 2026 07:21:45 -0700 (PDT)
X-Received: by 2002:a05:6870:36cf:b0:448:558c:d820 with SMTP id
 586e51a60fabf-4569042f516mr3046251fac.35.1784384504857; Sat, 18 Jul 2026
 07:21:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 07:21:33 -0700
X-Gm-Features: AUfX_mwkKFGoMcHJEmH0d92IozyRwgE3dPW85xlwmC5VF7kYwUWibss20bzR2dQ
Message-ID: <CACSVV00hU=Ab__jEErEfC9tMn5DqC9MdgTVZA6p9U3iutDyZMA@mail.gmail.com>
Subject: drm/msm: drm-msm-fixes-2026-07-18 for v7.2-rc4
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <freedreno@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <linux-arm-msm@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDE0OSBTYWx0ZWRfX9FB4BLUv6QhQ
 s2XpCdu+HbBQfO0Eh4ZSM6PyabZFjs7U2Rj2ETL1frxiZB+FeKTE37SPlIRKRJRqqI9kW7bzll/
 jBm3e2Ntamagg29c5PuAiVccXmDq+vY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDE0OSBTYWx0ZWRfX7cGT1xYnauwn
 Vq2zztO/toIBeK3n/fM8rpH+ESDYs5ecR0eS3R6qUXFNqKbwXBZpPX3U9jSTc1I8prDM8jCQNPd
 U9ZTzpgWM7x9cFR+ndmUxSrnPzvgnvRaT02vg2lbQ85nghoaGTFQstx3zlY9WpdDNH0UUxR9ne4
 2sCu3qzraF5D4BBRJ0OC8sPmOw9lvlyUkIBycIYoSPe9u/lW0xITSvSAjn9w5dbOlV7hQ4wl3SO
 FA2+QvZYGALGqECqLk+C+M1nBbFae9GMQkad0YZgechm48/wtLlzzYd0DrEPLgWavLnM3TNsrO2
 SHK5JX3r0UBP45JfJtZuNhTm5/3RXDx5BnvsPBp592z5LAm9gDkMeK3VL3Xci7/WcrCOWQ2P73r
 eOVkU1mVMDKNMMkxRcfS0wapjYiMJsAIV87P2hkEPSAr9/0oLLqoS/U03bzuJzIFg//uA7byNwS
 kWC2lX5/GVXNeVOSDiA==
X-Proofpoint-ORIG-GUID: Ziu28D_4BjzmBAvjc0Rw7xZakExxIjEY
X-Proofpoint-GUID: Ziu28D_4BjzmBAvjc0Rw7xZakExxIjEY
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a5b8bf9 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8 a=zdhE6EiQQNMlgiWoPcUA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180149

Hi Dave, Simona,

A few fixes for v7.2 as described below.

The following changes since commit 9a967125427e03c7ebc24d7ad26e9307e8403d4e:

  drm/msm/adreno: add Adreno 810 GPU support (2026-05-29 07:07:31 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2026-07-18

for you to fetch changes up to e2332abed2a4d3caa59052095dc16e4ce44791ea:

  drm/msm: Only fini scheduler after successful init (2026-07-16 13:41:36 -0700)

----------------------------------------------------------------
Fixes for v7.2-rc4:

DSI:
- Fixed the rate setting to prevent extra clock glitches
- Reverted the patch for the DSI bonded mode

DP:
- Added missing drm_edid_connector_update(), fixing the modes setting

DPU:
- Fixed the documentation warning

GPU:
- a3xx pm suspend fix
- a6xx stale rpmh fix
- recovery fix
- a621 and a663 gpu snapshot fixes
- fix irq storm with igt msm_recovery test
- few error path fixes

----------------------------------------------------------------
Alexandre MINETTE (1):
      drm/msm/a3xx: Drain VBIF before GPU suspend

Dan Carpenter (1):
      drm/msm/adreno: fix use after free on error path in a6xx_gpu_init()

Dmitry Baryshkov (1):
      Revert "drm/msm: dsi: fix PLL init in bonded mode"

Jens Glathe (1):
      drm/msm/dp: add missing drm_edid_connector_update() before
add_modes on cached EDID

Jie Zhang (5):
      drm/msm: Recover HW before retire hung submit
      drm/msm/a6xx: Fix A663 GPUCC register list for state capture
      drm/msm/a6xx: Fix A621 GPUCC register list for state capture
      drm/msm/a6xx: Fix IRQ storm during msm_recovery test
      drm/msm: Fix task_struct reference leak in recover_worker

Kavan Smith (1):
      drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value

Rosen Penev (1):
      drm/msm/dpu: fix parameter name in
dpu_core_perf_adjusted_mode_clk kernel-doc

Ruoyu Wang (1):
      drm/msm: Only fini scheduler after successful init

Shivam Rawat (1):
      drm/msm/a6xx: Fix stale rpmh votes after suspend

 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         | 36 ++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  5 ++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |  5 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  8 ++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |  5 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   | 12 +++++++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |  5 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_panel.c             |  4 ++-
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 12 +++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 18 ++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c                 |  8 ++++--
 drivers/gpu/drm/msm/msm_ringbuffer.c          |  7 +++---
 drivers/gpu/drm/msm/msm_ringbuffer.h          |  1 +
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml |  2 ++
 16 files changed, 116 insertions(+), 15 deletions(-)

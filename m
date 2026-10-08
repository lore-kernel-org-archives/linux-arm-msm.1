Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A1530DEDC
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 17:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480260; cv=none; b=jXxFHz9f9WjUvLDhI4GeCTWf044mYEspjO+3lHjPLwETmGctg+OYw/5UQYT/7/OPD2fPr0qPenXov1BHAhYTSVWTAnzT7Nu9ePazpoyN+LzpDyKcpF1VT5QeMFBcfb7z/QK6maJFLzEuRJh0SNH7KEuGMpmYBfmI4i8oGqhvTbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480260; c=relaxed/simple;
	bh=yAMh1U+xHo0E1mlJ85wtYqoDRvM7p/qznvyhc4c6cOk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XMcQFF3gmkI/rXOG9eELDyoxpvxXolvKWnbQ0LdFvBytAw/tpD1JcH0Af+ETKt2anE1vHDXb63PcPUKeFEJGTRFleg3lGdSSbGZZUOr5d5px2jMaxxAsg2ohC7wDHNS1DfNBUet5LLz1dVBn3TzhODCh94oRqZZbyZhpb1/sLOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgFUWyCQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wgy7J5OK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgFUWyCQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wgy7J5OK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVQLW3121551
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 17:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xs+sf3wJNXkhPWmEhogdCY
	XfatqD4maQcm6aGnSdVnc=; b=UgFUWyCQYz3R+Ku/VR84R1286R0Elf0cKd5lbX
	Bmz1fUWn7V3nMXU82kKGkQdQUfWvC/5yeyB8tm7A25L4QD12vdpyPfnF7iRJUhgb
	XwXKuJM6miyiblWi76bz4SlyRNw28w0KExTDSSU2UxRYzDRLAtQVcplXETkIGPDT
	QANZgiifA53WwvBU34IwliZQ9rmeJ9m5molJPBmdl7xtQx61+JAyz4CTmC9GjcvP
	MhhD+3886GRaT1YTTJQBoQlxrIMTG67SiBXz0GVuTgoeHRNYu2LoHPZtrnMPzVdG
	bmsGwYsiC8hqWVvC3Dh2+H7lQq1YIKXXjx5KLi2YiBHol8QA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2v34q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 17:24:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso1259159a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 10:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791480256; x=1792085056; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xs+sf3wJNXkhPWmEhogdCYXfatqD4maQcm6aGnSdVnc=;
        b=Wgy7J5OKrHVqlSfej+XS7gNq+AuvpWBh4vADNPg1j4ztLko6Z0Gb5eo/fX9L88VigG
         7pVzPLV1QOBxMBW2RHV3+iXTGL6wXbZCZHbdAfMmWcrG2m1xCxAOVDw/FVqi1kuMZU93
         rOBjms6FpOZe9DJOHDv2Az/EaCfrml3qPfKxgBkH0RsPZUBy3N1Svn90U8ypJkfJKqXR
         xVIydBt1BaOPwVP7fr72C/XOQ1a6cN1GfCCQsTyZL98ytBilZIvO/rxLEevlAxgm3NzW
         p5TLSIqw0RHnx8LEr8abzDF1ZiDE5e19egh5frIiStAE1WRto/AE7dD7lVTqrUI/XaFE
         4T0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791480256; x=1792085056;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xs+sf3wJNXkhPWmEhogdCYXfatqD4maQcm6aGnSdVnc=;
        b=ESSFqLpS8gwAJU+EUTVhLmg76mivBUzr/rn8sc2cfKaXDObm8ba9AXYrVXsluk+pCq
         AalIzPtk2cmWee4HU0gd8AGLSVerWRtfPTiFXUtZyG1TEUuIxA9LVmFOP4rGQ/SrBpoT
         BU0Z7sG7CdxWNm7E/Sa5CI2Aa9XFiUKUYgxvT8jjqnK+rba2EhIxSK6Sie1jD6X5FckF
         2Ay5i42TQPgMCJB3bBN/9tP33ikE5SHctwtuzM0BnWckXwCr2DTMLf+wro8KmjQ9Tfh3
         6rj1bivM8GuMmi1RipgHbWLy0I1mFE0sTc9vf2YKx1oWdePO4FaS8SWIIGheMqSAhv9t
         ltiA==
X-Gm-Message-State: AFq9FYKZA5jUQuSSKLarfdhjbpaJGRJOKnj2xv6npyoUULyrXP3JlNCB
	CsBXYubRePz7nwK2vM/iV73Sw2uCuO2symuAx9wKRUR1fzwxxI4F2Qtox2QdgLm4zhxsQEEO5As
	gk68Pu/qaaletj0vup7BY+ZQw447fe9kH7v+bMjYY85pyqIlne7DsxjGs6W2KmD0mMjlv
X-Gm-Gg: AYBFou24QQedelQpAhME4+gaBuO+mQvVNiW4sMiSam50uSP2Oef8entyi1iWo1gbhsE
	Xottx+tTBgHTjZ5+FIeLUWHR/5c+OpzlUrjD98yQXCxBC/w34vEaXsQT4ewEPrHzmnmHK4Mnxtu
	lUqwy/kzn03B5lLbUSlJpRwsaeJcLyfuasCl0ow0NLpx/NIPASXEEvOhc1zYP8IJQ/TUpEezczN
	9GkIF5/JN//+AJTlKb/aq6/yDv9HaZ5laYtx/QQ2rs+omRZwZbFWcTWfnDQsajxAXXhd+IwE+GL
	4Ljr/BUGlvTMDeJx4VmP0XpJ4Z5bEAIDt5irCzSW8jaAJNnFow+d0Ns9SfjGtnOHCwZBgibOrXa
	hx/tdbzR092QLFy8zEfEL/SQzQw==
X-Received: by 2002:a17:90b:4d0d:b0:3a4:b418:94cf with SMTP id 98e67ed59e1d1-3a8a0728aa1mr5887888a91.14.1791480256472;
        Thu, 08 Oct 2026 10:24:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0d:b0:3a4:b418:94cf with SMTP id 98e67ed59e1d1-3a8a0728aa1mr5887862a91.14.1791480255879;
        Thu, 08 Oct 2026 10:24:15 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3277c459sm47228a91.16.2026.10.08.10.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:24:15 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: [PATCH v4 0/6] drm/msm/dpu: rework layer mixer allocation and mode
 limits
Date: Thu, 08 Oct 2026 22:53:46 +0530
Message-Id: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKPRx2oC/x2M3w6CIBTGX8Vx3XEHSAdd9R7NNRJMNhEDM5vz3
 Tt5822/79/GskveZXYpNpbc4rOPI8H5VLC2N+PTgbfETKCoOaKCIdw7v7pMOpoB9EMbZdFqJSt
 Goym5I6bNrSHufZ5j+h7/i/y7xxVyLiCYFQKVE3y8nXtYJCB0WmEtnRG8q64x5/L1NkMbQyhJW
 LPv+w884/DbtAAAAA==
X-Change-ID: 20261008-lm_fixes_final-9b9a8d0d9835
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791480250; l=4299;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=yAMh1U+xHo0E1mlJ85wtYqoDRvM7p/qznvyhc4c6cOk=;
 b=N73dcZJICejbFBUNc0+WynUv7uaFblnOzfLuH0I30NDZWum3CyYKdGwFFTRgnCHZBVvIoTpX1
 vhXLzaTK9SfBzuxEdwI8wJJDtayfn9dZRxttd6AP/5mE+4KcCZcxXW1
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac7d1c1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EnqxrFWiGIBXIX2NHIsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Xd9W67fSmdVY3f96zPc2jV7lhx0Jm_Ig
X-Proofpoint-ORIG-GUID: Xd9W67fSmdVY3f96zPc2jV7lhx0Jm_Ig
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfX/9jTlmn3e0tF
 fklVAIuU9F6fNADB3XV/lVYWaq4cHeNqBgINVazVIghiVw+Dy9/KufsRebDl4ySHBLGZ0dUETom
 1aEdSAqv3hsdJ030KKqh2GYz1Ekp3mw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfXzMiSBwp/6onC
 CPCs6VR6BIBtpIUoE80Sq3/NLR78/4k0/stjB4Qt21s5KFN7Ku52jVUCBBACacJqwmOvnR1RHR1
 htjKDBVNKwoibC6+CWcl7MnRmNPrc6FnbFO747t/WTKW3Snvs1wtYraytoRbQuNSE+2+exyfb7V
 dO+qpJeCmfTfMUxiH72taZIjBxelzAypndcvbv/eJCv15ZMxombW1Wanimp3Cnp50WsQxshcHlC
 mOkWeatDyrLEEZo/HxYwtxsfUJePTXHtAqMEvI0ESXfcnSDZR2iORhIKXB+vI606MMs/e4cKV+4
 cPHzLCoNtGl9NGr0dhbnftPhnDc9GXUET+a0+7fS5wF7+qzF477T8fqOp6ku5JI7FM8Brn+E4wW
 punqVitjt5SwM/uxB0a0kI4tfB9PG+04j8YmUtqcmEAeZBmBYJ61MP3nYhR7u+/DhszX3yuBJk/
 nKUVlkImhpifla+IJjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080069

Currently, the DPU driver bases LM reservation off of the maximum
supported width for the layer mixer and an arbitrary MAX_HDISPLAY_SPLIT.
However, these limits are not hardware limits meaning that a single LM
can support higher resolutions.

Switch to basing LM reservation off of PINGPONG and DSC encoder hardware
limits.

This revision also adds clock-based mixer selection and a source-pipe
width guard for mixers without source split.

Assisted-by: LLM
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
Changes in v4:
- Rebased on msm-next, resolving conflicts.
- Added clock-based mixer selection and reused the helper in mode
  validation.
- Added a source-pipe width guard for mixers without source split.
- Extended the catalog cleanup to newer platforms.
- Link to v3: https://lore.kernel.org/r/20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com

Changes in v3:
- Rebased on msm-next, fixing conflicts
- Updated commit messages to describe the actual issue.
- Link to v2: https://lore.kernel.org/r/20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com

Changes in v2:
- Dropped PP and DSC encoder width drop the catalog, they are now
  determined in the code by using the DPU programming
- Corrected DSC encoder width for DPUs < 8.x (2048 vs 2560)
- Link to v1: https://lore.kernel.org/r/20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com

---
Jessica Zhang (3):
      drm/msm/dpu: check mode against PINGPONG or DSC max width
      drm/msm/dpu: filter writeback modes using writeback maxlinewidth
      drm/msm/dpu: remove max_mixer_width from catalog

Mahadevan P (3):
      drm/msm/dpu: split modes a single layer mixer cannot clock
      drm/msm/dpu: do not assume a merged datapath when validating mode clock
      drm/msm/dpu: limit the mode width to a pipe if the LM has no source split

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 82 +++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  9 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  9 +--
 36 files changed, 79 insertions(+), 54 deletions(-)
---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261008-lm_fixes_final-9b9a8d0d9835

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>


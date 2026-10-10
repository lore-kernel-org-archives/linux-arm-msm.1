Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF91370AFC
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639528; cv=none; b=JXsmsTTg3k6JN2ZCuOXrFQ4eIDnS+dFiSwP4gNU+fKDo9ROahT12RciTrtLi6ys/5gEUso7WplhPxI585AMPAoLCGcOMEKO3vOVlMc2wFScFp5GLqIvkf4jQRtqtvse7SkUXvT9MLmXiCOXQ7Svn0iM9qviIBAJGFvgwV2roZG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639528; c=relaxed/simple;
	bh=p2JPtZc0aH2VqHHjrjpm5Ky/B1p6VEk1UEgl8YRNRVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rh7R0HkLXa4KedqwF/E3YC4zsuh9Gy4JJP8/gIgtZ1FV6RnHk+FIe+kP7eag/HryuTWwhZuqcnkPT9wCX81iCtinkkq7ANg1cxYtP/vDkHdtDbTXZOysNoVj4c6Y7MLiG+oAUQiQaCvSbztnxsp4RxlfrHiITC9CXklC1ke46+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=icTViPJY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NZLlvudz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="icTViPJY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NZLlvudz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ACUsrN444691
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 13:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NVuepAtG3yFBy75PO2yidtbiFp0Pms1pBm5Hoccl02A=; b=icTViPJYJ8oZPqu7
	sF/InkucD+9yOsQPitDkhQM2SG6g54Vqkx5Go2Uu1/kCser23O0MJ2exEDsoK5R2
	x2mMyq0WvCplChqEFNulus8AFRX7MlrGAQ2NdK3GULHGMIUaOSZx54nRpRDnNRhj
	7v0UzFpDvPP5f3w6Qx3l9rPPzqajuK2U1IjRzlFCwseQxUcB9d9miCXega6Q7716
	T4IK82yGrL1iJIHGgKzc696jPyfVDRGSvUJiuzO4QgUNqappOgKGY3CKuV+D2yul
	ztOg5Gwk6i4p29YeJGd4Bb5bqv8vufBehzZbix/KrXnUOAotb3nv5qlSdZ5V81eT
	WlLuaA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7aqmsg5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 13:38:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35158d674e1so2776919eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 06:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791639525; x=1792244325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVuepAtG3yFBy75PO2yidtbiFp0Pms1pBm5Hoccl02A=;
        b=NZLlvudzl7lR6y4TJPkAf9POnKDyYmID04i+qpsJHbV0WqSHUB1TgACmfPgBwwcy+M
         z0WVLTFHox1PUkPHPolQRJAXlId9vEXpO5uV1j0YRRYo1uoESQ0BOoV56HL8BfyZY698
         t/rX9ulE7SS+kuhreMBjcpm/TH/wlldfj2PPL5FP8NcMlQ9TCbUxMmPl6Zj33bNRV8iv
         Q8QzvDLeZyN5k/VbSpbRhPBnrEoZVY7o68qTaU6phTltPM59qI+nkfCugDfI7kbXl4Ad
         u2x9w7NrxIalF0iDso93FwV7bNAGm1ZUtuF/I4TMn6M3GDmjgVFo7vW4Atvn/XYHwgJY
         KoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791639525; x=1792244325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVuepAtG3yFBy75PO2yidtbiFp0Pms1pBm5Hoccl02A=;
        b=xnuXTzPWbgDhusExX+yedh8+SYs+mxn1SoSCnr2cisgM0+NHhyyQafNt7HzGzE3hG+
         Fpfyb1Q8MFx21v0Zs83lR7ZnURxsiEy4hezndovYfpMaPRq4j3lmZ0VT/rYfYNPIwxP/
         aoEtP/A39NNZgw4eA33dVtZnet1ks3CoY2o8xreBD6u3QI7dGLm5zAUbM2FSDW0mVg78
         RYSOqKHNazf3vyIf3usoiQFVz0fjL8q+rh/uwOmIvsaY0QfbQNfstzC0A1DREfgpka3e
         K9SD79c7b5rwtVjhu3inkmXvWOZueUqBlcuD47QHEGI6lMePMRd7kmvnXHdu7A0JRtug
         H5Ag==
X-Gm-Message-State: AFq9FYL1avOzpc4xfOYFp7vzePo1eyQmxTGrEm2uvGDTVA6CXmMFl005
	3xq07sHdi223oNB5QmoxP7p2ddn0tgcmr4WLCvJjDoqasHERACdvNnZgsJCHLLf+ojKbSErA8zX
	5A0ofe0vhDMA3ht++LOBOY2lAAFxlGnJW1bM/v1cgHId9YZcg0oFdZ7CPlt9lUJXOhwN3
X-Gm-Gg: AYBFou1B496TaILPiWaURW8HrmMmaM//MY0GUBewAhq9KlIgI/Jv8YwgB/3XpwJ4lLi
	VvvEpUtCblcjutMiW4O+z8pzNSLoD+S4mQjv09OahbPdaDFnSuKm8+sR+OuEI8B2pm8j3129TE4
	uWKoTIqL0vIoJdTS8VO7KyaaIpxvfN5r1VLef4qN7CD8RotdJkF/6rvDoOR4nAGoWoBSsdop/39
	d6Qgn2JmcEdOEOPwOwWMV9o88tVgJrwEwDtGcQUyvFx9O8VqUFP1afx1vNfiDZT0mhivrtR5Pbt
	X6wI/jWeJDCI2sz8tBxKBMnlK7Gw1WbJ+MVg+AHNrvZHkoA62SEakmCsZaWKCw2fw6mFD7m5kVt
	MqFlxnh8P3GGzMVo/bAk5B4gxgg==
X-Received: by 2002:a05:7301:6494:b0:341:225b:d6f with SMTP id 5a478bee46e88-3537dfd8d79mr7074534eec.19.1791639524392;
        Sat, 10 Oct 2026 06:38:44 -0700 (PDT)
X-Received: by 2002:a05:7301:6494:b0:341:225b:d6f with SMTP id 5a478bee46e88-3537dfd8d79mr7074504eec.19.1791639523691;
        Sat, 10 Oct 2026 06:38:43 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm15232827eec.4.2026.10.10.06.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:38:43 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 19:08:23 +0530
Subject: [PATCH 3/4] drm/msm/dpu: program the source split order for split
 planes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-pipe_order-v1-3-9d8bd29fd78a@oss.qualcomm.com>
References: <20261010-pipe_order-v1-0-9d8bd29fd78a@oss.qualcomm.com>
In-Reply-To: <20261010-pipe_order-v1-0-9d8bd29fd78a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791639504; l=2679;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=p2JPtZc0aH2VqHHjrjpm5Ky/B1p6VEk1UEgl8YRNRVA=;
 b=jYsetJYzPBSCcEqXgN4RMOUE3NCK5Z67bnYMoYhCpSgesyRXkRNlTDuYahkh4EHWtdwaU1UJQ
 f383vCv6vAxAQCq2H8sQ4fx4S8mtxQGFlSdMghlO3tTV2BBb2gMsoCg
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA1NCBTYWx0ZWRfX41VvO/2RzQzf
 YobqXg5aHeeb7HMxqSaCaFEqXtfBSMOm9kBlvL1yxW4oOjWa4TMVEAHQj5UaxVlC21PemGeYH8C
 z6eomTO7UTyqP27Srr4a0DsaDMoHrfM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA1NCBTYWx0ZWRfX9qiYEGgIraLW
 db4IUs9fjWeMLYHcuynxhU1JwY7gvNOxzcFzhkDp48UbuFu11sdBbzsiUFRgOn5hZfE6WTkFdWb
 bFAtE4OdOWVnIAzzGqXzFlTuEmmdQ8qWLsXpr8ZMtUXy8IaCRUcjOW8YQHcuV937rPUp32M/9zE
 RH3PfGNcRz5ZVOlHzRBFxGWQrrbHpkOg2w3gIltfbxH1VgO1QHu+xZkbTgCtwTeD5IPXc3tUeoH
 +vJMGPv2hEhVR6h+jJ5PcE0vjfqoVV5l94+wSVL7Ch3XrKsnLJs64kWfiwmgEwbERxBbCfmlPVj
 M7KTcoODrOum9EbY7o2C+uQtOp+gx9OR+UmZi1tWCRNRIfygNvZBRHvbb7wB3Stx+NKd/a0ecj/
 clYG+Y+6avbGmT+E/rdCFtEN7YqpLDK5sQWBQI2kyqUsWiR4YS/3626ZmL24uAFXSkOvvdnhCig
 EmW+Sjitc9PXC+2sGjA==
X-Authority-Analysis: v=2.4 cv=Uq32pOwB c=1 sm=1 tr=0 ts=6aca3fe5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=MVEwI48i6TzORs2vkrQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: CKztWU43lykbvR12CAocQQHRc35qrkuA
X-Proofpoint-GUID: CKztWU43lykbvR12CAocQQHRc35qrkuA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100054

Virtual planes can use two SSPPs when a plane exceeds the single-pipe
width or clock limit and parallel multirect cannot be used.

Program SRC_SPLIT_ORDER during mixer setup from the pipes' destination
X positions. Set the bit for the right source and clear it for the
left source or a source without a sibling.

Fixes: 8c62a31607f6 ("drm/msm/dpu: allow using two SSPP blocks for a single plane")
Assisted-by: LLM
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 77a2d1f6700d..91152d937ba3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -434,6 +434,18 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
 }
 
+static bool _dpu_crtc_pipe_is_right(const struct dpu_plane_state *pstate,
+				    unsigned int pipe_idx)
+{
+	unsigned int other_idx = pipe_idx ^ 1;
+
+	if (!pstate->pipe[other_idx].sspp)
+		return false;
+
+	return pstate->pipe_cfg[pipe_idx].dst_rect.x1 >
+	       pstate->pipe_cfg[other_idx].dst_rect.x1;
+}
+
 static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer,
 	struct dpu_hw_stage_cfg *stage_cfg)
@@ -443,10 +455,13 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct drm_plane_state *state;
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
 	struct dpu_plane_state *pstate = NULL;
+	struct dpu_sw_pipe *pipe;
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 	u32 lm_idx, stage, i, pipe_idx, head_pipe_in_stage, lms_in_pair;
 	bool bg_alpha_enable = false;
+	bool src_split = test_bit(DPU_MIXER_SOURCESPLIT,
+				  &mixer->hw_lm->cap->features);
 	DECLARE_BITMAP(active_fetch, SSPP_MAX);
 	DECLARE_BITMAP(active_pipes, SSPP_MAX);
 
@@ -475,6 +490,10 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 				pipe_idx = i + head_pipe_in_stage;
 				if (!pstate->pipe[pipe_idx].sspp)
 					continue;
+				pipe = &pstate->pipe[pipe_idx];
+				if (src_split && pipe->sspp->ops.setup_src_split_order)
+					pipe->sspp->ops.setup_src_split_order(pipe,
+						_dpu_crtc_pipe_is_right(pstate, pipe_idx));
 				lms_in_pair = min(cstate->num_mixers - (stage * PIPES_PER_STAGE),
 						  PIPES_PER_STAGE);
 				set_bit(pstate->pipe[pipe_idx].sspp->idx, active_fetch);

-- 
2.34.1


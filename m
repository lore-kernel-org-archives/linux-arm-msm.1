Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F25388E62
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 17:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480291; cv=none; b=TwY3JCo8sQMCr9FVxCoz4m2iAoPVszQzqleSzgdE350pLFZu/cMEiTOM9OtL3hJNUowc58efxTLtx10TQSLOBid2zvaW8h0rJASXTSKXv1WnaPixTYbAvQOEiSyiZNyyBZPU6mtxNPceKrrwOljVWzU9N2zu3Jl8NiRtX01e3Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480291; c=relaxed/simple;
	bh=ffK+sgwIxa0nxxdTwedAg7jsF/07q/HMTOzQUsBHFFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SRMWIev6XVf9HhA54CEMcPs7qc7lSwhMPfRXin660W/IVSbZ+eLl8fKcricBGbsFLgpCAXBt/XDiK8XR3tleg7VreM/tSY14RlsgMaSu36hNX4dNpT/fZBZChjl0Ur2iIN3YxlO/I8iCbBHypZ1i9dt+aO77IAE69FyCd0AF+IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Emzi9NQ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hB0NWegV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Emzi9NQ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hB0NWegV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVWZE070500
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 17:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXOB6HSENlgLJ01CymQ95n8hmSw8nebKPmjVVOMcZrI=; b=Emzi9NQ66f94ePkr
	eyA8pLJNCNTJl8KPL0ursay6sOlmqUSIH8cfA4wJqXHIYpEK4k2mQX6v6vE/zp4o
	CIXTgsvJVW3+8uQTs07fB0kjVxGY7NJARyNGQ2ud8AdhVzvA0+wgxKFgkJtLV58L
	hc6ouROcwtUYTBAKy115lamD7inVjj15nwLCImMDhlaGGaSZxq8efyCUmztH9uOk
	pLdzHFBHty/c1NS4DZ55rrWfvIEmyX98YNJt1UTUE4sCyqN2lO6OK2YQF3pDmO6e
	unuE3ofUINt6PH6DQzpCLoC0GH2vxi9igfHSsfRxtnyXQluWWX/ZpM3xgR/bU4hm
	rWBK/w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sgbj4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 17:24:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso6906709a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 10:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791480289; x=1792085089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXOB6HSENlgLJ01CymQ95n8hmSw8nebKPmjVVOMcZrI=;
        b=hB0NWegVfSpM/ALUfhXi9ZEZUHJOuDqT3PhGob4LjDqtgfX/a/dgRMX6lQd8Gu0c3d
         E9s55bdL1YwbIajem5SNjxbp+JPSb7e0VBs8pKhcEM1mf2LTLxJZgTdnGiAe3rKMNE52
         ePsW3phOElUNVSwMucRJ/YvhyGosvfX887ubs/6T2F9td1r+CKnedG3OW/rit+c1aLm3
         v9fPh41BrF2lhxxrMb3icQfpeU3ukgM0OgSRA0L7cDJwKPD+Ll0NKog0lxtB4sTFLPT+
         c9V5Lp3bKiax1j7vtICeRNx3xi/8HYloObRNav5Q/KTNriAbrMhgM59eTwIgfH7Mpfch
         JcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791480289; x=1792085089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXOB6HSENlgLJ01CymQ95n8hmSw8nebKPmjVVOMcZrI=;
        b=bbrGDwFZBGwsO1/Ht8T091RdXuZ7GGaQMwLv/cksYQQ1ERf0ySiiJxtHZU62/Cb7lA
         zIvszAac6XcvMqkr5jbII22yTH2rQeR77sNq65hjlbmbrYjJcn6KunSEHa56UjH9qzxI
         55Nch8aShepMLBJ67i58On9fmky1cCiz572PFxR8Vl8S9Asm2Ca7zMOkYZI6XRy+0Wja
         xH6QELEgAskY5opBZzFF3+TYxg/ENpHYm+sAKJD8PCxYKBAXlEb0pqjMnvHZZ/DWIuho
         Gnt3Qj2OJy7mOctptzUjG0H+1DDTXZAUZnS5AKHUgo5Ud0URQafk02iwMHda5xzAVlxj
         Y8Vg==
X-Gm-Message-State: AFq9FYJSXsGJaOoc9YTYdaqR1ik0VVaAWi2kkEjTE560ce18zZ5R+Ns9
	GRQiDrXqXVkexOPwIX40/AuADzuZ34N54wcixIHAyvipbmGs6IU+n1UehmtXWcMlICpYIAQGkeN
	ItguAXWxjuftpCYGi8L90BvX83IrczEg+8o4aRx7KTQhh9Sp3gWdS+eB7WrmyvrHjLHw0
X-Gm-Gg: AYBFou0fUg7A8TlkbKk5vhB87e/rPd93PgBEjb2SRYOyU7+51rv/Jgz4Fp6DX1gc1uI
	pFVs75bTjvxFF8O/R8bSedbbw+s/cD52SurESHx4fhYVj3ozW9fhJSMoAPVjxgbb5+1BKxW5LHD
	Kl8Vn4v8JZXBaM9jLMEhy2UvzmH2r5wmxk74HF+NLpBKJlCBf1kGqZhgNVvgJofmlw1Pfat70hi
	vOyPLv7bLiuCWTYP+YfFKSJ6R2yAWXEO5/wDXWVpwbxXnOZS1KI1yk+zvHZFePvzW2kklWl6guB
	jpIN0T+aEzsAumOykiiIb3kb+7/oHv/C5sqfaA2B8IAmFRXVp3rM0e/z3B6Jd9iFZE22p+kSitu
	6o00L9JAS9bRgNO2S2cOZE5ylHw==
X-Received: by 2002:a17:90b:134d:b0:3a4:ee64:b880 with SMTP id 98e67ed59e1d1-3a8a0dfb941mr4586264a91.32.1791480287634;
        Thu, 08 Oct 2026 10:24:47 -0700 (PDT)
X-Received: by 2002:a17:90b:134d:b0:3a4:ee64:b880 with SMTP id 98e67ed59e1d1-3a8a0dfb941mr4586236a91.32.1791480287115;
        Thu, 08 Oct 2026 10:24:47 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3277c459sm47228a91.16.2026.10.08.10.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:24:46 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 22:53:52 +0530
Subject: [PATCH v4 6/6] drm/msm/dpu: limit the mode width to a pipe if the
 LM has no source split
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-lm_fixes_final-v4-6-fa986071c3c1@oss.qualcomm.com>
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
In-Reply-To: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791480250; l=1679;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=ffK+sgwIxa0nxxdTwedAg7jsF/07q/HMTOzQUsBHFFY=;
 b=VM0cIPXc3RlKPNnSljZP7as8ig45IsRGPJpT6qKIh9HH00akRjuibYAvs7G0QY03xQFqfmsPI
 4PZkw+2QcotDKvVpPGBJsqo/jeq6vsDvjrq9KyipQcs/bbwdj05JrHl
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-GUID: VFrDWH0EbZ1izDQLCdw5UeTJDeLD7Hgm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfX+MlkpbzeNO57
 GIAzKDMVpX0klEQ0RsEszzHddyUpd1yWWszpur8u7XubGr3oHF1q54rrweXC5JLbpB//wWJTfPz
 4NzRcXeaDCZhPpQjV4z5LzOihxpXqUo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfX9tU2udbnwyxk
 n3Pb3nSROJXP+CHdlQiLt8D3EzHqmx8v3AHM1oeYCV7J0HrB9clb4RZGqdeusChBwrz4mNgYeB2
 MMK4bWqz38ZIt88UzK3moIBipuBLsBi1gzE5YeIAmWdMLZhgBtXi85cHZpg0xFcPzF7gZTbJiuy
 FtFcxe6D3flO/zMbTtOsbHd3qIjiFdf5F5TocFXjj7Px1M37emBj8LD68wYWrrxPd3zuRFv2v9h
 kWI0X3BXFj8vVpuaEhK4nF74se3MrzD69Wu68kgaHBrHpXG8vxHTL/a9BVu1ln4LHS9OhBSNMsC
 4/vuN7XC2/o431N0g5Qv1k4qJq0Mld2jEO/xcgWtWVOWeEHvhzGZGliIGQqkq/Qr6X7kPehHCqm
 uNEJ1Fs26wi0fjjtGBaRibNDOAtMtwtTTET9P2uJ/r2twYQ27yDuUcHHLKIB7z8P16r9lCMgJgj
 oUZr2Rq5Ii3Db2ie0QQ==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac7d1e1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RCAr_VjVQrktO2oC:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=67skgTjD9neFK7rYSF4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: VFrDWH0EbZ1izDQLCdw5UeTJDeLD7Hgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080069

Layer mixers without DPU_MIXER_SOURCESPLIT stage one pipe per blend level,
so a plane is fetched by a single pipe of at most max_linewidth pixels.

max_mixer_width used to reject wider modes. Now that the mode is checked
against the PINGPONG width (4096/5120), keep max_linewidth as an extra
bound when source split isn't available.

Assisted-by: LLM
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 41f986ca2a68..c2ebeef0b01f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -791,6 +791,10 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 	    adj_mode->hdisplay > max_pingpong_width)
 		return -E2BIG;
 
+	if (!test_bit(DPU_MIXER_SOURCESPLIT, &dpu_kms->catalog->mixer[0].features) &&
+	    adj_mode->hdisplay > dpu_kms->catalog->caps->max_linewidth)
+		return -E2BIG;
+
 	for (i = 0; i < cstate->num_mixers; i++) {
 		struct drm_rect *r = &cstate->lm_bounds[i];
 		r->x1 = crtc_split_width * i;
@@ -1661,6 +1665,10 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 	    mode->hdisplay > max_pingpong_width)
 		return MODE_BAD_HVALUE;
 
+	if (!test_bit(DPU_MIXER_SOURCESPLIT, &dpu_kms->catalog->mixer[0].features) &&
+	    mode->hdisplay > dpu_kms->catalog->caps->max_linewidth)
+		return MODE_BAD_HVALUE;
+
 	adjusted_mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
 							    dpu_kms->perf.perf_cfg);
 

-- 
2.34.1


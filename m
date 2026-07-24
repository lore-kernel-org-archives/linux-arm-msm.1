Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5953DA7E6
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889360; cv=none; b=RnUnAHyYcDMF/nW5PIN/F56bplarsm+5ePBgrML0gB1HPxkhKgUxgKF0d1BhVtxq51NRrVq7kKzPxQjW+yv5Ewn4oWdvKVrQE06VjbK8ngetvy0IgqkVW9HhbumKql8pl1equ/WwzTbNNC4JazN9QS/HTsbp8RBAQIY/7GT7Oks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889360; c=relaxed/simple;
	bh=CvB9YvUBIkQH9BcIh+3hUBKOEZT/PvTTwrkmHJauE2A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QNl/91aSn4mS85orFUBNa8e63lCmYfzAJbRytlkgNuyIlCvoqV2b9V+nwFxYVShNilncx8c1Nvk7knRXMjQxKUJO6rDoODP1zIlvS/T/5dww/QYLHIULy212EqPRR9dCd8Z1h/2M1hdVFgWWyyzO5bjFgo0ilwWA4xdt8FGsf1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6lCvAGC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTmgjASm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6lCvAGC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iTmgjASm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADXPC2478947
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CAptM4MQ5Q2YfJ/h+CqLee
	LfiQB5bwOrYf6+13We8oA=; b=U6lCvAGCAQWP5Aq2n3uRaQ3r61/4pYuMNXMmWf
	tOx6ShMpOox062H4IALsXeVjqRYyouR0G9IaTZz28oG6Y6AI7JEmOsyAZgR/keZ4
	WSsz9gACmw3IrhmtNflVumbYjtkwM31xnlUBlNRkw+e3Us0sA7DeVjUVJZbxW6qs
	88jusBkYwZyrSW59qP8YHdu4P8R0+/XZtQxFGH1/d+9Rd/E00GGrGqnCJL5s7O0G
	KBW8HMh2PEJ/zT8U7ZcwzCqccIUIQ74jhEREEiofSJkzsJNX/qBSGQ/lmlegcAUL
	2ji5FJzaVLzAzc/XFaZEHBGAbUTFgvCKpM0MMaYkYEHZz6kg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx91m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:35:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so309052a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889358; x=1785494158; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CAptM4MQ5Q2YfJ/h+CqLeeLfiQB5bwOrYf6+13We8oA=;
        b=iTmgjASm6BG4qYEuYa0rkPrAP5HhOopE3g6QhLNjAfe3Mkfft9heFBTRIg5AfTQN2s
         mtbYAxJll6w8bbAc4RNE0kGp1J4HeIdGIIpCvy7EnJ/t/5+rnrOludLRSfPq4aGj8WCy
         8oZ4jzgQIgYzog3DWJ9dBiNBoO7oaSIk/2nct9CodidQjhVOcnVsuV4TbS0a1BGuc4wU
         e5/IjRZcnsl918gXvq+7MZtNA+6ytpGFp721tsSrBrCiUtBd9JBDDg+4vAXY/F6yAPL8
         nTp81RW7lLRu3BmpziupMpCh6Q9rcqZCimjwGvAOKGItKVxLk6O8errcsOGTsYPn4MR4
         9H3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889358; x=1785494158;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CAptM4MQ5Q2YfJ/h+CqLeeLfiQB5bwOrYf6+13We8oA=;
        b=AS3knHBbvdAxlCnkIErwCv9GwN1IBhjGpW5tcpOY/vlkD9suiCMzZI409+L6PU3X5Q
         Aj/VeWZ58ngTLfjzR1Ne3ILPXtTTqW13keKgZP0z6xP2OtkNhlbYKDwG2H20YRGVh6VE
         UoF16MagdSa0UXeo2sdHIGAG8LSBOpmgXveNqBbzVglUUSjmf7SVRa84i8IWxfsve4sT
         pKS7P58AIO/bzXB5WisbQkd9QS+0buYrG7T1bh5nFmXFlZD14HhOuCs7XXmB50NIEnkN
         v2h1N+SLvNw7xdx+yrbfwSXKaaXp1lDbgyTT5ZPq2N4/M3Sbu7GQeN+EqEjA8n7ayicu
         UtvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3D4t+OBuh2yI47c94x072Zq1cUZcs77BFNK818RsjjydRf2SaL1ynhA1lUgmqm9AQT/W/pDkb2P8FrXtM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6obt6cBV1OlmMqll6DcW0z27v74wQ1We7hSVG9kYIt7XZ4P+5
	U6cKwzmkWF5J945mzqq8lKvautz8v2ubamLkhRXXzXH8f1LfoEgpZMoxgYkcNB+uICdGKAAYPyE
	NQ0TJJ9rKERoK6cAEL5NVSf53RyYWqGH78BiaPW8ZAYLqKZ6yE4dbK3c3k32Rn3wbswoV
X-Gm-Gg: AR+sD13ogCeE8KpoacqvXb6wwFVE7SBLQpGJDyNi4Th+FBzPWFJY5jeWfyJG6cqI1yO
	66LDPqhy3Z1NDWmVQwjO+fVJj/AZ9mQ+Y4JYQGh2IQmGUB81+cgRN7SCj0Dby9Jl8OxJhx0C1hF
	slfUXRgga9m4Nzlv6AG3+nG5izgv+oN2tHyX4deKVani4Q2T9W8hFLW8mx2DM7gbL/PMn+u/mGJ
	kDLJMnHfHhg4w+IJO6fa5Uvun4YSe9hQ91xfrSIpXcGTeU8ImK+rY38jwaS4hRls6DcypuWVcjd
	+M8h7VBvEJahG2Ncz2Z3HWK8rKK0pqlbKI0CbbYBfq45jjPjiQYTLWjZw7vXrcCxby5UafMiXwk
	K0NQ10qaxV733dCgSChiNrZDsm5P3svo=
X-Received: by 2002:a17:90b:49:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-38ec63e7d3fmr7193029a91.4.1784889357529;
        Fri, 24 Jul 2026 03:35:57 -0700 (PDT)
X-Received: by 2002:a17:90b:49:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-38ec63e7d3fmr7192985a91.4.1784889357012;
        Fri, 24 Jul 2026 03:35:57 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0e976sm1228657a91.5.2026.07.24.03.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:35:56 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v6 0/3] media: qcom: iris: add multi slice support
Date: Fri, 24 Jul 2026 16:05:49 +0530
Message-Id: <20260724-iris_multi_slice-v6-0-a99d160cb42a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAVAY2oC/3XOTWrDMBAF4KsEraugf1lZ9R6lBEke1QI7aiXHt
 ATfvXKg1BBlM/AW8713QwVyhIJOhxvKsMQS06UG9XJAfrCXD8CxrxkxwhTRVOGYYzlP13GO5zJ
 GD1gqoVmnrZGKo/r2mSHE7zv59l5zyGnC85DB/kOCdY/QQjHFhnnOtKIGXHhNpRy/rnb0aZqO9
 Wz8EMuc8s998MK2kr9tukEyTLCRkjgawHHjHslt4sJ3DqMNh1fH9l5RqzoNGp44Yu/whiOqI2Q
 glgfQwT9z5N4RDUduTnDS8J4ZJ0TDWdf1Fzq/++TeAQAA
X-Change-ID: 20260716-iris_multi_slice-5647287a9563
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784889352; l=4854;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=CvB9YvUBIkQH9BcIh+3hUBKOEZT/PvTTwrkmHJauE2A=;
 b=EipOyTAK/VrGWhkVFsbeG+4IdMzcpGjOQ/ZsFPasfOckoKclCJKL1CrnE03Mau+O5ABzzFEm4
 O9/wuMmS3ugBrg61/dLuj1EA/xDxlWBLEnE5u+NtLjmRJ6p1p6Pr/UN
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-ORIG-GUID: r1Ob6rUB-Se-FG7u7-f_qMuJWaC0zkEB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfXzW+q2umx742i
 C+jT/U0w70CCNU6kFN9KHcdOREeDQn1s3lKO1Bvif7bK3hAC8AlSlvDWols4b9zUBfV4w4JvqYm
 U+0UyX8d+rlaqAiRoMsMqKq2Quyhz2Z0n/dW4GRDjGOmXPRjYNZVWPs+WqwgcqIjZGSxekrXyoU
 PNzTcYjUfNROi8l73HrEeB9GsZAQVvV8xhppun6mrzvCbZYR5KQY/3UJAs9QBVuczNfQdknwCoy
 T9B1wUjK/rpVM7miAd8L0X95wMBltfpSI49Xiah+b+rJX10Nw37yHit5sCEOvPB32aJwvZmtW79
 kY2rm2buF/pyFxR6fs9I6kfS7cVQ5tviM4C8+cLkOKo6SVvfS5Slloqj0HuIA8xOBel9YSpcBne
 jn7JBxCOtk2m+3udrjGWkg7LsNniB3cCdcG1ClK7xoWsFPc/3UKg0Xut+XOXVsK8xENEHHmmjkc
 K1sY/ZByv/aIMLKUWuw==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a63400e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7Z090XU5ozNHmVG9x8gA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: r1Ob6rUB-Se-FG7u7-f_qMuJWaC0zkEB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX09c4nAFJgZQQ
 /cHHGCLvdP5Sw5+F3OSpetXk88DdtXZqbBRYRXQmoseO/fcdoBizyMAz4+CpYOmp3/B5C4/Rhwm
 ijsTboww9lf4A6RV54Q9d6ERJ4Eildc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240096

This series adds support for multi-slice encoding in the Qualcomm Iris
driver.

Multi-slice mode allows encoding a single frame into multiple slices,
which can improve error resilience and enable parallel processing.
The feature supports two slice modes:
- MAX_MB mode: slices are created based on macroblock count, controlled
  via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
- MAX_BYTES mode: slices are created based on byte size, controlled via
  V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES

Clients can enable slice mode using the V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
control.

Patch 1 is a prerequisite fix: iris_set_stage() computes a work_mode
but never caches it back into inst->fw_caps[STAGE].value, leaving
buffer-size and clock-frequency calculations based on a stale value.

Patch 2 is another prerequisite fix: iris_set_stage() currently always
selects STAGE_2 work mode for encoder sessions, but CBR rate control
requires STAGE_1. This is fixed by forcing STAGE_1 when BITRATE_MODE is
set to CBR.

Patch 3 adds the multi-slice support itself for Iris HFI Gen2 based
targets (qcs8300, sm8550 and other SM8550-derived targets).
Support for HFI Gen1 targets will be added in a follow-up series.

This series has been verified with GST level testing.
Command used:
gst-launch-1.0 -v videotestsrc ! video/x-raw,format=NV12, \
width=1280,height=720,framerate=30/1 ! v4l2h264enc output-io-mode=4 |
capture-io-mode=4 extra-controls="controls,video_bitrate_mode=1, \
slice_partitioning_method=1,number_of_mbs_in_a_slice=460;" \
! filesink location=/opt/test_enc.h264

Changes in v6:
- Reordered local variable declarations in iris_set_slice_count() to
  follow reverse Christmas tree style.
- Renamed default_slice_caps_vpu3x to slice_caps_vpu3x.
- Link to v5: https://lore.kernel.org/r/20260724-iris_multi_slice-v5-0-4fb593d29b44@oss.qualcomm.com

Changes in v5:
- Fixed unbounded slice count under RC_OFF in iris_set_slice_count()
  for the MAX_BYTES use case.
- Addressed remaining coding-style review comments.
- Link to v4: https://lore.kernel.org/r/20260723-iris_multi_slice-v4-0-45f0a3fe7fce@oss.qualcomm.com

Changes in v4:
- Split out a new prerequisite patch (patch 1) to cache the computed
  work_mode into inst->fw_caps[STAGE].value in iris_set_stage(), since
  this fixes a pre-existing bug independent of the CBR change and
  needed its own Fixes tag.
- Deduplicated the per-target slice capability limits that were
  previously repeated identically across platform_inst_cap_qcs8300 and
  platform_inst_cap_sm8550. Introduced struct platform_inst_slice_caps
  and moved it to iris_platform_data (one level up from
  platform_inst_caps), since all Iris HFI Gen2 targets share the same
  encoder capability table and hence the same slice limits; a single
  default_slice_caps_vpu3x instance is now referenced by all Gen2
  platforms.
- Link to v3: https://lore.kernel.org/r/20260721-iris_multi_slice-v3-0-adc61a687e7e@oss.qualcomm.com

Changes in v3:
- Patch 1 (force stage 1 work mode for CBR RC): cache the computed
  work_mode into inst->fw_caps[STAGE].value so buffer-size and
  clock-frequency calculations stay consistent with what is actually
  configured on firmware.
- Patch 2 (multi-slice support):
  - Use inst->hfi_rc_type instead of the raw V4L2 BITRATE_MODE value
    when validating/deriving slice parameters, avoiding a mismatch
    between V4L2 and firmware rate-control enums.
  - Round up (instead of truncate) when computing the minimum
    MAX_MB and MAX_BYTES slice size floors, so the hardware's
    max-slices-per-frame limit is never exceeded.

Changes in v2:
- Added a prerequisite patch to force STAGE_1 work mode for CBR rate
  control on the encoder, required for multi-slice encoding to work
  correctly.
- Addressed review comments on the multi-slice patch (updated commit
  subject and description).

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
Sachin Kumar Garg (3):
      media: iris: cache work mode after computing it in iris_set_stage
      media: iris: force stage 1 work mode for CBR RC on encoder
      media: iris: add support for multi_slice in iris encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 91 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 33 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
 .../platform/qcom/iris/iris_platform_common.h      | 16 ++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 17 ++++
 6 files changed, 159 insertions(+), 1 deletion(-)
---
base-commit: 42f83a32259a82c4481d3cccf560c3bfeb32c892
change-id: 20260716-iris_multi_slice-5647287a9563

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>


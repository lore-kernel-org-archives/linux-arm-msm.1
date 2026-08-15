Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CB5387345
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 19:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786821758; cv=none; b=sAFZyT5KsLTz8cxei+9sh8v9rgKTuzkpxyttNEXqyaG1yFgTlpBZj1w4pLJs0Kdf+GDD+KclMrGZ64UXx6FGCSGPSiQ43uZ5rQ8j+1c+ub8PC0GIiN9a2NZG1Dlz9kgh9JterRDy/ss/vB79GlzgfxMFllqNRl6gQZHiP7MQWyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786821758; c=relaxed/simple;
	bh=h/hrq8tlOmQSxbosQzmao/buysKRFdIVJfpNMxLFuHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+5b/u/oslDJ2ZfJ/sf46H799M+Zno+6WQPJrIrLmvKKr3L0O9xZQPpTQkYhKfDEyyfLAQV7omzAfp+dSdj1w9yWKy3++CrVtrL6NwKe0kvAj1houMQqG3Cl/lYsix7C3p0oZQCB4EMcPpEAlpLuo05xVFc96X5PWptIVj1ULvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgENgFTq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=be1Zj2tW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgENgFTq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="be1Zj2tW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FGTPR0949237
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 19:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kynEncYcQcGr44kGwirSobo5ocnqiYKg4uPy9Ir/qM0=; b=JgENgFTqBkrVZ4pQ
	10rJ1iCkiWGE0AEFHWfdBuyC7h9J2zvpGP4y7MQDksjmhaqfXHRlzR+egk9nR163
	Q1e8PwFp6HhlKmTE8CWChLjk6SH62btKVcPcdAxqqY5aw1MEeeHQO0AZEjctOdUF
	p7Kgbt4byJERUj0AapTNRQukeTNpPBhJwm6S92xf9TV0hEi5oU9z/p6A5bH95nem
	/2k83EFhPjl2Cm3Eg7GMktIC86ChV5KyFwJcJ3w2cEaFw5ur4zh+pX9LgJJ9PR54
	YMbp93pCxEPf5uHA5DkJZF4oU7uGfWIajW2bznjiZZrEYIES8Gc4XmnHi0ca+NjO
	IXT4Pg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghf1tr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 19:22:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf2308ef97so3092885ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 12:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786821753; x=1787426553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kynEncYcQcGr44kGwirSobo5ocnqiYKg4uPy9Ir/qM0=;
        b=be1Zj2tW3o3KVoUqhs2JWtKpBbz50aen80/LnjOEkKXG8jaE1fSBc05NsLKeEanHit
         YBNXzmTxpmrIAeNtXrLT+1EnuI1nG/ll8X/p75lKrmfaOGTJ6aIZbPoXR80i45ZQ9ck/
         Nbj/WVQ82p+nqryoVJISknTBHsb2Upog35MOq7SkyQLXp4wrNj6zktrPRDFPW0BmLpjT
         yeADaExnKmUaC2RQ1B74teHcy2rN4uomhSEHWGfYYGiSSzYe7I9tge1bgGgRyuH+aWh/
         HXpHGkhLfSn0eAkUUFM8ZN9fx178SSNOEuoWJEtczevKQCdGym4I5zQNkUHKbhKg8+3W
         IdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786821753; x=1787426553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kynEncYcQcGr44kGwirSobo5ocnqiYKg4uPy9Ir/qM0=;
        b=mnEDBzpqwodDpd7uevVnotfxq0Vt5sA8Dc0BWGg9ZvxBLILehsm+u6sfj2ZpYFQA5B
         7Biy4YeHGRvcnOTFmcktTvXZMP0oSWO66hg7Fa02HUhpOQ+s9AMMtOeKLn6udE5uXPWT
         bFokrPZGldFEG1Q/j1Mk7tXbs+Jq51jntLA8hWutBmp7YAoALHs2jsgvfD1FSXSkDXT2
         h5M9WudZ3k/TSnzA3ebMNLv1jDrPYf/EyYosbovMzFzNPK1oNSbggnzO3jE44LQnYV5C
         a2fRpjjo3MlU9HIoKO/5MJTxcG3idE1ZFKRKbaMqG0kGCzH+4G4O02OnIbzQjR5kWYb/
         RraQ==
X-Forwarded-Encrypted: i=1; AHgh+RpfP261opxux5+oA8aWFgMoODCdS02PKyBbNvaWg5sW1f1YbWGnuPub3ZhEEkKUP3eXXEHPS5NIxZu4UQap@vger.kernel.org
X-Gm-Message-State: AOJu0YxEQf67FlPVXYI4sWD2KAB2ZKLvEk4yvfgEHqheIEAOpz8KljW2
	x+muQDC764L3k65BTcacqXzmcwTwY3RjK/nWvt4tQgSp18VI9XQfXgcHrgeSjle/i/aNSYlF4Gq
	3bDc6u/bxXm1BKCzoEbpg0lLbMqizc/WeOvxBkX15DANwEUaYql8k4avdJYo5QGUpZS/b
X-Gm-Gg: AR+sD11vOVwR4P5SnIr9S8hyQKUEJNKrKM7xf7AJxLS4xZQm+DWelz6KvNEXK5t5kRX
	jL3tiHPxWbobCgAWvxiLOl0XbQBBlUC6CwRPBJGQBeMOb1/WGGLb7cfk7y5tGneM+8RCSC+bH7x
	TtYu9vP1kd74gtVq8eoxi3GrWDzyDssUL3QNqShq1GuzHnqzl+Z9dCt5bg3dAuyJdVUANxQ5p8w
	la8QFlMlFzuFwVZ8klICyfLpYS1HLEVJwFd79pBbx4Wp7xNvdwpoVziHg8obQWZFqfj68jvh3Xu
	sNdPjxktKtFZIF41gIbswWcWDBke47KZhW2jMvP408sR+PDgdwUyHqWV2N6IiP2rE3gDNTm8z0z
	fgbMv2NMeJFWMhqlSA4WAC4bg+w+13fjVzf8ATvl0n/M2j+SoSQcAwHBx78GE
X-Received: by 2002:a17:902:e805:b0:2c9:fbde:ab68 with SMTP id d9443c01a7336-2d3b0ea0392mr114160795ad.3.1786821753330;
        Sat, 15 Aug 2026 12:22:33 -0700 (PDT)
X-Received: by 2002:a17:902:e805:b0:2c9:fbde:ab68 with SMTP id d9443c01a7336-2d3b0ea0392mr114160445ad.3.1786821752846;
        Sat, 15 Aug 2026 12:22:32 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e1cccsm15889350eec.8.2026.08.15.12.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 12:22:32 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Sat, 15 Aug 2026 12:22:25 -0700
Subject: [PATCH v5 2/5] media: v4l2-core: Add support for video encoder ROI
 control
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260815-enc_roi_enable-v5-2-ded944f0fc7f@oss.qualcomm.com>
References: <20260815-enc_roi_enable-v5-0-ded944f0fc7f@oss.qualcomm.com>
In-Reply-To: <20260815-enc_roi_enable-v5-0-ded944f0fc7f@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786821749; l=5504;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=h/hrq8tlOmQSxbosQzmao/buysKRFdIVJfpNMxLFuHU=;
 b=IyBDgddy+CnXftBn0kIZAqcQoki+kDNIRI9aVpR/k3kq0/z7Psf2I2xpgbx+oLVXKUPts9scw
 YCbj27a4mltAwx2csNAjrAAxuTVsjtR701qgLLT1zk4hqtQn5+e5N0s
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=QsVuG1yd c=1 sm=1 tr=0 ts=6a80bc7a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hEAr28SmMdMltZAvPKQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ZCHjlZS7NKuTCqMY9xvsTgP53xeDP3YI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDE0NiBTYWx0ZWRfX71YroYoJN88k
 a/lMfc3RtBaOs41J7MuE3YpX7mkHszxNQFmG2tlgDroZzB4VP5L4RSC1TeWTVL+/3FV8b0RCVjb
 0xJAglzoUNVxHfmcasMlB8CUC1oLPys/v4sLhjfAf3fW5/B6sNjEwX1myoaFbja1UJ99wzqdDob
 DN4z5ApzAxYqxmJ5OFeOa50SsyTf0Hbet+bphFRrJxnwAdQLY6CkZQiLBUYHVMthgSDokmRFvX2
 7asOH51NKsBxjKd06vNpvqE455IYiKLf/CE7Q3V37mpR73GDEdK5Sf/bt3mnsSfvdIfQJ1a95HQ
 Zc0LPO+mFWyMF7Kci1XnFmZ5f3dGPq7xgKzSrZNfvAF3NNOj/GwjSJMRKzaO+kIZGZnRESSc5Vf
 OTRoN/DlJrPWv4CjzZWOmRSuZTndvHcHXhMePzcVa98MBv0LwVxUjCTzoGyErWg4ztlUnJmu3gf
 +mThoj97HB/GszXdcyw==
X-Proofpoint-ORIG-GUID: ZCHjlZS7NKuTCqMY9xvsTgP53xeDP3YI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDE0NiBTYWx0ZWRfXxPNYOJdkV85d
 8CvskKqq9u2Bn0BQbod9Idfm2zhnJ8eLO0zzrYy1MU2F8UjR+fAGYOempJIBVrQ2AXVJTw2358I
 yci95fDS/hScCtOMNYWxbXjx9bo28x8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150146

Add necessary support for controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c  |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 23 ++++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 10 ++++++++++
 include/media/v4l2-ctrls.h                |  3 ++-
 4 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 93d8d4012d0f4fef004e417d0aee2ae44b1b30bd..7d41cfd7378baaa929d4da0266c45f731bb54285 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -980,6 +980,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 	case V4L2_CTRL_TYPE_U8:
 	case V4L2_CTRL_TYPE_U16:
 	case V4L2_CTRL_TYPE_U32:
+	case V4L2_CTRL_TYPE_S8:
 		if (ctrl->is_array)
 			return -EINVAL;
 		ret = check_range(ctrl->type, min, max, step, def);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 5b8a594fb9e24e16128c9c763a3b1dd311fad2ba..db6577070ebd2eb6a60599b3b2394fe128236705 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -290,6 +290,14 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
 		}
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		if (value) {
+			for (i = from_idx; i < tot_elems; i++)
+				ptr.p_s8[i] = value;
+		} else {
+			memset(ptr.p_s8 + from_idx, 0, elems * sizeof(s8));
+		}
+		break;
 	default:
 		for (i = from_idx; i < tot_elems; i++) {
 			switch (which) {
@@ -370,6 +378,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_U32:
 		pr_cont("%u", (unsigned)*ptr.p_u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		pr_cont("%d", *ptr.p_s8);
+		break;
 	case V4L2_CTRL_TYPE_AREA:
 		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
 		break;
@@ -1397,6 +1408,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		break;
 
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1410,6 +1423,7 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 	size_t len;
 	u64 offset;
 	s64 val;
+	s32 tmp;
 
 	switch ((u32)ctrl->type) {
 	case V4L2_CTRL_TYPE_INTEGER:
@@ -1435,7 +1449,11 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
 	case V4L2_CTRL_TYPE_U32:
 		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
-
+	case V4L2_CTRL_TYPE_S8:
+		tmp = ptr.p_s8[idx];
+		ROUND_TO_RANGE(tmp, s32, ctrl);
+		ptr.p_s8[idx] = (s8)tmp;
+		return 0;
 	case V4L2_CTRL_TYPE_BOOLEAN:
 		ptr.p_s32[idx] = !!ptr.p_s32[idx];
 		return 0;
@@ -2030,6 +2048,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_U32:
 		elem_size = sizeof(u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		elem_size = sizeof(s8);
+		break;
 	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
 		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
 		break;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index e062f2088490470c42d6c579ff7675be454a29b0..8f895060799ea13443143edd398dfb97f4ba0085 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -974,6 +974,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:		return "Encoder ROI MB Delta QP";
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:			return "Encoder ROI MB Size";
 
 	/* VPX controls */
 	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
@@ -1622,6 +1624,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		*type = V4L2_CTRL_TYPE_S8;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
+		*type = V4L2_CTRL_TYPE_U8;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index a1806ddbc797efa52e83cd3f685ef70d5b5483d2..9a68a3555e349f1e55aa01af5c10f08201d62bae 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -27,6 +27,7 @@ struct video_device;
 
 /**
  * union v4l2_ctrl_ptr - A pointer to a control value.
+ * @p_s8:			Pointer to a 8-bit signed value.
  * @p_s32:			Pointer to a 32-bit signed value.
  * @p_s64:			Pointer to a 64-bit signed value.
  * @p_u8:			Pointer to a 8-bit unsigned value.
@@ -61,10 +62,10 @@ struct video_device;
  * @p_const:			Pointer to a constant compound value.
  */
 union v4l2_ctrl_ptr {
+	s8 *p_s8;
 	s32 *p_s32;
 	s64 *p_s64;
 	u8 *p_u8;
-	s8 *p_s8;
 	u16 *p_u16;
 	u32 *p_u32;
 	char *p_char;

-- 
2.34.1


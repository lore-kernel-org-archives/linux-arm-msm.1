Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C702340BCAB
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784884185; cv=none; b=b+yLKJ1IKn5Z+0RWqtTT7nqJ39gctBy/0+kIZh5DuxGZWxpbqs++WMUPGqLUUzwol+28q5PRvi2SqkybYP2qXTFoKGEXWqdXiHyKEgBzyLoA9H47zbYk6cYtAYvCMO4KJODL9yi7UsUBKh40bxrDxR0k2YqTt43T9qPnutixz8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784884185; c=relaxed/simple;
	bh=PqwxDucZXdsz/HqCh2Q4NqD9sV0/hZDBckg40ADfDjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5rL999ugKhtIHRlupZIkSTsATlUPJLOXd5RK0pfYRxxLSe1fuch1A/QKHHzjb+QTEzqwXK+jHoqJzXU/NO6lPjqAMN948xgjcN0IV+8pKYHgtgxNAXpyycYfVxwiT3XiDq7g0jqI1qZopdAMJa6/mWkS2d+7lNThEU2egG8pvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNLOFRec; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DqycvvFv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNLOFRec";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DqycvvFv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O5xRlu1892434
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T3R2RrInhdvmVACMUa6IozYiCgqEHfiEvruhwJfozNE=; b=gNLOFRecm/blEsXJ
	LgswQnP65jM0vJWg62QK2aBh5sin4J/w+PX9u7bSFJ7LFnGKuD83SrpET1YBDnc/
	kFm4FNhgOuA7K34qPNRaX/UTJkLsgtxgagZCpC6A2nDfUzrTyhV47Gjm4p3EWhgP
	X/TEtFJxL8qu18Or6mFGSHmGKiIMKLNA1S5+u1ig0geOqCA9lh3GQqBXUFKev/Mi
	7VHQWj3AOnKYF844w+ekW3iH/mDmfzQl2lpbVhBDn/Vek/vgXWvnZvHC7xORekvp
	p8nDxkhtavcFEy2iyqwvMh7EJX7JGrM5wjW5RcadOaScpZZpCtgrrTrkkY1u2MO5
	pSVIUw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx8pue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:09:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so395430a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 02:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784884178; x=1785488978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T3R2RrInhdvmVACMUa6IozYiCgqEHfiEvruhwJfozNE=;
        b=DqycvvFv/u/9b6iTlnKEbO4nxAAp4QSQdrVwBEoZG/FwDhGxHUrQWMPjzM2AMOVqFv
         CU1wS3WnJ8KY8lcbo2cLop4AvcbfwEU0TggdbczJJsiJsCqtAGakST7grFHRCiVRmq9t
         7xB6mESBMRBC6nRBlQaIXe8oYMmEK9SjQOC11UE4Ty6hdViUYVh4XHtu5Q5fuemxHe+F
         9hAwDKXifJUfrwi/26gaJ+C8Z5sfqqjl0bUSWfSthh/k46rPdNZFloedWep4nbfrfn8Y
         txZnsQoqm9qDnWQSD4CXQyicylUldGJjw1riAgU8ih9j8HkCqeQ7fCBVEqTIOXKR5qV8
         3VJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784884178; x=1785488978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T3R2RrInhdvmVACMUa6IozYiCgqEHfiEvruhwJfozNE=;
        b=T9f+KEMlVNmiXXXWEjYeBuEi6QIYBkq9II5OizQAoVQwk04G5XVuC/lxpirAFewo5V
         61GVOSBP06v6zdTEb5zC9Zi7OWcftwTSjdpksH8zfjJ5SZ95jXptoeq9VFEhzkku9p+c
         8VD7mz2YGe5A6IGjVjtcYbg4HRuoBHJITlMg9AbwrdFBQb8KQsc+svHU/9uWNxjnD1JV
         cF2IPrmjbF1+65L7ZYqDAZOhvfyhcF+w5dBgAxVkilKB3K3IES2eMUibA7kMOgHmMcUI
         r59Ni8HDjIsjScuInQcSadb1ijerz1Vy4O74D2dXZgejmVzg96X1uwZBHHTdB/WGVxEk
         vp3w==
X-Forwarded-Encrypted: i=1; AHgh+Rpe9Qw2LxDUg8cLOTHl/DxKdErW91Gilkyp/JWSxJeJZmbfIpHNspf4mIbbuBLiXn2nf6hT83Xl6V1XEfHQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzrvjBdNjnF9dAJaZ16OWzIXAlDs2q+7f/D2xWxPAOYw5M+HC//
	Bi1/6Hl+TscI7vd8lpfGYS3sI5JBawvTHmpfv/o075bC3oG2cQhFFn/CJNEqxRQZW4rDmBpO0u2
	Zi1VJQfWh8uyd/TDgAeY6sEEPNyDv6mfHBh4+SwXWaeMBDUeO9E87T3CL64LgjGflKQLSZeRnyt
	X9
X-Gm-Gg: AR+sD1019hxBV642eEi2Z43rDVgtNVKVof3is9sFWCPwPTiBo1je8HrTxYNapPdGC4y
	RSWwplNFXzXwYrlimLgcbB8hHw7EUz5riGrFKH0v5sxTAdDQW8uSUVX/MoZFvFSQWmOWHNeiHij
	wtiPffwEKaTrbptN73hX9WACqZr3n1fdyyQs64HwWjeP4Q+/kzyMlUSCbGVX0JLf0FjraYQ42CY
	pFy5p+Ta/OAYYOxbFHqe21EwAWWZ5UWx9fOw/M2EGMb4QZ38lAAa25c2CUplElv5xitL/CCEQYZ
	R+Gf6tH60xz5Iteg3emhAZC5sYNKNG2bJoY6U4xeCJCR6JJjN7/vz2amfe2yXoBaDXaQRRN7f/k
	3kTV9zFHzYYToFRiTZ4bstv3lk2/rbdE=
X-Received: by 2002:a05:6a21:683:b0:3c4:397a:69b8 with SMTP id adf61e73a8af0-3c44afe7510mr7548651637.21.1784884178072;
        Fri, 24 Jul 2026 02:09:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:683:b0:3c4:397a:69b8 with SMTP id adf61e73a8af0-3c44afe7510mr7548609637.21.1784884177609;
        Fri, 24 Jul 2026 02:09:37 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a6adsm27170719eec.6.2026.07.24.02.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:09:36 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:38:59 +0530
Subject: [PATCH v5 3/3] media: iris: add support for multi_slice in iris
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-iris_multi_slice-v5-3-4fb593d29b44@oss.qualcomm.com>
References: <20260724-iris_multi_slice-v5-0-4fb593d29b44@oss.qualcomm.com>
In-Reply-To: <20260724-iris_multi_slice-v5-0-4fb593d29b44@oss.qualcomm.com>
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
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784884158; l=12723;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=PqwxDucZXdsz/HqCh2Q4NqD9sV0/hZDBckg40ADfDjU=;
 b=8BSV8sbjNsBcsVfnJ9g5sMVTcpN/6fGcEU9WgLZFZI8bN3+4587Ob5nRc4knefGUlWdM6MhYU
 i2rb+WYqBBbB9gEjcrHZkpQQW+j4W1Dchn6xzOHBLxGA5cKGK8a3553
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-ORIG-GUID: hQXAVfzY8isgF1h6DHhKd9BDohnRY5_3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4MyBTYWx0ZWRfX04BzE+V95NlO
 6/3F+L0BnU8sOC7xm7xpLKND+rWKBlNEleJn1XlWHiu/XD51cndYXWvqkHaw+uZUITogZ56m0FH
 5Jb84/SndtDKY358xs+Caz1DJ54Q7oAc0n91LPKCjVCLrpdM3YOjWa8kf2NKTJLbX5imT13Z11D
 U17/sENVkSMxHmFzR8ngfIqNjjkuGYxrJgi40Wb4bj4Jt7iLd88WJjkBealuu7uqnvUn++x/ud+
 0TPnCC0yhuh5DRyfHQJ6oDuAWQi45sWxVHyedqR5clW75UvzEMLmfnOiJijZtKQkxnaMWP4/XT2
 5gHlOCwddHGr64DeNCIkd1YPxNgZ4adt3+Z+9gTihUvJceu+S3KiOvkSVSVSW9YgcvPJJAkRsM6
 wXCnLN/7/7vNS0V+AlveaOZq/O8HpqfSefvsa4WD4M5W4l5kqBAZ7mL4YR++8vO4tBP6t0Hz2Pl
 DexRS1590X9LdT/CdGQ==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a632bd2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZIa84HXPZlRSj4Il7NUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: hQXAVfzY8isgF1h6DHhKd9BDohnRY5_3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4MyBTYWx0ZWRfXxUAT2zY1lfa4
 772Vwl55+B0L3AOwNsskIAaL8to0d36ADPFOao3ixL5s26Wp0sHr8/GH3o1fSKyjWLlRKYJxnN+
 zePVT5ZpiywErrMcdzCYYpOziZfjZsY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240083

Add multi-slice encoding support with MAX_MB and MAX_BYTES modes.

Clients can enable slice mode using V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
control and configure slice size via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
or V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES controls.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 86 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 33 ++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
 .../platform/qcom/iris/iris_platform_common.h      | 16 ++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 17 +++++
 6 files changed, 154 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index d7cbf6c3614a..955f0e56dbf9 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -154,6 +154,12 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER4_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
 		return LAYER5_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
+		return SLICE_MODE;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:
+		return SLICE_MAX_BYTES;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
+		return SLICE_MAX_MB;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -297,6 +303,12 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
 	case LAYER5_BITRATE_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
+	case SLICE_MODE:
+		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE;
+	case SLICE_MAX_BYTES:
+		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
+	case SLICE_MAX_MB:
+		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
 	default:
 		return 0;
 	}
@@ -1482,6 +1494,80 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 					     &bitrate, sizeof(u32));
 }
 
+int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	const struct platform_inst_slice_caps *slice_caps =
+		inst->core->iris_platform_data->slice_caps;
+	u32 slice_mode = inst->fw_caps[cap_id].value;
+	u32 rc_type = inst->hfi_rc_type;
+	u32 fps = inst->frame_rate;
+	u32 output_width = inst->fmt_dst->fmt.pix_mp.width;
+	u32 output_height = inst->fmt_dst->fmt.pix_mp.height;
+	u32 mbpf = NUM_MBS_PER_FRAME(output_height, output_width);
+	u32 max_width, max_height, min_width, min_height;
+	u32 max_avg_slicesize, hfi_value, hfi_id;
+
+	if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) {
+		dev_dbg(inst->core->dev, "slice mode is single slice, ignore setting to fw\n");
+		return 0;
+	}
+	if (fps > slice_caps->max_slice_frame_rate ||
+	    (rc_type != HFI_RC_OFF && rc_type != HFI_RC_CBR_CFR &&
+	    rc_type != HFI_RC_CBR_VFR && rc_type != HFI_RC_VBR_CFR)) {
+		dev_err(inst->core->dev, "slice unsupported, fps: %u, rc_type: %#x\n",
+			fps, rc_type);
+		return -EINVAL;
+	}
+
+	max_width = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
+			slice_caps->max_mb_slice_width : slice_caps->max_bytes_slice_width;
+	max_height = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
+			slice_caps->max_mb_slice_height : slice_caps->max_bytes_slice_height;
+	min_width = (inst->codec == V4L2_PIX_FMT_HEVC) ?
+			slice_caps->min_hevc_slice_width : slice_caps->min_avc_slice_width;
+	min_height = slice_caps->min_slice_height;
+
+	if (output_width < min_width || output_height < min_height ||
+	    output_width > max_width || output_height > max_height) {
+		dev_err(inst->core->dev, "slice unsupported, codec: %#x wxh: [%dx%d]\n",
+			inst->codec, output_width, output_height);
+		return -EINVAL;
+	}
+
+	if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) {
+		hfi_value = inst->fw_caps[SLICE_MAX_MB].value;
+		hfi_value = max(hfi_value, DIV_ROUND_UP(mbpf, slice_caps->max_slices_per_frame));
+		if (inst->codec == V4L2_PIX_FMT_HEVC)
+			hfi_value = (hfi_value + 3) / 4;
+		hfi_id = inst->fw_caps[SLICE_MAX_MB].hfi_id;
+	} else if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
+		hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
+		if (rc_type != HFI_RC_OFF) {
+			max_avg_slicesize = DIV_ROUND_UP((inst->fw_caps[BITRATE].value / fps) / 8,
+							 slice_caps->max_slices_per_frame);
+		} else {
+			/*
+			 * No bitrate target exists under RC_OFF, so approximate a
+			 * worst-case frame size the same way size_bin_bitstream_enc()
+			 * does for buffer allocation, to keep the slice count bounded.
+			 */
+			max_avg_slicesize = DIV_ROUND_UP(output_width * output_height * 3,
+							 slice_caps->max_slices_per_frame);
+		}
+		hfi_value = max(hfi_value, max_avg_slicesize);
+		hfi_id = inst->fw_caps[SLICE_MAX_BYTES].hfi_id;
+	} else {
+		return -EINVAL;
+	}
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &hfi_value, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3c462ec9190b..5a73c7c49d36 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
 int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1..fcbebced05c3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -12,6 +12,8 @@
 
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
+#define MAX_SLICE_MB_SIZE         \
+	(((4096 + 15) >> 4) * ((2160 + 15) >> 4))
 
 static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
@@ -937,7 +939,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_layer_bitrate,
-	}
+	},
+	{
+		.cap_id = SLICE_MODE,
+		.min = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
+		.max = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) |
+					BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) |
+					BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES),
+		.value = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_slice_count,
+	},
+	{
+		.cap_id = SLICE_MAX_BYTES,
+		.min = 512,
+		.max = BITRATE_MAX >> 3,
+		.step_or_mask = 1,
+		.value = 512,
+		.hfi_id = HFI_PROP_MULTI_SLICE_BYTES_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = SLICE_MAX_MB,
+		.min = 1,
+		.max = MAX_SLICE_MB_SIZE,
+		.step_or_mask = 1,
+		.value = 1,
+		.hfi_id = HFI_PROP_MULTI_SLICE_MB_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 776b21cd11b2..226894b99dcc 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -71,6 +71,8 @@ enum hfi_rate_control {
 #define HFI_PROP_MIN_QP_PACKED			0x0300012f
 #define HFI_PROP_MAX_QP_PACKED			0x03000130
 #define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
+#define HFI_PROP_MULTI_SLICE_MB_COUNT		0x03000132
+#define HFI_PROP_MULTI_SLICE_BYTES_COUNT	0x03000133
 #define HFI_PROP_LTR_COUNT			0x03000134
 #define HFI_PROP_LTR_MARK			0x03000135
 #define HFI_PROP_LTR_USE			0x03000136
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc..ad9f2b20cd90 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -88,6 +88,18 @@ struct tz_cp_config {
 	u32 cp_nonpixel_size;
 };
 
+struct platform_inst_slice_caps {
+	u32 max_slices_per_frame;
+	u32 max_slice_frame_rate;
+	u32 max_mb_slice_width;
+	u32 max_mb_slice_height;
+	u32 max_bytes_slice_width;
+	u32 max_bytes_slice_height;
+	u32 min_hevc_slice_width;
+	u32 min_avc_slice_width;
+	u32 min_slice_height;
+};
+
 struct platform_inst_caps {
 	u32 min_frame_width;
 	u32 max_frame_width;
@@ -183,6 +195,9 @@ enum platform_inst_fw_cap_type {
 	LAYER3_BITRATE_HEVC,
 	LAYER4_BITRATE_HEVC,
 	LAYER5_BITRATE_HEVC,
+	SLICE_MODE,
+	SLICE_MAX_BYTES,
+	SLICE_MAX_MB,
 	INST_FW_CAP_MAX,
 };
 
@@ -315,6 +330,7 @@ struct iris_platform_data {
 	const u32 *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
+	const struct platform_inst_slice_caps *slice_caps;
 	const struct tz_cp_config *tz_cp_config_data;
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 2c63adbc5579..6e44bed5ebff 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -12,6 +12,18 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
+static const struct platform_inst_slice_caps default_slice_caps_vpu3x = {
+	.max_slices_per_frame = 128,
+	.max_slice_frame_rate = 60,
+	.max_mb_slice_width = 4096,
+	.max_mb_slice_height = 2160,
+	.max_bytes_slice_width = 1920,
+	.max_bytes_slice_height = 1088,
+	.min_hevc_slice_width = 384,
+	.min_avc_slice_width = 192,
+	.min_slice_height = 128,
+};
+
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8550.h"
 #include "iris_platform_sm8650.h"
@@ -110,6 +122,7 @@ const struct iris_platform_data qcs8300_data = {
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,
+	.slice_caps = &default_slice_caps_vpu3x,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
@@ -139,6 +152,7 @@ const struct iris_platform_data sm8550_data = {
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
+	.slice_caps = &default_slice_caps_vpu3x,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
@@ -176,6 +190,7 @@ const struct iris_platform_data sm8650_data = {
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
+	.slice_caps = &default_slice_caps_vpu3x,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
@@ -205,6 +220,7 @@ const struct iris_platform_data sm8750_data = {
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
+	.slice_caps = &default_slice_caps_vpu3x,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
@@ -240,6 +256,7 @@ const struct iris_platform_data x1p42100_data = {
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
+	.slice_caps = &default_slice_caps_vpu3x,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 1,

-- 
2.34.1


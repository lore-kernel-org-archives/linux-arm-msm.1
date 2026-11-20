Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218314;
	b=4FCdOePM6Vn1Jq74hUw1b0GjG3byagMHpUlfaDdRss6X5gwjbsQKm1HW5jsy5pF7tVRm
	 W8cqNFMG5waiF1UJhLxzRZALBrQQeFdpcvt0Ph/cJoRp7NYphuBUBH6++Mjezd80dhF+T
	 d+w8vhK20Tmn8xDMYQRSovUpIlS62xLleC+lwqHUcsI2LYChXVwcyg11Ac73O3D/U2XIp
	 gX3SBjcFkNm7NJfeVR3LniI15moe/lNbVGFHlRiGIKqy79tJ7sUfRCYRzsKMqbGsn61RA
	 IgPrQDX68OJpLFCT0hWlmdgRqloVRvsvoyFBYH8en4CC1qaHvTq4g02dfKkuHqTbz2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218314;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nkyE659lzmHmkedIaFTPtXRPbQd0UeH/8KjUFYs797g=;
	b=je+j9NPZ14w5FxmHVxHrI+qk7QNr9i0ualtovMuam4eF+Y6jwaql3zov1UlbBzoRvRz4
	 4OK0SP5beRZIEgct7skJTNRt8VqQ/cTsDTkTxR447ZVnHNLCg6NTFyC8vEXT5iK9YyNNu
	 NttIksPOHyNkY7QuNzy4N06satxz2cVNlu50NIZHCqpvo95LEmBQnHoo9lDLFM0PsFXhR
	 LGVw1MDv0nM6VlGCg5IlUIJf7BcT2ZYiWznOYOoZy+7ft7QullioHcgln+234fK+PxSQU
	 9myHwLrW4Y18elsfuwMbcIr7l7Yx2EEiUHzYnd2gag19CfV8nosX9zIpFB30mT0UzKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O25vZfSa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P0s7V6sF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E89C606A6AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 23:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E89C606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O25vZfSa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P0s7V6sF
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKMTwxq3058136
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 23:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkyE659lzmHmkedIaFTPtXRPbQd0UeH/8KjUFYs797g=; b=O25vZfSaUb7aiZDF
	GFY3BPqk56ykBYCj0q3JgtlXszyQjbcELsylZjCqL7OQM27YUEr1qllcjdJyvHQs
	YeOD9ceODeTrYBucdcmEals7dk2FN3BWoc1xVeIuUOxjydO9E3LYeKomyfZAsMW4
	BXxKpr6Pu3fBPam8HctmIpa2YiLebTAvwBoQA06b+x9e6rDGSDf5TpnkIrGsUlJz
	/gOzaj/V9oX2iIcgOmrQQMRIMQFPfqnd8hlQ/B1xbkl6x4jBImX6u22vdQvC5uUr
	3HrI3zGfKRArXn9Ir2JtBlfIpFZNxJs+5bJYZZuvCaiVzNHmgEbNAiJZklR6nFXM
	Dr57ew==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2y2986fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 23:45:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383f2d06892so121383eec.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 15:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795218309; x=1795823109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkyE659lzmHmkedIaFTPtXRPbQd0UeH/8KjUFYs797g=;
        b=P0s7V6sFEjgsnhT8zQ4mLssICR+VnMbhKVkBzt4mqu2UOVc50a25ikxqHR47odDnJ0
         Lk4Vbsw0gedtPIobQ+8irfcES7QOado1YQ/uMMe+uJlMGqlzSL5tVZFFDh8kHmTcFfvU
         yYUNLsxpJnIlNdfhhNVq2bU+AJEtLu6dmDcsGPMPED7OgvITCK2vrLKY+qf3/41ftIqW
         EBYMZjXvbXia3eN1VkQZPnYFPpymCF9bNONwyrSxQ7F0tLfWIUk9+dc2LDAYHN6OczJo
         xVHgnkTpBlAD8LT+CgYjfZ8AE3aZZCnXcDEjDeEWFhZYRnoS2cBfuWsM8shFZCMZx5zC
         CGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218309; x=1795823109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkyE659lzmHmkedIaFTPtXRPbQd0UeH/8KjUFYs797g=;
        b=kuBrbohyt0QWaoL4NlMRlE1sGFWqbqvNuXhWlMzGFERmu4p89gnhEaBrszL3yhl0xU
         OxsrdpQSAdu6MRLm2l+OO6o9sHhUKIxlPZ65lVew/cfFe3k2lOewzJPi/ffeMocmo5DJ
         xmlVdHN8FwwjmRApbOyKQhPphj4rFsaoX714sA0flGjwjdShwhZL3c3BBIgjjfa94dkw
         ymuz9h1A019r2XkIC7hTi59wXRq/L1iW7Me6HpYqXbE6q8LMCXRCAc/W51NeJT58Z5y1
         AXexmpaFJd3i694PFiae0UJYBDi7oC8aLoPMiMBziunmiAoq9+fPVfeuFIp9QC+OmiwS
         M2Tg==
X-Forwarded-Encrypted: i=1; AL+hErFZDCh6/T3JWv/aSvO4M9jBrCf15XXA0cXyrPVrJULqKfuzi8zTsxuDRLGHxZS+njMeNeo8Uf3ucF4v4h1Q@vger.kernel.org
X-Gm-Message-State: APuU4Z8KirAw5c0udOYo6C7zRvnU3+CcurydI0rHWNTIR09RIzggl/WA
	GwKAbTPgMDBPGvAJWSpD4NycC487BHrTXbz3khgVKetVwvkcAnylNq/6fsYkcQq1bGO04a6E+QA
	SCeafqX3ocXpv+GwrK4cRz+owB8o0HKP09gbx+RghhzifMJYImECylNdYZL4lo6w/x2Od
X-Gm-Gg: AZFdTZeALL+qt7jU1eElcxw2xwtGkIi7CsD2cCJgYM8D8pUSOZzmAyLSC8fdfazK+Yi
	25MDLi+ufmx+TD9JalZCAZZ1W3HGHSPZHPfWcbq6EoLHiFOxsVcW8D4pKsaZ1zzOThfvsuPnTLa
	uyJpss6E9Gs02WfnuZakIF6eZLz9NZoKqKhuXh45Be/EZWPSPWqQXi/jqEu5gx/0woI3SINi3rr
	J22IeDYG6QYqv15m444+cqx84td8TL1FgBhrMgjOK10zu//GiMV7/A9YPNuUkB8G3/y3WCdOocm
	OqgkrsyrtJd+X9x5VUb3/z/t/6pJP/cuFt2+4Kmo6BhSmYfJGhJGHfnm3UYTxWzotB+AfeduJID
	xQdyK/HifGegLTeSpmv6Fp32CA77X9ehWWRzE7miJl854hlEizGJkdaGWQVZL/i5aqtOV7ldLcl
	RTLPbigo+LDezyQT6AjnwSqAnY75QielPdEQ==
X-Received: by 2002:a05:7301:d80e:10b0:381:dc3c:4c16 with SMTP id 5a478bee46e88-3856925c041mr5776472eec.0.1795218309252;
        Fri, 20 Nov 2026 15:45:09 -0800 (PST)
X-Received: by 2002:a05:7301:d80e:10b0:381:dc3c:4c16 with SMTP id 5a478bee46e88-3856925c041mr5776432eec.0.1795218308609;
        Fri, 20 Nov 2026 15:45:08 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm14669862eec.4.2026.11.20.15.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:45:08 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 15:45:04 -0800
Subject: [PATCH v11 3/5] media: iris: Add ROI delta QP control support for
 HFI Gen2 encoders
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
Message-Id: <20261120-enc_roi_enable-v11-3-c00b95ea1b81@oss.qualcomm.com>
References: <20261120-enc_roi_enable-v11-0-c00b95ea1b81@oss.qualcomm.com>
In-Reply-To: <20261120-enc_roi_enable-v11-0-c00b95ea1b81@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795218304; l=7490;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=8cliKGujAsEvjvsrbUuExzfZuUK3fVzZza838R+xj44=;
 b=Q4dbCn8Rp3NpRNWoJ3qop3h9X4h0TDvqWWUvAhRLMX6tS9l4n7tfFUeZIYkm0o+hwZzSDyttZ
 JAWfTwpLSSCBYGkR+JExGP0NzDiuzqPNRhmmVKWudaCmR54FjHtQgnY
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfX3IWrsQMfwWkx
 7XK31X/76JeqZ3SyXTFkNMXNq+fnlyMwVB2+jKRc0cxbGI5hxP3iNjT97pd97SzVVlvcD2mT7JL
 RagS+dZzA9EfTJ81Aiu2JD0H5+6jfzU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfXyYoiG78P6Qb9
 y2V4jJ000Ervkr4E5EbJxI+MX9Xj3AKEih7cpR71ytnQRDkajeRcA+uyAHmDFkzCJhkT62WdxSL
 9P1djygbfF68K45qKf4Mrrf2ekxoHQY5MzWu0aV1Jm4KiEICU7615fRd8yrOBYlmjbuK6iC9A+B
 QGKdtC53pHcn5/kkS3IGBVs9hMm5LMoIstqqeW47J4IlPa1XQMezAidtRGUWV8VqqBMOWJHapoN
 INjBtLuqBPYnfCUVjw3v4qSfiU9/RvuVSjwUBuqk3t0b75kNgyIwvJQ68aAyFRmLtZJR2B7h+gC
 OdpvwaoRTUXWy3xcD+y9G+MEdVqTApjXlU0nf5enDFbKDlTafN/Mea9MdpROX/JIPWN776tY3CI
 1BEtxFk6cD1OHNHHCDi4Iq53cR4CwnT3IsjNACq/WwE/YnjFOZMQ4cF23A7bkdw8X4sY4uLrc5D
 XG/KXOm7nAFFa94k0Yw==
X-Proofpoint-GUID: jDBafZffu1qlatgPSwAAWKcSyBosFOtR
X-Proofpoint-ORIG-GUID: jDBafZffu1qlatgPSwAAWKcSyBosFOtR
X-Authority-Analysis: v=2.4 cv=Z/J5j3RA c=1 sm=1 tr=0 ts=6b00db86 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=uxVkaJQCnwIzyWVbueAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200094

Add ROI support to the Iris encoder driver for HFI Gen2 based targets.

- Add control infrastructure, ROI_PARAMS and MB_SIZE capability IDs to
  platform_inst_fw_cap_type. Extend struct platform_inst_fw_cap with
  p_array and elems fields to hold a pointer to the per-frame
  delta QP array and its element count, set during s_ctrl.
- Register V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP as a dynamic S8
  array control (max dims = 139264 entries, supporting resolution of
  8192x4352 at 16x16 MB granularity).
  Register V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE as a read-only U8
  control; g_volatile_ctrl returns 32 for HEVC and 16 for H.264.
- Define HFI_PROP_ROI_INFO and hook ROI_PARAMS to iris_set_roi_params().

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 70 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 13 ++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  5 ++
 4 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 4f2633bbb49f81f080ffbe91569d38e954ad15a1..d97fe50d48860b0f26b71d328a704f3804b1d93d 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -163,6 +163,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return SLICE_MAX_BYTES;
 	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
 		return SLICE_MAX_MB;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		return ROI_PARAMS;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
+		return MB_SIZE;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -314,6 +318,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
 	case SLICE_MAX_MB:
 		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
+	case ROI_PARAMS:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP;
+	case MB_SIZE:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE;
 	default:
 		return 0;
 	}
@@ -340,6 +348,14 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	inst->fw_caps[cap_id].value = ctrl->val;
 
+	if (inst->fw_caps[cap_id].flags & CAP_FLAG_CUSTOM) {
+		if (cap_id == ROI_PARAMS) {
+			inst->fw_caps[cap_id].p_array =
+				(const void *)ctrl->p_new.p;
+			inst->fw_caps[cap_id].elems = ctrl->new_elems;
+		}
+	}
+
 	if (vb2_is_streaming(q)) {
 		if (cap[cap_id].set)
 			cap[cap_id].set(inst, cap_id);
@@ -348,8 +364,53 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+static int iris_get_roi_mb_size(struct iris_inst *inst)
+{
+	return inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+}
+
+static int iris_op_g_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
+	enum platform_inst_fw_cap_type cap_id;
+
+	cap_id = iris_get_cap_id(ctrl->id);
+	if (!iris_valid_cap_id(cap_id))
+		return -EINVAL;
+
+	if (cap_id == MB_SIZE)
+		ctrl->val = iris_get_roi_mb_size(inst);
+
+	return 0;
+}
+
 static const struct v4l2_ctrl_ops iris_ctrl_ops = {
 	.s_ctrl = iris_op_s_ctrl,
+	.g_volatile_ctrl = iris_op_g_ctrl,
+};
+
+static const struct v4l2_ctrl_config roi_mbqp_cfg = {
+	.ops = &iris_ctrl_ops,
+	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP,
+	.name = "Enc Mb ROI Delta QP",
+	.type = V4L2_CTRL_TYPE_S8,
+	.dims = {139264}, /* Max MBPF = 8192 * 4352 / 256 */
+	.min = -31,
+	.max = 30,
+	.def = 0,
+	.step = 1,
+	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
+};
+
+static const struct v4l2_ctrl_config roi_mbqp_size = {
+	.ops = &iris_ctrl_ops,
+	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE,
+	.name = "ROI Mb size",
+	.type = V4L2_CTRL_TYPE_U8,
+	.min = 16,
+	.max = 32,
+	.def = 16,
+	.step = 1,
 };
 
 int iris_ctrls_init(struct iris_inst *inst)
@@ -374,7 +435,7 @@ int iris_ctrls_init(struct iris_inst *inst)
 		return ret;
 
 	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
-		struct v4l2_ctrl *ctrl;
+		struct v4l2_ctrl *ctrl = NULL;
 
 		v4l2_id = iris_get_v4l2_id(cap[idx].cap_id);
 		if (!v4l2_id)
@@ -392,6 +453,13 @@ int iris_ctrls_init(struct iris_inst *inst)
 						      cap[idx].max,
 						      ~(cap[idx].step_or_mask),
 						      cap[idx].value);
+		} else if (cap[idx].flags & CAP_FLAG_CUSTOM) {
+			if (cap[idx].cap_id == ROI_PARAMS)
+				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+							    &roi_mbqp_cfg, NULL);
+			if (cap[idx].cap_id == MB_SIZE)
+				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+							    &roi_mbqp_size, NULL);
 		} else {
 			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
 						 &iris_ctrl_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 79bbd06ef8d2be11582a6b81da3104b6273f7250..0f4c6f955f4f408c45c50796332b47c116f52982 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1815,6 +1815,19 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_MULTI_SLICE_MB_COUNT,
 		.flags = CAP_FLAG_OUTPUT_PORT,
 	},
+	{
+		.cap_id = ROI_PARAMS,
+		.step_or_mask = 1,
+		.p_array = NULL,
+		.hfi_id = HFI_PROP_ROI_INFO,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_CUSTOM |
+			 CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = MB_SIZE,
+		.step_or_mask = 1,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_CUSTOM,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 2b8b057d35a9bc4d611fc9251c95762316a21062..2394213d8272b53bf6a1cff9574dc93f6830fc8c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -135,6 +135,7 @@ enum hfi_flip {
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
 #define HFI_PROP_NO_OUTPUT			0x0300016a
 #define HFI_PROP_BUFFER_MARK			0x0300016c
+#define HFI_PROP_ROI_INFO			0x03000173
 #define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
 #define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cddab9a9c375abc6f803f98272619ecde8ea7873..72a7bd5a7570f53a73037d49736e95664af180a5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -211,6 +211,8 @@ enum platform_inst_fw_cap_type {
 	SLICE_MODE,
 	SLICE_MAX_BYTES,
 	SLICE_MAX_MB,
+	ROI_PARAMS,
+	MB_SIZE,
 	INST_FW_CAP_MAX,
 };
 
@@ -222,6 +224,7 @@ enum platform_inst_fw_cap_flags {
 	CAP_FLAG_CLIENT_SET		= BIT(4),
 	CAP_FLAG_BITMASK		= BIT(5),
 	CAP_FLAG_VOLATILE		= BIT(6),
+	CAP_FLAG_CUSTOM			= BIT(7),
 };
 
 struct platform_inst_fw_cap {
@@ -231,6 +234,8 @@ struct platform_inst_fw_cap {
 	s64 step_or_mask;
 	s64 value;
 	u32 hfi_id;
+	const void *p_array;
+	u32 elems;
 	enum platform_inst_fw_cap_flags flags;
 	int (*set)(struct iris_inst *inst,
 		   enum platform_inst_fw_cap_type cap_id);

-- 
2.34.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4718745EF5B
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 23:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792191659; cv=none; b=qd6WWShQ8VSjUZ1kP4u2thlLYgUOiH2p6q5FW7LB2iquDbvpTETLLpD58Rwu3iYOZKUSDKX4JAlLpuhRAiGMSeAPHtB8T0QNM81VszfdFrkrARFn1ce5PvXJWYoKo26EUhC+ONR8jo7AfU0sgmRSynrUnC9fhnpmeIHsIFF66JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792191659; c=relaxed/simple;
	bh=8cliKGujAsEvjvsrbUuExzfZuUK3fVzZza838R+xj44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFz4oMgTjz4cmUpcWVLeGfHM+iimaRjpfoNImNzzXshzLdX69VzIqnsFJEnw8HZDMQajXgFdeuo11XzSVfUr7Vl9KDAsiSg1SlrYXy6TqulrnmqsTBw3Ez0crZtOv3SH1fFQx871ZM6rrHVzYuWJi1aEFsy+Od/naeG8vmZqDOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbSpk3So; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UabA43N9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbSpk3So";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UabA43N9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GJeX152873543
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 23:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkyE659lzmHmkedIaFTPtXRPbQd0UeH/8KjUFYs797g=; b=mbSpk3Soqa/aD+d3
	aulHpIgrBsgRWbHsqxuDvfexfRDzJqHnz9s5BcIUMsD4XACpmxytuQM8P/04Fc6x
	CrY5tLNjqiOkRgXUJhRisCkQdR4L1hSLrBa0UnCRdLYs7rOSYmzuFuiMI6EYTvdI
	tAeIla5Yrq3z8EINdAtEWnKrLT6P8KJ0sA8x/iKsAEXydlnjXwQO4L5YVzWtaVbC
	CpR5EDmDh70SnuZyf2Fad8tsfPwf8VtraG7AVTGzvSreGqoHk3pk2ng17fctH7EK
	Am50nV6Eqd9C3fOJFFzI6KX5Wl25Cj0hEkf/HFQHcHzHa5oCebSAVyzd4uMthArm
	I/Zf+Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhumtnm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 23:00:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35ce0b61b43so33402eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 16:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792191654; x=1792796454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkyE659lzmHmkedIaFTPtXRPbQd0UeH/8KjUFYs797g=;
        b=UabA43N9NLzfCxYUyPvgzmuFpOmPmmMdvl5XTdEKpBxtO6CKb91UoVRvlfMkAcVFKs
         H8dvkAP6japGw5SkF9cXiY6wdYEqA4rQf/GRLqnwJaEhFcHNFyIOrnj/xbh/QDzeN1S5
         oeS3u1fk78LNmAEpmo8CTNM7OkWaxqS1YbwKsf/Hm3c4FulUIq8R+6WGd0uQ3FTQCah9
         MIjaxnoexELcTU5BESw1gyTczcOkQvkUkmPE/7nnmIRYagP6lYerJtdqOxyHuBeNUQ60
         8g1BHiNOxINhFAfnc+CoKhDGAWlB4EnIyDo5P4pnBkcKfm+ki0ou3mQZZFi6L0RxhMDI
         nUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792191654; x=1792796454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkyE659lzmHmkedIaFTPtXRPbQd0UeH/8KjUFYs797g=;
        b=xstR0UYWiXJ8Z9Wa4TC+mhTm+fOgPcAekHShFyIaoRKo1SWmCRpGHkhGycw5WnUviX
         tMI8JCCGaFIropiDhg9PpMrB7f52Si72I+g2kTiP326coaCO723ftElVxlAITUaNbbwN
         +UFsKJHYL6zqFoQAi5d7jPRpyy2GBrT88d4uy549WB3LKIjJYkSzRRW81jBsVD9YEsYh
         ZqEVt1IpCSqAmfqlGraI92W0TFxlmp2Pb+IvJMx2MWwYRPhUJwH7SmwmeZGahX9Alroc
         sPUSzuKCunHvEkMuikyf/UtafUew3zKfDRk15XrtVr6ClqiUNrZHfjeL7vqTr7clw7Jo
         sHDA==
X-Forwarded-Encrypted: i=1; AKwUvBwV+HRJo/RU5JnjeHBI5T0w30sYgA14yfXh1mhPi2I20/OBOVFspOjLCKPRJF1vZTLTEqUusOCr35SN/4On@vger.kernel.org
X-Gm-Message-State: AFq9FYLttbB06777f5+7GtJvaX42o1rjf546rLSQC0Sc97SgMdrx2r2Q
	IBhfz+L2KSVqa/j5R+vjXA85GlPSR0BVL03zm/cbhsiiuoObN5dhTZLzo+twYC3r9Q5j7Bcp6pk
	wPU00sGiOtiUVT3ZQfpX31ZlK4UQO8cESUiMyKk1ujZzBwZ6IFDXJoA1yEpGvXxqqNnhC
X-Gm-Gg: AYBFou2qDfT0SNieOxHWQVvyADMXRnlTmDirNGCz3x+4sIr1mQUyzCGG5eGuvsaWezl
	nrlw1EJIZz2N1+e8BpvmebHNTwI4XF8dZu+s3GW+1+73ifgnXnslFQrxa9L2r/EEB3sdnpDLfUS
	OIEpua0/ezx6T1YRQ6UBPc9Q4KRqhjiesOAVjqH5Aq9+Z5HNvYGZwzjqfAqzvP6xuvGHtnRPN9e
	NiYIHBgrYzh63kuhqo4CaUFDCYKjbxlrxA02Y2eJyLv287zGRln5v8DJstW0kj5DnJ05uXE/bmL
	8Y79YzEzZ7oGVraq/rcLs9QKXudIICLOMsUCj2oqaI21p0aHsuNMjpcjECKH8y46mIUKPSXSW3w
	0fcXUQKG5rAL/NWabdPU/P32SU4oQIubHR0mrnIVeMZDDjMYcwE9GQARZzTw=
X-Received: by 2002:a05:693c:20d2:10b0:35f:8c5d:5938 with SMTP id 5a478bee46e88-3619ffc5b52mr2422546eec.1.1792191653830;
        Fri, 16 Oct 2026 16:00:53 -0700 (PDT)
X-Received: by 2002:a05:693c:20d2:10b0:35f:8c5d:5938 with SMTP id 5a478bee46e88-3619ffc5b52mr2422475eec.1.1792191652973;
        Fri, 16 Oct 2026 16:00:52 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm9379101eec.18.2026.10.16.16.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:00:52 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:00:34 -0700
Subject: [PATCH v10 3/5] media: iris: Add ROI delta QP control support for
 HFI Gen2 encoders
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-enc_roi_enable-v10-3-bc5bd37b6f3e@oss.qualcomm.com>
References: <20261016-enc_roi_enable-v10-0-bc5bd37b6f3e@oss.qualcomm.com>
In-Reply-To: <20261016-enc_roi_enable-v10-0-bc5bd37b6f3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792191637; l=7490;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=8cliKGujAsEvjvsrbUuExzfZuUK3fVzZza838R+xj44=;
 b=xzHwEwdOCMoY8YdH56u/jhRsna4yG9yh8itbo5irs7oA6u8u0P8hJMX5GLOnqfd96zls9p5K8
 qCfq9at9+12DF31kqVWE3JgtRV8k1XBMojKVANul8dDiQ2U6DyBYOWY
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5MSBTYWx0ZWRfX/nWWA5apATMj
 +Qfq5c5Mr6AlE61pLiDtp3wH/7BOO64AbhWAj+EHYNUiPmRwLTlWnZDTmR2FUMaiSyhdUuzmfP3
 j7V4lFcwBUumv7ckAThKdUetNwfiwpA=
X-Authority-Analysis: v=2.4 cv=H+BOUOYi c=1 sm=1 tr=0 ts=6ad2aca7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uxVkaJQCnwIzyWVbueAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 8q3BJ7CFirYheqe7QwofrCtheXAJyKmg
X-Proofpoint-ORIG-GUID: 8q3BJ7CFirYheqe7QwofrCtheXAJyKmg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5MSBTYWx0ZWRfX0kpGboHtn/Go
 QVQo38M4bUje+EfNi/AS3jd7wHTCBPz38XS1tIiTtQVwf6oMDOy4J3iqAJOsK6kmbe498BaVQGh
 7riw1cTcnVaAPBYcNoLC6kR0xcudWPo5MzZkz6yqWO3wZeMgcylcn5gQnjzj8AkaPdNfzsZZx8N
 jxuv83LcuBsiVpIOQxEKOdYNWOeb/TPhVO3U6B6X2RWXHmCqXj/oqpRhXh7o4g5GD0HSuXkmT5M
 XIGh1depD0xCcFd4woSn74T8DUClmoOslzX7Q6Kum3/JZb0baintiZZ0riDY3/uH2ZKdR0CFBFN
 2lQDUKJKgY7xoxj06WhqPABR34rYrhg03sKbDvWR8BpgkHcVFsGVM16Y6D4SsqjZB1vgWsas8Tp
 bWqDWtnzXrxQxoZlETSF2V2SL9Nlba+uJM3Dh1fKg+K83C79l/IKvEnxIOoLccgUJCkRmI5FICl
 Bn0Nd3ORNwcJrWx9bTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160091

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


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728E6481A9C
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390858; cv=none; b=mxNYuZcxh4FXtmVrw89FKQCxBvThrUuT7OdUfd6osB/kcvW+V/NRz8XgGk0p8JCNHW5vC2lCm8kvGCTTSZZ+d4eTvFDA+CYNxeLM9BTvoUn8NciNE5O3NFpuBiWs/ZChrYUS49m4oQ2n8zcOegwYsBbdST7LjJbWJDW6mYgicJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390858; c=relaxed/simple;
	bh=ZQPDrh9thPcyLrmqNlOQ6RFqySGwD+JqOk2p02qve6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgw6pD/ympNhFHemOg3B/d49jVyUJLpD1BTQgFG6/aPSklTsvZ3LvEtiyQYxGA/zei2LmusX2bp/YspreEYf64+gtY3c6EOAuX4QvYrDYWzpcBn5HuHnHovdN/5AR3tGWil0LpdahNwjdDmTKRl8ru9R+54Z/G+ZCAjKvyndYj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NiZHWsdX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Euod0mPz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NiZHWsdX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Euod0mPz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Kie4090469
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJa3QlB9XmcdOuaIJqjt5TDlCsx8pLSmc7Zf1x/8FoI=; b=NiZHWsdXKbVBosxS
	8KB3Z/7Gd/cPOVdCppJ+rRJZlUxLp8kISurN0arImT5SWrYsiQU1DYNQKfLFFqNY
	BBKHUf30FYbYVjWg2ouuw/j1OZzeJkPZr51OCE/AxHmGQ7PlR0pb3+nLRx54NfGZ
	hnWdC3RtRPzOz5kvKQHnXMmYJLM1xRdi/DrgUpQE8IaxjL1ebp18GFcmKL+7pib+
	e5JAEFzrZ5esXpxAq1W5haW4wBV+FUskTcZhPvcoBpasmYG0dm61kKZxMlR4SBCq
	7htM3j87WQChvxRIebg30x5rR8uRWOQlygPPsIH1vvHDUpAEP+filQc/PGeb8FYP
	fb6AIA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg1738-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:00:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db3d832827so40504975ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390856; x=1789995656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJa3QlB9XmcdOuaIJqjt5TDlCsx8pLSmc7Zf1x/8FoI=;
        b=Euod0mPzgDHxV55Y/JVibGw5mhu9piTbhLRLzG4nxOtXZ90E1EOr64yNJ5qPiMPnzd
         A0Tiw7hxTAoNcE9a3zVYdU/Yehqay4nY4R3e1PyDkcQ02goRhj+rxApKx4cCyVvBP8XG
         5fQpS0MCNzvS+csVMNG9NzYdnDO/My4+zcLeBZRGUpVHi0Hl/y4Ko+WuEgDsKaqxiDc4
         K5M8Nukrp2vyYF5C624A1as46ldcTFJEskqtcJrPOlgoUU2OtQ1YjfEdupw+3hvJu+D8
         p8tgOWfhWxabSDqY+eaMIC80r+VEt52mwEm9/ncbipX1g1Oqun4IfbIx353OCgsbIdlT
         lCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390856; x=1789995656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJa3QlB9XmcdOuaIJqjt5TDlCsx8pLSmc7Zf1x/8FoI=;
        b=e5VwDdSaBC5PRdvZwqgYlmvQF9qpTtiJ5UyO1iBFqgvbLLdx3FUqy5FOS21KC5R6yp
         XVWtGEzkIj+WR8Sqjo0I7/cK8U6r7z6DjuBUPtG9sX/sHbxjCgDFZEIxiaNlrQM/RsyG
         U45PP9XVx1eURBN1un6C/cvN30RKpZS7gL7Sx9YY5DZa+HBc2qV8FWl+T8TbeNce8E3e
         0uWBtYxk0R4WdjGj5xOQevB0wLdqgUnfRSzmjjfTwbZc1O4Zktg5fiXGjlswK1b+3fb5
         KLiJltati1Qk6F4Uh3hTuzs5rEtTXka63R8FUEjg4BHKaD6pn/z6F0zPY5CjvFE7Y8A4
         //6g==
X-Forwarded-Encrypted: i=1; AKwUvBx0UfOufixWBjxE3DMQPdyGGiurVCSdli/cKHO3rnFL6nyA7WQAF1p1MUVuBoJJ+O28JuuUKmIgLWFSaXhA@vger.kernel.org
X-Gm-Message-State: AFuF++kS2Ln5PWCvOmhUclBS03QhUdQ80bnuejpviU3kpX1ty9sShtVh
	u2L2hpkD4YS+H5psuK6ZTQE437bAOMWkaAqGueLwX7WwW8ZkQj6zjGa1JDCl5W2LGXwRI4jPVn0
	vXTCO+ScPXq2EdRpSh3TIqUdKv2hoGtvC6R0w8g3sCH4gjHIjqDAaWrG8lQrMdseEbC2V
X-Gm-Gg: AYBFou0UKIr32x5jsx4XynlZN5o+/IZY4FwS7EoO5VHfCFueM6kTTOZ4ntuZJaT9Xka
	PLsN/O2OMlql97Js88RrUdt1D3Kqt8KtytiblqNVgKYv7/sNAgSqIvm5Q9PfNY6tuleia80AJck
	7Bog4XimsULipT7hLbze6hA7s5wa4ubuEO6j8nuoMwORtE8fZo/Fm1mMfVj3Lx+rxr1RtHbCzIX
	EEfk7gXE0nh6VptW/YcjWwfEKVm4V9L4/klnl2lqahfulSpfh8u+/DUfrkksBiZ5IXTg8Tqj7a8
	0ZKmaY56QswaEIYhT5trlVWjp+99zHLyhEAx3cUZmhKS1Xcs6cQ2dNCts6T/pasFfSmrfEKI4Sz
	G5wo4mfn1iBuFBbDfjIPudWzgNM6YkTyph/EIFpE1bEv61jArVrVvrPrPAvLmDV+40WzCaoLRCJ
	k=
X-Received: by 2002:a17:903:3c67:b0:2dd:68a4:16f1 with SMTP id d9443c01a7336-2dd6c6c0cd4mr51435175ad.11.1789390855643;
        Mon, 14 Sep 2026 06:00:55 -0700 (PDT)
X-Received: by 2002:a17:903:3c67:b0:2dd:68a4:16f1 with SMTP id d9443c01a7336-2dd6c6c0cd4mr51433935ad.11.1789390855017;
        Mon, 14 Sep 2026 06:00:55 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb6861sm47434965ad.36.2026.09.14.06.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:00:54 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 21:00:26 +0800
Subject: [PATCH 3/5] media: iris: add AV1 decode buffer size support for
 vpu4x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_maili-v1-3-09df2b54c317@oss.qualcomm.com>
References: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789390835; l=3944;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=ZQPDrh9thPcyLrmqNlOQ6RFqySGwD+JqOk2p02qve6c=;
 b=uJCJSwmIGwwKDGY/2h/wf770NfbU3rfE+TQVzwqN/JLn2p1VWUxfwkVY6tMIms7NNf3hLstM8
 TS5jQbh+ZrGBeu54LmH3Ni6wju91LnEq5ahvPThQK0F8Sjf5f4lVuFa
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7f008 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vsqskg4-7OKJpdbeU5sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 3HywJRH6fdasQTWwb7WrAWX91RUc_eXp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX6DNrgnFlE6L6
 m+Ub0W3h9CqaL6sJGmWdIQthbXtMApGtE3dcvZkK7HezBs/2fgqsGX27ZXuff6+THzb5osfb2cr
 H1bZG8QyEBLwMFG9ZF66SULqLAFiNSI=
X-Proofpoint-GUID: 3HywJRH6fdasQTWwb7WrAWX91RUc_eXp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX8VUxsK8NlETZ
 AbcAON2rnxlTlGCObZ3j1OQLk9FONcVDE/+gxAT6ot3My97J5lWREkcayCV0K0dIxLW6RqS2iZU
 J0x0SV/FqBNByVldjtppWjvfXFJESbWoH2nWIAtUPA/0GMUCcUHsEgT+SHLRzXg8yN/xorXQNDH
 S/i7ja1j7dqJRtKkIy4yNoXaEOVQj81+CvhwMC44lzZON68eKo/FiI9LYe9QClCuE6MHvP+jhuG
 SncogQvFKV2GMc6ox72PorLk4ATUFsgNahqIffdU+Yregjwn19A1VsAjBUoKzcX+8KVQMZ01G7C
 JJ40mtjBNJA417BYqKHQ1EWHxctdjnmw24HtWXBJ81I2TUSiEbLD2ha/6gwspsE2kWgzzFd8A5F
 buKTvLffFiff4hsFiYOhs+ahJZlZ4EwRTf9R8lNyv4AbPcquBL0G45J3/Ver+LEXe4tgB1P2Q9p
 DPgDv37OmSl4rWZpJQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140186

Add necessary buffer size calculation to support AV1 decode for vpu4x

- wire AV1 into iris_vpu4x_dec_line_size() via hfi_buffer_line_av1d()
- add hfi_vpu4x_buffer_persist_av1d() for the vpu4x's persist buffer
  size calculation
- add BUF_PARTIAL to the vpu4x decoder dispatch table, which AV1D
  requires

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 35 ++++++++++++++++++++--
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  1 +
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index faebb54728660cc621f8822dabf2e44ce8c55c58..55996fd0d14c385ee63d2577b3e6d71b51d9e541 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -1833,6 +1833,8 @@ static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_vpu4x_buffer_line_vp9d(width, height, out_min_count, is_opb,
 						  num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_AV1)
+		return hfi_buffer_line_av1d(width, height, is_opb, num_vpp_pipes);
 
 	return 0;
 }
@@ -1856,14 +1858,40 @@ static u32 hfi_vpu4x_buffer_persist_vp9d(void)
 		HDR10_HIST_EXTRADATA_SIZE;
 }
 
+static u32 hfi_vpu4x_buffer_persist_av1d(u32 max_width, u32 max_height,
+					 u32 total_ref_count, u32 rpu_enabled)
+{
+	u32 comv_size, size;
+
+	comv_size =  hfi_buffer_comv_av1d(max_width, max_height, total_ref_count);
+	size = (SIZE_AV1D_SEQUENCE_HEADER * 2 + SIZE_AV1D_METADATA +
+	AV1D_NUM_HW_PIC_BUF * (SIZE_AV1D_TILE_OFFSET + SIZE_AV1D_QM + SIZE_AV1D_ARP) +
+	AV1D_NUM_FRAME_HEADERS * (SIZE_AV1D_FRAME_HEADER +
+	2 * SIZE_AV1D_PROB_TABLE) + comv_size + HDR10_HIST_EXTRADATA_SIZE +
+	SIZE_AV1D_METADATA * AV1D_NUM_HW_PIC_BUF) +
+	rpu_enabled * NUM_HW_PIC_BUF * SIZE_DOLBY_RPU_METADATA;
+
+	return ALIGN(size, DMA_ALIGNMENT);
+}
+
 static u32 iris_vpu4x_dec_persist_size(struct iris_inst *inst)
 {
-	if (inst->codec == V4L2_PIX_FMT_H264)
+	struct platform_inst_caps *caps;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
 		return hfi_buffer_persist_h264d();
-	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
 		return hfi_vpu4x_buffer_persist_h265d(0);
-	else if (inst->codec == V4L2_PIX_FMT_VP9)
+	} else if (inst->codec == V4L2_PIX_FMT_VP9) {
 		return hfi_vpu4x_buffer_persist_vp9d();
+	} else if (inst->codec == V4L2_PIX_FMT_AV1) {
+		caps = inst->core->iris_platform_data->inst_caps;
+		if (inst->fw_caps[DRAP].value)
+			return hfi_vpu4x_buffer_persist_av1d(caps->max_frame_width,
+			caps->max_frame_height, 16, 0);
+		else
+			return hfi_vpu4x_buffer_persist_av1d(0, 0, 0, 0);
+	}
 
 	return 0;
 }
@@ -2163,6 +2191,7 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
 		{BUF_PERSIST,     iris_vpu4x_dec_persist_size   },
 		{BUF_DPB,         iris_vpu_dec_dpb_size         },
 		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size    },
+		{BUF_PARTIAL,     iris_vpu_dec_partial_size     },
 	};
 
 	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 8c0d6b7b5de85f7d7aaa8fc36218e8d095419569..c7020931a642f0484b6f84af7ab51242e1845458 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -116,6 +116,7 @@ struct iris_inst;
 #define SIZE_AV1D_TILE_OFFSET     65536
 #define SIZE_AV1D_QM              3328
 #define SIZE_AV1D_PROB_TABLE      22784
+#define SIZE_AV1D_ARP             9728
 
 #define SIZE_SLICE_CMD_BUFFER (ALIGN(20480, 256))
 #define SIZE_SPS_PPS_SLICE_HDR (2048 + 4096)

-- 
2.43.0


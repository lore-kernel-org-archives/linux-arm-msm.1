Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18143A6B8A
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785218584; cv=none; b=KqFEEOc/oiMZOA0vqSus8BQrLdwlvsb2vnCMMGoyAlIaVgiU0egB9JAzM9AZOMVhLQ2fQaTMo235Wal/ISNIeICvXZZAsUA/SpMBQ8XmqPJFI/B3IU8N+0+QyYEUP8lhpuhYSWKe8icViL2Oe4nJf6Y1Jzlkye1hBYfWzPrz35M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785218584; c=relaxed/simple;
	bh=McZCOZqoIl5ZH/Ob0riQHizmLROEdt6xe7Nj9U8O5D4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qJBcSKKSnLnp0TaqBka8YTN/IroJHhhrzNAL89aBonP31tehLyApCNQRzE2T61nO2/6zjdbsw7CmfTnMPjge731M/uAHL8++eiQcRfW/tXgOwSBoiVRD0rLNPM+fIMR3+zepvMC57X3nuJ7m92s9fXWdGqSTA6l1XR0ILIztQgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAU5k3jV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ninmor6F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAU5k3jV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ninmor6F"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3aX1R1303470
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cP/Bdnl4uFSzfM4GV8j2lxERS9uQ+hX1N4GLtjz248g=; b=RAU5k3jVCRKCBX55
	M6MIALD4MO+sRSFOxsw+DokyBQTTNhBowC6NvdI0otmQIumaF2PIbK1QFu5dyk0z
	2ns2GCzRmeMC9bw5HoMgWcPMAl0f6oY2F55EwAm4vr6YzAd7o5JlnA4PfFQezrTb
	3TVI6GUtYzcQA4SS77LavRakjpg0z1Rr/PB9bb0NrZd6V1cN/oDumfT/935ivaGf
	G5MLTIvBju5r3/aNGr5VlehCJgt+mLVy9gmoU++caipG8iJqimR2MvfoX5erIh8q
	mb9pY3IdTZWvQ6C18vVTL71hoasmAVGo+bD0NZNWN9gnyZtxpFZ0Cuk214R9A14G
	aERXOg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8arjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:03:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so2644337a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 23:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785218582; x=1785823382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cP/Bdnl4uFSzfM4GV8j2lxERS9uQ+hX1N4GLtjz248g=;
        b=Ninmor6FakBXvLGfv+URGMSKS70jRem4Vrl5zeTx3h5qFkgNgqV2fVDdap4CTd1+a2
         Hwm3bQfDSGTigHAJFzltMQTQecf0mff4K+E3/jq5S5jqUnpbZXEWkCz+AFOSGcpE3qez
         CN+0RIEFdR7qAHdKxZ8qU0ikhPWOHdChEMYyB1Xol+7K+A6/VXeNC5WcDeE2nKsSUimU
         3ldk+FndvDEgd0C7lgopXBxQD1FWSYHpNQPzS01JALl4aIXLs1++xXBPMEl0T2IOnC8X
         IC/ciWWFgbhlFruMIS0bavg8bSbdzRM0BOrANC7aHwhvW15R7cvB+ESZSaqhgDY+SnqS
         VLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785218582; x=1785823382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cP/Bdnl4uFSzfM4GV8j2lxERS9uQ+hX1N4GLtjz248g=;
        b=nZJFpnvtu34/OVr65pWSy7pg/ZNbcwbE3Jss8TvWQLvoEx1zq5vTwBG6rXpb7Utu+u
         SvQlQWayzuOWPACUHYo8FDVPIbs0kGErOoQJI1fGtyYzbjei1JQ8ekOXacum1Vg2tCa2
         UU1YbnHlVO9IbAm0CLVXbOYHF/fJfL4msS/sk3MJraudeIQPf41ZF98Awz/JgBFjMwKA
         svU2iH/Owb040YGR0vQKfcJbPJCbL6fCo2zdYnBQobnva7ikfV+CrM5oKw6p2nOSpBKv
         BEdGAOLMpD4L2ZpN1sPx5L/p9BsGg8+SCLcsQJ5n/leU15ymUL3mqA/2Ki+OB3L9tlki
         Tgmg==
X-Forwarded-Encrypted: i=1; AHgh+RrUbasCFs0vdOQXAFiuAiBpcoRlDKT2CVQq/ygerjtt7wm+RyX7XL4038Vjf3bMGs9ZK3BRunJn/lSE4Pjj@vger.kernel.org
X-Gm-Message-State: AOJu0YxX06dDVxUHV5MVc5+KHYaJ6nnz0wN3JezpGTON1RSSF1heFMB3
	i4vpQ3BVeSyhdOxbi/xWecnhZY3hKcId2KHLRO/wdfitXqUb8p5IlR/7jx54OdPStZVXsntqNBF
	qeoKfhCeXJfbtBSXJFqmawHXeEjJyLIxSs3QsrIHbYSDMpUieskDRuTC/f16EIEu4Pn1h
X-Gm-Gg: AR+sD10FsBJE1mjK/ojW3Q29GVT056rQT3rRSqxlI9+eMRRfDb+HkaoVG/SOnIIbox0
	xupBbAFvldy02kUajY7ua3YoibR+wzM2lTI/Z6up8xCmCVgBEPFGjLodq1ouTLNssLkJm7jk++r
	Sv0NGyQ/PV34BueWhXuKCke0beJ5Q8F/iciEOBEdDt1jo8fHk1ZRg1yhAJ6hRAz/KxTiFjI7Pmw
	v3LYlSlMMW3ZWIZ8G+WC0bDSPQMKhqiasSHE0Pvb0oJ0aFWYuiuQUR95MY1rJ1p2OJyU5AwMEP2
	x8HWcZNCPGhaP/ETcIdH5+fzvxo/aJ7C8sijb2Kg66MPQ4+ltPOcXXL7R+wi1KD4Z5PFub+q0vJ
	Q+QGvxtsHfKgd9KrJACFAsYJNq2NAHFw=
X-Received: by 2002:a05:6a00:e13:b0:84e:456d:aa5b with SMTP id d2e1a72fcca58-84e933095a2mr964354b3a.72.1785218582178;
        Mon, 27 Jul 2026 23:03:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:e13:b0:84e:456d:aa5b with SMTP id d2e1a72fcca58-84e933095a2mr964336b3a.72.1785218581778;
        Mon, 27 Jul 2026 23:03:01 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533ce57asm3980421b3a.28.2026.07.27.23.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 23:03:01 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:32:44 +0530
Subject: [PATCH v8 1/3] media: iris: cache work mode after computing it in
 iris_set_stage
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-iris_multi_slice-v8-1-eb18f96f0ed8@oss.qualcomm.com>
References: <20260728-iris_multi_slice-v8-0-eb18f96f0ed8@oss.qualcomm.com>
In-Reply-To: <20260728-iris_multi_slice-v8-0-eb18f96f0ed8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785218571; l=1459;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=McZCOZqoIl5ZH/Ob0riQHizmLROEdt6xe7Nj9U8O5D4=;
 b=SGyWGHVd1dTFzivHD1bFB+vCcKijiCXbuXP1rPg2iJa3gwUO0QCkr1bpG30zbGQ7XsywBT57A
 S9XSSOG3dDkBDN/Di48GwCD8NuDw5vv18hO3Vbq+b96zQ/vvdgCvWlo
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA1MyBTYWx0ZWRfXwTvoZAzwHs4u
 cKDDvo0l+6kgUy4SxvoI4HlLnKGTUbC0nlR7WUb5xvtmadVuiJw5GaPIRgv5mSTSQoWcrdzmrxb
 F+Ee67Gm8QTBIHF2LOZjbdmV7CMcMxM=
X-Proofpoint-GUID: Tp-MApcsNAvQISYDIxQCzTLrXbLO-OMZ
X-Proofpoint-ORIG-GUID: Tp-MApcsNAvQISYDIxQCzTLrXbLO-OMZ
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a684616 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DQE9uWRhMQBL0dtU3VIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA1MyBTYWx0ZWRfX8fzosDQtvPcH
 L2xo/6eDls6oyMqq+S/xvuQ50ra/SXLmWFx6+Q01X8OLygkh+5X0WJEmPihcoerEZkJ7EwL7W0x
 nrg+ezCPCMhc+IEX6M6rbIfMV+RDl6zPPaVszBW3kIvd7c/ClC6ZideasQ9v4Jb6KrYbFpzBOCt
 DlMw6kFSb9P+cfkeRs09eGbCvCbpBx73wDUwvLNnyH1Txqvzw0zuQE4bo68WamFg1iQAiJ9NXYA
 Dl8Rr9Kq8z7OiJtlXgGV0mak8YPheIwGRPV25XxJiZgDcw9vH7H/OOSOS7Ea30Gz8xu9edqEMkP
 2VyA9FBajdY6mnwzZ6JVe6WXCXqcLQo/wq/MgDoK7l7r9MuRdh1LX5Wm9DJWUBgEF7rFB8S1+dD
 keyu8ELZtCMdcqwQtLH5YF9n1dUK162U4cdmzP2+ICheBN89wlDNcXbNqjoxxojUELlMPNT7ixx
 hmN24QxBMauHKivXL4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280053

iris_set_stage() computes work_mode and sends it to firmware but
never updates inst->fw_caps[STAGE].value, leaving the cached STAGE
value stale. iris_vpu_enc_bin_size() and
iris_vpu3x_vpu4x_calculate_frequency() read this cached value, so a
stale default causes them to miscalculate buffer size and clock
frequency for sessions actually running in a different stage than
the cached one.

Update inst->fw_caps[cap_id].value with the computed work_mode
before sending it to firmware, keeping the cache consistent with
what is actually configured.

Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 33a34573391a..80cb43b8bcf4 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -521,6 +521,8 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 			work_mode = STAGE_1;
 	}
 
+	inst->fw_caps[cap_id].value = work_mode;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.34.1


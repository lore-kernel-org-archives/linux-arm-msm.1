Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A79A421EF8
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423349; cv=none; b=KxERSmUvawTWqla/6WBVbOQ1UdkTY4OGEob/0sKNGprmJbwdGJ9lQwPGTy8gCSsb3qlDoOFceRFzk2vXi9tHpe9kXS5QM3/oIelRJk0WYQBUJtcQnSFaWaYL0LNFAG43ZtktLMkJy+dUGdGDa+GTg8hdXewA8WYkJt7b2ZGOPFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423349; c=relaxed/simple;
	bh=0yaHqbE49vCRiZKmaotv9cb9lIkaj5ZDnZPH0OHMSsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6U8bWUb5FigrmoX2FsEmM6z5nXoOvEViRDrfH4c5LBk/uczqp3EIubSakTSBwyCxnjnSErULwgZIpxkibS/mTFRdVeM0OCaMWlJgmjO7g7TG3spTUPCAaPjmzJPlu4fmGv/8VzqT3vjOKfxOfT3GAre++uoaqlv+9quFXPYShQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dd1hvBYj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GRNiewjq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dd1hvBYj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GRNiewjq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEcj1p615532
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mUnOyIbK9VQi0Sm8HtRO1Ei6jDwM2OG+aKqpeeNiylg=; b=Dd1hvBYjIBa/0Ze+
	mH4/xszuBq7jRSxZfofMdBg3zFijJ8NO4vv9th020PvAX8c9zdU/0tntqJOPv9B2
	kCaczmi0TQA2rofoEgeDPV+trYEqH7nSx6eHImBEijAXKnv0HUENLuI3krpgs7nu
	loPy06DaLyxLgmAweP8oaI7++B/SkP9uDUfei8vcZK9XrNLtfGCSrMwWU+k/PYxT
	u036wCAw8gFDFl6qaK2Nhqy+aQw4s5gCwy+nj1murFP5GJ1Rs951JbU7pdSYxc03
	ek7pGGqFRICDG1aherv8N+tS6/i17uHGb2akzqJ3LkT/kd+7AGBlbef8Lh8J6DIy
	5u3rvA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8j7r399-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:55:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38827cee19eso2788277a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785423347; x=1786028147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUnOyIbK9VQi0Sm8HtRO1Ei6jDwM2OG+aKqpeeNiylg=;
        b=GRNiewjqF4YUOblf4/Ww9mAAtQVOrRlDfj6ZujpFEZ4FReten9q0ZAKlEcZjdyR/We
         i4zahnmNL3tIu8BmCF08Fp8/rPVR2pwT3xYhqv8qaKaJycQLSCaQRS78ynxK8w2MTwD3
         yx6rVen/e6iaIlRfh7ouc74KbeY8rIdFb8DZREtn/VmR/v494ud1pqEjI1rz4kBBs0E3
         WgkKb0utwfBh/EE3RapwBOdARSRqV3IoJthyNJf+N1lTStgP7Zfcy1HvtQeh2iKpjLl7
         4S+uQKRTbc3Svn4sBKyKceSvMruMlyPja2M97yKvQOAlRXIUOqlIYMPP/f9Cgm/hPGGF
         6rGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785423347; x=1786028147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mUnOyIbK9VQi0Sm8HtRO1Ei6jDwM2OG+aKqpeeNiylg=;
        b=qC9TdGfiHz0VP7/7yqgPUy5HpqQVJ75I0qcg7pSPtZA6Sct/YdfixVMEl3ZLgjQLSE
         /BvBYBDR8jTqx+BsxhVvnv7b4Jyuxz+69vO57UO/8kHh2CSF/LGC90toegAV8TnQDUdY
         MAa698E91B0+6v9mx53v9C6fHwiyMsECyM94OD/vNVA6UQEwJZf2EGYMGKe10+lypPUP
         46nCHJudha5sU1XQzydcQifzHAj0eScIN17VXjHzebLbM8qfiljwnEQng/67Y8HUP+D7
         Z5oBE0pQIap+pgleQHMRabOX8autdH+Qhq+twWlDClLCQCMG3VoDseKpDc58WLkYpQBO
         QZ1w==
X-Forwarded-Encrypted: i=1; AHgh+Rrc3pRgU9PTMF02SwGAKQ3Z1Gn3polD1ZuDCkD9ko+ng0L9d3mffKFwUfO0GqVwEzcjT0jsuIh+6LD1nLHx@vger.kernel.org
X-Gm-Message-State: AOJu0YziAta/3BKybOq/P3EvhcCBgF9rNil/tp9TG72+W8K+j2T618w6
	jLct1GJY7Rf3gcj0HdYSODHhKiV7CRhIAor0RMLrdtaRcTvbbTNCd2mx3UUhRpWaWelA/W9T8RK
	DFCoj97B8fYoFdQ4ykkH43ijPTeI2GqN9VX1qhUywczr9VIPUu5VsCbIiNVw3Hbg9u+W5
X-Gm-Gg: AR+sD10qGzQ3EjeOv0VDkotH8b957FxfW12xB+8dzZXeMlDCSMJ0tyHEpnhbLi7D91t
	Lprw9FhVF7oeKcSmWsVhGFdWMR+vxHGO37frO29YgbzRQskQMmMTuVLZjNVDjpw2QhOTDrHbPHg
	98xIHOPexjKuVW5PU6JsK3Lm4SQFCESCE67G/28TF1q5C/PrzH3WHqwZPvKQ8IGSa8IFUb7Rcit
	eOGCW6UxRw846UviJ5maVs1a4IA5nalFV8rQS/Z6XTZYRhWQgjByAEGFPW/bAFHJJOQIu6jB+Jt
	USMxuIhnajI6b7cDVinG6Az7E1a4PWeb1mPZCn+F1q8jIBCOPiY5pWDZWWjExO982yq5YVr11J/
	VHjM/dTmHjHkV+MBt9uiFvZ76FyIfJEw=
X-Received: by 2002:a17:90b:4fce:b0:37f:e1af:df22 with SMTP id 98e67ed59e1d1-38f9bdd8ccbmr2816974a91.17.1785423346689;
        Thu, 30 Jul 2026 07:55:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4fce:b0:37f:e1af:df22 with SMTP id 98e67ed59e1d1-38f9bdd8ccbmr2816954a91.17.1785423346285;
        Thu, 30 Jul 2026 07:55:46 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b7ace53sm1236775a91.17.2026.07.30.07.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:55:45 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 20:25:26 +0530
Subject: [PATCH 1/2] media: iris: enable pipe for hfi gen2 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris_vbv_delay-v1-1-7b5a7953bcdf@oss.qualcomm.com>
References: <20260730-iris_vbv_delay-v1-0-7b5a7953bcdf@oss.qualcomm.com>
In-Reply-To: <20260730-iris_vbv_delay-v1-0-7b5a7953bcdf@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785423339; l=2601;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=0yaHqbE49vCRiZKmaotv9cb9lIkaj5ZDnZPH0OHMSsU=;
 b=zX0oHoIgCNpqH9RCdhBN9TQMNO2hOzIUN0UlxXufQmliTD9Bd1SpYkgFB6M/B8X9YPvSQtOOS
 xXYBImXZMRXC217l6BNRyzcA1KMKWmBWpk+GaxckfynO9pp9nYVY2EA
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExMyBTYWx0ZWRfXwVcvv5RaWCNn
 2gIPZcvnNHEG5pszy5sW7e5Mo3210EGNm8Fa7TC4UPDpcjAi2z6bjRoZcW20jKiLSREa3MhESrZ
 /vkg8SAmtQcrfwTWf/Gca9bs8bfb3nrXrN0kwU4KRct65/OQEA0BQaou4zAiyKv15lSdnK7TFQu
 swsbbqvwasGPLOY2Vb8Iu//j1DSRCyedKbWHHfJZDBrhAuo4QaHNdJTQLSIczlJfdVpt6nVu4cu
 7cbcVCRP94FZPK7WMTXD+hLNH+FRCQqsliVw41hJ9MH88X3ggxtINVtxRr2+L1uEKwXuHtuFJGt
 Mif3P9n/51ICxF+CMXz66OdMFbDwjafMrfkUZCCILNukC4wDikg3qsvFFljsgsZ2Vkl5tP1oVWI
 8syibqoirQuRMYo5PGXfLnQ0R0KgI9lH7px1EEKi9NZN+D9hP6SSRzoG7YhRdwAgkteP9wuSf+C
 /jh98eUwZ69En7ElSgA==
X-Proofpoint-GUID: aJMZrOvqFUub6IVh6I1EZxtNvx4aa1i_
X-Proofpoint-ORIG-GUID: aJMZrOvqFUub6IVh6I1EZxtNvx4aa1i_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExMyBTYWx0ZWRfXz9M4nmStRxa2
 +lcbclbXIuq7Ok5EGKNsRP8/4i/C3QM0nEvUCdZ9GDTC1F1XhwJPUHsHbZ89JwsKSU3rs+AGmOO
 ovWCLNZohhR0RU/CAXZLeM/AkNO71/Q=
X-Authority-Analysis: v=2.4 cv=LraiDHdc c=1 sm=1 tr=0 ts=6a6b65f3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=loXtWXkZPLyPDUeNfL4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300113

Currently the PIPE capability (HFI_PROP_PIPE / work-route) is only
wired up for the HFI Gen2 decoder. Add a PIPE entry to the HFI Gen2
encoder instance capability table, and extend the encoder
branch of iris_session_init_caps() to derive PIPE's min/max/value
from the platform's num_vpp_pipe, mirroring the existing decoder
handling.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c    | 16 +++++++++++++---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c |  7 +++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..33114d80aa68 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -453,13 +453,23 @@ void iris_session_init_caps(struct iris_core *core)
 			continue;
 
 		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
-		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
-		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
 		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
-		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
 		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
 		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
 		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
+
+		if (cap_id == PIPE) {
+			core->inst_fw_caps_enc[cap_id].value =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_enc[cap_id].min =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_enc[cap_id].max =
+				core->iris_platform_data->num_vpp_pipe;
+		} else {
+			core->inst_fw_caps_enc[cap_id].min = caps[i].min;
+			core->inst_fw_caps_enc[cap_id].max = caps[i].max;
+			core->inst_fw_caps_enc[cap_id].value = caps[i].value;
+		}
 	}
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1..45a418fde7e9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -365,6 +365,13 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_STAGE,
 		.set = iris_set_stage,
 	},
+	{
+		.cap_id = PIPE,
+		/* .max, .min and .value are set via platform data */
+		.step_or_mask = 1,
+		.hfi_id = HFI_PROP_PIPE,
+		.set = iris_set_pipe,
+	},
 	{
 		.cap_id = HEADER_MODE,
 		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,

-- 
2.34.1


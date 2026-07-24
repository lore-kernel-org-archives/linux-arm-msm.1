Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D90D400975
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784884171; cv=none; b=emLTB3SJyRkbyOjtXyUNZoNqNniYhW3eaI0alTvXS17go4fN40yt0UtbnrayEvQk0Nbrs/iQZQV077PH4yKH2huFeW+k+d1WBl58h81EhWpe8qG7xNjut09uI1EKk72dVnWbi4+HBE3XmEaSqcXVUaT68d5Z4prkDVgg4GBwNJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784884171; c=relaxed/simple;
	bh=mjrVDz4H6RpOYzrPpqqkMT5INmyzNFeOGabjHCl0QJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XH8YptWz+YV4rgRoR5RHP3zyCGHE4hR74oicIfKPeU3MvWlD8NCEl+IgmKWj9xQv53Huc4um72QXwAifiymuxgvygCdD/cxgi6U5iQOdEPqxcccrn1tQmHrkePOn6+A2DRiHq0Nbc8s2ma27cOMBFvn+LQPHMj9fUvwrgG1//vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B0IoIC6l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBEZYlIn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B0IoIC6l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBEZYlIn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lWQm1510175
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4fjwuViaOd7s23k+7ReVdvQjEcM0iippnZxvUolPq4=; b=B0IoIC6lgEhlhw60
	Xnw+SEktqDWDKXlxpBR8PwZ5mhrK1S6/VuS9CDOll1S67Gu4DbvkzAi/o2NFGbvf
	/ED63SaaRzsFbfa+osJ+S8VfbDvOfBJpVySihohr1tvyBnqMpfU3U1Lt+h5Yusnm
	Fo3azfJ0TP0VFIMPwGpyjtmmvswSXWkjz4xErEPt86Il585e3mR0AHuPWDJSYrjP
	LDFh8mSKercQuBE5ODhNvAlFeZKw8uHE2V9PFklJHUEXJH88+uS4in28o9yjyFk5
	IkNqtMRzf+DrEPxMXFd5m2cCcjevnPslN00kfTbwbLuyQ7GFtZCSyFpcKjOEIWpr
	WlJvHw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkusrswf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:09:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee894b3d8so4394805ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 02:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784884168; x=1785488968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4fjwuViaOd7s23k+7ReVdvQjEcM0iippnZxvUolPq4=;
        b=BBEZYlIngEzspFiZdEXLpF+YxtN+YsLjWclKWlGk3KEezQf04icVL/DPgBiYMUZeLB
         WQWbzfrm/VWMcFLiVB9VArYLUVW9fLUsDQYepaQXN4+G8UfPktMA3w8z8G88rhIrg3ev
         gzdYhUzGgqJoNg5EiCGCeQDNYmhoY3+I5t8rTGDU7n/VQsw/JWqNM04X44Zx89PPauNp
         +XekOZQBt98N8DET+ybW3/l8T+4jTD79fx21nBLGxLY5fwj5S6zrPv1QRVX6e+DZQOVv
         TIchdhKd5blNUleb2W6CQqBJaYDuM3DcQnKBmZ8sBLlZWHiyU7wR2BZ3i7dhZ3HIqFbu
         n5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784884168; x=1785488968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4fjwuViaOd7s23k+7ReVdvQjEcM0iippnZxvUolPq4=;
        b=lmiEuQ3TuA5wuKrDGFKSXYlf/7ou22MaDBhN2NE0bp6ncQG5w0YP86xBRJNh0TM/nI
         oEVJVn2to/ruK9rHnTtGG8vW/GOpDaoGc7GpGcqrkTX06qjPDBrs7FH8cJ0hz/F9fhb5
         FIi4umf9OzUhbDhauzuOfwCHLc+J7O7o2bjOn2BzsxmR4lg6vK7AZCLHuKnwQpKiD7Nr
         tmnKnSHZJrYJRKQ88v48C1nEybRpLCEFnT8t+60Ev8lplybDsDASrY3YOhfLo9Czggzu
         zN8eE2pg2Yh/kPUIn1eJUV/w2/py6amYvzYjNca7J4UuKITxGlEjXPkC3yLD4y20Ai7a
         eszw==
X-Forwarded-Encrypted: i=1; AHgh+RpfqAER5yXD7PkDTEw2uzovDZFZnsTkwyAY/LJTYxSYclG9Q+cGPFlQyn5CYs1FmEtlOfjkIoWI/yoKMN4f@vger.kernel.org
X-Gm-Message-State: AOJu0YwmXsdDmr+rphei6BFOHG7PnvoOplesIHc+0DYiQYM5KeBP1Mi0
	K6UdaVhh3zAIsdPff/dYMTOmLl5jnDcxyy8Engo9V32Dpe6grS60K7ZypHhJovJ++0fYaxFKa+T
	eJ4v8T2MmEQHch9ZB4vEmcgxPpfVkKDVEayANmMN801mXpzm27GE8FpQxETmuNopywu79R/mujo
	e+
X-Gm-Gg: AR+sD12T2hK2Zw+AlNDPs3fAOONhjWmiLIHjVl8tDdUUX5saOrrxxOjsuEVl6/7Ao+S
	sKnd7DCq03bIcz9MXl3tZKJDmKCAHuklc7J6xQb+vaQL1UAOnLBCPpIH5B/Rjzr0oOvHgkjghmx
	ruAC3pRYwL9JMLfYKoEA+Gj2XyaugkioejcoeOp5AOBfdLJ/tv2dpgnCR5AcaZ3OqAVjhfI8oUF
	n3VvTJ7neSSfWKx3g4v0wh6xOzGPnQEsq3D8xF6u7e04Z9fK1hM5sw+RVLXT96truwTbuT/7E7L
	iW/w1CW3iHOaTmrrkWXSmlG/xKYfvnhifO7LLab54TNyb7FnCyrnN+vsl0FGnD4n2Gqi2tJwe69
	N5JwlQN2xOLf80SdOL8t9m7qxm6lyv0Y=
X-Received: by 2002:a17:902:ecc4:b0:2cc:9473:97c8 with SMTP id d9443c01a7336-2cfa6b7dbbemr74746595ad.15.1784884168125;
        Fri, 24 Jul 2026 02:09:28 -0700 (PDT)
X-Received: by 2002:a17:902:ecc4:b0:2cc:9473:97c8 with SMTP id d9443c01a7336-2cfa6b7dbbemr74746225ad.15.1784884167706;
        Fri, 24 Jul 2026 02:09:27 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a6adsm27170719eec.6.2026.07.24.02.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:09:27 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:38:57 +0530
Subject: [PATCH v5 1/3] media: iris: cache work mode after computing it in
 iris_set_stage
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-iris_multi_slice-v5-1-4fb593d29b44@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784884158; l=1459;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=mjrVDz4H6RpOYzrPpqqkMT5INmyzNFeOGabjHCl0QJs=;
 b=paK2wn9a4zqJTDaD8uutynnzBibpF639fws5USR7tyf4j3CuICrhETPTaAIUgaAzLue2jH2iT
 3EbOlJocLp4Ckrj37ucYxxCAL/xHdRyCT0jD87qmlo6i1bzt5Hs1iBM
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4MyBTYWx0ZWRfX4XzcBs9WsD7k
 +5ZAn6wn1FSt1GRfr/Nq5jKBA1i5TKTmu8ig0fVDtFItDqlIf3GwudrUrkvnFsOpnz8lsKbJFIH
 hj8gpJZcXvW5Sw+Gym8ALuN2fiNXusE=
X-Proofpoint-ORIG-GUID: WRVi0bUiANwxmkxEyDfErZ0pbXIRcKRk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4MyBTYWx0ZWRfX8MIYakUQ2ewC
 7ZdvmheEk3XaMmkOjD6N4V/KwDLECfxB/4AAicC4kwhpjZU33PpBRdePDzZeX3gtcRIXIaEOFR7
 dBAE+KhsmCU/H0v38hE4bW6BQcX1Xmp9IPgf/4zrdGB9I4+lobHhMetSEAWmbKG5viuLX7gg16r
 tKope/Q+HrGwr1IYdESJqAoE7JbsOoAFUEVFlBExNceY748onnViyhT3grXSDVCTdko+fpNNfGt
 pHe1eG0FgHRlQ4/es6KwexuEdtB05kR7Mxa8IR7ZnBRf6+8J7Ve3oYV309ZES7CZDANPnlZcB5Z
 +glpagcz8v9vUKQqNBaWUo9LMCLNtBMW79hFxo6d8tiF2XSMsgULaH0ybU1h6mUbBNHSA20fr5T
 Hv2BmePPfOtqwD/QurUtaKNfcXrIkBHTlH+chTIWmx4RLoO7u+ZfA5G+IdOi4/NjFlf9qvmFPCl
 X4KAk3jpaIyC8bykAJQ==
X-Authority-Analysis: v=2.4 cv=PtejqQM3 c=1 sm=1 tr=0 ts=6a632bc8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DQE9uWRhMQBL0dtU3VIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: WRVi0bUiANwxmkxEyDfErZ0pbXIRcKRk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240083

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
index 10e33b8a73f6..58d195d2ab87 100644
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


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E26439F67
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802096; cv=none; b=Ja5ZUnsjSgYG8LjYF7As+VwjDjd+pZg2zp2ID4D9nsd/MAN2ma74LS9y/5WSx2Ku623d5XYpr09cIT3YVHB10SfvJR+AjM+JvkZvK1tuBocO7ITyjcAh5hLwH8bRaZ41y9jh4yXBiZn7Ype5IXQoNU+hL7RFhmoShphw1suqQuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802096; c=relaxed/simple;
	bh=UmdblSpZaurXsYbimbPkFcYNgBfTLQ8n8EEy99+CMIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9NrGHQA6XoD7PoAE9HpspLI4eHOgg6IwR3jSS0/sVqHE6SKB+9t2lgE3ACeIllFcbh9KtQ/VTXpCyF6QJVHXB1QjHg0UNwkFRR3ju1tA8nudSBLCXcCh1fLf87RitfRWG7OQNSojHoBVVbhQ86D/wctRqCDx5TxeRaUXP5oE0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H9lk/fwE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G6I73DRn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9lk/fwE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G6I73DRn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qY3G3390475
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	judSlP75ZLbiXWBghDPK2goZdlDsavKdoWDvXwUlnWs=; b=H9lk/fwEWjBgknIh
	EJNkqhTME/rYJpf+KCFf6SwuQZNQznWQZD9L/Gm+zxZswtfx7kiYI2e4O2Af2mxU
	scEQqSuupLnTphcMwambNKdhCVZ3jKS1k1dOaBjhm1c8qRf/nKUxe4OPaI/8p+4l
	2ISxmNYeiWw5jHrtDXCbxttEybaUh9uDBtVzslniyd6amkLd/zpaPPJVFBz98Vvq
	6iJUeIgggQU3816xxQryaKP1U60dnlY7vKqpsgfi8iFADae7YiQ+RqWMdlG+H47a
	mj/3nkRqFfi/6d9WXXDe+IDnJXrl1aHXpam5ZgLB1KtiTcfs788xXdAdbt0BdD0w
	adM/SA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke0kru0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:21:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e058ff6cfso1069665b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784802091; x=1785406891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=judSlP75ZLbiXWBghDPK2goZdlDsavKdoWDvXwUlnWs=;
        b=G6I73DRn9G/qk/FvV1QoDctNXqZ89IjGY/B72Ge+a283Rr1aGzTyvedSUuu4qlJ0Zk
         cDqq2yDNrJFB9EM5d/ZgGGGWUVHuFvOjUWBXzIPz/nIG6oVmNn21iT7nlkq+u0A6ikE4
         rSfSj96rqUEXB0qCiGC0tRwCUvOcBIb+J/ywoctKcy8lBOo+W0HhyEyGNMCEsER77JeB
         TWtNvXjYQpny83/uIzfJyNIbW5K/0AJ584q+bW5ua3VYClJubmGaDUtGeNPdrkeZcaA4
         /Rr2nZh5Kw0txFmsxPHZpMrIw4dWshzQ2wdPGCHFBGOPenE12MvPVb5+qHGz+wDrQoSh
         12PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802091; x=1785406891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=judSlP75ZLbiXWBghDPK2goZdlDsavKdoWDvXwUlnWs=;
        b=MBz9YlYaqTTHkZPOj1yVmY82QPhnUylPBIgR3zohcuPprRtulqgeU6LhSWm/Lot2Qp
         StS0HaymxEw9Kf+iT/r1RFhFpO9Ahoc0aqMjuh52BumTeZNOqeT7y6XGTGd1uOqSSJxj
         RVyJ3VVNeyHdRoKkH6yHrLOr3S1ASd8nHSp5yOaMkrE8dErLJy78dlL3UTNwQLw8OkiY
         wDBLgfomOwCkhJb0ylHZQXq8QWXivgJX7fkRE34PpgsqpokE1Wd5npDoJ3HVXmMqjj1H
         ZEU1LQkAf17u65X+d1S2lOOzA5x1eBvVLGkoyVz2kfIanE/lD/sL77O0ZuyfVATDmX0S
         FxYw==
X-Forwarded-Encrypted: i=1; AHgh+Rpq99m5jzKxsZFseQvN+KHNovW+1X606rxjaX51mGByA2rlCo4UqI3aDTCyDuvMBUTlqUvAHFWgpL6WPpyq@vger.kernel.org
X-Gm-Message-State: AOJu0YxXd0PQ9+Ph6U5UI+pZ3aYFxNxukxgX9ZEyTnCKoUUXWPLhmr6C
	eDoAAeV7I1kPG6P1LsMBzLDVobgP9MdGfTWnBim4hEAJGa953Z4LNqcpxl02AlOMgYFXZ2IiyCP
	H0Zvhl/GhhBHdcZMDOubt8Qb2w7BkBLBQrMkZ1PSK6ja5MnJ5DAd+J1mr9FVtisATUGmt
X-Gm-Gg: AR+sD13sAsBv/g841j1SsTCycHhSG8aKR7+Ps44T3lOKfNVkYXYGdtFG3kQZLahewZ/
	51yIlzrZvuJHK+2C0iTL5UFH+i9gwo88z3q/CWkvJhVsiZvaf0K8QvFVKZePcr49iEH3jPINaZr
	UEI/26YTNt8vWWkaGwKV4RkwhAxev+9vhPmJ4ZqCVqDK4oB/LmrGHARjLg4gt3/BUkTT6AW8I1i
	KyfIGa+LvRaTcnRh8gR39x5kXkKHCZ2jYvOjOUFJVG1jLo5eUZJFhma66Kk3QMLt5GTgCcyBjXQ
	l6dR012NIa5O86sDv0XEyhUS7uUPX1O7CXZ+HjKYl2LxkfVLabjgs95O0wIW9wUoYJi5nO1UXkq
	Ow4DaE7HNCMxez8DI3RaXRhhWK+KbwhI=
X-Received: by 2002:a05:6a00:12ce:b0:848:50a5:a70b with SMTP id d2e1a72fcca58-84e2bc6be0cmr2803089b3a.21.1784802091194;
        Thu, 23 Jul 2026 03:21:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:12ce:b0:848:50a5:a70b with SMTP id d2e1a72fcca58-84e2bc6be0cmr2803055b3a.21.1784802090737;
        Thu, 23 Jul 2026 03:21:30 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17285662sm2781395b3a.20.2026.07.23.03.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:21:30 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:51:13 +0530
Subject: [PATCH v4 1/3] media: iris: cache work mode after computing it in
 iris_set_stage
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-iris_multi_slice-v4-1-45f0a3fe7fce@oss.qualcomm.com>
References: <20260723-iris_multi_slice-v4-0-45f0a3fe7fce@oss.qualcomm.com>
In-Reply-To: <20260723-iris_multi_slice-v4-0-45f0a3fe7fce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784802081; l=1396;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=UmdblSpZaurXsYbimbPkFcYNgBfTLQ8n8EEy99+CMIw=;
 b=F9+ooebJvkuELuNzkFk5+MqGqOBn0gZUxVZadAybiu7GQIiXbJrAs+tEZixzAHfyFkQwrJYvX
 MBRQ4oGkgDjATrWrKdXSjZWX46XO7dyuEkDLZ4p6ERTmV9ur6fvSQWT
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-ORIG-GUID: ONB-k3JqxaPXPVTNgv0gpOyOIyL3K7BF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMSBTYWx0ZWRfX1uBJq2QAtk2z
 QP/QbC1bJQcpKxnEdiWRlb5pU7ZAFzOVOIVUhEnncBESL/m4fMwvXBSOopx/BjTy3U0gh1wZG1y
 fUm5u5gl9rNkSywcMd3tM8aJMCMPt6A=
X-Authority-Analysis: v=2.4 cv=S7DpBosP c=1 sm=1 tr=0 ts=6a61eb2c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DQE9uWRhMQBL0dtU3VIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: ONB-k3JqxaPXPVTNgv0gpOyOIyL3K7BF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMSBTYWx0ZWRfXwB1l/DjCbMzS
 ehw4FycRvcCaaxLMBE0zw8KAZ6VlWTH5l0Y+b4fMM+cn/Q3FSJ8O74kDWCoRCXyzjP1dxyNSyuf
 mNWHOZ4gxyuevAQwmoFPvWuMplzX8tcwf35Ugj6Kr92uYfRNSk8pHDpRXzwVHEqyENK7dGBvHWU
 byy2gKDMMNVJfpyIaQjnWxsHVbyXk/wfO2dKl2eqDiRZ06/XPd7dEt28axS2SbCF7eTFn2gCmUt
 ZbLGJ7Ht43x+wfUpS3WBGDsz2FVUl5UAxy8EfEv4qOUxMmWkN91xMMxgk4vIsXnPEQtVYBWKEar
 ZVsszG+tYFioTRfqx6lgzejzPLTm4r5awD7vCoQJ5uugOfRfE8+Huot3yFtB2Tjd7n2tdpEXsfQ
 ufKRe6ALeXz9wJ/MRcfaq1EHijlWwR9ggJ9qQX/FdNfbLmIATC+aJkwLpTNuSrPeKe4tGU6p106
 UpfadTu4iSVknvbVxJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230101

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


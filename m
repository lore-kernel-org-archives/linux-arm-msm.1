Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1702539184A
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 18:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002952; cv=none; b=YRKX3B0y+5d1xHVIzacNmJQQlLmriCSTUl/N6h9IHdcq1GOvoS9VxwXG4P8XaeY9zcryaVxXHlrGL0MMLclJrSyvOkQeKMjGBMGsk1rpc0rIJhk3CLKCD818JSpSDhNY3OlwZ8a4xadK8DDc4qls2CyV1Eo7HG94eFe/t4m5BBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002952; c=relaxed/simple;
	bh=mjrVDz4H6RpOYzrPpqqkMT5INmyzNFeOGabjHCl0QJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o+QjDZIHuaTzGhnCqsNfr+lvc3MbvuO3ovEbqfLewwORlf6lcS9zRY8m2YdfEaQyRXgeynonnB6i58XuFfWdn+LuZ+AqDxjaZJolAtLUnOaIxtmRPtKGappfjIQA+r5WxmMBwKRvuM1yLg6IKnb2IleyS/hsbDez9nYaLM4IbiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C2/y2Ota; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TA1YWZuc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C2/y2Ota";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TA1YWZuc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66PGwIqZ2464055
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 18:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4fjwuViaOd7s23k+7ReVdvQjEcM0iippnZxvUolPq4=; b=C2/y2OtaohTHBoY4
	M1VbnRb4gA0jmAVcNDuqEVwzMNtf3Udlm/WjLaxPkx+HBgZ+VOOZLfhbABtTMMqJ
	8dlEhdEbkrhWpErlDUWj5VGd1ZqK4mWOJpstl7enkXwlJyYLXxfe85aOexXDIWLr
	ZoC76wIsjh41OWj9nzw72m7Vh4r1xB2gNav2NNW6WQRX37j84iJSaFHOqgOPkAXY
	DhMYdEnYH484Ihwwc8Us+m5rW4ZtTOkgld/sx61fH/AZhyCPaW4hQwwLZWGeFNiW
	HRfXiImDTDJcL1S8ZPvNRn7/Gi9YhoArs3kOhqtobTdd5j2eezw0HafAU09ZdxuT
	3lfHPg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmfgsgcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 18:09:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso1630748a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 11:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785002948; x=1785607748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4fjwuViaOd7s23k+7ReVdvQjEcM0iippnZxvUolPq4=;
        b=TA1YWZuc2tSM0C63mMYxnqzBGDqIaE++Q11Ym0HlxmCvdUL4gS1MGPPzVrrXaCGH6x
         RmbYmHhJKGtXALXjU5LTADdmgBkvJera6zFWTvL/H5jpme99yzklZzlPbuLMw4oH3IrJ
         543J8eX6/dfWZJ18uA17xFZUdUX2nl1xPeEzdP6/qS7oXXPHxPchsmAuern/Tgr5fM5b
         IUZfvsrrAz6Wqf5W3qiWZvGKUHomdGrkN5+t3TudljnG7HZlnDMDpm1siZr9BZYODFHA
         WIOH1YjKJ5KAo7K8tSwGHMpgiHS+AzWX6S/hFsZjmYgCln3uMaXif9joZEEBK/0hr77X
         EEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785002948; x=1785607748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4fjwuViaOd7s23k+7ReVdvQjEcM0iippnZxvUolPq4=;
        b=h+2Quwyxtfh9a3w6dIZmBxMUWneSpnsv5SLPOUEiE4Xg1DUtBNkg/R3O4b5x8E2Uh3
         VVtaxhsaJi4ETRaEDYLNok9PsBlT3R5U16GLDuj56SRIIXd35BbD7emuOquXZOr6433Q
         d/c+i10T+pMriLR7oKhWC9TJcIc7BJdVb7DSUodAxQKSSs/MOj+rjkFRzEDJTB24cEjw
         Qu7MOtGolfoCpS2pSLBmkkCmmz8biftc1+GRYA5nkAzkFXPDp1O41UpigkCttAnqDUDJ
         aQEbGHujFQkPkERqhN4pWEUzQl6JQ6FDgNqk46RVXffr0arXefPgw1ijZM5TUzs837Pu
         Qqhg==
X-Forwarded-Encrypted: i=1; AHgh+Rrs0Xs4QfSy8x9jarZ1hmKxFEw2VtT2sZcf9I/HZOYnkSh+85YPJAy3+YP6YsvatjYOUVTsK0M4NLDEXhfL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuzu5Grn8K+Lp/LUB1ytr8KO0EG+6903andUDjohXEkK31lAnu
	klk6IZeRXo69Un5LxxRtty3jbkJquMaKjtPF9g2s5hcNTd4AdHspHAWhdTBi5yOHX0dF+ki8EtU
	NsG47uGGjfDJ8Obr6WqjUULYfpqm+kx2MK+LfgVQIdroJ9xTML39l2BWfeG4ZPoqRKHoLfUO+Yb
	MY
X-Gm-Gg: AR+sD10e3vXk/5MKDA9AG5NRdAHseRhExFhIigOEnDVlpi1tx8RQj5DyoxZ21SO3M8U
	C/uUiLFFVmSvhgwSHZxSvT5xto2LKc51qCBmeVGvvZVvaMVcY7Rm+/wcvCBLSdY7NHMYhOpov25
	9qgYTgwzbiSYJtgbHlRcGXISnxwdJAnZbUhQqcbUzTMDirPuDsge8CZoxFMmtThfzCL0nIHArMM
	7FYthApxelAjf9AvPOLqXSpAyjxtfNVb/6y1Nm3MPLAdKb3PCew3CY5EwSsnmf28RrBUbCZaf6S
	xbUtZnpReSlR3n84gGUuQcXFd0Z0pyQaDaKLbXdfKdJcgmHsUjqcxQ7SZGnax0MSVomq6llDLbS
	UhWcriljbxeCIuI+k7UMpj3ozkSEBPOM=
X-Received: by 2002:a05:6a21:1f8a:b0:3ba:f5c7:6bc3 with SMTP id adf61e73a8af0-3c67d95a613mr2891929637.10.1785002947948;
        Sat, 25 Jul 2026 11:09:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f8a:b0:3ba:f5c7:6bc3 with SMTP id adf61e73a8af0-3c67d95a613mr2891904637.10.1785002947512;
        Sat, 25 Jul 2026 11:09:07 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419c52sm12592642eec.10.2026.07.25.11.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 11:09:06 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Sat, 25 Jul 2026 23:38:51 +0530
Subject: [PATCH v7 1/3] media: iris: cache work mode after computing it in
 iris_set_stage
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-iris_multi_slice-v7-1-b4365c4930fe@oss.qualcomm.com>
References: <20260725-iris_multi_slice-v7-0-b4365c4930fe@oss.qualcomm.com>
In-Reply-To: <20260725-iris_multi_slice-v7-0-b4365c4930fe@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785002937; l=1459;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=mjrVDz4H6RpOYzrPpqqkMT5INmyzNFeOGabjHCl0QJs=;
 b=qAvhFMi4klyTucRFl4WWUHISZBsWsMYWC9i9jKtK3hLEHlqK9m2QUgCUlhPBYEJC5Xr3DMlaF
 lzS5k6qv9nQBpjtp7DtBFUGsfZYlpa7VZNUKq6v28dphdXzaKoVKd/1
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-GUID: TcJ0YYeCUgX8XyHz7vy0D1WOo-ErYwJ5
X-Proofpoint-ORIG-GUID: TcJ0YYeCUgX8XyHz7vy0D1WOo-ErYwJ5
X-Authority-Analysis: v=2.4 cv=GdYnWwXL c=1 sm=1 tr=0 ts=6a64fbc4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DQE9uWRhMQBL0dtU3VIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDE3MiBTYWx0ZWRfX9sosYiWFZWKf
 Delq1mpFZJ4K1fWlmjlMb3DQwwuqr13USXEyrXp5NUTPJ8M5zxrgRkcQ5URoFPkz3X4KbxWlAMG
 rAGncdUWw6C+5e0j9ChvM1tF/fs2AQE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDE3MiBTYWx0ZWRfXxQxiLFTru47G
 7W0ZTa2Z6gGvAusXfBUaoYQ1VbfxKX0GK5QMg3WG3165r6aFxQbvgfCvx+btVVU4mPlokkaKqjX
 0LGcrPwdz7CMZYOb39n8QrTtbuKEiPQoPx18vlohjHJESeg/KayEywvjADvvRQ60THVNFBMDuiX
 upBd3vwziN+QLJuYef4OC2cFtNpQVF4NA2YJLfEvFZfwsLdI63UFRfY1L5vfR+Buy8LOsK9blSv
 w4+l8ADn7qtzJI1aBhj5siOsx5C2pzKg5zVaP+Bc2pe7QcLM+cDJ9tnLjnrgwVkTzBX1NgrsEJS
 9BfrwBPgXgF3z8YBhca1eFee3exBPRYnped/I8+yo23CKrKUlkx9y0jf0o9LurifTZYh8oUkSMk
 jsT/xmL2Ya2vZWoKZodZCFJr4yf7yhD0jdHk2S8JdpIg7GtyLmdvvTzehUuNGe6ulDwKHuSEUuX
 9oDx/J9ifAfnrjFaDiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607250172

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


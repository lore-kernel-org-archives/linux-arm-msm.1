Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FDD3A6F04
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 18:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002957; cv=none; b=dpFeRYNt60J39LCmDVpL7ZnhziABs3h9IVNyUsTAwAqbDl3Y7xf9rU37KycYTqUXz/MlRN+nWugan317oKwT/LE0o9sfGU8FLMKM9Vqj/ueQ0+h9VfzjBp5zLApgvvUv/w2zMxI0wXJqrYXvABJGqkIA7qkb1t/kNoKRoIUE/YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002957; c=relaxed/simple;
	bh=vyhhtZo2WdIR+FGNDgM41Ud6FlKDiGMJM2eDDf1MrJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NCmLQiT2TUgyh2ed7KTu/7nZ4VkN1PHlUezIs68/oqlOFbz/LO/jNsiLMe5qwHJKdMj/NuBGbcIkIO6rT5QBsEw+bMv1IW93dOMYTKdosEnpFH3PgCWCyhFHNZ3FbIkAJR2OroM1ET2V2dkzGj7whqOoG163odPfa4/JCf4aHc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUcUWyg3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/nOA43N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUcUWyg3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/nOA43N"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66PGwXsV2443635
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 18:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jqEI+F/1SIBbj6LdgTjUTc+Y69JPX3b2PxQd4sqwy7I=; b=LUcUWyg301/LImfy
	29dTTFOv2znmCc9lABK4vAfWYBEZxrLyfE8Zei2Fj5F3pRh53eaJIcSJj6dBKdBo
	MrnBickbsnQvH3CcTjrhXr9qX+VaKdO7kSLUmaoBtu+Y4MT9zCUGXxFHGJScNtW/
	D+SPPKOtYKYHQHTIuQxbehqZ1rjcnqbWlPFVeYhqkhN9PMtsgB1VPcENee3XFQv9
	9Rtr4G7QtwbZKcQyw48AtClFpSRrE/84xYg66nv12SAoie5m5G2p1joDCgURbAoD
	NZzpe6JhRrK1Psa2zJEVAPH17n14ENf2r4IxvoiuB2iZeE9R7VejXdMfptLZ8KWV
	KjgN/w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjgn1t01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 18:09:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so1706958a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 11:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785002953; x=1785607753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqEI+F/1SIBbj6LdgTjUTc+Y69JPX3b2PxQd4sqwy7I=;
        b=E/nOA43NhnKdMX7Dy13A7FW/+7T4qsO0v4RVSUlskoSKfpIVmVAD2wy+XCitoYvbRg
         BDgv2cx2Nak6eEuEg+uIfKmDHfg2ftOGYvwOh8fuvJULVqKqigfpXMmJXIvjAU4VtcXf
         cifaDtCReF+wz5NHxoHlVQCIqnHm8JcrulwryeuNeOUimYDjdO5MVQ6ODhAmhbrVLuPC
         4kM+9uI9j4Kw17oHhsyJNvW84z/uU6u1b/ipn0igAZuP9SCtDchor/pU6iv6t/JVadCt
         ZhZR9/tEcvrs5VynrW33xTBuMJjN3xVq5Z+V5/7fpHqWmi1pkcc+3glsAGY7aFJw/c3N
         C9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785002953; x=1785607753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqEI+F/1SIBbj6LdgTjUTc+Y69JPX3b2PxQd4sqwy7I=;
        b=M+STYuCnHsQxuhDf1ZIY4XuSAq8c5eDVxfHD4W5/wQ9hhDksS/LVkiSaXyMsM+DcQC
         t56azJjyTXw6eKyY5L0q5NOpvGN+m/FpBUkGHF4oU0NCB3O/wlCzs+Ln3U5yEiqs0sB+
         CbamtHuMDcwm7me00wxLEQOp18ly487sM2IHZSfjcSvA3B5XNSC3x/vU+g5sAJAMkFgh
         rd5f+VTb7645gLn/XXepq+GstB/ZufhrdjevE8qCIewR4VN0hjnHyvcbbz5ElMKgXwKI
         Ri2HwqtjrStVIC9o4wFjupRdJzKy9OUc/Fj77Zp3dXCO/wbdWSGO620wF0v0yb7BoiFc
         Vl3g==
X-Forwarded-Encrypted: i=1; AHgh+RrcSzUaNMZUdp7gYtNcYtXv5sQzXQreh2HapwOdLAYPp+fsmesAEzMiwOWVyFF93Mf1q5rqEj6NnxVbXb4m@vger.kernel.org
X-Gm-Message-State: AOJu0YwVCdSm190ajFWKHmVk5qLnVf9/NivD5DZgH4LkYZthOZxcwifo
	Mu6K3Rhi7UhVr4uTKlzNWXEKSQk5QTxVQOw19mwEh0cXeN0WiSR/Ge1APOnzK8LEMxlUp3wSxms
	UJig6AjemnZdm/A4bkMD3gICWDzsO4kbvZric+XZU0dqqHChfYm+tposGtKvMgkoaXnUb
X-Gm-Gg: AR+sD105oms4kUPvdvY6EvzTbujtr9CF4zW88qU8zy0LvlKW8/t8zMZKpl/mf/uuLma
	FPqseBRA5VEnfLZm9JtlRc5IU6EmaTeeYhj3YKoamsIGhuhthDlAFEJ1chv6esUuVVQxCm7I1d2
	1TK2h/KSIVASRzFTHdlo/9QfoBidvYvlANxuuO2AfRNIUQm9fQ3IFGFfdI0uTqkgeqvAMMooZyJ
	imuq42+WZbbSfu3I0MXT0Zy9JbvtAKB0pYJccf2MbTSMhY+NulJWbOf4ZFczCHNwZkXkGPC1aUW
	Xi5xxuq9ZowRFO1XGVdJYhr4m/t+piYfCMEYX2D7HMiPfiBPHx6rkrUCNgoojWdn1khKZmfdfDM
	tSeCXMnfQcNAm30sXOp5Jb4PcRp1Q36M=
X-Received: by 2002:a05:6a21:389:b0:3c3:812a:2198 with SMTP id adf61e73a8af0-3c67d9b3db0mr2834686637.4.1785002952867;
        Sat, 25 Jul 2026 11:09:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:389:b0:3c3:812a:2198 with SMTP id adf61e73a8af0-3c67d9b3db0mr2834672637.4.1785002952425;
        Sat, 25 Jul 2026 11:09:12 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419c52sm12592642eec.10.2026.07.25.11.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 11:09:11 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Sat, 25 Jul 2026 23:38:52 +0530
Subject: [PATCH v7 2/3] media: iris: force stage 1 work mode for CBR RC on
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-iris_multi_slice-v7-2-b4365c4930fe@oss.qualcomm.com>
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
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785002937; l=1399;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=vyhhtZo2WdIR+FGNDgM41Ud6FlKDiGMJM2eDDf1MrJg=;
 b=5aVzxWfCj9vXuYdXUt1d6Mq+kMJsf5iZgrRZGYkyDUuEezK49o09tlv/nwQA9fWB63wHuOVBT
 eBWjfdYljmBB1+6iUh+KdOvXQkVQu6TuBzvAm7XCjZ1pt/IHT3dtj2G
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-GUID: 5ob0GCMpw4zUILnHwPju7A8Cymv8WWE6
X-Authority-Analysis: v=2.4 cv=HMHz0Itv c=1 sm=1 tr=0 ts=6a64fbc9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LMK2Ni0dcLaqO0rVonUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDE3MiBTYWx0ZWRfXwoLfDuDhUGD9
 Rh5l5bmSOxGHf8dQ6TM98I9D5KAGz7mrYRZ0c9RIFA7J3UHh0FVQ61Q7ejEwbR8D0j7MtnfaOTn
 gkKxqIRgEvLoqCkv6yOJJjZa61dUWwb3vC39Ib32G68PdAhsheiAZQE1oozO87eSjvkifSrRw6V
 zEcAxE2r/n6X1GSI3h9g1qGvzhGSQJGDmMcpFKuUmqQHIlu2bsHzPxOTTc/7pYn62S2EnvVKAzA
 OxtrxM/9Opb8IbeKCO3Yr8TXXXgLrP324voXzrGscoWe0aOnNBijIIjXyfdzGmvVnWLsFHTe4jV
 swRXBJXb8eEZhcBeu7jZIn/atgiqxIdA86nud/Fcs1HAH4QQIDbiZc8TjvCPCQdxDyhEvEzAGnp
 C/AAZ4e3gNFpVDl5tDBRRTFRQ4PjS1qjX/Q+A0i8xbf0lZVdaudUMsMLBgPClXCpEdzkqODEULg
 1rbtbcO+4Dfzby38ZMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDE3MiBTYWx0ZWRfX/sXBvVCBYClr
 4ysbSAfIMwaONa1sEipaV11bCqXKND9mC+seyhKZOEeI6egpSlHsKngsfSuGEIeGsNfyAO6xQoh
 w4vjnxy39gUTOo9KgTLY1yfxYhERL3w=
X-Proofpoint-ORIG-GUID: 5ob0GCMpw4zUILnHwPju7A8Cymv8WWE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607250172

iris_set_stage() currently always picks STAGE_2 for encoder sessions.
CBR rate control requires stage 1 operation, so force STAGE_1 when
BITRATE_MODE is set to CBR.

The BITRATE_MODE fw_cap value is used instead of inst->hfi_rc_type
since STAGE precedes BITRATE_MODE in enum platform_inst_fw_cap_type,
so iris_set_properties() would still see the previous hfi_rc_type
when iris_set_stage() runs during initial config

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 58d195d2ab87..d7cbf6c3614a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -519,6 +519,9 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 	if (inst->domain == DECODER) {
 		if (iris_res_is_less_than(width, height, 1280, 720))
 			work_mode = STAGE_1;
+	} else if (inst->domain == ENCODER) {
+		if (inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+			work_mode = STAGE_1;
 	}
 
 	inst->fw_caps[cap_id].value = work_mode;

-- 
2.34.1


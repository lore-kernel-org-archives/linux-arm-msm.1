Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12883B7B8B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600464; cv=none; b=LjwR+lJ3BZDYL8RnQRIOlgxiBW+53nlr7tfCqh+nqCp4PcBuMD/8/lYEChpb4d84b2ym4Ko/os+W5zhlZa2aOoDn5uQ/ShWcKQELM30VwByqpD7qd0fiojQBqEB2/T4s/pObj3AKKofPzt1sc3pa6ONZ6tnCoLN9QMueOKx33Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600464; c=relaxed/simple;
	bh=n4pE/PcvEWZzeTpoSlY6lKxwxe+uSs/55pPo3p5h6bE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XukLGW0bmiQ1IReq6ponTm7U7Wx2URvzOPXN/ixTe08dJUMYwwb3i2p1ty1sjyD1u7/ulvvmNnPlHPj4hQy5VJI1dnrxWosw9YiXmKxMG2eJfhbssHlgcU+owEWzUl22OGM9m0Ywuff6Fbg9SIK7Ziv+UzYWloPYkpHp01AjfeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C0mCRd5L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HETeU5Vw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0mCRd5L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HETeU5Vw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCQ45045341
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1dyzeFwy2wmD478Vk6alHIJfSDAHvMfyn/TPlmSNSoA=; b=C0mCRd5Lvcsy75kY
	g8ipwuENVXrOj9Wff+gTAtG86PdvveZzUhhvkFvZztQDTX/lppkSWA22wnG5U13W
	fzY59FXA4xkZr87/UHRIwlU/EH2d8F23dAvfy75WXSeSOX7SDYPsPLd+Ni7OHf7Z
	yC9+q36+DvCsc9oQV+GnABNQpui7o64vl/KTr1Fhna9EI7mXUbPq8WnJWYTwJdqa
	Bn9gXP8n0ZS43xQiSs22FQTkYgcs68gAqRFTAn8E4yICeYRT+rc/LT9/zgUMcq1z
	Y9r2U6TdtN18uZQwgdgiDZYHnb3PofZvmviZGmT3tjsKNdHFs4SXvQI4t8xEyHI6
	qFsBkg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5staq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:21:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so16371445a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 19:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784600462; x=1785205262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dyzeFwy2wmD478Vk6alHIJfSDAHvMfyn/TPlmSNSoA=;
        b=HETeU5VwZSUwJwtw+GsGW9FgiBYTBKwAobg7DS2YC7ZMnwd89UuOuM0NBzPR+NvuGU
         BuXNwIv6VL+a7IrxeOLA8nXDZi4g5TOV0cDzYi3Kcbn8Pcq2gjL8OuNE/pHKBsUkESjW
         Ym/TzFSYzTF03/5AmojI2p7mdPN5eAFaw5QPiX/+z6kctn5KS2fyVM0QvHxLNHfTYqc6
         4b8N0QZz2lRlzPXUKfL/2aPbhbLGWQ8IFgE4TXdiZ8kqTleVTeDrOwCp6Vor230yTcat
         dbHlL3+7dBhVG62US7K9d5HXvdvgUupIrCXcs+aAB3h+8UzVPlubHcwxiVmlKgH3PWzl
         WeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600462; x=1785205262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1dyzeFwy2wmD478Vk6alHIJfSDAHvMfyn/TPlmSNSoA=;
        b=ENFV+k58dY4UtNcG6ztYzy5+9JehPtmcBUro8q2ehCyr/W3qwzH/S+ZkHawYKFpsho
         546VXdzz8XsKWJ58R6Axvzbm3OOLOCpkn5do89mtnVaOm5pYt5QcwdzjFfZAFCxnkBx/
         EaqHgg/pNavGEZbInbq7zmYcMVhQpyArmYKU5rzyZvVvSzfe4iUe4pbzdJvbnNmFBpQD
         erMENuaZUQX0xBaVyi9NcYPQgrNLK+6WK2Z6Roxd9U0JhGn+Azpjfbe+DxYnVkMrADSg
         Z7V2movvgQXgKUVTzCjMTDu/RkKzFmlcCp/hRL7jdPPurRp5BtyD3i/cbZiuvXEgvuMd
         5P6w==
X-Forwarded-Encrypted: i=1; AHgh+RoiQRpF/zR9orxvMAChmPpuUmS+hhbYwokXNbOnmwFUitoFhNALuabDijHjq+m89jS2/dH8pOjLjutjWMyT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ZyerFO1VqMvYZo0OJe+ZIa9Y6RYBo7EmekXiSsN8mfHMab4d
	qelNg36libVLimfiDVxUFuWQo4VV6ZCJ3DD80mT0wrp0uqXgP733dFuhKRM13Kwiqu40ZXbMeC/
	mmx2I4tz04464Tl2Sl9+ITBrLjAUKDMp2eqyWD1cvb6v5owSIqEER0JFK5yjd1m0ruP5G
X-Gm-Gg: AfdE7cnFMQOBmbrEUcZfnIHnUxeKreJdGDYFYPtrd3fuVRPJgK07KPjKZRJeQ0t8Vti
	ZRdkntJgK82X3bijVnPBTXv5lC2nRa+aZ+MbRlNrm5eE0FsFpP22wMm7U7Z+gDhbNaGXHR6yAAf
	7ETxv10kOJX51g1CtQim08afRU1RX4LdX18VvHbcOQ6faP6VTmk2LqRmLFJeeonSlDQTuBuB2I3
	ch6JVKkjabuUZzci3ItR6ASODWpVXH/Cg/Mqt38nWbN1sddkJAAmflG2dBe8wQgG5g5XcybN2W6
	lrO0Ksiel5XHE091obG2KlQ3P5i7eJWqM7W4rTbe2dl6aXcVxPWp4GUfwnwvudhWLJjEgnR1kvr
	SxtLoTq5CCfTlywomhLRhmpK+AxPPLVMj5Q==
X-Received: by 2002:a05:6a21:6110:b0:3b4:71a9:cd8f with SMTP id adf61e73a8af0-3c3ad947df1mr19336675637.41.1784600462222;
        Mon, 20 Jul 2026 19:21:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:6110:b0:3b4:71a9:cd8f with SMTP id adf61e73a8af0-3c3ad947df1mr19336624637.41.1784600461732;
        Mon, 20 Jul 2026 19:21:01 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41001457eec.24.2026.07.20.19.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:21:01 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:50:37 +0530
Subject: [PATCH v4 4/7] media: qcom: iris: Remove dead assignment in
 iris_hfi_gen2_set_tier()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-iris-code-improvement-v4-4-4395bd8acfbb@oss.qualcomm.com>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
In-Reply-To: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784600434; l=1375;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=v4TGOIryXJf1jaLweQz1Bljs0ZWldGVTXkq+HRfD3Pc=;
 b=61Y6QivPlqFo/0AUYQtPBKGHghQ4dCDAQYllnRGuKr/fNysu4E5F6lzkqmBhY/mgktmk/oJvP
 0mdHmaq5vzAB+B0HcfBMz9PRgMAhhWiYU0h7uzpw3J6nCwwLdbtNLzc
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX83PFTJxcZj8M
 x26LnfcjNo0MRb/6n+2zldyAIKeh1uVd1CL0rIFiDDfAPtt8BIKB1Iti6hM6l16rUiosHJDbyLp
 5OOyM2Ex0kYcvKpJpjJHLdXvulCnXhVr6Spn0sABzxBVxbKj8/B4bvdtUvOINmHxEAe8pKXMiLd
 hgveo8rtWTrZ+E1q+pde+t1YdbOY0b8U7ogpEE8Vd8ymL+oU+fDTqCVkLS1le9BGIVNzWJuBnLb
 NBpqVzZORjAUnrUxqzsFG4h5Vq+Pe1O60TENdagja9jaBMIr07MuzdszOhE52XnA4FdkClNCxeH
 wuF8Lu+Aq37BVDa95HEd5X11jGnCiLnRPFcWRLgcoGb1dw6EKP0OxEiE4VZCXR5cM4deGDrk54x
 Z5tCrV13b1i+VFjeH0YpSjO7UKGWZLMmWZgas9ymKZaNdOyFddsuYHpQ9hds25XEheHgRmnbD8z
 iwRIfzLsKQipMnusAPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX+ECEDbJBv0LJ
 PlrBUAfnF7ymk8GYlCSC7UkWPRrfOslKu9r5RWfF+x9caSL9C6OIgjtcFbQ0OkuEEdPJsyfRtbd
 Rp/Z/hwcfAn2D9HdRGpD/kqagfo06yg=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5ed78e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7A-KeLSbcoVXy4yL1OsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 3mjh-eNJjO0Dnygjc5D8V4cNrDKiECDR
X-Proofpoint-ORIG-GUID: 3mjh-eNJjO0Dnygjc5D8V4cNrDKiECDR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210020

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Fold the ternary initialiser directly into the variable declaration,
removing the dead store that was immediately overwritten.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index ca2954f8bd3a..62283bd448dc 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -603,10 +603,9 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
 {
 	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 tier = inst->fw_caps[TIER].value;
+	u32 tier_cap = (inst->codec == V4L2_PIX_FMT_AV1) ? TIER_AV1 : TIER;
+	u32 tier = inst->fw_caps[tier_cap].value;
 
-	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
-							inst->fw_caps[TIER].value;
 	inst_hfi_gen2->src_subcr_params.tier = tier;
 
 	return iris_hfi_gen2_session_set_property(inst,

-- 
2.34.1


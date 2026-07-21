Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7773FCB32
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597821; cv=none; b=ndoUyAG1RfLoC0UNj5SQ74PLNkrdfuJzeQG4VH7mFQNTuYC7sjs1lURTaHmsFukV9zg8c9OL4CIMIiHMbGiUhz7jBHPWwRqVKQ161sb25B64z6L/jKA8i5RrkurT6T1tBu8BUEcK+TFQuzvsHOEj0oHvnzIAAPcrGDGZBXcXkO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597821; c=relaxed/simple;
	bh=3j2x1+lQlFcMTdsCcuRwFmW78M+AsHPWoRABLZ3MqEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kC+cgGK/ux1v91Etv7BQuFCEZnQzZRPm9Fhliv+SIx8QbF2sgApM8D+IpTxyJdlGt3v4WiN5ZwVczKCGOTVCi9oZIdaIrsAojtkDad5TeJsUEkjbw0/REJnaQ5mNC0nxY3rBa40kWHEqpYkwe1TmrcZOYju+YlT0YBgt56Y5ckc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gy6vWPgc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hdtoUqm8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gy6vWPgc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hdtoUqm8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCn7M4083194
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WwfoVhRiq7D5C1TwcTTPPHvP6c9EHLxAyJ2fgVFJcKo=; b=Gy6vWPgc0rHAzf6z
	m3apbqWzYAlFy9yibQOdoRAozv7ADYpeSiypKUNz+xetTug0SIYFzuP/SevGw9Vi
	YjoYW3e7z0prk0G4UVgbAYhapAGPAdNvqesc/4H86aD/aS4gMhATpGHH1DNouvfN
	EI0aPnXevEjkF81vq/mnyHeaz3RuOx0N16eJZRl/8pW8fhPlbOH0Q+kNMCsrpLeW
	r6azta3qjQ19Lh+hatuHmc6rqWDm9m4F7MnL90cNKM/2sf9/t7t9VaCe14vZSYxG
	G7mQ23asGiH+sfrYMHUyDU+huAp4Ku+mc6HeILe43W4DnA4JR9Ec4bSRZxahak8W
	ZREtaw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgrebxbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:36:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso7122406a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 18:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784597817; x=1785202617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwfoVhRiq7D5C1TwcTTPPHvP6c9EHLxAyJ2fgVFJcKo=;
        b=hdtoUqm8sSUT9fgjUmiCqs4iQ3zvgW4WDzVSzMIrtDMCMRQwNVJu5LOKs5vQ5pYVxQ
         0sl+zAxsaRyE694bD5i3k6Yl7xXo3fMgR/Zxz15h2ANwCegzxF28+a45j6XtuIWSld/L
         2ORuB8tsQw0nTEdiB79HYqxWB6WZ7W0fk1rHvVQLgFkzZ6jVzRvia1r1EkZPnVZlMYpk
         MD7lW8waV8aqbcLR7xgs5hFNdfUyTJS3u7wwmUeq1J918pGx2pKBk5bXL4JPE0AY5Dwt
         YRoD2gVcxKAHgnNWTGwuApL+vuZ93BiUm2clFOy7KEs09XTAm0IWQYDlxgwGVaVybL1Y
         p0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784597817; x=1785202617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WwfoVhRiq7D5C1TwcTTPPHvP6c9EHLxAyJ2fgVFJcKo=;
        b=OsPb1JQxjAnXvrcJOt3MtmSnZDS8ZTTuyND/4vlIynuuQuF+ay0B40cZiRkAPZCKxs
         LPc/3ynAa1LMd1PCc6Od77xwEa7e3osdTHL5vJ6WklBhyRW6xxW10iCQhDlY1G13DfRp
         V/uGro6G33jJ5pRZqeZ9Jqhf7RrZYZlzCO1h2FBBkuG9Egbub2AJE7w/i2GI7gp9wiq8
         8AEBaugBPvcJJQiv6ZSCnct0GeXh6/GHVIkAAV8R+vLg5bSB4VUD5D2uZ2Zyu5pmvzTS
         r+OI8raP3LFfD+CXbWcxcgGHJGGWXL/P8Dc+IcDP4uV9wYFpWBCfuBb5I/OFUOKFNjFw
         /PEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8UAW8y/0+ZtqG+5ozlGtq2dCDmg2lha/y6IXn85n/iZZ0uy9F97GFvIxABuFRho1RAJBGckClEiitS/o7@vger.kernel.org
X-Gm-Message-State: AOJu0YyKa2kW79yo1yZaHox10pLH8zqA3PA1klJdINbB7PKGkeAifivB
	BDWhAS8uqOCELJvNCXNUP0cpoLofQ0nn4NyYkm2vlw9J3Dx1++9cT/aN8gDsFhyVMV6WQsoc04O
	TFLzw2a+czrxrroeLw8GECWwPQ6+1ccF2hbIE0f4lM479SWgtcOv0u48edWnHl2U487u8
X-Gm-Gg: AR+sD11nDZVcY+A8KSkE9yUBIETt1F1Zp0lNRhbEuxkmAoKkydiCY6DRp8dDnhnf/gh
	9C69KXVMT6dLDiuL568NFbUSRBA4LYXxbPD89jGlsvRmLWfJsTaHVyIzmJMe7KyEiGflG44H1U9
	GidnnAT+edRRpk2JOOTqEUXRD4b5OL370miiV4isVMTP99HBA3sKk+dKVnZalU5KCk01gN/Omel
	vVhTOpx2aC/f3d6B1LVxw2aafYntLdE0Z44mUU9JjiKuxH3xLqClBgCFFF0roA9GPCEIhTJoyd9
	gtw4gZ7ODlI666HHzTqWre80WUux5XG6QKuDBNME/jXKOAZT5pTmufQwa4ynTYSUYvE0UjzQrbg
	0ap1uNl+PBAMQfMZtSdoqW3xBJ24uX6GnXA==
X-Received: by 2002:a17:90a:c104:b0:38e:679f:3b2a with SMTP id 98e67ed59e1d1-38e679f4dc9mr7756854a91.30.1784597816703;
        Mon, 20 Jul 2026 18:36:56 -0700 (PDT)
X-Received: by 2002:a17:90a:c104:b0:38e:679f:3b2a with SMTP id 98e67ed59e1d1-38e679f4dc9mr7756836a91.30.1784597816212;
        Mon, 20 Jul 2026 18:36:56 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cd6e6esm34630487c88.13.2026.07.20.18.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 18:36:55 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:06:23 +0530
Subject: [PATCH v2 1/3] media: iris: add Long-Term Reference control
 support for ar50lt encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-shikra_ltr_support-v2-1-702842f1f3c2@oss.qualcomm.com>
References: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
In-Reply-To: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Gourav Kumar <gouravk@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784597808; l=1879;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=iommD7vlBp98Dm7QzymshdGt7WgrbpD+3lhxpAJALnc=;
 b=IVmmMUt6KQ91pj1KbU7V8YWu6Smd0b9D/kc3UyOEznaqmyKozXTYqIWh3hhX4o1s6GVy0npc9
 bvM5BOOcCTfCUoQDtOpKuzwJodhSCtCemtMK2sLaEb1BPUbANwrMvq0
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAxMyBTYWx0ZWRfX2RUE2/hLNYpw
 UqM6oKHjEPVh0xWofrEdLoB/EbRVKIOgClw358Vtp/wg1WAv+9/30spmjMzw8zFq9cLV9krl1BO
 p7RJ8Rmgf2WlwELlnO7XxvyFMOuWV9o=
X-Proofpoint-GUID: dwV8pCry47r4Ob10xRcZHgAfY-RflvnE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAxMyBTYWx0ZWRfX31PMf08wUKdq
 HkbOL+Ak0j32ie3DVvb6W/IWOQR0kvB5Yld4LPcb7TTXOg5G+he3w7GhigyDB+XUbioOMhCRHFW
 klnFhBFVL1WrGgglIuRqoeKnbkzKIwqUVJkV/CUpUaUyy8eBSIxv3Jn+6YNa6W1JgF96qH1P0XO
 /bIEnmEAkoOVUu4D3SSKaEess3FLQlTbSDGyH9ttn4ScqdlGHVqMpxH28utovkzJSa8FMdgPb/b
 tSw+uN3sxMKKRllotIKYsG7+C7LTyNYd7tpifFiWRHdJBIdxhVmDMR4omhUYfIvXX7RsSgug3x3
 7N9lqIQrXgQZISzAsW//+HAvaQEmDunoyWELP/zl2Nl0xtiqFRnajBnqH7grzQvSdcpk/RIx/jn
 exFY79F3BVgg4CNxuLWxYOSXbExaTmoQV2nEfONNUo8uRYiFNgHbvf5nRZh2sTX2KY09r0Tg21x
 Qam0GH9FLOeL/ZyUylA==
X-Proofpoint-ORIG-GUID: dwV8pCry47r4Ob10xRcZHgAfY-RflvnE
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5ecd39 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kMRPvbZiJaxPZM8SQqgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210013

From: Gourav Kumar <gouravk@qti.qualcomm.com>

Add Long-Term Reference(LTR) frame support for ar50lt gen2 encoder by
enabling the following V4L2 controls:
V4L2_CID_MPEG_VIDEO_LTR_COUNT
V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX
The ar50lt gen2 firmware supports the corresponding LTR HFI properties.

Signed-off-by: Gourav Kumar <gouravk@qti.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index f2903af24cb1..3be77feed84c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1679,6 +1679,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_ir_period_gen2,
 	},
+	{
+		.cap_id = LTR_COUNT,
+		.min = 0,
+		.max = MAX_LTR_FRAME_COUNT_GEN2,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ltr_count_gen2,
+	},
+	{
+		.cap_id = USE_LTR,
+		.min = 0,
+		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN2) - 1),
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_USE,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
+	{
+		.cap_id = MARK_LTR,
+		.min = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.max = (MAX_LTR_FRAME_COUNT_GEN2 - 1),
+		.step_or_mask = 1,
+		.value = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.hfi_id = HFI_PROP_LTR_MARK,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
 };
 
 static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {

-- 
2.34.1


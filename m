Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B973C2BB9
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600471; cv=none; b=sBy8nMmjDLD8LE8ox3k6ep/RFCSKRzUxdKtSk4HdUnoQptZFQvOCsV8eFEhU2BxSQ9xjDNgTcvC2CEZ5VccKCF233lzRS6spy++Hsa6ZzbD7OcXvQKHr34jBwwG6r0XxCR6TLR3I3JbXme3guj5SrPgGHKrtev2/TerdOahGDo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600471; c=relaxed/simple;
	bh=ZTYKMsVOnyG8cMZ/TwPFJylCEKFsBz2QGxSy1ViKpAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E5GDx6nPoCsf4jPmp3arHPAedy+B2sQkkeAHEKjbSpKpFVNu0pAcYYeixJ4n7Qtu1D/Joadx6CyxoIjBe51XT1bfNPFS7qaTm3sgf0gwAEyYrwExUzQeUdBq4UebLh3EjQrLnowM4rCni2nfg4kG6dZAV4Ij0nvpncqgS5EzwkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TVKk0ZcA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRmPcoMD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TVKk0ZcA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRmPcoMD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNDMZ94151354
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	59w1oo2SNjzeO0tUgvu0vMcI9S3z4tjMujLA8N27Wro=; b=TVKk0ZcAeZ6xY5DP
	qNRd2ZmwIj0/ZbcPBEK3ygtIiHmucvm0B0pd+f0Ss49LRVdKl6mhXhmo44TER2oy
	/QmvHoms7/kSRWJL3DXE5z6X112Q5+khLNpj6WaL29gf0rTtI4DqZE2D7niVlZ7n
	rJE4ZVZ6VQBSHe2QBycCUzQZQVEBwMo/5uD8OHImCKtFXWvW2H+esp4XCA90gWis
	Mz2lVLRThVki+z4GkxxZhYn4/7ZJ2RQf2FebjDF81XOEwAdGULtLfHkoLmvTC0nw
	DP4w9qcC1fBjFDIBhE4ajHjt/Ptk//07ytGgv5gGBMPF22P9zWXgMEgO4zswUqMw
	J7G8cw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqff20n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:21:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso2150268a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 19:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784600468; x=1785205268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59w1oo2SNjzeO0tUgvu0vMcI9S3z4tjMujLA8N27Wro=;
        b=hRmPcoMD6orYrfqvVl+ndUH+7PFrccQ2S4WxH6bUubcgyXPRFBWSrUYn9l3+TRxZQY
         P7u5yQHJjzOGbzbOrVgdnO91mxh2/Ooucp1ycYP3rQWq/uexwCltJhQBdns6yJVeqTHs
         GWrdnABHhjSTimxeN6cnjAxkfHoxJ0VFSqqjdBnjXHr4HMMzG80BGVWjLB7hfUS6a0ec
         +GDtipFh7uG+z7XOOThfHtMm1UHSAhrbxusv850BdkzpvFcP40iRJHjh5roxbDBmzlhs
         0D5hxCupXH+Fb0fteZ0iy/RxVXWjMVAw0y/olBFCIKx6ibbKhcaL3LYBaLKiqQlG8WFh
         zp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600468; x=1785205268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59w1oo2SNjzeO0tUgvu0vMcI9S3z4tjMujLA8N27Wro=;
        b=oG+fBw4ytuBTsKDGqxqgvGo43EvDDei5ZMUsc/3Qmor0XqsNMTZL1oYTMW4Sy2IG2l
         DOrm9TdBFqr4GHB108VJFEzwzHJzLYE4vpyr1vDqfcXDe7ug2OCQ+ghMxmx6QmU9eSMu
         cvTsDtaG5avgDVkugRG9+FoZCCRzSucKnf0azBUzXFssplZKW+3xaCfu+IW/d4nKreTW
         fzDyzAybKMdcHR+PS77KSX17ePrjcfamCTl2evQY3vYC+L2yE3Fa2OWc1hpHPyMpmGfz
         Ub9ksDbLwz3xZqJnWzYXug7D8uXjkVwW98eck6wpPa6AKxhkJceZPgtIodsJMptmUszH
         U5ZA==
X-Forwarded-Encrypted: i=1; AHgh+RpA/OpcHIYVVTswDJSmfG70aRILuET5UvmLktpiQqUG4tuhvoQy/BNHMzlG4yBzcCiS6wHAZClL2InNSHNz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5pExL02Oq27G2nTn63zlNaPTxuWuXhTCoD7eQgISoTGAaTFm9
	ranAwI1zSKzmv68kpfwYH2F/7kxSPYuFqa8fzGdBVq9TMKRJpCXF+aE97CeSZeRzSE4hBATeP02
	1Fab1UJYwhQZWwzXCVZZ9rHqR7KM3NhwYucrhG22Ab2N4IqBG7MYaOvwad9uNtQ6KFVbs
X-Gm-Gg: AfdE7cnRimpbJA6R2Z/66A48u/GbPCTNaC19XpRV84ukmQ92qjcnrYVFmduqKrP42Zi
	aTH6Nr8P4eX0U9Rbs6SFZo3HThukxvkqTGcMSsUMMghCaqqqZhtIazQ5FPWmtSyPy2PQF5v0LAf
	pOD1Jpr6JyzoCpPg7Tr22/R6Hn23ifzYk9OpdN7oAJfTbkGNkAc/B6VPcu38XN8jKHHrYTkAg4J
	RxX/zhbKHgSH95WtGHEoAz86Dvt22iuD9uWWQEtipalxcbrchP5CPrGQRN9K6uWXQlCe8qxOyzF
	5bnwbgr16x7izBnS8A5eUef7kd4JLnU1Pwn3n4z0qrW3WwEzZw3UbGaHkR3F5s3ABqYmBHpdHOq
	fbFi2h5eu23wi4eVOTGem8rk/lVw+GjGmFw==
X-Received: by 2002:a05:6300:2285:b0:3c3:6c90:65b3 with SMTP id adf61e73a8af0-3c3adb086f8mr17720542637.65.1784600467872;
        Mon, 20 Jul 2026 19:21:07 -0700 (PDT)
X-Received: by 2002:a05:6300:2285:b0:3c3:6c90:65b3 with SMTP id adf61e73a8af0-3c3adb086f8mr17720513637.65.1784600467433;
        Mon, 20 Jul 2026 19:21:07 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41001457eec.24.2026.07.20.19.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:21:06 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:50:38 +0530
Subject: [PATCH v4 5/7] media: qcom: iris: Remove duplicate
 HFI_PROP_OPB_ENABLE entry
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-iris-code-improvement-v4-5-4395bd8acfbb@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784600434; l=1471;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=dQxss1bSYlylmSMgn6m7rVafNWtGTJzyf+ZiN9iZMjs=;
 b=zBm2ZqiI40uuAazT7h+YeS0ugHr1yyetXq3rFEpTKQ2DjBVobnsoq1U6GtvmG1XcjJmZidr2J
 S6+K2NL223yDDsNvymZBJxQsqO4r7C+Pp5hp0QJa0xng7kpLHNyUN4Y
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX/V6v88Ip1XWf
 LFgszOLUIHXhOiLODpLpuL3fGmrmy5pCFuxlcURGRWNPGfdNhkQ3uQYeialtev1uIcR24NQmBMU
 mlwn39h/83ahehOaefKNwL8RkVaAW2A=
X-Proofpoint-GUID: gmujSTXanMf5XieXz_j6z27Lr-3GbLAa
X-Authority-Analysis: v=2.4 cv=FJErAeos c=1 sm=1 tr=0 ts=6a5ed794 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1vCIiHQokKioWWC5pcsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfXzByO2tTGTJG9
 DZjDgPzyH7EgaYv3UayWz7/oQqVEFMOYGrGFJhb9jxcMG4D2EmYYdWVTUHFPuaV8iPV6DCakUoS
 N2XkerDR+ZViF7wSLJriFiPQnItRscOdxguSR032ZuLTltYG4zUbY/3wneLd5/zEwP6PW98rMW8
 VkcWUXrYnaSbe7GZJZie4jUVsOUym0vjuV4hwMdADcfdAoBhCu1O4jqTVE63VFSjx00HYZanVts
 ACcNVxiszRzSM3qT9xQmDrUBAnO9s5PG7TOo3uRjVW68Bzgj0FyXypk8UobNDPv4yWxy3MlmkNz
 v4dF5gf5jnRVq6kajHXnGoFdSfTZJR+zuqvSzNjzwRqRsaDSRFD1PtBlcKx0ZoepsLk7D+FTtmq
 3nvdB7MFOyL10fcYyMNvjx0FI7gA8lrd4rC6uVqT9LYyqAqsJ0xVXaKMEyg38xAJ3ct4nVY6pMB
 EbMBST5YVhaezJSFzfw==
X-Proofpoint-ORIG-GUID: gmujSTXanMf5XieXz_j6z27Lr-3GbLAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210020

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

HFI_PROP_OPB_ENABLE/iris_hfi_gen2_set_opb_enable appears twice in the
dispatch table. Since the property lookup stops at the first matching
entry, the second instance is never reached.
Remove the duplicate entry to eliminate the redundant entry from the
dispatch table.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 62283bd448dc..b3496db55ad5 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -691,7 +691,6 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
 		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
 		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
-		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
 	};
 
 	if (inst->domain == DECODER) {

-- 
2.34.1


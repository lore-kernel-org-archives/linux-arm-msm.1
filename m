Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391601;
	b=qdEMIVIDtoTEsPPFrJlxemUOD5ignjdgwReIEu7l0ZEz2017Hl+v4tyRLXAb76W5pI5i
	 PlPPCk/LoJ/6XN8o3sXX7+5a0A//OzTxBYB0k6nQ5O+0P7uLl5A8aD+bL9GwKerBYyvj1
	 h+pEFc8BxVZlud7yw9BWIyLWt4oUcdPVPbDd5fE+VIMuuttiIpXoSHNEabOSDYOHRWm7r
	 l25Sijh0LwdjLNvSWZy9l0GNbJp+nDZbycNgvOeUiPr09InsPz3NtVKFbg4pKLrK7TaqF
	 BuTzfErr0mORxXF1CWHXaaaGGYX9IDzYsFBpzfAprUOKEYEdp5gO6eGlaghdgwOOyYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391601;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0ro4w2I12dfEEJweknOcVbqt7J3mhia59vFYHx7Lnrg=;
	b=o7v5k8fhvSQ9cDFJvZJZvbY15HSdITy2DoHJk1k1OQhVnlcUtwFeDwZ/HEmA+etQiKBP
	 ozcg3vriUCluSBtS3Fid209dnIjXDg3WE4YJ/oal4lQvXrmMr1kLDXfcPEiSZ41kOvC1p
	 8h0tD+gbeBgLt2EN96LGL7L9xlEvqoIMJe2BOF9WsfQ2N9UZzQP8lyM774Sd7P5fPagS6
	 js9Xo8MksjVBZjYEgiqkbiydGUz289q80eS395/gFfft2PSVa0KTZmQlAERgFP4u1lcfQ
	 GBItZ30s8jvswpJBBRtbWohvKJgdJb54NoHOpew5lCUKwu7kCD/E1FW+WFiiiB6Bjzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XEHnNNLi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffG+Qajb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F414606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 20:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F414606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XEHnNNLi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffG+Qajb
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIkLwu3064874
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 20:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ro4w2I12dfEEJweknOcVbqt7J3mhia59vFYHx7Lnrg=; b=XEHnNNLiribYBojf
	rMyutTB8EFM96PKO2WMpzEMS96jggqPIRgn9nTNXJy/NlRYToVSMI9374QFm3Nhk
	lZ22b7cDlXiKWsi9v/KjMv6Hb+4t/uT+B+jdlWiaNY0vERznA7pdvNZkTe9McR1e
	cJvLIGR0PTE4o4HUjzbSPVWzZ6F+u8w/NAL5EX0DJ6VgXDpuLiNOHWC60PbsUOYz
	lB47WItYAKpJGJq/tykKrTqqRUWxdfBNUQiJv6ix/81OdmivwzAqm8SHaUiO7XOb
	MsiCLi1MOWnxKdxWTy7EnAOAG+x1xvkeODr86la2YQOOGgPmJgOoUP4gHIkq6ZhC
	nBpEnw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0sxg8yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 20:20:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so4470723eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793391599; x=1793996399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ro4w2I12dfEEJweknOcVbqt7J3mhia59vFYHx7Lnrg=;
        b=ffG+QajbvDDawrR7GcXGZ9KAaNvFa6bkKwzbxQQ5k24ktEY9RjRsdZfALIHpdz9iWy
         XCAx1GqChn7ZrGhcxpRNTYMjkP6Fb7+FekqtQQJMk3AFhNI0cBIknyNhaLqXuxopHJRi
         +tgy9kvr0krLeZ4W7SNQ+jDpjzgu14q2rjSU1JgBpTV6e5I4SwU51nB9+mcnF5hfQa9i
         ezwhYGKaegUqQk4VzvRCgeT7Kgrtt1nJCWLx5VjiOMc+VI81MBKsthck+dP6vi5/dAdm
         Y3F2nCde6bAvinRkXSyIsFx+moJ3eXu6oytS50Hz0dhA95qahMVzXpFJ9/m8fBcT2OTO
         sT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793391599; x=1793996399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ro4w2I12dfEEJweknOcVbqt7J3mhia59vFYHx7Lnrg=;
        b=EKqOB/2DK/ClF8BnDTRdMDNq/rGEH9gFwXe+Za4eLKDEZNOnRO6ViJ4kdr3h9E3W4F
         B4rJbDdpgTaLYOntkUDU3wLsVWdnSpoIcO6hSQFovlLkPlzKYLrIZeMKHT91Ji9FEpDI
         Wmce35yEgC9z3J8BQf1KVbMSTUDkk8xV4PsBNNVMTaicj6NrvFZDzY4dXyr5HSGsRmuQ
         hCPFDkRimSoKvIAaxSAw7eAteb1IP3nFKOLUaA2GkTmXQQkrjD3i+nmsCfgou8rtrGPF
         5BSk4F31WiQyx/8PxGcUAhZC6a+Mjd5MUb5Kg3wmAYiHOEBMUKedTKYWXqb5oFUGgtsJ
         ZaBA==
X-Forwarded-Encrypted: i=1; AKwUvBw6M6NjYi6gt6gyW4ABo1SxtZ7oTPbLz6xk2GnaLzDzTKBbAwH3T948wFdvf/uSGCrj7Zlz6no5YmIy+6w8@vger.kernel.org
X-Gm-Message-State: AFq9FYI6uE+9sZMXxqPQvT/OWsBCz6gNWf8GCaevJSXnlcv51WZFmW5O
	iYoAIeq0Z3HgusKXtF55V85/5I3qEUImyD+zJjqW5M9cOoZMAFAZQ6B9tvC4AL5asoHEViFXy0N
	c+5mmpxjE93E0nqUhc+pjMBHn6LeNo/eahB2APrPD90WSlmfPbWnBEcm3aQ5u5q4qQ4+B
X-Gm-Gg: AYBFou0uuSdxDLfTBhI8QHRJ2ILztv4Zq5P9DmCL20Uo/oBzLvuj5qYIIRFoi9KBhRz
	nKVFR1abGHyoSd54+QstlWEaM46TB/qLXAidQNtdCK1hZElX989C1aGdQaYH8toYhvIaqzncXXr
	+qWWTXq4sqoHvCIdf6s44BfBuHr1SoVBerzCGPbW3A6Vum9hQkxyoje+kOjAQE04nZ849MbiSYV
	b/kyVJWq2iEtuT2DT9W4sd5I6Nv8NNQqkx7roZVon1f/wvsEerHvyYTdAgh3MmYi3QcChMAQGJE
	9bC0JxZSw/y+1UekRGqH4Q7JXLRxOi/t7zcyFAQ1EvJCB3I/3W2uiRNltjk7Jmf2scnzxItLp9h
	rLcw4cT9/HvypANevlTxvn6F8Yct4sKWRr7Oxn84U919WKIanBuVNR+cWKQA2V2Krk5wBqGGX9T
	nkHaAYkw==
X-Received: by 2002:a05:693c:4144:10b0:35d:4185:5395 with SMTP id 5a478bee46e88-36a423a205fmr5724070eec.16.1793391599121;
        Fri, 30 Oct 2026 13:19:59 -0700 (PDT)
X-Received: by 2002:a05:693c:4144:10b0:35d:4185:5395 with SMTP id 5a478bee46e88-36a423a205fmr5724029eec.16.1793391598552;
        Fri, 30 Oct 2026 13:19:58 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm9300197eec.0.2026.10.30.13.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:19:58 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 01:49:10 +0530
Subject: [PATCH 2/3] media: iris: Skip redundant HFI_PROP_TIER updates
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-fix_dec_seek-v1-2-cfedf0c267ee@oss.qualcomm.com>
References: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
In-Reply-To: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793391582; l=1653;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Fs8gGyy1BbD06vtwlN2GhfJTzyeqxPW+qZIMwCmZHYE=;
 b=n7tOrzm5p7DVClpQrshqWegTukL0PD/boqowsTA9qtKnrF0uCA3VMjiX7SRmhfJ3Dshm0WGG8
 saP89Hzn4TOBEPD2bHaI7bJhfjIQ9E9u8ZF9DJufX5VTEP306eWovys
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MSBTYWx0ZWRfX9AVrYo95SdLa
 PRIAgCbrb5d9wMBQXmncYHt43b5zpc2yYb0dMubBD7tECgZDMq3r7je880UtKlH7JNWncVbZrrg
 HcXEwCRE3GQzG5KzG1vc/T+RQjczKFZKI5N86+er+MxsfbzXQcpNXz2AfVT+2EPZJFRD3AxcQdt
 FRwMOACTDoTzd2XzRLyq5UYl9lh4e/nltm2tTdxQXk3zK6dS7fyVRbhaP65qBsq8TTnRSKE+eAr
 yG4f6k4tUsF2YXOidGy7HlrzVEuOIbp2GBb/o1p45OtiUSYTBXjE7QgfvQJ76rRrjdDoDgz1QXJ
 vSeb4nmrK9PDAA+F6pCyt7J5HL0ix+q+wVWWlQ9LvF0CGdu5Y/zXBbglHwtKkQa1czSDulSsw9B
 q5kX7+xWoyB3jL7MoGbWnB8pIR9+BG2OQIl/PcHFKllWCBy/M7QF35vBN5MVwS8KrITw0CxtTZB
 uTVMs9ckYVp9B4FIE5g==
X-Proofpoint-ORIG-GUID: XlSna8uTh793gybGV-FeLibojIQf9-Q6
X-Proofpoint-GUID: XlSna8uTh793gybGV-FeLibojIQf9-Q6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MSBTYWx0ZWRfX04pcYbhun3Hu
 QWghpdaoHT0CRqCKWKqRcKWmBAyFE1VwpMHVD83vSUbN2zPy9E8x37S3U+QZ7gjXLhWbXCKyWDp
 Iu9IVJPiIhmhz4qXc/atnC4B1CLB1KU=
X-Authority-Analysis: v=2.4 cv=ap0nmiZV c=1 sm=1 tr=0 ts=6ae4fbf0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8r_SgFHEyvr_bYIatxkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300081

HFI_PROP_TIER is already programmed by iris_hfi_gen2_set_tier(), which
selects TIER or TIER_AV1 based on the active codec. The TIER and TIER_AV1
caps also define a .set callback. As a result, iris_set_properties()
programs HFI_PROP_TIER again through the generic cap path.

The generic property loop sets TIER first and TIER_AV1 last. For non AV1
codecs, the TIER_AV1 property is programmed after the correct tier value
and overrides it. Remove the .set callbacks from both caps. This ensures
HFI_PROP_TIER is programmed only once with the value for the active codec.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 79bbd06ef8d2..6888aecec902 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -997,7 +997,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
 		.hfi_id = HFI_PROP_TIER,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
 	},
 	{
 		.cap_id = TIER_AV1,
@@ -1007,7 +1006,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.value = 0,
 		.hfi_id = HFI_PROP_TIER,
 		.flags = CAP_FLAG_INPUT_PORT,
-		.set = iris_set_u32,
 	},
 	{
 		.cap_id = DRAP,

-- 
2.34.1


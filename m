Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBFA34F46F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785218590; cv=none; b=TOBB82q2FAsPFNE+d1g1YEVA1HquL++4EqON8M8iYu2d5nCgHIB6CRAYvU/2tde1qH5sJzvAbFdgvgLA5gGlqXMxAJyK9m9krmsSBjSIIsprGksVHsQypQdrtOAWKThkdFgAIH0a3iKlOPKVf6FshNAy8GSCwg0syiV412G+oUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785218590; c=relaxed/simple;
	bh=bTdIdA1UCWOsokX2nB8qHgXWeYqizKk/ZKhm2pjS1lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MjOpSpouMYOt64/PWjqC1luslVTJJv5R+l+MVtrvM/dZrgGRVu8+LXqfUAQIFAv/Ypy1HlurTz8wDz+wDjpwI7iAy3Ls/vsOkdWdFyDmw/DkrD9KS3Va4XRAeDqZnB4FNfRZ6HOrVgFh8CSAZDlEbEu/Ef6Ds5JHS38DKacvNyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BhASwRp4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OSIsVPr4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhASwRp4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OSIsVPr4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3amcs1423508
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3IFbWmSKuBlvm9OxAe7Nc3sW/Flxo61XSajqvUznIqo=; b=BhASwRp4z9hDIwRu
	KeEFhABO+bcLtkr90WgmHzIubWLvurMVfnNfWfLFbTCAhfhv940/TPSEh7YTaCDi
	GYzmGQpGdUfXSbJpiHWqQ+Vekh7H9QdUYetq4Qt734hZJkw2D1tHb4Xenb8aUBeY
	SxsD2Qh8QntPhtJ6TBNfkgDEwjc/hNssUEiDkq7ONmFm7+VWqJDvaPhCGfK6TaIt
	HIJ5Yqix9rme3fTk3w2zkZVxnOWdXNfPWY/zbvVWMCmh9a6NLT+AOc1M0KewrE/b
	DR6Ory4UJgDUrT30RE83cSMbTd44LAgaWeh1aq3AmTsLZVBYxwZj4zNaTd0ZuKb0
	h0VxWw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2my0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:03:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8488ac68185so1310036b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 23:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785218587; x=1785823387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3IFbWmSKuBlvm9OxAe7Nc3sW/Flxo61XSajqvUznIqo=;
        b=OSIsVPr4j+1QjKVHIBvoDj4tOSM3OTLyfrR0QDVWCAV5pOWKTZIM1a7NcH2jHIe8Bs
         8YjH35nxGq9CfxlL+A/cJAE92IcrJnNHYnllOSw8DayzKCm4cXl/IGa1IdbrtXrCidEn
         WF+It/++18FutgsguLEjdWmQo+gIgGVAdXcdwjaHQ7fZ7FU4ppktZL5u57n/guGC8OWs
         BOJFJNReACK4wzjwgf78iRmsjtwfqjXIcQiXnUhlEIOIqxLXJUpokxTnk9ylXW4F9EVy
         NWUwZRO6DTJ0wBDYz8Lsz5ben5Su7RR+rxVIYmrKKPNjzqXPNNGy8AFGYmJIeXVjGANE
         +nKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785218587; x=1785823387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3IFbWmSKuBlvm9OxAe7Nc3sW/Flxo61XSajqvUznIqo=;
        b=dNn4EACLgI+KRim0BCtMjp0Oek/qi9m8VfntwfoeGIgytcDqt9X17m62u7HiLeuhZj
         PU0V5dgAv9MM6cB3G9FFaWh9oDaqGv+SrN1WftnUE+LzseVs2BioXcUie7EFrIecSUst
         RGKOLYcCQGTAn2V/o1AWFjSUkZb/T5zKizQDcEfn97kh4dY/5vNFHDRgCkAgqy6j43/q
         OGrLwubY/ObrYcNn3a6s6Vkne3Zw8N/NjYFpDoNq2FYzwwkDuuMxXUDlp534S9WaQpsN
         OG/eprPF7IaoRMZSbXRMipl9MEAlbvqJFX8perZ9z0d6pO0pyFpTi+CkAiaBv8v6xurc
         FK9Q==
X-Forwarded-Encrypted: i=1; AHgh+RpaUCQtomhsBxO732PS4GWbUOw920oIpMGgY9R3WRuKbgMrUJpSPGyYdxrb3yEJwwa+ljvLGXhtwDrLoPdt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5WF8RL7MrOnqMM0/+6Kz5pLi1LNNW+xp1LswHcb+f83CKT/hE
	8WQG7YF79iAQ2P7zlgNmggbMVSOgUz50oe2juqr46lA2KfzjspI2+C/Lfa5etzIwgP38unnQt5b
	V6yy6l2nvlSBRPz74Ia/oJGnQ4iN16kJkUxk4mLLChBQjsmQrQvfl8djbX8TP6wVvmASg
X-Gm-Gg: AR+sD13lflV4oQtVXqocVhh4buhrnSsuJ+d/JZrkyorsateog5rNSx3XcNYv75r0F09
	kL5tLhBjOtBc8mYdLvPAEnpqbG2n4OpuSni8wHQ8ZYGyHb7acywq7devMH33Oi4KPh8QwYpPbgs
	wEdi4Gz4gS/fsAsbPsAsD9KIh/uTibQlwec/kpTqDKesDUrOSUqfyHoXwd6BPOG/E8DVMyWl9aF
	E5lkWEK0DBzrafBewXiJ9bE2OB4A0DWeBgPm7Ld0fzhYzm2bPpR0fOOXkMp0+fAbweqq2Hp7Eiq
	1d7TcnS5UqgXzhJXbPytjHe45zx2hn42upmSQKTkAQesyA4gGcV06mOgp3KbDMNT7zfSSxJA4hy
	ZZDeXgiyI/sdfTKkmQYJorAlqg74s3vg=
X-Received: by 2002:a05:6a00:1956:b0:848:6c37:cd74 with SMTP id d2e1a72fcca58-84e931ecd85mr995257b3a.22.1785218587456;
        Mon, 27 Jul 2026 23:03:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:1956:b0:848:6c37:cd74 with SMTP id d2e1a72fcca58-84e931ecd85mr995234b3a.22.1785218587072;
        Mon, 27 Jul 2026 23:03:07 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533ce57asm3980421b3a.28.2026.07.27.23.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 23:03:06 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:32:45 +0530
Subject: [PATCH v8 2/3] media: iris: force stage 1 work mode for CBR RC on
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-iris_multi_slice-v8-2-eb18f96f0ed8@oss.qualcomm.com>
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
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785218571; l=1399;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=bTdIdA1UCWOsokX2nB8qHgXWeYqizKk/ZKhm2pjS1lk=;
 b=wCxFysR1rFFJV2IHKYnmb+ju2PXWqSAB8Uxm4vT7SC6uRydIn/TXlUEQVMYiMzfHzGM4ylkz5
 TtV91cKfuLUAkaCH91H6FRg+85NiLTKdY6ulnK1mCmsmLiF5FO2oYET
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA1MyBTYWx0ZWRfXyn6zUYiVS5gs
 axUxfLCRbh4nX+xTjW21zP+z8RXbq56dCCzRBcHEZitSiGKaEP2qOvY3pdJbZsCnKv2ueVl2RLb
 YaONTO6FQ58x00dlw52J6cP2oiV7lqs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA1MyBTYWx0ZWRfX/9K6ir4Gyu5g
 puTLcCZjAPZcxvbrQ1SgI5RzkwfyEn22b8e4lEDH/GsX5TDk6/YWgAoITPAHlMkGrr4dSiUbgMO
 5jCePTkP+FCYZSyUjB3RvlKtC5iqIjnMQf4HkMbm9VyhWosqn9/bpnmBytmjvzFXH2g5g9WF9hi
 cSiQSjfw8pYB6EBkeLfgN0rgh58z1RhcfNFLGD1hvvv/8vq5wjFKrAFxkjyxWQiGQbCJ0cSF9X+
 zhDkquXwGL8lJ7zjbw9y/2wMSzkBAwqvQoKHc1rh2qgJLsl0Rmwt5djxXGbdOn6Y29e8d2T7Fox
 2LOylzOcJ7PSWppX1NzLF251jZwcIrmpcXnFKx/vf2waB+ucBlnQHySyCsO0XJ7F0Iq0+rxFn0G
 v4WKug42S01/oM2BYX6JGJitVdiE3Mr80/X3VIYl9S/MNPmjwPxviOwJx5z8T7Hs+cATEVC9qh9
 R3SovsPDwTMq3qZhm8g==
X-Proofpoint-GUID: o7KuHGW1699BUOwnV6b2nuTW3Oq1uOIL
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a68461c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LMK2Ni0dcLaqO0rVonUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: o7KuHGW1699BUOwnV6b2nuTW3Oq1uOIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280053

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
index 80cb43b8bcf4..74a299f72024 100644
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


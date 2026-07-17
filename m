Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5C13C1097
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 06:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271178; cv=none; b=d7P1mXK81PTb8i5vbqTYracGssw1NXom+P2bE+OqzZTksbHHE+zox/fJpUudz+mE8G2ZHNt8xPfk8MfO0IbKl1VIM6lzC3Q5Rpy0nplQAIxFMon+ueaRGdxqG46Ot2RoQ4LP6YBWvVQ0H5UJkz2OJouB1uEioYeDGFRVWikPy+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271178; c=relaxed/simple;
	bh=h2BcVhJCDSzkeWTJJyQ8qJmlHNAma8vJdbNHGXiXLfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R18IgAWyRurH9xgeugVsLlMVXU1rCvpYCM1KhoV/VkoIroM8L7qZMjiWlF3ahR5lB4PwGTPjfJ2CBRPtxpxJOdnoj8VoAznmFPPvllllBblRjZU1Fq2H2fXlxlf0SEbgNFP+dmvMgLjX3A1A/J6HswRIapnEy0Jqn2m19jMb2kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBr49Csb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iI48C7U5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBr49Csb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iI48C7U5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cRMN979777
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 06:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iOlb2VjvkJSkLwrSCTQtWLWiV0oxg2dKMGki8c6w1Ag=; b=HBr49CsbliE5SXJt
	aPRh2zeqM5+pRY8ERaIdwTLFhStXteTRTy0IGzs+jkWnJSpgv9aZhw0hzhJXPOxM
	nleMHNcq3AE0MyNaluCKuEzxZZxyvMqgY7SUlgOaIUgsbrrJOvixNTB8z0ZMF/Qm
	v1Mdqs/apa5qiT0MSxLem1no/iMlUNxhD2lC2Jnti/XRwFPSBvJLyCHz7X6USGx5
	kVTfmo6YTSByduq9fVpOnbAvtaGPcsaAjDtG2dBnf3kuEQhTeFWovMSORejqPes+
	gSFUPbYwRoKMrd+pJi9qBjTRomm11L4WJeIJMPYu3dGYSQlptGb82NMWxORPxffy
	J2H2qA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9gr1x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 06:52:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848662cd2a1so4674902b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 23:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784271175; x=1784875975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOlb2VjvkJSkLwrSCTQtWLWiV0oxg2dKMGki8c6w1Ag=;
        b=iI48C7U53cANE4WgSrqEIjJ/qtyXZpAKOYMH4fuTEpK+TJ4EUnMlCaAzNofQnN2vH/
         fbYE/HNJjigMbtBKSTMcUR58qhEmiycoKfFjFBirsOsssI1pYFwfd2+sAbLrbNW8Rfmg
         qnskGnM3iZrkqRzmc/R4tdqFbF5l+nZLRzYzJ/380HIbucAdcA2FprD48KXzsk75eU6x
         2LFWcT/2rm2P93oCWYuCD7JPF8PYUx9DUILMuVa+fqpAS9+NUgwpbLZkHFGo6D37+eqT
         ai0DsFohJvdxZjh6xWo9NMa0puL9LcmAxjn0ryCTI+Xk8AZMADPzrB2DAHlebTwUW5yv
         kZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271175; x=1784875975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOlb2VjvkJSkLwrSCTQtWLWiV0oxg2dKMGki8c6w1Ag=;
        b=SRKEkWse8h2AM+c4UQXDVy8UQDTwrCvUPzS4+6NJjYtpWPUq4hhYlsPOs3ApT3OG30
         II3VG57A4vcSRuNEiIf8gy9iXuLCxUdJ3em8herZRyho8yxbGlVqNreG2woz1fqPFBFw
         XTRfm7gqlxAd5Qemn87v5F7Xkz9K3kEwfvWOOD3Gf+o7OtDIMdrk9fYyxiIk9VGwgzZ8
         oEKX/9OFf2L/GejhGkoDzO4apJ1W65i6JRY5/v6EYQSccsaW7T0blGAoaC/kqLdgjG87
         8n2RtERBbYI5IEvzuNDX5qKYyjOZ5Za49OgoPan1nxNygM7GAok2p8AGrcyDp5PKVzop
         6fzA==
X-Forwarded-Encrypted: i=1; AHgh+RpOF9A5mqnEHg03VLNo71EbYsewN5nlLn7fTSUy3eBLIp3X9sfCwlzCjxDVXPb0cocecKW48yEjIkKhFtwn@vger.kernel.org
X-Gm-Message-State: AOJu0YzrvT/2+/fS3/hjOl6W3/qb2jxKTlAEN0czL8txqsBnh8KbXVW0
	nDP00rVkS6CID9fRBOKHXevMttXZX3M5LEdI0O/HfKtajcMYJJsp+ms0PUCJEu1FA5GTewTcQ9o
	fTHCFf0DfUvAUq2ndx/6Huyz5sQeX3RwfFmzTUQZLtyuraRCsoL4/5kztogBMRX3mvXJO
X-Gm-Gg: AfdE7cnLUPwbg3TyE9ZuSlLpHQ1KtRXmI7BMMMgfZsXvjE4pem/NrTv/6Fw7Mf5HXcU
	hF3KiRXOpMZsInfbTcRlJPP86RPfkvrXRO5Ohz/hK8hngMmmD2sGIQZ1pCEmQKl+aXY4G7GT9pZ
	UjpqUg1kHfAu4Q08eggFSTPXuhvqVtaZpqL5x+lkrd2BIWyDTbWwVZNN0Y0DyhLMap1SEBivTJw
	HGRmiwyy2BZ9WJxQ+BRcmSSCFcdPYeQeoMlCMJumxCPojmWwZlu153r72LJl69anpI3g12KfQTo
	cqkq3c46Q9WIznrZgh76m7dR19uTKOzvBWe8KKj/qshAOO2WvEjKoP8ps40AB/KCBGdznsRp+vT
	zVM9WF4hugAulvAb9+t/HJfBi+oNmjeM=
X-Received: by 2002:a05:6a00:23d1:b0:848:7731:d95a with SMTP id d2e1a72fcca58-84c2945a953mr1178628b3a.37.1784271174741;
        Thu, 16 Jul 2026 23:52:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:23d1:b0:848:7731:d95a with SMTP id d2e1a72fcca58-84c2945a953mr1178605b3a.37.1784271174229;
        Thu, 16 Jul 2026 23:52:54 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adc3466sm437651b3a.15.2026.07.16.23.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:52:53 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 12:21:44 +0530
Subject: [PATCH v2 1/2] media: iris: force stage 1 work mode for CBR RC on
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-iris_multi_slice-v2-1-9550b1feb39b@oss.qualcomm.com>
References: <20260717-iris_multi_slice-v2-0-9550b1feb39b@oss.qualcomm.com>
In-Reply-To: <20260717-iris_multi_slice-v2-0-9550b1feb39b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784271167; l=1286;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=h2BcVhJCDSzkeWTJJyQ8qJmlHNAma8vJdbNHGXiXLfk=;
 b=c85ugvmCIDDk8hYWXVBW2ClDN/tHkV1wFEKqY7rSLv+wWEPCwv9aBD9suh0frnIZRwL0+XOmK
 suKLNf882WzA7F0QMnuj3aLULQX70qSsMdP1PCN9kITJYnG7MZFac0t
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA2NiBTYWx0ZWRfX8mkjYUys5aA+
 JmaCXA9Az0WO48AwAnIb0vqlPhawLpAHzXDpGe57K5ZKO6L15mfvx/JGPnKVwDKzJPmyyVLFatK
 u0doJpCWhvDjRoQ4/Q+CQfcWfCXlEvA=
X-Proofpoint-ORIG-GUID: 76tHXLgVfWrOo6ZsLKcMROvFEQG_ctzn
X-Proofpoint-GUID: 76tHXLgVfWrOo6ZsLKcMROvFEQG_ctzn
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a59d147 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LMK2Ni0dcLaqO0rVonUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA2NiBTYWx0ZWRfX0XTeWX0DVzEn
 0AjabA+K8jhhLenuWZq6HSaStiOHYo0eXiw8rz5rxiDKOY8Wlx1wq8JYfnWTC8tYG9fQuR9p0LL
 3FJZAzPV6F88BExX4ft+wVDyJQgEy2ng1Q91c234T1nMbESYiQcdEZXwuDVl9GUVx8AJH53aaN5
 F2coFMQ/MUDUidkeSLyyxN05aSesLrxzUnEEsT074e1k0j2k4K7JOHt4PIfodkefSMmux21pXrN
 Sys0bnuPNpkbm45NX1JlvHvx/9LwsUtEqGn7BLLgIKgtpF8I1QkQ/PsvrErZIl+Ms7eTZJZaR+a
 zCDExotI5g+JYmuMR3yUItudseekKmvV4WLXhq6/+DSUO26ov5Qez69J2iPZzCv69BOsdBs7zZX
 8WXdZsv1vne1Q+IlRls/ej6JQEb1nyVcYbzGa6OHYHWg2Wz1skjb/uVYJ5fLg+BQul14lmsYV65
 LlZdb+Kxsf9cnLCPppQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170066

iris_set_stage() currently always picks STAGE_2 for encoder sessions.
CBR rate control requires stage 1 operation, so force STAGE_1 when
BITRATE_MODE is set to CBR.

The BITRATE_MODE fw_cap value is used instead of inst->hfi_rc_type
since STAGE precedes BITRATE_MODE in enum platform_inst_fw_cap_type,
so iris_set_properties() would still see the previous hfi_rc_type
when iris_set_stage() runs during initial config

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..6c4eed62d7e3 100644
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
 
 	return hfi_ops->session_set_property(inst, hfi_id,

-- 
2.34.1


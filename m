Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5805C372ED7
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 06:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785566712; cv=none; b=fjQ50F6akE7N8OBXS3bDKNqki921aRt6Gek73lE0+ZlmkzQ7WhUcaJBLXCePmRg4CB/fytxow7nCzKrDA9m9SMXuIYGXEEjI9eClQRRC0dj93X5pEJWoWZwi6est7FnC+tfOojH/FSj+iGYZTIbRLLzuL7FmawoEIvmO/JJRRcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785566712; c=relaxed/simple;
	bh=5R672ctTLi0NWBH6yAj+cXftStpSo8OXH9+eytbTDk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UR/4p5x8FUKRLHwk1kwu10XRVZUm0BczNX4eGBt/RwB0+auwGMkAZPcjXl5UpDICEnpnrwiIS1yKnik/RVIyg/6Zj3myUZszz+kXgODlfI94eriII9iyx1IfdabUwIAMbjLGnT2cxospJFHZIdZfsvVwi/dL/30Z+aFgsmUhGqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXrmoLrt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B2NxeWEo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXrmoLrt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B2NxeWEo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713Fh8Y1759076
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 06:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	duuG/03PEgKADX4APmae8WpIZFwWA8avpU+lWI9oZTw=; b=DXrmoLrtNBLmjxY6
	e3aMVvRdrZpIaJy5NYrjbKGLOf1AV9eUFKcAnFREfsCMKB0mVvpOdmVqNTaUJmPw
	+COAVIqWaO/Pn09UO0Wl10rRePaILGV8TOHSj8hdyeeSG1JynC2fab3bA1KakVJG
	jIyCb9YXpwsY2WVf8xPERb/lsYKGXjSj5w5fh7CNKeFoUSRSXU/DSJgilnd/Br3t
	uSDx+r2Bj6Z5Sj5aksuYUNq6Wx8WAJ5hCKnMQBLe/9s1atCYD0sHu8A6pwVtqsGO
	fHOJkeF9YcRbuudO1i/4vpb0DTYZOK1TmKHahlQgjtQfDI5TccWrsJ0o+LsgR4/9
	PdoBHw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6gd1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 06:45:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38edd45cbc4so1869179a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 23:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785566709; x=1786171509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=duuG/03PEgKADX4APmae8WpIZFwWA8avpU+lWI9oZTw=;
        b=B2NxeWEo3TOzuKuHy9bonoTC1ox+cyt2thzT4czLFc0Qcq85PBZlaKV9EVRQE71xht
         S49owTDnPOok7mdgAybfUyDDOw0ZGJRSM5kHRrPZTKht55ZKnt/FxOg0THPvZm6bcHVp
         9MBixuwKeqrMAN+BlV45eJXc3JphPg25ir9dwKbuAUrndPs08BXsyRABNtO/kKfZrGRb
         QcofEIKXlvy/XssKvWDfuStczd5ipIKp4HS49qfJPvtZy9xHbW0bEMNOnYXPWpD+V+rG
         M8zciqtYHdNyH6T9zbFmXi/irqev9XzOs3M0eYEpeZpJMptTR2T0cuR9KHo60B1jujov
         EZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785566709; x=1786171509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=duuG/03PEgKADX4APmae8WpIZFwWA8avpU+lWI9oZTw=;
        b=YKwPVcjMJ6aJn2oPNzzTQWVf4qsTcVvC4U/fuRwRmLx54+mLMuL9aLwmBLOdXxxOaW
         Zo8UchI9OlxHw0r3CZG/+CZab4fdd/BXrpsQot80Sh0v3Nub8XWM8PcgewfrI0HXreya
         y7Ww0ua221eYyPiiXpPEqSDf/EDxKJe+Rdpr/zZg41MzUTMEH/Qq5LtEcT1R4+r/san1
         3Y2MuW1Ffq3z9QS9oYPNRfmURJeQCd18ZGEcI7VbLx9qdvj74NZvnWS2S9WvSAkH5287
         Ooalu8AGUU2g7CueCoVqVOHKk0+klKs8R5KIJlzmMk5rb1S96oOeo3EKaIyfsfpHYnlT
         pu+A==
X-Forwarded-Encrypted: i=1; AHgh+RrrahUoF23dWyNNOTzd9otds8WogXckdpxGLhfUvz1NTSUtKNk2I8WrpdjH5y4uuXoQqqGQ1V/0dlg/GsGq@vger.kernel.org
X-Gm-Message-State: AOJu0YyERB7Tw0p3FuAXQDa27YYc/+Vf7tYKuYi/EPED2aq2yCVwwOyV
	8snjDfp1QphgVTgzLZql5yKE5U8kpC+mK72vaYkPHhQ9TpLWgvE6353VjAH5o/sPHs7v9ueSfCP
	ugSo2NQhkq5feeE7zqmH5g6kKTWZMI1J/0OCqPRKHeYK4zgsvGfYH3n7gyWAInXRjyFct
X-Gm-Gg: AR+sD10T17RfdV0ALB2Ovlg+5a37iRgd5ojH2o28U+iRB8fVqz8uVl6E2ZsdjK2aBEO
	yCDo21DRlKo6XauehGgIt6m0iPxgVi7lNpYMqXBWPKU/+6SF2Z/Xf53uJOEHIXdURaP9mrKglKn
	VmMFv3G/LpglZULjMBcpMYqW1Oq0P0pFkdv5jPD+AnBDxAOXgLqmISW+K15J0x68GbgUT7DZd5C
	vwsyy5iwUcRZNtHyqT38BC4ciQu7zYUjQQRKMze6L4rUJIiDZGi/U7TNAZCKd5oldqWAMmqm00e
	XfhBXUO3Krok3mzwhT2Xw2KPqUxus78LAZcB9XNJhcdj9uYE0p/3EwwxfEncZXXd41pii7LtXYH
	d+qS0EFrcQZfyVv/0N8uVd4ZWxIfBQIM=
X-Received: by 2002:a17:90b:4c51:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38fbc3f9ab6mr2432209a91.7.1785566709200;
        Fri, 31 Jul 2026 23:45:09 -0700 (PDT)
X-Received: by 2002:a17:90b:4c51:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38fbc3f9ab6mr2432183a91.7.1785566708744;
        Fri, 31 Jul 2026 23:45:08 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddda5d9sm16863759eec.13.2026.07.31.23.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 23:45:08 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 12:14:49 +0530
Subject: [PATCH v9 2/3] media: iris: force stage 1 work mode for CBR RC on
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-iris_multi_slice-v9-2-bddf1449c280@oss.qualcomm.com>
References: <20260801-iris_multi_slice-v9-0-bddf1449c280@oss.qualcomm.com>
In-Reply-To: <20260801-iris_multi_slice-v9-0-bddf1449c280@oss.qualcomm.com>
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
        20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785566693; l=1399;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=5R672ctTLi0NWBH6yAj+cXftStpSo8OXH9+eytbTDk8=;
 b=XnnXyf/mpEZVW2+yivfodHQPKztiGqfaC9a0RSuiqezxDncgfNCD8u2z1KmYMwE2KtMfoXN6/
 7EiiEuEFZMhDPfj6wOuWBnvkflELLnwHPbL+vd9IMHYLwQGz45lvYdG
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA0NSBTYWx0ZWRfX4x7c9xi/EmW1
 f/wNLwxOOzUY5PwLz46FcJHeZAyLMaEBr3hFVSuwUxME87GyR/jCLqlFc1HcLgPn2CYJ3f05nzc
 B9cKhpnL1kXQBPZMacxFPsfBsyPvku0=
X-Proofpoint-GUID: BaM3RdbVbCYyDcWG9PZ1PdDLEqV5QDz2
X-Proofpoint-ORIG-GUID: BaM3RdbVbCYyDcWG9PZ1PdDLEqV5QDz2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA0NSBTYWx0ZWRfXxQ/4TdmSN8b3
 XP7rfc2669uuteHyVaXCXF8fBsIfL4NoXJWc8z+4n8zB6c0qoCagzDJwt/bYVQ10CdwGRraN+y9
 z4zvjfehKku1ovqGFWz/iBAeiCM72CxRfJ9B2r2gJKZ6vEGn2glfgstaN4oDQrBc3E9XWntCSE2
 y1zxUG7qGFlbbu5v5XJZ+3GacprHQ87cxUJvZctRdqtZfN3XAcLk01+77PVjwxR8f6CpCHvccB2
 FAHBHwjUG5hi2cm07kz8Ql4rAnUjht8MXEOXwk/5MZ5hReadcsZkGsGxKlEOsWWIRr+YbHp6fP+
 KXuSJv8TGPl6UJSYGScJnIucJZHQ5qjm7K7RLPMkLrkyxKrlXR5+vNw67FlKWaPgDSvYbeK+LSc
 B0UOMRbqwg2njG1x/KtvN6zs5PMRDZJkoVBJG648OV/OMQn1v/tnqt8jHt2TeGX5o/tsc+upVZM
 5ZKd+DqgN917/gwVZTQ==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6d95f6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LMK2Ni0dcLaqO0rVonUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010045

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
index 14e0bc06e1ad..98d4ec122da9 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -523,6 +523,9 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
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


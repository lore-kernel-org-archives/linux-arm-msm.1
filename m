Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4110E429802
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425178; cv=none; b=eElJxoAjaVjAi+thHCgXA6+xeb7NSZCu+ytyJmzNSJWB1Y6T2bvuVt1bRz84HUJUS9uQCb9EpLWL5dpk93TexN2c4zPR11IsNr3iN3q+LWDr1E9QnByZjTRuIMvxW8DhPMbEAchhs4OykokrY7PL0soUtdQ0xSGifHs6H82ZMSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425178; c=relaxed/simple;
	bh=y9vKpxUNeawNZbt1t30qUQytDOCxet1GP1jy63Sl7Y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j7MjC2UhNURn2y8jgmx/UuasaDz5pk+ziHkv/nfDXay3K2GWkWvvWUd3oTxc17Fm2xKF6dhqAFSwZk8YPmlOavcU4vjjQp9L9JsWO7/fqujYv4dlZ0VHFdoKRMViYsgnCL4aBc5TlhTlSF5xVwm5ATPINVC+akGXDba8aQmnyr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BOHcfnrE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbEzWA/h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOHcfnrE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbEzWA/h"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEfdNK1117831
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E30+tLnsmp8qWROLdYbSsKgQahl8HVESb2BIpNGL10Y=; b=BOHcfnrEw4Ig73QE
	lrEg9nkS3M/m2b3AKsgUM6FYlyKg0YBlZ01aRHANOTrZELO3njUTt7ysxO2FrLbm
	sfXt7nsiQFtorRW/cIPYO3VVfhHEneLJV2XM/eqrLjKXiJm8qDiV14cpo46Om6aF
	N/J55sqM6BP2Wgg3F5V01TwMK/CjLe4PgD3t4tbF8yR6XPn7TjL/TzS0RbCvHVjz
	KgwNxxw9EoP8jxiK9c+l6VgLuggmsIlDNu9rELUWGIZxIT4pqIMc56u1kGZEV8MF
	fjmypLcOIk5MpV/P9t3r7eM67Ev0BJDyfC9v6OmD606sV5ijdC+a3I9eCG/csSVp
	UJmbiQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8kn08kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:26:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93106d8affcso199576785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785425175; x=1786029975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E30+tLnsmp8qWROLdYbSsKgQahl8HVESb2BIpNGL10Y=;
        b=ZbEzWA/hWpfgJyJ3cTOVfQjRHzcXdq4ybxiJL7ERARc2vmrUl+Eqqjs70MOMelr/wm
         +vd3QKif9vUxO3B6AZUmt98GjLTh6xBvTWjVOEd4PmRsgUzy9Ir060j2eQSCp1BQL8Hz
         xbzv+CiCOrBplJurJJq69LW/dEYFS7R17et3d3uxZlf5eUaxuSrBwWI8W5/2ofQXcW8P
         dHZFjeAFikZfGYn06wWIF+NMDtkqGGDx0UtTlSuEtoXsWtlivbRNFKx7plNIYCze7Yo2
         nuH+BDp3G9uUwagPIisQEVWwI9XHpTrFOruYHhpVaTiThVeMEjpEEC6FND2AozmOMvK0
         JO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425175; x=1786029975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E30+tLnsmp8qWROLdYbSsKgQahl8HVESb2BIpNGL10Y=;
        b=ETv4v3xck55rH2gx/KkxZ33k7qoHr4y9LZyEaZMN9HEAax7IpNVAY9iqvyVxKtCLMe
         tD1cTlCxpDAcJRtAqJUeW+g4lPL1hGTpmaocLZxU0pdED4WM/gFb/rH3NtfBLgbiRaVQ
         Xcit4KXrl90FAgjgrcjP4LBy1vjP4bVRx40+jR9SaL3WNWWt2a3yLs5imcVOFqWeDDae
         d3WFpOS+9lQmDXrQOWbnBsiO5CWIwVPYXWFZNIlxW+Vbori05Xl5zZoCsTVkxVXB1Ydi
         CTTACKUFGaLjHq5uCkBpdNEYeqOIxOlbZyF0FrMO0Lr13d0p+9XZMvfAdRzc46u536Wc
         q97Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqutu9RwITV2T8Ybwrsf9fsX4tSlz59Fe74+KI9VCUayOSa2iZRP96BJxuh7/5kG6IUTUvX9MKCsSGCA95B@vger.kernel.org
X-Gm-Message-State: AOJu0YzHbvK0at7fPIGY5tQp/J/mjS4/KerGXZo8j21QWkoPRfGLfgcc
	17V4fcLwFNDC8iKs8CfDvaFPCWfo9agDl+Lmxyt9cg7yul+Rpv/wBtnKAFKxi8l1xRmbEEHgdsz
	Qsbr+HBolcG+wh4rJo3kT+ZB6u2nv91s6ptQ59Bax10ClMHHQzvIG9Zcgr9SAHGdgqCoj
X-Gm-Gg: AR+sD12yw1GG+217vOhcjSDY+UL0BbnAb9BmvZDWOExyDGCpahDqqpM6yPL+s8/bU8f
	6MbHfhIGgrW6/ecXBqH0ThHhHuYKi1h8AYON1cI7i6XLyWp8ZIWXkMLFFi/IL86ZnNsnhrrOl04
	UsPCfcD28OqZ1nC4vuzPGHh23Jt8N/JaP/GXDmIkND0vQB1Vi0EpdhahrVufC91TTxZnLzQeHP5
	qORKfwwxQ7zbq/aTCMBv+i74g0yj9SPrwz7L9rQlGwYB5mE6P8o/awGMGMqkVIiojcdBDT/Q0f6
	f3l7uXjtFwOUpIMsa3PvtRY3HxV01XCZdyrbropcLFjMF5ThT2PJ0ErsJk9hkVFDQto9N8XW5+T
	6KxxdpLpZ/gQutx6snhwMETChOzeOQ8M+k/Bcg+P6gJASDdvWI5/JpimaK67QQZl5YDUvlFdnhA
	WDVLOUDLOtpcOc7w==
X-Received: by 2002:a05:622a:400e:b0:51c:555:7dea with SMTP id d75a77b69052e-52b38499ebfmr35613261cf.30.1785425174779;
        Thu, 30 Jul 2026 08:26:14 -0700 (PDT)
X-Received: by 2002:a05:622a:400e:b0:51c:555:7dea with SMTP id d75a77b69052e-52b38499ebfmr35612691cf.30.1785425174256;
        Thu, 30 Jul 2026 08:26:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ed57asm443160e87.69.2026.07.30.08.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:26:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:26:08 +0300
Subject: [PATCH 1/5] media: iris: fail firmware boot on invalid uc_region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-fixes-v1-1-413d6cfaa8ca@oss.qualcomm.com>
References: <20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com>
In-Reply-To: <20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y9vKpxUNeawNZbt1t30qUQytDOCxet1GP1jy63Sl7Y4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa20Sdztqfp+JMKLqyVU6qyKhUfJBtam80cEzO
 fAHpmrtiuiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamttEgAKCRCLPIo+Aiko
 1YkiCACVxPtbrcvSjnSKVfT1+/Abay5U5qZTmGyvR6esLn0X/SK66wM7euGko85CiO505ZV3t7m
 4NAjDk2OV93NZkXEtgk07OrKWWW8ZmmbPwTfRJ1UWynG+7tYrC8qukd0ILlffx68ncVgdEraCkO
 FXEmaB9icEn/tuZsXtInGMeSpEmB7ZxA5VMt3k/85KIAqvfLVLtdtScuKr4rDQFVg/Nd7gjz1xg
 dEDkeOtFOZmPrYZ91hFGCzhPP6qEqIZ2eOINwOrqYI+OJQAa0FHJRwSLx/Xv+Naksh/rfk9PGWU
 DWw61EdBzsfGvUMqDO2QaCxeCXPcjpIoNYbXFrgm7J976py8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfX0R09VXHcvLNA
 kuEwZpU7RrSwr4bbfZi8rqM/kDZx4xZ9+0XcMTbtZ7ecOEAGosAWETpaPc4DOaJSkG0eh8sJXFb
 zs135RyYU2sMm1qdkPex6pQQU0741Aw=
X-Proofpoint-GUID: zcc7U7-eCWPop0bIQv-Qz3Tmg6qTwHQ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfX7vH2mMuwoQ69
 5pjwnpwwYdTSsrjf+OWlIAgIubmsBFCmTURUWyBOp9ijkqIUMq6KK23+Y5UAXyp2PaKEbqDkNQo
 jcCcqnDYc5FvfATvVeHU7jX0tr0nVvT6BJ62s4RPvDlacjNP+BJ4xk8jlJU3dG3x61JDod7c2w9
 +5V2kHT3+KKOALShN0/A1oZyatNBe4xgn06wz9fvWy3Fonmd1T0lgeTNtZ4WpTxgRGVAcxQbWwN
 uM+6/PR7GyYy+LYnaMtOKryIUeU2RPj8/PuwxhqchP3VR1ghzDzWJTHvhMsgSMlpDFkrfcjJoF9
 r/xukmwaiofPmWlLJ7J6rc3Ta5BLz40B5GSHebVn4ZaTzpnowjnwx6uJ4/JubcjHWzbYwIQEcLb
 R+ROW0tyNH96AVpbUubo8xj6O5SEcoPmgfyVRMSFDzsdpbAtWV965vVjOPiA9sZay4Rn9gtMZ3c
 +B4BCH/e6IZMBlRN4ew==
X-Authority-Analysis: v=2.4 cv=V7NNF+ni c=1 sm=1 tr=0 ts=6a6b6d17 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=bM5zmIW2MuzvGEp2F_gA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: zcc7U7-eCWPop0bIQv-Qz3Tmg6qTwHQ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300117

iris_vpu_boot_firmware() polls CTRL_STATUS while the firmware boots. When
the hardware reports an invalid uc_region setting, the poll loop breaks
early with count still below max_tries. The following timeout check
(count >= max_tries) is therefore false, so the function skips the error
return and falls through to return 0, reporting a successful boot. The
caller then enables host interrupts and proceeds to use firmware that
never came up, which can lead to unhandled timeouts or hardware hangs.

Return an error directly from the uc_region error path instead of breaking
out of the loop and reporting success.

Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ab41da1f47c8..ac1a1bd72ac3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -84,7 +84,7 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);
 		if ((ctrl_status & CTRL_ERROR_STATUS__M) == 0x4) {
 			dev_err(core->dev, "invalid setting for uc_region\n");
-			break;
+			return -EINVAL;
 		}
 
 		usleep_range(50, 100);

-- 
2.47.3


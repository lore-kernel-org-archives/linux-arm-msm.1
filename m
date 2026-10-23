Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769532;
	b=uwydypnjAqse9dye4XybPwg/YWWCTfNtVNsfqLV7T6M3S7pERwN5k9VH4hU5o510Xfaa
	 674e2Hq3lHaR3RhFBavNj7GIJpLCGNbnJmk7CLL1dVmSrwbltz2UTd/Pmk4Jd6VRkjoAM
	 vmttHLuqE5RPCBC2ttSB4qSOVi9eyPt9953rqXZPlmbluDMUIayhuieBL2awI8AiDq5fW
	 NT4AFeSsBMHIBbCYhRmpjxADcedowPyBBKQDsbj57heK85Fcb7jfmgtM+Lzfgocjxt2gu
	 cV8ag2QpMnkX4YAYCM0Xn9qEmgrJW1Eb9Wm/gW7bnEQEo1fbx2CKBdtqHhg3Sla0aTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769532;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DySIkjkLNzBjfm2iRDrOgfAGcklnPyicfzhINo2PUoU=;
	b=VAFciSJK2CrzT0pFYMMBEIfkbg2J9MwAx8Is7wuGNnh1Glt05Lu3tmRfKu7qC/LI/vmk
	 7ANUqosrRY8g1HBw9mya0EK9z/4sKYDgV8/e+pLAM9GxygB8T0ONDV7XLsBjOQ0YgIboV
	 x0t2dPtG/Cy6bQ9cUpX2vnV9VJ8yFaz/uPtLfOr25MvpEHfYGD8wGwm+A/GrTT7FxB9px
	 k+jzLfEskMUOqfsHx0oxqxOrh16rCM4Fb3Bwm39bP7C/F5D5CpjPSIg74GrLbGMvf7TAh
	 3SzWwEMTKL4dd6QH6OStWCoBrk0hkEjSAwTI0J8RQ6R7FNcjIRgHWp9iLaV1DcxcNYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o3S3hmZG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BquXG0L/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46ED60A5BDC
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E46ED60A5BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o3S3hmZG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BquXG0L/
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6op12676495
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DySIkjkLNzBjfm2iRDrOgfAGcklnPyicfzhINo2PUoU=; b=o3S3hmZGZz/xOtlI
	AbMn1pO+BIouwFtMYrp2W/LAJh6M/5zNGqrAu9JBHpv9DgdYup8OzzGs+HePK1R1
	+pk8Pl9RWqCbeOArSf1iWXgT4B+GerPJp566qg3NSBsZOiMotshLwCmtuRf6xD/X
	JTUielYyc4H8PwnLtPF2yKFZi1OAGTyq8ki5JKefeJStA8KXM+MaHJsF2rdMZsnG
	U1Y/RJQDPAmWpbADXc5Kyn8u07/0cGpfsGqVPlHM2dP7Yb3sCJPRp07hmthrv4OE
	sa0q/rWxrivWXiLnVuspZEh4koFLh62wwZZT2mQO+mmQ2A/WsnxI2STy9c9X4LA+
	HZYaQA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahvrm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:32:08 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99082f450bfso873561241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769527; x=1793374327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DySIkjkLNzBjfm2iRDrOgfAGcklnPyicfzhINo2PUoU=;
        b=BquXG0L/BtDF4sTD4kDihkXw8hDHxh6yNgfqYCKoGGYnG4Xv3VdtNFAb3SPBv3R65x
         e9XvwFPfyIqwKg9OQWUe7pS1a77IsBza67T8NV9Ih45+UiFj54cypZAX/b4xB8qvVfYQ
         Ap1MWznhG79gHd0TKR5WirsldmKvdo1NO1cV7AGu0Jd+nF00P+A0wLjFIwTY+Kr0cjHy
         f04r6XOtY90SQ8aaUEVYy5uoKaOVgxmVQvSuDnWUNHV9veOzBPx1sFk3H2FKuWBYN5D+
         E8jJ/VMmrG9dyEGP79NA5ertIOtUnxX2METGWtkKNLAED4B/4jHd8XWUZw/wvcAKzeu1
         jVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769527; x=1793374327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DySIkjkLNzBjfm2iRDrOgfAGcklnPyicfzhINo2PUoU=;
        b=1i9ccLEFD9jw4c3qKBjqgoOJyRee7cHM5ujpJGhR5zKmuqKqDzLbc8VtGnQgYtBJuS
         GdG0+agLPo3kn6rTTl/IpgUMtzAdunJtJ9ZxqatycAuQVbD2j+hWCelpKCclycnoDiyM
         L44+BlXFeIoKzkfEsYogA0Aitn+V8zhpRAWdMGzoO+i2jvvrLQSJucJMCl4tk8tvMB20
         PI2ULiEDxF8Bvl4VRedsNxeR7agd1cScIMA6rp71VIjMy735dIlAD3bmP8l2BhXHJoXv
         JjqWsG89YPNIP017ixdAxmelEJ6f23JHOwaf7DDUr/ZQe+FRm8AxnVlZDiyVtavv+Fhe
         qqEg==
X-Gm-Message-State: AFq9FYKtXVmZMAy+TUgR1x45YmeSzPEoUN2qhggZ03yP8YCEVesdaH10
	6zJsTpo+lWnKMoD6Uqyw3oHzjfeMKNet9l8A1vaIyHGG+lcMLWrY+HT9FlFwivzICeraq/0GiVX
	LRJLyyQalDt4FwqpW26wUPx729R3zk0C20jQAySf2zwm4PqkPCak+PRThyuz4wElI0siD
X-Gm-Gg: AYBFou21MiyohGcjFV7AkcTqE+0MoYOyxpt4ogbwGNuqKD48CjBOKiPyTxLoI/CHQUZ
	Y5IHcUzj/8InSh4BnavYmhPRAp1omv0Q5pj2z+0B4FljzWSo+3mxiQ5zWN/fr32nZc9ZhYIVQWQ
	iO3QDZTXbVHxLv6kI5um+pUuFRRgLvEJvpKRTwthz72XVDAWVykbz1m3LLB4oWfop35NgbUXglu
	rxu4IuZ1rWJLduCGqRQlWHMQWNNKfdEO9ZuGR97PGMbO81xjivvdSJ7/5s9EwIrAbhqfzyVsNhB
	ea12HFR+HKHCfk0hvZB0Y6IToIbpHJ7bCNwALehnKPIlNeVvSOV8xzKJfHFbSc2MkvvfCo81atc
	agkSYnlMeojs9yvz7nTSTUs86DJmjsOq/umopf8h05J+1g0wABmLNnHbqVs9Z3rHhrlyYxQDTxq
	/v9NHsREQGLeVJ
X-Received: by 2002:a05:6102:2d0d:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7ccc328b76emr1082191137.8.1792769527385;
        Fri, 23 Oct 2026 08:32:07 -0700 (PDT)
X-Received: by 2002:a05:6102:2d0d:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7ccc328b76emr1082167137.8.1792769526933;
        Fri, 23 Oct 2026 08:32:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:32:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:28 +0300
Subject: [PATCH v2 13/14] drm/msm/mdp4: disable the vdd regulator on
 teardown
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-13-83727c122de7@oss.qualcomm.com>
References: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
In-Reply-To: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ny7/Zl0/DVQbqPkZ96Ridz4UaSxsRZCEOGYlva8TgRQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233bMA9BzPVdeqoEGTgsKKhlJ0wLn+wdbePVp
 1aNJY9MHh6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt92wAKCRCLPIo+Aiko
 1SHpB/9DGqf99c9AycySqXMdvLfuK7hVVbU6usMJS0SzmqS8aK39KvanYnVyQED6qoGzjCchnec
 qHjrqra+WeSfVNLEiIlVvzdy/+yJnTLgGUdRbzIis8bA/OazqbcwTFW7hvbA3cuTyRkjz4iosHh
 iBbMSGc7GbKLLjYsA245H72wwUpXlIQvKh3zVo1HOcmd9Zw0zDukFlgjsxolo9kvYaO+Kgjgc0T
 5V+4t6ugzr/KbsCXaKgFnOx+u6KeCzu3FLyi1YXIjn7fcj/Lk8rv6p7wp9+dbh8xzW14dWdIXND
 nkyUaGEkubcsWA4z+LWTRw8eg9lF3FmW3DjOA0ZhA2nrwfqj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX7/eXyoX9x5qv
 FrVdSBJVU3tw3nVN0PRFeNPJiuJG2TGeLc1MKje/av/wQiODm2pvClJt57zZKaV2XhYJhmJyWCC
 cHiPl0jG8Mn1rM7LKaPELVM14oxRg98=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX2v7JdOzSqonA
 15RnvIxs4rmnXUmctrAUOKyywrOVkRs5WtdKznFHQJMXoPSgDoU6SDFEW9qVDj2UvvbDga7rfsR
 zqkmVsb7k5ybYLDwGB0rbY1kjfi2XxorTSzlAwblTyyb34xYoLp/+5evTx6V/a/LhEdQjCX7zde
 uMN2MLIUVvMYc/JEyyscEMtA3Vx4ej141QyYj1DHMdAQXT5a36ajhpoaAtZ7hFg1D/kCDco/SAQ
 AAusdhAsIxu3PF+ANmga5xtk+w1p7dIwWWO7KQWM1k4FQjF85etGRs21KcMyxvxNf9n4KbC3L/U
 EywhWz2x3CCv12whUnfGL4K21dCnHbPg6itgLQ9/hgWnYRGvW16a2VRst1jsPXvslgasbc933Lw
 HMuQf/Nolvd2Gt76Nr7FhTsAaJ2rPoot6L0+cQgqB97HZaBD2rr38+QvTEYp80eR5QH0KYv8J8y
 12hp57l0l44L2Mr+U6w==
X-Proofpoint-GUID: PlL8x_SH7adUwG7qQzvrPBcJzcbcOW0K
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb7df8 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=m8q_D-2G2n8EEWQKP4cA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: PlL8x_SH7adUwG7qQzvrPBcJzcbcOW0K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

mdp4_kms_init() enables the optional vdd regulator, but only its error
path disables it again: unbinding the display leaves it on, and the
regulator core warns when the devm-managed exclusive handle is released
while enabled.

Disable it again in mdp4_destroy().

Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index b6615427cebd..58a269cae31d 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -138,6 +138,9 @@ static void mdp4_destroy(struct msm_kms *kms)
 	if (mdp4_kms->rpm_enabled)
 		pm_runtime_disable(dev);
 
+	if (mdp4_kms->vdd)
+		regulator_disable(mdp4_kms->vdd);
+
 	mdp_kms_destroy(&mdp4_kms->base);
 }
 

-- 
2.47.3


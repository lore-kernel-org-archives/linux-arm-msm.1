Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797642;
	b=At1mZqd6NfRHqSCSfj+vK5PA4q4FMuUOaqquieMeS+et682cM2EfMvhKI9S+q+By74Ux
	 jvE5YY8jMXPV2EDhP5+X9rGXA8ub158hiHyWQCQ3xKrfJViv1/q/P/sup53LTIdZznxS3
	 l6E5l0BZBb8tekBjLe3B99PgxPMQEwWz9+hpwGLe4715si5D3MJwq4G5zpqNzQhicNt/O
	 te35Ce/wOlvC13HEbYgwUOyELpuWWWaZsY5qcnUDyE5xPsYuRjM0cPo7DoOx/pi/nNyuH
	 deRQgUOpfTna3c/NF+9q6Z7K95mVKH38Zj1EtAV5/VvxdS/aMDhMBkd90v31T2c+ZKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797642;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Yv7pO7Jw2oEWR6tz+A4kcNR+pqqDBtVeuYIBE/hxEUI=;
	b=k+jpNLz6DOFov0yP5LJed7niFoIEu6jI15B1OykmfaFRsiRzLMoPUZOXXjjWCKqLSw7A
	 aDb+EpoYlmEH1ZAn+Xsw9kvqqWqH1Tchpb/0Hp1P7UQU6gOtkRLAlcLFoFFrmPoShBrN+
	 KPmsGu3+hYAHL0To1PihniixF5uoOs3l/21BbbqKkSP5S/ViV3+EcfZ4rMpz5yYXgbTNK
	 VH/zkNXrK4jA9NqRP9NL8NvrzlTfOvvTGvN9Wl0Th7GrT4VDdAc/ntCu8/zLkUiKJR+/p
	 +lEpyLtHv6y7qdz9EffpfCyzrUyWNW1TSgAnMBPpCTlxhV+CmgoGq/k+v9LZnAXj8hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V8cIjAwP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ecrFZ0GJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91585606A339
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91585606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V8cIjAwP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ecrFZ0GJ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvH5V3683779
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yv7pO7Jw2oEWR6tz+A4kcNR+pqqDBtVeuYIBE/hxEUI=; b=V8cIjAwPVzF3sl0s
	qqVdosh279tMLglHm1tDmWR1h3tves5/FxXbwbSgHSMRrBaJQ1a1fRVbhsmdiqt0
	ydZXYZaURZEYUDelErcSVEQegqvxoZ5CzbtSzrEDFPtJMemsPZgFsS2sIvTstvlI
	IYjm1nh5iRXUelq5HOeC+AtrdentA2QoUzjlJHKphLuhCHOhWmqMjSW+mS3ivXip
	dvd+if8Z+qR8da1KkSCIQhQ0yeKkOwjDxiF4HJGyrVcKqN0ZRJCTuxTR6gsho/k8
	ocgy2pKgYOcak1XhgaNdNwlxsRMYtq69tDG3oW8IUu4t6OeuZKYoCv82eqHZtFRK
	tAWagg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6sb7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so267866185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797640; x=1793402440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yv7pO7Jw2oEWR6tz+A4kcNR+pqqDBtVeuYIBE/hxEUI=;
        b=ecrFZ0GJpXet0J7x+sGfcBb/CqQNUC9uQg3yNb7PpLeVngJ3IDjfdpZ5dmNtJOi1Xv
         E67cmleeDCf+/N9MBSj5KO/KhVDw4V4qRpmBJI7MK5Fl0A0cPS56b4yhrgB47EIo3wBb
         2Zg2O24FuIOLUY/e3YG+aT4YKJcXHvA6vZH7+7sO/Ui/6vEWGAOyNHOkMCZdMO+0h0mh
         Ub5x8NhXxY5hsnMeaIbR+/fkJ8VqnVupPBnWbltTYuEQw3Mgizqxwy96EjvdX/GDU+wF
         iaU7IlblvQ2MVEgM09oCmqXpJRAioEFLo3Nw7qnautL+lN4MZ7qsO8+qZt+DbYEf2nHM
         +Bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797640; x=1793402440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yv7pO7Jw2oEWR6tz+A4kcNR+pqqDBtVeuYIBE/hxEUI=;
        b=ha7teNh60lmK4qtX1M9NkZXvfJJxXAHMboHRnWUofSk2M9Ukex0Y6MKA7tX7fiwCSS
         gfzAr38foRLz4N5PMsHOjYFTXjP03c82QK0TSpVbKVU+441oDFKBl9RF29tycbH5ryzi
         krX+wDB8KHkCk2P3K99rm65UnnBMg78ffnt3I8D1wsthrFf9UOligUOulEWxCK7OAt7I
         jqRQZXboa9ceDTE2g1rW5TgskZEj77CQ2XgYM145F/IAF69TJfFI0Erfymb31mW8waJV
         5/90kZKrvRINJOK6FItg6vY9wM/vQl9ZR9bXcba0OH6SBsrszCro7d78qCYEgJRm9AW0
         AOAQ==
X-Gm-Message-State: AFq9FYKrojiunWykfDdXxEfMUJ2l3/ktBYTkT3RiwfyM5CnuI4hNlBjX
	SncYzpVimzuG7RCXgYsJ9cVWnR59hgKwUWgQxPB22nmFbD+V0/cPhnOUhxft/+v+oW3eF3nnc1d
	IRFbzVeRGAqMGdK7dxu5i27BOHCEyxcAxXrf0Ur8DbIsZX64I4roj5QbMO77pEF6bSiQ/
X-Gm-Gg: AYBFou0v7tQUhrz3hAN3o9xIc5Ftl70s0PNnLD0dTTs3aniGVZ3FFHdQesX1wDmdoVr
	vdwUBBYqWBzWTLWkcznXbCrfJKj7uHr1AQ7+rSarJ7ZoQmNiB6gympCwbd4bdbTMo8FDKbTCuIw
	Abu0a5UTnxGRFqNLnMaMY5f8u/nUKW6aD98XrXQs2qME7H+btlAIhU/ypiJdsIR9yLA8PARpDvb
	J4jRRSooi3TQGnYHixpDHL/WDAYnqdioN3jJ+EKi04mLMs52AJTA9/s4cr4doXKydNbPEAOKpgy
	TaULf+NG4cbrHPBL1cHnCVTuW8AyQa8ejxllUzN29qCBLi0X7ttXwyPDvAsWUditr/2eegda+YG
	Qyx46QxaM+gq8NtwYEedv34/Eb0cNrmjPN2fRelK5OlsWX7u/sYeJcO6dBb7QWl8oZwgcptjFiq
	2Pp6JzwIAjTfM3
X-Received: by 2002:a05:620a:2984:b0:93f:571b:c733 with SMTP id af79cd13be357-940ef901d8bmr86865085a.13.1792797640060;
        Fri, 23 Oct 2026 16:20:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2984:b0:93f:571b:c733 with SMTP id af79cd13be357-940ef901d8bmr86862685a.13.1792797639605;
        Fri, 23 Oct 2026 16:20:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:46 +0300
Subject: [PATCH v3 13/14] drm/msm/mdp4: disable the vdd regulator on
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-13-66a30120a5ea@oss.qualcomm.com>
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
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
 bh=VKYiNlRfJt8Fwux6dkL1nhokW/Bh3mSOu/sCPXnJ5gY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uYSSzng4DpP5b3LjESkZLtZ1OQwtkpYpx5d
 qEVTTmYH5uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrmAAKCRCLPIo+Aiko
 1WWrB/902OJE+kHi35BZP8sSb/53Y7uXNU3TtdFd/43ktWC6QMoWgqS3EBVSRTbcMXiNUL3nEGZ
 o0f5b5FLes2yO7UzK7GGtjC890s7KQp/LLRn1V6tegJi+tveo6jH4C24Bfa6gjv0PB6yk8BQv7r
 x5pxDF/wmccUjuTfbYkX8t1QkQ4ZZGknleoDMqgu+4lW67NXzV1R+ksqUzzoFRObCipgzVKYyd1
 xl86RZ0Br10M0aq7mI89WS8lrogQqbs/OYUVwHhHYr7832hlkvIVRZPJ6CagkOzxvUy6VinR9w+
 ExuR57f4CaotZCekFVt4RCIg9bKr2MX/nyaBdQLzrQBiE4vM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX6qCTVzyrAup7
 NN/fcwybv2C5tFigAZyt6bJI2tOs7jPydpvQ/A5Zu3te8GMrGeZId1IOE1j+09bfmkwPcuui7ws
 xoak4m0tu9xZ879SWKy8AugZlU6NRG0Yi9E94z2vtYJkekP7giQGedYD4lfsl/vyIJptnn/HOY+
 tVHBHezC6IK+z9bwUiWV0+BcxoHYKvBypRH2DwUg8O/mnO+oMAXRQ2nL9A6h4ZV7k1HRaAQIyFW
 0tz7EMcpiJZ8QYRwfBT2UQ7YwNu7DDYgYL4r7mK4fN8rUOKxxtr0IJuNlHR4xC2E5L+0Mntena/
 fIOsAIaCDsszhxw+jOMOa7TaYSXaMvUg82KF47+gL32em0hUv7TxzM5075M06cjnWZpRA6yOYun
 op17M2exzpMC2RlWOp9pCvPd/1hu03/t0ocwKZq7C3Awq6lv70LAn/AU+17mzzr9Oix40eeyXZD
 7c/0eGMhpGxRBTQQO9g==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbebc8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=m8q_D-2G2n8EEWQKP4cA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: vChArAIoid4ms4O3ulIT4XL2GGssQD1d
X-Proofpoint-ORIG-GUID: vChArAIoid4ms4O3ulIT4XL2GGssQD1d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXwAwXB1O9LGwI
 tz8Mt5AtkYsWe5FVjKRO+m0AEf7ne/LhNsafQkh6JcJ15WJxiGsMoXA35NgLgfDk1g8LlYx02gm
 7upNjdSXKRRxrpAwYWgolhLGdCCs6wU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

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
index c1f61ecf800f..cb95a492e070 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -152,6 +152,9 @@ static void mdp4_destroy(struct msm_kms *kms)
 	if (mdp4_kms->rpm_enabled)
 		pm_runtime_disable(dev);
 
+	if (mdp4_kms->vdd)
+		regulator_disable(mdp4_kms->vdd);
+
 	mdp_kms_destroy(&mdp4_kms->base);
 }
 

-- 
2.47.3


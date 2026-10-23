Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769524;
	b=sDom57r1M6+51+zhbKXALkj9OXMyw3c6yin7v0mT4im/wrRXyW8pIoC2P37FlU+GjPZy
	 X8o5ymF5OTdOH7kAPAJnRGO9473+6MLMo8LeF9aTRbw9zaqWOdu2fKtV09jG6quBXS9S2
	 Spb0c4tPxWghyYpy/n3EccLsopR/Fs2d2NmG88Gmhd64+j/1boBajq1R0xF6DG7S6BkEa
	 4DsrSk/RRYuaC/n9lCjW/2qAuB6iTu3aVaowZtSbB8y0oqzoPepgIMZdnbOlR1PnCNfP5
	 BvBzrwYWRNrcCf2juSg/qGNqd0/QqpE/S+0/ZE7hF4ODGXw966+wl8gcqbK+k3NAtUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769524;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+sknUJlIhDoCeuqBNgo9s/xQHtpRESuIUEkzFP4EMH8=;
	b=R8tbN9xfy24cxHWJGnT3PycHVqlyIKI7rQqZ3gzyKcX41wHNszh9AxXHxAPWvx1SHPhz
	 AQWRPI45x3dVT8UmZOfSyupSzsDq6xdXUBrJIo9d8gUvqMGdPkD6lAd+yfVAKTgzi0lrs
	 Yjj11BMzBS8clWmCxURQw9HI/o0k8GZSTusRFbYZWDrYZhMJEq/w4bP8ZIHHE0WhmEtlR
	 OBYbFgAJX5KASBUff8d7hmftMxVe/Ha5Sc14s7AmilDAa5q9e76MNwqbq9brwHlpO8g3v
	 A9SAYtX/X5THqMBA2FLRM4o0pZx+UNU9MbnJ/yfpEbbc7aV44iKEgW4otESVTj9ZHkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LAkPQxJe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VhWK2hgx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBBE60A2604
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DBBE60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LAkPQxJe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VhWK2hgx
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE74Q83481326
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+sknUJlIhDoCeuqBNgo9s/xQHtpRESuIUEkzFP4EMH8=; b=LAkPQxJeD1bDr/Kt
	ee5zmzt8kC41YgfuMuYkYCVl2/NgNM8v29SJDvI7rHsFMpwwxwXgsSGayehXPLh8
	wrpiLJ1inOmaeYYEjiDDxo9ttACXJlY0IothTdtrcuc0EgmzmURxeAAQ1PUf4Y10
	Ki8GnDioG98bAgEeIJ8d5qSowi7VrLrW7NpwuGs/wAPul4wU5qZXSsmPKTZYhret
	88z2wzWgAcDIxxr/01I6Y7MoqekajN1b+0KTbOeSYxfMT4Pp9Nndy0dTvqSyy2Wl
	bXA+nmHT1iMRgeTBJqdSf5Tyt24C9XmdZ9QkTv91Eq0DQSwLRvR3y4AfZvXx9yyt
	A2KlJQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0mu99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:32:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf08dc2fc8so276790137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769523; x=1793374323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+sknUJlIhDoCeuqBNgo9s/xQHtpRESuIUEkzFP4EMH8=;
        b=VhWK2hgxI5GOHP2TuSnHLoP9LHmlDCI560U+jkXg7RVOlOTiZW9Tr9MlGVwtXDPDln
         RPDtfn9G5PW8RQu3r0sW6lSgwph75cGTwSnvaC6HsJc8mKTeOcLJH7QtVKxhYHiCeaRU
         dJkKoM+YxWYeQofmeBLC012Q/bsSd5Tq7rqDkYZpLd07EWwSBDHRUQC0ASfUE7jqcDld
         uAumYmmBAFM0ctqG7rDUmP0yY8MycHSgZucsl76l/LgpUV+98zbBwMg4KKBLeUvshQoo
         R1bzEly15qjx9TCJ5dX3PnGE3iolLODFm4jcSRknIitN5Gbmt6fTrit9ocTuD/07BuCL
         Atyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769523; x=1793374323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+sknUJlIhDoCeuqBNgo9s/xQHtpRESuIUEkzFP4EMH8=;
        b=S+1GhnvyddmrNSkg1ABiH2I2d+GgkdDSykLbhe0OEgKKNjRR7wmY7FMLrMRH0QBRoE
         KsRUi2pR62J/6g+bBazHA89ltRXfUIVYW/pta91Yke1pGf56RlR7O35I6GEJjeeiPB77
         KrKsn7eRyyIFpjD1M4O9+w7zEJY7ruE64Wg7wQQUzmkl3hmRdL3bBNkw3Fbli7gs/nUt
         8Cis7HLmrGSwXo0xIfyktijVyr1Wb+QmCE0xLwrJod6lJghBSPnu9xrRqexTSN9qJDnU
         /oBVxF+pJZHGZJ2cRuVN8KU3JAY5qk4bSHGQ0jQaip/ainhWAUddffAuRqxdg9cuwFuu
         fIag==
X-Gm-Message-State: AFq9FYKTBZxBtpUQn15mI1r3n+Gv79RfSdJWuVtb7e/QAAGrtAX5ret6
	NoDI9Qilh/+Jy7mYq6l8IJRFppNuG34EiN9PxIIiUTOWgEdJ470GNjjCeGmMqOgJl+3fyBIkKD6
	rajyhex3jo+VfEY+lnlCaP5okYZWnI9Z/wv5Pqf7JfWCyOJf8jjAZ7QtUOY+gkJjGOwSR
X-Gm-Gg: AYBFou3l2xgeLlIAgYkFBIMtxuE7YiWF1rbt5ejNkqCodRAJBqtHD2f4gRr8w+G9YdV
	w0526xLPK6ii7cBBA2SeZhAtZ4dyEcFm9FBsbN/vXNYmAHBhKitBuLoNGUk8IEi04hIYMCvOrh6
	EOU/yXd1cxyiNo5pO9evJOUTwS63xXUIF1LWI7VV2yt1YvBYi6knLjPvbHX3iI+qZHUVYWWIL4f
	50memgVFNMtWhO+ODRTNTqNcNgqKjwcYNWj94dt3f0Ov3k9/Q8TE1j5cQdKSVW5dOAPt/z8lUUD
	uwWZOin7bfi/fkFMUZNs+wT8wT3DuaJEpeLhvy2Pj37via91OGI3b5qN94FfTdlgBswrf47MywT
	03eknd7N8w93E7tJ1yUjarnz+kmGEVgo113gT2GpO7Lsdw90NMYu/3ODBs3HlxACK8SCt2oWOoT
	2WoToRVSD/XGdb
X-Received: by 2002:a05:6102:3e8f:b0:7c1:b55d:373c with SMTP id ada2fe7eead31-7ccc343d2cfmr938885137.31.1792769522354;
        Fri, 23 Oct 2026 08:32:02 -0700 (PDT)
X-Received: by 2002:a05:6102:3e8f:b0:7c1:b55d:373c with SMTP id ada2fe7eead31-7ccc343d2cfmr938856137.31.1792769521788;
        Fri, 23 Oct 2026 08:32:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:32:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:25 +0300
Subject: [PATCH v2 10/14] drm/msm: tear down only a successfully
 initialised KMS
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-10-83727c122de7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4509;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PAN630EnSzX3BheqdkticFypvYZfbOBPCaMWsVhZcGc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233YrOmxPRIDaXhST+Pt2z1sgFp7f5ZUnmoOE
 2KHOhxQI3mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt92AAKCRCLPIo+Aiko
 1XfaB/9PXSyiHdQxAHGqMgIcu1/9M+kv33GQSfsgOzkyKmv7UpdDp4EPbB1FzJgApgHUSp2PsaV
 Q8nElS8UWPqzWBjluph371P4W21eRpaSiVVjIeKw9KLGgtJ0zIziUKXmBDwBq854Yrxb5zjZ+pJ
 KGWxC+pvA5c1WlAVgGSudxS6mLCwVvHZaEyWT1jG7mdGJ44MzV+mHV2lZk4icUIivJ5cdpX72lL
 +YDQ9nAkF05KIaObCxqhwVN3NciYYnzEauaB+p5YpgPppmxTadMIrGFJ8VQlyf6aMhgsDS1lEG4
 Yfgvwd2rsD12ZVcu6ETNYjNZSQsldlCP5ekB3kFcuaOcnRb/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 7OX17sQo_ZbblklVySnjZvAOgpoxyfpV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXyIGxzozyjgKW
 Xp2xJS1dUyrPJl+dA8YfpbX32KeNvhPAZLqcks1Zne0VpNB+4IrNu3ZHeBrsZLHWQBvWmNWAcge
 mcxDRi3k4KlOx+kvaES5cWzrM5ZZrPF6kBdkB0qzEUxpdbf67mrpcWg5gviQA9RQ4zK2v0+38Aa
 AVsLU4QuFq64N6/gOBUfAT3zklrlmXaJtmTvPRBQx/TkEdqa/+vI1Mjxfv8SImbYRS0roFPyRHA
 aEO6KxaAWJIvt8tg5OAj4WaS1obaoMuxJe9XpNBa+aV16IZ9tuTpHWBeNWLT38fazbszrvMMVEp
 pIRM/t1TlrJpAhqF12fYHScBrByEGtLyGAfx5p10i0qfkNIrPKokigS5PK0O5G0Yyqn6vfTI4UW
 FEHvfePmoNCUUMU9IZznf1bcYfW5BboT6ojSJb2fAJII+8qf6fctdcmkR1aeKuNZfPNpq2w556V
 pV2CJSjeL4ITWE5U5kg==
X-Proofpoint-GUID: 7OX17sQo_ZbblklVySnjZvAOgpoxyfpV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXzzq2WCf166nT
 wGKb2FtAQRhWaebvd+Z+ZdMq7ukwnsUY7UJJVbqGC8n1tBmwK+USIbnES2VDWcMNB/KXbtGKPMk
 gDrqBYFpathQIJWXItCg4UIsBr3ty4U=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb7df3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=mlEQwpWygrYFFZNu1HYA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

All the kms drivers now undo their own failures in kms_init() and have
folded their hardware setup into it.

Drop ->hw_init(), call ->destroy() only for a KMS which was initialised
successfully, and remove the flag which let the drivers opt in to that
one at a time, as well as the handling of a half torn down KMS in
msm_kms_destroy().

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 --
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 --
 drivers/gpu/drm/msm/msm_kms.c            | 16 ++--------------
 drivers/gpu/drm/msm/msm_kms.h            | 10 ++--------
 5 files changed, 4 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 255beb83fc94..65ba8fa697e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1290,8 +1290,6 @@ static int dpu_kms_init(struct drm_device *ddev)
 	int ret = 0;
 	unsigned long max_freq = ULONG_MAX;
 
-	dpu_kms->base.init_unwinds = true;
-
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index cc6f202aa011..b6615427cebd 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -395,7 +395,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
 	max_clk = 266667000;
 
-	kms->init_unwinds = true;
 	mdp4_kms->dev = dev;
 
 	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 30af8ef51e4c..c349eedd55a6 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -505,8 +505,6 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct drm_gpuvm *vm;
 	int i, ret;
 
-	kms->init_unwinds = true;
-
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e4d61935a6df..9a207c1e8583 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -293,17 +293,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		if (kms->init_unwinds)
-			goto err_destroy_snapshot;
-		goto err_destroy_kms;
-	}
-
-	if (kms->funcs->hw_init) {
-		ret = kms->funcs->hw_init(kms);
-		if (ret) {
-			DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
-			goto err_destroy_kms;
-		}
+		goto err_destroy_snapshot;
 	}
 
 	drm_helper_move_panel_connectors_to_head(ddev);
@@ -347,9 +337,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 
 err_destroy_event_threads:
 	msm_drm_kms_destroy_event_threads(kms);
-err_destroy_kms:
-	if (kms->funcs)
-		kms->funcs->destroy(kms);
+	kms->funcs->destroy(kms);
 err_destroy_snapshot:
 	msm_disp_snapshot_destroy(ddev);
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 2f097e23e2e9..b5e1cd38cd8a 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -23,8 +23,6 @@
  * for constructing the appropriate planes/crtcs/encoders/connectors.
  */
 struct msm_kms_funcs {
-	/* hw initialization: */
-	int (*hw_init)(struct msm_kms *kms);
 	/* irq handling: */
 	void (*irq_preinstall)(struct msm_kms *kms);
 	int (*irq_postinstall)(struct msm_kms *kms);
@@ -149,9 +147,6 @@ struct msm_kms {
 	int irq;
 	bool irq_requested;
 
-	/* set by the kms drivers whose kms_init() undoes its own failures */
-	bool init_unwinds;
-
 	/* rate limit the snapshot capture to once per attach */
 	atomic_t fault_snapshot_capture;
 
@@ -214,9 +209,8 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
 		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
 
-	/* the kms drivers' ->destroy() also runs after a failed init */
-	if (kms->wq)
-		destroy_workqueue(kms->wq);
+	destroy_workqueue(kms->wq);
+	kms->wq = NULL;
 }
 
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \

-- 
2.47.3


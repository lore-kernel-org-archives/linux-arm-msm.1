Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797609;
	b=lKfcuQ2Tru2kavffwnJRjtH0UWYgFYXHNxUDUrqpvbJcOhBNBJ9+dh1kKc8AYfSbwdUl
	 AyfSAgvq5mGA45S/NcMJhyG03gWZt+rNk+OBY8cHol/qiEzcsUzxgxY1nii+CEuDpriWJ
	 mxBJWuxLNMVe8xLtaQFdriE7/95S0zvnydVg86v0qCB8klWP0oiCaZdHwG+H1G/1EZLHR
	 wBvfmGNti72Fx9dNwV3BssX+1Kz0KyRpqCy+2BjtXtIPxVNJDXsqoEV6TETlE4caDZuMW
	 gQDHqb6Jn1aYsh1Z6XjdJ/3hUetyT9xDvxMs0+HLThGUm3PXYC9PbUO7RJeaMryBBGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797609;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZAcouakyejRyGfq2Cqhm0mLaJYsny6pKnH0rzfdwlss=;
	b=Y8zEOzdZmjcglZ2vu5D1/rbJQPnMbVoMEr6sNZVu8iTDtR97KB0o6hOLRiE/d+kHuSre
	 chwWng6FQxrlJTrsxa6k5BDZFQxor3r8ImlPBvfM4Z5Dq0hYuC/ZD0J/tzJaF91g2nHC1
	 g0ZJ5QVrJS4D9c7L1RXBJxcOFekbr7n35pl4ztgYLXS6zPs5OyirkQAVPGKM4LOwgXEbg
	 qajdBIWIffz6LLzGVjEPGdnc1vSxH2Aefm+4DJPyRRO1r3Hr3tR9ej0zrfRTwJifGbiKf
	 a5nYYNDoqW7UsPtTv7QYkdWwRgDo8+7w+/iqcJ2IcPAEtZ8OizDYqUiAqKzb7KWdwtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="B6BiMhq/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kQ88RdqK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CE1606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0CE1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B6BiMhq/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kQ88RdqK
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvapw3471129
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZAcouakyejRyGfq2Cqhm0mLaJYsny6pKnH0rzfdwlss=; b=B6BiMhq/hBnywIxV
	Qaory4HVBJSyQH18QJEnyxRknEv7Uw90iL2qCDcNcSF4SpxzoMlZbEOXNfixVEVi
	acYiH213IzGrzlCd7RHybJd6yBX60HpqAOyajblYg4AaDHjmw9gSvIQj4sMyOY3o
	k+nLg23Ay9SNk9/ZvtNrs+tLHvj7DSFrriQb19P8RvRZtaCuxWi4gM4KdKo0MOOs
	9OLscWvHdzaVFmoE/VJWgirijvMR21ORY2ibNaYMb0r3v4Oh4u4VFaEmkIrOhMEf
	3Em5qanNHuUT9FYYi9hmBSfsF2gzsaWVwYpIdcU4l79xSpDxpmTbQImqFUhfU4Y3
	CW9Jdw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrugum7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91bc57d4d11so35434726d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797607; x=1793402407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZAcouakyejRyGfq2Cqhm0mLaJYsny6pKnH0rzfdwlss=;
        b=kQ88RdqKNx7ziTzZk9c8fgXQFyGSKKhTiPIOynGV0MEeC6H1w5y9RAKEBCLJaFGg/g
         aD6CEem/LPcmanYx9IkVbNRbV1pKfPWHL2WBOR2KcFvJQTUFjxWXf5YQyfBr7/dbBKTh
         g4PqO8WjJVqSsaldXPTe8SuPSq0pnOgFM9gYj3M/OECjygo8O41tBq9uUkyvBmAAZgui
         LqUvBzS5tchKMaEhAvqE9X+t6h0SY8TODptX6YzrsSYXNgnwhH9ZTZiMFxxRXlqNQP+f
         GxGq0XnBm9fNv85eX8cQWNHvh5VcBNpilJ+hkUGXQxOUcaETTtKCsUTRwZfpaBSbFFg7
         4VdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797607; x=1793402407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAcouakyejRyGfq2Cqhm0mLaJYsny6pKnH0rzfdwlss=;
        b=Nf7bMeouDJaDI4tA1FhjNW8sT2zObwtV2N9nfru359oZT6lndS/a6pIYabPxfgWFH5
         mV8XSTiuk3P/NpNybVlFhhZJAujf8+mxWorPuaoK+0y5thteNV7QrZtKFhzF/mFYHLXu
         QuUiX9VRAJ5cLPy5YvlcPonlSHoHILR6JATsANqCCRBo7im4pnD8ltRmoGVHY9/jQVsW
         vC/JSexwnD1ZzpqDSPEdfgmxwYet/otwCZGDFH16LHaTSEoAvxvz+UP3lb1CIJ09W7OO
         N0gLkTHv/yVDOZnsq0X9iaOyZHR6DyG6glPHUfWFdUM4ZPhSUtEVnvZ2v/GMuBHFIWdq
         FQNg==
X-Gm-Message-State: AFq9FYJ52r+tu3A/Ft/QSEz+MFki25jYj6XDuFWzZaobcYvjvsOXr3M+
	KNyUVr3eA4w7mKQa83gT3zyvFnX8dNJY6i9c4D6UgYe7rlP8SynX9pt8Sb7MIbNFV1zTH09c7Kd
	nNmr276EUPyKm9waZu2+2hc78t9nNaFMZ/3bHNmlO8O/5065SJF72EpkrxqK9fp92wNvj
X-Gm-Gg: AYBFou1uSH1vtV9Sp9AMdSnRUIEJ07Br2AuMmVHCxUTeBkiFIIzq6jelkBHMZRT6Aqp
	LiEgbMFgpd5yuolijs96ZiRx+bvfAm15wLHEi6qKZyOI7PxJDD/tejfdUsTCuIzDW72ydobPDk/
	ZMvWMf554DJeoKiF8Rtex0qJ5xTJ8/vLTiqZtb5I58tJCVAMbG+UljlVIXGBtw+6D/S3RpLeg4N
	EFyUMAn57vrFph7GBfE710Q7C25OyWDceIb03ItDsmUNb1jw9RFQ0QnYMLl3pugAxgOFc0c6GjC
	A04oruj6rfi82f9+XlfxhnCr7rhIEOZbmKgCzOkugLrRDFuYxhtHBZKjtRtHwDWFrTgYA+YA4U5
	2aXBjHJSdlFUt98gXhoxfr9b923ZKLTMnqjl/LK5hLDWXZUOxwazfotXsLu9JrFir/RIUCks7ze
	wfVPlQQS1SpAlD
X-Received: by 2002:a05:620a:40d5:b0:93b:d7a3:45d4 with SMTP id af79cd13be357-940ef9802e9mr88928485a.61.1792797606809;
        Fri, 23 Oct 2026 16:20:06 -0700 (PDT)
X-Received: by 2002:a05:620a:40d5:b0:93b:d7a3:45d4 with SMTP id af79cd13be357-940ef9802e9mr88924085a.61.1792797606253;
        Fri, 23 Oct 2026 16:20:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:36 +0300
Subject: [PATCH v3 03/14] drm/msm: unwind msm_drm_kms_init() on failure
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-3-66a30120a5ea@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5574;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=coiPc4C0940VKA04JsEvpFMf7jlgO3eT5zzOhxeuIrQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uPUU4eXC3ASovgu5IK7Gc7YHyELW8wTJ5BP
 a2Uei6hHgWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrjwAKCRCLPIo+Aiko
 1e7sB/9TcrMuiE+5XpRGqbSTd0g4q6l3AaYylDuvL2y6uUA33bFwulQQLYUHmOubzYsLa9TTVfz
 cYTx52lm2yaiNJFgb5ThcqMx9ogSpF9UKvet6wodD93NkHzJb5V2LfrO8VgM8gIvtsDMEQoC6br
 sYZHMGbTIRMDYdyHcKSFwZGf8AtZ2ulfeRYoLCbDNWtQF8zti58yen2MEO9RJ/E9asuQ5m+/j22
 3oqwgLuqiSq1n+klO+VqASpuBjfTh4uglzzccN8YGLSiTxZZBw7nAuHP1nTfgxaYbV2Qv+cEBLD
 cL9OtyxxL+sEcil6/vdnd5Orl0Fg06wVnHrHrqXyRgaN32nZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX2UtIDJj7egla
 zqB9bDw2m5sOrXZ2M8USlpe3bLNedU9CrjwbsHIhZHPa89ilmXGbgy1KT9/ntHTECeRqODwWIBU
 HzDc+kyHITDAMhxZg+JaAIDZkMW0DcE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXxuB74bB0Oj49
 azgEZbanIW3eqbxMY13DUO+sZS6W73dFEqHEm7QZ/KwEOkbviuGHIxsQbNvAsTRyi9vdolaBzsH
 i0WJuY+ijvk1epn1L8j1V80zBU1YmDi4aoXqeLbRgpSwvMd0YuIGlSAq/m0wkHfS/bFAgm45DlB
 3Us4tM9ca4SLt6j+E8UIqYb0K2wEknWddKOuJ0m3Pi8U5yZ6bs3yKJvjH5+x7ayufEwAwPnY1be
 f6yHNYFTBfPEbziCYcxsShveqtpO9Elzs8YfLd014azeUio9PGoN6AePUjKe0jgoLGvWyKSOOqQ
 YyGC2nsMRffK1pNa/k/+TbnqoJZD3hyLY/vBigDGTAHDEY7j6dFXVCbvTa+VtjovyG9eT25ycAD
 LYgpUa/FH9ANWwCKZkA4wKx84+HbYhaqmZRWfuCIDUfemnPRFlUyI30s8GQelegCb/MoVQhn7mu
 7igXcq8tDhz7/jOLX3A==
X-Authority-Analysis: v=2.4 cv=Ju5kP84C c=1 sm=1 tr=0 ts=6adbeba7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_ChxW0iHWOZRcJAqfHkA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: NdnK-XDb-dF8ubmLBlcoQXG4_BF3x01r
X-Proofpoint-ORIG-GUID: NdnK-XDb-dF8ubmLBlcoQXG4_BF3x01r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230092

msm_drm_kms_init() leaves behind whatever it has already set up when it
fails and lets the caller sort it out: msm_drm_init() jumps to
msm_drm_uninit(), which runs msm_drm_kms_uninit() for every device which
has a kms.  That is the teardown of a fully initialised KMS -- it flushes
kms->wq, calls ->irq_uninstall() and frees the IRQ, none of which exist
yet when the failure happened early.

The kms driver's own init is the first step which can fail, and since
commit a409b78fcdf7 ("drm/msm: move wq handling to KMS code") the
workqueue is created by msm_kms_init() rather than by msm_drm_init(), so a
failure there leaves a NULL kms->wq for flush_workqueue().

Undo the steps which have completed instead, and let msm_drm_init() unwind
its own error paths rather than calling the full teardown.

Fixes: a409b78fcdf7 ("drm/msm: move wq handling to KMS code")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 29 ++++++++++++++++++++---------
 drivers/gpu/drm/msm/msm_kms.c | 36 ++++++++++++++++++++++++------------
 2 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5e8f3ce26b32..1e89fdaf0eea 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -230,35 +230,46 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 
 	ret = msm_gem_shrinker_init(ddev);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_unbind;
 
 	msm_gem_thp_init(ddev);
 
 	if (priv->kms_init) {
 		ret = msm_drm_kms_init(dev, drv);
 		if (ret)
-			goto err_msm_uninit;
+			goto err_shrinker_cleanup;
 	}
 
 	ret = drm_dev_register(ddev, 0);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_kms_uninit;
 
 	ret = msm_debugfs_late_init(ddev);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_unregister;
 
 	if (priv->kms_init)
 		msm_drm_kms_post_init(dev);
 
 	return 0;
 
-err_msm_uninit:
-	msm_drm_uninit(dev, gpu_ops);
-
-	return ret;
-
+err_unregister:
+	drm_dev_unregister(ddev);
+	if (priv->kms_init)
+		msm_drm_kms_unregister(dev);
+	msm_rd_debugfs_cleanup(priv);
+err_kms_uninit:
+	if (priv->kms_init)
+		msm_drm_kms_uninit(dev);
+err_shrinker_cleanup:
+	msm_gem_shrinker_cleanup(ddev);
+err_unbind:
+	if (gpu_ops)
+		gpu_ops->unbind(dev, dev, NULL);
+	else
+		component_unbind_all(dev, ddev);
 err_put_dev:
+	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea629448..f3e39c3907a9 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -225,13 +225,23 @@ void msm_drm_kms_unregister(struct device *dev)
 	drm_atomic_helper_shutdown(ddev);
 }
 
+static void msm_drm_kms_destroy_event_threads(struct msm_kms *kms)
+{
+	int i;
+
+	for (i = 0; i < MAX_CRTCS; i++) {
+		if (kms->event_thread[i].worker)
+			kthread_destroy_worker(kms->event_thread[i].worker);
+		kms->event_thread[i].worker = NULL;
+	}
+}
+
 void msm_drm_kms_uninit(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *ddev = priv->dev;
 	struct msm_kms *kms = priv->kms;
-	int i;
 
 	BUG_ON(!kms);
 
@@ -242,11 +252,7 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	flush_workqueue(kms->wq);
 
-	/* clean up event worker threads */
-	for (i = 0; i < MAX_CRTCS; i++) {
-		if (kms->event_thread[i].worker)
-			kthread_destroy_worker(kms->event_thread[i].worker);
-	}
+	msm_drm_kms_destroy_event_threads(kms);
 
 	drm_kms_helper_poll_fini(ddev);
 
@@ -282,7 +288,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		goto err_msm_uninit;
+		goto err_destroy_kms;
 	}
 
 	/* Enable normalization of plane zpos */
@@ -295,7 +301,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = kms->funcs->hw_init(kms);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
-		goto err_msm_uninit;
+		goto err_destroy_kms;
 	}
 
 	drm_helper_move_panel_connectors_to_head(ddev);
@@ -311,7 +317,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 			ret = PTR_ERR(ev_thread->worker);
 			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
 			ev_thread->worker = NULL;
-			goto err_msm_uninit;
+			goto err_destroy_event_threads;
 		}
 
 		sched_set_fifo(ev_thread->worker->task);
@@ -320,7 +326,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = drm_vblank_init(ddev, ddev->mode_config.num_crtc);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to initialize vblank\n");
-		goto err_msm_uninit;
+		goto err_destroy_event_threads;
 	}
 
 	pm_runtime_get_sync(dev);
@@ -328,14 +334,20 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	pm_runtime_put_sync(dev);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
-		goto err_msm_uninit;
+		goto err_destroy_event_threads;
 	}
 
 	drm_mode_config_reset(ddev);
 
 	return 0;
 
-err_msm_uninit:
+err_destroy_event_threads:
+	msm_drm_kms_destroy_event_threads(kms);
+err_destroy_kms:
+	msm_disp_snapshot_destroy(ddev);
+	if (kms->funcs)
+		kms->funcs->destroy(kms);
+
 	return ret;
 }
 

-- 
2.47.3


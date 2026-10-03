Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF56E25F99F
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987245; cv=none; b=RRNKo469gN5BWE8+B1u+65bFTdWaWowMWNjh4AetrYoflxP77GleTblRojw6Fprxz7wigQWm5DBZpfLJqMM74AHvVs0T/Lr4tEMjKHYlOwIzw2/8At+H8yjuQh/OxGabnfzq/2FhCoXl27KKNRS1BRg9GGUZ2hedgaV8UikcVvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987245; c=relaxed/simple;
	bh=pQ3ltdI40X3ctLCX1uAMzBt67JzA+i9lmpW9lieI8iE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lQNzrBWiB0jfT8YT0xnlts8L4ExRGH4v1y7+xs3TieZISXOJ5pbfnrifsHbmfo6Ntk7+HscLgU7FJJH5DEfXA+rYYjgWbGPII+eusmUkAhTHBXie23ZhFnfxWd0uLl8JpnKeoNUD9rKjnHZpF7j9MItjqXGs09bhkesIdE0sJpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d85+5KkY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awWvmeup; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d85+5KkY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awWvmeup"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeuxW2929277
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ugPvZtZRftPV0KL0YY+nXHR/3ihrfuUddruoG/P+Iys=; b=d85+5KkYjfieP8GZ
	s+ach/NR2zwBy6DieUnrFCuwDiIpB2Hbxzy494AEcJQ6nWcEhZao2WP0ISF/5vtv
	KO3BRDg5pz8LrG6UHWyKW7uNK2LX7zDuNHI0kRR8bOtm7O8XhQ8R5c5+s2BlycIa
	3+5isix14eU0I8h86qH+MzrHLquiIQIl6p9raZbIsiajfqgdl8r4AqOG8NYHf2S8
	UdFpUUhZOStXsYRAurObE+7USbj2lEtWtHbo1G34MExmCdpkkp6vm+ufR0F/ZgQb
	FCdUbBPU81Bh62WmfcF+5WBdaf8EWDikgvrkJAW3C08BZwvkN+dYrJpkJu+OAGr4
	O7bECg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nfvudr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:27:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5333a1b634bso2519941cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987242; x=1791592042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugPvZtZRftPV0KL0YY+nXHR/3ihrfuUddruoG/P+Iys=;
        b=awWvmeup6YTanoesrdVqsA7XPDF+7y66UPzJ2atpRoHZSo26y0BCMCDeRHyUpcMZM8
         YLamJqMRF1JXneiNlOLxYdO03VIb5CfuaHNlAAQUvNA1ycJ65dvwoFrAl3OEN+9RKS0f
         cbrNMtNYyEIp09jdWLr+e6JF7RCUPphsWlSQyuHGVBv0dl0MJ+ok8XgCXF8lsul9SLvU
         GNDhFkwfgRDmvrLqZJFo/cduU8aqTRXjKBl4nPhBQKPbnQJGkOfnP2fOAFo+WYtnjakC
         6LsNkzrXy/gxszpNQt+M7aXho7NpTJ2BhUieDoNpMkkRTGwycX+S6gwxN0wZhRzuU33U
         TRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987242; x=1791592042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ugPvZtZRftPV0KL0YY+nXHR/3ihrfuUddruoG/P+Iys=;
        b=FWTA1/QKmgCqdvh+uMadbL6OdaBTjROUGu7HC3CvFTONR9eQzp3BuckessnybR1sig
         cslwwZ1aYalTypWrKJtgXdfXm1cD8PEOJRRkYSTvvfA9f9YlD78BQlQMsykVymru9tSR
         98jljCBQCaCb6AJgpWKLWngmVVJEkGKo1gT0THoB3zTyZDsNvVqhZRoF5AjOvsJAYmJb
         FeAjBZJ2n0zuRLzYxMh3Uw/RmoLxMlm6oH3CqlQFJkWgzJ1+EJGFBX6I4zY98LfIDK6m
         VfwX/HHOody5YIAxqfpTtg2NPn3tc6bXLsNX7FlHzuLXQRdL/0R53+2ZNuW4iwmeb+Rz
         WTCA==
X-Gm-Message-State: AFuF++mwvhixmpT4tIZJZsWN1FV1CiQ68a9DRdXizQW44g615fKt1na/
	uthAivG5jP54I4BnUzcaPohWeATYXi39no9t9qT4DpF30zlV3FdZABZ+2O0PJ/xDeizPskO32t0
	4EqqAlgJd+T2ylbyqYemGG3Wk+98gRh0d82RSCSI5rKA0iP/JgqFQ6am7VjG1nqGXsSKH
X-Gm-Gg: AYBFou2iLmvpycqh/q99MJf3c6ur3x6Fb+hyjO+yNhwWfnuj9ucaIpzAnTXOQASb3XC
	KCY38nEflYdK1tdqeKMhjWkGJeao/UaSV+ppiWSVt3MG/zPrsabgglZb+/xSmm4mjZDruYmi5MB
	jJngI14Qa+Q3fljtnp7t+EQSYVjERLnYooklpUWwlNa1lucIllBLwguY4YCqODvOFqpa8o7Ohvj
	XEZNcpfrxt83bCDzmh2mCoaByqNk/CwblJGev96zR/5cuW+TxX1YAJ+BqP8mqJ/Y59IlLaWNex0
	zrF6fo1F9dvZnBav5aMYrYDkukyBTd7/zevLc7vYPblB1hUFPp3e4i3zgMfQFctQgwyVXVv7DtM
	AbPw/rH2hGvJje5rcwkWHzWrgsXLHrT1DH4kYjXv5+NdhjHIBxPMNF84iklrhNXkHlUi9mfKMB3
	GLVS/fhtzOlMPP
X-Received: by 2002:a05:620a:c4d:b0:93b:d79a:c463 with SMTP id af79cd13be357-93cf19eaaf4mr852487885a.59.1790987241780;
        Fri, 02 Oct 2026 17:27:21 -0700 (PDT)
X-Received: by 2002:a05:620a:c4d:b0:93b:d79a:c463 with SMTP id af79cd13be357-93cf19eaaf4mr852483685a.59.1790987241260;
        Fri, 02 Oct 2026 17:27:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb86e68806sm1120705e87.4.2026.10.02.17.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:27:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:27:12 +0300
Subject: [PATCH 04/11] drm/msm: let the kms drivers clean up a failed
 kms_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-msm-kms-destroy-fixes-v1-4-e062b7dae77f@oss.qualcomm.com>
References: <20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com>
In-Reply-To: <20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3122;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pQ3ltdI40X3ctLCX1uAMzBt67JzA+i9lmpW9lieI8iE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9YB7wd+ahkl05/lf1h9Li5OmEHH4Eju5rc7uRq/iF376
 3m/L6Cqk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATUWjnYOjIMZEvMl7zaEN/
 4LyTd262XzcVLLuxqXr3ps2/9Rnr4lybXOtZZFglpKPk3p6XitwaMEH3WttXf7PtR9ZofczkqSv
 eZ9Odkt9hnXds5/HWglnPPRj/nw2uaTub9CLirKMB35qcin/qHes0naTsJ50qmf5ZWkJX7L0+Q3
 ZCLTtft03eVwXr92oB5Yr8/3Z6bTl77Y/DJuHvL0xUHjfr7JBaErxJKXmauUGZ4apli7rETVxY/
 +0prt/Ccowtd1uacH7VYqa6f96rHa9M9rEx5mI1kE55LrHw+l/36bVHv0sV14SXe82YcEN3x7N9
 /Tl5Ll2nTW09vnpvDbz882bfqs28YUKxN/w9lAI2SuYAAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ZHobMUsS5wAhr-9RALxA4pGr3qNrjfjG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXzdMFXqdztNg3
 B2oVlgqi/Qa3c8mBNktvrL58/oAERc9Y2a6VyTirBgWS+nx024y28ZXPZ7KGD0si01Z1J+IjDso
 toTqYhNd3lq2cvwrzG0jz78tSWTEucc=
X-Proofpoint-ORIG-GUID: ZHobMUsS5wAhr-9RALxA4pGr3qNrjfjG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX/6SANWhkO5qU
 pCPLd8LYHSTzXU5MmM6bGCc2EFcsef0tTNWSIIfj2D8n7YS+9MTiD9f9DS90UFb75TCeTgoGV9n
 B3wwK0YrqXslAX4W/YUUjCcZ+H2iFFl1ajHZk9mFXNQn5+AayEGW5Rdm6ABnwA5hpjvgYIKPeml
 KuemLGCbvp7q27EvgvkMztcZ+MdaaZKlJDl9s/QXxoZKZvwWECeHkeBM+zBozrKNVNxXRFKJ8uk
 LsxAX5hgIWmnT7qMpddArGgU2cr9WVA+pn40OGi7M14EmzKhDlzNxz58q6yEquzVRRCeJUJrvDW
 6EbGp7Y2wZBfpM4JQ+m/xkkMuvyt3PpF0ChsmBWza91ULtyoW+7IEbriB/+v2LaIaHaiKgVfZuk
 x69nl3XPg6ooy+hqcp1R4XZjL0IndkgrzWM1oQW3B7ql/PjEi9qbyWnYF/HRKKxT43LhrBeGoaE
 v1ZZRIuW3n/SByvCV0w==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6ac04bea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Z_Y2H-rH4idggrPOQXcA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

A failed priv->kms_init() or ->hw_init() is cleaned up by the ->destroy()
callback, which makes ->destroy() responsible for tearing down a KMS in
any state between "not initialised at all" and "fully initialised". The
kernel convention is the opposite: a function which fails undoes its own
steps, and the teardown only ever sees a fully set up object.

Let the kms drivers switch to that convention one at a time: skip
->destroy() after a failed kms_init() of a driver which sets
init_unwinds, and let the drivers fold their hardware setup into
kms_init() and drop ->hw_init(). Set up the mode config before calling
kms_init(), so that it is already in place for the hardware setup.

The flag and the optional ->hw_init() go away once all the drivers have
been converted.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 23 ++++++++++++++---------
 drivers/gpu/drm/msm/msm_kms.h |  3 +++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index f3e39c3907a9..f65774b04c6f 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -285,12 +285,6 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		return ret;
 	}
 
-	ret = priv->kms_init(ddev);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		goto err_destroy_kms;
-	}
-
 	/* Enable normalization of plane zpos */
 	ddev->mode_config.normalize_zpos = true;
 
@@ -298,12 +292,22 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ddev->mode_config.helper_private = &mode_config_helper_funcs;
 
 	kms->dev = ddev;
-	ret = kms->funcs->hw_init(kms);
+	ret = priv->kms_init(ddev);
 	if (ret) {
-		DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
+		DRM_DEV_ERROR(dev, "failed to load kms\n");
+		if (kms->init_unwinds)
+			goto err_destroy_snapshot;
 		goto err_destroy_kms;
 	}
 
+	if (kms->funcs->hw_init) {
+		ret = kms->funcs->hw_init(kms);
+		if (ret) {
+			DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
+			goto err_destroy_kms;
+		}
+	}
+
 	drm_helper_move_panel_connectors_to_head(ddev);
 
 	drm_for_each_crtc(crtc, ddev) {
@@ -344,9 +348,10 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 err_destroy_event_threads:
 	msm_drm_kms_destroy_event_threads(kms);
 err_destroy_kms:
-	msm_disp_snapshot_destroy(ddev);
 	if (kms->funcs)
 		kms->funcs->destroy(kms);
+err_destroy_snapshot:
+	msm_disp_snapshot_destroy(ddev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index ee98393b9855..2f097e23e2e9 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -149,6 +149,9 @@ struct msm_kms {
 	int irq;
 	bool irq_requested;
 
+	/* set by the kms drivers whose kms_init() undoes its own failures */
+	bool init_unwinds;
+
 	/* rate limit the snapshot capture to once per attach */
 	atomic_t fault_snapshot_capture;
 

-- 
2.47.3


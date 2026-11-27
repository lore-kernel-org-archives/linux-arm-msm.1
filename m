Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808695;
	b=n8lZixQXm/Q4EmmAGn+LI8mpR4MtdyvW3xxdfbxvA4qJHBVKfZMoY2sImG4SKqCGO0kC
	 1YUlyRuSe23C33GOLx00htp32VeA8mXQUVjBbDBLK/0R+z8MBAFuS+e6BBHQgPoPVpeyM
	 VkFjI6BF1zES2wHWqEJgs0sDUE4UXyeiGDkjzO2JeM6oIlBurADsVRjv4cvT/pu+mBv8v
	 Bgz+H1FLwT/rA8NA8+ZAj6oUUwDQs4HFBE319ZvdNoJ32y9J4vOgkpibz8ji9IhlNQUce
	 Jgdk3qAjNC6TThVZ5iSQ7eKvwBOiUa2ztgGi5hLj60WO9ucKKO86Qm7NPMVFEfZVwlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808695;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TKuPNZpIkBV0dFXAtfaO3ujCnQ6rFmYD+WOoPws3IrU=;
	b=PTVuysB9YX8W0sk/8a5qgkrYkO5x26AD0QYHI6MAS+CgaEU6vy5YQIY09bWhmeRQvZiI
	 w2iaH2m4u4JAToVytL+fgVA1tel6DJml3LNokXazMc5mK8rQM1oo+LtGHfxyGOGQsNBRS
	 nvUzDuDo8XzF1seEXOHKf8B/MpNI+pUyCpTXB5kbD+9Sr+5QpayiJTQRwAt+QMT1uOz4S
	 0nU8xEaXr/Lkr9iulRXGzmodoKC9pie0E65RZPMeIzuHZKY+9+t20Rdvu02JRLjTc1QPd
	 iNsCUyK/8kWQL/xSJ3C0KFy+EW4iY9FA7TvqHVaqwc+yoDZm/+e+UXtmX4t6DfMPOSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RD6jAZCp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=datoJSPA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C07606A334
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34C07606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RD6jAZCp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=datoJSPA
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAvSO1127699
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TKuPNZpIkBV0dFXAtfaO3ujCnQ6rFmYD+WOoPws3IrU=; b=RD6jAZCpxEiVXyUM
	74p2G/2G0EwU2V95VpOQOXHAn5vH7SFpHaQlp2ooFBPkv7rS9rUspnyLXmALNckp
	gyZXbRyuIv26zGdXebFOB6EH5d7DmhHH2YRpMptucfDio+pKQmr4VYuMlEABXlr7
	oFXeKnyVo+QFmjkMAj2kpv2OACQdxx3lPwFfhyeQEJmJvbclKaQRZhxgeDR4BStG
	iHJ60RvBwgbdmRSmfNx50cE59DQKkK+KLCDyrVHVWmlnxxgyX0oKoAH7R5kn5SZQ
	gGgmJyPnv+Hs70a1XUD65aCess8ZDEzU6qoGmSvvflQi0TvDRHxAjtReBU9rff36
	tO03iQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6trtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:44:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9213e04641dso162371376d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808692; x=1796413492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TKuPNZpIkBV0dFXAtfaO3ujCnQ6rFmYD+WOoPws3IrU=;
        b=datoJSPAiQKqPYXk+my4mY34MZzpcEE5Nt2//e70Kz4jo//S2f4++hnw+ZqZiptmZW
         mF9bRgmCuCO1dJPFIOz3gwBCUhNGgD4uS4WLCm0xc6JVC2t1wPEHsnGjM19FU8rK4xcU
         rku20cmWDg6Wih1zWuV/P6se6rs9W0goRhw1IVnCCZeMRXNYHrvxjID/VB9dxIOoydNs
         EzZi1xhLuLfwOpUt/yqANHikSkSta/HCn/lO+u2OGSFhWHksG/NokhPsKhGvOpm06Beu
         Wzy2S8v+H0L/ymU/b+wEslc/OnGr0Kt5ASbCVIE+/js98hYLRlGEdflHMVg7vzEw3+d/
         yawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808692; x=1796413492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKuPNZpIkBV0dFXAtfaO3ujCnQ6rFmYD+WOoPws3IrU=;
        b=PUCX0CTjJ1iHa9niKPPwHJSy48aDveSULK+YzdnqvX8jltspdsB130mxFh1F8H9vcE
         62u0wx9UTV3Mqm2PZP4vX2MWZmZGPTkYgKHSoy8p5nXfc4QFRk/YQ1GzsyofMfG8Jnf5
         cHVLqJNFV/al5aKA+I0gwMBs3hy8Kij0oFR3UlA0NSIK2Dx6ukKTushttcGbSIYme9m6
         ITGUwXzSQAKj4idzxYB+2Ui0gFHsRej3N3lYv8+5SRHl4idmc3tQ5ERQNoM8Yt3nve3d
         gJ+4oCmCfOdiaRJ8/7ojo6Hd2YeddJus3ig2enKmc4iJz4QgWPdPUcr25iA6FhnYEX2T
         sOig==
X-Gm-Message-State: APuU4Z+QPVyX3LjzxB91lvuOtzkgHw412IarRCYD35G67BqyeyG6n0ut
	SNf+eticqF2xd0L0swDH2xveZXUBZkAFxFrYCgT4pSlalF6ff3eLKVZsdDDxNNgPGlnG/wJSCiu
	0vW2VrwnXhZTzeC1ISQZZzTYw3O/I0BuaEtxRkQ/ZX8OAlREvbiD23RswhT+WjQB0pUnL
X-Gm-Gg: AZFdTZd9MiauVokDDJ2e+H6F3W8iCK8Sh2xz5bv0OBy7nEKVIYVsNOhzATJxRreMWrb
	0ZR6n3hI+dp+MGnRfFi7dwHZLfb0mu7U1aAyKqjwWCc8WlWb1d05eEkpkK0/39h2FflhYrv+FTj
	W7rN7/9o5pTHMTJVAMUzLk/jMzeTDPMteOJ4yE3Hypj4PR3Oo4zCrlYB0zXXqAYdJ5quYfxU76F
	+wckZPpl08Rir+P5pAdvI65uQ1kZ8+Zya4J+Sv0TWne3XzETQOERwxsYzUExP2OkVGZ6dlBJIRO
	r1yZV7AUec8lIWi4hVpRYb9x5JtZ4nb91D7+KRGvcoUBWCN2ki4VaGNJcytSOw7M7xF1HVc+PlA
	5DOQjJXsJhkqi7ScjT5DYJVEdbYiDmUsSQfQevgOe9nf6m4YqMuYFpdpO+Nf0cVi8/WBc6qcR4K
	f7INJv1oFzFw//piBwtatcUrdGFNQ3O/L+Bu+7lFbgY5frtKBaWeG0vMYPxzYO7g==
X-Received: by 2002:a05:6214:1244:b0:921:7f62:ae41 with SMTP id 6a1803df08f44-9217f62c58emr180026876d6.27.1795808692479;
        Fri, 27 Nov 2026 11:44:52 -0800 (PST)
X-Received: by 2002:a05:6214:1244:b0:921:7f62:ae41 with SMTP id 6a1803df08f44-9217f62c58emr180026336d6.27.1795808691927;
        Fri, 27 Nov 2026 11:44:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:44:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:14 +0200
Subject: [PATCH v4 01/14] drm/msm: fail the snapshot init when its worker
 cannot be created
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-1-242b0a3f8e47@oss.qualcomm.com>
References: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
In-Reply-To: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2085;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pn8k9pjAdztDK0HTVppUIDnbe3Pz6r2PeItof1YOjaM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2W80S0Cp0LSz+DYTZ/QxL8NtAGZUTfC5FwU
 u66PmNVkEuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndlgAKCRCLPIo+Aiko
 1YUUB/49xsKwx/IInER312BWj+eV3B/o/aN7cqaV5VcaX09DRU2gdIkhOyGzwaXSbdyAjF+81lu
 MIzAbawHBjdYXL1FkOOHDMn/6v87u0B3GEiKIe27skcJfENn/QW/X+3+bjlMjQT7vnUeGLRteIm
 N37kdGOiCJCy0BhzPNXnl9gRabS0xqtc2s4yOyL9OhEbrcvs7f7XvsZ9JafzuyI1En8DzZE0Lwy
 XY+jrSSwINP+4DJQ7IRabQTuySma9xR4ZOambUz1V4yqEMVuvQC8snnqhfMIy0XJRzlbfw+zQHN
 z8uoNiUZuXYObfCyTNU/tQuHpK1sfZG3+KVvDKNV60hUEDRz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: pv6NqeHGE0KwfNT6fou0xECH0ai-9ztI
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09ddb6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=7Wt60wlDe4M0s1bRQVsA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfXx1COz8b21PHG
 NZWE7P6Xgyx6e7Vr+cxK6/aU3zRodi0SPxADGQexOb5AB3VQhfpdHXvB3l4zSNeR9sVvIxJgXVz
 Pc9+itEqAJJwL6qVh2HRyEhaZZYos44=
X-Proofpoint-GUID: pv6NqeHGE0KwfNT6fou0xECH0ai-9ztI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX4AHepxDdg9Is
 zR6fFs0503zTPD1csPNRahWBIJr0eDkgdMxyC2qHkYU8STLTkhnQ3cSpHrIcbmatCqiME3V9MOW
 Kry7ADfB5Ny0JvhPHaRk+dgwgDUlDgJJ4i58pgYbyNcpU48sBBKwgWuSC51cMtvXPAEacwa7iF8
 wcGHThDjMZaePK4N/hOxNUXic7OChH9GllkGGQ58pHKFJgE54/5Bzc/Ou7XOYXkmchz0aH379aD
 FGGQDu05QgPHvQZlwnWk/9Q3amk+VZM3hIHSuq7uvuGcHbDZR5xRyPHHC6hm7JOO/Icaf46FejR
 9QBWoslYRYLzRLpXQd9OKmAxdc4N/fNnbRc7okD/4p/DjCclKngpxy4wBnnkwiIDDOQ59Iqsov1
 izLS64rwR+XAKXCNsabuLkh8NiHZAqxb3x0OU5c3Fc+vvOg2lZAd8kmw2L3qDTZz5MZYWzgaAtx
 Xffd4Y1W0rKDWXSfSPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270078

msm_disp_snapshot_init() only logs a failure of kthread_run_worker() and
returns success, leaving the error pointer in kms->dump_worker.  Both of
its users then dereference it: msm_disp_snapshot_state() queues the dump
work on it on the first display error, and msm_disp_snapshot_destroy()
only checks the pointer for NULL before passing it to
kthread_destroy_worker().

Clear the pointer and return the error instead, so that the KMS init
fails rather than leaving a snapshot facility which crashes when used.

Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
index d99771684728..6045daa785c5 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
@@ -98,6 +98,7 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev)
 {
 	struct msm_drm_private *priv;
 	struct msm_kms *kms;
+	int ret;
 
 	if (!drm_dev) {
 		DRM_ERROR("invalid params\n");
@@ -110,8 +111,13 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev)
 	mutex_init(&kms->dump_mutex);
 
 	kms->dump_worker = kthread_run_worker(0, "%s", "disp_snapshot");
-	if (IS_ERR(kms->dump_worker))
+	if (IS_ERR(kms->dump_worker)) {
+		ret = PTR_ERR(kms->dump_worker);
+		kms->dump_worker = NULL;
 		DRM_ERROR("failed to create disp state task\n");
+		mutex_destroy(&kms->dump_mutex);
+		return ret;
+	}
 
 	kthread_init_work(&kms->dump_work, _msm_disp_snapshot_work);
 
@@ -131,8 +137,8 @@ void msm_disp_snapshot_destroy(struct drm_device *drm_dev)
 	priv = drm_dev->dev_private;
 	kms = priv->kms;
 
-	if (kms->dump_worker)
+	if (kms->dump_worker) {
 		kthread_destroy_worker(kms->dump_worker);
-
-	mutex_destroy(&kms->dump_mutex);
+		mutex_destroy(&kms->dump_mutex);
+	}
 }

-- 
2.47.3


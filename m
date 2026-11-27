Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808704;
	b=yZSY74uxJGJ8mNktBJr/oR/rXK2H4Np0Eu2xrBo6txvwA1l77uMVNrT9+55xznv6Vs6U
	 rDfUtgSs6e0/KBO8qZ9Rx1/Ooy9ja9VMBLVUx178imMoAiX9G56bWlAkj4Fp0+UY8gt+I
	 bFFXbR3ZWy/kR2qNSyHJW1g5pT7CBWV7/QTgvlPSPALW8CWJs5FAXP7VeGhpgDyU9OtX8
	 /ZM3lEIqSl3+ZE9E5C0GSqIeSnvF2z0pFMvtARHJV5KURlkyS/vC4b//G43yS3FZt+yE+
	 z8MMYB477cnhQIOyy+Q3Dbge/12jINKpauJVB4ivAsBlvnf4FYRZ0odKZ5zkyS8w/8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808704;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o+PD9nsg7NQ3bIbbLofFaflTGFjytKKE+xHErDhRfCg=;
	b=r4FzLemPOnJ0Eet0KWlDruYuzdyU+dNQ4pINazz6dv/Kk4mwRg1mSnvM+YOw5SSPFEAb
	 ig1na0+pAOJuxpixtFzLySb1dzNi1QllWaBTB7br565l2sZB9905126AnPYEoF2sFxxr6
	 qnVmYUo4K5fNTyIjU3l86Zb6vj0d4sel7HL/oTostWGeCVSnVgG1boBHRNhsijEa1MkKO
	 jY4xJQuhj4YtxBSDrXmFgh+ueJgpn8g3RZN5peRccgNWRq0xOj5Ct+rkqDfceTnLBb1qh
	 Ay0mv1USp0sm8SsMhGRdSwdKgKde3lZsu4RW9vTNCCjE5/a7EQYfQ+xSE9byFzpJgVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="OIZ/bgLC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KWr++Jnc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFBC606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEFBC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OIZ/bgLC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KWr++Jnc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJRAk02668727
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+PD9nsg7NQ3bIbbLofFaflTGFjytKKE+xHErDhRfCg=; b=OIZ/bgLC3bikMgqC
	TWbphQ+kl3Y/O43vIKc8lRgYzvAATamWGR/1l0n2NxuhswbM1ATCLRviActAGUHK
	+3JVZKkJ2f4/7MNduKelWMGuPHvGZd/1Tc4v4yfc8YlBNXb3WFnT2TtQQYBHR0Ca
	Q8auKU72+JnCVlBLioqtppjsmwRwCoT13eTaPJRHV+xJU2DxQvbc72/RI11C6ZvB
	FaWTIw9wO83/eICBwX6JdNpq2GEzaIdbyUu3GnxDJ5uaT6KToEzjzHAr3suoq/X0
	gnZjFOH131+NARv2+RQynkKSsfmolIq2qUuD5pw9rRCHHeJdhym7JDo8ZGl/U/ce
	3XiJGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g1jg1c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94975041698so1897449485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808702; x=1796413502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+PD9nsg7NQ3bIbbLofFaflTGFjytKKE+xHErDhRfCg=;
        b=KWr++Jnc1Tiq+3vMA7eC5UXFcunTRK4DjECZuWEstuGp2fYHbdpTrXjviNNyWW7D7j
         X9XRpSImp3fA8NzFuDeMTbaDwoJw84oIaHHRj6E+/8ucumpaNiEPfe+KPp77inFyM91k
         2w1teW8gA8LQgCpphLTQ/ZQjWk/I7lD9vY29HR+oMRytnSw/TU8Iz/44X4793RSQG28f
         Qdpg5ejcGZELeAB+i1HLrQkR8FjowtqCVGsWtrfonXLb71qQHXCiuqfAvLRAwevJBCYz
         SBvBW/E+0SAO9gfITgg/70Q8Z0vK38eRQXZBHN+PVeYvEhj/1XWS+PQm8LoVsQ9oB5KI
         MoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808702; x=1796413502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+PD9nsg7NQ3bIbbLofFaflTGFjytKKE+xHErDhRfCg=;
        b=SOwDNuyc3SGW6TVvtIXJH47G+HJrVzGextUkrNoY2QL2iUteAO9GOD/a9XGcJjLxfr
         9IW7OjhV8m2lWJeSmXHwJBylPc/TL5AxxsIGMH7cmGfPXoKG4H+5Mhz5bZWTK+Idga2l
         a/Clw9lOL/AgDd3UD8GemIkujEOd8sOkbd0M65a14BaYLPzzdmzhmaxJC8DV55zV2hvh
         PHzEIVFK9xi8JM1Ymhh66B/9iWJAETtJU4LTcRThgKq9UpaBEL1IFg720/E26OKXZg+z
         DKbWuCI2bOIir9Szva/N4GC9AEfjyphhz6AsrXMdwfM0VGjPnjuHgYfnKqk2CHYySWE/
         MPOw==
X-Gm-Message-State: APuU4Z8gpNICAoOkkfTJHop1l29dCg84xxVo9vC/0bT6k1UzwQqwYYK2
	7k83irJgIwchcFr3di5hIlSXqbcAftvq7JZPIKbTeURsbZEHvdMhq2JnD97J2UsccMtLNAFfvDf
	uRfPQ/zzIc6WHcvHW2l0xlTlmM/Gw/x+yiqiht1aaSrjoxoBk/8XEAuwrONXmvrKD5m0f
X-Gm-Gg: AZFdTZcm6mW705l5htMj17zjwoFEpzOozLwJTpz3NAdKs3bTWd9sM6fnUmRL6/aD/jg
	QPd3d7VBQYsnKU/jmZvd5LKdQwU1k0hC9HBu8EyBwtQGU+Yi9nESE59t5J5igHXSp8Z1x8SzCMt
	V42kUYKIpdxHK8wAPvqwCsxOh1GtnEIYEpyhrfFZh/JYSzHmEyjS7/BpZj84B9ZiQqdyd5XiL5/
	J60MhfaZF4bkB3QzeW2rn8frISN4uXXF/m2N1UY9d4GZ+R0B0K53MPhI0hwrhI0E6zRqswl+wGZ
	qaXaw9GWCyOdaKehh0W6bWYs/T6I1JrwRDLN7iaSH57SSX9goPZj/GSs8MPK3PH23qRJ77FqP8I
	X7hGG4A/d3UAkhrzB+qfl7E8Mis7WHzKIi1mFoSkvN7Ooy+7YkxLQhHxDDGeC0TELlIlsOrPbSX
	HcmVZxYOKD0pHcBiinEfCWRDkKl2ZeecDvlEjumkV1TTyeFO4S3nbA1xDNdCVFdA==
X-Received: by 2002:a05:620a:4149:b0:949:8fcb:5cc2 with SMTP id af79cd13be357-949b357258emr4500839485a.12.1795808702157;
        Fri, 27 Nov 2026 11:45:02 -0800 (PST)
X-Received: by 2002:a05:620a:4149:b0:949:8fcb:5cc2 with SMTP id af79cd13be357-949b357258emr4500835285a.12.1795808701661;
        Fri, 27 Nov 2026 11:45:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:45:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:19 +0200
Subject: [PATCH v4 06/14] drm/msm: let the kms drivers clean up a failed
 kms_init()
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-6-242b0a3f8e47@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3357;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/7dzbRzST7ZLot2nSYDYj6bDx6tl5/9Oqc6IS0KWVMQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2ehAupMjv9xb02YgbXVDPMIisf4lmpshqi8
 cxqU1aLewCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndngAKCRCLPIo+Aiko
 1bOuCACvk6ZN8lZm8Hlvkcv7gWN2XZnZ8SRQbNsU5Xwws4/JpPNjIa3EbWX+omF33XsfaDmVSio
 MEm7woHVqG5kpKziQabVplYskqhwpZSXoLmMjmb6ZJW4IYg4acd588m+myOjEUSSZj1mjKkxNQh
 NRWoxE/5wGXZ4rh+XlqEW2NBnHBP/zGubf4k35xaW5qXjSjvpGY90hgRdY9hydLDhVF1OfGIn3F
 676tl4JJVoC9t5S+WabmoRR7xrjQKIyNqvXk/TgbMp4RuSazJtVnpOFoA8/zR6bfiTviHYs7mm1
 LjHvY6bhLJphFRePAR6ZxOxGHP2ar6TgsP+8GQjjj8EfHUvW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX8GiUehErRcpm
 lFg00bzitUdcu5X9qcRhFyKuGqUUVAD9t8isoZ2CnJRp1pLp5Yv1URD0/CzFlA2KiyKdS84CqxU
 B7nK6rqmdEi5UV2irrcSV5z4NzqG2/ZC78oV+yN6kdfly6OAPaUDcpyPL8ov1mLGryTiz1S9S3X
 CgNPPli7Eh6X+p2CEFUEMzE3ynP+kfgHKRsj3qyOb/TjBaHOo9VZdKH4qf4Qrbt7T+CYP/Ht8gw
 lDwIYLdELNEo6L1XDOg0zuxaC93XfXr891u2nnDEX2Y6crF9BAWU5WIhkRelDOPZsJwdjpvgW+S
 cZ1MCZ0JpxX5e8kMLoqMR9vx1Geu5j5ecPZr4FANBbb0onxW1UJb3atUojs9Tj6zn4SzUAhfEdK
 NKRj0UeVcejTbSfYzSspc+W5AMZQXLJAbXPbZS7h95A/y6PFr3adDqLuXJrWYjAnLwTCPEKk0bc
 mkUq0Wz/L5Eh+sMqrcA==
X-Proofpoint-ORIG-GUID: oBjiWlFLSYZMrBQvgAKM87lO5ds7Q8Kz
X-Authority-Analysis: v=2.4 cv=QpzLTlyd c=1 sm=1 tr=0 ts=6b09ddbe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=DqDluaqBKgvBNGcJzpYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: oBjiWlFLSYZMrBQvgAKM87lO5ds7Q8Kz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX9n1rNQJqlgju
 MltaY68UVleTx4ebe8gPj89Xfzcd6yucp8KKRNEf+wjzpaKDxT64uZp+h9zcoLwXILGU1glQiaC
 kxq1HjnD6RmSX0lRxozpeKQsHU6iMLU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270078

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

While at it, tear the snapshot worker down before the KMS on the error
path as well, matching the order of msm_drm_kms_uninit(). Nothing queues
a snapshot until msm_drm_kms_init() has succeeded, so no dump can be
pending either way, but keeping both teardown paths in the same order is
less surprising.

The flag and the optional ->hw_init() go away once all the drivers have
been converted.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 25 +++++++++++++++++--------
 drivers/gpu/drm/msm/msm_kms.h |  3 +++
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index a94d2888a21e..da9ba8583420 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -283,12 +283,6 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
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
 
@@ -296,12 +290,22 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
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
@@ -349,6 +353,11 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		kms->funcs->destroy(kms);
 
 	return ret;
+
+err_destroy_snapshot:
+	msm_disp_snapshot_destroy(ddev);
+
+	return ret;
 }
 
 int msm_kms_pm_prepare(struct device *dev)
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


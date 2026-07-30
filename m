Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B250442DA49
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785416772; cv=none; b=rSUzb+xnhWiFAfOzTzf++NeHXWkg1Pm9v4SyXqlxY5JYgulF/gq43E4wAjg+/9xmP936Xo7wy0yVQ5mWRMg8CedaTDQfK/GHIJ+FiyRjwZTBvWRXytrxD6zXC17E0l1HVotJS1/hxfhI3dPz/oDO5KgbLhlaijwna83uJcDY0yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785416772; c=relaxed/simple;
	bh=ikByuc16etS2lKV4CPKR2P/3irvgBquufmeW4k1/Q4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pvSDWeAGBmoMCWLgdfXg75zdomBUmMzh7xnF0XriK07q9lWzBZasqoloBaSlZ2rHW2WccPjVu+HNHaZFWVkuwO4qMtygYhlr8/ue6VzB5KcVUBesuml46oSMNGpIB7+cOEWZt/Ydc9s7EdBwkqFyAKVDdkHBrH8EsqP7KHma90I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=biynfppf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZE+JrP6A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="biynfppf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZE+JrP6A"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA2WR44191290
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8Bl+HlaMrwZW23yvXw3JeP
	7hrcrAi/gDsI8dvDZb7cw=; b=biynfppfH50unacrr/1nysTRaPaEaVX1PcuNzW
	C9fwWLKsDCZhwzQyMuS0QRxO6qDt7iKXs5AUCGgg5bGgzFfBtyNTYkFP5gO2yvOH
	HOmTJmJzs/rtYlRQPKM3dzC5CTVbPKP9uexuXzaF9z/BDQeHMtDEGrZv18lA68Ej
	QNFfSzahhlAlBxFZY8+3CW5mZ8Gk/v0OYo7ZQVgwXcmibd2BvNaPanjFGvd5ZBXd
	+rh2XQg0euaIlwmz7kWIjsHENYyl43Qz1z8yPMAxQ5bfaRZEYhAy7gRgx+8YVAN4
	orWyVh/M83tOdy12RUO2Cx3LC5aJd7ob1ah/zK+mVbkJ1eyA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3tygwy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 13:06:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07f25de2so18200251cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785416770; x=1786021570; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8Bl+HlaMrwZW23yvXw3JeP7hrcrAi/gDsI8dvDZb7cw=;
        b=ZE+JrP6A3wtkALSNoe62g/nsIWJnmRlrpa8Gi0xvmQ4XOe3CwNDBOAJJHRedi+5TPz
         GyyaIt7z7AorV25PmXwi441gquVhM84gbDRC8THvpG9rE1AU50Mrtus3bSdPiS3taE/w
         L1A8wEptALEPnq9DHCDvF8iRevS7PINKIGapiJOBoug1NaSpVfeFC9W7GnvrDCPHtz1S
         9GfX7gVEXJUDSzFvHviJjrMmg+4472MhbxYdl1aQEPXUNRfx03YzJ8nFQZp7uyAWVKsg
         0tMrsrVL3BXARIgK6kxoZ3hEGRO0aiidbXmmBnHib+MS0Obk/U1Kgf3GzH+bv7EhiOgh
         9Ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785416770; x=1786021570;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8Bl+HlaMrwZW23yvXw3JeP7hrcrAi/gDsI8dvDZb7cw=;
        b=db6Zi+o0WKIjzLofcyp/IPcvgqppsE1BZKWmo9TZg1Mel4rWO3j9GPxLncsM4P8AqK
         HRdKTXOaUP5cT+2yMBOGKw2TLvg6X9LgEcrDdw7NfuFImCrtSHgmmySMXlnffUrgJB23
         IxiNsKe8hkF+YQvht7SSxogi5QGvE4tVUwXacRVXl073iGE4JRe6+fd3n8QbB/bTNWAO
         HIUIsDlx3618Zfwfzlv5H7qQl9k59y30UOR0IK0skMU8bxAlvH/zMbh/6PElpoHWthL0
         MtVOhm39sRFAx2dN2F6ALL7dS/de6ZLmSzIl0NC+0+N3nu0tH+In7A6bLw9G0EUYtMAc
         MRKQ==
X-Gm-Message-State: AOJu0YwyZnq/UauurY+XY37onFxV4x6jFexL4L0N8HrGvK6UVF468Vfe
	OHGfv/IuSh/1+aESXSJaxSWKUc1XCoU27VVahfgmJimRGlNCT82HWSzwRgPkRCif9Xw+W4ea0/C
	y5tD5nZKFqli84cBVpp5xhbesRtb2C2pRdl0hLlgh9XFu8KG2OJOOT274QFqfqBvDxwTo
X-Gm-Gg: AR+sD1368ucvkQCunA6DVdisIuiIUaGEwaq16iKbAw3zLBNCpbDaXt/3GH6b/gyzuQh
	q6RF4njL37mFmlaA6GlZwxvfa/a/kwymRFMIR2P46+8u60wq/R/YE6Sz0L/Ws4sLdcEe2xnFPF5
	Ne4CrKF9YQFwokHD7slTCdu9AesZVyaDZ8FBTMC4+JVx5bpGSxxX6bp8rzJZzDDS0EF26qv7w04
	N3cTTAc36qh4hKBeXvsLjCToP6mP2WHIaZ+HP+yylohHiQjGQG+S6BdiVsqZKGmMmeFr8nrAiN7
	jKlG7Y1sP2ttvJ+2rCSFg/0SXzlfCe/qKKbmkPaqZyUoBqFmqECyqEdpudJ7gXEq+Pxj1pFaaOX
	/NBjhRkmtGhhHiI4Pb4ntPcWZRmtoHxrRIJscfc48OnWm5OIkMR/ZheAq8BdgeMiH6IVMDpWjwy
	4gVkKj7/J5pMGLvg==
X-Received: by 2002:ac8:7c48:0:b0:51c:7b12:5ffa with SMTP id d75a77b69052e-52b387c930dmr24443421cf.86.1785416769108;
        Thu, 30 Jul 2026 06:06:09 -0700 (PDT)
X-Received: by 2002:ac8:7c48:0:b0:51c:7b12:5ffa with SMTP id d75a77b69052e-52b387c930dmr24393901cf.86.1785416716736;
        Thu, 30 Jul 2026 06:05:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9fec8esm324245e87.79.2026.07.30.06.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:05:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:05:13 +0300
Subject: [PATCH] drm/msm: mark the fbdev framebuffer as system memory
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-drm-msm-fbinfo-virt-v1-1-a27099a6dc58@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAhMa2oC/yXMQQqDMBBA0avIrDsQjWj1KsWF0YkdIVFmVAri3
 ZvW5Vv8f4KSMCm02QlCBysvMSF/ZDC8+zgR8pgMhSkqU1uDowQMGtA7jn7Bg2XDpmq8c09bl6W
 FVK5Cnj//66u7rbubadh+K7iuL8u48lV3AAAA
X-Change-ID: 20260730-drm-msm-fbinfo-virt-969fbb837443
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ikByuc16etS2lKV4CPKR2P/3irvgBquufmeW4k1/Q4U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa0wJVfCfzqIAaBUMp3/UF8agWYARbuk/TzOv2
 s0eVn2eYB6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtMCQAKCRCLPIo+Aiko
 1b4FB/4suc6wPPoKhfU2kMLMbnFgSxnwHmUnATa+jVY2TTTP29kQQYSJdygZzSJlJwh6uYI7FO2
 JV+/58iN0LCHFrXz5pkgRTyW3xvE4EofZ7pCY2GJP9xtqrknQZTR5NMVSwRY5TiYg4fzMlKo90x
 XLY9FBCwT9G2nbsalkxzz3SU5xlV/XiEWj9KQ7EKBZKUFC0l0UbfVo2Evw2RcCZ9qUKgSi8NTWM
 Ri/Vy/1vPmTpvtapzRSnAmVF5UnXdr9kCWb26E/oPCE6lg37NM1oZjdFt5LDPZ10ka6l52swyFM
 zC5G2cjOLBU1Q9awIOD9r8svuWhI28KvjkOuIXRdgzRtXoNl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Pq0CG7kF9_VJBvcjyOtqt9v4GvsU2pkf
X-Authority-Analysis: v=2.4 cv=JZOMa0KV c=1 sm=1 tr=0 ts=6a6b4c42 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=QQgrQWe_eaANyySby9wA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5OCBTYWx0ZWRfX31qaUHB34OjF
 ohcDxoXRrku5gM0bb+/BbKoMuFv04JGTiEUtJ+zRTQZSk13793dC/AB0LDLFxDIthaWMhZiX3y9
 rHoeXjnei8CO8BrokihWD7u0P9ZSe9Czd8HRW+xL6Eh1InMYRrptDSICSAkcMFbsGvkmpLvlwyG
 ukvc68aWv41D97VvqO7N8QJ+y4ttDdI1yJy0M1mn7wqbKjryg7S1Rii0HsTCHwFhad4UooAV9NH
 u7oKPKWqaZL8xkn4kKKp7RiclZ/U7HC3T7dKAu24Huo3993bxskYwJWPkErSIAutuVr6gJIEtrz
 HaqY3CX+hZUjHWlNbTOPVoNRK3YKxmLntZJUoTo6Lv2FtSCA+F+XLkOWwLuxgIJwWpxfvu3K/Uo
 qVE//32RXf7XZY0sNLg63l4I4ytS2m4CAaTxnTtBFgn7kBRPZm8KSGexELl2sTj3KD/kq6XlB40
 dg8VsglA/0QwDraMvNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5OCBTYWx0ZWRfX9TyvSMJTAaQf
 uqenibsKuY9wueMSMN4y19R2L2xKudHfLL+oTs3pRDzUjJSttXaJyV66dmdYRQZolgROjVyBNqo
 +n83d70Tppg+2VETn8dKoN2fWB+EweY=
X-Proofpoint-ORIG-GUID: Pq0CG7kF9_VJBvcjyOtqt9v4GvsU2pkf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300098

msm_fbdev_driver_fbdev_probe() points screen_buffer at a kernel virtual
mapping of the GEM object and uses the deferred sysmem fb ops, but never
sets FBINFO_VIRTFB. The framebuffer core then assumes the memory is not
in the virtual address space and warns on the first console draw:

  fb0: sys_fillrect: framebuffer is not in virtual address space.

The drm_fbdev_dma, drm_fbdev_shmem and drm_fbdev_ttm helpers all set the
flag for system memory. Do the same here.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/gpu/drm/msm/msm_fbdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index fd19995b12b5..0089301f80f3 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -132,6 +132,7 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	helper->fb = fb;
 
 	fbi->fbops = &msm_fb_ops;
+	fbi->flags |= FBINFO_VIRTFB; /* system memory */
 
 	drm_fb_helper_fill_info(fbi, helper, sizes);
 

---
base-commit: 3652b49adac266a3d27cb41cdfdb7d8790fc3633
change-id: 20260730-drm-msm-fbinfo-virt-969fbb837443

Best regards,
--  
With best wishes
Dmitry


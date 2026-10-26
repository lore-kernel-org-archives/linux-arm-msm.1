Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995937;
	b=EHoHnhMEE8krjET5p03b1Pzcz/PmOqRmQrpDxw1CO6TYvGRu0zRQ45B4ZkZCBIalMpCM
	 55NagLtyfkY7cN1JZ9x3J0lkkvwsptGdSsuSdaUamEm1gZCr2SPatG3u5Z20dXJUM/mwD
	 Ynlj9FEqnCIFGMcsl+NEI+oPFz7NsvjJ3nZ6w5RdbMo4a0fOWmqNHJbDUiHh1+egwD6TN
	 5SDYR+NeBYSQlJxqdb2HzCznt2AW+CaTCrfuX+hPTGaiO3SbWJvGNMQ+CJoCslbRh1KQ9
	 +2aBSoVBZZe6WgLCHEf1TEtZEkI11AhUQimBlVF9fS4B6gsD946v5vzIX7GiBWM+ofg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995937;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X+yqLfO39gj/H74c+0JuxaYjS95aZYaE8hMGc6dAOLI=;
	b=cmc9ba/jCgTB1m+Zc1xq8ZSJKCWq7Gd27w4RGHCXsgYpRTNbPdq9ulWsVPrZ43wYJwwK
	 eyf0tYW9RPaKeqKYYq4rKGei9Li3rf6SAReFQGf+XKnSgm1qZdrV0GgsA0C+1Lc2gYDyQ
	 K0FBL2qKO3m5S1NakfOubZAh1K+pDfYdrroEB6PZyfKdaOr1OoByMgt+HINuV09Hi0/0u
	 clh2NUxDzlH5H97Ymel/UrcKS+jPBkKmr2czcb56/HZdxZ/orRxDqHWnhPd6icA7+Mr09
	 ReeKz4tQWzpPG9cGeM8VrjKIgWVSgRq7zy/MuVwULOp+8hyE+T/K7bhW+HTm60yd2CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d6jUNACE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bUiUGdPe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A02606A32D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37A02606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d6jUNACE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bUiUGdPe
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4avj12727103
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+yqLfO39gj/H74c+0JuxaYjS95aZYaE8hMGc6dAOLI=; b=d6jUNACEdMZOAneb
	efc/lmRa0ouqmtZPn6+Lmoacckw5QKLPorWHW4OB6TWz/6dvAfcL4m1WDtfznd0/
	ICcLtZNS6b6JuiLKehMPapqK0XJsrbbmgRHvTAIwtvwZtP2wE1s4xTZ9ajwUCjkN
	YFWqESrQ7CIZ3WoQURT/1XMXMTOx8cm2OdPGdBFYnrROzceKLxgy4PjYxvaR+PAq
	ap0JCgeSelkq9r9Kx/mX8M1U4XV0z8HOiA0SSt+mnjbiexaAT0DpabYJ+4KEPVda
	cBrcqlp4m1v3mtoL7YbfppntANJNpzQFWBN4xBUjoIJslJriDxA+zLbfod2FcQZ2
	gBpCBA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6n6bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:25:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e832c03576so52525375ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 23:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995935; x=1793600735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+yqLfO39gj/H74c+0JuxaYjS95aZYaE8hMGc6dAOLI=;
        b=bUiUGdPeNhK09b3IxUS25Ls1bP6Nmz9uWUicaBtrlIIOHHO+KiMOxh8XK4LLbYkXmg
         qBimgTn5Y0KTyb5d3tL0/VZVWwkpjKh5nfq54GELf2QvTfZaoJMd3bEhCeEb7AF2NPcW
         6Hy6VXCZPBovTtNKTV8HK/OxuhVD+1AGwtrfTW9Qjrk2gw4t09lU2VIG7vSSPmzzDT61
         BqN9NU25q2R9RsIbuh/8//CYU+3RQahJ3HOrklzXzC78UBnG8SSkwKjJ1BU8BMvS6c4D
         6MvxoT+2f9sOFmUoFXmX4Ba5QWXif6O/QTe89daWhU6NPdxqtZLLjueUacYLX3JDGsNT
         4sDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995935; x=1793600735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+yqLfO39gj/H74c+0JuxaYjS95aZYaE8hMGc6dAOLI=;
        b=VKdl4Vgzx8SSDxfLeXxJNy6C8CMVN/JvtZ+HNzhMQaeHpuB4Cw0OMdI4EL7fSer1rZ
         a8h8BxmLWi/OLvEg8rS2kQtoqjHXbZ1ars9qOmB+EU3qlm8zEHG/s1qyN6sCVoUr32MF
         awv33l1tlvDRCbDgmTCCXdd51UuY/aIfDiDIOu5+rSM5XsMo0cPfPc71UzHz24jlEb/B
         ny7ljCs1aqRKxyUJnpbrBiGHa6jhWofSa976Obben6hVno4ZB5M3IFBVU7VS9k8d/3bk
         zMpfBcj6W+/BiKWhwHz4BwJjeLjyU11kLG3mqFlbvaSFiyWUB9Y6nT1f1mX6VHmBLB88
         HUTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUDOyDKUAlIUwIKslKmUK6eZ//mXfgImJj3Li43Y2hRMiwAU6mDiLvyB3Le8+8xkAy34VfFxg59LmD0ot0@vger.kernel.org
X-Gm-Message-State: AFq9FYLauSaNyCRbXahRP7mmMonG9zfbdJ4l9LuIf+iUFSTjKjipzyrR
	s0cTDNhB8ONFCZWFUOmL5JP/2X/mKv9xCJfKE9kTedhxIK38yMClk4A4tTzJ8LzYc1RJZbAYVka
	7i/YZIwdV6mhOLKXhvqa8dVncUPcaygR40arwEsrYRZyXTUc+XLRc0sAX4gzqHWNKtQH2
X-Gm-Gg: AYBFou0J82Ko5Eq/Y/IWc44k3jzvterclqT/WYRJgjZs9zhLwsDFZ0ADU7QvazDeLk+
	NKYyTg/14WQni0bEHGtRif2SH61U8pttfPD74nqdLh4GHC3NEyOC7kqv0Yn+S3VpCuWJOjoSm8X
	Kc1HryBtZo4hJALZQ8Bd4RkCPni3wdPCF4qGvk5Be2TV/kfopwmH30g9RbiKetRHP+epTo853Aq
	ME63m/oyEmavDq/wBzcn1uG84bEHbA8Po7VXn3/ZKc2Cqchi5szmspvy2JHvAftQTGqoClVAVkv
	mLaTDKG0jj/6F7/olKcMi/xaRRa6CXfFPZ2Ii9AeMFTpHlWe3Ejn6b5g77rJpd6NKjahSLIfAYH
	drXLzxpztc3XR9KGGqtAAWoWiRN0TQGWVWg==
X-Received: by 2002:a17:903:1246:b0:2dd:9b53:f9ba with SMTP id d9443c01a7336-2ea9c03e626mr53707745ad.1.1792995935079;
        Sun, 25 Oct 2026 23:25:35 -0700 (PDT)
X-Received: by 2002:a17:903:1246:b0:2dd:9b53:f9ba with SMTP id d9443c01a7336-2ea9c03e626mr53707485ad.1.1792995934668;
        Sun, 25 Oct 2026 23:25:34 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:25:34 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:32 +0530
Subject: [PATCH v2 22/23] drm/msm: Register the DCP backend
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-22-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=1867;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=DnOVMMMul1WJd1CWK5XVZuD8++FkNWwJHoR8dINot9c=;
 b=QG83X9aBE4jBa1DAS4wPcmTipRI+XMBqCLy0NmwgeS2ERiIBadYlckpX6pOlVddmoKAl5KzcE
 g7G+3CHykn2CWWGLoyNuBrJN0+MFb1zULSaZ+b7RPKVSseb+q1g9A9G
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: qePSR_uG_VCfzeqsVeLq_8rEHFQsouBy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX1yZZBofRn8Bl
 5gqnJj8FBFIY0CoKZ1jkAFlkHHe7NHOFN+pDf9caOTv22oLYlV4rFT79yICj8kFRQr/ATVIjBxc
 DNBxNZLe/r319abSoonJmTKsWqjQoO0=
X-Proofpoint-GUID: qePSR_uG_VCfzeqsVeLq_8rEHFQsouBy
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adef260 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lVH-uUz8Z5eEn0x1YxIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX15VKFTz4AgBZ
 Qw1elB1x2Z2KiVqYPrj3PDOcVhlygBf4mE/qhckZ/5SkDWa8eSN1Ut9nmxoQF/0Tk0153Smfjus
 kLPceMj2vWs82ihTu9YaMyIvI3mdiflgqYtRm0AN4qqBDBJMpk3YMehCS4pq1B8IjpH0mQ67mVZ
 4LVH3JfdoteePG7ekhNBdUNFueUFrqHLpUe0k7yc0GqsTGHJCn0QlE6tOh5YLOY4+3Ub9VLBItL
 yIqJmEtFI8AWwc6z+gCnxxd2UODf7yvYdNSyRBykBG+bdBD8Ah+1caMVkaZwOxwjDhGZ3+LQj+e
 Cwo0q6/V+Qwwge1DX0wppWraprJ5bdPt4kTKL+nFkyNKsBxbK00ymcBzV8odfzlmg6EHpGRy6qC
 pH6AJ6Ra9pwT9C1JncGFzG0E4ybcMj6ZV0Hf8xcPQZr4B5peN8mm1gbuyRif/bSGapOVmufS/wS
 HwFE2NBvfK55UHr0HaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260025

The DCP platform driver provides an MSM KMS backend. Register it from the
MSM DRM driver init and exit paths so the VirtIO driver can use the backend
when the DCP function is discovered.

Add DCP registration hooks with no-op stubs when CONFIG_DRM_MSM_DCP is
disabled. This keeps backend registration consistent with the other MSM
display backends while allowing DCP support to remain optional.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 ++
 drivers/gpu/drm/msm/msm_drv.h | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5816c64d7ce7..d413c361c442 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1208,6 +1208,7 @@ static int __init msm_drm_register(void)
 	DBG("init");
 	msm_mdp_register();
 	msm_dpu_register();
+	msm_dcp_register();
 	msm_dsi_register();
 	msm_hdmi_register();
 	msm_dp_register();
@@ -1229,6 +1230,7 @@ static void __exit msm_drm_unregister(void)
 	msm_dsi_unregister();
 	msm_mdp_unregister();
 	msm_dpu_unregister();
+	msm_dcp_unregister();
 }
 
 module_init(msm_drm_register);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index aa5dfd82ac6f..befaa9f2cb5c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -417,6 +417,14 @@ static inline void msm_dpu_register(void) {}
 static inline void msm_dpu_unregister(void) {}
 #endif
 
+#ifdef CONFIG_DRM_MSM_DCP
+void msm_dcp_register(void);
+void msm_dcp_unregister(void);
+#else
+static inline void msm_dcp_register(void) {}
+static inline void msm_dcp_unregister(void) {}
+#endif
+
 #ifdef CONFIG_DRM_MSM_MDSS
 void msm_mdss_register(void);
 void msm_mdss_unregister(void);

-- 
2.43.0


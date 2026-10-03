Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D83A2DB78B
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987456; cv=none; b=X+OZo6veNgUwThb1DJRtAn9r/50iYTxEtIiIRQS9zp9zKJB9NvIvR1anZ9hx75hCsqIqFYuvwZ3CDAiaKL3nWWwS+cQK+ooCAKwG3xkI2cmkdvclgyU+MGxyHzJjIL1JHFjk/CoJ5wbNZiP4pSnQMHkRbNEaKfyCepf0c+ViIuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987456; c=relaxed/simple;
	bh=T4qe/ky6P713qCmilfQ+5NwYZw9WXGDP/jjKvtHyyOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mw2CngFHhVrbn3lC7LFIIeRk6xPccAdIuhN4I6+EzeJnBc7/7B3v4foHdBC32NOtjwc5nnGG1sej2HqfaYaz2E1Oo7zRU5vT49xT1oIH/Zz/yU0HDdQBWWS79S03IwraBkxq6PHXpPiQnHMd+ZEdxk16aX+DHUi4hq+4Ml/AcSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsUC4jJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7c1XNFt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IsUC4jJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7c1XNFt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ne2B31503824
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWz46xkNVBGoy4QZA/vjGyipwc++3rwNTm8zVWDVKio=; b=IsUC4jJ8h66qijVn
	UkchFA/dkBEwvanCbOlxO3nbTVVk5KjvbMq75+Xi6F6XyzEjTy3EHJLZJFBEAsQF
	und9ip5Nb170/D1UWBc8r5zN5A+Y7ZWz6/Qbkr/7VKNhMe/0S9HdV0tX33LTNVye
	8lzQghQaI9Je6ieUTCVvhKNtbxAF29QHiH+i5kQJsXodTq71fEf831YqWMl3CDlc
	vEeDjHcYYsJk0T6k7rQIgwEMD1w3soL2ciobO7kF1zMH53ir82Taf6cZxqnwoN3D
	ZuL67ZuH8B1AHqGjjLU24lVqJX+S+Ld/zgbPGTY4Smuog/lqNbcqIqFAGkfx9mQh
	ViQKZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2n2rrd3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:30:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c58ee2116so25395985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987448; x=1791592248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWz46xkNVBGoy4QZA/vjGyipwc++3rwNTm8zVWDVKio=;
        b=g7c1XNFtRFxwhez071ohMEhICBVOU0JG1MXD3602jB7i9gKJOfKmdqrgEXn+9LeiIW
         HpG/7FtdbiDp0uChbfdCEELNAlJ3V84/JA91L3gf6EAzoWqDa0ubY6OKHmfdIv4FKRDD
         WBg5JyITW+F15iCkkIHiJXK8iPjsVs/VNx3w0lw44gS9nhafwGTlLvLsElkyno4p/R8k
         80XrHVomTAB4kvbw0zV+BhlqBXChg9CZkvGe31apW4CA6HeQemaMKeeNMqUBx/XWW6YK
         sg+dMXIQWnv51ufd2UjEs9qnzVH+DTzPrFQKtf/tfoHRTUEljwgzyg5q0/FdNVqCYFxK
         qyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987448; x=1791592248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWz46xkNVBGoy4QZA/vjGyipwc++3rwNTm8zVWDVKio=;
        b=TT/xjeHzMROEuUwstsILJ39GqGTl/ykzNTeXPwLbA0aEUuclIV9MO7XQ1RhSqWBJ6+
         1ch+yXqUGeyOxf1X1qoyVjuDRaHObWw4/9D9dGl+R9jjqEBWobeOCJEAwfgUFsZxYSsb
         nrf1ePEv424OgE+ND/wZRkFeIPPZBM0aY2A2Esljir5tDKKWvaypVnHQThCJ10F6OV4i
         TGTfKsdGtdcmQiCaJEwYk8SIEUA1rGhgya3r3Lc66DhnXxTlJ84GqkkJG4S9XrDpT/Lk
         07m9zvv/cSIUOvDqtRIz1fbdLNde6l8o3Otn+n7ua7Up8dqu9OD2/oQeyaHIIbXT0gsB
         mY6Q==
X-Gm-Message-State: AFuF++mbhAzHBjun1xK3SF8b3KjoV5sDpn04ubc9W67PQtxdF1Qr5ALV
	7bD/9pXv9TcEgrpOOx7B20qj7niZ3NXa7XN3in+Kw3xA1BChEU88CTUeEm3vfkyQ7Qw2OrjXz9g
	iF9fQwB4Jvt58Dz4uNAL7jlTuLt7jXuMTFGYiRyCukOJdaeCA5lt9QyUwIgQNYyXlTPgU
X-Gm-Gg: AYBFou0KFLAYQdrF3hwAt7pMOn3Dk7qkz3whsSD1QVi07aozF7BOn2oh1VskhHleX+o
	sCYmiECdND9gkCY6mQqgdh8sxWEwzAFsQ4OxaP3muJblmiYyu1iMw3qlujRvqexhf/MhEqzWfpX
	7JaZ0H3iU74dPovroZM9JFeZk68/YldOTO4lzHvR8jhcgZJ1TqB7U3cW2XqCQb1VY5I2uzMiHNJ
	cqsAIme3S4dgOL5RWXJaL1K+ROuppd65WV9zI5Zz7YTwsFURFJmDdL5Tf2R0zTJ6aFZTUf65zXp
	5eW9GcNIOpDvpdt1+sU/wIaXiXhB2Y+wRyqzb+Ny8gXGAOjMamxt7Iv7VfkCikb1B0Ja3JbBDsU
	2XhBESbkz0lmgepM+XhFJsrBWGeLKVwf1S58HPlsDcYhQsQn0B5KjCSamxe6UxaQ9VKxH+S5IYE
	ufIAd+Yji7Rkf2
X-Received: by 2002:a05:620a:1a20:b0:939:f89:3688 with SMTP id af79cd13be357-93cf1751b05mr840052385a.42.1790987447721;
        Fri, 02 Oct 2026 17:30:47 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:939:f89:3688 with SMTP id af79cd13be357-93cf1751b05mr840047585a.42.1790987447198;
        Fri, 02 Oct 2026 17:30:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7957d0sm1133979e87.31.2026.10.02.17.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:30:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:30:22 +0300
Subject: [PATCH v4 07/10] drm/msm/dpu: clear the DSPP pointer when no DSPP
 is assigned
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-fd-kms-fix-smmu-v4-7-2a44d4d8ac77@oss.qualcomm.com>
References: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
In-Reply-To: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T4qe/ky6P713qCmilfQ+5NwYZw9WXGDP/jjKvtHyyOo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEye7h6PI3d1u3vhX5DTJ/vYsFb3Rk56RGQKF
 l0e27V5m8uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBMngAKCRCLPIo+Aiko
 1TLbB/oDFXqDK7I3TzcVpkY8ny3IntudCZOJfJvFl2nGnOvsIDftB1iDwVluubR0odIwh/veNro
 Lw2AFIl6tPybNje67aPMwssRrSCiEPCFtRLV1mjfLYquWiuHkw7oJQvysmCYPRFfrNT6skcrUIn
 LJVZZfCVRf5O2/nuZzQnjw+s29xoqw9hp5R6W65UZb2snMTW82odzR80huairosXfECJd5HwOw8
 MbpklDSLPu+I8DXXcOui2ivfKG/vayvlMl7MeMFaWcoW3MbJY9XgVufKAIPJO9tlaqE8cCrU8he
 Fk08QDzCf0IM1zkFGlo0h/PLBUb6MsIzRivKpI4YXNiYe1ej
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=d/VgWhjE c=1 sm=1 tr=0 ts=6ac04cb8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=jpbDcG_WXHA3xrgMYRUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: fHl2emBMHxC_45zD7oqOTedIGvYK0en9
X-Proofpoint-GUID: fHl2emBMHxC_45zD7oqOTedIGvYK0en9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXz/si/eVVwiyW
 o0SZ2+QSBItEfHOwnEZmJQCCAT0b/oiuVD5ST3QWUpfix3LLpgMULzQKRG2E8kfegON3/uLY8t2
 5lvD1gAI7IxewDSmTTzRzvXaQ83hCsk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXzLYU11IjxCZA
 nrtV9zWy57MESy6OJCw9NSzEUvM3JYaC+E73lu94L51GzgHTt5lsHTXKZw5hf8JCt0iH7M8RQsc
 FmLGJuHuPO71RMb6OcXRT/nAoXzEjQve3FT7PMWHZHaC+33WkRnlDS5Ht/xBxjc5085F2qoxOXE
 3l+FF7ahe9lwrPwBCfZ+MxPDZ9RclPy7YhiMVrx1e/P2vk7rMrofaPjtqdXu0MgWuJEIMDXMzj+
 7LWaNVF/OFkWAt5yTDc6fWI4NsY/T+sFLSJvl/QkGkXFrQlDe8u+QLOn9I88xVu7giq8CHFzhkq
 FjI4nMxALlKGyiVg11DxEBO0PhMCUr540kxULXpYvyVQgBMlngTZySu9/C5RtuElSiOBzKWoIze
 YACR7fF7pXhyyZiOhROyEK+kK74Y1rIjgEWv4R0YRnhhK546aGFAPyvIhih5gTjULV0wBI3MWNy
 G9PPBuKUGJQKk5yiGvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030001

dpu_crtc_assign_resources() only stores mixers[i].hw_dspp when the new
topology has a DSPP for that mixer, and dpu_crtc_duplicate_state() copies
the state with kmemdup(), so a crtc which once used a DSPP keeps a pointer
to it for the rest of its life -- across reservations which no longer own
that block.

Assign NULL when there is no DSPP for the mixer.

Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 1f8fce366a1d..2ff0dab33710 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1480,8 +1480,8 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
 
 		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
 		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
-		if (i < num_dspp)
-			cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
+		cstate->mixers[i].hw_dspp = i < num_dspp ?
+			to_dpu_hw_dspp(hw_dspp[i]) : NULL;
 	}
 
 	cstate->num_mixers = num_lm;

-- 
2.47.3


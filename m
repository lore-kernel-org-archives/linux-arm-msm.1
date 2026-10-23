Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797958;
	b=IjXZmY3Gnob6CUe9sr/SNOm0IGyRz4b5OmjUaHmDEf/rKEjAddJypBF9Fn89cX7OAEkd
	 p3Fw1CPevysrgpxhO2nDX4kptUauh16NYaA3gKE923+Dij3MmXHUIpsYjWUTznxaUB0zW
	 OoadLFrGwpn9AgKmlr6PYg7CNzuX026XO7HfGjSyI2LTrRty1fHbu7Ld0A6N4UTMO6gyr
	 a9174nDHmmFlojizDv75bzEBf9J//r89HFAB+kiCJOG66UsVkimTxadW5XWflirNHhKTI
	 8FBuTdvGNultTrcQhgNqGHs3Q+4/7mO/9NTrscwLkNCa24M5kvVdN8bsWaZk0O1U2sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797958;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yWz46xkNVBGoy4QZA/vjGyipwc++3rwNTm8zVWDVKio=;
	b=5bY2FFE6S+Ovt9s1bzD9MkSIWjT3Xdb55Z8yUOZosHxqP98imw3aJGuhG1p/CrGXsTux
	 w6ZvEHbhEX0xy7XicXMdh0hIKAj4TSvqL6MDThZ2lDQ9dYGeo/saGYPgofHytw+65L6i0
	 AhcObZmEZqamJS3jYK5oOL+cYLtvNconB2dcDC8ssQLYhcIEa/wrF6DGpFXgrJe/2Y41e
	 j/fFpprMXvZ2Bd6p1TOqM92fuL64DegwSfqaSfyl2FCMe1A386Wz3/7E/MdFQ42XtWeRM
	 7E1zZ8OxOFpqzfSn+yd5WGlE0WOLbLrnEtdg6dTE8f4playRtZSPFpowtES5keEUgRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LnS80R2n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EEkb9jmm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B5C606A328
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B5C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LnS80R2n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EEkb9jmm
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvd4W297688
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWz46xkNVBGoy4QZA/vjGyipwc++3rwNTm8zVWDVKio=; b=LnS80R2nHDWpSUJD
	EEYQn6h//V+BzSs9AmGR7RnIeRomeP0/SND86emVI9y3oXMHIsXsmRYnwFx4bfer
	IZoo13T9fc7y5j/WWZhD4DDfSJhVlPjM4SPaVo8+gTIBFovdqd2iHJ1pFQF7w3e8
	TWwVdNl6w1yoS4/412vZ1HzVZFVONMmJZndDBhg8YBcsaljn8ssZNGPyjt+BkEd1
	rfxB1Ih2qb3ERlQ+q04rXQnQrCwve4T1hpqyp0dL44D1jfPy+7x0OjJ9rCeh9sAg
	asx9tlAWfOp19LV+4+2BwqafQgHsQilPmhWKQZMRyfsqXIuP0i0Fe7MvGgjbrsiv
	GkzzQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgaruhcje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so257437385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797956; x=1793402756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWz46xkNVBGoy4QZA/vjGyipwc++3rwNTm8zVWDVKio=;
        b=EEkb9jmmmIIY9i30w3O+njN0fvdCir8/1QRy7TikZZ94ERMWFwi6n8I7EYAoRpMrm+
         +ucXXmnOR97wbjZBzW+YRqN5yeIP/5RZd40KQExCWflij38SxGxjr/358byGKT8XK3AI
         /qECBKSkwQHBNmbfA8n1xRAHt3AW2XlkGGnxmrz4iKW5KAJZrVkJpYfwdUzExaw6PVDK
         niEcZCLQaLNrfXmQ56WDidWpo5RXcufBciJrNOWAz6884PQvLLhnxbBYweRu7IFpXjur
         Oxzegjfz/d/DfoIRfxMRgq7Ju66TDOS69MWh1QvZ+ulH6iGZPf8nNiYtlwRom4ASFb0j
         KvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797956; x=1793402756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWz46xkNVBGoy4QZA/vjGyipwc++3rwNTm8zVWDVKio=;
        b=vUh+ohxrhScoG+mrHTXa1AHs7H162O5+ptFaMPoFmdRbjf9m+4hqm0whmRoZWysPMx
         H0Ct35Ys/ckGCDyn5Tmf6NImQVwbKmhz5NSelmYzxu55Nym1Jwgl+qlEr5g+P4hPk/V9
         beknOStpVKRdoEKS1JVMsJDzgu4OB77KcPV9QhRGYaxHQ3+7AKwIwwj+cZuXXRWAm2f8
         MIqmZrvvgv3C5RpbgT+IpCuqkZqlufxe0bq+JuU247yENTySLOVc4MCf4vG0ITmDL+gr
         ZDix/z0LCi3bTc9mVHImtnK6RuwXffOIMmgGNkjecwC+kL2XAPxV086OvAF1CDSzndxw
         vXcQ==
X-Gm-Message-State: AFq9FYJVZprFmPMn7+xaCctRk8Rvbrd7m4pX0un1cSe8ib31dtvGvX2i
	q8+ny9UsdcbrDB0HSypPJoDKIHwh2t3wQD3NPfC717X5AdKFKd3z5gMyI8oeLlVpJm2mIG+Rvmb
	sXqkQ/LkmG6MrHclH5XrdMbzEkB0rJ6Ihw5gMKvcJjpOir8NzvTpOT3EIlc+GyUj6Ngtp
X-Gm-Gg: AYBFou1vvqCmRDuN8GGtjOu0+k0QcnFideKPG0tgyAkf+tfJGfMAxaN2oi8ifiWDcV5
	9ZSvQ+tJZQ+Y2UUvzoGN7aFnfFmKF3egVfX/GKrFE9WHRCkeZMtCWvZQIvFE7D73yn8tpGZ0qgq
	pR0YFUGrE+OA8qPtBzMhMhjIyeUnyG17w9NYOEdIZQ/+xj6ZL4pAz4A3EZdKM316UPU9HMvOOIU
	4ZVrSVCLKlu7MX5A6nejdY7KWNXu+6GMh3jQQG+LQlzMNio9jn0ayBiHIagt4ULWb7Kj+L+/iyF
	04xhCmJEq40Rv1RYZM5Y5h68PzY7d91JOeD0+FhVfapLTcY/Jm1gZ7QtiSW4V05/TGaX2CHYRki
	4n+Iwxf6pGSfwRjRb7CPllhcDlo84u3oWa26s1m3rQMXzNZv+F/qYcJSHVL53rdy1QWkjwi9qmH
	htzHaq07pmwJxf
X-Received: by 2002:a05:620a:4002:b0:93e:66e6:fa4 with SMTP id af79cd13be357-940ef8ad076mr91125085a.16.1792797956237;
        Fri, 23 Oct 2026 16:25:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:93e:66e6:fa4 with SMTP id af79cd13be357-940ef8ad076mr91120785a.16.1792797955717;
        Fri, 23 Oct 2026 16:25:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:28 +0300
Subject: [PATCH v5 07/10] drm/msm/dpu: clear the DSPP pointer when no DSPP
 is assigned
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
Message-Id: <20261024-fd-kms-fix-smmu-v5-7-a5b0b284aead@oss.qualcomm.com>
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T4qe/ky6P713qCmilfQ+5NwYZw9WXGDP/jjKvtHyyOo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+zqQkfwczTu9DR5C8IzZO7jqCBsr7m+Zvz5f
 nie5Z4ZopyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs6gAKCRCLPIo+Aiko
 1TvHCACz57GHDO9exaxWFrq3FpilvizySn9GffjbNQwdodh0uir/gw4cy7Mhj+wWzLUMfkOxw4L
 mXRQqzoHYfWjboiEotZo+L+ER1pfvA+9oaXAmnqIEvbpbn24e7qCPp/wbeSuYPRfYtD+yylCxAH
 Fgi90OnK3QPOWJg2UwQP+k3L8YsMvmWosOMfQ96HD4et5X+uSKuVQIVnT0gKF9+8pb7Zr7nlOmH
 Ihj5ZmirSmVhfdK7n3tVaevyrukZ12kYAXCtVMPHSmGJ0we50TljrNsCR0JwjaEvb5RTkb/gpL/
 dHM7+kbpZqwYHnbW4m8TYJ73FTXkJSdDp0GETCE3RdVNGugg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX/xnENkFAl66B
 rbG9ExQxerBq17VyLxhVs5tDclz5+H53vl8DIP+BU3Pmz1wYiBRF+AiKxK0Syq/5i6x0CiBkB3R
 ez+m24tAYKgFbI6MdsOMfWOJxPvT8LM=
X-Proofpoint-GUID: dmm-jc3yGh4oLKruE0FIdOtrBNoladc9
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adbed04 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=jpbDcG_WXHA3xrgMYRUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: dmm-jc3yGh4oLKruE0FIdOtrBNoladc9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX1YbrYoJ1risz
 NninjoLR2q/cpv/8S1mO5ogygtGUIFcFMQ0ShIlh/IPSA14Wr9lUzl32Xnxzq7GbPkSXKsucGsb
 oDG9q+sVGbr9QQALpok159c4X+aHhsWXwS6fBw2nfUNk59B9iHHJcRBfXZ9Cq/HAWeMTiJ12hMh
 /Kgvm/bcdTrxHNlx/hSy+mSGVcwOzDbufLe9EuRgVx3QYPTDSImeK1WIKwLggYYbrDba14J2shB
 xZoPesgQoXbIUkUVd2b/yMk1uClynUTajNF7k7X04WFRbjJ86Wo1QmSHAkP/bYAhkvreRzaq51i
 77yPtuXSTH3nZjxi6icqSUML1aG8dozTa76PYYIYDZ+lHkbpZO6mJmbsvtmIb9yor6Q770M+eW4
 0vYzzqYJHGPAFL01u4g6iHdz1Xt2/w0PjWD9hXWQhljJthkZlABsJNfjlNZbC5wZX2WYkPy21qR
 gBu/8Sr8Qy+bkUe72Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

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


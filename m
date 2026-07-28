Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EE842A15B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234161; cv=none; b=K6NwpVkTwxb1ftF3GfTEKaZ6AHauCeCu0avazqWNXxMAC9Q9c69Qg4qnS9UKsGIM1dBHEVVnDK6EdBq/hT5bZtLrPWxdwTE28DXrIQHT5h0NYhAFbuqk5mwTsVtZYlgaDL60TihEysZRduyLHyNTl+xCNpRpwwat0QkKWNviOjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234161; c=relaxed/simple;
	bh=VWmAnmxPocxp/N21y6Mm1MO+341LxYxr0pAEH0t9M6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ahjkd85u4KF7Jb4VnhMcqdik2LB5Ml4i1mGmVyvHTLntEAgW+RirVYrG0WrbzgAsSmNgbg4s5yS43Ss1o2owQbs+q9gsNkn6HN+tRtL36vtsLiCl+U7pFIaTm1YC7853zjFS/gPLYC/HhGLUK3jYh3+yTMTyKzRoQcK617EWIOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YL4rRL56; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aNjnhPlF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YL4rRL56";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aNjnhPlF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82DUh2480120
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1K5NJ0UDJpMZcPK82qcAqYj66j6ZAI3MdGiW6v3Syac=; b=YL4rRL56JFJp0LnZ
	i+PftxX/FH7TxWvbC2uo6VXm5barGQXL9deN2M9em7CQqhTbuiOSmdDxrUUU5w9+
	3mEczzwtgbdYi/8uYg364Ndwpw/41E6uY/ljYKCOnO7HiMUAmCaaDnjvlmS1C0gF
	1MB/c7fIX89ulwYqn2ICmT2fbDQv7v4ZJrTXFUlGw2XT1CIYeaoX3t7ZJq37nM4v
	ZE50qd8eTVBulsoLpZhxQg95AGj5BsxgkFdFDdsy1sMo1sJVefqb5qNrMx0o6HMn
	eBxx2B/mF6gdSlBDBNfhxB4AXdvBp4lO5JcPPnCVwWxpN2cZzwf5KE32Gi3FMmOJ
	lk2lrg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy11f87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a97644aso46269921cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234158; x=1785838958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1K5NJ0UDJpMZcPK82qcAqYj66j6ZAI3MdGiW6v3Syac=;
        b=aNjnhPlFFDuurd/TAopnIFyvM6oKZk+WCpG/K8uGQrvXuP+5CyY6RhLgsdBJNpTfDY
         yc5NTga2x7ThRDbHjyBrdyKmQWclib+Ck2eHHmjLg23zVNKKZnu/SEo3piAIY17Wc/N/
         Wo0xXvj5ADYbFk80Kndbdhso4PJ/DueyTTauywGv0aIRXRMuQh7nT0FTQ0c47WO80KiU
         cglH9qwPkMwolMMYi4KYe9UexhTOTu8S9MfQ2fpsf6VrRrERafDUeovpODYU09rzhH30
         tdM21H7I3f+8G7PY2Ny+XB1SYa2hQ6ZXE1DzNN69SrJWWnN6pPQ9H0iDiTYTqOGANF1G
         KzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234158; x=1785838958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1K5NJ0UDJpMZcPK82qcAqYj66j6ZAI3MdGiW6v3Syac=;
        b=j9IZtxbH4v2XYDp18hmijRVT+/jHTl/t5uOoHA1fWasu9AngM40MRYVE5vfdDPR9Yr
         3xdm8QB4Fvj2pho12hLk0nU66pyPVVIGwFW3J6Pj3d8mZTweB3qXKOoO2bt5SdQ0KWHT
         DYEo9CJbJsGmJPau0+/uZNYkntSMWxrsd+M84Xa20ui+IXJVIIKWwJZr5neugR4mw8pB
         I0zc58Ac67Y1PURvEagtaYf+93uuafPLS/s0gNuDUo1EZPoR80DV8br9zpanGyBV2SpO
         yDbmujzbxqHT8v1RloLfpFtO2RHYaItJUB4GjXr6F2ph1veFcKTUtLRgGEFE5hfXHhgs
         B45g==
X-Gm-Message-State: AOJu0Ywbjzn3tIejDmf7T1WbsVNISyGmXl9TNwWCh/Y7LChKakDDFHgn
	eYePUS6JRfLFmxlSRqxhoEilSbI8UGG4pW8IOfsV7N49SFJtOfNqzjhoyWitrwBmPoqGdosN9+x
	mEVjpp7SPtFGAu+NneLsZdIST3GdnjUIQTci/RkIkI+GBoD7MDHzzEGAZ995x/ciHRkd4
X-Gm-Gg: AR+sD10V3afHA+a64KBF0AFKzkxsV0pNWvJ6xciDV/H3ESl0bva7KKuLETZE6pNH6AB
	zon9MsM0NhuGnmV3dKlk/anyb3Aw9Pf/LwEbTmvEZjtobY2wxmqkTryXSCczgOvvxFqnqdCZ43u
	lh4ZbZks3OMrQurESe9GX8N1DPw/0OliGIYrLLo2HCJwb60YSn/pjnpwTT1lVuDkU35SUeTYv44
	uwRUcqGXBbpfKqN3KB0UdS1g6NNaCj88VwI7ALTycwSAlR/ZoYEqH4Dt113nGan3ZT2pBdL2iDY
	bwE/Qvirk/4ybObw35yOIZOaCZK2DXs3PY/oQFHbrvwGLtEHjR2McjEzK2NIaVt77VUALElKQuZ
	u4qhHvPkFDORrGQlWDj887SJvGXQ98cCysvaEBxeYh/Nuq/vBZEIjma6CT/7ckF4=
X-Received: by 2002:a05:622a:251a:b0:51c:25da:903e with SMTP id d75a77b69052e-529d710ca25mr14459131cf.58.1785234158038;
        Tue, 28 Jul 2026 03:22:38 -0700 (PDT)
X-Received: by 2002:a05:622a:251a:b0:51c:25da:903e with SMTP id d75a77b69052e-529d710ca25mr14458901cf.58.1785234157651;
        Tue, 28 Jul 2026 03:22:37 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e869ba73sm84791396d6.25.2026.07.28.03.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:22:37 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:21:41 +0800
Subject: [PATCH v9 12/14] drm/msm/dp: simplify link and clock disable
 sequence
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dp_mstclean-v9-12-f7779fce10f4@oss.qualcomm.com>
References: <20260728-dp_mstclean-v9-0-f7779fce10f4@oss.qualcomm.com>
In-Reply-To: <20260728-dp_mstclean-v9-0-f7779fce10f4@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785234095; l=1745;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=VWmAnmxPocxp/N21y6Mm1MO+341LxYxr0pAEH0t9M6I=;
 b=1z9dnZsJrUDb55gTj4iQ4ujjB4kdeKI/d+c0PVoSe65McIjp3ohSswUNJzTzjLMpOprj8/OB5
 RwqCdM5bST7AH0+f1RT9EcZuI1dCVptYS/iM/A4J4LFAIq0l9j9YAMC
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: XqZrsQgf07ZjjrmMdTMBICsy9t1Okb00
X-Proofpoint-ORIG-GUID: XqZrsQgf07ZjjrmMdTMBICsy9t1Okb00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfXxLx8sLXZxmBX
 K5JOhcdNWqA3duF9qS4Q1a0/zzFKSpgaqu07sZHWLN4/xOqSEdOMPCxd5UqpP66iFOoouQCjwSZ
 VsYp8nB9SCpMAcmsBoH71h76vffs4d35VitU2AkLl0zVliSDZQ3Ws/+HIxWNkQcF8eo2iJvnlpt
 hVOY+akX0v2BBOvbmSo6eKNBMLA9lpaK307lusVwvOKgSi3w47FpVmX9pZ86qo4tb6pUgmYCnQY
 yPJAg/chEZZejSPx+B80+xI+VPT3oWBXxojuUkc2I5p/+zCSa9cgqeNQ3RBqFiB7KJZ1FoDyvOp
 FHJh710HIyzCwIAGmIPy2/nRBmXWokcpAbwkz35hqyx9Enun49BwJHSq6F9gqxGUMPAIszeYO/G
 UmbRyUw8OYRY6tNsWorbalM3mbFVQ54JbBw1UYQJYbZ4RU5wz0jdkfaOO1OWyB77GSedr/HPBL9
 QmpfJuVPC4/jwMXws+Q==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a6882ef cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FrCxesj2aA1etRkkIm0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX3zXjN/6mY0Pu
 x+sj7rLLKXWNRhbKBWNmjurQTjfKBv97r4hhhMrK9h6HKP3k7dfFB8Nq6E9AW/Ld1cICFlbSeis
 ZKdB9+diFZBxLcYDJm1UkC61ej+Xuw0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280091

Move the common disable steps out of the sink_count check to make the
flow easier to follow.

No functional change intended.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6e392a99438f..9b9e96b683c7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -718,27 +718,19 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 	msm_dp_panel_disable_vsc_sdp(dp->panel);
 
-	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0) {
-		/*
-		 * irq_hpd with sink_count = 0
-		 * hdmi unplugged out of dongle
-		 */
+	msm_dp_ctrl_off_pixel_clk(dp->ctrl);
 
-		/* set dongle to D3 (power off) mode */
+	/* dongle is still connected but sinks are disconnected */
+	if (dp->link->sink_count == 0)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
-		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+
+	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+
+	if (dp->link->sink_count == 0)
+		/* re-init the PHY so that we can listen to Dongle disconnect */
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
-	} else {
-		/*
-		 * unplugged interrupt
-		 * dongle unplugged out of DUT
-		 */
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
-		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+	else
 		msm_dp_display_host_phy_exit(dp);
-	}
 
 	msm_dp_display->power_on = false;
 

-- 
2.43.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0E23B2FCC
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702236; cv=none; b=HyQkdBZYVwpyMhjIG/njYxKYPWTnpQ9ocam9VaWQYZpK3TQX8bbIS4bFh4FUl+7L52Tws+r5tFaFum9YeQ/nSqLWuQYNAOw50caY5OmDKHyuLTrXmrmW7LS/0m5sDTgAj+mTMFRup/Y/bcbh7l4i7WrG94jQQb7RfgaETlf4tBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702236; c=relaxed/simple;
	bh=p0Rd9oPmiONIcDwy0yPI6eTa7uZg5IuJSk3yNdX0Wak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rDbthLCHBypGJhbdC8H+ShN9TcB/zLrmu7KnjGG6DyJAq532M7ZSrAe2Y3Izw/9hiJGdeJD3iSH8T14PQZsH8Bvy9GaDzpo7m8pA3aXp8BXUB/Et91NN4NrJbHFLcH/WZ8Vauan14Z6oTZNl4ePAYfQ93+T3v+XaKusxVy8Juic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bYz0/G7/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZa8S0/V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bYz0/G7/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZa8S0/V"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53fgQ4027262
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ts/aaAIVOgMyHZh7xcpfl75wOlTuht4I4M1cpLCbVwE=; b=bYz0/G7/w56STUJO
	C5Ky2xIZQWeU82AwCeSAlquc8GJzLZiKOELUc1He3QVtaFQxSkjpDxAPToKbrw13
	h5jeraXiuP5M52MeOddO0WVpOqsSFV4ctx0v1XIj5RbAZ5YJNdQYS5u3GIivJwyb
	2eGEVQPEgqVD3Pz02Y6WN3xhN1px+QarVBBHEM89k+c/rojDe81EVqDrvxPv7nb/
	vCg1CBEGQ4GpMv4Pp4dmkQQixrwVo9rQzUx8vQxcH1H2pjlaYeOJscZbNgLUVL+m
	Oc284ExT3xd2phfkkEeIHMMKIuMdENTH0hBQoTm8jIQSNeLa4EDYQfcVu8carV2c
	uZIX/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bsbvm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1b4d961dso102805941cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702234; x=1785307034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ts/aaAIVOgMyHZh7xcpfl75wOlTuht4I4M1cpLCbVwE=;
        b=YZa8S0/Vf2yLwB0oKmkzJkukDKrXbQlDqLiXhvWdzyvjT7FdlOUtwAg/gV2RZlEg3A
         f+yqaR8PZU+lhCDCvNT/BWhQswZvawl5UKuchY+vpKwe3ilJ8OuJ7f1llgPgfePSvBwL
         +Pl/N7I6S7dlhWl+8FCs0qSrB3xVnDzA/HA6ERzRLiNCo7Lq/RRaWx10LmEibvwBYIaw
         VoIFnf+zDC6Wv+ThL06+Rdy4ugGZ665HY4IHmz3c/fOYAE2YH3SNVFTZexEa+cYMmhVz
         to2zVHLGlNOOKIcGog2lzhJYeIOpTSlcGCXyuJDQiimxrN3hDsijlESofbn1M8DgF59e
         jxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702234; x=1785307034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ts/aaAIVOgMyHZh7xcpfl75wOlTuht4I4M1cpLCbVwE=;
        b=gA74GmlOMmrvcrHrxln9m9NRAxqFCgIbSiJyhLO0aUkKOEFUfFjrSuL22N++5WyjBV
         m2PDs679FiFHIHwxwsVFzFL7L7UcAn8CT339oOhwWh5XVaW856CGsuOYNSS9YfTR0T0s
         bSMzfzruDrICdWgRjPK5NomuG/RnkmyOh/u+D5H9oUCw9mzH7/2QnxAIHLO6anMh+/Zc
         IZWx2EM6L4FPB/do/crbGcB8GnQCYHV+OK+qvJ+XBiohsMVUAeGwAdzdUt+rNdubZ4r/
         Cs5Zq7+qx0qp5XWT6glhiI6YjuyoErIiqz9rHTNd+YvcZfmEmuQ6WR7qAeJgwKNCt2Qi
         EdOg==
X-Gm-Message-State: AOJu0YzwD3xbMbZOTK3aUw4jZ20i8x3xO77G+Wc048f7y3CcqdpOwqOn
	UV9x1QoyW8NEEbL3uQzoiruNf97WpDcfyULBGLnSfAjJf34M1GoUGbe4NlKQEMp0svFthvSziYQ
	QpD1wjSOtN9pn5QlA2ktl61rEkax8bKEervxkKpnVZXTmdnkNshUxJLDzuItzRxdXYlq7g0m0x4
	8s
X-Gm-Gg: AR+sD12gJxEh9HcSodoEWi0i7/s+ZNiXHuify4SVzrZUXXGOU09CtwinHNLjguY21wa
	Cw81TP8Hv9OToFh0a9YmwmXKJ7qySPl0GLNX7ibpEjjSU98qY5KPRrRcyNr/3nfrRkBaovhLbt/
	ZgwzP8PWIOqA8xqOZQKJeFasVnmjVC32jSJpLR+KCfwIdaNHSvAi2HdujTyQ0fc5lLOvlNQZJV9
	5lxkyV5GYJ9/tbFEZeNS3hhJo1rxforBNLnWlWeiUPN3t/aT4aqmUIj5vZB3KujqpozEN47axyb
	dOMO7LF+IWHGZ/yrTPl1bgw/bamg4rUg3dShZaXIbK7uLQUZ//cEgCFCdNa/06vN0WP06tZaPdr
	Qj62qJ0J+5gWORn673dRREixFNCsDzdlKsvfXNtLI35fn4y7YBSjcM8T5domZMu6j8lzTovCLlV
	z0jTZ8WZw0jfcTUw==
X-Received: by 2002:ac8:598a:0:b0:517:91e5:1086 with SMTP id d75a77b69052e-527a961c7ffmr29048651cf.38.1784702233455;
        Tue, 21 Jul 2026 23:37:13 -0700 (PDT)
X-Received: by 2002:ac8:598a:0:b0:517:91e5:1086 with SMTP id d75a77b69052e-527a961c7ffmr29048311cf.38.1784702232777;
        Tue, 21 Jul 2026 23:37:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:37:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:30 +0300
Subject: [PATCH 15/24] drm/msm/dp: do not reject wide-bus modes while a
 YUV420 mode is active
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-15-368c10fe62fd@oss.qualcomm.com>
References: <20260722-drm-msm-display-interface-v1-0-368c10fe62fd@oss.qualcomm.com>
In-Reply-To: <20260722-drm-msm-display-interface-v1-0-368c10fe62fd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1946;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=p0Rd9oPmiONIcDwy0yPI6eTa7uZg5IuJSk3yNdX0Wak=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYGTo7I5ZjesJCBg3IFjmsDzx71PdD/aI0HSsQ
 aGpMsdSYMWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamBk6AAKCRCLPIo+Aiko
 1fQbB/4nTv3dHJr5ET9DfzmacacMg6Lx5fk0mMMtffHkL8JP45XJYKWl+Rm3zUPCmhEpI3M3kuH
 v1iiYEs92BjV3qIR2LQPiPyFG0OGHs12OUzdyblcKRynzx98lxFORbs0aQRrhtWd+1MJwfT3fqV
 feM85ZV2U40B1hziTqzjEsM5PQi0rUfJ+DXvNICxrGcKUdK6kFFKTF2c690sXq9Ve+nU9R1GrFU
 VEqPwamOB8U+r6fl4kay7wZ78ENgvXXYT+jMVbQ4UliP5bM1phX3LxTKGsJJBOPvm2n2YrGDLzF
 Cw6rj1aQg6ivTcKes/E6iWRJbRn5XC1grg30hvGwav2J5RuS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: i1Zit1MjXjlptxKAMWhNkFttXrxrlPA5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX4lf74ebE4Ehf
 eQRreQPLcogk2BuNyH2S1HfRosR0cyLFWf64GAEJtM5qOCEwd4tioOKbSjsftaRPf4BM7JfaHIU
 Oz6SZL32noHgMVqTzE4JZzpUDmICwI28FsrzMEsZT6Y3g3fYX6XBACRPr9NHjMrSErzrV0iT7jh
 i3JIPDUqXKMhZmEt43CFBU6k59hrvrM+qwoV4GQvwwQsC4kEHW0mByciA9l8RGt2ayHShU2BkvD
 cSaXZFwbC6xGUQxVBmdK8YElN/e+sRRLe7+L/gh7Rvqa6i/JaBQ4fHgbi19OLDfZa0bl4qv0mUK
 T3lDUpRZc8CNSHY5787ivghraSAyxx3uOuLCA056ovxKk1yLY/H6Yvil8mbKpaW/VNSmeD6JIig
 2sZH/qWJgmdS3xsrkhPwT2+ZTgELYX+1vFMfXVMHjgUsL1n9W8xcIPrW1MJYf8Ugy5XfZuoyIOc
 MVKDjoPLyqJfJAhgONA==
X-Proofpoint-GUID: i1Zit1MjXjlptxKAMWhNkFttXrxrlPA5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX6CcrEcNicR5W
 SrBhHv9Pai9q/vgEsOf1hhb/9phny0/JC7J24E/e/pQ5eMaMqCQH5YSryZX2R0I/CZcK5chs9j6
 GYVNiRyeuFr2k5WiYPPKWBZ/tVpnE8g=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a60651a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Y4CFgLxAi_mMOGnJ0dIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220060

msm_dp_bridge_mode_valid() halves the candidate mode's pixel clock when
the sink either uses YUV 420 output or drives the wide bus, so that modes
relying on those to stay under DP_MAX_PIXEL_CLK_KHZ are accepted. The
wide bus part is queried through msm_dp_wide_bus_available(), which
returns false whenever the currently committed mode uses YUV 420 output:
it inspects the stored msm_dp_mode.out_fmt_is_yuv_420 of the active mode,
not the mode being validated.

Consequently, while a YUV 420 mode is active, an RGB mode that needs the
wide bus to fit under DP_MAX_PIXEL_CLK_KHZ has its pixel clock left
un-halved and is wrongly rejected as MODE_CLOCK_HIGH.

The candidate mode's YUV 420 status is already evaluated as is_yuv_420,
and the wide bus is disabled precisely for YUV 420 output, so halving the
pixel clock for either case is equivalent to halving it when the
candidate is YUV 420 or the controller supports the wide bus. Test
wide_bus_supported directly, so the decision no longer depends on the
format of the active mode.

Fixes: df9cf852ca30 ("drm/msm/dp: account for widebus and yuv420 during mode validation")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1baeb9401cfa..bd1354f2c15d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -722,7 +722,7 @@ enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
 	if (is_yuv_420 && !msm_dp_display->panel->vsc_sdp_supported)
 		return MODE_NO_420;
 
-	if (is_yuv_420 || msm_dp_wide_bus_available(dp))
+	if (is_yuv_420 || msm_dp_display->wide_bus_supported)
 		mode_pclk_khz /= 2;
 
 	if (mode_pclk_khz > DP_MAX_PIXEL_CLK_KHZ)

-- 
2.47.3


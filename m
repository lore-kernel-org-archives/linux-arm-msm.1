Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286523;
	b=IvQGPk+0Km/qjpL1+9aZ20tUQ3WKNjwQ79Hm3GbDO+Yox6EDvIeLReZ8niyMDYocqtEa
	 ic6fHMZb37Of/dJj/WU4YrEdqcje0UPp6BuHMzKdn5sY8P/iDckg7BY/eF3OZwZNV45Tn
	 whaDvsWGWfcPX1InlEkix18N6GTNLaUnGnABjp5jWoCHR4O66GP2AAZoOE9CVUcnA+uSh
	 PAZZrUzg6RK/9fqJA80FzOSKC5nqqAobIVdgpBiqimOxQWgIFn8yBeilMztkKaTB0AmFz
	 HFAYJxY/y8jFWlsI2aujSybGQDd0+zXQd/pcZOXZkRIZLMCr8dLfaf9pOWj/Ub6IGvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XOHVnaPKkMDqdaS1cO+52v94uYEDVhjrO809duKaYuA=;
	b=4bomI42YQDT+7aoOgKoO7IbIZWe4bWjJBNbtwEcuMM/vMxDr62AXpIuCHI73ZZsSoTsj
	 8dGwGqaRQ7CmOmgRV2FFqwemDK1i0mFM4sY19o2GbXae0zYdl7idRhO+owX6wx9Ev+KZf
	 l/+fSDjwJvSNOqiU4dXGHHZNPASoo6aTUSKULMc5ar0oZOPJ3gu0pYkFeb3/Wxy2tg4Af
	 4apyF9OPj5aOIO6QKitnUD82CpemnvubobtjYU2rV7y+Jj94/yr+wjr0fHzrtoIROywRf
	 hr+llX1qCLcOu9CjA03BbMOEoANZlpTUvTd6rgaSLalXPGQYmh6oqkXGxYxaPt5n0xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y8q3MWo7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YbzEp1X/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD3F606A333
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBD3F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y8q3MWo7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YbzEp1X/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA49t8q1330048
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XOHVnaPKkMDqdaS1cO+52v94uYEDVhjrO809duKaYuA=; b=Y8q3MWo7tBiBk8Kf
	sOboc8A13d5+0b0QNICn/y78XiEEhSEbBZBdExUeIAe0WtWbiLE/fArgmrURZ0s+
	ZUps06G8PTfxd2Qun3s4O5jESJF5zc/1VDWRQCeaUmB6NssvoAuYdsktKHXgX/GM
	KzB8zmTVrWkTb1bOJUbujWdPWCsJIFiztolV0hcAkhUPuZ1MEnvx+0RiOn+BSh0m
	Y3S1S1zRzkYO2dnE8XLq+ED7bPfrrEzlz78Cn7KlDEi6i0v7yNjcTgi6aY2ksIJl
	rySNXqjdrqWwG38mMs5z6BnbojNoXpuGHkbTaUB9EgZPdrLL8TbIcD1nq+4Cv4EE
	7Zim1w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcjbfyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91e9a0eae11so24628706d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286521; x=1794891321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XOHVnaPKkMDqdaS1cO+52v94uYEDVhjrO809duKaYuA=;
        b=YbzEp1X/IwKcf6VqWphHrbcyklHY6xtCm6xVhs9NDtnftiBp+Np0gfbiqsgyBOGfWq
         0VMWUrrJTV4zXOcDg/bU/MDRuJ+ians9DJzZtrJrl/AVJf6inShMDzgDXwj9rwi5uwei
         TsDpmTZTWkPpnLoAqgg2Xu5mPCLBsU3uEPmBDTLatNXAb1CpgCeyBEuABj2zgmgzkOVW
         jyjO65xNUk3QgaDFEnK4A4weS5UOor4i4jTtIJ0+gDdhHOFSIgqqocWyVo/pGEDaKB2l
         ETCJQjgrv6KIkUY8r0ronEwxzyTuo1Hfos6GQxNJdk5HFYjYSI2Q0Q10XavOC5GTiyI1
         ep8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286521; x=1794891321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOHVnaPKkMDqdaS1cO+52v94uYEDVhjrO809duKaYuA=;
        b=ymOClz6r03vyFDkHLSoZdz3yJ2cAIcRDYgzcZChkBTbY09aRavSHxgnvC0QOjt3aNn
         39DQnzdVSzTqczAHwrN3WRRGHC3VdnbKvt7BMulWG8KerliCbOJQ1QEjtyjEtYa7CmVQ
         qPGLrKjM1IkvU3ecPCQn27IM8KpVyiGZ8W/ki3Pi6pDEuoKDZFbtDMFze8IdqEe0gLid
         pxd9iBX2ngxHaKLVIaIN4B7OhVVhHw/Sg5+oKCGwtVLBC4bh1ab+s0+23VPqqVs4WVGX
         09Gv2JaVfIVbw12aIECHzxIWf78SQjyDjfbEt2VM0oOx2o/pMnWPpUEWFXC86tBb9pLc
         vRFQ==
X-Gm-Message-State: APuU4Z8IPlvE35L9wcpKiKfPpmbM91PptLyukCSOQavT3rRpAdCIOI8E
	T+U5hNhUWG/R3DtL5P8wH3xxWUlUDa++h+0tD6Z0DCmJ/W3g2f4LdVQQwDjAFppoDdD5c6OV+XE
	jdFu2nYiaVHGJMT92O+rAAQGLV/j/1KZDWG5vkBalVsa7VpZvZMuVoV1q8XVLpPJkxLp9
X-Gm-Gg: AYBFou0Cebo+n6ChkCtynTncyR927VF/fZf4MKAJLDKut+/5pGk6uNARUhB85e2SPRs
	DI8W/Ooq60MN+mJiLtdw5pQHr1V874tSnALrw7D16tmtQa9YH6FC3UUU2B884paC4vJPB2khFBJ
	7i7iyUtJRS+dwOduK5wtpwKaz3yVfJV/Mr10qpFMNmq1Th6roBZJwfSdicSKAgYsIzI+jvYyar6
	yhf1yTQY1iw0ybYZkBQ51XEae7RwBsVoGiyygVbQDVfE30vEu/alE55k8CcidNFjYA3+ZKpwxfX
	z5Ti9PrX0aiJT8sncnodSbe7V4sujADzq1MgSuBv+ERW1/N20zyc7WA1/RBCYk+pu3LkK3GHeLO
	HGml/MUFC+W1zR6WjCjGtE3gc4wr6Vb1YzafshNPGpOIJhfp7QKJ27WvYMNK1W0rsbMBCkmn5GA
	NJp3NyRoKPk0sGHT2paylldCqFXsGsiRZOumDP
X-Received: by 2002:a05:620a:1a14:b0:939:b099:d52f with SMTP id af79cd13be357-9479f28fbf0mr264564685a.20.1794286520848;
        Mon, 09 Nov 2026 20:55:20 -0800 (PST)
X-Received: by 2002:a05:620a:1a14:b0:939:b099:d52f with SMTP id af79cd13be357-9479f28fbf0mr264561785a.20.1794286520219;
        Mon, 09 Nov 2026 20:55:20 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:55:19 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:30 +0800
Subject: [PATCH v8 09/29] drm/msm/dp: factor out _helper variants of bridge
 ops accepting a panel
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
Message-Id: <20261110-msm-dp-mst-v8-9-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=9551;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=zite9a3phlMLvlDTVMJoeGqeBbIHHb3A2QWnia5l2xs=;
 b=6d3l0gTDgiQtD9zo5/IS1hsSkjmtUV0ktj7mzbOOTglRGAIn+iS4FHpvc4hCPgZq3T5wmlru/
 je/6pMKNw99CTVXYN3WgOiR1vOrbUwj1EYuYTJgAUdpKISM9rWiDcfo
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: 4_lVGpTKRgV0N3SZuTYvdi_RHeqIGmhn
X-Proofpoint-ORIG-GUID: 4_lVGpTKRgV0N3SZuTYvdi_RHeqIGmhn
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af2a3b9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=10mNmtCk2Ocqn4x3vjYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX9LARCrv1rzUW
 6K0G90p97IjumJ5OMqJXQi+/KtsV/TgqzKy6XsxeDbVlPAPd37KZxK1OwcStCgqo3Qi/YMZIgRb
 ndtBuCkiQFXe2ykuzb+qYSmTiH3lVbc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX4/W5O6A9Ds2i
 QmpuCeoFQzGqbpEeNy3OGvWybgQc8acEqP6X0YPPA+YQIWgxOMhDE44yR3DGfRSZdc7p0EJREPO
 Q1NvAE5aH4exm2IB+ggA2lwEarqia+XZLuzA05QTFGeUvuv3xupfswX+5ZVRAALLFgwnxtPhb1A
 FHKJPZjoQflTLMbziHYqnfE9M7o0jb2gGUTcJub51vn8Q6ha7EQKaesk/TYL3orVfWytNMlUjJn
 EHaTdwNzhcLDdTt6OqLR7nSy6DHEMe7s3b9xzV/B17bSORBzObF5miXkgfEEIKJRrq0Bs11SYlP
 4k6/O+0s04A8AUwtHTxnaG6r1+go+Y8BH13/X8i3z5qF5bOk67xxJK61Dm03ud0WpPZLyh85lh1
 88JSId2M+R0TjWji0xLwU0zbH1DcZGFAGEE/P6aupJDCc9Wn80UzyznEe+SL4xBDAw3qbGy3Y1Z
 mkEd1iicA07+ONLEd1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100019

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The atomic bridge callbacks (set_mode / enable / disable /
post_disable) on dp_display currently hard-code dp->panel. For
DP MST every stream has its own msm_dp_panel that the MST
encoder owns, so the same enable/disable sequence needs to be
invokable against an arbitrary panel.

Introduce *_helper variants that take struct msm_dp_panel * and
reduce the existing atomic_* callbacks to thin wrappers that
pass dp->panel. No SST-path behaviour change.

Also drop the static qualifier from msm_dp_display_prepare_link()
and msm_dp_display_unprepare() and change them to take
struct msm_dp * so the upcoming MST encoder code can drive
link-level prepare/unprepare uniformly through the public API.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 111 +++++++++++++++++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_display.h |  14 +++++
 2 files changed, 91 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 169990c10b36..471085744c7c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -632,12 +632,14 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 	return 0;
 }
 
-static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
+int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 {
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	struct msm_dp_display_private *dp;
 	int rc = 0;
 	bool force_link_train = false;
 
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
 
 	if (msm_dp_display->is_edp)
@@ -1457,60 +1459,81 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_display_atomic_pre_enable(struct msm_dp *msm_dp_display,
-				      struct drm_atomic_commit *state)
+int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
+				   struct drm_atomic_commit *state,
+				   struct drm_encoder *drm_encoder,
+				   struct msm_dp_panel *msm_dp_panel)
 {
-	struct msm_dp_display_private *dp;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
 
-	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-
-	crtc = drm_atomic_get_new_crtc_for_encoder(state, msm_dp_display->bridge->encoder);
+	crtc = drm_atomic_get_new_crtc_for_encoder(state, drm_encoder);
 	if (!crtc)
-		return;
+		return 0;
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 
-	/*
-	 * The DPU encoder's .atomic_enable() reads the mode's YUV420 / wide bus
-	 * state and runs before the bridge's .atomic_enable(), so the mode must
-	 * be programmed here, in .atomic_pre_enable().
-	 */
-	msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode, dp->panel);
+	return msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode, msm_dp_panel);
 }
 
-void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
-				  struct drm_atomic_commit *state)
+void msm_dp_display_atomic_pre_enable(struct msm_dp *msm_dp_display,
+				      struct drm_atomic_commit *state)
 {
 	int rc = 0;
 	struct msm_dp_display_private *dp;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	rc = msm_dp_display_prepare_link(dp);
+	rc = msm_dp_display_set_mode_helper(msm_dp_display, state,
+					    msm_dp_display->bridge->encoder, dp->panel);
 	if (rc) {
-		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
+		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
 		return;
 	}
 
-	rc = msm_dp_display_enable(dp, dp->panel, NULL);
+	rc = msm_dp_display_prepare_link(msm_dp_display);
+	if (rc)
+		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
+}
+
+void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display,
+				  struct msm_dp_panel *msm_dp_panel,
+				  const struct msm_dp_mst_slot_info *slots)
+{
+	int rc = 0;
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	rc = msm_dp_display_enable(dp, msm_dp_panel, slots);
 	if (rc)
 		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
 	rc = msm_dp_display_post_enable(msm_dp_display);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(dp, dp->panel);
+		msm_dp_display_disable(dp, msm_dp_panel);
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_display_atomic_disable(struct msm_dp *dp)
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
+				  struct drm_atomic_commit *state)
 {
-	struct msm_dp_display_private *msm_dp_display;
+	struct msm_dp_display_private *dp;
 
-	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_enable_helper(msm_dp_display, dp->panel, NULL);
+}
+
+void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
+				   struct msm_dp_panel *msm_dp_panel,
+				   const struct msm_dp_mst_slot_info *slots)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	/*
 	 * If .atomic_enable() bailed out - link training failure is the common
@@ -1524,17 +1547,28 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 	 * TrustZone-level SOCCP/ADSP force-stop and a silent SoC reset.
 	 * There is nothing to push idle, so leave it alone.
 	 */
-	if (!dp->active_stream_mask)
+	if (!(msm_dp_display->active_stream_mask & BIT(msm_dp_panel->stream_id)))
 		return;
 
-	msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_display->panel);
-	msm_dp_ctrl_mst_timeslot_setup(msm_dp_display->ctrl, NULL);
-	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
+	msm_dp_ctrl_push_vcpf(dp->ctrl, msm_dp_panel);
+	msm_dp_ctrl_mst_timeslot_setup(dp->ctrl, slots);
+	msm_dp_ctrl_mst_send_act(dp->ctrl, msm_dp_panel);
 }
 
-static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
+void msm_dp_display_atomic_disable(struct msm_dp *dp)
 {
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	struct msm_dp_display_private *msm_dp_display;
+
+	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_disable_helper(dp, msm_dp_display->panel, NULL);
+}
+
+void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	if (msm_dp_display->active_stream_mask) {
 		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
@@ -1554,11 +1588,9 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 		msm_dp_display_host_phy_exit(dp);
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
-
-	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
+void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_display_private *msm_dp_display;
 
@@ -1569,7 +1601,18 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 
 	msm_dp_display_audio_notify_disable(msm_dp_display);
 
-	msm_dp_display_disable(msm_dp_display, msm_dp_display->panel);
+	msm_dp_display_disable(msm_dp_display, msm_dp_panel);
+
+	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
+}
+
+void msm_dp_display_atomic_post_disable(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_atomic_post_disable_helper(msm_dp_display, dp->panel);
 
 	msm_dp_display_unprepare(msm_dp_display);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index b163954deafc..f6ebb3d409cf 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -43,5 +43,19 @@ void msm_dp_display_atomic_enable(struct msm_dp *dp_display,
 enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 					       const struct drm_display_info *info,
 					       const struct drm_display_mode *mode);
+void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display,
+				  struct msm_dp_panel *msm_dp_panel,
+				  const struct msm_dp_mst_slot_info *slots);
+void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
+				   struct msm_dp_panel *msm_dp_panel,
+				   const struct msm_dp_mst_slot_info *slots);
+void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp_display,
+					       struct msm_dp_panel *msm_dp_panel);
+int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
+				   struct drm_atomic_commit *state,
+				   struct drm_encoder *drm_encoder,
+				   struct msm_dp_panel *msm_dp_panel);
+int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
+void msm_dp_display_unprepare(struct msm_dp *dp);
 
 #endif /* _DP_DISPLAY_H_ */

-- 
2.43.0


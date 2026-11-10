Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286612;
	b=o2yN3S7c3e+oRr1cKxBwVC2bg6K7ahI1Cyz3act3wo8ZbQ6cFudjXXcHdHQRD+JUS9uA
	 E211WmpIAumyNtk+ymCJE5Sk2TJ1UZtODC1eNqFjPnCEE/W1ZhDHklgxnTREh1Z2AyAIW
	 J2H8k3WVgxWdh3rwx6XqYmzCtHqWrWPxvg0BJWub6bBRjBpclh1T9BGshqWMUzLq37Rwj
	 ikdWi04hTTwDbIhqHcrzhcHOxBsq5MkQ32J9cPGU7sWCpjTIop7Ywu1dce6qnL8zQa9V7
	 Aunr8RNKmLXoh5x6GfMER0VRjIjULuQ7dPV4Hbvojc96uyB3hfCYZ2n94/gAFBO+6yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286612;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=d+WYdt08Ufsm3x+Oe0Q0W8lqpRG0RHBqFyGwH/romlI=;
	b=CAwU3EEVg0Pa0N+eWm6HkoX73e/VrZ6lbMZ74jaJwU61KbslqALoMQDWr3+VvGhBxI6G
	 lSm4c3YN2Hi3DYeNxoj6BjgZ/d5XEw5qmu4jYbeF9Zjs/eojXyS9suc/FWONw8anZeMhV
	 kLzT0k04ukCec7sxbaxYyZOvM75Hngxaki5SbSBKRSZLDOVBctBc+MRbK73pbRU1N+0Ee
	 ygOk9/oe4ZhJasFklKWoyrlL1StZ3aZtEFjGLeFBMm5mvH64s8ehwPjvwqdsb4tCrwj2a
	 kohI5PY88Y0cIGOg/VvZE7m/efG4C5BMl//Gevz2K55nSEmAaKgvSUXoMXqJptzFILA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ogXxMzjk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d8gHd0U2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05A460A2622
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A05A460A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ogXxMzjk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d8gHd0U2
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A1uh2249121
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d+WYdt08Ufsm3x+Oe0Q0W8lqpRG0RHBqFyGwH/romlI=; b=ogXxMzjkUToWBYOF
	/DrV0VFSkGW6AMne8H+iaRpoagyvj1RY4N4OnsR5sisjxFOZnNMka/oFI2VeVKHt
	2IJJoc3XR2RsHix04GpPjpC+RqUl97rQFHg2gDrg6i9Y+oBEnrztGyRxVhSOrJDF
	Tns4EWFgKAxxK74K3MEpdzQMKQmnGSCm46U2EmO/zWlv37CixswUcHhzmXMnRHfZ
	aQI3YFThIMg8tfU+sQUk6j0MthuF4Fx5L+C6WKs+KIXwZUkqBJS+NVbByQbpZOYx
	+OfhHTla0k0opUFFeD6E0xNWtVThwX6Wp72R0aXciDFf81wX2BnZxSct2Wf9xaus
	P+WwHg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapbpvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so321446085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286609; x=1794891409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+WYdt08Ufsm3x+Oe0Q0W8lqpRG0RHBqFyGwH/romlI=;
        b=d8gHd0U2xnBqYQ+CLG/Y9tPaFHNZAvcmK1DwvoYJmeM2CqwDm+qlPZ/+Iy7wSED2z7
         14lUx2crui2fyyOmTqf3Ogh+4i9ERbzi6ZbTnRxHu21YSmafm2pN/L/NaT0h5NaucWoM
         HCn0ueyDlQWgH21v2LY/+nxV2ZQKxyi4KssI9PyQC37sq0qQavq2Q3NlKsVcnqohuDQc
         KD2tpXBsTRbnyzHtbRXZ1CS57zdCvcaE3YJbAijmNcK1NrkiBp4WmJufp6coviFsNrIY
         9trhhUgJFd1ziM5paAMQK+lFczfVeTgshCCuZrC/rhmC/CC4GayB5wsXFLjwKUdB9cxB
         1k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286609; x=1794891409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+WYdt08Ufsm3x+Oe0Q0W8lqpRG0RHBqFyGwH/romlI=;
        b=NJzL8t6Jpn8p35ZCoe036UMqJC2eQU368BWuv1z1sFoVfCbQ+oGzz/j9uUsux2Flm6
         jOYy6n+sqTYgqW8dCqFrEVL/x2mMm0nIvEWna0UpqXBj23YSRuyf0dBU0hjb50EDJZIF
         hSGnWopfuje5NUVh1+KNs+fDAzi3lZWHbZvEnwV3A+pjTbqICHyItE2HX1/Ug7y/nYSj
         f7ABjKNVUmELtnRsZTlTgz/lbY6lNfVrqW/PFf4LbFKvDN+oxoG/7aVh+weCF6iZKDXv
         h082kfa29gb1QeNqHT34/XfD8EMYYs1zjkdxmZVUYBoB1+OGPsecQifEdh7tpcWD+Q9W
         WSdA==
X-Gm-Message-State: APuU4Z8dVWpMXlnJh0cGzcHygCHzcCvdFNmAV3hMXQjA2Q+rcN6xezKp
	7/0V5Lhw9U0vCcbyHALO8MsptZKejiLWzMlKVRAHiIVyvXi7g4tSoc/A/W9+vBxfc8/SPrI/O5v
	+t4aM4GWH9fuhrAhwaqUnCMqP5dkFb1bg96v1MGFtzdmEpy8spTh11BlJQ8brH/VbaocC
X-Gm-Gg: AYBFou3tBku3YhRHMBRl4gGIyFnXyJf0162BNcJOa4XVVef1s6l/+0dxhrkNjdDmJB8
	EWW9VeeL2A6GFSIR99rahC2LIJPj2IWWgLOS56/GscglH/EMmJ6996XQkFEDGJzptTuLhQmhg95
	dzJhNFg+b+nU8RecdolvevQK4vZqTIdGBWZVgiINYCMdrbi3qTmIpCGG0Sjguip+ran4MDd31OL
	P+ub5jP4ahodb3/77RSfhePIiVZgyeE1TmeloJQP9kPPtYMP6Pog7PgsJI87UDCKy3zyNGdKk1E
	MNAFkDavkiq6WZ7pvCJOES05pBl9DV3M4cGBo+/ysREC5kOW/JgVtMNxU71/lbkjZ+c9PqxAYDq
	cMFSrjSlYkmLIsmazDtO8sGwHr/gYSNNAzvSbOT1SC2Rak/OCJ6n0tcQdKmmzYtmtqeHFJJ4Xqe
	vDVy1bTqqm8AWI3s9e19GPZHuat3llPiluaNFK
X-Received: by 2002:a05:620a:46a7:b0:93f:5677:9950 with SMTP id af79cd13be357-9479f38a57emr252637785a.53.1794286609175;
        Mon, 09 Nov 2026 20:56:49 -0800 (PST)
X-Received: by 2002:a05:620a:46a7:b0:93f:5677:9950 with SMTP id af79cd13be357-9479f38a57emr252634585a.53.1794286608628;
        Mon, 09 Nov 2026 20:56:48 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:48 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:49 +0800
Subject: [PATCH v8 28/29] drm/msm/dp: select MST stream bpp during atomic
 check
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
Message-Id: <20261110-msm-dp-mst-v8-28-d040fb33db5f@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=10659;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=CPwuoOmLN10Kr6wWpYVMMlD9otxVbPsvSEjJAEPgNKA=;
 b=FQ0zy+S7GNRXYJCUV/Vx2hfM4nirkoWyPewEtuHCfRbZlMXCz0+04bc5CkuX1zOJhXcxBMgRd
 Mqptn+wMrRDCYbYKwM4nGAVpMwgniBOyHThFcZ6j0/vZ0O/XDhDvAkO
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX2Yhs2FdaC+X6
 YxTub/tTJTG3dNA6vAqr/xxyA7+tZw4LdRqgcXYWWhcvBUPJ7XerhZGQztKTBQbG39J9TlRCNSX
 53Xo69XA9wS940eIz5QpaTCClBMPXlyIMEOf/WdtDPZCSn/lqJE5phG5xIS1Qogc924iHuDsovv
 r23TIrP3jKlINpCO0TG4NW3nIt/i2DfTNqcHaONI8SkjlOA13klB2X7B6oKKTbOl690/DSGcc55
 WsihMZUVXWE3CZ9x6D8S5O0qFYIAubnVVpeUAoVogubKn7YdzKe3qWC61nd1s0tLyMLnHWNq+2M
 YHPaikF4FgERegTN2osHkEFAVTyqifw5nCaWboBbYP3p0bdiFMPhuDtkY7vZbtzfBrHWR1qSw1O
 xS8syMxebPKQAAjX3rmN9+uPAR7buIpb4wnXn65H1tuGi/FC/gQfL8rDD0VCFB057qgzYqnu0Bz
 YHFD/ev3G0UPiruQfbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX6mqh1/lcPfmf
 Q4Akak3vI8+tVCF2Qqzs37tWTvFhxr4nrZcoX1hZTeE++Uu6V4C0DXDkhmGKjx167prm7kiM9Lo
 PRO1Sow+Fi8I8xkq1cjnGdH9jxWJ1/A=
X-Proofpoint-ORIG-GUID: rAxxDOhC3mR1RciKPd4HK--zjeWpCsDs
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af2a412 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JPqAu_mP4Hh-pTAkM0kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: rAxxDOhC3mR1RciKPd4HK--zjeWpCsDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

MST streams share one link, so each stream reserves a share of the
link's time slots during the atomic check, sized from the bpp the stream
will be driven at. That size was derived from the sink's bit depth,
without checking that it fits the bandwidth of the MST port or the time
slots left on the link. When it does not fit, the modeset fails rather
than driving the stream at a lower bpp.

Try 30, 24 and 18 bpp in turn and take the first one that fits. This is
the sequence msm_dp_panel_get_supported_bpp() already walks for SST,
where the whole link belongs to a single stream. Carry the selected bpp
in a connector state subclass so the commit programs the bpp the
reservation was sized for.

drm_dp_atomic_find_time_slots() only records the request and does not
report a full link, so compare the time slots it returns against the
ones the link has. The aggregate limits are verified later by
drm_dp_mst_atomic_check().

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  22 ++++---
 drivers/gpu/drm/msm/dp/dp_display.h |   3 +-
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 116 ++++++++++++++++++++++++++++++++----
 3 files changed, 119 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8e30420a017f..b9e01b74dc14 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -693,17 +693,19 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 
 static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 				   const struct drm_display_mode *adjusted_mode,
-				   struct msm_dp_panel *msm_dp_panel)
+				   struct msm_dp_panel *msm_dp_panel,
+				   u32 bpp)
 {
 	struct msm_dp_display_private *dp;
-	u32 bpp;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	if (msm_dp_display_check_video_test(msm_dp_display))
-		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
-	else
-		bpp = msm_dp_panel->connector->display_info.bpc * 3;
+	if (!bpp) {
+		if (msm_dp_display_check_video_test(msm_dp_display))
+			bpp = msm_dp_display_get_test_bpp(msm_dp_display);
+		else
+			bpp = msm_dp_panel->connector->display_info.bpc * 3;
+	}
 
 	msm_dp_panel_init_panel_info(msm_dp_panel, adjusted_mode, bpp ? bpp : 24);
 
@@ -1604,7 +1606,8 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 				   struct drm_atomic_commit *state,
 				   struct drm_encoder *drm_encoder,
-				   struct msm_dp_panel *msm_dp_panel)
+				   struct msm_dp_panel *msm_dp_panel,
+				   u32 bpp)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
@@ -1614,7 +1617,8 @@ int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 		return 0;
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 
-	return msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode, msm_dp_panel);
+	return msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode,
+				       msm_dp_panel, bpp);
 }
 
 void msm_dp_display_atomic_pre_enable(struct msm_dp *msm_dp_display,
@@ -1626,7 +1630,7 @@ void msm_dp_display_atomic_pre_enable(struct msm_dp *msm_dp_display,
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	rc = msm_dp_display_set_mode_helper(msm_dp_display, state,
-					    msm_dp_display->bridge->encoder, dp->panel);
+					    msm_dp_display->bridge->encoder, dp->panel, 0);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
 		return;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 62400547e01a..7a50367c36a5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -57,7 +57,8 @@ void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp_display,
 int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
 				   struct drm_atomic_commit *state,
 				   struct drm_encoder *drm_encoder,
-				   struct msm_dp_panel *msm_dp_panel);
+				   struct msm_dp_panel *msm_dp_panel,
+				   u32 bpp);
 int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
 void msm_dp_display_unprepare(struct msm_dp *dp);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 2b96e003225d..a452b3d2ba22 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -23,6 +23,14 @@ struct msm_dp_mst_connector {
 	struct msm_dp_mst *dp_mst;
 };
 
+struct msm_dp_mst_connector_state {
+	struct drm_connector_state base;
+	u32 bpp;
+};
+
+#define to_msm_dp_mst_connector_state(x) \
+	container_of((x), struct msm_dp_mst_connector_state, base)
+
 struct msm_dp_mst_encoder {
 	struct drm_encoder *enc;
 	int stream_id;
@@ -51,12 +59,51 @@ static void dp_mst_connector_destroy(struct drm_connector *connector)
 	kfree(mst_conn);
 }
 
+static void msm_dp_mst_connector_reset(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector_state *mst_state = kzalloc_obj(*mst_state);
+
+	if (connector->state)
+		__drm_atomic_helper_connector_destroy_state(connector->state);
+
+	kfree(connector->state);
+	__drm_atomic_helper_connector_reset(connector, mst_state ? &mst_state->base : NULL);
+}
+
+static struct drm_connector_state *
+msm_dp_mst_connector_duplicate_state(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector_state *old_state, *new_state;
+
+	if (drm_WARN_ON(connector->dev, !connector->state))
+		return NULL;
+
+	old_state = to_msm_dp_mst_connector_state(connector->state);
+	new_state = kmemdup(old_state, sizeof(*new_state), GFP_KERNEL);
+	if (!new_state)
+		return NULL;
+
+	__drm_atomic_helper_connector_duplicate_state(connector, &new_state->base);
+
+	return &new_state->base;
+}
+
+static void msm_dp_mst_connector_destroy_state(struct drm_connector *connector,
+					       struct drm_connector_state *state)
+{
+	struct msm_dp_mst_connector_state *mst_state =
+		to_msm_dp_mst_connector_state(state);
+
+	__drm_atomic_helper_connector_destroy_state(&mst_state->base);
+	kfree(mst_state);
+}
+
 static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = msm_dp_mst_connector_reset,
 	.destroy = dp_mst_connector_destroy,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.atomic_duplicate_state = msm_dp_mst_connector_duplicate_state,
+	.atomic_destroy_state = msm_dp_mst_connector_destroy_state,
 };
 
 /* DP MST Connector OPs */
@@ -142,6 +189,42 @@ static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
 	return drm_dp_atomic_release_time_slots(state, &mst->mst_mgr, mst_conn->mst_port);
 }
 
+static int msm_dp_mst_select_bpp(struct drm_atomic_commit *state,
+				 struct msm_dp_mst *mst,
+				 const struct drm_dp_mst_topology_state *mst_state,
+				 struct drm_dp_mst_port *port,
+				 const struct drm_display_mode *mode,
+				 u32 max_bpp, u32 *bpp)
+{
+	static const u32 bpps[] = { 30, 24, 18 };
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(bpps); i++) {
+		int pbn, slots;
+
+		if (bpps[i] > max_bpp)
+			continue;
+
+		pbn = drm_dp_calc_pbn_mode(mode->clock, bpps[i] << 4);
+		if (pbn > port->full_pbn)
+			continue;
+
+		slots = drm_dp_atomic_find_time_slots(state, &mst->mst_mgr, port, pbn);
+		if (slots < 0)
+			return slots;
+
+		if (slots <= mst_state->total_avail_slots) {
+			drm_dbg_kms(mst->msm_dp->drm_dev,
+				    "[MST] bpp=%u pbn=%d slots=%d\n",
+				    bpps[i], pbn, slots);
+			*bpp = bpps[i];
+			return 0;
+		}
+	}
+
+	return -ENOSPC;
+}
+
 static struct msm_dp_panel *msm_dp_mst_panel_from_encoder(struct msm_dp_mst *mst,
 							   struct drm_encoder *enc)
 {
@@ -204,6 +287,9 @@ void msm_dp_mst_stream_enable(struct drm_encoder *encoder,
 		drm_atomic_get_new_mst_topology_state(state, &mst->mst_mgr);
 	struct drm_dp_mst_atomic_payload *payload =
 		drm_atomic_get_mst_payload_state(mst_state, port);
+	struct msm_dp_mst_connector_state *mst_conn_state =
+		to_msm_dp_mst_connector_state(drm_atomic_get_new_connector_state(state,
+									 connector));
 	struct msm_dp_mst_slot_info slots[DP_STREAM_MAX] = {};
 	int rc;
 
@@ -212,7 +298,8 @@ void msm_dp_mst_stream_enable(struct drm_encoder *encoder,
 	drm_connector_get(connector);
 	panel->connector = connector;
 
-	rc = msm_dp_display_set_mode_helper(dp_display, state, encoder, panel);
+	rc = msm_dp_display_set_mode_helper(dp_display, state, encoder, panel,
+					mst_conn_state->bpp);
 	if (rc) {
 		drm_err(dp_display->drm_dev,
 			"[MST] stream:%u set_mode failed rc=%d\n", panel->stream_id, rc);
@@ -311,9 +398,12 @@ int msm_dp_mst_stream_atomic_check(struct drm_encoder *enc,
 				   struct drm_connector_state *conn_state)
 {
 	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(conn_state->connector);
+	struct msm_dp_mst_connector_state *mst_conn_state =
+		to_msm_dp_mst_connector_state(conn_state);
 	struct msm_dp_mst *mst = mst_conn->dp_mst;
 	struct drm_dp_mst_topology_state *mst_state;
-	int bpp, pbn, slots;
+	u32 bpp, max_bpp;
+	int rc;
 
 	if (!conn_state->crtc)
 		return 0;
@@ -321,9 +411,6 @@ int msm_dp_mst_stream_atomic_check(struct drm_encoder *enc,
 	if (!drm_atomic_crtc_needs_modeset(crtc_state) || !crtc_state->active)
 		return 0;
 
-	bpp = (conn_state->connector->display_info.bpc * 3) ?: 24; /* fallback: assume 8bpc */
-	pbn = drm_dp_calc_pbn_mode(crtc_state->mode.clock, bpp << 4);
-
 	mst_state = drm_atomic_get_mst_topology_state(crtc_state->state, &mst->mst_mgr);
 	if (IS_ERR(mst_state))
 		return PTR_ERR(mst_state);
@@ -334,10 +421,15 @@ int msm_dp_mst_stream_atomic_check(struct drm_encoder *enc,
 						 mst->link->link_caps.num_lanes);
 	}
 
-	slots = drm_dp_atomic_find_time_slots(crtc_state->state, &mst->mst_mgr,
-					      mst_conn->mst_port, pbn);
-	if (slots < 0)
-		return slots;
+	max_bpp = clamp(conn_state->connector->display_info.bpc ?: 8, 6, 10) * 3;
+
+	rc = msm_dp_mst_select_bpp(crtc_state->state, mst, mst_state,
+				   mst_conn->mst_port, &crtc_state->adjusted_mode,
+				   max_bpp, &bpp);
+	if (rc)
+		return rc;
+
+	mst_conn_state->bpp = bpp;
 
 	return 0;
 }

-- 
2.43.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F943E638E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234104; cv=none; b=KC/52pKGOaQL0yl43CpQQQw8wj+ztj90VJbk/AslsIQ9KctvUb2LUkyucJuIxDLxikjdp/iaOoIcCk5tiAbtOfsq2WOSuS3m4oB/rqbJvW18QNJhH0NLmvQnx6sOPmISt/6Wfv96P8ubNwi6+1exm+OkxAE4g9aKyEnHFuFUMSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234104; c=relaxed/simple;
	bh=gtymclkuEBC4Gtb94q3hrKBPv0k6dPhp4Zvr7BCSBZc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y4rE+fPwGI/nOvXv7t1x0Wxh4NSR/OAjpdpA7jxtcXRy8DItSaVKVhX/gofVOR60Hcpc/PUhiT3Cwbo6OysFCJqROzxb2rKDMYk1RGf+b03VSBZyaxx2viusWOQuWC48yWo51BQThFPbxXc2AQRxm4g8ytfb68Ksvz4RGL3LFIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OPJZmu95; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J429b/BV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OPJZmu95";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J429b/BV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82UHR2145039
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k8XTLlBbBhkHOutm9hULJG
	eDDzcY4ZTHIOHZViR0U8U=; b=OPJZmu95ErJ0Jle4ahjW/+fqD+SOPtJ0Bd/TRM
	haYzXarxO2uIBJWB0oJAg3VoT8Ndsw51Pct/dciiZ3TQskIVjyI9QSQM0JzBEOkU
	G41VSOVPjVDtHf4mGaSo2Ku0klbJwp/hC/ppkXKEwfW5PF1h9ygw8sGuX7ZCzdPt
	HeIzygMX9EIN5f0rop3dAeEgkn/Q0hw8IRv0M1BfjE1aSk3odT82uwp1J4dXqerg
	eVj34oTHfjz21+7hcwe5MrjYL3WcJ1Kb8QfsHZL2Yftt/J4cuMEs1z/XMNESXwvd
	c5O77Q2b06b0TEa2MMtEKuMONpEfNS/s+k6jfassqUcF5J3w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19hfdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:21:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ec45d9628aso77725456d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234101; x=1785838901; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k8XTLlBbBhkHOutm9hULJGeDDzcY4ZTHIOHZViR0U8U=;
        b=J429b/BV+RtskbCg1j+79Prj/CqEEoXAL78v62OAbb8kQIOgoRk7128Ou2JkwuYDp+
         8uZEYe8gtCHtH029W0KM2igf4C/PcXifBOI7UBO48pVEsG198VjlSDHNxiXiL93jVtct
         PXa7erKb9ggUS0ld6suHpVux3C93gE2GROSoOinU1sPIscwhsjyGz5xDwJdPY6jsGJo6
         F4qa7/LsGz28yWEQ4Lexo3SJeiR5GzhhNO+qTsmKh8Di0YRktPT755bUSqwuoi0c7X+6
         dJnNieqje1lTrnxfS0WtNjSxrWUBgOQOfy8qARhxibNCqWVHLTRi2YegMhcDBF3LN1bx
         VR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234101; x=1785838901;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k8XTLlBbBhkHOutm9hULJGeDDzcY4ZTHIOHZViR0U8U=;
        b=a0yqM5wNb0XzUwpM1ZQxZNYPmGQO4EamwbWTQCUzTVNmeTmTwJrZcPYB7cnPp/se8Z
         aaRvGTYSxGx+wNgHDjNliR1L8qbrvX7MvJHBn3Nk4XGyS0ogNER+/zazigWgVJlzygR/
         pZDzrIEw+Bdz8cm4c+sgcEp42oASjFy5X4zxLhJVSr3j3hgLDKebv32D87NjvTL7JfZy
         HF5oApqgJnaRg6VJ47kDddFKTbzCVpnSIIxeQD4Qb6384k4CY9BbWbzS8/apGaeLb4AK
         sXjuF/BSWWjx+2bAo4KsEaX4tx7nP/fyFP0OIJZDYxGBR24FmILmBQYFr9ExeDrwMCKZ
         +I4A==
X-Gm-Message-State: AOJu0YxCgWS1OPOFpeVOqMSg1IjOyVLTM+h/g5ePXdGhwb0fI3y8wDU9
	e5y6/7D0xMmSFNZ/PfvKfcNZMsi2zTpv5Ph+wTJtl3pL6k8yZfZ9IQTkyomk3m4sVn8SOAwpdV/
	b+rCE3sNOdQFG6kL58pn8aTbcigbuU7OxI5GPWMiHSnR0vPHKEG6c9TuOSqGOh/xna5Cx
X-Gm-Gg: AR+sD10BBQ2weLT472viJLvmupIFYQLFsr8PSUbTEn+EpQzCUDKKACxr8ba9gVmWT7J
	4ASKTdP3S8tYz/4UVuFAmWQoHulrOFH4hv1dyB9byAGaztzhzBONWz1EAIT/MAuOUhWBk4KgcE6
	vDiwKwaLA6DOCMje0xbqxR4+f4aV6lhZ16x0Tjah495QrQrR0TCvDJm+j9PeVG2p0zuicAzSY0S
	oFW6CVWe1L7IuP9xtxsyKnc/cvKBZS2/NRIYu+ydi7HoaT2r9WIi+inVdOcIi617zv3uXAZL3P5
	BRGHaXQGPmtV7/dI1DRS7fxvGAUnI2EFn2oKA9wu3kaCHG0HICzYAb9lqebwPd6Jk4OoHAGEVBz
	DjP8c0YV6xdJazVBng/nYxyU1uLCcEd/be0iBtNqiKa27AKtKVzL1UPHYvPKRrsk=
X-Received: by 2002:a05:6214:328a:b0:8f4:d86:ec0f with SMTP id 6a1803df08f44-908172f03e2mr16435466d6.27.1785234100823;
        Tue, 28 Jul 2026 03:21:40 -0700 (PDT)
X-Received: by 2002:a05:6214:328a:b0:8f4:d86:ec0f with SMTP id 6a1803df08f44-908172f03e2mr16435176d6.27.1785234100331;
        Tue, 28 Jul 2026 03:21:40 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e869ba73sm84791396d6.25.2026.07.28.03.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:21:40 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v9 00/14] drm/msm/dp: Prerequisite cleanup for upcoming MST
 support
Date: Tue, 28 Jul 2026 18:21:29 +0800
Message-Id: <20260728-dp_mstclean-v9-0-f7779fce10f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKmCaGoC/3XOTWrDMBAF4KsYrasgjWz9ZNV7lFJG8qgRxHZiO
 aYl+O5VnEVqSDYDb2C+eVeWaUyU2b66spHmlNPQl+DeKhYO2H8TT23JDARo0YDl7emry1M4EvY
 8ClcHQhsQalYuTiPF9LNqH5/3PNL5UtDpvmQeM/EwdF2a9pUw0oJV6MH6oJwwJIXXErWvPelIE
 WXwHiK7WYeUp2H8XYvOzYo97TQ3XHB0ADLIKKPy70POu/MFj7e3uzJWbtYPQgvYEroQEKSJsRb
 oPLwgzH/CbQlTCEJRS6nIglIvCPsgDIgtYQvhCUFLH2sy7RNiWZY/JU4jfsIBAAA=
X-Change-ID: 20260528-dp_mstclean-f094cea8ca24
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785234095; l=4913;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=gtymclkuEBC4Gtb94q3hrKBPv0k6dPhp4Zvr7BCSBZc=;
 b=oegzPO8otejUM5f4IcbJYl4OPhMycVz/WsBZm7Vs0UxhdDOBrAhCuXOs0BaA4gslJ6kZNbQl2
 WaG5Fj7c3f7CFiXJFl7KHkjw5JBQqKGkocYi5w/+TV8Jq86a8DR/JQs
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a6882b5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DCnoF1gdW_jtja5s6fsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX0bp4v6WhAGe6
 F4iYVOQBRxrItjXQyw2jXs7IP/k39IB429myK/xKYvsXLCeKu894c1LOrllJasMUz/iuUA2bxvm
 FdxRkbeIW48V5Y8iO5kfLb+lCZGqch/GVVjst3nOnZfFbMnpE/KzXkZcK6HWB+1OTR+6zeiZ5sd
 9r2amm7+/CxyJvBAMSjDJIwLfq5yZ80ytJzWMwSUgs60UTDRnGw1MWMcV983ecAKd71ipDc/doJ
 oNghVkgpYkX1GCXSda9UlZ+rll7J6MewCecSUJydIeU4j0zoVMYaTBg4BHSMOYf69XU1FQg9TWp
 m2a9k+SIaDIXRKtJbOQvN+2d+siSu2r9dczhBh0zY8b2DmuOiorjkbzqtiqsH3chTcOfQOGRROf
 7fVBlDlboJcgq6f6QuBPytmYDaluJuJMAquzP5MtYV0Gds2PsiBy2Alxvd9XMhCvuE5F3/RIXFN
 vxm6FYLqwTKQXIcELlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX9iPpf9aC/GbW
 eTyalMuy/ukov3+Prlc0tWYCvZ1/twxDdM3Z0eqD4DOy7TV3TGgmyQ0Jcdrwzd5AMMataa8X01s
 FCkRgiCCkO+8mD4gKep7lm73awTEZQ8=
X-Proofpoint-GUID: PWOBOHJ57I78MSuYl8LrYNINIiLJG1RF
X-Proofpoint-ORIG-GUID: PWOBOHJ57I78MSuYl8LrYNINIiLJG1RF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280091

This series is the SST-only prerequisite portion of the MSM DP MST
work. It refactors the existing DP code paths so that MST can
plug in cleanly in a follow-up series, without bundling the cleanup
with MST functionality in the same submission.

SST behaviour is preserved end-to-end; no new functionality is added
here. The intent is to land these refactors first to keep the
follow-up MST series focused, smaller, and easier to review.

Patch 01 and patch 02 pick from Dmitry series
https://lore.kernel.org/dri-devel/20260722-drm-msm-display-interface-v1-0-368c10fe62fd@oss.qualcomm.com/T/#t 
and no code change, just rebase on top of it.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v9:
- pick patch 01/patch 02 from
  https://lore.kernel.org/dri-devel/20260722-drm-msm-display-interface-v1-0-368c10fe62fd@oss.qualcomm.com/T/#t.
- patch 04: clear Clear the stream-specific fields before
    OR-ing new values.
- patch 10: move the panel->hw_revision assignment outside the conditional. 
- patch 13: also move atomic_pre_enable from dp_drm.c into dp_display.c and leave a thin bridge wrapper, matching the pattern used for the other bridge helpers.
- Drop "separate dp_display_prepare() into its own API" due to patch 2
  add .atomic_pre_enable() and don't need it anymore.
- Link to v8: https://lore.kernel.org/r/20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com

Changes in v8:
- Rebase to next-20260717.
- patch 04: also call msm_dp_ctrl_config_ctrl_streams() in link_train(). [sashiko-bot]
- patch 07: propagate msm_dp_ctrl_on_pixel_clk() error. [sashiko-bot]
- patch 08: return -ENOTCONN on sink_count == 0; return on link-train failure. [sashiko-bot]
- patch 10: pass panel to config_ctrl_streams() in link_train().
- patch 15: use passed-in msm_dp_panel in msm_dp_ctrl_off_link(); fix kdoc name.
- Link to v7: https://lore.kernel.org/r/20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com

Changes in v7:
- patch 7: Use WARN_ON_ONCE() when pixel clock is already on. [Konrad]  
- Link to v6: https://lore.kernel.org/r/20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com

Changes in v6:
- patch 4: fixed the RMW comments. [Dmitry]
- patch 10: do not rename the existing struct. [Dmitry]
- Link to v5: https://lore.kernel.org/r/20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com

Changes in v5:
- Split out from v4: only the SST prerequisite cleanup (patches 1-15)
  is sent here; the MST implementation will follow on top.
- Rebased onto linux-next-20260527; adapted bridge callbacks to the
  new drm_atomic_commit* API.
- patch 3: added Suggested-by: Dmitry Baryshkov.
- patch 4: fixed "splite" typo, reworded body, added RMW comment
  covering both SST and MST paths. [Dmitry]
- patch 10: drop cached panel from msm_dp_ctrl_private; pass panel
  explicitly to all stream-related dp_ctrl APIs. [Dmitry]
- patch 13/14: introduce bridge wrappers and atomic_prepare with
  drm_atomic_commit* from the start to preserve bisectability.
- patch 15: fixed pass panel inside the func. [Dmitry]
- Link to v4: https://lore.kernel.org/all/20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com/

---
Abhinav Kumar (5):
      drm/msm/dp: break up dp_display_enable into two parts
      drm/msm/dp: re-arrange dp_display_disable() into functional parts
      drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it
      drm/msm/dp: split dp_ctrl_off() into stream and link parts
      drm/msm/dp: make bridge helpers use dp_display to allow re-use

Yongxing Mou (9):
      drm/msm/dp: remove cached drm_edid from panel
      drm/msm/dp: drop deprecated .mode_set() and use .atomic_pre_enable
      drm/msm/dp: move mode setup into msm_dp_panel_init_panel_info()
      drm/msm/dp: split msm_dp_ctrl_config_ctrl() into link parts and stream parts
      drm/msm/dp: extract MISC1_MISC0 configuration into a separate function
      drm/msm/dp: split link setup from source params
      drm/msm/dp: move the pixel clock control to its own API
      drm/msm/dp: simplify link and clock disable sequence
      drm/msm/dp: pass panel to display enable/disable helpers

 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 390 ++++++++++++++++++++----------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  30 ++-
 drivers/gpu/drm/msm/dp/dp_display.c | 283 +++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h |   9 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  52 ++++-
 drivers/gpu/drm/msm/dp/dp_drm.h     |  12 --
 drivers/gpu/drm/msm/dp/dp_panel.c   |  77 ++-----
 drivers/gpu/drm/msm/dp/dp_panel.h   |  17 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |   2 +
 9 files changed, 477 insertions(+), 395 deletions(-)
---
base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
change-id: 20260528-dp_mstclean-f094cea8ca24

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076719;
	b=W8OICzh987Jjv2IWUFkuYgkD2OAEON6UGLqRwXfl7M6ncfkZxNfT/nSoCOggjIVwiseu
	 +/Z+ok76N0k0UJCtNEIQ7uyudWaoZJTt48gbAEUNO/Up14fgo2UtnbY/ELiiuuDMU/4dz
	 sjDmZtGud6rvKB0+2L15c56oazfyE2nF1wTup5NRnTBjMszKxNCXjo1S9da1Pcaw/Ar1P
	 dxrkL/j7I4IbLxqGgBSFCtNkn+lIv1hVjOWwKVEU9q0oJuGttXkkRavqumXnbPMqEuxYj
	 db6Fw8QqeQoqFclvp0Zu/8vyu8ZuIsYZG+KlfUzcreR/Iu9pgqxHwJt6J5/O1uycJAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XOHVnaPKkMDqdaS1cO+52v94uYEDVhjrO809duKaYuA=;
	b=H00qulWKVBMglAB+BYLizwGgiExfm33i76JdAYO2nD70OasWdB3hBnfTLfdrADTlOWFy
	 8cECziPPnwzycF/kMgQdczJd8pPMAJIaTi7AtSU0mcEPG78zmbKYRXxJHjQ6M+9YLUOJF
	 HnIQOq9h0yt+gRzUVINjQZcIXUT5zYi7+OnwHcSWYP9YTmK7RaG4GJ5UUyzkLOJGTMHh/
	 eiXA9MdA8Knqx9KBMNF0naSLxDERAwQi6aWZ3Vf+LnRF/kEch8cBTjaoqvtrx5GinGCpG
	 KzZV8lbLiovZThjLIRZoibGH1gW+HTYoaihwYTU2OCFl0KW0idi4cXk8XXjAUEuvuFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YnTl3mhy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VoGSLDs1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A009606A32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A009606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YnTl3mhy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VoGSLDs1
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ7ZhmK3717944
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XOHVnaPKkMDqdaS1cO+52v94uYEDVhjrO809duKaYuA=; b=YnTl3mhyjA+WWrmB
	b0TzpetdCrR3QHD7F06hokLbFKG3qHo0tsSRK62YREmLrjGtyuk9Y1NKwSGnTx9q
	CeIx2G154Lt0FvblJ50ZigNL2HbrZaD7C4zgvceNY7yxQ7+kZ7RmHidHo0eGOppj
	2sd3W1dPi2BQZgQ/nQM8OQSqbJRyRrFfxi5Zhmc2eDAaafln0e5qJpjqvmxO6Gmc
	2Qsv4hEp4M0UhjxPlCX12DcvNzoojBy4VLcTCJoe7iK5njUzQLmlrNAvntfDQM3X
	8he+I349RdjzJuPLDVWc6/qgPcFLRYOANKwevn2cvTG/+nrf7PjU/MilbUuHSpUl
	lpCtLg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2r70c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94960bd17b5so325655885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076717; x=1795681517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XOHVnaPKkMDqdaS1cO+52v94uYEDVhjrO809duKaYuA=;
        b=VoGSLDs1tN+7KZtzXtr9Wu29/PIdGM2WJSirPK2vhL3D2pch/TBG7r712bCyWDykkG
         0DM6OlmEHXZSOfFdCcqO/oOOLEKIiHuw0ZJalpsaAamilGJjicwykcNiZHZyQOrgsJOP
         yCNncp/+yexACBJBfvycKx8gC9woobLn4zohLETJwWgwlRA7JyNIQE3G1gKCmlPSHuym
         UouU1iStX/6/6NKpYyCZnO6UxO4drNUWA8R9YpmYG0PjboqwdzlLLkbwBKlTTLbFJC4J
         3GNpjcBxfAor9KEITqdb+kphKIm7wu99Wq97+nheC9Ogvm77APJo1Gzq2t8VQJ85Kzh0
         wYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076717; x=1795681517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOHVnaPKkMDqdaS1cO+52v94uYEDVhjrO809duKaYuA=;
        b=S36Xnl3v+oFpJKXMckPMWew6O6huy2WRNrIipa9FSV14yHndB5h7LcGR34QzrAM6AV
         mCQ8/vJsYodhr1qfB3QIVCpHWvSRr92eYQTlvFKy+ojAmQlNPcgHn+sIqDe9KgRDctS5
         EnS9mdalCaMR8sFk15JFAxdLyumfiljllvDm2TUNih/0SLiHmDOkSb7PWfkIBruLt1Qa
         TDouipJv1jc5nRpVJStJQ+a0ZKA9a+ijTf9vXjgCXe16h8Gd1PIndjUAWW5YB4jknwfh
         ik6frmwDYZeLJioEVbbKcSs7HINpVOZ+8v4GudW59yR/US7N6Qkw7tRPBw1yQJpX5Gaw
         V4VQ==
X-Gm-Message-State: APuU4Z8mwuOGgGy7sQ6rZQNPsouuwEHE3njObxQ7NjS1lwBFmn3Z22tQ
	HeSbLCZZ17rI0viafQzLBuN6tF7xKU5znzRleY1cpxqVSerrOcScnZ8r+vayEZCfS96E36Ds/00
	3NWdLgYqW4CwTz5KJnfhr2lrcQ4VVvmk50Mc19iRgYU21Gzfdvot+FwwEoi20t2qZIchK
X-Gm-Gg: AYBFou2EKJco21ricOvIQSJZOw12JgxEksByRxc2wxWjd3avZ+VXZsVp8JdsQYsxsT3
	zhK5JgjbXJoukEoHTBrYEowOFQWliNgWCtQppKSShH3N7D9VdvcYUqPLLtZc2fZzI9FUR116mID
	mqgtcD8R+gK83Z+EGTTXd07o1HoEfpxY8hgTutRu3jL0/KxrlL4JMTcwwX/FnngrLA2yo32Yo/s
	+Q2vB4WifkZP95EKixBY27g8MqgnOk+6bgE4xGVeSSO3dQgeg2sY0vw2UUViN+al9Yet8DCtjVj
	imAZrTA3+L0uXw9dE4jNnC2pMr3tRcUuIGmsNlkpm9/pFN+4dmTKcyfvORy0NOTPaJn/kEfOjSi
	9Ko/12YkAS1RSg4rHnbtKiefAbg7Obvw1bNDx8DzZMM05SYLk6F5Fdesy2OOjg4h+/B4HYZzOuk
	lTS7vZjILkc5pDDS/GoY+vY2+aj5aDyQ4XT3EV
X-Received: by 2002:a05:620a:46a3:b0:944:192:85ef with SMTP id af79cd13be357-9499957e68emr1081066185a.22.1795076717210;
        Thu, 19 Nov 2026 00:25:17 -0800 (PST)
X-Received: by 2002:a05:620a:46a3:b0:944:192:85ef with SMTP id af79cd13be357-9499957e68emr1081062285a.22.1795076716456;
        Thu, 19 Nov 2026 00:25:16 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:25:16 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:11 +0800
Subject: [PATCH v9 09/29] drm/msm/dp: factor out _helper variants of bridge
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
Message-Id: <20261119-msm-dp-mst-v9-9-ca61be4edfc3@oss.qualcomm.com>
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
In-Reply-To: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=9551;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=zite9a3phlMLvlDTVMJoeGqeBbIHHb3A2QWnia5l2xs=;
 b=f15D9QWIaMfx2neuyMuPeJOHYYB/yYwhsHk4U0cONAAgasKxULVSezhlK6C/xijE5eXvykpBJ
 37yPN9NKmZyDBp/EXHF+eiBSl7V09HONFz5wOxKoBKvL0yvnvq35wG/
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: D9kX_dzqXK3gaHCRA25GHckJbjBmyp5z
X-Proofpoint-ORIG-GUID: D9kX_dzqXK3gaHCRA25GHckJbjBmyp5z
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6afeb26d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=10mNmtCk2Ocqn4x3vjYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX82ACP0ByxstB
 4NTw+uKgNUEI2t8zIG4Hx9BxzbnGJbE5j69mhRYTbDWvL59BMkw4/sUW9bYhpQT0g9AEfL/+tOW
 UFm60qlODskhyg1q1K+DCTbohyYCurQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX7BwiusLVAb3g
 sEZVvoaUGxjvkb1H444Xge+vUWPjXM79Wi2sfbJwjOMM0rhJtomGFwq4qF0HmYlTSgGnOpJTtYz
 2ortabwWLnzxaCOcJTuoDAbyQzzqABzjLE8DfXed51QQw/EfrInWXMME1e7Nymx/BtcO/jzu/vB
 Fw7IHMnasMLj1CUN0lGd1nUeH5i4qdJQT26iB9dOLwmpx1LzNKQ4BRjCsJVR9EmnVBvXn3nQ6ns
 /D4EEzfCAFK1dE598VGqd504ZyI++RuuZwAP3oDS9uAEDqd0TGFX5CJe2NBcDMFsULJMfFZtNyR
 drCvSmwzwTl6+oRPbWpo5cV50l5AZKpNPsJ9xPrJKM822muudw8J6baHu07nAiJ5+D7FgQPwIe6
 9W8w2LFpoWy+Qn4IwGib3iv2XOK4bTZaSEeNt9HLtGW/vkJC2N7bRXryMFRg16KWSSy47jPfcZt
 vuERnIfEjW+RdDZhE0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190033

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


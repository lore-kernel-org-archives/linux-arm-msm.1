Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662620;
	b=wmGqsxR/fCsDAcvF/dddwPvWMFT4RadvhyyTYu5vv6cALbm4WvwJNUz8BVTPj+LdhNqF
	 2frUlY5/+YScn/+AFEanceCPmdPlyRMMFrwA2oMDyq/+LbmZoNYxEiyrU3HtBubui2xn6
	 nnPdPv8D+zV1bLi2OVoDWB1k53rK63H/x+AiKWO9ntHHyzQNMzRHIElr0moEOn1O4LoEt
	 LENwzz7M2kow4qB71RxClAuo49iEztyxVvHhsQgjlG3uwvasjaa4u9DFslTyBPXUz840s
	 bUBDkDFsPF6mvLJlOJ4OPDv5CbTIDdpKWLZqwiAJMDMxFXM9PE/waaOWlwNtR73XQ6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=;
	b=htLvuVdRQqDcVXor4AawiJSsbhCbzETNVexJxDmbk9PzmWozV0t4ivgF7mIVzMHACH3z
	 0kLdmHZ3VQK8wlXSpFoFIY9vLnyB5AQHH3RdHYXF3XPN8lRpB8wvbsFHCdVXL1Rpm+0Hq
	 iG7jkwwlEVXtFa9hCz6H8RGCXP4Z8OQNWGM3KX2Gvy+8txqF+adz1LOC+Vppr0p0rFarF
	 RANv8ILz58VvKzFWHhT+JGlpUZIrShSHmgJe+DcObUDiATsW9THWJ8IXJSQrHH5m+HFe6
	 ZZeE0f93o0nes5FV/7cFRKsT0eeg9EYJwNAJeJYcOLqg3UTAbzdWtUT9kPSwQ/pIINw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0p3ZHfR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=arazl7kh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C927606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C927606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0p3ZHfR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=arazl7kh
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M704d93077324
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=; b=R0p3ZHfR2m7NmqN9
	Hm27yZpt95uO8ImcPXzWKdjr79OxiD5ci/ctxpfMM2ZDwVciTAOOsMjAcwThbpgk
	TUnaZZM2s8fYTj+RJearPO9BaFDY382vkgQR9pb54d6cLU4aAirMMhToKUvskbao
	yFcCX1kQ01jWCRg3t8nm0P3R0EwNQlrSP6Ko0ZNVDgmbz1d9veAcyIPfHYRLumZB
	aK1/Y+Q1F3N7SHuoPnJO+poi7VbpsvJGHYOK+jGxiOAkTcTg3heIT0oB1yuvXPvc
	FX9i+yHgFUaR3UDHeVUugycDb5hNpy53+RbCvRTVphQUwQ9FNakP+iG/vtTbeOxl
	ghtZWw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a1s5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:50:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so6031987eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662619; x=1793267419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=;
        b=arazl7khgeOjEc9Z3VWOCp8W6IEie4qDyV5eQi84gv8NvzCua7aDQMVyH0Il4/+s7i
         QtBWZCtCTfgPiLyKJ+zNMscjqSJnVRdBSSAvmxYIls8wvE8lzfE+gloG+J48Xuqd/PP8
         nV6Fa36LGwJBny6s7WuNauOpZ6CQcBGlpQi2J6HezVz0O+Buwz0di9R6T0GHxppvdr1a
         OicvKkyZkmIjlEzgB3ZnMJIJwZ1CCr/jSDQUjPvEaQZDXZwfZbEeAEvuX8ZKpNjkJifQ
         P2C2TywrY4gUmq586FNA7DnB/8oaBiHfjj0V5mSGfEYtP0sTURuVHnxsSpqv0NMBMHk6
         kIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662619; x=1793267419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=;
        b=jGK62fuwcFZ75o5tKSr/V/jmGJoSSq4xSCF06cyEgbWfKSXE0Ojict4W9CWwsOtlv6
         A7APzjYg7UM4JKv+fNOFmAC6k265ifFeslzfbg5MpzgIczOxc1jKxaYcF6Q0meHHpf39
         4TCYVoDF2Uu29WTYhA0a9lH0FdjLZ+3CasKANL82yFrnH1xXAeR0+qqZLZh9XM59ssQt
         etPcWF1/Qtdfuy0Rs006jVA+mj0zo3VrqeRlGLSFoEtH1CCdqFVioVnO7M9ZSNNST1Au
         LsqeUKFggZ2RemywOiK1vDi8R39vFdiCFcV+szJ+Nyq+ytiMa0mJkE+A3PgI+qy7g87E
         U3jA==
X-Gm-Message-State: AFq9FYJBqB3JjhikW2Uk0XsOwQ5ve4EGEh05zqn9tfBI7pQxDC8G/tGR
	imX6wZi1KqPlzCcyHt+cUoFtx0nSJANzCyo464OBedj6Tnxj3ymCW5acFo0V3a9PeUC7rNvc21s
	j4CiP8V0Hjs/qPFkFdbWzOo4bGY6XvGBG1lYq8F9a87uhTzYIsLh8tW6CLdndtxKIlW9Y
X-Gm-Gg: AYBFou1chUJL/R0VRfqgAdoFrTNosYlrDmhrOZvaFzyHbnSUJHoAHRvyDIbVlS5c9la
	8vXmur5nJXWeXS6pTS2zxBEfILmRdUboEfE/t+9UvzBWluPzY/O0bdBm2bNpE1B/uiARLnFYNHO
	0N83vewqg+tusBUgF+xCfviDkbbHFJ4Wvyiurk5pIexkhkd9VuHydhaGim+hx0DbJRyq7tcPABa
	jg6/xPNS/4NbX7zaBTEpSidZCz8j4q+YaOvjrGcamF8nCaKCvOS5N0HW/IJVgMBr4opSaMYIseu
	XGbHAYv7dHqwOYAmpayM+RAoHKei8DDsyQh+D8cKl9yzfMOeKN+6WeteyFU5wPDKr3jXS+J9zVk
	J/vsMlOM2zzIuAiFK4Ln6ns4pVq0Vd/MP7fQ=
X-Received: by 2002:a05:693c:88d6:20b0:366:e24d:a0f6 with SMTP id 5a478bee46e88-3674e93db10mr6656107eec.29.1792662618612;
        Thu, 22 Oct 2026 02:50:18 -0700 (PDT)
X-Received: by 2002:a05:693c:88d6:20b0:366:e24d:a0f6 with SMTP id 5a478bee46e88-3674e93db10mr6656063eec.29.1792662618102;
        Thu, 22 Oct 2026 02:50:18 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm14418035eec.21.2026.10.22.02.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:50:16 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:19:43 +0530
Subject: [PATCH v3 2/5] drm/msm/dp: Add DisplayPort controller for
 Kaanapali
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
Message-Id: <20261022-kaanapali_dp-v3-2-b5ae8e6083c3@oss.qualcomm.com>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662591; l=1543;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=ATHzw5/SdPmSlyNoH0Ua5Hf2It3tpnIynG+5Y/cT+DI=;
 b=AMPRGKKPL0AAlxTb/0kO2ZhkzoiigdpHLJ7uyGg7Oexm7OibvBQOxl9aAiSXGNgikkJ3mwclS
 FY73FHzjfpZAxSo5s5/4S14TNoUhecfT0LIfb6LJXTLk2Lskl5sT5Ef
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX8aI2WQlFTdVu
 nWnsZNPxpaD3Uy0nl6lKs1yZ70LSSGb+knCYEFOvnJo7YI1ug92lbRJ6aeMyAiE/JkJE1z/xNb8
 jYMUw7JDmBBtYKI4f569teI3f0s1ZaOFPHUOiqBLRL3vCvEQNAhUMUpaGVxg/3P1m/qrfEsSQ53
 1n9a0T0XdKlrwNwy5QEGqfQyzyV4oxaLTvqZjUMJDhyKl1tr/HnJK/YzPlA1H3Ee+mE57OK87Rt
 DGfvtuf4MAFbtV0TUS/aRV1kt/e3BhOGUgX1c2wvJ4Up63+9rZtj4xXlTXZyC2rR2SO/BstVFso
 w9L18qPbXvGRHDpdfHNxxF0pkgGQrp/MoGd66G949NghSa1MRyvwqWdUIFs74DRX3KE9EwloGR7
 auvb57rU9KHIJil0cYQsNm70huigeScix9gOZ6JUZ+ujnqLnlC6/5yzDzMz3qoLbWykj+0VG4xW
 1ZVgT4zBi7tydydDm4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX4k3SVQ7/bO9e
 /O9MfxcIQrgpxoBQySyf9ACkWZASPl7F5Rwsdq4OejdjOu7uDyjhI4aV7IZrCKClBE2C0RW/cEm
 bjQuxyOBs3aQo/XEDbgOwNG+zMna5Ik=
X-Proofpoint-GUID: o5mdsSmFkYeh08P9OfbUAIoBpDHJRE5p
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad9dc5b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-Dt519yxSYS-YsuSjdkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: o5mdsSmFkYeh08P9OfbUAIoBpDHJRE5p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220039

The Qualcomm Kaanapali platform comes with a DisplayPort controller
with a different base offset than the previous SM8650 SoC, add support
for this in the DisplayPort driver.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9299ce616fdb..348eb6967abf 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -158,6 +158,11 @@ static const struct msm_dp_desc msm_dp_desc_sm8650[] = {
 	{}
 };
 
+static const struct msm_dp_desc msm_dp_desc_kaanapali[] = {
+	{ .io_start = 0x09ad2000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{}
+};
+
 static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
@@ -168,6 +173,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 
 static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,glymur-dp", .data = &msm_dp_desc_glymur },
+	{ .compatible = "qcom,kaanapali-dp", .data = &msm_dp_desc_kaanapali },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1


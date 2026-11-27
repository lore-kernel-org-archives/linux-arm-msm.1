Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808713;
	b=bIfEJo1nyH+DgwzTk4CCeuNXIJITq9ZIXJsabHfgBZfUHjFD/k/nJPBypuvqGV8vXlHT
	 Tqf+NEub2o4TJDgyn7Rhr4q3lcj7d20e1gFZeLgCRmE+OwhAARjvjDKBcQ6Cg87Y+ewjk
	 r8zo1uV12BGORaNw6phJpM7zdHqXPY2C/6FkE0MDE6zUDQdOQRxiJFjkEc4jC448r3AHr
	 cJRNOYXINBqbkH5NWP7I+WIlpVsUt/CTkI8xidfBSItT1A+qj8ln4ry18P5PnokJaDxou
	 +PT/GiotGm7aw0ZpcKeHXOgr+Xan9Js7S1Da+ye+xImimKs3ncXBtgm2RMssMogTK5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hwNG2bG+XTPWI3596iFZ/msYtqga2lGkUMVk/EaARXc=;
	b=H8oJLIC05+wgDxcrN3AzcFPkqftjuqk58Tr3Hgm4lVhVqUwAUsD9t0twwEQbcPJkPnQz
	 IShmumEGQgEh1Hn7C3KK0IdjeA8NGVlWboh+mVP+v68vDgW9YHiFAKKXIWkBe8NXVd4TR
	 6hY3g7p3WtyD99K53+CDDcGPUYcW++LG1neOcqw41RISLA8xNJCKIMx/FbLuW9DIuIbnY
	 87IWURCYDSYHTbZ4E/IN72GsdsH6F3sDX1LwXY8EA6hKEHnyVivwhDTLoKFJ3TeL4n3Yk
	 uzT41VyuCvmqHZLwnkLU3a/+czW3B94yoN7iVCOUgRVPEitE2ZTh84fd2S8pMHvZ7yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3dc27p2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z4VxJiSO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07E9606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B07E9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3dc27p2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z4VxJiSO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJBT0C3134892
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hwNG2bG+XTPWI3596iFZ/msYtqga2lGkUMVk/EaARXc=; b=U3dc27p2k4VVY2+2
	xMUAePyEVFBkJ/HC6Pyv1ZmJV69zKrong1Dh0D76out/4APji81IMTdOzHeHfiTj
	sleu5T6RgS/gU5kiIfb0jeH91Ql2s4CJdoIstfUwuCqUKWUIVaROcaNeOGBlpzlb
	sO6H0lpaLqXp7TdXjaJbhhJwckiYdswmhUO3KtxjakJHkJgq149zHaF0ccxoJG/e
	3MZV4zNWtOyM/7Oz86lZK2Ed3JsDiUVBcsWG/L0QpmleUlEFIb+Ka9Pt7SP9XGyF
	TAYOUCxiQ/poo9UomDj+Xb7NqUqCFIJSc07W2TPyB75dSfIpTj50PTJgypzSgZZ7
	7vDwzQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gatrv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92114c39cadso151341866d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808711; x=1796413511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwNG2bG+XTPWI3596iFZ/msYtqga2lGkUMVk/EaARXc=;
        b=Z4VxJiSOnWiv4lwOTIs0kyJaLoV99KpB5hBRRC5XL5vCvcBjHh8hzJFLu4svl0rW67
         SPIuJCd4Mhjjja/EZMsVB1gdg9rZ+7I3aOSaYfOKjS6WvVbzFVrxi0SCpdV0xYDdeQBk
         q36jxxC2lEP+RdeeILs5KP78ZQg3TnJMt4bVtvDOHxAAImlppPu9j+GGv/TZc+jYWNYT
         zNVowyVU1fgyQSIoZcpb8A028mU/AjzLPEftplB2s6EjkSEJUU4uaG99SzpuYoGKVFOE
         QcHRD+Dbc9m5cqNzueO/nh+akqFEy3L5zXasmb0L3Ee2WlwCVte8ZP8rQiHfgA6k9zzB
         rmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808711; x=1796413511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwNG2bG+XTPWI3596iFZ/msYtqga2lGkUMVk/EaARXc=;
        b=Lsi/6k5A4NcLOMOzcsirdQplYIGf1ZHqf1QJHXPhlvwhU/Go/aWJCH9NSOMTThqzg1
         grhheg90HuIKqKbXrApjJCV+x/7qOsmBXQz0ahcbaUzgg/bOqUct7y8jSpGA573zh1GU
         mlJ8/XE5Q6XbGw2UiQLreyIQukYItf78NGa9kxNksIt9S22X7v2YW4pbiuETHwk0VEx0
         Qepp40DiGPl+r7OyvgJmc/bmAGrcmU8z0Yz6DZo88HHDWf6cZkZYWoY3NGxt+5wvk/lw
         UGggO8r0KKJjO+qwlSFU1nz3bdqXZEHx2qwHWS4+y8kLWgfR8Dzg223Hm0/24NuMvtoj
         OB2Q==
X-Gm-Message-State: APuU4Z/Xw1iI/lKwC23L+1XmXvYXnjPIsw99D1ROT2EajMQ1pRcjbdvd
	08aM17vamZf9mS3fkV0YQ1LvRHhCRcjTN/913rj6iasOkhRmdxFwPvnhMtlZqWUpgGn7P/w3kwX
	WvhQknA8LwP0cK9pZO7rzFJyVySY8ooFzQu5fn/D2H4N8ijO6ZwtSDpzvNndyzABnFc9s
X-Gm-Gg: AZFdTZcRXidS2W6kceLy3M6Xu1008WoZrXf1rzoYczlNRZW38HojD/4ZNi+SQ0rcH5q
	/tJiUvW78JJdcSypkI7wItzcyV5EXrtmN8I0F6dRZdpIv+xyVvbazROJfAg6ipTeUUDHl9P1UMj
	dhE3UMr2KR8L+GnY4Y1IAy+WRJ7q+vDaWIjGL9zo66yTpyE0kxvs89OlbBM86xzC7Eu4y83Vu16
	dG6FXtPkdMkwiLxMVeaYFg5aiiHVs5lgczspulOf6hLqU9DWqkze1l6lesdNGG6actlmUQTC3KI
	XpAtvpOOblenxtkwhaIwzrU/EI9vp4uGFobVi5H745DSAED0fQnIgX4e0avgwOln6NodFq7nOnG
	YbLpPgjHMaoUVqy/Moyl851Xyv/Mg/5w/ZparsYxz+UqJcf695nElss728XVjVl2wTozWTaHvo2
	1HHr+6r7dJRtO+/xF+YhxGVwTbhinWct2BgQZA28QrGDX2nbPJNS87OaKcTVrLjQ==
X-Received: by 2002:a05:620a:40c2:b0:949:6768:fae8 with SMTP id af79cd13be357-949ba9e160bmr4631493485a.49.1795808710765;
        Fri, 27 Nov 2026 11:45:10 -0800 (PST)
X-Received: by 2002:a05:620a:40c2:b0:949:6768:fae8 with SMTP id af79cd13be357-949ba9e160bmr4631487785a.49.1795808710297;
        Fri, 27 Nov 2026 11:45:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:45:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:24 +0200
Subject: [PATCH v4 11/14] drm/msm/dpu: clean up the self-refresh helpers on
 teardown
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-11-242b0a3f8e47@oss.qualcomm.com>
References: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
In-Reply-To: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2200;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=D/uWkxcvDmXzNDWbOytGgnOpR8lFPnO6KIN97YblHnw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2pv7q3g4iU6+NyAMh9IDYZqTyzPL49qurKH
 qDOv7/cHGSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndqQAKCRCLPIo+Aiko
 1QqeB/94oTDnZNMGJ6YKAksRLJJdpbjeiRB956P/JWKiejc/Vv0hieQseh3gQhxFbGMtXR75sd4
 bURWLq8gHYa2CUpVvSR6Ak+rbVKdFMNP4q0mbAzcqNFnLwnMsJdjm7Qqm7srZh5TExp3umG8hpM
 yIC2hTx9mAzGn5h/TOAcr+Oo8oiX/TRhmAmgthAikS6NVKDE30ppFnq0U4IXAqXpxpt+TGf46YL
 I+gf3vZnC4TwOGNvuLrdwTuEZN3SDuj4Prbn5F/dpv3EvH1cns8o5+Ec4uejqYaMz9klK+rBzLB
 p4nhQITPDG870+P11onzAui0hzHUj6eku9iqLj0euXT/ZQqN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: FwhVchFcDyN_zqjbyiGuBI80deexf7fh
X-Proofpoint-GUID: FwhVchFcDyN_zqjbyiGuBI80deexf7fh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX5WArTxyvE79i
 ZEAb7SJIBxPlBI7a56Q1QhbB8UeNumXa1stQvHoGn+m7cbC43EF5N8wfsYQBkjQSSaWvHE8oT3J
 Z39yj1dmuNAb2aEsJ6wtdy2d+oeT4OCLgI5CpEdZaL2yoK+RVfnGgnYoukywbA5NlkEcpDgigei
 /dtXs1gOOYyFrYHT5TdESBRsHufJNdmk1w8puv7fPEBH6HtjIAaXKCbcXAgm9cIQEWPCwdDx2vc
 v0Vg+escyS30nPCxknY3C7D+YChTpu1GtwAAyvZSh60yXzA8R/JDqnttM5nWkPMBmANNe1aCvOr
 kM33ZmSoxuHNpxHhJ44R7r1UvzBffKVn9fsbGizDPpr83PkRw4ATd3ZDWXcRZNnsjtYfO3FaHut
 REG9r2CTUsr5oGK9hdTH8QHDGt87ougxRncUSGmnNM0X2SY1bu2A18wEHsYYCspxdv+OTvztHH/
 7pc/mFaquc2h7yb108A==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b09ddc7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=r-hXt3OJkovplFG2WMgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX4CaaLg1tLN2H
 hqharV4b0Clun9pVsjyrRbHzHAVnQd7fZ2p/7BJNjLpKrOn7k360Yeq6dQPQCKKTRSGLhXfbkyv
 yYtfGUQbPSnEFC7SCg6WUYBTgyN+gB8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270078

Unbinding the display driver on MSM8996 with DPU oopses about a second
later:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000870
  pc : drm_atomic_commit_alloc+0x10/0x9c
  lr : drm_self_refresh_helper_entry_work+0x5c/0x1dc

dpu_crtc_init() sets up the self-refresh helper for each CRTC, but
nothing ever calls drm_self_refresh_helper_cleanup(). Every modeset
commit, including the one which shuts the display down on unbind, queues
the delayed entry work of the helper, which then runs after the CRTC
and the DRM device have been freed, and its data is leaked.

Clean the helpers up when tearing down the DPU hardware, which cancels
the pending work while the KMS is still intact. Doing it from a managed
action instead would not be enough: the DRM device, and its managed
resources with it, outlives the unbind as long as userspace holds it
open.

Fixes: 1122697810e5 ("drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver")
Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 65ba8fa697e9..934ba47b2dae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -17,6 +17,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_self_refresh_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
 
@@ -885,8 +886,18 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
+static void dpu_kms_self_refresh_cleanup(struct dpu_kms *dpu_kms)
+{
+	struct drm_crtc *crtc;
+
+	drm_for_each_crtc(crtc, dpu_kms->dev)
+		drm_self_refresh_helper_cleanup(crtc);
+}
+
 static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 {
+	dpu_kms_self_refresh_cleanup(dpu_kms);
+
 	dpu_kms->hw_intr = NULL;
 
 	/* safe to call these more than once during shutdown */

-- 
2.47.3


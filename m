Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D979D457E4C
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122612; cv=none; b=dJdyZsNgo0m1VxpBtvTuSJ/WXdn9IrmhCxv298PHz4D1vTlTtnWutAP4lPeLX2tZeat6R8EuzuuloWtOyI8Zj6+ERWxJsJ7L1MVEou5IimNa0vWFyk1BTNlxKzGzJOC6chvpbPtsgDZU2AB1aSRIXJo0KdW1g3XAKTOTbCjc5go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122612; c=relaxed/simple;
	bh=/YVh+L5neHC3SlylyZSkY52kedS/7Okrqq86t4o1xdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JpwwPSR3jOtkU899kG4q3+vOcmMs4BIVX/1ttNfl7zgiWad6p5edZN93HlHyXjFaiaXJj1fiLgG+Hkeg8lkPDI0zEEXqYF1idqyM0zr+mc7HteYdHs4H6f3C8GIeBzNvUpKd/EVqLKb3X1qxhxq0ypA41ibXzg7DXmyxRjNn7Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QpcMViXt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=egUnAfs7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QpcMViXt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="egUnAfs7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kbIm2831842
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vizWdKJGFAB1HJu6hwMtO5oQyxT7j0M+cp6kkFJFsqU=; b=QpcMViXtCHLe9wrc
	kDrACOjs2+E0IpvU20o4U4GUtWh9ZQv4PMkD3P1LO0sG1MW/n+FZhat0dqNFNw+G
	gFlE2g2zyPvb1deu/k4a6MG6GKnDkopWlfedJrKOvO2AWNmsnFZ54+Uiv4wH5/bl
	8fGXfMKhWxJKQEiItMfa8xZojy1/3Rb4AoFrRujmvW2Jmqow06K5ZYldVWJ4HLZo
	FfeBbD95EPVDlBQUw7vqX3wSaUes+A6bQvTcKXP6oWvairkRVEBMN/IyAduD/8++
	GIgQi9kYcwDfpa0vvG4lA4AfwN7eAves4zyRaU22IzN0gdVVHmmDc0WtFIP01kpZ
	yJegSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfgwtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:30:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53088a3939aso18588351cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 03:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122607; x=1789727407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vizWdKJGFAB1HJu6hwMtO5oQyxT7j0M+cp6kkFJFsqU=;
        b=egUnAfs7Rctvp7w1BA3RJwS9n2g+lo10285lZQn3tKrdEcoB0gm43pPb8nRbXRasUK
         aDg6taNOEcUSFDnBqqyB3LMNhUoZN3Ga46K9VSdawgXSiBZBbF4YTjuhEsn7w4juM6L8
         Q0bnb9dZ3Oxih7kIJszYLjm962GJDjm15mNCUBRVmo8kdLsaU8DZSzp4N4hHxkFIAmLd
         5MT0R14eKkMtym27ALFghpB0XJoHfmHdlIFOrf+W90+yS4kjZ/i3dQjfsbj2QnNvtJyT
         zdaN5vbZkNokhPrOGcGaU/E9UIlKhCeIpvmrM6dFJCByoKUJLvXhlxJ4vWl4EMiHA4Wd
         GGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122607; x=1789727407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vizWdKJGFAB1HJu6hwMtO5oQyxT7j0M+cp6kkFJFsqU=;
        b=aC8ieZUD1vfQbae03DD/kJi3U4l1zTT136AiG0sfOAjuqDNVpZ3J5eccmzqKenBGrY
         3MzEeH1RV5tVLYPttBlFo1pQckjwUvxJthKodNa2Fo/0eAvJaFLzCnY9UWxG7W5uUsbc
         otullgRnd3saP0POJnY2kULI6PjTN6L/pxH9BSUFbFU2AQjeb5PSJqCq+8RGzro/35H9
         uGZuim/G2eJsXAHJYr+pwIBnVuOjHNaXuDEK7P7+UKryycSSMOzlXGf5UI3NLj3vzccG
         NNL+IN8VXJKs/+TdO3nYbUvsv6F146QCqM5joFxt4nj/DLJYhdkXATAxVTB9TKlpn3H1
         06Lw==
X-Gm-Message-State: AFuF++lhg8xzvO2XsaZ6qnVPx7NVrrLu2KU9TFKqqNaVhaD9vKCKBb6V
	WFJmseuLKa/hd768gP5spz5kBmx23pjrvwmwadT/MbbLdmydxvY6dmG4Twz/S50wOFEGuYGBlxU
	kiVMbFpbJGzTsQNDpahTvgdRRKXhKYM8KQXqS/Gou/oCsUEiP/Nj9vgscrPsXlfLHvywd
X-Gm-Gg: AYBFou1F4T3hNfRYjNxEJtpugWLGAxmgwTIHtMx/Fhq2M3l4b2+TzaFV+xX4WHc1Xbn
	3RRGeTT4s2u+TuFsQ0cb+8UY31Nrh5RrxDs3rssxGE4TX4RtoBa4vsfbNNFLtpI6suJJTDAYqpi
	vYUSfZaVojMnfQ3NlVmTEsVzAA8c2QEKxZLsIRe0S5oKjwedsyOcLwpvzpNyWC7550QVM1nU6jl
	fbJ2B4u3JEl0/M1g+nHjR3X158yV+j6POOlXQwgzWWWJeQfmhJkOjQMCqpwA+CVKz6KCNz1llz4
	2ZOkZwTJiKrnzhOqsRnJ/j3PQnrZOFLLfWqSRlJ2UgPZONDToGe0G5wBEYj2iAsfxHzK3aidmqM
	hINIUzxHeWGa3BAE93Py6wIs=
X-Received: by 2002:a05:622a:4184:b0:530:b2e1:2f3f with SMTP id d75a77b69052e-530c8775a20mr54665791cf.54.1789122607401;
        Fri, 11 Sep 2026 03:30:07 -0700 (PDT)
X-Received: by 2002:a05:622a:4184:b0:530:b2e1:2f3f with SMTP id d75a77b69052e-530c8775a20mr54660751cf.54.1789122602244;
        Fri, 11 Sep 2026 03:30:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm38651965e9.1.2026.09.11.03.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:30:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:29:39 +0200
Subject: [PATCH v4 6/7] drm/msm/dsi: Fix indentation of if block in
 dsi_mgr_bridge_mode_valid()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-6-87bdb9f1987f@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=859;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/YVh+L5neHC3SlylyZSkY52kedS/7Okrqq86t4o1xdw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9gUEvxbxfeqW8YDt9/GLaS5x5T5jcZJa3s+8
 kkxvK6JiJWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPYFAAKCRDBN2bmhouD
 12WpEACOzE9Xk7yADRzq2MiKw2PpOehQm/+4vq79EC+vwMlvAPXnG1cHwOpJjW4JG/MW7wcka9U
 ZIWaWV/x2hlkOWfBoSfGck+VdKhdu9ZHotftqhFQhA4TbtXAF+FAF51H/EXSOrXGJqncVGozcqI
 a0d2yls1JYtHMLKtrHyjkm4wfWUBEHOfTd1umg9NknYdN4AJdce5Wh1ZXEt6QE8ZCr+FSgY/yJc
 G+1LwWO86s4vHH79ekMlHSHoPh73u/826IVeoL66rnYXSaWCmE1/Kid7HX7yYofPACoXzdWsxMB
 E44pnSCuE7u04vdOkLLWlB5lA/yu70vHKoIGgr7sQ4CleVkk5ShUmTLOBm66kSOKGJZbpd4JRED
 D2VswGZIbyGDtDG42Ucz6pj7E0+r6b+FTwSw8840tqy/dTcMqGN9BqQ0oTxL86XT/GlfXFmGgnw
 Q5n5AnVZ7ZLVaCT33OS5A6ttBx89BC0KL+NrZDzOIdzaS5lAet+ZMg1B0MeBggIBB7Vk5xTfi7h
 pjs99o+Uh4q95rm2e/NC0dJ0RiyJYqv1oTY4SjbfOAuTspTR8Bgmf6m75jvgrd+TEmEchHNMTew
 +spZLfv36eHkYxcJbMibKGE09WVIHoeA6NN3FYmj+akkkeoAYbSynF6fd31mkuQ9PAzpjxcPS26
 E+Qt1a/qixu5ETA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX0XdkJzy1OyRB
 iDDx/87dsW/OhoNokpjVBEqSTuKOFeLdMsKn4H84hXKLRPZneVJssdnD6ogFUd/Cy3DQtD/wt7v
 LNNzdfR5UDKG3ZdjuubWOQCQJC9nDVD7jefsfrZon9bgS534f8FWJbBgn1j8YgrulscttWp6hTm
 JomeHWF8fAMWNlFyGXHjqBAFzIHDT5d7YPr2DZuhD9Y2P3FDpjJBfOMA9nxOr+QmtmNSP90vF6d
 mNRK8Kbl9N9e7ldjSysvWf9Z1pwNaZle12AUk58wPtrcXROYOl9LSK6924bJVRthdPOkf+VqVyv
 539XfCphbT3dx1wmPsgXVivkpZ0S4Nr76JO2R6Cv+p1xgx0sq4yhjNHoEgbss7gSzdxaBUugnwX
 vRV2Kx0JTuPSjFYOpBUQz9x1l0QzTkGj3k0Su5b1PSyHB4c7f0sosgFcAUi+teFJfB3MgkVpRnT
 59YJ4wpiL14Xx19zAEw==
X-Proofpoint-GUID: AcmH-dVh88Q431rCRG_pJP6h-uA-s00n
X-Proofpoint-ORIG-GUID: AcmH-dVh88Q431rCRG_pJP6h-uA-s00n
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX9sycbjGLPH6+
 7mo760EG4ZtyV6uWLkLQR98SClLU+u5ShzHkvnJepN6+UwPFcSX+lrPdg6eapQ62/PFNN4h1CLZ
 VW/CCRzF5dpJRfQOVINSyT2OF3PX83w=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa3d830 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mamL7KDpJlut8y4y1IgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110146

Correct confusing indentation within else {} block in
dsi_mgr_bridge_mode_valid().

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 959daa88b1d0..531d4ff78f56 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -429,7 +429,7 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 		if (dev_pm_opp_get_opp_count(&pdev->dev) != 0)
 			return MODE_CLOCK_RANGE;
 	} else {
-			return MODE_ERROR;
+		return MODE_ERROR;
 	}
 
 	return msm_dsi_host_check_dsc(host, mode);

-- 
2.53.0


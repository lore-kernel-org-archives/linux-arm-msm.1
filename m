Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498F13A7F6E
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 07:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851472; cv=none; b=YBa6bQJsY9DCeyActv5DYKbT4MJOLX0fJLTQFdGgCP+sKqSSV28qTRPPPl6DwyPM3cHmhCdP7l+MjtLMIs6IPoULMWK0A1KXTnzjzhAdnsgJ53p6iVeM1WvS0YrQSJ11PnEozu1dYbbSAhQ8s/W/5TpUjseZ7NAWkWmNzoYI+d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851472; c=relaxed/simple;
	bh=NIsM6HvCeVJ35nWFFLJNWwCPf0RLm8el3fb5T4Hse0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOUqPkiMEWZEwCCoDWUdC35woM64lWJ2ToIVjVJr1JNFL0cNp4oE/z1t/HsA9vrXipV4oFnYm/SL2JquDq47f73/jAMqXAMtCAxPabUR/zzbloVvYi6lTgz3dDesEXIurRUHCw/vWoSGm61tsY+f7e3lmCJjisKr/Y+B8q18Vjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8Xz7Zdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h46C9GOJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8Xz7Zdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h46C9GOJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Lcxx3299120
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 07:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q2zFzzLUBztHpAlThCWGXoxQohXTYyYKFSjILxdt7DI=; b=A8Xz7ZdyAkeaAwLJ
	6UJTfNONpzJAFMrh8KS8KVLccPftP/jj9BYeLN6w3C5lLW+yU05kyDq2M+Q2x7HA
	wffZqzsPYWTHg6fBicjTyFwQh8ptakbow0VCAy/m8ElHElu/jX1xtOrqY9Ql2lHn
	DELf51Il/pj2k2HTv9VCHUnK0tpHJ97HLJj36obqum6KySg/QhMyM2S4Vg0isEY3
	whyaf5Q71MJN44Z6U0Hm9LVRk0PLMaGo9oDs0fxiP1v6tsth7TF/jS1jHjkYMNzi
	amB6BKRO5jkeFlr56FacfVCHu4kabvoklPzO0X8HOmICs3iFkmMuiIQkWFjupB0+
	pSFm/A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0p8mwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:11:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e7db8d191so96454576d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 00:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851463; x=1789456263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q2zFzzLUBztHpAlThCWGXoxQohXTYyYKFSjILxdt7DI=;
        b=h46C9GOJKkGWjaSd8SU2dUE70+ltaQAm5IjTPG+F1Zcc1AljTnO9Nl1aVCBWmOdKJ8
         cCn2LUxWECYMu89Auej1iTLXibJzXHVK3hCvwvhIvwga9E614x7Q1uX2B2k7PdxfmzPL
         DfyYyRKeeDhpky6BIoGqzI5Rlmpy8U0ASm1jwk2VIvobJ22pBrvp+SVSiPTZPRrrEJAb
         93Ua9rfk+ajLI/Was9U587M4kvN6nTYxTwUamM8pUzzSFZE0FDBsaIaz05VijVLYxgpN
         InEG7RktySbWtxpjJpCYQye2/Eqiywp1ewwWt/9ZPO1nB7jG6R2wir3k2Qi/mVRzQHps
         l3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851463; x=1789456263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q2zFzzLUBztHpAlThCWGXoxQohXTYyYKFSjILxdt7DI=;
        b=ESZmUvaACUNom0vqeXLU5He3lZRev8J52/D5QftMCeaULtQZ6YknMqw7KK9o1L+pjU
         LpCRgOi1rm07IVSY02rMeou422L+jtaYYvany8fZ1sKLEQny9YLo+Rvcx+nMh4mcZ5AC
         CTckPF/yvt9pzfGq82bZfGlpFKzI4OTj84rbENNSSfzab1ZHz0mzGtdKErBComFbuNEH
         xmy7s+c4/2O4O0CIKcqw45xPxhI+VVGr7GZy04E223GUrTGE8+blebXhijRMFD/k6njx
         x7Hi+krn/ran0FN+qgvLQQN28bqrfeuuBBmQH0BbiPmkWhjXYAp+BWh/8rvOc/gIqUfr
         VRBA==
X-Gm-Message-State: AFuF++k6L0vNgHs24pp/5SHucmbANtO+ANbW3S0xvtPH2AgmMmQ7NzL3
	mWhrc6Ufu5RVmFNVkpxTl/dAFIrE8JQ6XOEI/LX5qcbCFxmvBqEa7fQ02a/0c2rUX60bGzsXU+A
	AVNKye7sdyQm8Did855vzSW0vol5IjMgSpaZb05rkEDY+YdLNqxLog2gzHNioYYYOQsIE
X-Gm-Gg: AYBFou1+2NXqVy6/Rqj4OMoSBvtQMQaF+BgwOGBq9nM5oCz0D+JARJmPzr695H/TIqT
	O+VHbkcEz+am3TBbVOs/ucexi07EQurimtnKyk29gMdpmdYxLy7Ri24wlXriwkqbFmG7Thwx40o
	Ava8Aee562jZs7SoiUp5EUMnHkKFmFkVkLiyBlu9pi2/JrD1ftqqBKEFgvTSVafSLyN8uJftq35
	upbPxw25XXaq7wXJOUlb0PqFD1icOOpumEaXIAxUIf3PYDPlR+J0aRUhsXmAmlmhy68sXv92Sxb
	oLvzADHhyiEpfvnugKzNgEQ7VF3BgB1ZnL7kDLeCiJYo0HjIjMDpx+ZOvreNBXFWxt+0wrJXAEK
	+bkst1X59fMmdRsIFh0UXvfE=
X-Received: by 2002:a05:620a:3941:b0:939:c0b3:6d8e with SMTP id af79cd13be357-939c0b37c88mr163059385a.30.1788851463487;
        Tue, 08 Sep 2026 00:11:03 -0700 (PDT)
X-Received: by 2002:a05:620a:3941:b0:939:c0b3:6d8e with SMTP id af79cd13be357-939c0b37c88mr163053785a.30.1788851463045;
        Tue, 08 Sep 2026 00:11:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm453173805e9.1.2026.09.08.00.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:11:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 09:10:43 +0200
Subject: [PATCH v3 3/7] drm/msm/hdmi_bridge: Correct poweroff/audio cleanup
 order in post_disable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-3-dcf8956878ca@oss.qualcomm.com>
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
In-Reply-To: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NIsM6HvCeVJ35nWFFLJNWwCPf0RLm8el3fb5T4Hse0k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqn7T5bK0YomfryI+UZIU9Qa8Ma7aQK72X//AJY
 Ac8FAPhtiCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap+0+QAKCRDBN2bmhouD
 11jbD/oC1+H811NF0TnKCwrr0Pqpxtgsk21hz36/GUYUtCUHvz7fDXG8dmh7218pz2qYSqvoC88
 Fs0i81yoVdKcsd0TNM6v5wPYMk7ec2+scAC7KgIrxiupAFdnOpTHSLaGrg4HdnkHEZSKAkk8uoI
 XptY651pioNBvNz4rmjACNZU2Np44zer8aWXSlGtz5vde/AuYtqDAkHL//3d5Ql3NVjfzWm1rUH
 YIVqzbexMaV/wvamlkAtxr7J+2/el42mgj4PTMLMObB4peGbMpecUXzOtXtadDO8Y/AXMiwiSVX
 Y8nIO/GTvvtkIwc0MJseXE46JbLdt8gQngmADmIABFpJ4JRoa8zZJm+G/1gRVXxauruqgfmyTZh
 gj50iQGe+1Fvl+2vQ6KZ6L9fzJLmoCnrxRu9wAgDAcxeZWrjcW8FiUczqNBffcDrvymBAcjmSe7
 cMXARBgZdeiu36dNcnfIOXDRftZ41cDfZtsgl/UTGDhq7KHPIKytwwthb4GCepicVpY8Dfne6n+
 NoCD9oQCo02I2YO6Cqo6YEdIZIjhhC57rOmqcyuthO41K73DK7R0Oyk66aXdRuRLqSt89i45NUj
 2b9t/EAon0M/ik/1j4fqZBCedG1Y8BVikzqZCjMBLmzrXdGS6V+QegloQXByLPIDHn+P8CIAnxD
 4eAOjPmEhxoWy4g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: r9wCsb9sdLp4voGfiZGJ8TVgxLHibThB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX1Ek1clHLFAGS
 5p9nsYBo3HOOKwHTSC5PWd3yxHiWW7g5ZJXBDb2VHmOYCepqD3AKUwuqdWrR0zDAi3idhz36ra2
 d8cDnOeYXJPBaEQUiqdZHUVZT3lqMCA=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6a9fb50e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=agfB2vzvzBSRJA4gfngA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: r9wCsb9sdLp4voGfiZGJ8TVgxLHibThB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX8WVDxwAP16Qh
 4632ycbYwErRNnSXUCy2fnmwgYTznd1WX2eDPsIoUH9M63IlTu210t8ZPQfj7XxZADv/a6coVAz
 iB8WnUrYQKyyokuhg7g8sldqMRKVlHYlSWa9JuY2zwK+nAzr9q+vsfEuLGrPQ3V2hNBgE+wOQS/
 uCnB4/eYtwKDZPxFejIB2v27ViEvxOOMucRicWstvBwDo6GyxLZg7ifgZjeyku6i0kGh4ugjo+i
 tCnRkYAt1fABP3lCNCvzilZtOOLFp81eS8EoTZH6jemCauS88r8Fcv9Cum29Ap7tGJhyHGkuc4l
 T3N86i2AcoRkXZLLgOg1TFp9fp1SCD+T6W82B5kZEkGDZJUQjkQxvWURdDc105lgbYnGkWcDQkW
 aEj0B5o0Q/tFydl8ojFJKlOn1d0TqRSZhXXTYti+gwZzn2uJnPgQ3a9GFIepEwgpi3wZNL9btVH
 /7bavWkzSGtOnkdVRiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080072

Turning off the power in msm_hdmi_bridge_atomic_post_disable() should
follow reverse order of powering up, not only because it is logical, but
also because msm_hdmi_audio_update() accesses registers thus block
should still be powered on.

Depending on specific timing, existing code could have accesses to MMIO
of powered off block.

Cc: <stable@vger.kernel.org>
Fixes: c0c0d9eeeb8d ("drm/msm: hdmi audio support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index db85400e574e..1860605850c9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -339,10 +339,10 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	msm_hdmi_phy_powerdown(phy);
 
 	if (hdmi->power_on) {
-		power_off(bridge);
 		hdmi->power_on = false;
 		if (hdmi->connector->display_info.is_hdmi)
 			msm_hdmi_audio_update(hdmi);
+		power_off(bridge);
 		msm_hdmi_phy_resource_disable(phy);
 	}
 	mutex_unlock(&hdmi->state_mutex);

-- 
2.53.0


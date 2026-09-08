Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCCC3AA9E2
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 07:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851475; cv=none; b=VCWX9YTTF2A2vEVg5bFrzf8OTQ4B9kMerK5SAlMFqQmEVV1tElsrcTeBd4KdQZniVMNnBxi7o1OoE2VnKJyGXg88c0nBc9sbDoco7zx8Ks81cITDxcJHEykjBsZJNMF6HFNEVD75TOGM1S5sq5nwbLJV5o14czBqiXP9z3I1mpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851475; c=relaxed/simple;
	bh=/YVh+L5neHC3SlylyZSkY52kedS/7Okrqq86t4o1xdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T+IjlndoVgdCKTlLhmJ4fCtNhhOkO7gRSv4DUUAPuW38U28y1wgAlhwMdKjI5hXCsF0qYnz0yFKi95SZRNiURhEjn6vm+/zTsY+87OnhvhBq0lbCgmRj9cCi7P1sCCmib4u6Ow9YSTkOwjL/RS6IKR92MTmpRqTNau2XJLLblxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YWd3/x6x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGJwL4Ur; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YWd3/x6x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGJwL4Ur"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Lcex3299064
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 07:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vizWdKJGFAB1HJu6hwMtO5oQyxT7j0M+cp6kkFJFsqU=; b=YWd3/x6x6QElHoo/
	Rq8maYDdWwher25gq8UvsH8W3wFuQa2RmH2XzDMv7K+tGRdHf+h/8twJl+GHU9iX
	0wo+M0BLuKh4ph1BU/Cs535nTfu/LPvk9838UwAuthFsajWrjnoFr0xnyJufpRbb
	lNLcmkcFHzsE9um+ZgFk3o0Gf3sFU1USjsx66LObA3v4XL3Q1LtlZboRnN1pbpc2
	iBNI+ptIRh+kST4EOJksRqykPVxq4Vbc7QwPYQOdbjzNcYaw4UUFmW9s2m11Mi9n
	OB+zwPv6s/G0Rb4U0J6u79i7zHLwu0cfLolmLYHeSrvBvhX/FiK8QF49ajPvmwh4
	VKWIkw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0p8mx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:11:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939665a1ae6so420998085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 00:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851471; x=1789456271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vizWdKJGFAB1HJu6hwMtO5oQyxT7j0M+cp6kkFJFsqU=;
        b=aGJwL4UrBk2szHj6KgAeBTvx5ov53W6AZM8s7JEJgVqSyZCm31ShXbycxKCDxsXdtA
         QyWtDTHzShYnV3ucrwkRpRMB+AFqfurL36KakVK2PGteryPZHVC2X0hs6CvGnQpY3MvC
         Yx7NmQHna45606+JYjiJ3Df0wTDZQytSTD1Jgronv2Cf1kQbuiduIUWwe8DQTSoLFlC9
         jVHmSrEhGmcx37jBsbny904TjwIm8jf/TW6lvA+7v+Gok73WiV4LQeh+vz73QJCKJQNa
         vyeH3DP5J8jKJfA/LSeUqFXqMkVk6pfVPEm8Bcrn5ldP0r9k93KZVB3xK9oy8QSn9o3W
         DBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851471; x=1789456271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vizWdKJGFAB1HJu6hwMtO5oQyxT7j0M+cp6kkFJFsqU=;
        b=D/84Hvm8lNLWn3Drjk/n2auHDueAXR735TK57RdVaBHRBal70cACze67FclwhREKIr
         HfWH74py12z6C17fz8fqnKv2CLsM73q83qBtQSI4fzSQuSQoajo4eV/zgT0L6U7UIIPE
         oN2WCvAj5sPSJ0dqU3EKYt8HaZbMWeNJL4I+YeCECfPu3J+HGBwTRX++fH0LFF0Aqhk6
         eHR10xAPSMhbbZ9EPgJy7G3suCjapQ878+8DbclJ1/nMnPTl6S/LKlGZF7+I8kTPqDtS
         FBsF2feypf5lZsm9PpRLLqiLcK1ZT6TvWVHnAb/ti671QrHutL+X4hFXqyaHfLWbWkKg
         NpwA==
X-Gm-Message-State: AFuF++kjX3tm8eL9xy+/KWxutS7Zgh+sOE4eSwwg6jwm5iuQCECrqYCC
	degXCKMA51cHz6fxrYcOn9DeKXcVdutnTrCnnSnpxPDLp+D3vXd1L5YEGuVxMNozDIFt9DfNHOb
	IQXqiHCWpFpufk2l+nmuKjhsw1FrsiWCCUeOxnV21T/zLGiQPk+3WUVxCcPE6Y7n2nK/X
X-Gm-Gg: AYBFou3v8Z6MLRrdTQtyzCZsQrRKXfj6akpo2lPrMHtpi+seKfDlL9+BNjCEfn8d6pB
	8YjRRYmeJivRgfWMV8UU+LeWQp9b8bnPY8Qyo6ugQBSQVSD+7fsWtxAAaGsr4Kbpuubkx+OTAHZ
	FDdZgGHFI/jMAxFdT3TUdPbtO74sms0pXan6iJrDoW6fEnBsOo09H1Mupd4rdEhDUbv25h5lEEo
	kSjF4fwjnNTXm0R8gMVRCQg0nqHYPXYVfsgoGC6bN7GtQI/uSySa2rhfDlbB571Pg503puoQua9
	e5/yjGmbVm5ePs4UGLbIZN01t+d87yVCryCyO4GQphup7n07pikvFBYIEYLdF9uklm301ZIiziK
	OwlB2rEPDGXBFT/91KOFPL5c=
X-Received: by 2002:a05:620a:404c:b0:939:df5:977c with SMTP id af79cd13be357-93980361c84mr2939058085a.19.1788851470953;
        Tue, 08 Sep 2026 00:11:10 -0700 (PDT)
X-Received: by 2002:a05:620a:404c:b0:939:df5:977c with SMTP id af79cd13be357-93980361c84mr2939053485a.19.1788851470435;
        Tue, 08 Sep 2026 00:11:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm453173805e9.1.2026.09.08.00.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:11:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 09:10:46 +0200
Subject: [PATCH v3 6/7] drm/msm/dsi: Fix indentation of if block in
 dsi_mgr_bridge_mode_valid()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-6-dcf8956878ca@oss.qualcomm.com>
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
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=859;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/YVh+L5neHC3SlylyZSkY52kedS/7Okrqq86t4o1xdw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqn7T83kk1ueDOHgN3MC+5UmBLJIc9NjJCJ5Y7N
 DmU5EQiskSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap+0/AAKCRDBN2bmhouD
 18SDEACK4ZXwaPj6vlMd2riLCLR4YgeaRdhNMnQter3mdIFjzJ9Fx0TqmUYCGzTgr9rOlk0jNSQ
 Hnx7vAlVwuwbioeZsA5bjMNPXGw3VwhJeJoAuc37uDcKqyQSo3RLX4GSBkpA8HO/SBrmUfyZEXb
 IdSq7wjCudqZpP6sQk5pphUO+LkYKjmpe6N0GgEfIc33FuG321rOGZR5ArA+9dnIX4k3QbBAmcG
 rW5KiumnjA1tjnisiypPgxRV7b2bkRc68jBTjOGd3TIYSNp9+qZfhDzCRFJfrOCCPQ/1749e/eC
 FT76z4ygQB7IujEvsVO4qMDYmb+orXblx0lD8pYiO0tdT9DmwldC8gfSuzLocovqOMQrQM+pET2
 LsXzK8WiB0DzeBhbYBDBUqgUILlNI2pMEofo0XIE8nhZfw8SOBCY5sLjBjP74fWjXWbaZPsdksc
 X53CyPj+sPfLrwbXuhwYfPuSC7WPhEfMxMQQPEdfRUvJZxBq1L9MkgKSBLTK2yJNsQMOe36I+Yj
 EAcBpdz73gLIY+KaBK2MwfDTWuF2LRQPKUrwmBCLFG4URcm+mvgAf1azEw72xvq7nu7MxjLcxi2
 m2GopMOFMiJ0O/vjEu23P6XqZMKPPkqQYFd417E5C2PTlmSSalZxeQ19mkh+iARDvS9e4V90XpG
 2Bl4iljfW42V8DA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: Hzqf46o4pS7gsJdZl1s1J1GvIERfMfSo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX/0ctbWfMSsnw
 AyJT126lr2KFPpMYd/8TobiJCjdHwaRZmwV+sT6A1JDIxnHGXQmpbHnjyeKJd43RnlyAibaYRy6
 oU2JHEjyIzz0QoWR59Rt5/8eoPZLHVU=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6a9fb50f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=mamL7KDpJlut8y4y1IgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Hzqf46o4pS7gsJdZl1s1J1GvIERfMfSo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX3mtJCZkNRNuf
 l4GjSbGTaWaMTPuKJXGQqgLBAx7P4Rbmg39k5OOcSJac+R9A/81TRUohvQtIG1sV+YZR71V0S6V
 hF59Ee0aEvNFnBYdDY2XiiBpNn0DCDnR5Ys4R5NauOcgSj/46nBFxvM1uJ5fJ1VdZcvbEYip54e
 PL2oeuLi6tILzBC5mqmWuvLPTVwuRF2OpJJRyXey4Sa5nj14vSvCptQUlHcFZkqu+tmoQEIbFlL
 1sYYO6f8y5UAsX30tp/wrkvLsMLaIQTjAnQ9Uj5NAAIuKnyiIKcuSdqub5uHtC/g7XeFgcFv8Qx
 b1yKbT9jnat+Z5l19NSnRDV0FmwQJfKfZ8qpo2yx/PIYH8rJhBI0+ZQz62MkgEr1Kuv5MEXLswM
 JjkoM1vMDEHqsAd8+A4P3KzbBrahU/AOexFiQ9If3OQ8UqpJtJN41RU0Hcb5aZlVHtBwuCYjIqR
 mwzqmz1jtEdVZ/fjORg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080072

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


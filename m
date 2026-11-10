Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286588;
	b=2b+V9YLjYr7+9nKUT92emvYAYj58GkubGPUX64Hq7/R1glCXcP29+o2tHhVlbeZ0Ve6r
	 HTpcllVzElJDNjZ8U8SE1oQUEDiT2BmjYHD5aqwiQGfxFo2SAjlzXI8eliek2jDV+AKhr
	 648wQIPFRClf3sdA4mKJuW5ZsvbK/Smt3WKbjI5dRaMsKymPm+G9/Myd4RToYS1IIthCf
	 C2/AR9xkm1iIZfJz0HweVRKhjIMtAUek+UTBdS+bBPSYLa4T6raq7EPCXLjY6CReJvJN5
	 0OCu9iam2bUXsFVLEZMf5Y0FuJyAwRmPZlk04g8JtfuhAZtb7w3ESsJ5KG2HhnhfmLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286588;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jiYfc46G77lt9R6Qh2XdLqt53zKjKZqhaxsJEqh35jc=;
	b=wW2XHcHrska6P33UjNdkw1Oh9F74sVkRUOefJkLDombNT87h+Gc/JhFsNDW1OEtMgwEP
	 v9g2qz+r+DxDP8sByqC9otajME9QiJxRVJd3f+cHyjBrL8CPRY7jhiNtJhfgUrt4qhSLn
	 jBeCwZTmwFDCpxZJMLPt7/i+d5Amshz8N7FPYTC3BOxrg8ZQca+DzSNQgupOhjYuE6tgJ
	 g2TVsxZg9GC2kVhx9I5LeWXht8i8kMhjHPRV0UJcpuTSGFz7vOZqorZSmtVf/TjzyhTtz
	 RcM/Wz0kqOwrwe93ciFR405fTb/JsJBmcr8PtJzv8BTH7ALvVUbxeECVLFEVPYmUFWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gq84ZnNo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ItCDFlO6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FDF606A33F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2FDF606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gq84ZnNo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ItCDFlO6
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA49wYx1206962
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiYfc46G77lt9R6Qh2XdLqt53zKjKZqhaxsJEqh35jc=; b=gq84ZnNoff3ICxIU
	B9H4a4zH9bTIylAz0tQVLzLZC4MBlJYKK8l4voWT1MRUc63bijt0SrIobHQkstAa
	DDG+VIvwttrkHM6FaSxZ2YDYwUbDezZi2YpT1SobD8wXLqrxQDn0O2SIzSj4YSdN
	fFJ108k43Fcej2K5iWUrYiqx5KIovNTjKExIj8QbDc5ySszxIiL5d2UI92IvaP3h
	VDO6RFQW3zn0VUn4WqyjVJU2Ilx3Ar+eDl2FyRHi7EiNoJkc20OyZQnx+qj5bvYt
	kHyTTF+u44GtptjGZ/gZFKU8k8AFI5N5p9IhHx1g47uFczDAmeokb/9Z6Yk664uR
	Pz8ZPQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkhfba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:56:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf6c528aso294199285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286586; x=1794891386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiYfc46G77lt9R6Qh2XdLqt53zKjKZqhaxsJEqh35jc=;
        b=ItCDFlO6FdZ2jnwgZLpn+BMXd4/85eEfIEgIpR0JYcebC89xZY4MqAMdBY39198phG
         QdPiYbeJgJpv2YRWRN6mOxbRQ0gOqS+UPL/wx4M1vFtl1TKr2oNWrKMTRy4ei/9LTLgR
         Jjfe7EDaocd0H1DNgMYxggdjz1DQizXBmL9aR72HPyQbdQDSkq6K0SZbpnRQaB52embv
         FxDcY0KA9icdfCBnKqtotvgkEIOTsa3bqdJTB7PjJBZMBQiAyLdH56dcupwcClRPYm7R
         ns/Ag/FGVrepNjOm8WPkzDChZE3eT+J+bxjEdLoN1sua8Oxai8izs/jNiBkghjLsMETX
         3QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286586; x=1794891386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiYfc46G77lt9R6Qh2XdLqt53zKjKZqhaxsJEqh35jc=;
        b=tFLhgfJWIbbCzfOe7oc4gayIChichicllvOJjOcrKqa0M9T+ACf/cJ0+7CZB234623
         lJVvwEWFVXEbdcbs5lwpv3VOO1PgMtpeV6wxMoZjufN4ysmfA+9Tu5Lgki5Ek6ZWyypg
         iapDKQjiynPjd+rejc/fn9v8fc7TL5s8xV7CDHO0naVo3p0TOaAbp3kvrJ2G8CIZcfmr
         nNJFad7u33OSTBPlkZWs3NQ9Cleils1ymb8C/sId/dt6lDkHRs9ZjypaO6oEP/ZEYDEA
         4yxlL6puIHoUvlv+5/ER3JQ+opgfn7PiE2kPh30pO2g/6GbZ4Uym+ecoaIyr6LCkn3+I
         uIug==
X-Gm-Message-State: APuU4Z9MjNYLmE+IC/NNZeDtBQtmPLnWATWnXn0FL4Sz1zC/QKwn8YsC
	RXKS9qinC99GJNM3ouSeVPB3alpNFhnDq0sKuWJ4bLYBkGIlsRFVoH8BXabzhUd5LHPj4DWOSKJ
	vWHkj97O0UsQ1Rm7ON4B5s2IKzrWrQeTbX4JEm3NNp5IQJnQzQP0NHQCrf2fD+P++ECX9
X-Gm-Gg: AYBFou04XLrikpqxWksveSm58T74QXPxen2VG094CjwDphAeyo3EOPctu2bRZ/8wcBv
	xDOy0x5HUUEEiZ4staMp5fZ1PbC0/XBWNEQHaQsXi0cmsNNtSt11zCenAtYO+xEtatFWQsdxHS7
	Nv2ylEcXGlpQmHDAgUrce4Kv/BzlBj9Ea0Wtuybu3itbdpBncK0NjBJWe30a54TZFGkjNPs7q6J
	mjuExXYlCdeHFQBF+luglQKGXNVztKVIZWX4+JXYOjV/xM3DixJkFJn3NMMJ4E4xBRGieoV3dO3
	SnCef92agomtbNEuGEByvvbg+arQVIGIjSXxmElmZb/Dw7TxShvSqtW0D6R3/ru2M1bm/bbYF/C
	GxuYwWIIOC4DdJmUk8e2yaWcmDTSrzstvLedTiwBC7LlIQFkyRFQEVeBvJyhBwuENvMLg3AyT77
	I/0TIGhUOQoZeYOCMvK4tg6DwXJT4EExSsW1xb
X-Received: by 2002:a05:620a:1d0b:b0:93e:c12c:9dd0 with SMTP id af79cd13be357-9479f4454a3mr237104085a.80.1794286586035;
        Mon, 09 Nov 2026 20:56:26 -0800 (PST)
X-Received: by 2002:a05:620a:1d0b:b0:93e:c12c:9dd0 with SMTP id af79cd13be357-9479f4454a3mr237101785a.80.1794286585589;
        Mon, 09 Nov 2026 20:56:25 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:25 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:44 +0800
Subject: [PATCH v8 23/29] drm/msm/dp: mark the SST bridge disconnected when
 mst is active
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
Message-Id: <20261110-msm-dp-mst-v8-23-d040fb33db5f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=1111;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=g/Wmh1bQW+8FuOEW6WjMpaGh0c6vu+MEknlrm5lZYXI=;
 b=WR7Qm7cjMwoK1HNDcf6+Pbhjj4o6Zh3v1SLbX1SStKLOwIM3yAtmg1wNzx9kFfNItg0v/Yejc
 mAEoxYEue7aDgLDCBEgqwqh2Jcyx7OgWpTxK08iSYc+2eDw72RKUmdT
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: n-zWedDWtogmtNJf0smmftQTcY_jPiFt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX3SmD0N88FVr1
 tk7c7zl4zzEzJshQwRgvljodn9g86YaXhwBu4PsZxz2Hl8dImvOlECwAVGFsbRc8k1DxqHyg2BP
 XwBa/qMJW7yCdqFh4iLdaxP5gEnIGBw=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2a3fa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ao9NmXljvuVdf-BuN7wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: n-zWedDWtogmtNJf0smmftQTcY_jPiFt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX1WFTQ9c5Cq7x
 U4yn4yiVBCXLon6GFSROuaHh8E1ngqTwctv72hUHP/DdPUsF44L52KC0Qn+vowfIXbEdNzx/K/1
 ZNQdrqtKaPqFz3s392YY1XLQF51YE4mnqx6FqxhoW04xPrArOWQUPKcWAWUr6TwvkgRO0AozlSj
 ldlf37ZPUfr7o17QokUTCRCvuJX9RiBBaeo+tLsZm/Y6BuJjXftncIsvTHXbopNAP/jiILLhkeo
 cF8POMZDAz+TFR3sb6gQAlWrXT4UO0UIHb775JW95v79as1n+wUniyiCiXtiwyRycL7jW5Ie3b1
 Vr6l3dVXB+ZkmCQQbYGID9Tw01CdP/XXwAWARePm++I2aD2uwRJsi7J9eioz0EEjReUQzz3h1B4
 ykx9lgOmFTqWO6POZuAKQFrISY77fSXafedlo0H45pC+20mWTmkM3fCSf1KopDtqfjS2k9XDbWL
 NUNdhwWGQkedN+VKR6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The bridge detect function is only applicable for SST. In MST mode,
connector detection is handled by MST bridges. Skip detection for the
SST bridge when MST is active, matching the behavior of other DP MST
implementations.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b4e788d1f611..f87eea19c4f5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -976,7 +976,11 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
+	if (dp->mst_active)
+		return status;
+
 	guard(mutex)(&priv->plugged_lock);
+
 	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.43.0


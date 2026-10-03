Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E470623AE9B
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988444; cv=none; b=KK2aY31bEjZ1Ay31PaeGZOhZi/rQvgBkk8RmBivIMi5kc2Ki+d8qIaI1gg+BPhRIjBbnMPren6Xv+pHPR29eDHcZ9++andIaqMqOLCNqe/ZkIH+rMo7vAiUWc3vrRN1ht1Dkya17aVrfbEOD7Fxlsrs8PlKl4yq0IEJQR6ZAZK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988444; c=relaxed/simple;
	bh=i8sQEYGkqaTl95BcFchqoZwUFdW7vyInSL1Gs2GlaAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XeJOikcYnWBQbMkT1Gfam+QoJ0AB/6oYz+9w9Q0GRZ8K9Ygcdl+KXqDAuCnAYI0CVLBkvib5dNkDsYmENkuZhXb6PpgN2Q9mxj8+m44zwwQjh6LlL3/2Zal2qEBt3BQwl/+vP5XpP/nCPqxVbfUFAoG2n01/t7/8mmnqAHD6UZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHMbUlCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dT0JbWUv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHMbUlCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dT0JbWUv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ne0vT2104569
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VG//oFdfsErBkvF/P9Zl6qRt20SthIydDI5DgQhlbA4=; b=YHMbUlCvA+71nHeF
	cWHRlu1iRBUBxr6B5qXD2rYN29UKxsJ3SUHCncvzfYda9IHPl6Obg3zHOU37FOIy
	jW2xhXRVYmwtGz0kcCUWSmwTIBnoYyoAHbRda1gb6OTR9lly0Y45rvmim7zLdaYD
	iUceoz+jjkBNMv8KPrOslhVfWNEDPInmdPD5srmeqyDBePro/3echzjmBnsikTTL
	oI9Qv9GSYIhdYlLhWe7g6wFdifKazjCwHMePJIu8jYPkwq4KM1LYgI7F1qfyS4Io
	DyRmenDfbnMITXPNPigp9m1CpW9oePdrtWsxZEuoMUD6NOcjk+CmXa8iGJ6jpaGj
	qF5y8Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2dxdjd4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:47:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ce7a85f04so12756385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790988424; x=1791593224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VG//oFdfsErBkvF/P9Zl6qRt20SthIydDI5DgQhlbA4=;
        b=dT0JbWUvn96gGEiBqPuD/sxpLXMnTbdv7jqSALrGlxjtU+vpxyadYfx/Y2fHL8+gLb
         TgstxCTkT53tm4pDmE5/b7ZXC2kezjH27ePM/jpj4d60sDcHdJDSAKAyLvo+jVJIdTu9
         kQq83+/lghSEXA8yIcEvLw+7extF19ItEOgxS/48hZKAyRU94sIBRyFv38sGqNIscCtT
         BtBpyWxo0WcRj7mfJEbUiyuDCy7/Ex6OG77obSa11GFRCC/gGIcUuNNHlP9/sGvjdbAu
         HQLmGkPh6Os/pIraY/q58aFB2C9fr/vhO5IKq4s8/VGDi8t8EY82n6/1ez4is05tj/5N
         tPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988424; x=1791593224;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VG//oFdfsErBkvF/P9Zl6qRt20SthIydDI5DgQhlbA4=;
        b=aQ97xSTBJ4ZnFoPQwn4+Brmi2A537m45IP7lQyha9uiShNCYa1fzlqRyHkLlFdNYEr
         7AyAifBPScJq93YHAPSyyqQaipN3L+h2Jv57T2RY+VPGv3Wc7jkuLbzemrrjJueC9QNJ
         667IWWRHcbnZT/asWgMwmHMioqgqFz8Kz9+cXoDQrPSmKHgMkg8s+ba3r970X/3dHTSW
         QxqgdQpQcNkG2V3TNp905mlrwlHZ7xd3fsvk0HQDOyv1uCBPSSMxQjxMPfQDF8OUP9CT
         A2VMkVKYMo8Sw+FpK/c1FDhaU9BF87aseUYmMApgqfzLhnnm4U/0DVMdDYHJtzD2M8Ki
         Iumw==
X-Forwarded-Encrypted: i=1; AKwUvByc0OWVYHs0IsQr5IoSMrrr0ZUP6UBWaRUFEOCxqGxZYj/nwxOPM093H3lTWNyfkSFrEOWPFroRpSsDGdBn@vger.kernel.org
X-Gm-Message-State: AFuF++llFA3cDwrXZw1dvIH8FWqLxYlbKJVkzvNNluKmC/jnVbtbKlgI
	EW/5bM7/XrDYamOMwwK5/7nl96dU0PDB3rzSWZPawMeZFVobKu1QPrbyJ2dtVhZ6qfKuByDRSux
	m68EDvMIXJvGAnDy4NE3YueQOqiK1wjYWguHWSRhB1GMUYVKpXmdlrGt0FFW8K3gvtft4
X-Gm-Gg: AYBFou3C8RYcsvFn+eJMgmfJP5ZgcDkC5UsYyIdBFsm0ywax0fyu5CmPbily/KcpyXz
	m+KSnNkelzuvBfuf6EMDDGB7FeNc8gp64Jc2zYNwbt98X0SVa1AuYiMp2NfgFlNr23D/rggwmEj
	18G50wI4we8yLxw2spD/DSk1qqpXTSjamFQgv+wl4JLzTkFqflbeXqYd4w776gCYW188eX9L/3z
	GlfRveywv2b0hdKjYBTceEfyHlRozqr5ubFoOtABVpSRuo2Z1Rt7Ibw5OhX3xRF7n0ec5aOd7FK
	Q23MP74kWn08bHo2jupmoyjBdbiqvy7vnEUE+JCjsFCJ+db+hjoyM+/LOFGtLBz5n1oa7neZBoZ
	VEgK5iiNKZnIQxn9mHGKsWiN7v1vJmlryAaDzwNbZBHicJtGB314t/NcJSGiwn3CDhW8CmJ84FA
	HxKO+dFhoDA5bZ
X-Received: by 2002:a05:620a:28d1:b0:93e:5017:d505 with SMTP id af79cd13be357-93e5017ddfamr265252985a.19.1790988424188;
        Fri, 02 Oct 2026 17:47:04 -0700 (PDT)
X-Received: by 2002:a05:620a:28d1:b0:93e:5017:d505 with SMTP id af79cd13be357-93e5017ddfamr265249885a.19.1790988423717;
        Fri, 02 Oct 2026 17:47:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c71911bsm1160748e87.11.2026.10.02.17.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:47:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Xilin Wu <sophon@radxa.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 00/13] drm/msm/dp: Add static HDR support for DP and eDP
Date: Sat,  3 Oct 2026 03:46:54 +0300
Message-ID: <179098834069.3641559.2753228491265144134.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfX8E2mg76unbqF
 n3874pGdO4URBCEasmzHWwc0spA5KLnFaHhAgqXeqTxVCayMVLWEtLLo4NgnNTLY3ebMfxBqJvE
 rTW7oMC/GTsFrUIASQbTmLgjLVcJtAA=
X-Authority-Analysis: v=2.4 cv=Ko/YSmWN c=1 sm=1 tr=0 ts=6ac05089 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=e5mUnYsNAAAA:8
 a=p6THbNBqQQInXpZJy2IA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: IJtgrOlH9RD97aEAWykyz9TwGTB_f8h8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfX2fNilpBduhqE
 Y5jJwrS+i8E+7Pb8qdDWp+ls2oDAKOnfLAbjopJNStwUCCeTfjti+oy87YYlxEFkzv37xzyrCy/
 V3jSpYQuKwb+PUGzjPeRYIWTsz8f+yum5NnDaFbo4dqrcvZbT/TAE1lOzGX7P5HB2haPfWeOofa
 FbSeHiv3ScAhG75Hl7+VdkmS3+FY0mbb8herReo16G+VXxudH7f1uh6w9hJk3quq0I7Ycfk7X0l
 u4tct1d6cDDOoyXB00LeRmkrqqvuQQqk2kHXhnwamRFQ4C24ZHK840oJ6S7GG+DbzrgUVDf4bXO
 Yh8fvvm6SE6S6umFvIY6ARh12I5+uIOdVoD3lVIOlUbsXmAbYr9AWO+wyy1KMBp1C1dBFKqE6z6
 iWKR7dbPp1OuBhJNoOPhafQmjZrlgly1/NEFifCdCf/VInxY6b6AmGmAwgYVpvI8iG2CJiMkC+M
 6qoYZhRGbdtWnA2bcXg==
X-Proofpoint-GUID: IJtgrOlH9RD97aEAWykyz9TwGTB_f8h8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030002

On Wed, 30 Sep 2026 20:41:44 +0800, Xilin Wu wrote:
> This series adds standard KMS static HDR metadata and BT.2020 RGB
> signalling to MSM DP and eDP, with HDR10 as the intended use case. It uses
> HDR_OUTPUT_METADATA, Colorspace and max bpc. Userspace supplies the HDR
> pixel content; DSC, dynamic HDR and tone mapping are outside this series.
> 
> Patch 1 allows max bpc registration before connector state allocation and
> initializes the corresponding state defaults. Patch 2 prepares generic
> SDP slots. Patches 3-5 establish PHY power ownership, serialize HPD state
> updates and add complete stream enable rollback, including AUX recovery
> for a connected external peer. New error returns are introduced together
> with their cleanup paths.
> 
> [...]

Applied to ttt, thanks!

[04/13] drm/msm/dp: Serialize HPD state updates
        https://gitlab.freedesktop.org/lumag/msm/-/commit/62c6146e5fde

Best regards,
-- 
With best wishes
Dmitry



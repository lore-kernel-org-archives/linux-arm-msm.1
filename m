Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DB323ABB9
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789346990; cv=none; b=LmtnkNBfNTlyjgBvMFH3RNZ7mO/5CE9BuGGyXEwQdjXPqoK0F7Onf29gF6LBsIABBjgSCGggxAXdmK5YLbdRmuOrU0tL0LqWGmSVzNj5yNEzXry3lHaca1q4RJBQHOQApKQAPcHkkliTPTc01rsPgSh7OPlHVTuv+lqMz2Xy8Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789346990; c=relaxed/simple;
	bh=cSBSDsxfm4ZE7u4EPJKxLpqE81CRtevp5nYLTpqjDR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejsdI7PEeAIJMgzSpcpnJ6EM+gPHX6dHrdEntIP7t2DsTwtXv6H5DH+EfuU2VGSfuOyHLL0Mmjf+KBFqFJDigowdoBxv5fQo47xg2sgylrsjKNmLuzUuM3Fxutzho8RU2Dp5+2RhbWvsCQFpWg2DMm0ztx4tf6uUCMHPnRQ3MkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPjvea92; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKD56ozI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPjvea92";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKD56ozI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06Y19082294
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=krxzRCBNf6IAYBv92gpHf6Fb
	vyiCF798aoMw427kF6U=; b=KPjvea92vvXTcX6alUjNOQuEyvFCVPEEGPCjbaCV
	ElczueZvP/ymcuOD/W4YbmOOVtZtrXXF6gLnUqg58NX2VuW3qv/3pWNgqRzOUhqI
	QD64TfW3Tw1CLaoQ9iBIb7ftxX+ADJHmPbxrPMnBRbdXiuEKJsYVOaLyJC1QTlzQ
	RAAQJDEAe3k4GqQhymLVai7bsmvWQui536QVSQyviOq9DTHPN/DBvVUcKqfk9k5P
	s6xoQX7Ei1wyN/pT2V3sAbIFyn3N4A1DOirQAo/DPD9HdPxg9X58V9hLqBdirxbq
	IxRdZS8+/7TpVx2yEtcdv7v5teNIRKpKwKhfyM3phkx9Hw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cmf30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:49:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78580a6b2fbso906891137.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 17:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789346987; x=1789951787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=krxzRCBNf6IAYBv92gpHf6FbvyiCF798aoMw427kF6U=;
        b=UKD56ozI5IJ6T1GeA638qxGo6v5wVIkW1LhIk5qheRc+vormHa8JYwXuimCFRFqlO7
         3/dU4C6bU5mAKrbkYoKZHz0imkH+CSIt7YlsZr7FHDfcCPM5HlvSSwtTP9uzofDZcxW5
         FypymWhP2Pim9IwuxKzkXbIsQxnSwYRmAms6I5IpVDy+7HzS47i4ZLXR0CCG6VctpJzI
         4PCvNYWyF/kzws/0tLdrF6WILEuLEdYkbqizExvtTsoYaMtLv9Pse0q4hYRhKbgX9VNK
         Z9V4rKaayeJyiXsugGF/wlaia02xZTjpfVIon1vhB/+MRbwcbIrB4eR4UB4/TKtJJqjQ
         lLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789346987; x=1789951787;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=krxzRCBNf6IAYBv92gpHf6FbvyiCF798aoMw427kF6U=;
        b=FGZIpI/aPU0OdmuPtDayypSFVJtP1yWkAHiEj5tqs87+bJv/ZFfs8I/LuIoFHDQ8i3
         2ACFP0q+WFoeQfbFIlpN/r22T1M6rG5qPReJF0qi9HPs5wluO1KQ5yAz74yuK8cwj5zZ
         uZ2mPnZapmj3hCEMnU82hqMboiGFDOR5XU+opUVGBo8p0ffwueJ5kh2QaIHSycyZqNyZ
         G32vFuntWZvbG+8Jm95+G0Ul1aOvf76qLdQSAMJZwa75hXaUfDtjNOBKlRhISm9R8CYq
         8BXzOpUyvwu/U9pVlqRyhlryW/8N0qw2t0qluej7hBQAWGMXZfmUJSoQ7ISP7GCtrJub
         0l3Q==
X-Forwarded-Encrypted: i=1; AKwUvByoHPy9sFfqgQ5SP66KD6eNp8Muoz7topu++fMjtOgiSM6fn/hY32lST63IU36adQLx5k3DX5n+JR6O75LU@vger.kernel.org
X-Gm-Message-State: AFuF++krvtAdHFpR/bn+RzYGUHOAloNSbSBZC4yMC0Ox4JaaBzWR8Iiq
	GwigXRfVOQDC7V8wbhjCGkmvztDsd9x2fg9RGjkT76Q3tZPAjhc5Yji+qyW7j9Y36Wqb4YONWwM
	eGnOZhQN6hGCzXncx9sBR0eDg90JSgUWw2xO+mILxVTUHBV8eSuwZq9+g206MfddZ6NW0
X-Gm-Gg: AYBFou2LnZVara3olmcBaJJunjnZ73TMvlL3+cQyTXZ/himS40+WrsxEuIxaxGmiikp
	7/kDHGSkodhU1cuGOO/8mKk5M4ReAGx6cVy8w31UY++Rp7tanYh+DfmBsqkToLLfsQLlDQWrYg+
	tEARvU3GQejJh5lCrpd9y9voeHvnjOHKeC8xi7je61nBe+R4kNUVXZHgsild5HRg8MqJePI6EeG
	5yY7bXMcllt65hkQG4oudilAYzouifF7FN94qgYhz8JmpAeBX7LPiWhJDtUoaAlCjRYjwcoedz0
	+d2YcsW5gnRvs7KCvEdar3hjGo8qbVaEUidjvsaLs6nt3497JwhtO/HYP7j0bodBJxH1FA4NZ7K
	tn2LuKFUd15+f+onSjqa/O+KNhfEoyj0EXaIZQfTO2uAUSGwjQERxyYCYTekE9BH9ivkqvca/t1
	5BxPORKUbnX8JN
X-Received: by 2002:a05:6102:80a5:b0:795:87ac:9cc2 with SMTP id ada2fe7eead31-79b58d7558fmr114323137.4.1789346987279;
        Sun, 13 Sep 2026 17:49:47 -0700 (PDT)
X-Received: by 2002:a05:6102:80a5:b0:795:87ac:9cc2 with SMTP id ada2fe7eead31-79b58d7558fmr114312137.4.1789346986825;
        Sun, 13 Sep 2026 17:49:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0456c06sm2106722e87.28.2026.09.13.17.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:49:44 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:49:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/7] drm/msm/dsi: Fix indentation of if block in
 dsi_mgr_bridge_mode_valid()
Message-ID: <hqm4hn56tewbc5xexxtpyiijcld3sy2mt3e4nulwepms44imq7@ke2lzseaieqq>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-6-87bdb9f1987f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-6-87bdb9f1987f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwOCBTYWx0ZWRfX70q2TUazJJlH
 3xv8gf14pX3q4KysDMoc5EUtziHdJAgpolKxVzxEscoRtPDaKDXRPnAuBvH04uz0SBXWEwOe0/j
 ki+70ydJAaag1gZyVFTXT+3sGA2PjaB8scHyMk6AseNvt2wKIHTO0zdidAPQy3y0U/siTP8ydJM
 k+8LWT0L4HwOCjOBkNdZIrCYg6qjI6Som1jP6bgexlSIrYk1y7q8nVj1DwzOygjKKkEATUwMo8n
 NleyZGs7ikukXoqF/FIikXtXO+T8Wr5EeLXSk/ZL5qjuEyPuH9tAu8M5PdFG2Pa06DAwT6nuO44
 k0WWBl7Ym8oDKBdhSAKoQ9jZnvHV8i5L3UlqGJvQKE4nIqGOtjUd7/aHVOBpF3StiRLss1NityF
 KSKiGVWHg9E6sF2qAL+GxQ9F9wkBAAb3e2FkTjcgrueavlWQ/7BZwzWti7b1c9iW0OODctLHi+f
 L7wX/DlxS54zfS+yfkw==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa744ac cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=oMov3bMtrqd5QQYwA5wA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwOCBTYWx0ZWRfXwWAYw3nneQ0S
 Y0tyog/9lXu6A63H2wntoBrXgtCdWPJ9jP77tLCEFy4tiA611+1tRg+8GW2VcP5VykmV377FEjI
 Pdu06KOa0BqI7QZoc1rdzo6cbw74pvQ=
X-Proofpoint-GUID: OoZTal3P7C797V8f9Wn5oTrU-1LGb_n5
X-Proofpoint-ORIG-GUID: OoZTal3P7C797V8f9Wn5oTrU-1LGb_n5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140008

On Fri, Sep 11, 2026 at 12:29:39PM +0200, Krzysztof Kozlowski wrote:
> Correct confusing indentation within else {} block in
> dsi_mgr_bridge_mode_valid().
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

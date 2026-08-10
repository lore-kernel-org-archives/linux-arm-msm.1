Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F68136194D
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786377961; cv=none; b=Ch7KnmhzFIQP/H8bR32/JeGTf9n5Yn5tZTiIBFdoSJXFGMcEeigkk/iU6/vJP+wx3X0veP+/JFcebnohBHQ9EyG1a/UlDHNlObzXG4Y1/6ztyv+5m4b4ZrWyp/8WZDvL+iOEmouj9bb6dTQPluRwmFrczpHwWCo5KkhfvBpwV70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786377961; c=relaxed/simple;
	bh=2fv8oYJQdNM60hdKoBn1mrs6xB3SO7hDC0VlOdjJZEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijRbJCMAHZo5ISRkQG2E12d7lrnmhl84bytWa0g/a/BoIifd0McD6VPR3GyMb7Eg1bqCqKHk+qctdqwepnK2kCVnKGLLRnK2vbojpmaKauMMVRRDelq3cXVo+Ff9jHnTDnRw/9ysLOfLQ2XRiZi8FKSZB9twv3CoGVoBVBPk8h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1NhVVUe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOnpMdD4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1NhVVUe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UOnpMdD4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWPrD1299212
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 16:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mPujkJTOGc0TWj04uUMCHTdn
	NQgumaeuC61sBKnEmUw=; b=i1NhVVUeZGJGLT8al0W51NbX1Ojh2Qui6aK1blgY
	nf5Hemwv+rLSF9HlTgPlTtzK17bJBtvOcfZZ0YPauxCuPGO/jMG4NuAY9ZoLs/mM
	zIkZqDbeYAdlR9w6vN75ApPo9EXklL9N5vmqwz6aPd0JGo9m6rzQ/rj3q0/+3cf5
	RQU+WXKePt8GryifKZjNFwxXOlAJY+M0vEx6HUq1EFiv//d4uBmNLKbjnBwQuL98
	zE0lxPhVZNKaLiCEOoJy4ewYYTX/ebf+d9c4mCKHzeJQBhWd3mGKVDEG7omg8vck
	U1C7RLiN8fMswq5+ZS+gMtEh1NbzTIEtAitvXNjzAeaAMw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v92cup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 16:05:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bfd13481easo225352e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 09:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786377958; x=1786982758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mPujkJTOGc0TWj04uUMCHTdnNQgumaeuC61sBKnEmUw=;
        b=UOnpMdD4fIQfByxRnjVIHUboigW1mQAeVwy3wmU/TBonp5MO0s4caX3V2000UEtpDg
         tw5lb4FegV6uhS2jJGFIhYpWjVyvh7L7bCrU7uZwjxAvU4pNsTGNAdDJ9zWO5z6VslHo
         R07BpoLtZE9IHp54jZwCKJLIyfIb9rW8KEP1uVNBFolR+yV1D1KexDRrw74zTJ1SAkhi
         ZX48BV/Xdpzia5HGW6VlpE44WyU9asp7y+6cQ9HbXh4e5D6UHxtOHlIUx/6UIfcx4VM0
         9su+FQ2/hRG/y+eYQ3ILxo+7l+k/sSRHSGBYvalZHBRSMRu/J3BOQ9hNqERKtdzBXjBR
         pCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786377958; x=1786982758;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mPujkJTOGc0TWj04uUMCHTdnNQgumaeuC61sBKnEmUw=;
        b=CfLOAnohZeOMaWN6c/eDWcpVmvYmqLunrn2pnuh8MWwcYXfUMea4WSL9/pmOOvR4sZ
         p8GL/jc6LDnjDUp+Ddcd5dnaLe7dL4YwA0XDwm+ql6BobQcPab01dae8xWZbldC5pLEB
         fTr9K3NdGLNYt+hcnxFS/RZvQ+oOrkLLAY1tvRHErT2meyU0oXfexAoq41SVdhAl5hTk
         n1bzOLf/Ta+ly++1ZAsfwN0o3706YBqpscT5U469EoLYHbOAn4fOaHtSiBs2u2l0qZ6f
         E5u981QUS6kXLyplqPELXmniXLDrMFzu/8+D+PR+qH/J4kHDrGwYylMwJRVjXevMC0uc
         pqWw==
X-Forwarded-Encrypted: i=1; AHgh+Rpf+bOwBs94G9P9ESbsP/VaH2xv6ZsL8s/Gtjd7uS2g6c7c7mll16Bzq4n6SjfULyMl8kkiyDAuMTkQgxwN@vger.kernel.org
X-Gm-Message-State: AOJu0YwrzgF9I950tPeRtmQhvke+q1eGLoJQgapycVeEwa9KYANiSNGJ
	yKgqkiLySHMvm6IwwynV07s3ioon4XRpFm3G3vDAL0TqdamvJf1rhAcVAqeWwSm8EyadyRQTbw+
	sOiyplxebDdTIzfGbaCJGHsB9h5vdGzYTvkq9vifqD41cgRB0O4UEz70T81sWpGv6NlCW
X-Gm-Gg: AR+sD13jeS+2TGuwRNJr5ylIamKlN9BsDx534DrSoBvHzpBGYrQnGQhuhJUsI6bbmOT
	Gfj+k0iIsQHMxxbvK8vf4rEsue1eQUL1qJK1lVIHpBZBJBdaNAqbHVf3sv0qNda2mhnQR4aV63L
	W0d/ConUlhqiIT7tANyU8TvOBmVRgTBuFdnURdCjl1/bZvuahZ81KUwf+k/mJYd5s04sRU52B3e
	dUOLBgrF9UtSklj2/HgawJHKpRSZAQ9GKlsm9/fc3eQEcp7fJOmXHqjRbSFt9/ob75ChFCVniCS
	IjtkHS+EjxeW1EvOQD6kSacbr6NTVS0chG+aD4gzh/htXx5JyNYy+PV1pcJFNHkwc/q6cH+yK/F
	ogitthgkDHaP4Mh49SKW6q+xgiuTqfJnFOpMns6FK1/kXdR/liLeY+pYBIWwcWIwpASqgdwXshK
	JrFfdCA2p+q5z2Dw==
X-Received: by 2002:a05:6102:4b07:b0:760:418c:8a9f with SMTP id ada2fe7eead31-768e8c52790mr739655137.13.1786377958191;
        Mon, 10 Aug 2026 09:05:58 -0700 (PDT)
X-Received: by 2002:a05:6102:4b07:b0:760:418c:8a9f with SMTP id ada2fe7eead31-768e8c52790mr739648137.13.1786377957798;
        Mon, 10 Aug 2026 09:05:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b304fd1c38sm2066473e87.12.2026.08.10.09.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 09:05:56 -0700 (PDT)
Date: Mon, 10 Aug 2026 19:05:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Inki Dae <inki.dae@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v9 1/2] drm: add <linux/pm_runtime.h> where missing
Message-ID: <gfhkrmgrdmqf2zmfdoqnmc3a7ifcwxdyoiqptg65nigdwvmwvv@4pt57y73ucrb>
References: <20260810131314.452865-1-vladimir.oltean@nxp.com>
 <20260810131314.452865-2-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810131314.452865-2-vladimir.oltean@nxp.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzOCBTYWx0ZWRfX752OyT+jdfEZ
 D4jiO3vHg/2XjLxmKqAyLsJjK6gKfwmig2bCAOAFpogaFr1EkCq7PQNrTMHBgtF0dGXdvU1XSmy
 ujoDyOZcTyz4GXvZOhT3gecFP885A4g=
X-Proofpoint-ORIG-GUID: m2yOFocphlEFdIVLiWQRphqfjvRLEluw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzOCBTYWx0ZWRfXywrRfgOu38BU
 KkSxQYzTYF/zQnXIcW1ZjGlOF6ChLX+bE35Fj8W5BMeXmx1LAWu1obAIFCgmANWtxb9uLGny9a5
 KtPfX3exhf3wDgK6lMKC+sugk6aRNWZUFi2IOVTu/x90p85z2kQxtCnV+7oMYXHV83KLwxatuXT
 pCoyTcbbOBQsiWs4lK8/Bk9xGWmXXeKoPQskYxQE2ky5dHvVmBtMgJNnX3VIiBQgUQMMVT3c+rA
 DlvsWx1RjGYO5f+P7R6rcxrY41n83nGpzkyxbVfSHWcfz669/8LtZ+v47gGDIbujYATEsfUgUiS
 NbSCn7PLoOf20SzX8vYwsa+y6CTQSoiXobsZqOcTM9lBWpyYE6Q7L060F9e9csyWo5Xj6tlX+ND
 WrNOqjF3cAquMH+BfitnD6NfedOKfTuHkb/BMuTdu+j1parGDrZPl+Yf8dYkhOi5Y9kCB2ZnJN7
 hiZT7Kg8aXLYjplXr6w==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=6a79f6e7 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=8AirrxEcAAAA:8
 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8
 a=pGLkceISAAAA:8 a=hD80L64hAAAA:8 a=iP-xVBlJAAAA:8 a=EUspDBNiAAAA:8
 a=xt7DZbCNmi909WKh4bIA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=ST-jHhOKWsTCqRlWije3:22 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22
 a=lHLH-nfn2y1bM_0xSXwp:22
X-Proofpoint-GUID: m2yOFocphlEFdIVLiWQRphqfjvRLEluw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100138

On Mon, Aug 10, 2026 at 04:13:13PM +0300, Vladimir Oltean wrote:
> Multiple DRM bridge drivers use runtime PM operations without
> including the proper header, instead relying on transitive inclusion
> by <linux/phy/phy.h>.
> 
> The PHY subsystem wants to get rid of headers it provides for no reason,
> so modify these drivers to include what they need directly.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> 
> v1->v9: none
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c  | 1 +
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 1 +
>  drivers/gpu/drm/bridge/nwl-dsi.c                    | 1 +
>  drivers/gpu/drm/bridge/samsung-dsim.c               | 1 +
>  drivers/gpu/drm/msm/dp/dp_aux.c                     | 1 +
>  drivers/gpu/drm/rockchip/cdn-dp-core.c              | 1 +
>  6 files changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588314F30CA
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774784; cv=none; b=uXdlxOzDaVabxVU5GV3rgUb3KaOnxbp9PNCk3Ww/m3snp+l/IIP7YQaxGSbIFWc6g5k74VmFKlLgTMWm++Vydlo21SbEHVDB7JQw0sb4Ar9Q09ixABC52r8thRirCoAVRgf6M0a5C2aRdsDhIT4R6l/w675OEd0t9u8n9VeUrek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774784; c=relaxed/simple;
	bh=lGGYfVR39+XE5qDJGewyTnZ+7AJfdihwmk4BGewdxWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dH3K+YB5VVrZGb481jn/xJfgZfV9UcK97ePg+g84/kcerIFnhRP12hgDviAj4g1IgvLhbfboCbjAcP1Ry6J4FsNUmPW+2FG4pFeL/B5P4HjCbcOQRsFaxjyoCT+krvYJNz/GhFzqtidaaDafjvZK/FHIJe/oGX8D55QdK4KzORc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f75smee+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxxUQFpP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f75smee+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YxxUQFpP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7pVl3955031
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rTFZ+94GSRBJuyoD+wrNMMpG
	yUNudG4vyWgC2Rkm6Ck=; b=f75smee+50t5q3IKcnQ/mg+gxjlx4ShMRjry0WZu
	u8SHcOF8sna2xcAlgWACllk4qaXzy4K1QAxvOzYDA8uu81buftR67xrmzpMz1RNf
	NPfjdsTb3ZRBiHpw/1EX0tHEh+zGk87WdFMlPBliKzcksYoKG/gjAOEdcZ2JpHWs
	quOMf3jTiAZvD5EwOOL1kD20D51fD6cR4NoFCcoST6Lk3RuHLH+bEVz8g2p+TXaf
	tTNaIZJln9b6PhHN30KbqfcN9yVKthMYNQLWYpQCowq4uMCZgm2uLU2k8R/xViby
	l0Khcg52yyyI7O9KzIFrLx3YLdwTyhUITquQz9Or7LpCMw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97vhn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:26:04 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98304865f02so4431792241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790774764; x=1791379564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rTFZ+94GSRBJuyoD+wrNMMpGyUNudG4vyWgC2Rkm6Ck=;
        b=YxxUQFpPLgkPc+3LRjdxcRK2EjAPDBejjmwgOvyGfojSCXq8eVtfYfBYhIYbsHkMYG
         BgFXktE3FEiZcq/TOg+Chdu9pPsGmoshN5LJMQPYjwtmwSOGUUMYFIwoW0luqFM06fMj
         V4uN1BH1AaTijbQXchs1gxLQTMr5W6Gqt4rKpJGY2SX0K/vKzIkGHTLrQuc1M0GBux0Z
         PZfdVuKNyD4RKyPA1Fh38GCOq3doP4d3H2tdHfcZ/tf9pBmpE0cPrywrhBzEH6RhauPX
         pEWy/p2Y7eEeXIdGPUHhRDpG1tWV13jt8hwlBPGVoFxxlQ9nOLvbyplUlG4Noxu855JL
         zWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790774764; x=1791379564;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTFZ+94GSRBJuyoD+wrNMMpGyUNudG4vyWgC2Rkm6Ck=;
        b=VkdsleHcT0bLBQwnU1MrRWB0K52K/uqV9POFT8++OPfLBDkDX2eCDyi0i6YutxyEQR
         9D/vlcF4KdTKzBTc7Wz4goLRlhkG0JlWRveRC9ZQZ5sWvmA2nX+iHOsIKzL+hVWA6oBh
         orwSo37McQgExljNK4N0TfGCN+ayJioDR30wi7yjZ17EHf44FkZmZMKop5a05f7l+75J
         jq/BPmLOYIUHjfMnKt7sJwv37IcvD3G/hEaqQNy1NBuPHUUemPblLJqRd10KBC5Bop42
         4drusv1LvyezEN/oIZPdB258Vxo4XCEJI8Tft4Cp3myRngP5TEeaQAZIJHe0JTRbyzWb
         jFGw==
X-Forwarded-Encrypted: i=1; AKwUvBxmLAY4t1wgZ/uNz6MLUpzKcuJnbC06bwfrueRc9xoxbto12LXA+vmzwf3QVjwdhK59l/VSGWudyi8jkqEf@vger.kernel.org
X-Gm-Message-State: AFq9FYI7g5EmiJF+YgmJGHwhYnY7qbCiPJWpHVlQF9tuWn398RTilRvb
	/VihRgUihSgZ8CFAm8h9irb/ouT5Y2XmtWBk3GD/hcmaAGApisBjNDzfgfP84cnXRAqIUsrXw/W
	Mv0eY41GY0IjPBEQXSJIKPeetzoMfgwrwe8Kf5ljGJQrMtqeYv/a3qQdlo/Dh76v8iYhJ
X-Gm-Gg: AYBFou1GU7iEMAKAoZcrRT7ERMmFFxqIzskQSjDrHxCdHEF27/NTYD0VDo0CFdDlecf
	kGg+sqgZZZFUcCu66npY4jfbpZz0VzBZb+xFKkQucm8jNjxTnHUnweLFIuty2iXwFWSzwDICva6
	VvfmfT3niR9l/zdarxlvx+e++TmxwMUNkG+nyYMW8A0HVdQdPvZJf2G3lckGygG9bdVXZYshbny
	KKX1qSnDmxU7HfqxFMb5aWNw40DipSqOCpiLlUMgQRW/4gVINjIpEi5GNRtCBGw4VUp+ItBB+a4
	2LCdf1j9mY/HDNzdRZi862IulyaT+jQf98T1D7icf4mY3RZSorDs/NPG7K56fvI2KPjMdp5TA8f
	LZP6poNWrc0P6PdMmr2ZPTnj/qNRfA42h2q9eYQy2Oq1BngiDuhW5kjtwgnZFpyyLsPYxlaK588
	OG99Cp+QkpTr9P
X-Received: by 2002:a05:6102:4426:b0:7a1:f7d2:e82a with SMTP id ada2fe7eead31-7be7408460fmr369589137.35.1790774764273;
        Wed, 30 Sep 2026 06:26:04 -0700 (PDT)
X-Received: by 2002:a05:6102:4426:b0:7a1:f7d2:e82a with SMTP id ada2fe7eead31-7be7408460fmr369576137.35.1790774763763;
        Wed, 30 Sep 2026 06:26:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbf2045sm340399e87.35.2026.09.30.06.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:26:02 -0700 (PDT)
Date: Wed, 30 Sep 2026 16:26:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 01/13] drm/atomic: Handle max bpc properties before
 connector state allocation
Message-ID: <quiwrspvimu5piokdswwqmaovv7arkr5swndnwjxhsgmipp6zc@itciwqnrilc4>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
 <20260930-msm-dp-hdr10-v1-1-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-msm-dp-hdr10-v1-1-dbbf8b2b42bc@radxa.com>
X-Proofpoint-GUID: sztgotoUq3n3GBYjoRM_3L07TXyq5bjA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MyBTYWx0ZWRfXwTwdkWmGhh1X
 DCcZ0bDF7E3kVlbSSbxEY1icvr6WxXWyKpcw4pHHMqbGR4qks4bdjCizX7XQmUx9L9A+6R3ZZXH
 OvdRCbGczE3FdvJ97YnTXbU+j86iln3RfzLIoZxipS+fooHvYrhjijWpvM78OanteC3epWBOtF/
 oqV0pHPwbHaNG0a9Gt4VL8lX6+xkK0XRihFUY0K0rrUG2jsfwpgvVLre2+ZwaMNq409ayQXlRFH
 IvcyLIucGqCyReT9xWktCLwUJBQqUJtOC8vBhfBmoZQERLzwYnwt4sDTzzLqC62HCp5kYgxSFd+
 XPUFdCT59VlgWawbjNGb3JExwH9k9wGTVsQxDv5al05QRIDMhdoyu8ipCnouYo6rElF9nsvzDht
 4SC/t/phsI6nCQyP7hF54vLH/g6a2P8wYVSJK0z6nF08rK3/FlQvIWp+PEndhdWOILAj0BN7ldo
 hTjFyRibI+XG6u1g/Qw==
X-Proofpoint-ORIG-GUID: sztgotoUq3n3GBYjoRM_3L07TXyq5bjA
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abd0dec cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=ksxQWNrZAAAA:8
 a=A3JNbwhL2pmTzrpOqxEA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MyBTYWx0ZWRfXyf+bMLiRzpJH
 LBFbDcRYIGQD5yV8z1XjZgD+hBbl6d5fsTZjqWE/KnjoFqknsInZMBPi1/Id+Gsn+0zXoXfYNIf
 5fQ11Y3xumQJ7WOTjru1jVd3HTb/1no=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300053

On Wed, Sep 30, 2026 at 08:41:45PM +0800, Xilin Wu wrote:
> Bridge connectors can attach the max bpc property before their atomic
> state is allocated by drm_mode_config_reset(). Unconditionally updating
> connector->state in drm_connector_attach_max_bpc_property() dereferences
> a NULL pointer in this case. Adding max bpc support to MSM DP and eDP
> exposes this during display initialization, before a framebuffer console
> is available.
> 
> Only update an existing state when attaching the property. Initialize
> max_requested_bpc and max_bpc from the property range when creating a
> connector state so that deferred allocation and subsequent resets both
> restore the default. Avoid leaving the bit depth at zero after reset,
> which would otherwise cause valid display configurations to be rejected.
> 
> With MSM DP max bpc support applied, this also restores boot on the Lenovo
> Yoga Slim 7x.

Hmm?

> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>

Can we rather update drm_bridge_connector_init() to register this
property in non-HDMI cases if max_bpc is more than 8?

> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 5 +++++
>  drivers/gpu/drm/drm_connector.c           | 6 ++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry

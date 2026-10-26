Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009877;
	b=lHc2njJrF2x+GovH/2lWtIgOhgPCg9+TXMQyKtL4Pb9ZNHXE1OTZhGOSKLq9VmgXCk2a
	 ENv+GAkVKCsZk8AgUA7FcY/PpARGTayNn2F6/9j5jN2L5iuZcqQqrD6ifyUfVwFCx5E/G
	 hmoOm+gWMQsXm5NQezHHcZffHwY2GhJeNdXJ28O0ct7i6GSkAUNWHWEe268jRZUfSIGT2
	 WT1Fi16zIsUXG5obZOQOq6Uztcl7Zw61kzkpk2VPzHLDRQ5Lsg2cw4T9NgASw30/BJlDX
	 gc8kA5Ix3LBYcXQNY3prB7suq1hfZBSyNwF1SjN6zC7CZEL7Tlogu85wgXKqx9P8HqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=78XFvnCPVHn0LabnIkSaSmfw7iCeIi7jK9513VDUmZ0=;
	b=BAcfhoZPlVSWySV+BWfOa6Lcex7KkNYpdaP55uCDxc+bJSn7/bo+KE4T2J+9hdHa+lk6
	 idDZhlqSt3iaqVzROUKi9JQ7sd54vY92r2q/CPyr6/IwsOlxcXajSr3W8nGZWH9KZ9mUY
	 O1yL+zf3yIJRiCexCLpI2ORQa5fXNAbw3lytaGCoU6TV6KeW7T83KXDj4Oq1EvKQRIhRi
	 2+SNcEYaZgXFcKEdDWZUQGVxZxowFCQsWwTGp2ldM25Imlj264QjV9rsNtv94tC8BXhy+
	 qPxMo1qkW3GlzdKO5ZhI89QOAzq2KO3a1LjfMaLix1wc1BUs9bEK1sQMNVDFkn/951g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dSx13RSA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KUBWnrJo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB63606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB63606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dSx13RSA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KUBWnrJo
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q9aVLa2560600
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=78XFvnCPVHn0LabnIkSaSmfw
	7iCeIi7jK9513VDUmZ0=; b=dSx13RSAlAAD4EUSzR9AAOMLfIHAGtEyMLOfHTRS
	pN1Vr8xV5aPEqcZmnOE3vw7Xw9+63iVXiEiPsBrFbnxmiJwqMyMPdo/DqFUzAqr8
	RFjb/wlh3sKurhr2fnnUukWrR3BZhHqQ6XmUmStb8r82aNvCS/EiKDAI0q/nGBuc
	ZpksdOnmhTL6RGYy2D8KTRlt85jKkJcXOjJlVwUsZmrGJK03ka8ft6g80aQJRAlM
	H0Uquj7iyHtk8J6zPfdK47S6h2LwhINz8FAes8aYQWRTbDKcJDFZcoXeqZIbKY+c
	nhWGRw78uQYZcMREksvGT+NUr0ZnHfX7P86zYTo0o7/STA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp858h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:17:55 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ec17386b57so2943359e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793009875; x=1793614675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=78XFvnCPVHn0LabnIkSaSmfw7iCeIi7jK9513VDUmZ0=;
        b=KUBWnrJoZ2+GAYbUzhOAcOheUGlYn9ERCmfYzKVaG/djJbOSGTKbot0fg+EhlL64G6
         xwrBrq52sdWF3ywP7RtZ8ahYdYpRTDPtrPei4nSGC7bUimnOcLHwxB9Cawi6hExPoY60
         RwnkEqS/UySqXjg4bAb+OBqusISzDluS/hwavC/ShMdxgVLWrwV+/xcBaBWqKwNVSxmj
         ILhcnSsdX4fFS1nA8moprNbWegg4DUd93+Bu1PgGOCmyRM3H1MGCXACPGBhp4eJWvkt/
         XPOJdSgPg9Z1JEuuORk6zUMkJEGu/h3aoBMz7yICCsu1LdwTzIrfDek/6nTghXy+fiOr
         /ARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009875; x=1793614675;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78XFvnCPVHn0LabnIkSaSmfw7iCeIi7jK9513VDUmZ0=;
        b=SVGun4UlGOU65up3AiioXNTHO7ECWXDof7DShNQYCjL/VubjtvTqzkfiYbJF/JG8MU
         BSrHAfKNr44GVBXHa8nN/GRbQX4SLl4cnZwfK96sQIBRMqaWIcL8VSelH5OpsHN3FziV
         lf8ScRSZKIcjydkB+CPLY+jxkdI8haLyrV1d8kDQ1phjk/eR4aC/UX5kpGy84fMLynOO
         ScMG9smp0ZGhZHH0qdzmlflQKgvtm5D/aYS5rg/PfPJ9s6luqHyDTeqjcYQ7SguejEq+
         iGUfxJGXiIXKpa621cxqy5EKiAixBK8gtw809MjjILRQyN06emsjQmdizr7jV2plxgT+
         +evQ==
X-Forwarded-Encrypted: i=1; AKwUvBySTKQAm08AvFb0RrJHBQ3oOyPYgcN0COpbRvA0B319fDgIsMyMWEg91r+P4H/4y30FKaycOZLvjRgkW/8l@vger.kernel.org
X-Gm-Message-State: AFq9FYKVq3ng774GYfI5yDy0v7G4rV0y3yH5dTl6EtCKrGMnEBnmbeeE
	z5ut2EzxfiCviVu5HWuo5+A+QTvGHaoiT4rhCBqOPjWm/SZ5p84cWuFE2CToYn837hvVcU8x75W
	qEoSmr3x1vGBAe4rop+Gue3x5TfbSkuyL3UUyhMpyEqJ2I2AYVhIg6ETZSYRv7mb7bztY
X-Gm-Gg: AYBFou04TB/q+MhngpD8ds5ABHDaZmkH6XjuQewbLtgfaDOo+MS+LhCfCVB0EyBd3ZE
	6Mw5Ojj2PC3MuKgtmmm8cpMarnW+q2mecVoJYma9hfBGUzHyH+3/73AyETitXUYzI/aBSdmECON
	G7oCU4XN8M+xNcv1s++rdssK+8txUCxLiwy+UtrRWJeCeTVYw4S8Asf4wAaH1gopY1lMeOhx2ZM
	DWGJkG2pFBR5Yj/yVG7pp1VMNDA1jQElcvO/au7mirwHDRvJOi0RkrvyGI9Hc9vOVGFh8yOQ7hj
	BxKtdSe2XDASsBGrbvqOLLLEATIHAEbI7ebGVjno9VJ8LqFFsBzaLS3F1CBSxMLgAPSYUuKjtXj
	tPAbIi/t0q/YsVQeGEDhKm7W2x2aOt9/9Yx/tYA1zXFB2ASYzsT/6M+MIXD+ZFiwgxDidA4qGEx
	wro9zU0qtvhd81
X-Received: by 2002:a05:6122:130e:b0:5ec:20e8:45ff with SMTP id 71dfb90a1353d-5ec23319c0amr2162212e0c.21.1793009874646;
        Mon, 26 Oct 2026 03:17:54 -0700 (PDT)
X-Received: by 2002:a05:6122:130e:b0:5ec:20e8:45ff with SMTP id 71dfb90a1353d-5ec23319c0amr2162205e0c.21.1793009874219;
        Mon, 26 Oct 2026 03:17:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d0606sm17076351fa.14.2026.10.26.03.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:17:53 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:17:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 06/13] drm/msm/dcp: Add planes, CRTCs, and HFI event
 routing
Message-ID: <rdaviyavkytkblgqjqp334mtluji4t6ybron73wm3uv5hdbvjf@5uxq5hb4fclw>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-6-48aad0fe4f72@oss.qualcomm.com>
 <x2ppnksfdan6yehawencv53qttcxznr367iuaw3ltwttkoffkx@ccrzx7alvdpm>
 <7ea3f000-086c-49d2-8409-04d5aa6e9ded@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ea3f000-086c-49d2-8409-04d5aa6e9ded@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfX0WDd7wmG6bq6
 TK5vfHZtnu+4DtBeenjLc6sNWYxjVFcrWUeE64zexJiL9RRD44HxgHL47vnfyG8IgZHrIzxqAwt
 7f54pRCHIh+JvZFuuDpLUnXrrb6QJ++FDRVGm+U6GGS1bpdIr4dV/0Rvg+I+n09txnTvgT62vTl
 gUEXsTOn0ccUFl5dIkJDIqaKolNVYy6Iv/mLaFxcYQjcZGsCwmJNeCKuyApuJiFIzRJBSSOIQtT
 CGuG8gii050JM8xe2t2ePMqFKSMMpS/xcPJnVVJvE9VKUc6HTYg2oZDEj45ScHXzxOhRT6xgjP+
 Y913BadNMdXrJUGhU3CDh8zVzRvaiIS9+ymBjvLYIW9+5OxgsRbw8mNb1/4WfnD8r0Gd/VxHy73
 1C1jfYgPacki0Mau6qUDfbv0oiMoDTmLHCOFmLvOjpjI2z7P2MtibL47Yj9vGlyXnlYe7Kzlp8d
 710t27bYyDuAJSTOLqQ==
X-Proofpoint-GUID: rV1HL5NE6Rfj_97oHK7aJeP_jvKIqt1q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfXwv7lIdWdr0sO
 pQcoGpWS/vo7WeD1Whb2YRhITsIQiOz/eJWQeShf9pNnwKHnPXJJYN0bg9Z3g3C5fyYvydqwYXx
 AkBiYAs56X/+fJZG8w8HUE53e6WR9Bg=
X-Proofpoint-ORIG-GUID: rV1HL5NE6Rfj_97oHK7aJeP_jvKIqt1q
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf28d3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=_9fECkkFWEdeBB18FusA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260040

On Fri, Oct 23, 2026 at 12:41:15PM +0530, Jayant Shekhar wrote:
> 
> On 15-10-2026 18:48, Dmitry Baryshkov wrote:
> > On Thu, Oct 15, 2026 at 01:08:26PM +0530, Jayant Shekhar wrote:
> > > The firmware-owned DCP pipeline still needs normal DRM atomic objects and
> > > event handling so it can participate in the MSM DRM device.
> > > 
> > > Add DCP plane and CRTC objects, validate framebuffer and plane state,
> > > allocate firmware display pipes, calculate bandwidth and clock votes, and
> > > translate visible planes and CRTC state into HFI commands. Route VSYNC and
> > > frame-scan completion events back to DRM and retain CRTC-local display
> > > session state.
> > > 
> > > Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > Assisted-by: LLM
> > > ---
> > >   drivers/gpu/drm/msm/Makefile           |    3 +
> > >   drivers/gpu/drm/msm/dcp/dcp_crtc.c     |  733 ++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dcp/dcp_crtc.h     |  104 ++++
> > >   drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c  |   27 +
> > >   drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h  |   49 ++
> > >   drivers/gpu/drm/msm/dcp/dcp_hfi.h      |    2 +
> > >   drivers/gpu/drm/msm/dcp/dcp_hfi_core.c |   21 +
> > >   drivers/gpu/drm/msm/dcp/dcp_plane.c    | 1073 ++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dcp/dcp_plane.h    |   60 ++
> > >   9 files changed, 2072 insertions(+)
> > > 

> > > *p++ = lid;
> > > +	for (i = 0; i < HFI_MAX_PLANES; i++)
> > > +		*p++ = lower_32_bits(iova[i]);
> > > +	for (i = 0; i < HFI_MAX_PLANES; i++)
> > > +		*p++ = upper_32_bits(iova[i]);
> > Who has invented this? Splitting addresses into two distinct arrays.
> > 
> 
> The field order is defined by the firmware HFI ABI, not chosen by the
> driver. struct hfi_plane_buff defines the wire layout as:
> 
> u32 addr_l[HFI_MAX_PLANES];
> u32 addr_h[HFI_MAX_PLANES];
> ..

can it be fixed before it is landed? If somebody made a strange decision
it doesn't mean that it can't be changed.


-- 
With best wishes
Dmitry

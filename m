Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8117E476687
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150298; cv=pass; b=LviGTioSZGtTlZ2fhT8KHofq5fhJoFG5TQq0NBCe+zX5zptfWWr+1p1n+7CijhhCZSANCIvWtKLBdZ96fvxkFSmOKcxJjljkRKZ+2MZa0Ww4HkeRGqNHFyr76yOxJ3BHQHNKPH2X9ZZf9OjzuadA3ktv1xlXu7WvOk6G3LbWpgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150298; c=relaxed/simple;
	bh=JOHfuMDahWJpprTXbJI3zSINoNZd4BLeLIcmol+bfrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eS8hTUxbhIG1OcRAYaJTnIXegas4ElRPDY26snFmP4Cu65QXpuwxJVaAd27GhYwWBvNExPvmKTXGKMfO5My3YwNjVQ3G+tqz+3VWZA62oduO4HHgWOobImGV7hmeZexULbnIIxmBMnk9vagVfa01nRQG3d0grIC4aEoGsas9Uzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPeudUYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IW1TE8yL; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPeudUYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IW1TE8yL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbw3A3816829
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=OV4Etzi0F84EHavFR+Cnl8cEpGoAZCQzZFi7p8gpeMI=; b=GP
	eudUYzAmwpt46XExjtHoL24a2I/8JX5JZHI9Hy6CbC7dO1tazpRAgFP+VcfrugoN
	qQqsW9ubazohF9DaVxrl3s/LKRe5kznPmCK3LoVzh6vJ+iebuKHns765pvdU8/jk
	Lx7WZ4bv8UVCBWYHz3m6v5/GnJT2VNZ0ww0LUj8Ylet1jPbTbGqxlh474I7MyGKO
	RI1PPcRlaETWg5xn/0/ig7ssX0OVcLJI/cDW3vOkQPZjH9SybyNVUYXczHdUhTB5
	BQOZ3N3z7a1vzgCS4xi5BbzZii7NWgVe1Zsvy1mFlVQsrVsTo6F9HCwWhsQoGkSA
	JLDz4rujLqSxMRs9pEMA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm3qwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:38:13 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f1da5e5b06so1632421a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 07:38:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787150292; cv=none;
        d=google.com; s=arc-20260327;
        b=IxDdZINJZzkHiUQGtmcI2SsqliXwcqSWGax5ecgaSP26Ry6Rz06q2obw2o1mTxxEs8
         ZxlMIh65g8bLdlP7MiBC/WXAxrj8Dwxww0MnvXMh57AOL4vQBDykIlbz/i69W1uBgSWC
         5cVoSEIWyBQeYNIrbkXAMnEwFRldvB8zz0K4VWJy3hPjA6ak4c9EvRRPx/tEeiNX56tJ
         rACxLSVbRKR65FMLQd+JrB6kL/op98NGvwKIWt30XtP3hI+XCAie7o3kdOQrZC6epUlZ
         a353+dLwlG7RQPtoCHjxl3ERxm1l7Di0F85MfUvQMg/wciInAIOvcyUWHAb5NuXXQbk0
         pB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=OV4Etzi0F84EHavFR+Cnl8cEpGoAZCQzZFi7p8gpeMI=;
        fh=R+e6pU9AZXEP8RpSA3FIbFcBEOdI84/wrbZh7/ByZWc=;
        b=iWVHqboz0uiTQKZiv2KNlmo34Tau2ye2uBOMhai1nuZLGfeaApEg/rQe1Q4nggM3Mr
         Ki5y6VIbdz7ikS+SEPLvvenr8rX4sFP++sgaSyVL0qJb8ipwpk2HJqteEfH+MU9GNV6L
         v/3RbaMD9YtBC+g/CXIw4WtqSimgjLlwbk9ShLTdypB/4LsZtKOs0KiN3U9HaoR0AHdN
         kg8UalpDRMl6W41ybOvaRzPDnJ2hKBNCuoM/eJo+EI0Dz0zO8q0PfP0pdGk+VxDAr+/o
         i0tM2/kAc+lIot0OoTa3ona3WOJqxFsS6GRX7EEpVzXCKFuNdNPdP95SGZHRhyFMp1z+
         SZPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787150292; x=1787755092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OV4Etzi0F84EHavFR+Cnl8cEpGoAZCQzZFi7p8gpeMI=;
        b=IW1TE8yLpJ8IycuVnjpM7XVKslaypCYN9D/g4mBRltkoFVqRboTt1T4fvSgl9dCK9E
         8xcLgoeOKT3h1JlCMyOgcrd5D73jtqRabHDRkPT3pJbOfmXy8d4Rt5y0U+Cbny4HL5O2
         lUyV4jfMu8XHlIhl2XbabZeFXx9HuVdLoRAoP2kzblnCK3Ulg4l0nFMIVuKsnBUwLr+W
         ptGiSy+Fyn+zwLTDVNdcoYt7iDTeFBYhz6cQQ5dBJ/1X0ZPsSX7tn3fn9kQEh0nX2ihv
         99GNZ1U/YHT3DJ2ojUxiq67rdeYK7WS2St8atV+15pDqh9/B708brwRCJXJYJ13Cw623
         toQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150292; x=1787755092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OV4Etzi0F84EHavFR+Cnl8cEpGoAZCQzZFi7p8gpeMI=;
        b=gcvtkr9PAhX5pjSsY235a+5hMn5FvLYZaMrpgaDg259l3LoDSz0mGP696E7FP9X4UY
         MDfQonk5IaIgPHfVjHZdQE9Mn4tqmy+fOrAklSbAzKZJ2FrCRAhfa6DxBE0wgd82R7rp
         8Xmbr44Q23lL9QqxLUC6/72ntgEr1jPdzSO98AfqJOijZ+ZGRCX4en7AEUUO7pYM+bJ5
         LHzgJ70rX1gve1/683rTI5JgzGKXPL5bszPnhZ6IeTkL47NA4q30KBgQE2hFkPZrcALJ
         WJDmXH//0Epub/k4xcmqV6vD0ujVexV9Px63xq/FtZpobDy+1CbjxG3Z2u9cVIm4kJnL
         iezg==
X-Forwarded-Encrypted: i=1; AHgh+RrpiZ7QhkzS9HPUSriw8rUf4fwRPw87MDAFvYtKItGEzUM95Dyf/j2d8FQigg0moqMfEr5z0twY9jRer4hv@vger.kernel.org
X-Gm-Message-State: AOJu0YxMHsXzrnRDdgBMFa4FVQNzKtY3FU+dszATs7GtAWCpumFa8uYD
	TkqazWE+dwltcaiCjDb1d58hbfbCcP/6fIjhUkRShdehxMBY9e97G6cgfYmYQ2Nww8xAb1iulDF
	zPORyfWg6VfPfwb50R2VXlN3NDlcYPa+BjlejJae1MAwCsfYho964wjqjUVStFBGHALuCUagv3z
	p74HG8QGU7Dwm44Df6otVoT0WRu3dJUDTcpfxldky7KgwPVAOR4jZNtA==
X-Gm-Gg: AR+sD11J6siPGu60F4KY0cB7xoJamD/OGdw/uIqjPJAlmH9lT+c6sjB1EhS9HG3D6Ay
	+kCZvvPQE/jqnPvJiSqfZkrcVl0jY/gRuNdjfN482zMviRwEoBhuJhp8Mzb4j2f7V2tUMrXJNPd
	oBjxa8QoPozRkELkpy/o3dUrd5n+o3k+4V0yHfQPs1cSicGnf+p/GqfjeC
X-Received: by 2002:a05:6820:1ca2:b0:6ac:b1ae:6ce3 with SMTP id 006d021491bc7-6b13c69056emr3835912eaf.32.1787150292211;
        Wed, 19 Aug 2026 07:38:12 -0700 (PDT)
X-Received: by 2002:a05:6820:1ca2:b0:6ac:b1ae:6ce3 with SMTP id
 006d021491bc7-6b13c69056emr3835876eaf.32.1787150291802; Wed, 19 Aug 2026
 07:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <3322b42b-3755-45ec-ad55-345125f0d488@kernel.org> <10349e29-b583-403f-a89a-9a00c73666bc@oss.qualcomm.com>
 <87dca76c-851e-4cc3-ab91-68949d283b79@kernel.org>
In-Reply-To: <87dca76c-851e-4cc3-ab91-68949d283b79@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 07:38:01 -0700
X-Gm-Features: AcwNN1UJH0MueaAt4fuAnOTplgnMr9BZwDd-FRtcH8UIxmOIWCFCFvjMK1YdptU
Message-ID: <CACSVV01eYr6FyA6XBG0xw0yv2dydvTEhcY-WUy07mxM8WwkZcg@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: g2vantmx30pODOceHe2d4TOhUX4tCo--
X-Authority-Analysis: v=2.4 cv=bth8wkai c=1 sm=1 tr=0 ts=6a85bfd5 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OXa2z63zbhD_Ho30eBkA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: g2vantmx30pODOceHe2d4TOhUX4tCo--
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfX45RNj1iXnitX
 fDxtPb0oe98Y0ji3cn+87gPB1/Cfr+MsbIaoNRrJ6yU+Ms4sGvMNg0WkkjmJOA88aA1JHN4KWJU
 XarGLpBYl6TpKgh13HVKYxGBaYHckNN5SME8dkjZGlkvy9W68KDd5J3imavMyEvznbQzfKQom74
 hqStgHMQkv1QPlMiAQbMr1OJ6mhDp2TKwivoZJJmL2/grRkofbsyCT3vuaJdSmOmb/lAtyNDAG0
 x2b1Sn4KfJ0BLr9F2sYLTdigIaClaqz6Cb188S55+Fo4ucHnWNVBnepVu9PyG8GBqJuw3QNUUSt
 Rt5Zrs7q39NuUZXKGydIXlLnOzyaIdwC/Ono1oibpU2jESWGAe6uawP9EfoT89FGyNKCW2dxrUW
 6xV4H7z1DEIDUwj2BtwjFqzU/DJgwdWpJClWdyV38IrqSaQnhKXSrucZ7UF1zGZyNnlYWPjrXXX
 JEeQwytrWFgkUZfIsiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfX2Yj86yhB4Kij
 xr7nvCz8GLgAJBxTyyyyt/iWZyY2/KUocBokAnGWM2c980Nqft40YcIkg4B2w5v5YKh924ikLhl
 xYDa4FM9wubePjbI6hvshKWDAg6uG1o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190114

On Wed, Aug 19, 2026 at 7:21=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/08/2026 15:26, Ekansh Gupta wrote:
> > On 19-08-2026 00:43, Krzysztof Kozlowski wrote:
> >> On 17/08/2026 06:47, Ekansh Gupta wrote:
> >>> This patch series introduces the Qualcomm DSP Accelerator (QDA) drive=
r,
> >>> a DRM-based accelerator driver for Qualcomm DSPs. The driver provides=
 a
> >>> standardized interface for offloading computational tasks to DSPs fou=
nd
> >>> on Qualcomm SoCs, supporting all DSP domains.
> >>>
> >>> The QDA driver implements the FastRPC protocol over the DRM accel
> >>> subsystem. It uses the same device-tree node structure as the existin=
g
> >>> fastrpc driver in drivers/misc/. The approach for binding the QDA dri=
ver
> >>> to device-tree nodes while coexisting with the fastrpc driver is an o=
pen
> >>> item described below.
> >>
> >> No. Grow/replace/improve existing driver instead of coming with a dupl=
icate.
> >>
> >> That's a standard upstream requirement, basically given on every
> >> upstreaming guide.
> >>
> >> Please watch old talk from Greg - "I Don=E2=80=99t Want Your Code!".
> > Posted discussion threads here[1]. Would seek comments from Dmitry,
> > Srini as well.
> >
> > [1]
> > https://lore.kernel.org/all/3476b5c3-7983-4994-a901-3d7d8bd75255@oss.qu=
alcomm.com/
>
> The rest of the comments is still valid even if you did not acknowledge
> them.
>
> Anyway, regarding above - again, watch the talk from Greg.
>
> You have ONE driver. Not two.

Long term, moving to the common driver framework (which did not exist
when fastrpc was first created) seems like a good thing.  But does
that not allow for some transition period?  How can we get from here
to there without otherwise breaking userspace?  Is there some other
precedent elsewhere in other driver subsystems?

I suppose drm exposing legacy fbdev on top of drm drivers is _sort of_
a precedent if you squint a bit?  I'm not really familiar enough to
say if that would be reasonable/possible in this case.

BR,
-R

> Best regards,
> Krzysztof

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793911991;
	b=3QfuLPB1DysUiorQ+IgeXzI1vv0XRFV1Ng8QpNDNGYy3z7hSrtB9lcHDCgxYHc5c5I9a
	 k7PUG2sBnt+4btckkF5firTVXGzLS195q15xnCYDRv0HfMPcrn7Qu7bCzqeFnaPj25blE
	 Oyd1oo90OuaA+nGXQFgNJ9hzKqz7MDV9DrmVf40YSzJRZGjbbdkb4qQPqc6wsDGurA7uC
	 s/HTDob2x2qg8TFdaEFtn94jxx70TpJs/Frm8dvZZljhEVkLf6WrXlUObkofgKIsZg0jV
	 dhe0Km3uFhyIStNlZ7gYQZ6+sBKkHfe9wpLvZx/TJLPuWgpjEfgJUtjvZakOT/PYMIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sX8j+rhapnFRAdikVp9Pz/gF+oALejP+4Db90hXaOAI=;
	b=q+vDXAKybL70vfZUYqUBeN8PK5z+UiS8xe5egklPKdZ1kivlvxn0SQy1tzg5XB6du9sa
	 4hPiQ4peSAb36ttEAQ2Db+ZLby8vD2KtE+1tBMePALWfgB9S9GAAy4DWIlshA/u6l/9Bi
	 gNJkSPH99kB/9EGrvt/Iqn8+xLptafnHFBAryjF1Uyb1JgIiCzOBDyWZLh/76tSmzQNi8
	 323NVfkz66nl3Hdw3/bmpSVo6C/pUkaV+E61632lkdx69tm4PERfYxRspR9H4vfxUwsLg
	 3d+lhOuxBBzV0y0BFKGH/OSeiHB6cK4xCHGIPH74AHrXjM18IZpXLmkHTBd5VTMSaVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqO43WIr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DrtOl5XG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B077B606A329
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 20:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B077B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqO43WIr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DrtOl5XG
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5JLWDc597692
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 20:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=sX8j+rhapnFRAdikVp9Pz/gF+oALejP+4Db90hXaOAI=; b=Oq
	O43WIr6igflvAIkd9ASejt2pm7/Vf9caX5Pk315Bc5ggbNfK9F2LpMRsevBqIwb4
	hPhmzZAYplsNr3OTmx0bYsmVnISLeK+458SAt6/W1bu4Jz3ROc2RmVBt8UUjiXCQ
	nZZBOgkiByaNQmV690shz+jF+TDJzxDb27WHOrSkeVYU20FfOPbqFYGYbera5F/5
	NHF/t/LinRDZ/dBI1uXdtTJ8n0TqT9UcD4ZQLFKVqPGiJ7wC6qhcV8yyDPgKpGqK
	i1l8ujZZSz8UlmrG/yE3H4ZQwpendLKunNHPd3xPOjL0W9EbmYiIoRz/+OJD0mNt
	BqMwb9IrwRKk8bdcmrHw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryvv0cyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 20:53:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so723169eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 12:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793911988; cv=none;
        d=google.com; s=arc-20260327;
        b=ScxeRD23dS33JVnMhBDZBmLVlBMwmjxfdssjbIlK1oNfklsr+hJp1EJYSLCGhBrEUu
         FCLTAapKn4Wkr579pukiJAUiUXz9SHLFp4CDm8ogREsvQzxTqAxwCCdFspaRjPFqdmD4
         WC8Sd/d4DZcdF60vsQ12XQBD76jhBmGtfcrDqEEdYe8HZJ71YgvOrsVvlHQNihX3hRcY
         YfFTrSfWA1UeBpToaHAH2tFCHsz0AItqE1+WgV+NGRWHdKOozlriyKu/1VkLHrZwdWbH
         GCMo93fMtuxE5QvV+/fnCOY9U/W9TKgwi9WP1mP/UK9fs0S/bUsAZFw11SPeUgB4OvsI
         ykIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=sX8j+rhapnFRAdikVp9Pz/gF+oALejP+4Db90hXaOAI=;
        fh=iHl1gEzk2xTSLjq+I3XsoTmOhonaBFeUHVZbXBTQBNs=;
        b=rlT7LQ4Mtqm9/M0OYNsksFDkC2tohJCqXVQ2CqUG6YrdYBmA7LZTu+bL3JeEga83i3
         ++h1gnyuSkYK79ZqQla4SafCD31kq0TvzJIDcU0N7qdzgMj39gDX7r5G/xIjS5q4Vk0F
         r2CwzlG4XRSzKaU/E70WozHHP1PGs7JOFTvqoe6pd+98mvACSXnWaAXdg9V96cAPplPI
         0pcM3FGzjtkc1UMCJONuyzGUkbbw+sMoGKCaIehFudAhcQiyM7WhKh6G8G0qXdSKgF3O
         zGbDfPSESb1I81f6uKM1Bj1EXGOl8SCaT9cthblIGK2ILrr985SU7a3OOJUD8StgWy/M
         JPwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911988; x=1794516788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sX8j+rhapnFRAdikVp9Pz/gF+oALejP+4Db90hXaOAI=;
        b=DrtOl5XGOehsOtEvqUC+fj9wHpwuD3InlEwY9TKuYw8BDNviAKmZPoXtRiVuocej5e
         6oVhKEbGgNHQERcwya/YPvM2pNiDbAuxMHxgDkmBgnbH+7lgPiCvJyYc+rqUhMFeoPJx
         IJHQEs1nFruweXwP98DK6sGIeArUOO8oMnBaAQkndKR79kJ80HCzBfp35OrkMy457BhI
         cMoXx40X0p83GP6CZXzRyExOepXkwecFleQNH5n9pWb056k1CI0QLgQSgJju+ZiATEOV
         ZV7K9c7sZiZZXyYIZNdVP/jLNVuAlXP1m53ni0+JmjSSWzUEVOGtpv4H6M92CtMNoqq8
         vmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911988; x=1794516788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sX8j+rhapnFRAdikVp9Pz/gF+oALejP+4Db90hXaOAI=;
        b=aDNrugK6Mcy+4PDRw3NTNivm7XaEclxCk2EdIBeY6u13hFzsts1E6BSi1nYNf0a1xY
         hjQqt9ML6EnZohvBa4h1U3jkYv8dihysgdsTDqub1ht9ZzGEuP5pcm8pDu5SFyHnX0QW
         sO7f4nCpdGLvOilX5iQK2lbAZFJ2wVO8yvU/I6/8EKj0TnkP8+gECyIZEfpaWBqS4z+W
         E7sjd2JaTF8aLi3SRxL6FptMwY3Q529iErjJP4QJ2G8BgKaAV6bbKrXFnAxMuQrojOFR
         7V5JRCDQmkZP0JCFrBkOMQziOTqYAVLxWNpLWqJz7aTHir5m3WgQ3zQ5A3OnMVPcmboS
         bqTQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3q4ykw74yaouUstuQsvIGE9COzAHXOdzy+ZbfXZz1LoLNNNT8UWilFP8J4UfaAkIaCPvcWQpq2u4Q7bZy@vger.kernel.org
X-Gm-Message-State: APuU4Z8zkI1b5fG8qij/I4UJ1hb+bOIMesrwHshqWye4Zt7CNukmRHO8
	DzU6r0lwvIlcYUaJWzGCr0oO4eC6Z4zttwq6tjVdiBl8brkAOpGFJvC1A2AcfiCgWcRcsdWzBy8
	tNKrMV6o37plECHlUh1DK/R5drlGrJtstP4IB1zl132jifFMY1aTsPL0LbcWX42D/Fyk9zyO7T1
	QbGLeZtfwyFYRbhswRqk2v0T6nvE5orYhd57xNauG3EEI=
X-Gm-Gg: AYBFou24zM4itG3lxIgfa5l4Jsn7D4iSDcYHxA3h1IdIvr3njy7zIdYK8D5BWA4Goag
	hQ/acHfkHN56uXK9jNx/rUxH+CVtq+Ez8CErRbJyaovX0TikiU2r3ABO0HhfPnNe6J/NJmqmr2J
	htM7aVybNetE90mjZu3bMet4Aa1vTH34ERFN2drpd9BC23YBuS3JCokisb07NRxBZyyILl8C+so
	Dh5q77RYbwarMXowZeNEA==
X-Received: by 2002:a05:7023:a86:b0:156:6676:d0e2 with SMTP id a92af1059eb24-1b25d2fe849mr303327c88.10.1793911988314;
        Thu, 05 Nov 2026 12:53:08 -0800 (PST)
X-Received: by 2002:a05:7023:a86:b0:156:6676:d0e2 with SMTP id
 a92af1059eb24-1b25d2fe849mr303269c88.10.1793911987586; Thu, 05 Nov 2026
 12:53:07 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
 <20261104-ubwc-format-docs-v1-7-389044012b4e@oss.qualcomm.com>
 <86b801ce-a56c-4ff8-8915-9be369fc0ce8@collabora.com> <CACSVV02t9=tm2qyG531f8Ne90ADAb1_ZDDGEg7PwDmoEvGxPrQ@mail.gmail.com>
 <7b4d3a85-6aea-4b96-a4d0-c2f16e488ad9@collabora.com> <7e8a6645f181c9e8d663eb97bb1f32e3e4fd8c67.camel@collabora.com>
In-Reply-To: <7e8a6645f181c9e8d663eb97bb1f32e3e4fd8c67.camel@collabora.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 12:52:56 -0800
X-Gm-Features: AclHuK_2VHyuNEs4DZc22sx9QJcK0ltaGhWBXQlToG9hpn9RflPMYR8eoL4qhGs
Message-ID: <CACSVV03Nz=das+fneMqx9UE1Vzps55=_An-DtmufRTxdhv2idw@mail.gmail.com>
Subject: Re: [PATCH 7/7] media: qcom: iris: describe QC10C as TP10
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Robert Mader <robert.mader@collabora.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfX3GegOBVx57jk
 w37d+86+EFg5tKB6PTrj9Bi+uxYwe2+F2DCljlHdwfUiBeuYDMJzllM+CbIh9WGpszONG/3W2qR
 XoXVcQMxiJhw1Wwmodw8ij8KOpPSJ1o=
X-Proofpoint-GUID: iKJ9VYiCuBh5CgYtRQyKixDYNpUJz2zw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfX7M/0VJothHJM
 J2voffKipSylQiMhWzZ/x+3xCPvlsiSVCZKqydbhhVHeMJPr45cZXl6vcvIPzWrpjBKO+wDFLJV
 yxNWOnxMDQ8BF1LFi0gl4Gl7C/mL02DW6RTii77CecYrtOubuCGGcxZXuuNS3AWtHHZPwlwOnct
 B8SjKRjoLxq3kNbdNFNkKIRqJtVBtVHvQkVrF0JUpNDPdcFtdRwYfZLL2IikjjjVLhs74KSHCkd
 sR1V0jDyjWuH6Wu/8GM2fV2hplqi8nZnyI4XQhSa307pgbT/VamOvX1gTCxx6xfnICFBWsIFYn3
 vP785/DaRhw4i0gCR+y605nBDnCAA8rLb1PjTZCLjuyBtyyrP31P4ZkqCHeftrCSYK+sOOnGyyx
 JXA4GiMYDSKSb876Q96oh9sJCEGPZLqZH71+RJKROW3tJx2GrxOYDzTAJbsKGrlt7hTe+9McZm9
 TBoKIQr1r2aA5SefI/A==
X-Authority-Analysis: v=2.4 cv=dKUzC+Zb c=1 sm=1 tr=0 ts=6aececb5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=vmm0ZkxeQxYXhTVWvzMA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: iKJ9VYiCuBh5CgYtRQyKixDYNpUJz2zw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050083

On Thu, Nov 5, 2026 at 12:35=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le jeudi 05 novembre 2026 =C3=A0 13:35 +0100, Robert Mader a =C3=A9crit :
> > On 04.11.26 23:11, Rob Clark wrote:
> > > On Wed, Nov 4, 2026 at 11:00=E2=80=AFAM Robert Mader <robert.mader@co=
llabora.com> wrote:
> > > > Nice, very happy to see the series!
> > > >
> > > > On 04.11.26 17:36, Dmitry Baryshkov wrote:
> > > > > The comment describing the QC10C buffer layout calls it a compres=
sed
> > > > > P010. It is not:
> > > > If I'm not mistaken the display engine / the DRM side (including Me=
sa)
> > > > describes it as P010+QCOM_COMPRESSED as well, and so does my pendin=
g
> > > > Gstreamer MR [1] . So if we can't pretend that QC10C =3D=3D
> > > > P010+QCOM_COMPRESSED, then we probably need a DRM_FORMAT_TP10, wire=
 that
> > > > up everywhere etc. OTOH if we want to keep the DRM side as is, then=
 the
> > > > comment should reflect that, IMO.
> > > IMHO we need DRM_FORMAT_TP10.. on the GPU side, we have TP10 and P010
> > > as distinct formats, both with and without UBWC.  I'm not sure if the
> > > same is true on video side but P010+UBWC was never exposed, or if it
> > > truely only supports linear P010 and UBWC TP10.
> >
> > Oh, do I understand you correctly that the P010+UBWC implementation is
> > not compatible with QC10C, meaning on the GPU side (Mesa and display) w=
e
> > don't yet have any support for QC10C exposed to userspace? If that's so
> > then we don't have a choice but to introduce DRM_FORMAT_TP10 I guess?
> >
> > On the plus side - this would allow us to make the format single plane,
> > matching what we get on the V4L2 side.
>
> Since its single plane, we should aim for a variation of
> DRM_FORMAT_YUV420_10BIT. Similar to YUV420_10BIT, there is no obvious lin=
ear
> single plane packing for that, it would only be there to support the
> compression. Or maybe this one is abstract enough to be used anyway?

Oh, sorry, maybe I was a bit misleading/unclear.   TP10 is still a
semi-planar format with a Y and UV plane.  But each of those planes
combines UBWC metadata and pixel data.

Within each plane, the pixel part of the data combines 3 samples in
32b (compared to P010 which is a single sample per 16b.  So not quite
the same thing as DRM_FORMAT_YUV420_10BIT.

BR,
-R

> Nicolas
>
> >
> > >
> > > BR,
> > > -R
> > >
> > > > Best regards,
> > > >
> > > > Robert
> > > >
> > > > 1: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_reque=
sts/8195
> > > >
> > > > > P010 stores each sample in 16 bits, QC10C packs three
> > > > > 10-bit samples in each 32-bit word, which is what the stride comp=
uted
> > > > > below (width * 4 / 3) assumes. Name the format correctly.
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.co=
m>
> > > > > ---
> > > > >    drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/dri=
vers/media/platform/qcom/iris/iris_buffer.c
> > > > > index eb8de60c1177..ec2bf2a2d953 100644
> > > > > --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > @@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct =
iris_inst *inst)
> > > > >
> > > > >    /*
> > > > >     * QC10C:
> > > > > - * UBWC-compressed format for P010.
> > > > > + * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples pac=
ked in 32 bits.
> > > > >     * Contains 4 planes in the following order -
> > > > >     * (A) Y_Meta_Plane
> > > > >     * (B) Y_UBWC_Plane
> > > > >

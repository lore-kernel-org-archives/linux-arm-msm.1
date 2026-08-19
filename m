Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8093AB48F
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153004; cv=pass; b=NgXOpMmuRfAm18eb7q3lRaqOGy8pPPGO2HsTA5PXk/dhJNRm/xyO0gawBcaTqR2sM5+tKcTSsxwqrG+/QwdjlhTtLVMpVELIEyubNPQq760e9S2viasq9MsxzGAh82nGjO/M/EXCwJr3tHnIzGxHhQ4C7Xr5AZh+b7A1Vsblb0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153004; c=relaxed/simple;
	bh=zgrW+FnTM1DV6L5kMs4FP8rCOUdtYt8xe+26qvHuZGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJB15h/HPNAtatUspj6ERBixIHxohfsqUHxDyph5pdzJaGP0zfJE42Qt+y13iW5PHlczb3KrN/ww+MLo+kDYSCycDuy+tpbuN1BIJlOK+k7VeqE5br2eYr5GQUv5riJQfoIHp6XF63PA/+/+VCmwRaqBzJ0p99boUT9weOH6Rqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqtYERns; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eYfmUCTw; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqtYERns";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eYfmUCTw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1kuB963759
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=KBH/fUIgWYWW3/6b3lc46QqFXFbnfFKPLKLVEnp7Rdo=; b=eq
	tYERnsZTS3kFgGZ+V6OYIfQSuwal+Wyf6alsTQxpOdLChbPicqOUuXLXL9yBVLVI
	DpPL8hQD+TSwk0o8IG05G4gjVuVAj19T/RyMlhPzZbqqBkVYB8y5x0mvZZim1dON
	idZbReCveIfOKPoQSCJrzVNApr4H2re1dYjZjPK6cXbayggYeOpiBcniVOe8aStj
	ldhZb7RZiklrnboO0MquBUxcpdDAnR3aFOnL/HzIXssMdY8hn9AkeH6xDVR4tofX
	rYW5hyrLveNflJWVikkwx62Dd90MdJmAlFQG53w/5Rw6/T5k++Ln0+TyhdZxnNsM
	JzA/VA+0/v6s5OPvt43w==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es3g3j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:23:19 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-48e5de5a23cso1336492b6e.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:23:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787152999; cv=none;
        d=google.com; s=arc-20260327;
        b=caU+PsOdxIohLY8O8WJwr77nljBIrHSSB85GxnfT8SWTBuiNheVCsExBf8s8a0OQqI
         qLBHYIYJg8MrCEcQ5VfgG7xaokKQT06hzxuQPjPR5dru+kSoFUgBF2e8KZ5vtvYR2/z6
         lYnxcXxF/jvyYu3AlwpHZ5/p3436ZY2WKJ4xW2xFxyNorwPbJXMAdISTauvNDki4rjl4
         0rwTw37mleawNlptY14lvdBueid6VFLjR5kRJd5CvWUzvKEQoZk/qAbU4b8ocVtYcz8w
         x1qlCaBxFwZm7Z0CGfx9/J4Qwcmhq3lnll40QXkABIgbt7+9jRefw53g+D+IqKPPtoqM
         eQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=KBH/fUIgWYWW3/6b3lc46QqFXFbnfFKPLKLVEnp7Rdo=;
        fh=d+SYHYSMWY1PubUhA41Kv6EDWLFibUHCORons3/VG4A=;
        b=etKMQuFO5Ze9sUTjj00eaJeInuzZ90EBUcqF8rR2KR6s5rsiLc15+Zr6no0sB7zDMP
         OTLUDSwbCWapgh7vqjeV78JTDX2IgGA8DcPfi0pPwXPNETD1zEWHemS749ZkE4cpdmf8
         X1uKEK91LUX/KuC+75xoPIT5rrb5S8qsV+DX1hNwlPbO86b94BPD6SrQrZgn7gEOcJBg
         tgEr77Twzg55TNIOVxXNfS9BGxyDtVOCupoXj9Z8rufDDL1tg3+zgl4szIiGY4Si1dHr
         j1duYBpcs46iCxw+ByyP9B/N4yNLEv3fAKShGTzdE94uer529lkYPZRiuXV9eq6mCh9E
         4lXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152999; x=1787757799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KBH/fUIgWYWW3/6b3lc46QqFXFbnfFKPLKLVEnp7Rdo=;
        b=eYfmUCTwkxq1B0YAPGAqFhhD8QA6yTCL0EfVzleqxsN2syZcbAZlt6EkBg2gLIVsfN
         4JODvqapdd0NAD4dK78dK1kzb+u+W120azaDEs9X6zIDQGqIuaO2TR54XPmcFKhWHIKB
         D0N22Y6v2LBkPzYuolTcDG7ZTU1tCNlF7ju3kpeN+jDmHezEB42ajYH3jlErhkrTNwr5
         kY9KBkjljJjQ6N1+I68qDmulYTjb2XQTyavCdk66+6KW96rRQ6WBD8ruxtDszh37A399
         sQghfxvIvRWCFewONKAr/mtlezfkwvgjOIZmHBbqsdW+tSJ1BuenrqpbVDEpgzgxpwHU
         sxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152999; x=1787757799;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBH/fUIgWYWW3/6b3lc46QqFXFbnfFKPLKLVEnp7Rdo=;
        b=QrXuzKMMsRxoqQzqv/f7k/f3cvIGgCWrNMS843dwg+9iubtqtqPgXD1mppN9shXYx6
         J1z0nSxtTdtvyJRvw3GilhvOtcPrO2r40PSm2sgF6Gvhbp92gaRbZas0D9kraHeS0vaK
         0pLQ2xAJaTgUPvzwWWWYvrjkGiObkLbZcrqTRATf2a3EapeOO50AuwYZbLkeMXp7rCpi
         qnwoSfDhDKOFdykmAqo1sFs7cBtRala6FPLsaYW5aWThXmrBheJR8jS1WUrkLui2dlHS
         W3J61qJ4K29jgGzZzXWUvn2+Ehjcu9CBTZoH3rOez1+O4HE/lLOUUGCnYDBidGAuNq1M
         nA7w==
X-Forwarded-Encrypted: i=1; AHgh+Rrrw16PyChpyvGl/p/5plG4h2Fs9+tOfM5V8M8Rr+pFfnxdfOa3GgVIpqxdtmJs/z5VtFnXQRWRHPWfakvj@vger.kernel.org
X-Gm-Message-State: AOJu0YyyWxd1c4NJwU5H1bR7cTtZtTXVYIT1RWG09Y+E6ATqdHEnM8x3
	yELiUj/ji1+47HHAFK03Ne3W50lq0HwM7T6r925n8W/LyJ09WNG/CsU625PduZYEBiB3WGioIgp
	oHPmfjtQxlOb6ASXW6wWUHsnyI2joGBd2V7LA1tKf2+0Mn47OgJyv9bo/nIDy4DuBtaJNKwN791
	QQfqa05hDzgyRBIcqhHRDp/TATExV4SxmIQUgnLd2ovbA=
X-Gm-Gg: AR+sD11lApTtiJ6KsUy8EoOmMCEb1JNW4taezkWP7tZSuuSG5UI8/vlIRv32ZjpqqY0
	ybEu1Wrhe449kQV1A2CPDvTT8/uSaVvpIHQ31k+E16p/LUsn+9uFkBpWLNOKM5YuSPfFOvjWBe1
	Ks0zrCEMMBdfeeu0OGjWD7TdaStyNkGRc7Nb255y2F6ZOyo5Ly+IIN5nyp
X-Received: by 2002:a05:6808:1997:b0:495:eb86:6e8f with SMTP id 5614622812f47-4b2bcaa116cmr4635294b6e.14.1787152998971;
        Wed, 19 Aug 2026 08:23:18 -0700 (PDT)
X-Received: by 2002:a05:6808:1997:b0:495:eb86:6e8f with SMTP id
 5614622812f47-4b2bcaa116cmr4635236b6e.14.1787152998435; Wed, 19 Aug 2026
 08:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <3322b42b-3755-45ec-ad55-345125f0d488@kernel.org> <10349e29-b583-403f-a89a-9a00c73666bc@oss.qualcomm.com>
 <87dca76c-851e-4cc3-ab91-68949d283b79@kernel.org> <CACSVV01eYr6FyA6XBG0xw0yv2dydvTEhcY-WUy07mxM8WwkZcg@mail.gmail.com>
 <318f14c2-0e87-4e07-8173-1511dca67d78@kernel.org> <CACSVV01T=ytVJKM7NRoBTAJm7vH+JPJNT9Tftu5X9YskGXerwg@mail.gmail.com>
 <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org>
In-Reply-To: <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 08:23:07 -0700
X-Gm-Features: AcwNN1WxA9fiQ0CGl4J8t7bFhD1MTRVpPgPEs_G6pBof5jMpK8zFCbjUKPrGqB0
Message-ID: <CACSVV03ypjBYkhRpt=TyDwOKhejKKke3x=Fi_TvxXN-5U_rCsw@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=UIrt2ify c=1 sm=1 tr=0 ts=6a85ca67 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2opUpfO7wUc-A3Q1rUYA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfX7cD1WfcAFdhn
 1n7b/PEsCxJ7C0OGBZVTtcUtA8ARn8XFWUmedBpTudMqBE0VuttBrJRN2Be4X3gzw15pShRxii/
 5BIOeV2f1iuawfxlJIv/XNJnLpY5FNp74KZEDOJKlKRTdS9SvoZKww15GTpdVT4yqwjkpQ5rVwc
 2RmmMU8NCyZf/h9Rl6sPt9n2wWRyBUQyuJDjaUtrUpGzT9j1LhuvdhXtFGed8GELlfyY/hXMzP8
 KT4E3TeQh/pbwC+Tpx1MEa5kugBFWOG2nJa3A14AwQ0gJDV0HBRCDUd7fhQjLDQsGaoKax7+V/a
 vE88f0jjD+aqkBEAfJaahO4eEozK1uT8CpaxSbEt7UDixnklssFE6+/W1cnPsyO74kP7SMH2ZoQ
 Y6S92kMaGbHWJ5VsY1xtDsLNDFZI/gtRFjMRGqRV0/u6RdaUNAoPjYBWrtolb3HReQateGiImpT
 8zsNb7MA2vYxdF4Aytw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfX+750SgpXC8l4
 FODwZlnvdqFtI/cyKfkslnCzaEAH02bzTj+ZNgph2pc8ZR5oNW3aXICPcKrTk3bYit1X43Fr8Cz
 1z+wggJXizbAwXfJ4J17WOqO2LQL8WE=
X-Proofpoint-ORIG-GUID: rOnngnORv3ZmLGfOHJJzhbN5ZTKZNhIC
X-Proofpoint-GUID: rOnngnORv3ZmLGfOHJJzhbN5ZTKZNhIC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190120

On Wed, Aug 19, 2026 at 7:53=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/08/2026 16:49, Rob Clark wrote:
> > On Wed, Aug 19, 2026 at 7:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 19/08/2026 16:38, Rob Clark wrote:
> >>> On Wed, Aug 19, 2026 at 7:21=E2=80=AFAM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> >>>>
> >>>> On 19/08/2026 15:26, Ekansh Gupta wrote:
> >>>>> On 19-08-2026 00:43, Krzysztof Kozlowski wrote:
> >>>>>> On 17/08/2026 06:47, Ekansh Gupta wrote:
> >>>>>>> This patch series introduces the Qualcomm DSP Accelerator (QDA) d=
river,
> >>>>>>> a DRM-based accelerator driver for Qualcomm DSPs. The driver prov=
ides a
> >>>>>>> standardized interface for offloading computational tasks to DSPs=
 found
> >>>>>>> on Qualcomm SoCs, supporting all DSP domains.
> >>>>>>>
> >>>>>>> The QDA driver implements the FastRPC protocol over the DRM accel
> >>>>>>> subsystem. It uses the same device-tree node structure as the exi=
sting
> >>>>>>> fastrpc driver in drivers/misc/. The approach for binding the QDA=
 driver
> >>>>>>> to device-tree nodes while coexisting with the fastrpc driver is =
an open
> >>>>>>> item described below.
> >>>>>>
> >>>>>> No. Grow/replace/improve existing driver instead of coming with a =
duplicate.
> >>>>>>
> >>>>>> That's a standard upstream requirement, basically given on every
> >>>>>> upstreaming guide.
> >>>>>>
> >>>>>> Please watch old talk from Greg - "I Don=E2=80=99t Want Your Code!=
".
> >>>>> Posted discussion threads here[1]. Would seek comments from Dmitry,
> >>>>> Srini as well.
> >>>>>
> >>>>> [1]
> >>>>> https://lore.kernel.org/all/3476b5c3-7983-4994-a901-3d7d8bd75255@os=
s.qualcomm.com/
> >>>>
> >>>> The rest of the comments is still valid even if you did not acknowle=
dge
> >>>> them.
> >>>>
> >>>> Anyway, regarding above - again, watch the talk from Greg.
> >>>>
> >>>> You have ONE driver. Not two.
> >>>
> >>> Long term, moving to the common driver framework (which did not exist
> >>> when fastrpc was first created) seems like a good thing.  But does
> >>> that not allow for some transition period?  How can we get from here
> >>> to there without otherwise breaking userspace?  Is there some other
> >>> precedent elsewhere in other driver subsystems?
> >>
> >> Yes, Iris and Venus where we agreed for an exception (two drivers) as
> >> long as new driver supports old hardware / features.
> >>
> >> This is not the case here, right?
> >>
> >>>
> >>> I suppose drm exposing legacy fbdev on top of drm drivers is _sort of=
_
> >>> a precedent if you squint a bit?  I'm not really familiar enough to
> >>> say if that would be reasonable/possible in this case.
> >>
> >> Growing old driver does not look complicated itself. The only a bit
> >> tricky thing is to present somehow exclusive interface to user-space,
> >> like usage of one disables the second etc. Depending on actual
> >> differences in that interface.
> >>
> >> But having a duplicated driver is a clear no go and it is well known
> >> upstream requirement. Nothing new here.
> >
> > Would it be acceptable as a first step to, by default (ie. when no
> > cmdline override/etc) for the new driver to bind to new compatibles
>
> You have one compatible.
>
> > and the existing driver to old?  Ie. have both drivers but only one
> > binds on a given platform?
>
> I don't see how is it possible to write such DTS, because - repeating my
> question - how many hardware blocks is there? I believe only one per
> given DSP, so how could you have two device nodes?

Maybe I'm misunderstanding something here.. I don't see any new
bindings with this series so my assumption is that the bindings are
the same.  What I meant was something more like "qcom,glymur-fastrpc"
would bind to new driver but "qcom,fastrpc" (which seems to be what is
used on older platforms) would bind to the old driver.

So single dts node, but different compatible strings picking which
driver is used.

BR,
-R

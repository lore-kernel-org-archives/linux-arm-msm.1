Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663F1476053
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391504; cv=pass; b=KQx0/Ihr0VxtpHX9AQILP2O78JBJcouk+5reeXLpW4ADh+VfuEp6NC/ipJOieKzGGZvI6QV6MljM7cHSuRRZKMo12VaJTlAKntTAjg/4lBJBtUOZ4bazI68I1W+U5Zky8j2mykp5c6FF2o2liIl7kQtDNaBlLACQnCE11s96WxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391504; c=relaxed/simple;
	bh=B55hy0c64L5iGDKfZOVK2tkRkiBptV3XMV9lB12/8bA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWwIzcU0TiQwbCJ0UGfrPMaBWtcTiDXqf6zetJW/I04V14edsw9psF2o1+xuFqNDPzN0WyMG1RsC6knaOrTZHFRsKuj3FP3exdENE3uCI/PgZ8fvyuK7qqXTypTO7G+qR34WgiEnkg7N/n32H7h/WjZ9RUnHdVec7skuQLB4oHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RlOYK6no; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/FnrFjE; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RlOYK6no";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/FnrFjE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0TwB510941
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=1djMLQt6LA5WJSyvM29qjmQzAT+wH5w6KqZ8nP1adXU=; b=Rl
	OYK6nomNLUYUtxkEBUgGm9alaMEh2kShikXrceQC75dRTTpHSf61ufnfShaoM6Bm
	IefB4HCE/4GyQ3Dl4zxOBKquwDzdnNFSlIA5HNJcRvr+fAk/EivHGDLhINeMbJHR
	M4IY5srTnn1+9kSDAjjRzwqVpZD4J7YwM7YJQZKe5cmyvgYrUI8yqugxXd1PXu36
	0v0nGHh3OCmfxfP7u9vFI/Av+XWEHPqPINkxtAZAtdg1RPApSA3GvCWrSrYwgI3P
	kGZaar+6q+nWOhSrkDFhwSzrbxZYoicm0hirw+bAuwuP5kF5Soz97awS/BbAdR1A
	N1sPAshK9dRvuO0vQAbg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtg5ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:11:42 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a41f46d629so5652614b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:11:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789391501; cv=none;
        d=google.com; s=arc-20260327;
        b=Y8qX+lQJcM8uPPAi5nyT9++nzqHAHvmnAia3oLgmlR2xcT14wYSRBEE0n2kH6CECbu
         o7PfvXSh493EDUXgeICL+XRggnlWvBpQgHzMMpzJb7uGOgHIxawgMZkvntXuU5PDfDEv
         Hi2LWhKPU+Hp2ewNQKtmi7rChQv//yj4J5f3hV+zOXbipebZLmnKhi/UXpHp0W7emepQ
         uoBuoxTnOzCiRSBh+MAUPv8y9Ya+/hiczaq/IYMkGFEIKsdQzshJzOnArs2UKTXsEFym
         J7H3XBr3++z7HW2F6doN9Kv8tjZFlVvi2IHduMliS8UI3C0DZ/r0rt+WqTu6QAE+Wqcu
         UFbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=1djMLQt6LA5WJSyvM29qjmQzAT+wH5w6KqZ8nP1adXU=;
        fh=KLKhUXPoRapjykdc3yZBGX5FYzJyKNYGb+GkC2m1HBU=;
        b=kDZVEKyMvo0YSGTLmUidaET8YMSenobZYS1G+K2XefpCPC3BVU/3yzNtFNC/cWJvYW
         EgWNWTVsXET5NjoUM+8uxhio8tD9l6hCs82wz/snD3swt7eI5971m9buK2mU0TNIXUxi
         bcoqBplbBoLnr9O9xi44s8S3t3ODqPIA4XWJSq1AaeAtQTTWs89KGjV2IC8tkEWlBcs1
         /k7UDFjr2sm5SJkJAq4p3aKHbD4aJs4XX1cHWO7X+N+SaqrYbVzGskwM39bZpCAFxkEl
         dTDl0l9AEcuPVvB37/czpf0ytxCYB/HXLcZP6Q2lPRHrtCUwuvZp8dvlmMgYewM0H46q
         cRyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789391501; x=1789996301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1djMLQt6LA5WJSyvM29qjmQzAT+wH5w6KqZ8nP1adXU=;
        b=j/FnrFjEA/8ZFedUwdIjE3SSsafuOIoGJuiW97ovxH8YxqkuiXdB4bdsrUKrZLgXbj
         4+WWVdMqSkwRK86qw8oF5f3pM+WCcx3jFR4iavQ0mO7HRJXAgaLX0JmUflpOgf94E+tI
         PAbW9H6AJrFtclJ0xBBmJrKJIMGUVn4ZBJbWeGP2g8sK5dI26U92H/bLKBs2Cb3KIaTf
         zWfwlsJ5KjTUsp++ZFkObetVI+s/DCW/yGp/kwtpl7EFXbX254DFEjttJzV/PAvPFOVy
         1440cHpuFpkzzrsxpWCEFsk4REzfFJxrgyF8/lAKsWz01rVAEbJyPXjsX8yHV1sstUd3
         qI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391501; x=1789996301;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1djMLQt6LA5WJSyvM29qjmQzAT+wH5w6KqZ8nP1adXU=;
        b=cgXRghnqunOIf1gdfLeCD4C/O+89daysPZ/cJOwEgE9Oj3h1lcYmw7q9Y0BUUTlqQY
         wz01q+RnNpPSiZMWtmtJDRAoaE4k99Xcj1yAnFYO2s2X/uMsMcDo33eeBwcRGcAsx4yO
         2aPsYty5HvQxZViShbWyfN2JrKfixyWAMLuZ3Aaek1e3WEbGuljMIwuu+vsmwOcaNhtj
         82zl53aWtAXQ6nCoyrxdQJsH8mTHHRkR0T3W+au2CmxBkAjNonne1tp6rEKuEb0vv9MN
         oJpsYh9An6P02Jqa4/rj2Av6RSd4zD8aIcTRXS8T2ZYNL9XjP3ui/xz7Drb1ThGtfxSZ
         eRtA==
X-Forwarded-Encrypted: i=1; AKwUvByA8lTtU3pDSw7gKo/9yiawTir1WtCDwP4cEsfOTdnsXdpHzH7bxDweZoClghMwPaBlpJtiG+7XuQmhA8lD@vger.kernel.org
X-Gm-Message-State: AFuF++lrcuVrJNZwdA58QcXeVE9/UduNXuXjPzlhbxGOjSCsxsYKaBfh
	zjzz/NWdUPeepXZ8LU/dLk9zg2AFabLjuKFuk0JlzHKoTLT8Un0KyErjDSjkMyavauqocZd7xI9
	x4kO58CQqvj5lNzzSsou40MwZ4FmWCFsAHiuMMege37Av00kf6nZGNsrsX1ZHZeanC0QzKmFc1N
	SsVSIDzs9DEfBE9aQ6nq9nj9k6wGUoQ/gHrJ5i52hIZBU=
X-Gm-Gg: AYBFou1ToPRNW9FYJM3nGnYpCJO7fhEYlJ4Tr/IYK9HWVEF0YdqeoZxILPhnksFQOnM
	ioYfAtXq8zUy+8l20kynRG8TinEnNSEqbEcEBZbAeIn4fh/B1AYfWAuEMc1o+qH4vAJP+og2k6t
	1cicwifHR+horEzp52Q0+KRtjMsXV9lsHqTZF+V253gtSCGNt9hUKXeZQn
X-Received: by 2002:a05:6808:6801:b0:4b5:5bfd:518e with SMTP id 5614622812f47-4c7b42c5fe2mr1784233b6e.20.1789391501535;
        Mon, 14 Sep 2026 06:11:41 -0700 (PDT)
X-Received: by 2002:a05:6808:6801:b0:4b5:5bfd:518e with SMTP id
 5614622812f47-4c7b42c5fe2mr1784191b6e.20.1789391501098; Mon, 14 Sep 2026
 06:11:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912145922.24115-1-robin.clark@oss.qualcomm.com>
 <20260912145922.24115-2-robin.clark@oss.qualcomm.com> <12b7dc43-b9c6-4cd5-bfaf-fac8bddd7352@oss.qualcomm.com>
In-Reply-To: <12b7dc43-b9c6-4cd5-bfaf-fac8bddd7352@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 06:11:29 -0700
X-Gm-Features: AcwNN1WXFzG55PRo053-QCuRiZb99AXL7fZ42PtjLhwj0qFmTajOFG4rVvx1MtY
Message-ID: <CACSVV039xdc2+VAAm0-m_LaYM+uwGWFm2Qc0oZ0oSSQ-GJvWGQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/gem: Add modparam to disable shrinker blocking
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa7f28e cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=e9D9l_ksrzWtAqLwVioA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4OCBTYWx0ZWRfX7GsRPAs8KwWb
 TVvW4O000cu0vpDqTHQv358pH5sUUSdpbqnpOLi1KS4RmGOhbiNnVHrNzGi/LxZnh5MtFPIQ8M3
 ocmTxc+XUkfVNPhG5ql4W/zTfJIItoTkIAM6PA5hnd+WZuUeaf4Ke5pleBhUHBz/5znjYaq7JqQ
 SZ6E0I7GkuZSl4gOLPVw/zIddDeIBip32SsfqXU5Bm6LLsv4UmKvynTvtYlSUWraxlDhpHxkuvi
 CVWcuctcWWdXifdrIq3mj5qKk8IROMaRbWqkcbOm29Hb56r2ElO5L+GVmpYC4zXZDH9D3bWjEvZ
 tHBnKIJo2ZV677iRoCVsTbuILY3UOzhJ5wN1DsnI7J6A1CJ9Ca++0UHK4hUHUneH5KX+t1y+cX7
 PQFRNhKmkPo9OyM/tiQqasqIj+3KU7JVk8Xvu9d4wehl2axVGXEHLAg+Ongj7Mdtpw911yAq5Ic
 AvI7i50WG2IgNzX2/og==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4OCBTYWx0ZWRfX8g6LxV93m8At
 +HnsKy3MnXQKL0tZdXgJCn3RR2UPyGuH1ky4kwMoo7einYUuOSP9XlY/wpgxYa+N30gdgRGvgYx
 sBCf1QzJnpqlfvJs/I9URz/aRdxJkoA=
X-Proofpoint-ORIG-GUID: QcfKe6zSk18eTFDzZ5RPt9EMLoTu_6HK
X-Proofpoint-GUID: QcfKe6zSk18eTFDzZ5RPt9EMLoTu_6HK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140188

On Mon, Sep 14, 2026 at 12:56=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/12/26 4:59 PM, Rob Clark wrote:
> > Normally if we are under enough memory pressure, the shrinker will
> > eventually start waiting for BOs to become idle.  In some very latency
> > sensitive use-cases this is undesirable.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/m=
sm/msm_gem_shrinker.c
> > index 3514d5c84989..83ee032cb21d 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> > @@ -19,6 +19,10 @@ static bool enable_eviction =3D true;
> >  MODULE_PARM_DESC(enable_eviction, "Enable swappable GEM buffers");
> >  module_param(enable_eviction, bool, 0600);
> >
> > +static bool eviction_can_block =3D true;
> > +MODULE_PARM_DESC(eviction_can_block, "Enable blocking for GEM buffer t=
o become idle for eviction");
> > +module_param(eviction_can_block, bool, 0600);
> > +
> >  static bool can_swap(void)
> >  {
> >       return enable_eviction && get_nr_swap_pages() > 0;
> > @@ -26,6 +30,8 @@ static bool can_swap(void)
> >
> >  static bool can_block(struct shrink_control *sc)
> >  {
> > +     if (!eviction_can_block)
> > +             return false;
> >       return (sc->gfp_mask & __GFP_DIRECT_RECLAIM) ||
> >              (current_is_kswapd() && (sc->gfp_mask & __GFP_KSWAPD_RECLA=
IM));
> >  }
>
> This is just a guess, but can we always keep both and jump out
> of msm_gem_shrinker_scan() early if we can satistfy nr_to_scan
> without locking?

We do this already.  But a pure vulkan/VM_BIND userspace that happens
to have realtime compositor requirements (vr) has a hard time under
heavy memory pressure.  Without BO tracking the kernel ends up quickly
looking for anything to evict and not necessarily making good choices.
I have some half baked ideas.. tracking LRU vm might help, etc.

BR,
-R

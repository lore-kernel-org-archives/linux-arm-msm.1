Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75E0440628
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 19:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797197; cv=none; b=hJKjJNEvfiB+YPjEk2ZYktD345+LSBZW7J0vLR2eh/CodIpXf8v4P0S2kLw1tLsUQ/+YAjprrWimoDT7Ovhgzo39PsMeJZubgLCMa70i37PL9E0szKDNBlcYmt2AkA0CTJj6p94By8shyQtCSzu9CDcR+zqtufotZR5L9ATsiPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797197; c=relaxed/simple;
	bh=dl4QjpNKqAkP4zCsFnylPjiCaeUL3lAIsnLcEwXqTQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eklqvcDh7vOcjPxnFoSGw00LkEZxLc3NC7/HQ1iz/A9HyApPTgcrelxuBAZp5pbRdS6SRHhHIb6x3uhEGq13Ve/c+61m9Vr1Is86+umQUtt9nreg+A4uACJv8X0DahLCFaW06pcg9Q05hcW7um8lBpviSBo4YTjUNFOBgvf1WaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iq+1l6iO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LuU3u+Do; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iq+1l6iO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LuU3u+Do"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHf9lX1110257
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 19:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZIwUVVn2XD5RlNtj5pFv3FY2widvV63M2fwz15YP7Ks=; b=iq+1l6iOt43+HODB
	OrP2L1N18QN8DVokSnxOSMoDoUYxGEViWcv2dXrfeH6pIW7NscwRUUD8yOm0ftDC
	hzY1EHzXXhkPcXAFxgqIg5AVuNU6sKBKLrtgSuUIz5x4KOgVkOIQRo3AbV7Gb9T0
	ORkpaU9j0dGWsf832oqkqVSEwYPal3KZUKiCPVkXsCvo8dTEFSs40d5+yh9CMvJY
	4jUSwTQlnMjY7JfGKNzXwh91020S0N1HPgBjS/2i8h97cECtAVb5+9kWhbQ+m5fd
	igmq3trzbanjXQJIHCO9jLIUv+3eyCazHiVDU2UG04Ycv6H6h7AoaHx0RxkbsVbo
	7i0imw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh82r10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 19:39:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so1490075885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 12:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790797194; x=1791401994; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIwUVVn2XD5RlNtj5pFv3FY2widvV63M2fwz15YP7Ks=;
        b=LuU3u+DoDKgxdGA2w1CRsGxqmv/U4QdPoKMo+ZUFSmU2Hg5DspkE19hrFRlXCkXSqG
         KpTEm2MfcZcTEkrvnVKvfUH8FavQWvuocw43nuCKYAVRN3JGL58InXPqXpyJ2cXqd7NG
         w2/kUUvNpvGwJPr7pcTzp/bySv7WkUlY6aSjufHkeHGk4S7kL0foEGRqy76ypTN2SXjb
         dXW16h96LQyhifSYyuj3nr1w9RPHVbU7dYs4tfqdMpbEIBUzk9EEgg0jKaUop02ngtns
         NvUCwJHi+QbBVlWtSVVmCJjHB6R57+D84ocMTGkmr5fuYa47naycxxUCLhnpek6wIbu4
         kDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790797194; x=1791401994;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZIwUVVn2XD5RlNtj5pFv3FY2widvV63M2fwz15YP7Ks=;
        b=KcZR5WXmn73TuS/1n2zdmxFgxr5FvxP9YiQT7Uk8e8u0XakNfd9wRb1w9gAbrCTkUh
         22jSPbcvWiGT6vUNoyIn1xV5D0iGEbeG9WEzKYBzrcp0qDM6voi5dVLPVrxhO45Hh99s
         LaLOGxNzP+iIuSGJr8tMA6hxvf61EezinwsxzvQZIb2FhQoxL5ASANBeHzstFm7FhLl+
         c06IKHyxb4Ldt5stIm+o0gg+kSiyV2oZVOjmldANOgMuKCwDX+Z0aEsSsb2axpnjW5WA
         hA/ZVOLQMrpmrtkiLZfA3fEtWcWuGB3sX2x2bLvQMX9dRBpGOtdt1j8rgJQp/e+DGOMd
         cCbA==
X-Forwarded-Encrypted: i=1; AKwUvBz+tAaZcJKqLhBnurSQuaImQyMoJuQKfOZfDyeMAUkFP5wxkedIgLxDjRkhlFRuePFCSaMGfCh41Xgd8AKc@vger.kernel.org
X-Gm-Message-State: AFuF++lEbomyFgPMAcOuWW72wQpECgwD8BKKnHoFfjglLysvjJDMUuZ8
	3yBNJIv6NK+YoXDsxoAZ70fmAEbSkzVB/kwSlVM3bRVVeekyJExgJfXBfNj9/DzgpPxV14p0oJh
	+7QY6qYlhVMDlfW0C0+Clan2nrN1CfT5ydLgeRKPqH4eZMYud7wu9hHi0bYQ8KB/zn6Jh
X-Gm-Gg: AYBFou2c5X2n8EWS0+ixtNEvkQor/NhVmhsN5fPK4GjiPDe62+VbWcjl4dXz6ylO06O
	OvsMQc/frufUCooNCAct4xFxIKnddKz1wszBTwGsMrQSpm/P22ZqqULx3o4I0jFqxkPAp1sZw0x
	8nbabnN/+pJQj9iEz2JuwcHTPZawQoHE4MWINowP24+9L5qYLP4oGd6boRU+/vgADuBwkUA/Yi/
	rZqef/EH4Ky+xC8ENIzZIA0F/6G4d15gRQm0lyPojnmOIT+pug1fAftle7S53gvwM/T4TomiPRO
	8xZ7igvkz+TWYegQ+HGZVfCTnUrC7wMhyzEJCPPXB5m7vT8/MT5tyagX8FIkuCZ6d13Bo+Tq/Kd
	gOubKb1mapb1AXRb25JxLZVunpebXDu6f6oPljtiRKFdjcN8d0afPFAQfbGSSVCiDrNLmY1YGpU
	xCRrNgk34l9p5V
X-Received: by 2002:a05:620a:4728:b0:930:9091:f0ce with SMTP id af79cd13be357-93cac0bc11emr385860485a.22.1790797193924;
        Wed, 30 Sep 2026 12:39:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4728:b0:930:9091:f0ce with SMTP id af79cd13be357-93cac0bc11emr385854385a.22.1790797193398;
        Wed, 30 Sep 2026 12:39:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a7717f21bfsm9587661fa.18.2026.09.30.12.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 12:39:52 -0700 (PDT)
Date: Wed, 30 Sep 2026 22:39:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v5 2/6] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Message-ID: <zr4c25viml2zz2wsveroirwg7ufs4ptlrv6tluqrjtngw7v3hr@firiyjbrj4cq>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-2-c042266b9eeb@linaro.org>
 <5r6xd4iiwnv2v5ji7xeddihlqstmtajvw5ixmntlwxxmcvo7y6@zueqflvz3lr5>
 <CABymUCP5Gs5Zx9C39RHj+1_mU7aLou9sfgZO=7yS=+fVPWHeLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCP5Gs5Zx9C39RHj+1_mU7aLou9sfgZO=7yS=+fVPWHeLg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfX7+sTm4Vx/vMq
 yBphRqZNnjatVSY8JibT9bOJws+PS9C4sOfUVppoWtmqCOpBBxM0QBp1AAkK1KaFRO+4xPWnioA
 ahAXXct/cUooKwTQRuVihEEjpuzaEIU34NrGpo19TwrMzPklJAhtEMUQQY0yuefZ1pyxpwDiFbU
 FeGjdfaS17zV3bKM88K4reFQzO7kOmZ7g+ydTFgskxBrbAXKb8Qt4o60vx1i75A+zdsOcKWFT0C
 JOYq0a2a1CGkUI2J/cXEQw4zj+YdCNEZwo379STho0IaSyqebv8sfkL+cp2IQSO2N92Qym5K2et
 XFrAb+AdTC5cYd3ODRt/YAQqsHUmNVCTc5Bv/8UkvjDqD5UJzq8szODN+BeVt6jC7LsX6d6jOKE
 vn1SoV8BItZuHoWtmsZoCjZ0FiBAjEdQmQg93WUfrC9hirOe9Pvg4o5nqiB3dESdbp++VrlgQ9H
 11PTX1kPZ9Bgr5/BLGA==
X-Proofpoint-ORIG-GUID: qFSahYvsr8SlJXvDKnpI82yikaqU-mGv
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abd658b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=RAbU-raeAAAA:8 a=KKAkSRfTAAAA:8 a=GV4QO6qSl_99BXC8EjIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=JiizpSU_mAIq9zsZDqn2:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qFSahYvsr8SlJXvDKnpI82yikaqU-mGv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfX/BtjuEQ0iwQ4
 /7fm3uar3vvbBva7MQMFuJ/eOo+IzR6j24z+feHOZ29jkUzTtL/cGMvqFVhGljNbYpoGMKb6x8h
 +z3C99DOzt/UO2cTBpoQGYv4GyPTio8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300080

On Wed, Sep 30, 2026 at 09:42:41PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年9月30日周三 00:03写道：
> >
> > On Mon, Jul 27, 2026 at 04:08:41PM +0800, Jun Nie wrote:
> > > Some panels require multiple slice to be sent in a single DSC packet. And
> > > this feature is a must for specific panels, such as Sharp ls026b3sa06. Add
> > > a dsc_slice_per_pkt member into struct drm_dsc_config and support the
> > > feature in msm mdss driver.
> > >
> > > Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> > > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c | 27 ++++++++++++---------------
> > >  include/drm/display/drm_dsc.h      |  7 +++++++
> > >  2 files changed, 19 insertions(+), 15 deletions(-)
> > >
> > > @@ -1719,8 +1709,14 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
> > >       msm_host->lanes = dsi->lanes;
> > >       msm_host->format = dsi->format;
> > >       msm_host->mode_flags = dsi->mode_flags;
> > > -     if (dsi->dsc)
> > > +     if (dsi->dsc) {
> > >               msm_host->dsc = dsi->dsc;
> > > +             /* for backwards compatibility, assume 1 if not set */
> > > +             msm_host->dsc_slice_per_pkt = dsi->dsc->dsc_slice_per_pkt ?: 1;
> > > +     } else {
> > > +             msm_host->dsc = NULL;
> > > +             msm_host->dsc_slice_per_pkt = 0;
> > > +     }
> >
> > Why do you need the else branch? Isn't it already NULL / 0 by default?
> 
> AI bot review comments reminding a case that panel device may be switched
> to another panel. Not sure whether it is possible in real world. Just add this
> for safe.

No, thank you. Either it can happen (and so it should be handled, maybe
at some other place) or it's just a pure AI dillusion.

> >
> > >
> > >       if (msm_host->format == MIPI_DSI_FMT_RGB101010) {
> > >               if (!msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR_6G,
> > > @@ -1757,6 +1753,7 @@ static int dsi_host_detach(struct mipi_dsi_host *host,
> > >       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> > >
> > >       dsi_dev_detach(msm_host->pdev);
> > > +     msm_host->dsc = NULL;
> >
> > If you are fixing something, it should come as a separate commit.
> 
> The same case as above.
> >
> > >
> > >       DBG("id=%d", msm_host->id);
> > >
> > > diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_dsc.h
> > > index bbbe7438473d3..c522ab3d71853 100644
> > > --- a/include/drm/display/drm_dsc.h
> > > +++ b/include/drm/display/drm_dsc.h
> > > @@ -267,6 +267,13 @@ struct drm_dsc_config {
> > >        * Offset adjustment for second line in Native 4:2:0 mode
> > >        */
> > >       u16 second_line_offset_adj;
> > > +
> > > +     /**
> > > +      * @dsc_slice_per_pkt:
> > > +      * Number of DSC slices to be sent in a single packet. This is not
> > > +      * part of DSC standard, and only used in some DSI panels so far.
> > > +      */
> > > +     unsigned int dsc_slice_per_pkt;
> >
> > If it's not a part of the standard, I think, it should not be a part of
> > drm_dsc_config. In the end, drm_dsc_config is also being used by other
> > parties, e.g. DP or HDMI. A year ago I saw a version of this patch,
> > having this field in the struct mipi_dsi_device. I think it's a more
> > correct place.
> 
> I will move to struct mipi_dsi_device in next version.

Thanks

> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

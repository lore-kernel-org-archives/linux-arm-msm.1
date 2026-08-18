Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2783E305E28
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787023439; cv=none; b=nGjZQsm0tIrMSUjjZ+ncYAHRcR76eRO29T2ymSHq6bIPEYciX1bATUd7Uv8YoPiR5zrqpKYv0EPGsNHNzlsTlKnzE7tF+zkAEnQcVzsjrhv+5rIhwISERmcpVpJsYQaB4/5jIIQFqypI+OQORyen53gAjSSUQZLXUBXhMbMoSjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787023439; c=relaxed/simple;
	bh=i4it82UgSiwTHBEWCaKh05FzB4AEmePICxapdenCtSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eADJsmHmSzfXwlu52RoW3F6uTye//ZN+RM2jtobSdephpTK5OHi0ACdLY0oiChcx7Hda0+J6als5hWNgybgkis0R4M7ZvdiSeCJWD/tKtpl8cmPrvJ45KmAiQXFxv3w/Cf1DRzxB1BinI/Pmz91FQuYw8xl3d3lSpNP9BEpo0g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gi7yg6CS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f5+zA964; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gi7yg6CS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f5+zA964"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLki0X3370359
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Mj3SzAcaCvmOfibRhtunrb3
	JChcTu1mYYWf77aYRPc=; b=gi7yg6CS3RxGzgedATshcmJaiGXWKnB2gLVvLaXH
	hblFxCEsGbQ8T+Wfp5yRC73yoh0cDC2MmPHF5vmXT994rkU0z2erOup7s7coJW+T
	LarnShSR/xs71I+vPuRdYJN2Ti7V7Xz+Ahqz+qDd2yv5DW939Sc78whe+eDLzI0v
	Cpob1u2wVHwQ0GjwH5CYJwCzy073L0Ktd6hP8Yy1s8uttIomxS/7hXfFyVfZUAT7
	8OaAPCeptjLxrQDG+lWbWF48QMqc+5J/Egy2f0wF/j2a/JNkqv+sN1BjauysRPFQ
	J7G7MXFCpMDwiRqATI9FYOqwoR1Ze5mqJFVQcN5ogSsI9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xykc8kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:23:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936cadb0e8bso354691685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 20:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787023432; x=1787628232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Mj3SzAcaCvmOfibRhtunrb3JChcTu1mYYWf77aYRPc=;
        b=f5+zA964ntVCYM1YIlSasEx9/HMyMgCoSA9qf3CcMxNLuhQlMQzSJqjOrch54ZVD4D
         m93QZtveidabEaeb2zBrlmSuISp4wCZFWsftHs9F4q+gVKHQ9QGttPIo/CBglGZfMV0E
         G9rGo3lopNBZzdCqQrqJBx+9V+an5et34SYj0owJWxRhjH1lw88ANdjlZUSv6k+8P3Jf
         E1jwoq9RlUhO6GH9paCBLbqlKPmFt2WUKHpz50JX6SNkttYSm8V+OjfMHJ2RL1/1GyHj
         uWrO57Y6wcJ2Uy/gEdMGhaS+eaKRTBtdyTXvTnsiSFOWRtLu3y2YLg73rOVX5tqWYGQA
         6zsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023432; x=1787628232;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Mj3SzAcaCvmOfibRhtunrb3JChcTu1mYYWf77aYRPc=;
        b=F/ilMCBBhn0PSyHkHSjG2gXykc9hcP2k0U1uQgB/6VTzgmJMgGQv5g9qZFW9dQB17z
         HxWFLle2M6DQGvAxTOke27203SRrjFAaXMwlYvXlN4EtiFhTQqURY+28M5gy4mCuwVNf
         X+b+o454fiC87AEC79NOkfbpnI7w9xeMKjloZamvaDaNedxTqx1In5Z8hyYUDEBas9ui
         4b3mczXk+JnPtk9FYEk+OVPcp9daLCgolTEJVGKQwURu2U+v82mHsl2j299kWKXyxYL9
         goQSnon436jJwz31BxrW7H0fg/5dO+NmoK/oi4RIf+V4f/98ay0KQE6+BIwX5J63lcf3
         DQzg==
X-Forwarded-Encrypted: i=1; AHgh+Rryn+Xua1yk66QpYYdEhRwyh5gleoDvhGjN6/j2nHIwwxxwNI+PZoNrrSIN/msEh+cEz+EU7thhXvoAQ9oo@vger.kernel.org
X-Gm-Message-State: AOJu0YxJt0XxpYG78ovPmyVyi6QG8RNX6jd+zvHlw8SSARRGfSr+tnQg
	GouoTYS80v1OGmUv/Q0MQIrb6WqPoMM8319K7BqDahoGqdwQY/8ko9gr96qECsm2NTbdosVbVIS
	fye5NTiaxIA3c80GehkJmSusSsWcLccsojLXEXIlUKcPCZqsoM9ByJpraypCRY4k+jJ0M
X-Gm-Gg: AR+sD10zQc0ull8/Rob/U1PBZOW5wgrihJORLaqKpiAvza2DDhCznp8tD27D6H2Cg6G
	R/VaxiWM3bcNjNa+88rgebtXfkybnUkCGAOZHNUKtuZ1SolrevinXE/i5uDtO3evoZHrpGK6Vjy
	p9eCWgNISkj2DDvTpoXRByFOXJk7g7H91v86S3ApgRLQRGDiCKCo/Ma6bd2/7sxuiRMv7JUq5r6
	fFXyesR/ETt18cywLGxy3ugJYPuLV8uweixEtUJ8uFYbl64xNkUYowOGig60fWKhbqtlkgUMhuC
	3FdCWvs5s0T4JV9UikdePAPRnwrIJzuJ8a4rUpd25cm0xyPVeoEuf35z6hyYqKGz0EGNiv8sNwg
	L2V2THpMw32K0IHBoDvggnx/A1BPKc9KjmHEKunXq1DjiLlJi+uR80A7X41eiTrZXwgMGaJh1yF
	2K3pSpGCkI/ntN
X-Received: by 2002:a05:620a:1786:b0:936:cd74:4f45 with SMTP id af79cd13be357-936d232e6cfmr2796689185a.37.1787023432422;
        Mon, 17 Aug 2026 20:23:52 -0700 (PDT)
X-Received: by 2002:a05:620a:1786:b0:936:cd74:4f45 with SMTP id af79cd13be357-936d232e6cfmr2796685385a.37.1787023431954;
        Mon, 17 Aug 2026 20:23:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa096asm835514e87.19.2026.08.17.20.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:23:49 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:23:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 5/5] drm/msm/dp: mark the SST connector disconnected when
 MST is enabled
Message-ID: <ue75tcf5hwigfvo2pdcmkako2ovvgoxte5oeqs5an7fsupfqk2@oe2adzbdhv5q>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-5-646a10256233@oss.qualcomm.com>
 <sijdmdhcbxyg23gh6c62hspruvbnyqbdrtv2er3bh6n6ftolsp@b6o4khv6dofc>
 <96344518-c0d3-4424-804a-c315eab3e39e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96344518-c0d3-4424-804a-c315eab3e39e@oss.qualcomm.com>
X-Proofpoint-GUID: BQXYdKGRHT7si7y6RS8BKsWOOIlw92mA
X-Proofpoint-ORIG-GUID: BQXYdKGRHT7si7y6RS8BKsWOOIlw92mA
X-Authority-Analysis: v=2.4 cv=dLaWXuZb c=1 sm=1 tr=0 ts=6a83d049 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Q8SuEDP3D7tb5lYi7iAA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfX3miBjIs1xfIV
 QRoQaMw1g/fwgqua4Wcf2et9OayE8Kh2rdQ4rLQmscGQX6OjT7Gbxuit9e32S2ZV/BOT1B8KPKM
 syHPzRkMWK8UieYkucJgGva58tKgklJCnIiXKQrlsVevNo4ig/akfGDe4Ckvu4OKlbJwOYuKR19
 8LZW69Zg5la+Cdw73ft+0NUhSYpSwGAO4sZsbNpvoT0QJN/OZijrtQvudi6TNYQYwmtdZXUWQcv
 uWGJB1dELiZfjXcqQqAO1Yea+9AmOZryBV/9Ik3mwDk/N5mmqPoEogR8Ju1h/qUyZpKFetktvW/
 DazeT+FwHqlbsc4eDrsss2noq1zx5M7nfogXzxOXvg58Th7fTT5gGDrE/b1d/DXiWbIv8hDDC44
 epJZR6rFaLh7zzwNTH1N/nJapUYMqmtUkLCha43RHqJONajaV6RzAfe/i6sceRU2qDUiUKcokkT
 GnWDIohbe9DyHe3juHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfX47RrksCpDT/3
 z3XWCcCxoERuW51XmOZ6sfvd2XPpC3cBCva14ce/DZjrXg4rQsz+SpI/pl4qlOYEqDSXYARyiPb
 ydJKlYJTN9QwH2x/SX2rgfGtWwhlTcw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180023

On Mon, Aug 17, 2026 at 04:01:34PM +0800, Yongxing Mou wrote:
> 
> 
> On 7/12/2026 6:56 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 29, 2026 at 10:48:07PM +0800, Yongxing Mou wrote:
> > > When MST becomes active, the initial HPD plug notification updates the
> > > SST connector state to connected.
> > > 
> > > However, the subsequent SST connector detect path reports disconnected
> > > while MST is enabled. This connected -> disconnected transition is then
> > > observed by the polling logic and may result in an unnecessary hotplug
> > > event.
> > > 
> > > Set the SST connector state to disconnected immediately after MST is
> > > initialized so that the detect path does not introduce a transient
> > > state change.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 4ee391cc7165..f8ca60d6d714 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -352,8 +352,10 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> > >   	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
> > >   		msm_dp_display_mst_init(dp);
> > > -	if (dp->msm_dp_display.mst_active)
> > > +	if (dp->msm_dp_display.mst_active) {
> > > +		connector->status = connector_status_disconnected;
> > >   		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);
> > 
> > This should be a part of the MST series.
> > 
> Got it .

Also, you need to take the lock to modify the status field.

> > > +	}
> > >   	msm_dp_link_reset_phy_params_vx_px(dp->link);
> > > 
> > > -- 
> > > 2.43.0
> > > 
> > 
> 

-- 
With best wishes
Dmitry

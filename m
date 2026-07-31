Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86B53CBE74
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785506735; cv=none; b=aX0OaGUzig0htkn9mY9CsHN/0YvQ1W498ZEYrzmDLS/rhShKFm+DaxEfz6hv2Y/2Nx2IoaEQMmqNtewRyW+K5m9KcSANgde9T65A7tSzzvNSgk31u1H+kkoKqkcYJfxD0OTosrD5VkmfwZBvGx9YXtJqEvZyep3KO0dCbb6V9Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785506735; c=relaxed/simple;
	bh=098HrdB4qj3uWEtOns0NoI33Krb2EhPBbTVdca7AS/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uy/leSSYuN8DF0fUwvb6qWZjMYCZaoc8Kg7Liw7Mvcsv/hWW4NBmF4S8R8aC24VALBgBAne9KhQvO5+8ix3Rwd++dUbDVAVhAYjpvVXgITFcoPoDohCQd0sx9AWO8Zx8YNrMXXdPUTiREBE03snQ4IVQY86EldwtEq1adHS+u2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxoqKk6u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMmTs4C8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxoqKk6u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMmTs4C8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBmAbH3905280
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	343B1/3+b4zF0oyHAPXPcWl8rg0MW19SgLHKxpdb+jY=; b=hxoqKk6uLhpYiQdO
	yECxHJ8rxjUyhccKYseyFK+80rp9j9fJi8vQLuUeeeotQpO7xWDeZSTEBrBFLBLP
	zTakhBMrKC+ZNlUvL5ksYm7QwV/gQUEhCN1mU1MnTXaW4lEjQomgJYvyt/macZGX
	vZXq87Ja1x4OYHEd+2bDilg+wXJoon3/AkjGPidwFEygdCJQINfeniHgvaSGVFew
	AdNF5SR0DX1Pz9WmrhruMvpaKv4aCMCxhSm5iuJVHfQ8YN8lyLXtEKND4yR26NB/
	/OKzEub3IRYZwfLP0tSRl+3d0mXln1Ruwzgr+xKeivmV7KcjOqhIjA/gy84IB9UU
	B9RNcA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru5dgkj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:05:32 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-754acc61c68so270031137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785506732; x=1786111532; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=343B1/3+b4zF0oyHAPXPcWl8rg0MW19SgLHKxpdb+jY=;
        b=kMmTs4C8MtTIkXombISeVFtejGcWMl1vfjHvIjZ8c/6vaDOAyJ8/n4Cjsl7WAJj4dK
         Gvy6X08OcqVZeA4DnaL+KG0PKbYo6J+of0EV7GpgrflN1W4n7VpbYD2zVBE1t/lsnRR9
         D6RTRJ5P3f04QQCSmCVmFixJFJ8c8YkWUod4kpxW24mZUhXkbeY8n1JFVhKNNZiVAntp
         K69LKFv5gYcNd0j5fJdbnuEmH9SLmWpZ4VaomlV/+jDLBQHYlQl3VfmVPgpMobmjsh/d
         2j8o5bjhxeU+Ffw6RGn3giwJg85fhL+bNPei9WKYANzib5LI6rpV10AaJ1u7SRMn8OLV
         Qt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785506732; x=1786111532;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=343B1/3+b4zF0oyHAPXPcWl8rg0MW19SgLHKxpdb+jY=;
        b=oSB4YyI0ReDQ8piRnt0u/IwQZQ2FhlprF8Lm71M40cLCmZmyv0fcmxa718SEksaJLs
         4bpr0bvOBee7BvJcBiK7E3ZP+muQdB+nWP4L3KGGNTvUEuSxXZexwyCO1Uai89rJJiBq
         Dq2D5J/EAy+stysFvPmUSdtEAxqY/xvkOONDbFdVsSzstW9hPtnWC7RXJME2WW9Ck94h
         fr8C63asH+e3trJE2xaGxU0QxbLJFhSUZK/ZKY6ojPI0e73yk6fTJfmLUN2Fda5ZmiTh
         iwjJOG7+L+SQ1Gc5wE6fVhCbxM5Mt7aH/hb0lm+Xb4C8mwnY6MgcQNn3RLLR4JyEm4J3
         H0OQ==
X-Forwarded-Encrypted: i=1; AHgh+RoaEoaFdqUJN/plsVl8cRU4A5TMODT5HFc0/ROIZdtZRBSbdovcFOuRH7vLtb/8xcu0RMz7qWSoVB4ypFQ6@vger.kernel.org
X-Gm-Message-State: AOJu0Yze0CTOl03yVEoVyik871JvipA2vVq6SqZoA00QbFO84NsSTba0
	ytunu6IHqYAq2bjP1vibtT7GZSFYlh55fMSUoOiK4XLYh7GJsGsZs30hZz43xOzAcaXv5cJKjHI
	ikOJqfoBh7nqb+FEScX/WhYsy+KUqJZPnX6W7LPCrjOCaPmBZWRNE1SXLGfmksp2exWgk
X-Gm-Gg: AR+sD12QuDJGud1z9RaLwgma2v43u+ZX+Qa78oEMpNLcyIVCNTa3k6TxPicpxV6xYqA
	EccgLWb+EUYouyLPKEvRC3bMWJmmybgyq9Cr8VHzr+bbGL85QuPOQ0KM9FKSYjc5M7jYjbSO/rE
	sVu6qLMkJLPU87DWJ++HYcpa7TeyR2qhDmvtFpKxcujCbT2GR3skC8lBeu+MwxqpTRgvGdU5173
	K/UJAELl5YYsIya4SvopsHzushX6PPXAnChlm+ajSrNimvwf/i2iCWFwnXt/6KSJ1F0/tjl0JL3
	+oE/28mLtXyoRZjPnXYDkBVdEcHHJ7jTKTxa784wQDky/XQgQipX07QcGtYSl1YjWhUPuhf/Kd2
	Q6V7VR3yWWqZPYsdeDa8RkVvufrAXqfWqy4RTFDPdH6yxcyD2lTi+rz2+8gEky4UUpCQItISPZA
	yxdnEShMrorrnJng==
X-Received: by 2002:a05:6102:549f:b0:73a:128b:ea07 with SMTP id ada2fe7eead31-75b23a635f8mr167410137.14.1785506731678;
        Fri, 31 Jul 2026 07:05:31 -0700 (PDT)
X-Received: by 2002:a05:6102:549f:b0:73a:128b:ea07 with SMTP id ada2fe7eead31-75b23a635f8mr167332137.14.1785506731103;
        Fri, 31 Jul 2026 07:05:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f810dc89dsm1229371fa.12.2026.07.31.07.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:05:28 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:05:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>
Cc: Yuho Choi <dbgh9129@gmail.com>, dri-devel@lists.freedesktop.org,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vladimir Oltean <vladimir.oltean@nxp.com>, Kees Cook <kees@kernel.org>,
        Dale Whinham <daleyo@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/msm/dp: Disable stream clock after video-ready
 timeout
Message-ID: <ka3af5qc63pdcvh3uf6ulb25wrsf6udjugm62ooxuscxvz6zhz@mbuivewege2k>
References: <20260707175212.412699-1-dbgh9129@gmail.com>
 <20260707180553.78C7F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707180553.78C7F1F000E9@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: QNzw8zdQ0K2HPOQ8z_kJs8SjqgUlsKGq
X-Proofpoint-GUID: QNzw8zdQ0K2HPOQ8z_kJs8SjqgUlsKGq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwNyBTYWx0ZWRfXyx3aszrm6Ny5
 HWswrabGWGIF6jZKyyx34kRSBzDZOYFnBh1OBLXTpPDnRZ4LVkCXL8+5rVWlxeAWGHEYzHoH2fM
 rBAbZQx5g6Kl23iyX1rqW3pCDv0h/IYe8TOQJXQV9q3ZzXgqs/jnINNKtoKHoSnBI5c72NIhr48
 JIDWXUV13/xOl0GYHyIk7LhnekUmxFKhrHULKXIm/A+12Oj2nMhAs9LJHuAPk2x5bRpipEgFViT
 uG0GnAA74Zn9vL6UOz4LgK1dpWSDa9H+rClo0PFOcbpJk58DUPkotQzTNL3+uYb1vdR0Ilw70/y
 ObgWmN0CJy8qMkEiGOmwJk5HOPwFnWdRLkDBNxYlG4PfN1ukKWrYb/hZpsvuENBz3NVCT67GlUk
 VjTXbIOOaUAfBzlOXybcClKeaVcoqN1d7rQvIHtz20bDMnguLAQ9RQ1m9wSBHqKpHsxb5AuX6uO
 F2KMj6PjccY67uEu2IA==
X-Authority-Analysis: v=2.4 cv=SKZykuvH c=1 sm=1 tr=0 ts=6a6cabac cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=c92rfblmAAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=YuBhx4MO3GsoJQDmrn8A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwNyBTYWx0ZWRfX9juEUrBJOPyz
 FTw74tywU8kny8KW0kMWkeyvcJckTAeo3Vydjk6ZgUmGP9RT5bdKT5y0BUmxBGFyUC/BxSDQG0l
 DihcQrfhX+spmbssMD8DBDEDXTPHNF0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310107

On Tue, Jul 07, 2026 at 06:05:53PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Disabling the pixel clock while the DP controller is actively in the SEND_VIDEO state violates the teardown sequence and can lock up the hardware.
> --

Could you please comment on this Sashiko comment?

> 
> --- Patch [1]: [PATCH v1] drm/msm/dp: Disable stream clock after video-ready timeout ---
> commit d51f59f75198361a5116081d3f135fd586dbcb66
> Author: Yuho Choi <dbgh9129@gmail.com>
> 
> drm/msm/dp: Disable stream clock after video-ready timeout
> 
> This commit routes the video-ready timeout path in msm_dp_ctrl_on_stream() 
> through a cleanup path. It disables the stream pixel clock and clears the
> stream_clks_on flag if the clock was enabled during the call.
> 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > index 86ef8c89ad443..139e9fa25d6a7 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> [ ... ]
> > @@ -2543,13 +2545,17 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
> >  
> >  	ret = msm_dp_ctrl_wait4video_ready(ctrl);
> >  	if (ret)
> > -		return ret;
> > +		goto end;
> >  
> >  	mainlink_ready = msm_dp_ctrl_mainlink_ready(ctrl);
> >  	drm_dbg_dp(ctrl->drm_dev,
> >  		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
> >  
> >  end:
> > +	if (stream_clk_enabled && ret) {
> > +		clk_disable_unprepare(ctrl->pixel_clk);
> > +		ctrl->stream_clks_on = false;
> > +	}
> 
> [Severity: High]
> Does this error path leave the DP controller in an active state without
> reverting it before disabling the pixel clock?
> 
> Earlier in this function, the controller is programmed to send video:
> 
> 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
> 
> 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
> 
> If wait4video_ready times out, the code jumps to the end label and disables
> the pixel clock. However, if the caller ignores this failure and DRM later
> disables the bridge, the teardown sequence will invoke msm_dp_ctrl_push_idle().
> 
> Since the controller was left in DP_STATE_CTRL_SEND_VIDEO but its pixel
> clock is now disabled, could writing DP_STATE_CTRL_PUSH_IDLE cause a
> timeout or wedge the hardware because it cannot process the state transition
> without the clock?
> 
> >  	return ret;
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260707175212.412699-1-dbgh9129@gmail.com?part=1

-- 
With best wishes
Dmitry

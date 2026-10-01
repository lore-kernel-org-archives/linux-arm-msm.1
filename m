Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B6338D6B8
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 02:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790823026; cv=none; b=dQ1uZyRxP5GadA3/fqO/4+IrDkIPGcgUgmOl+SmsFqgtFQEesSZ8/TqsdhTLDfO7PCLHjc3IYAZOdOfi05D/OaO9GuzKDX0LRFsZuxGKyicPjFiRy3XAk2aAzdcEtwMM94krHVfrUXalYaT2lCnkE09IFNb0e9mk3HsLwrISwH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790823026; c=relaxed/simple;
	bh=4WuyCuLQaT95cSINr7wk5/blLuWzFiAraBb7+MrxSIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOmr2FOc2ra+n9+UXzaFeMl6agxzLP2JoQQte/I5nn3IAvTNC9E/bQb4mfLOQ+c3vJUm7TkHCLISO99fmVpggE/hvSPlD4DcwLfzyYztcFMZCXeJBITqN8NZ/j7R6uVh2VX3MuSGP+TQ4pJWdnFkyru+cmi/o0rg7GRGzuugTOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WJhyWTby; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZlHVUn3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WJhyWTby";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZlHVUn3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910k5IR495746
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 02:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xn1eHsIfFrbIrU2VWkWaw0Rd
	lkAyIl9bNfmyYQyox/8=; b=WJhyWTbyv499wJmgzgNJMqSXaS8BPSLaH+d73ccN
	dqnrjaT6W44T0ffmxyr+dsIRUpSv+Cpve8Df37qMEEjPxqJsnLUaDH8ucnrYUIcZ
	I99Mcmg1DyK/3cTITGyl4qcuGcF22GLS79oNVkHxl18+8hWBrmCCI53H55pra//T
	+NSHqQX5BmBxr+wpWcqZ8DqEtpyFFkI1HQ+Nw4W5Q7fet0NuZ9QHfrblUFAFIm34
	/pOS8zmjGFtu8UGwBKGfV66KefqlS8nA+Kbk8XPiiG+VDyb8aiy9lN51Vf1xBvpa
	nRLx8XN2ix6WiyQLE1YPDn8rSj9EKhZquW6Hfr6MPSngoA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pj9p9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 02:50:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c5d7c4c26so1155608785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 19:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790823023; x=1791427823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xn1eHsIfFrbIrU2VWkWaw0RdlkAyIl9bNfmyYQyox/8=;
        b=PZlHVUn3ppR5Ip5L9FfqTgvGjquo+bCGA2FQAa+hDknDi/CM8VwUUo2D1xlxdr0oks
         /6W+kpEZaXZH/4uX5+L/hOStiagRAiBogMjqOw+cv1Agb/kVynD/rH6ypzV4WoSSRQmC
         oRq8Zy7GLnMsMxf/HpwoHHi0AtBcT18sbKZPZ0iIbU1JP9ThJsYkWx89sBL7Rz+5XAD6
         n6TvCz0cDi/p///iMRem1TdN5hITgHLwF5cmHf3JenHKbP3HG0NF3KQwxnLyI6+3utEv
         4wjns1aXfmqnpfcafDpmsiExB7AGWVM9XSow0/ycGcHkyogO+zj0iWvKOKkKaiIRP4Lc
         Dt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823023; x=1791427823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xn1eHsIfFrbIrU2VWkWaw0RdlkAyIl9bNfmyYQyox/8=;
        b=vIRpeKUH/QNzCr+59KLw95NiPcfXEuIXLuoVY7u51VtdAqI9txEvaIOHJRSra+f4Ef
         hBOjam10Y7rSav1r7v0mlCWuDUEB236fHr6I33dI8DeUbDD2fvgqOpvXWNkeasTbA/TM
         Zd6+YNyKQBPuUoXgqgmvw7m05ZmlY8vYecaaRM3JirEHqwKggrf5VjIWpiDIMXTN9qPi
         m5PW26Y/jSJemsbt2PWHELGlPCfiKRJUuz6kkJ6GbBisbAp61TKzb4OJsU6hHqbpPHBI
         DCRfIAV69LKEZ1PVvfd6VXVx9diB5/vAQnayjzJjydeMqqp0Eu3npqc25s05z7ueX5If
         +Z2g==
X-Forwarded-Encrypted: i=1; AKwUvBx78QFBwHkn0fwSfN9tAOB5S15zFn7VTELkbA+blsO+zNluOH21YCM9MjxT1DWoiuU0wiAQgqzx7kS+Z+fm@vger.kernel.org
X-Gm-Message-State: AFuF++n5yLuNNTfweOWHsU2oJApFwshDJ3PA1CRmaiwioHUWsoC2BgIz
	TEaCNSG2bMRq9ZC0HdHxzeSLXwqHt2KADJqXILhWJmjHepqbfHw4FnUGl8oLvcZfxN6tAy+xF5E
	3SFXp+ijkL0AxHxNsAEyVIWqZAetWmrPTQou5/3hye3Ikz1EO0bKSz/EO6Br6MoEM8vpQ
X-Gm-Gg: AYBFou0stnoueVGOwRh8q55rGWANnJgOgdMNKibQGhfX5EhEYJNuHUxBlOaWm03Bdo/
	HIOjYhYB6doDkn0qarJxCFM/7Kk7pCVXOn3XM/OwQSo4rCXVSCRkHYZn4epA+NXXDV34K37c+o4
	WE7zQV+wWdmEUJvN0iojFHy+1tlznV0SLCEzbWC3b+33vDtIXo3NYD0ZVpJKo+iLtakMD+HJG0P
	kRbTzCLfejWW7rqanOZwp9H6EUtWHE5JLlWTvE4TL7iGPaVLowqa3Hy1AuqM8ctdcJhwbSFa3ys
	B4xZJ+3Q7M74o66sFkhur5I4uJ12Qb2Gp74K2o2Q52BqPCGmBk8bOWb81M4Q4iD46Zny3X2bJkZ
	Co4bPdNrt2t0RUp6e++xNUhkDsk/W5jfc8sJUTPcck7+w0j+iZnbUF0oSpkdx/zbfq/di1noDc3
	16Rc2woi9IHlIn
X-Received: by 2002:a05:620a:2719:b0:93c:6e7d:da68 with SMTP id af79cd13be357-93ca9512ff6mr525949085a.3.1790823023127;
        Wed, 30 Sep 2026 19:50:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2719:b0:93c:6e7d:da68 with SMTP id af79cd13be357-93ca9512ff6mr525946285a.3.1790823022570;
        Wed, 30 Sep 2026 19:50:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fb8616sm367486e87.58.2026.09.30.19.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:50:21 -0700 (PDT)
Date: Thu, 1 Oct 2026 05:50:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: stop the slave video interfaces before
 disabling a split encoder
Message-ID: <rzfyie7yah3c5ymterw2nkbyex4xw65heszybuqkrtvmtmmx5k@gcgxglxsfiaz>
References: <20260929174819.3855-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929174819.3855-1-26rote@gmail.com>
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abdca70 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=gxmXS1c8SbOTWsDyRUkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: rWXepTwKvJsWyLv6nHA108R4sSgNRGf1
X-Proofpoint-ORIG-GUID: rWXepTwKvJsWyLv6nHA108R4sSgNRGf1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxMSBTYWx0ZWRfX5oCY5TXbWoQd
 06DN/6kuUJyrx/5TbvSJnU3CTd/Qvl4botuyVB5efJlg/kqM3uYLI6pCCMTr74N62lXtHjaAS0b
 QToq6yJjPVCq7S6gXbUW2ANlRj2Cw3A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxMSBTYWx0ZWRfX/AhpmjPOqwvV
 Kl6NZ7SSUmES4kJ2WXG4+nwQYf2uSm4A416nW6DVddCepWWNJO9Ez2FxDrvqvCbUqjgttaJq8Ms
 uljZGBJxnyZ5lTWr78GUneCmpX02ahQ9ob4W8sEHwcIrjyicE6cmY1zibY2ytL88KmlMeEZcKnM
 yF4yCcPLF0JajLHrBIueQ4Qm2ZxpFoFUHFL2G6Xr7ovit/OfQxI6gY2hFiAsYIENEqZqj8N6NOA
 96g/uxsOqjdsIBwOURjl3UYHROD3fgXZtBMhXHlUezwIGJ20kYXYXYKajMUBhXVs6d1RiNktzIU
 rtgnkF++5ai1w+TV3GV0T+PDU782DNW8gLCnWOjmt6213URn4+7UGpQHCu82gBNFpbJxpkzO6lQ
 bqunbMbkhD6jmTulAwkSZ5CUw5cYYCkSPmWJc1oXJ1cFxxs/Zi3ukoTG1aCrJ9eGWEdEsZeQmTy
 g7JC8WjZGgN+IP2cPQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010011

On Wed, Sep 30, 2026 at 02:48:19AM +0900, Joonhoe Kim wrote:
> dpu_encoder_virt_atomic_disable() disables the physical encoders one by
> one. For a video-mode master, dpu_encoder_phys_vid_disable() stops its
> timing engine, waits for the frame to finish and then runs
> dpu_encoder_helper_phys_cleanup(), which resets the CTL. With a split
> display (two interfaces driven from one CTL, e.g. bonded DSI) that CTL
> is shared with the slave, whose timing engine is still running at that
> point: the source pipe starts fetching the slave's next frame and is
> left stalled half-way through it (on SM8850, SSPP_CMN_STATUS 0x10030
> with the fetch and unpack counters frozen, where an idle pipe shows
> 0x10003).
> 
> The stall is cleared by a power collapse of the MDSS core GDSC, which
> normally happens between a disable and the next enable, so it goes
> unnoticed. When MDSS stays powered across the disable -- a full modeset
> within one commit, or another runtime-active user of MDSS such as the
> DP controller -- the next enable of the bonded DSI panel scans out
> nothing: the DPU keeps committing frames, the layer mixers produce no
> output (CRC 0), and the panel shows black with the backlight on. A CTL
> reset at enable does not clear it.
> 
> Stop the timing engines of the slave interfaces before the master is
> disabled. The master keeps stopping its own timing engine in
> dpu_encoder_phys_vid_disable(), which counts the final vsync before it
> waits for it, and its cleanup then finds the slaves idle.
> 
> Seen on a Lenovo Legion Tab Y700 gen 5 (TB323FU, SM8850) with a bonded
> DSI video-mode panel (CSOT PP8807HB1-1). It reproduces without any
> external display by keeping MDSS runtime-active:
> 
>   echo on > /sys/bus/platform/devices/9800000.display-subsystem/power/control
> 
> then DPMS off and on from the compositor: black 3/3 before this change.
> Every full modeset (e.g. a refresh rate change) went black the same way.
> With this change: DPMS off/on 15/15 show the picture, with no "wait
> disable failed" timeouts. Only tested on this device.
> 
> Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---
> Changes in v2:
> - Stop only the slave interfaces up front and leave the master to
>   dpu_encoder_phys_vid_disable(), which counts the final vsync before it
>   stops the timing engine and waits for it; v1 stopped the master too,
>   so that vsync could arrive before it was counted and the wait could
>   time out (Sashiko review). Subject updated to match.
> - Link to v1: https://lore.kernel.org/all/20260929130621.943-1-26rote@gmail.com/
> 
> Saim Shujah's "drm/msm/dpu: clear pending flush state before physical cleanup"
> (https://lore.kernel.org/all/20260826182459.1506522-1-saimzst@gmail.com/)
> alone does not help here: still black 3/3 with only that change.
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 33 +++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1f20695f81e3..2f8b6204c93e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1380,6 +1380,36 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>  	mutex_unlock(&dpu_enc->enc_lock);
>  }
>  
> +/*
> + * Stop the timing engines of the slave video interfaces of a split display
> + * (two interfaces on one CTL, e.g. bonded DSI) before the master is disabled.
> + * The master's cleanup resets the shared CTL; with a slave timing engine still
> + * running, the source pipes start fetching the slave's next frame and stall
> + * half-way through it. The stall survives until the MDSS core GDSC is
> + * power-collapsed, so when MDSS stays powered the next enable scans out
> + * nothing. The master itself is stopped by its own disable path, which counts
> + * the final vsync it waits for.
> + */

Drop.

> +static void dpu_encoder_stop_slave_timing(struct dpu_encoder_virt *dpu_enc)
> +{
> +	unsigned long lock_flags;
> +	int i;
> +
> +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> +
> +		if (phys->split_role != ENC_ROLE_SLAVE ||
> +		    phys->intf_mode != INTF_MODE_VIDEO || !phys->hw_intf ||
> +		    !phys->hw_intf->ops.enable_timing ||
> +		    phys->enable_state == DPU_ENC_DISABLED)
> +			continue;

I think a more correct way would be to follow the enable path. In
dpu_encoder_virt_atomic_disable() first call disable() for the slave,
then for the master. It should fix your issue.

> +
> +		spin_lock_irqsave(phys->enc_spinlock, lock_flags);
> +		phys->hw_intf->ops.enable_timing(phys->hw_intf, 0);
> +		spin_unlock_irqrestore(phys->enc_spinlock, lock_flags);
> +	}
> +}
> +
>  static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>  					struct drm_atomic_commit *state)
>  {
> @@ -1412,6 +1442,9 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>  
>  	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_PRE_STOP);
>  
> +	if (dpu_enc->num_phys_encs > 1)
> +		dpu_encoder_stop_slave_timing(dpu_enc);
> +
>  	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>  		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>  
> 
> base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

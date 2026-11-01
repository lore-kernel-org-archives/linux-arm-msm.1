Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530723;
	b=JRYgKtdIip4835X3zdoTIphzr+vlO2pV5fYYhIdsp6MtUoMclCbtXftNkG2plMwQGp53
	 l4cwyQupnVc95KD129rrrADwxuP6kghWq/4hS+rZfh/tpiGRc29ek6yYVAdAqnetJE9YW
	 q1LXc2I1wf+VYZ/GCnXeM5Bx76zBHkdY8QT8RyGTbfaMAjYfFUOG6e/UP7PHMyMibFwB+
	 Ob0iu/bBXFKixsqo9LVZWA8d0PFZGkjjKpZ4DBWUTDA5mNe4p8aPHlCerRHTPHddbRTde
	 R+WrEfH3lNmqbeL0me85ThVmRfRNhj+1cYIcvzjAEsFrncLqGfaDGtinga5qySd5Qbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530723;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V26Rxt/dvQi8UJT1RGBvNKJzELhSQFEnT8mAHiQZZLw=;
	b=tMSV59UZUPlzVGMXxxVxSG+KjwSCGeDWd2Jha85htyOx+JpuT8wvK31KvuXuZGyK/aZF
	 4SOKfy0duY80AA1E2jUVWSv0QJxW0AY8K5rBFdsfZ8pzgBDEPCLZzwP6kh1y+2caMhZdC
	 DU3sXDb0N6qZjwcAeTckyy5qnbxUuGEwCDw9ZE+xpyn1/TT0kQ0YN50KPe6oV7f5npUPO
	 b8GkMdjfzcLbtRHAfD0h+TSNjOodhOUJMqy07/SR2OnJfoc/uwMDAx9pkjL8hW+LGcQ1J
	 Wo1zB1fWCWIY7tB5hNpRz9ioHiYgoMNAl8sX8o7mmzRlaN9e57c4HQESNn8JJTn75rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cbjp4+2E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B5HuIFvr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB46606A330
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 10:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB46606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cbjp4+2E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B5HuIFvr
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A18JxB93976854
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 10:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V26Rxt/dvQi8UJT1RGBvNKJz
	ELhSQFEnT8mAHiQZZLw=; b=Cbjp4+2EQhHPRe4vPcA3aMWtw6AnTDzXXsMkAlkP
	NSvAZTe2toamPYew41bCKmT4KDChnIS1gKngGgUBhdjsxtsNIqS00CYsdIdaJmH0
	OF5YOlJsIyUujDJLmR8dCOTpgrege3HvmDNrcwcviJGmfg/39VGIbzgeD7Lu5uRL
	KINv8MNjjuGoQEw0CqTNyvSlSEqYM+QPUQZpipu3NFNEPAGEkV7HbCbcXmmYbHTY
	2IOb/70CtbgBZ1Sm8qa2PL6yWKBC9pXYQwlK41+oKbQCxoZ7jBFhj/rYrI6Vb0iT
	wBvPXBRHGFahrJxOVOX8NdBhpc9+dAhjFY55MB5VOgy/Vg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93ek26a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 10:58:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso427614785a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 02:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793530720; x=1794135520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V26Rxt/dvQi8UJT1RGBvNKJzELhSQFEnT8mAHiQZZLw=;
        b=B5HuIFvrltXt3DRLKTE71NMB3GmaZLifzUlmU+JpjOu4hxO7j3X70Hj70eNAmlYuqX
         3feDbwewF6pmCBH7dTGLqs2/4xQknowoOFtmo5OISHSqMZpVcL45NPjyeQeLmOHEmsDX
         pQu2C0cdVkG1N9JM6ENODOkg//0W3Ca2R2IVd7i9OsoY6Uccpya16ydhQO/W1FGIF7Ab
         ampc7/T9y0vJi/eRot4siqqswvHGZQToVf+rO9rmQlf3LJWZCZnuez7KCgVxVBl50plu
         Ub3mGwULxC4eIQDOKu0XfA64nhjjkQFZJZFRPxGrJ/rxS3iTSg5zeqtvjTtFDnHIkmDE
         OD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530720; x=1794135520;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V26Rxt/dvQi8UJT1RGBvNKJzELhSQFEnT8mAHiQZZLw=;
        b=HLglJJ2cMvD4xwqiG9oD3Fw1EVSJAe1gWN1r7JoOxlbib+D7HYrlhHcWq7R02itxns
         dGR3VLGiwZFrN6itIHlEdbNSBzPzNh2ojEmADBotz0YjyZXQ0VHvzyv/3Vab8kZL80Op
         +RzeR2/j6odH4CkUc/GvMwrk5S/Xls4LvxAo42yTRgrI/YFwglhff3OB/qs1v1GCtirv
         0kCOveBUo+dUyI8/0HmeSPi155B8U93JdY08dXGtdBR6NbQtcIItbG/N91JKJ6Le9prR
         IM+eApP4ur9NyZIwP6HtUkc04kueruWtBlqkWAqErQGJoU3AydrICG+cuvLNqHx7rANE
         GjlA==
X-Forwarded-Encrypted: i=1; AKwUvBzprh6e34pLrBppA6mFYySaH1wb6IxwDM3x1U6O3cD+zD0raMZIMg34Cwbj8T+3wIjiAhRYNKGtudesFqtB@vger.kernel.org
X-Gm-Message-State: AFq9FYKpVALlVKQ7qpChFtXUYWcVM7jovS9a7nGhbkm5e8YvomjtpVow
	tthZo8OKw8uPqlpw9AiA9EEu2/HNO+5uY0VxejH2getKtmb3sXoxWVOBalUNBXHLKtwJVbJhRbt
	YgCftmAsZK3MqhgUVwtGLLiwk8jo0Js/a/RZ6OnWWR2iFxkROOfpCjQyPiHmRhwPjLv55mNIeo0
	pb1q0=
X-Gm-Gg: AYBFou3jKM39KvQ6vc7C18peaDhLOK+BJWZWkL9NlVRPuWWz/75TmTKLVqIbFWZxPsg
	5ayyNxaQXx1uNUws8uvDNcWis4x0xxnI0tzNHqDVjtrkf1iTCux8Woy5BSP8HV8KsiKFWxX1sho
	R6xuOdZzcRAPVp3dQ+Trspm3IcRDD2DUSq1DksRQyvm0Bov3sRKXUS4WU3IIW83pg58mZjKTWWV
	Q8w4XypcvhzHN+UJcMAjS7hamykwbybGFjHP+q4aGp3CPwD/4rHDBv96Oap3Alt+pV0lbflRhla
	DBe/7pdojpfierX0NhFgbAEahoU8X8gaDRgfnJ+cA+Lm0wE7L8DeNjE58zQbOn5upQlKCYXqYBc
	+hQhMStKqKkoQuyJTFxAlcq+9j3l9LAduB0pn+D5hBYA5191OD5eWNZ35uEDpnUfZIKiBZMx/cn
	C88e0WkKrYZ+aMCS6oHy2EvH3NAqlOL9/Ufy/miNYeiCCVyl8bSQAfPGstkZ9o
X-Received: by 2002:a05:620a:4724:b0:93e:c12c:43fa with SMTP id af79cd13be357-9442171c8a4mr1167598385a.71.1793530720221;
        Sun, 01 Nov 2026 02:58:40 -0800 (PST)
X-Received: by 2002:a05:620a:4724:b0:93e:c12c:43fa with SMTP id af79cd13be357-9442171c8a4mr1167596185a.71.1793530719592;
        Sun, 01 Nov 2026 02:58:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe07541b4sm1027580e87.81.2026.11.01.02.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:58:38 -0800 (PST)
Date: Sun, 1 Nov 2026 12:58:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Beat M. Liechti" <beat@softbase.tech>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: don't reassign resources on color
 management changes
Message-ID: <5jypdookmvfmrdaef2c54aab5kfcpjvejc6f2jyxvbjhwpqgzd@ipvdiwk3zxvc>
References: <20261101095754.33840-1-beat@softbase.tech>
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
In-Reply-To: <20261101095754.33840-1-beat@softbase.tech>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA0MyBTYWx0ZWRfXz4M/M1krO/rp
 ACw/NKpfJ5CUTzW8WtO6IuLsRnXobsqEy1bV1w/7kt429VIZANJxzfGu/rP/e+8xZDEWle0UjwA
 JPGeDLn480HsGaI9N0uRRxsrIeWv806jfwH/xM2uQnsQs00ydScqQvE+u5I2XFce9yyweZpOJmY
 6vhKuD2cwTckZrpaEG5jjxtgad9rTTQCDrpix3Zb6xVjqlzG5d66sX0TAC3Cng6IQVCu+AWu2UM
 n3kcCLSp/Kvw7coGT0jAiDOA/PlPYfDMwfK8bS/Fd/EPjz4w36nANhs3JRbc+xlesi6t0Nc1npq
 v27+ilwtSZ3+2I0sp3azT4HAP5sD5z3bHsJe7/WaSx+sHPZGZdRaiEpCfnaWarpwXxPtaxefl1b
 GzcrlsIja0ELqHpBs7gaa/ceDPEa3vJbU/B+MKyshZ1eeEhZF6BQ2c9hIua5/bIownFJuoX6xoS
 VfUYVDaDCsdbehkKviA==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae71b61 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=Ox7JqDZjdXA0ESHpvBYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: wUbrk1-Pu2aFWkNWXS_F3aYw85gnMoj0
X-Proofpoint-GUID: wUbrk1-Pu2aFWkNWXS_F3aYw85gnMoj0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA0MyBTYWx0ZWRfX9NaelhwVfEnx
 pugRLt9ykFHfxbZS1AgJ5+tKc8/qD+qqJezSKw6YsjeFBL6kBPo2G4NpDM4X2MGHUEecVfWa+LL
 2yUDNqNib2mfRXrUXFSq/zW1Q4mdBrk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010043

On Sun, Nov 01, 2026 at 10:57:45AM +0100, Beat M. Liechti wrote:
> Since commit 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC driver to provide
> GAMMA_LUT DRM property"), dpu_crtc_atomic_check() releases and reserves
> the hardware blocks of a CRTC whenever color_mgmt_changed is set, not
> only on a modeset. A commit that merely replaces the GAMMA_LUT or CTM
> blob of an active CRTC can therefore move that CRTC to a different
> CTL/LM pair without disabling and re-enabling the pipeline, and the
> hardware keeps scanning out through blocks the driver no longer
> considers in use.
> 
> This is easy to hit with GNOME/mutter on a laptop driving an external
> display: closing the lid disables the eDP CRTC, and in the same atomic
> commit mutter sets new color blobs on the still active HDMI CRTC. With
> drm.debug enabled, dpu_rm_reserve() moves the HDMI CRTC from CTL_1 to
> the just released CTL_0 while its encoder is neither disabled nor
> re-enabled. A few seconds later the display SMMU reports context faults
> at the refresh rate and the external screen fills with garbage. Opening
> the lid again leads to a stream of "vblank timeout" and "frame done
> timeout" errors and the machine has to be power cycled.
> 
> Color management affects the topology in only one way: DSPP blocks are
> requested when either CTM or GAMMA_LUT is set. Handle that case in
> dpu_crtc_check_mode_changed() by forcing a full modeset when the
> presence of CTM/GAMMA_LUT changes, as msm_atomic_check() already does
> for the CTM, and stop reallocating resources on a bare
> color_mgmt_changed.
> 
> Fixes: 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Beat M. Liechti <beat@softbase.tech>
> ---
> 
> Notes:
>     Testing: ThinkPad T14s Gen 6 (X1E78100), GNOME 50 / mutter on Wayland,
>     LG 4K60 monitor on the HDMI port (DP to HDMI bridge), logind set to not
>     suspend on lid close while on external power. Without this patch every
>     lid close reproduces the corruption and hang described above. With it,
>     closing and opening the lid produces no SMMU faults, vblank timeouts or
>     frame done timeouts, and both displays keep working.
>     
>     That testing was done on a v7.0.14 based distribution kernel (Ubuntu
>     7.0.0-42.42). On msm-next the patch has only been compile tested (W=1,
>     no new warnings), not run.
>     
>     Open questions:
>     - Like the existing CTM check in msm_atomic_check() (see the FIXME
>       there), this sets allow_modeset on behalf of userspace when the DSPP
>       requirement changes. Rejecting such commits without
>       DRM_MODE_ATOMIC_ALLOW_MODESET would be stricter, but could break
>       compositors that toggle GAMMA_LUT at runtime (night light). I am happy
>       to change it either way.
>     - The RFC "drm/msm/dpu: Force modeset if new CTLs have been reserved"
>       (https://lists.freedesktop.org/archives/freedreno/2025-March/036824.html)
>       addresses reassignment without a modeset in general. This patch only
>       removes the color management trigger.
>     
>     The root cause analysis of the drm.debug trace, the fix and the
>     changelog were developed with an AI coding assistant (Claude by
>     Anthropic). I reviewed the change and tested it on the hardware above.
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 26 +++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 42d0a529b..3b304a896 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1516,6 +1516,20 @@ int dpu_crtc_check_mode_changed(struct drm_crtc_state *old_crtc_state,
>  	    (!clone_mode_requested && clone_mode_enabled))
>  		new_crtc_state->mode_changed = true;
>  
> +	/*
> +	 * DSPP blocks are reserved only when CTM or GAMMA_LUT is set (see
> +	 * dpu_crtc_get_topology()), so enabling or disabling color management
> +	 * changes the hardware topology. Changing resources on an active CRTC
> +	 * requires a full modeset; otherwise the CTL/LM blocks get swapped
> +	 * underneath a running pipeline.
> +	 */
> +	if (new_crtc_state->enable &&
> +	    (!!(old_crtc_state->ctm || old_crtc_state->gamma_lut) !=
> +	     !!(new_crtc_state->ctm || new_crtc_state->gamma_lut))) {
> +		new_crtc_state->mode_changed = true;
> +		new_crtc_state->state->allow_modeset = true;

Having allow_modeset in the atomic_check() code was a hack, which should
not have been allowed in. We are trying to get rid of it, not introduce
new instances of it.

> +	}
> +
>  	return 0;
>  }
>  
> @@ -1534,9 +1548,15 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  
>  	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
>  
> -	/* don't reallocate resources if only ACTIVE has beeen changed */
> -	if (crtc_state->mode_changed || crtc_state->connectors_changed ||
> -	    crtc_state->color_mgmt_changed) {
> +	/*
> +	 * Don't reallocate resources if only ACTIVE or color management
> +	 * values have changed. A change in DSPP requirements is turned into a
> +	 * modeset by dpu_crtc_check_mode_changed(). Reallocating on a plain
> +	 * color_mgmt_changed would move an active CRTC to different CTL/LM
> +	 * blocks without a modeset, leaving the hardware scanning out through
> +	 * stale CTL/LM state (SMMU faults, corrupted output, vblank timeouts).
> +	 */
> +	if (crtc_state->mode_changed || crtc_state->connectors_changed) {
>  		rc = dpu_crtc_assign_resources(crtc, crtc_state);
>  		if (rc < 0)
>  			return rc;
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

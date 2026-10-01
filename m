Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F02C374A1E
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 02:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790822473; cv=none; b=gSsueWH9c+BHkRJLeRf39A5o7H6NsL0bRCLNsCObdlJnuS0J+eGLJqJY+JhN9hep7TWoTFozLzBrUA5yS7SQC3JIoB9Fnwd1vPnrwP5RsiMqJvS8lv6vnW08rtilQsrYdYwG2mM1p3gBJnQPuqGxiwBqIS5kuWw13gm14NLqeak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790822473; c=relaxed/simple;
	bh=N1mv8KavMEDnX/BXxl0wV5Vb5d7h32365RgbMswEy/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geAfbkGEfEaOKAsJFFPpk2Jv1Aw4EW2NZK7o1WH1hMpV/wN5VCNW5RlEnnI+jsng58cHU3RWhZmjs5xhC2T8KUX4PpU+qlktf3be2uXHFWFBhUN9mJhh/lfKuarhDGlTcTEc3vOzQKyIxdJymaYWKXM+W39+ayg/hogfdq6om0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PvRKvfY/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIQSzfRp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PvRKvfY/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIQSzfRp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910jWqH271262
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 02:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ghkjprac1hGwE2HrmUj6yg2z
	I5ZEjbwo3mW27+l4U7w=; b=PvRKvfY/1bUonhpvDd9QQ/hrqKiYaxUFb8gHFmFB
	ThPOeFz4qpeTor4WGlUrdwmr9QzJ5IREGcnVnbWL3Z9lX2mthrLxN/4uGIPXvoUI
	mxMYUWday3aUaOW3YCjSK97Hdy1f86elKjKfp+Rvr7vWEh8x5Ny3udRHseCPPT+j
	/0qiB/uAqWkWD4jSngjM4gLEyLrGzjpUUhoojPNTgFtYWHod44GH9d69yD463h4p
	FOKcTsDthSi5UH+6R1PnULwBYldXQdqnd5gc4OPEgfk0havfZi08GyG7C3IDvsZM
	PmZztik015SRYUNkW/6kYIeiC1TmBgTDhA6eBnoyPj5Hng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvsk8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 02:41:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f248907fso585387385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 19:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790822470; x=1791427270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ghkjprac1hGwE2HrmUj6yg2zI5ZEjbwo3mW27+l4U7w=;
        b=NIQSzfRp2zHWeg8jg8MEIYEsmT5aRuk2EGexoMdHVXhkicZeWhGEBhfC65PMbs+p7L
         7AL+6yMai5u/BKdVxv4U5BC23nYNs7jVHKKG2SBXiZnPWq38mQbrPEfzpY+JAk+tgMA3
         n3cDUDaMBywJ0PXRihi3H3UO5dvkEuDQjAZ75widFXQ2SYZsAc8e15V+3WeTkovJyuQh
         jCHgZK35ffdw4QhLnYj72HCIY3xdsdspmNZGrLcBwgZqg8yqjCOiU/8sj0DflKS4VaAV
         d0uLZmHZJOUfz++FHzaOKhg34C8JMnCfVAqoBo4GDdYcUv9cpVyD/ehbjlslBhHYnnHN
         t2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790822470; x=1791427270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ghkjprac1hGwE2HrmUj6yg2zI5ZEjbwo3mW27+l4U7w=;
        b=GOH6fWpCPAdMAtK//JwcL+V+jNsTOP9PvCOGg+uXKJUX0yQBd1aK+E2B7ASBnHnYew
         GCkxup822cIHhkv0tFCOurA9sodOPO/nBZlGBBhdmpDm7CguX/Y4ejlaPZ9+/84n4Xpg
         z5GBuR+Ru5qsqf0IDsTfe/I4VxTqd2cg8EW8aVEG5/YNjkasm8YVgN8OthQ7HKwGDA1/
         1/lFPn9TWe57UjwyHnDJO1UmeCCIaiULx6AbXdg+xmDKcX8WeaJvEjuHeudXqcKPqoyL
         6T2ALgF+ouJvayAXJIFXhC3zvKanqb082Fqzux/Px14JLvAK5fh2oDa5BvDvPGT1cR9+
         DJYw==
X-Forwarded-Encrypted: i=1; AKwUvBxt0VspVHzE4uqE5/PFOUT5Jro+hyB24iYlxmz4Ydpsm/yidIvnmXWPHCSnIlajXgwp7aygJPd0TQO0GKvx@vger.kernel.org
X-Gm-Message-State: AFuF++nBwQZV83wuU1/ALOclAQn0yqSKrwh5oWoZZo5yXo8zkPSC4BUs
	HgIt3Oba5c28aXgDjWB6SxG0u/VtNLCB4dzBrk/nEHyDBi8Mao8eVSjncpzLFpFwtTHpmhWo3I8
	OJH9bEi7nQruJnDtCrdpPHRXPoPufG74AILdIz+Y405AzttqeLPEOE0FwqtHDpBtKqcE0
X-Gm-Gg: AYBFou2fA3Mg1MfVznPouAFisPgQifJQ//f0Ka4bxQKc0qsaWUhAKst0jyygvXXGtI6
	/+bZ2gfOJWtiK4Se8JHWZ9Py2TdZb7hsVEA/SBY7nah3+cCIsy9/f0y2SjctYbFqE+yD2M4omX6
	4+sYdb9s8iJCziZqILCumz1802XWd/o+VdHkoLu6eZNeHD0xhtxR539rx3nhYHffnejJgcj+w5j
	kIYGyZW8yE3wz6eGoPYW05us4UB9b5X02jaD+kSypqGy+vMg+uBfEi/NB8zW2ONl5iHROptJXx2
	eV/z90pnxwYXb9sH0r2/vmml744SsOFPPCh28U1chyCQqL5jCAWB9OBAxe8XvWPVrwzqNaAFBDx
	eD/Skn6veNzHluyoNeacIgClpqfrW6Hc9dZ40fdF/MdqrJt2PT/vgjN/ySUEDdxKaLjObk1IAVl
	B7h1TYyEW99nbT
X-Received: by 2002:a05:620a:4448:b0:93a:824:ac8d with SMTP id af79cd13be357-93ca96d83a2mr651723585a.27.1790822470141;
        Wed, 30 Sep 2026 19:41:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4448:b0:93a:824:ac8d with SMTP id af79cd13be357-93ca96d83a2mr651720685a.27.1790822469619;
        Wed, 30 Sep 2026 19:41:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a77192c19csm12699581fa.29.2026.09.30.19.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:41:07 -0700 (PDT)
Date: Thu, 1 Oct 2026 05:41:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: compute the CRTC bandwidth from the state
 being checked
Message-ID: <5rpjfokvikv2m2bayq72ar4z2i72esaarwzsui3yrceh3urvil@fuopy4uqypyv>
References: <20260929130633.977-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929130633.977-1-26rote@gmail.com>
X-Proofpoint-ORIG-GUID: a28jVJbn01zodUeBVLBNGsnf1JYXcpII
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxMCBTYWx0ZWRfX3saJwM6dHnBj
 rAEekUsrOak+H9eIaGmPVhM9KCkXvT5ZAyLvdG9pfdy5UoY3SlI8P2tkVEODpLHoEyVqSeSPYL+
 eb4TTw7HawcgVJhMNX3tw7r0KRy9Y4V0MubxDeb9AStFvL5fYFaoWrxecvZuHOxiy0Cp+eIiKL5
 Foj0jM3cKjYtF560w0NNj2FlOTYPYutmYnEH8CHAg/5aojMYXaTq4RJ0saf7ITLRty9ilTca4MG
 d3Doi+ONB0mEJqQ7JnZwSSk3GVPdWYWnS51Ud5PhrnVxZFYjP2A5CLxFK2a8/awcQCx6z9aR/3l
 t9TvERqDMjEqUVTK0RjW8bMGPmFAOavxaoCBWiZKDmA+cp5KEhyOUOraADchZqwOBXTDH8ryFHk
 bmEHpj480ubQvSqXkrhtKgMqFIt1XvrX1SEH0T0Qhuz6ZpvIuta7kY0fONGZ5Gy1cYZHGy+5Y6a
 zDEEwKaPhx+6Vsu1l4A==
X-Proofpoint-GUID: a28jVJbn01zodUeBVLBNGsnf1JYXcpII
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxMCBTYWx0ZWRfX9T0Y//3ooIpJ
 pqGSf8ZYfpa2XIAl5lEwPHLLpwc6ZJz8Su8nRHzHiEOoZC343vmt9lAmYa0mz7MTOfSE7aXGbDE
 cTUdcpueJIedtIeNb+p8iEVD0exxsbE=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abdc847 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=9aN-E-HqI_eRP4b4jg4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010010

On Tue, Sep 29, 2026 at 10:06:33PM +0900, Joonhoe Kim wrote:
> _dpu_core_perf_calc_bw() is called with the new CRTC state but sums
> plane_fetch_bw over drm_atomic_crtc_for_each_plane(), i.e. the planes
> of the committed state. When the CRTC is re-enabled (DPMS on, system
> resume) the committed state has no planes attached, so the check
> computes bw_ctl = 0 and the display runs without an average bandwidth
> vote on the MDP path until some later commit changes a plane -- which
> may not happen for a long time on a static screen such as a lock
> screen.
> 
> Seen on a Lenovo TB323FU (SM8850) through the interconnect and DPU
> tracepoints: after DPMS off/on or s2idle, dpu_perf_crtc_update reported
> bw_ctl=0 and qnm_mdp was left at avg_bw=0 (peak 800000) instead of the
> 3728793 kBps voted before, until the next mode change.
> 
> Iterate the plane states of the CRTC state being checked instead.
> drm_atomic_crtc_state_for_each_plane_state() falls back to the current
> plane state for planes that are not part of the commit, so the result
> is unchanged for commits that do touch the planes.
> 
> With this, bw_ctl is 3728793600 right after DPMS on and after resume.
> Only tested on this device.
> 
> Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---
> _dpu_core_perf_calc_clk() walks the planes the same way; it is not
> touched here since I have not seen a wrong clock vote from it.
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 24 ++++++++++---------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index fea173e37464..343c41550637 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -54,24 +54,26 @@ u64 dpu_core_perf_adjusted_mode_clk(u64 mode_clk_rate,
>  /**
>   * _dpu_core_perf_calc_bw() - to calculate BW per crtc
>   * @perf_cfg: performance configuration
> - * @crtc: pointer to a crtc
> + * @state: the CRTC state
>   * Return: returns aggregated BW for all planes in crtc.
>   */
>  static u64 _dpu_core_perf_calc_bw(const struct dpu_perf_cfg *perf_cfg,
> -		struct drm_crtc *crtc)
> +		struct drm_crtc_state *state)
>  {
>  	struct drm_plane *plane;
> -	struct dpu_plane_state *pstate;
> +	const struct drm_plane_state *plane_state;
>  	u64 crtc_plane_bw = 0;
>  	u32 bw_factor;
>  
> -	drm_atomic_crtc_for_each_plane(plane, crtc) {
> -		pstate = to_dpu_plane_state(plane->state);
> -		if (!pstate)
> -			continue;
> -
> -		crtc_plane_bw += pstate->plane_fetch_bw;
> -	}
> +	/*
> +	 * The planes of the CRTC state being checked: iterating the committed
> +	 * state (drm_atomic_crtc_for_each_plane()) summed nothing when the CRTC
> +	 * was being re-enabled (DPMS on, resume), whose old state has no
> +	 * planes, and the display ran without a bandwidth vote until the next
> +	 * plane update.
> +	 */

This again duplicates commit message. Please drop it. The patch LGTM.

> +	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, state)
> +		crtc_plane_bw += to_dpu_plane_state(plane_state)->plane_fetch_bw;
>  
>  	bw_factor = perf_cfg->bw_inefficiency_factor;
>  	if (bw_factor) {
> @@ -131,7 +133,7 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
>  		return;
>  	}
>  
> -	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> +	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, state);
>  	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
>  	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
>  	DRM_DEBUG_ATOMIC(
> 
> base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

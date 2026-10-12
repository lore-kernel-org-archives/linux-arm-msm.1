Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0405730C606
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807301; cv=none; b=FHb6ZNuK5HCPWFUg0ycCBZzwQStgNJhD0+u4Ie+4ZNJQQMh3hSdH0Ul7kY5/RJUpHoWvOy8Kr3tJ18J12S9tJJFDvvrUT0NYpTimR4ACJAytangQZS2uwLV586oTWz5UzqdUPXIUpE96eSNb9NjC0YsYqZd6JsVcac9LkxfzHJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807301; c=relaxed/simple;
	bh=zpH1RrQPEpCPdQaKz6SHrd4kSAVlPCrsQI6bIa3qi34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFNnymOQw9nkg+leis3OzKPDmtp+tIrwOwp9j3W5BHf8utFisyL3K8K8Z3aIVC7jkmaXYsC+2mtcbWF9lzDgcNrjlXjOckiPRgWNqoUIXgqfa+tU4fSvh6lh2JPxoEa8jHo5IfkP0Ld1H/AD5/3DDrbW6tRCKlDKfpMOdcQWWxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGhE4hUf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNwqjkl8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FGhE4hUf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNwqjkl8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0AL62275884
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SpuOW3irnSF9gZWodyKphbnc
	flg4AOxCzIxt+F492qw=; b=FGhE4hUfGbH3tvVr29hEAg+OCyVPFAtVfQ28XeKb
	7xXoc13xxUMz62CLDsV6f+bkpzFbxvupMbXrwQ6iJWlFj4d4b4SrcJtkN4mqq3x0
	ccDQsZtVPOKWWPzRDJUeJFETkoMgOn3fZCa0qvJl5IdJpJjhKmP3KH3Mai0cm8G+
	Gh2JgHYhHGR8+zE+otGY3QaAgjCmsLZhU7NCqxyzrk6YdWlL6wrzVrC8M9xu5SPP
	ZIgyoZljw1Epkyxlwt8m9trhLSFVNkbeZUjLpHSY09bflv/MWdpUS/rS2oWyv1BO
	RZURVL5MqaZIwxP1a4Y6kqVPAlQ/eLwjk/+ATmJtC54hVg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq18cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:14:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dea1b6c89so365805185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807298; x=1792412098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SpuOW3irnSF9gZWodyKphbncflg4AOxCzIxt+F492qw=;
        b=WNwqjkl8l0y2/JHer8Xi1pk7RNs7tQlZTqZs5Tw1dJHR8aOZKfHhwjBri/j/wOQjnx
         6FuY516+0qulwLgyOB6mgrMJ6UkrN19PsF1WqYCD0PWuFavfQzzgSfEU3wWJNHVuClWe
         R1W5AV1M9BgzsMOadP/4RQ5bKxFgJI91wbYGqvsCdYHGISdoyJ+iufq587NvReyLdYHt
         0VeLEaJBVlllxX8D89aLMj4t541GESl+DUP3I55YlXd7pENSxysrjyn2yemtOWz/kfp2
         iYq8/Y4ofVJcZvA/oj2tWEedduQumQYeb9y1Ighbu/Ps9q+Kss1vtdqsmo5/S3l6lkoJ
         UtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807298; x=1792412098;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SpuOW3irnSF9gZWodyKphbncflg4AOxCzIxt+F492qw=;
        b=XeWCPRcx0Sb0kuaPvzxd5bSKI5lOq5doJSqUNf/wrBan80HpjTe+BvIokTjhX2wxJd
         H8dAaj3/3NE4ZJmW+87pNthtjvHTyhZH79auZI2F6Pne5owVQw3EBc1uMxRsb6Yk2vMi
         AYqXzs94Zh9repe4luZf4q4o0F1l1VIw20imRYJQRe6MRrINUCviMOccGV1bSlU8Uk+q
         EGWE74Kowy9yrm55J4/T2RIvsz6Lgs3wqFbSzHet9FrKaYE1b0yODeTRp9g0E6ejqfHn
         YXbubeFIPaTDWqUBIQi7707f5uxV6MiAa+WEYVfaCFEI+sFwzhl0J9VB8beH0scezCZX
         95zw==
X-Forwarded-Encrypted: i=1; AKwUvBysy5b2V3sTgTCjV/SUDFqkLigO3VxUqHdvcACbAw8+PtND2O6exB/2wYdmz/M7kDWA5bjcQd4Vm5z+fNuI@vger.kernel.org
X-Gm-Message-State: AFq9FYKRIa3HCBUMw3980kD34pl2N19UKuERHZGWz/B2Dx502F73ct5x
	v7gPcAPgCwtGZQvdJZytgKrVfW8KsG4w8ZKUk++ZWWIWZNwUY5cZiSi6ZhGNANdjxgLo3pkb01b
	rfzZWfHwIb7MVB1E+iyFHV554vji7HduPQc2yFty6H3lJAFiouqBrH9iF0XD/qkQSwOn61Dhu0J
	Eg
X-Gm-Gg: AYBFou06ljlFSU6ISXgPW10DQOvtavkCacAxFpqaWmVFZqlZ5fNRnQVsQzrDwxkNTL6
	1eAAa0q0ofsaZB4nzy/8J0O113YkT9rS48Xuc3ZGEBRNMsk8BaUSNhNwhADB8RfkTXqrCSRS+/B
	1QkxSBX7r9HH6sxLfCrVEc9aC3o8n8yNiZuwrUVIYE8DGbhLgyJe1wAr7uh8snco7LYkIlFdMoE
	mTONCS83DVqIJYjUGapkgpCs+r8YQsz3l51mDPXg4KW/ohq0k/3PQktE/dyVfV9pwGxDqbPy4Y9
	vI8Bcf94vwcuSZRVsn2R+VdUDEBOHxK7k2bmqMthMZMHqP1AmrdZLM5/ZCdE2+ZCUplcdZAsUpn
	6QUbLJ5cnYIj0Z/8zMh/JEcxwvGpsrE9Z8Q6nf6PktD2cxh/+VMMc8kXvRaihy2VNP3vo6jzspw
	7IN16UBoxMimWo
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fd with SMTP id af79cd13be357-93ec12c4a90mr1419179685a.74.1791807298155;
        Mon, 12 Oct 2026 05:14:58 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fd with SMTP id af79cd13be357-93ec12c4a90mr1419174485a.74.1791807297651;
        Mon, 12 Oct 2026 05:14:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddcd3fcbsm2817950e87.0.2026.10.12.05.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:14:54 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:14:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] drm/msm/dpu: check mode against PINGPONG or DSC
 max width
Message-ID: <2mut637ssnnyf7spywezdkx5fpoc4virkr3zuqzj3klwd3ijfr@xk46zya3hgak>
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
 <20261008-lm_fixes_final-v4-3-fa986071c3c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-lm_fixes_final-v4-3-fa986071c3c1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acccf43 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=Wa-MJAjFNFIhp57g3PAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OCBTYWx0ZWRfXzdF7iPr9U/k7
 VZNW5sJfDgYPy7HuzLdKqPPR/+PIufkaDRfOFnn/qcmc//Hmg2DCcfSt/iqO9o/P8/NGu2bU2zb
 paU2WGyyTa44N9nKJ8uZgvy6KvDvq8A=
X-Proofpoint-GUID: rU6nWP9exjqJosNTcWSKlZNHnYapfIUn
X-Proofpoint-ORIG-GUID: rU6nWP9exjqJosNTcWSKlZNHnYapfIUn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OCBTYWx0ZWRfX2ecA9ROBD0mt
 d8lK+1sNbaDmnBD54PF5cQb3WlxY80CLqSW7TMEhLU8rdeO1r8i8sDSvYSptN/Ew0ZvXcr0IZgj
 Vis/33LeIkoEIw0DBi6wAN4cO0ErpXYYtUbswUYGg8ejGFrAbpC2cuDBRbNzuKS98tfPezlaHlg
 /sbTn/TnhmOBnyd/krKBbzLzAEfvRvidfLNJrAtkQJqb4xCXLVdAD7wSTl8nnUO+hBSjLBFS26Y
 ReBCFB2sS8v1yRn7q88Wm3kdNp/zLaqTlEwqTSt5v3H1z03FlsDaPZGuVxFMSJewfxWiH1NLkTu
 LPkk3aA4RgxV1Z2VBLPsMC8S+MEkVjXiLAJ2PHNt63uuydw+mCohPcqMn1+oySxVRA2FGxU6jyF
 7YV4NgM0Ls0VWbsQgLneVSYDOqW2FmFvQfY21J6h5gLMMhcDwBVRHbhERSXdcxZ+gb61+QMXwue
 Cl8y+vh/FElXR2e84yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120048

On Thu, Oct 08, 2026 at 10:53:49PM +0530, Mahadevan P wrote:
> From: Jessica Zhang <jesszhan0024@gmail.com>
> 
> LM block doesn't have a hardware buffer (unlike PINGPONG and DSC
> encoders). As such, don't use ephemeral max_mixer_width and
> MAX_HDISPLAY_SPLIT to validate requested modes. Instead use PP and DSC
> buffer widths.
> 
> While on the DPU 8.x+ supports a max linewidth of 8960 for PINGPONG_0,
> there is some additional logic that needs to be added to the resource
> manager to specifically try and reserve PINGPONG_0 for modes that are
> greater than 5k.
> 
> The layer-mixer count for a merge-capable, non-DSC mode is chosen by
> dpu_crtc_num_lm_for_mode(); feed the PINGPONG/DSC derived width to it as
> the split threshold in place of the removed MAX_HDISPLAY_SPLIT, so the
> pixel-rate floor added earlier keeps high-refresh modes that now fit
> within a single PINGPONG buffer split across two mixers.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a
> [DB: reworked to drop catalog changes, updated commit message]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> [MP: rebased on msm-next; fed PINGPONG/DSC width into
>  dpu_crtc_num_lm_for_mode() instead of open-coding the width test]
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       | 54 +++++++++++++++++++++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  7 ++++
>  2 files changed, 51 insertions(+), 10 deletions(-)
> 
> @@ -765,13 +781,14 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
>  	struct drm_display_mode *adj_mode = &state->adjusted_mode;
>  	u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
>  	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> +	int max_pingpong_width = msm_display_get_max_pingpong_width(dpu_kms);
>  	int i;
>  
>  	/* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
>  	 * before even checking the width after the split
>  	 */
>  	if (!dpu_kms->catalog->caps->has_3d_merge &&
> -	    adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
> +	    adj_mode->hdisplay > max_pingpong_width)
>  		return -E2BIG;

I guess Sashiko is correct here, we need to check DSC width.

>  
>  	for (i = 0; i < cstate->num_mixers; i++) {
> @@ -783,7 +800,7 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
>  
>  		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
>  
> -		if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
> +		if (drm_rect_width(r) > max_pingpong_width)
>  			return -E2BIG;
>  	}
>  
> @@ -1374,17 +1391,17 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
>  }
>  
>  #define MAX_CHANNELS_PER_CRTC PIPES_PER_PLANE
> -#define MAX_HDISPLAY_SPLIT 1080
>  
>  static u32 dpu_crtc_num_lm_for_mode(struct dpu_kms *dpu_kms,
> -				    const struct drm_display_mode *mode)
> +				    const struct drm_display_mode *mode,
> +				    u32 max_hdisplay_split)
>  {
>  	u64 mode_clk;
>  
>  	if (!dpu_kms->catalog->caps->has_3d_merge)
>  		return 1;
>  
> -	if (mode->hdisplay > MAX_HDISPLAY_SPLIT)
> +	if (mode->hdisplay > max_hdisplay_split)
>  		return 2;
>  
>  	mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
> @@ -1403,6 +1420,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>  	struct msm_display_topology topology = {0};
>  	struct drm_encoder *drm_enc;
> +	u32 max_hdisplay_split;
>  
>  	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
>  		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
> @@ -1410,6 +1428,19 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  
>  	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
>  
> +	max_hdisplay_split = msm_display_get_max_pingpong_width(dpu_kms);
> +
> +	if (topology.num_dsc > 0) {
> +		u32 max_dsc_encoder_width;
> +
> +		if (dpu_kms->catalog->mdss_ver->core_major_ver < 6)
> +			max_dsc_encoder_width = DPU_1_x_MAX_DSC_ENCODER_WIDTH;
> +		else
> +			max_dsc_encoder_width = DPU_8_x_MAX_DSC_ENCODER_WIDTH;
> +
> +		max_hdisplay_split = min(max_hdisplay_split, max_dsc_encoder_width);

Should this be min() rather than max()?

> +	}
> +
>  	/*
>  	 * Datapath topology selection
>  	 *

-- 
With best wishes
Dmitry

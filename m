Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EA549DBA6
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165481; cv=none; b=kw9hvGutB8MWhyEzNY1aJj6Z8V9pVqXdJWOpcdfFBO0MgnNwc7pwch2rPBXzED5JpyOEOL8o8nqr2+hVLf2fN5dORiE5ycj8XcEihqs7yRh4JWfbThERZuVcGgtBmJII9YWC9d/gEvFSTjPxIkgvOkQTJsKY+ifW7gKXvKH3snA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165481; c=relaxed/simple;
	bh=huFl7zPpoNDi3ZejUCdFgfxAsa+ZPgCrVcmlJh38yNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJp+fcsFC+3sD5BbQ1KojO9PZ++LiSiSgHQaa4e7hEHRlt+eI7B3D4DJcgbPBI/vEUZj6GbVfWiSzgNVm7eH1+yeC22K0F9ugas2qjK/ZekANq0k2o43ZUhqlGa8holEM6JM5u8yJ131Xp3WdzpWMpvD2p9ifkkdplhaBp7Rm6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SCOGI/Nf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnQNvrtz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SCOGI/Nf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnQNvrtz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbTEc2466545
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8A0MKVbKWmnlKbzQw920PSpP
	eoOO0tpdgW2Ug9tAy0I=; b=SCOGI/NfAWRAzhh7yBTj8bqPb5Iyp90UuKn+E4DO
	6Fwcdm1hrjLMfKkZb9S5sRywkXQpkV5FzrE7gpGfK8U2FxZ5AGTn7FOcPQI+q1vZ
	3EOpN/KXOlzGso2YnsPnrk2cE2Oc6ptH7Ok3wcT8M0e2doxQ4niTbsAXP+gVkL0D
	L+6gueUd9RDWgJwOkLsL85fjblNDciYggzKkTLY76kiPoWTFgiVTXwRcDRJpYSDB
	csPZ5Nt8SCgXjVAn06+3O6eiydCq1+xgqLDBxfJ7uAOuv6+xUb4XdPOs95GeGADh
	ZIln7ZkzAW8FgFSFSySNrKi/aRbIg2L/38ZLMmGQWOM1QQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c3wnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:11:16 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-982a39e0c4dso193560241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165476; x=1790770276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8A0MKVbKWmnlKbzQw920PSpPeoOO0tpdgW2Ug9tAy0I=;
        b=TnQNvrtzjDaIp+lZ7Y4/sPCbnqiL69QRShXcLefFpYQ49rnB/TxsSvABleVnfwagNl
         BzSW+2XfVcNzMVtfDYHvgQ8GCBEF0GTUyoy2plUzihuPy/yXFJzX9AM/J/aLDwamk4KX
         lf6QK+ygFITHGdXToGiO7eQzr4GlV6v8CtZ1iM+ApS8crvvXpMRnAmiX60WTz/PiZvL+
         o9o7SExbc/A+rSUA8Utd7CINWJpTdZJT74ntQM1E0i6oRGTgLYty8DaGAXZhkjl3dO3U
         ij8XlH79psRtMfMa4UQruKxVpX3K5Z3LsZTJrzCSzzRNuSLBNzuc1X8WjZ/VG9sWbQK/
         weKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165476; x=1790770276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8A0MKVbKWmnlKbzQw920PSpPeoOO0tpdgW2Ug9tAy0I=;
        b=Kup6eGlQ2DpExUsy6B/L7DmjWw3XtwDTZWeQvRoEfZM95u7/q0UqwZnpXVTx37NxlF
         lZxyvyBFrMaGLwLXaOSeYouuUKLPz2K9M2Gy3gx1om0JbeZ2eXkF1BfmXqA5ijTLYzqm
         wNyzibiLNqt6RwjwP8kVLhJnl6zWk7FwJ5CMMILWdWd6EBfJ+j+RJi8+YQCZUVb/TVW5
         GFl4XADB+A2QV0XM1F54YiK8XitJai61ljP6j/tIDfKzy5CD763ztovQd5ib6JqU7a0Z
         hyviHu7MM4GM3lBOoutmG9oFmDCyFvn3UqA58oovZ5h5r4UPrinh+SVawoLU+nlbIUVk
         R8Uw==
X-Forwarded-Encrypted: i=1; AKwUvBwiMrpPnEXkexYYSPfjBkIQOoBLn8cCAV6aHL4JEvUKSvNqBvco0bSTUCZuxOp6W+e8HBnU+EzVDM+x06+V@vger.kernel.org
X-Gm-Message-State: AFuF++mZ9A6k5m/WKfbjUj03Hvr3Fah8BfuWI9oRbty0iD5uCNrJ+b8j
	zsbSh/TV+R+VvS5CpSn0AvGNaVChFTItJjfllMQcMJ2YevVuP1K733yyS+TKlyWLhoXNcFFqJhR
	h4PIzpBxhsVF378db7uwkPPwFO5lGb7qWJHDa8QfFKmy8BwQjGlabMtWrRo6+kNUa57Hp
X-Gm-Gg: AYBFou1csDFAgNmISN1+wvMnBtQ3G7ftQPbbQnCS2F0w8SjBCJkopVpEY1INEwiRKSC
	4li8YHaVAxqagCbr/7nwGeZY3nRDPCXYVyjcfViXeqLAa8lp9Nr5S7TxUueZcdHfZO/0XG0f423
	kk53NPbT5FVlnnXf8ZEJn2y0f+cFaDUxlDMlE9YSCL8fA7SEGFx2Kev2/ZpWQ+RUHYBaz6fH3OE
	ix5XH8LWwXbdTYyTE8iGV+s8Kw0vohzSzJHloXwWK6hpCsI2rkR65DuQ0LHzGJ0kuz50oNKrXa0
	t67jSOFtZ9GZvnDjKASF+D+2BA4LZ3LBSo/7IlixZZPWkNrwCtwGtkl6SlWdM5Dft7DBSc96ws8
	D5vFg9Siy6G4RtaK5V+jnNmN1WZ91Linr0cqcQkKqHe3NVcGZCPKhyGlS3ZLEX28IMJztn2Tg6G
	42+uRRY5Ovc57Y
X-Received: by 2002:a05:6102:2c82:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7ac1ea99e8fmr1676849137.36.1790165475582;
        Wed, 23 Sep 2026 05:11:15 -0700 (PDT)
X-Received: by 2002:a05:6102:2c82:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7ac1ea99e8fmr1676817137.36.1790165475048;
        Wed, 23 Sep 2026 05:11:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8590237sm555422e87.69.2026.09.23.05.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:11:12 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:11:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/15] drm/msm/a6xx: Honor perfmode_bw threshold on A8x
Message-ID: <yfpkgdcf3c366giiec6p4bjoutwepvtkjf3yushbgzeqe4uygw@pnddu3mbsmlb>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <20260923-hawi-gpu-v1-1-0c3c79a1a470@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-hawi-gpu-v1-1-0c3c79a1a470@oss.qualcomm.com>
X-Proofpoint-GUID: 8jmLlZm_stFuXwsfXhkkRP0gJ4QtbgPr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfXzv1Eizlc+Nb/
 NM2scb8IXz2Vpo2bnzNqY50wDqPh9qiT5R2DoHroKnblaZuLHENqPSHhQiNDXsl0zWLxwSMKEfV
 w7v0HpcVdiZlnwkJPjE50uxl4XC9yBQ=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3c1e4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=YJv5aonfaXPMDC4gfg4A:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 8jmLlZm_stFuXwsfXhkkRP0gJ4QtbgPr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfXwDWlW2Rh+G75
 DROGFHH6LSz+DKmJZ8/UBZ5YtVaUOiSO54YeEioSE/cRigKyXKse3VNvef7OA/tv9Bb8hREF9bR
 SuHT7TkNZOY+dfhVPsh/26IU6usSuwJJaXZat9jRg/wQMlRPlyhs7ZuGNqGTHMJqyLe5nsU6Yz2
 YKhJIIjz/Q5K0SKua1moO/UlJnrElXpOgb7XVgrwedLpNcRbikSkjMnMYTmGWiBHA2MQh4lAcTq
 QNbS2O6GWwXFaScLrk72iT3Ndhw02gcb9UIZMa1x7jFLfgIfMZYXmwOyH3CupbaPNU0Ls3hYUvu
 tq+bUg5pljHPrw4Tnpbp+UiZrK1OAHHWX+w/yKbsy5U/xZUfHh32tIwYlKoDeeC/ELTGFRqC9Lz
 Hr8YW2JKmIuml0UDBnRKkqmWKRNY/Vt91MB8w6awG/6ljKObaaEGSHRx3d/HQm+B7XNWAnX+byH
 bYwAALKKFDhefirCU7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048

On Wed, Sep 23, 2026 at 03:55:41PM +0530, Akhil P Oommen wrote:
> Instead of voting ACV for all bw corners for A8x GPU, restrict it to BW
> votes above the perfmode_bw threshold, similar to the A7x GPUs.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 8 ++++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 +++++
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

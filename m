Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CE639A4A7
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 05:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786945489; cv=none; b=iO7XKFA5b10dEUfXuEWsg8EzXgpuwD+ObQ7ew7xHcFWA+3UfWSTX06Snw3fhuiSlzxr4Mh/ejYOifsZCdOphK4o7aEITdXlwr6VYaB7cLp65LbKwqKe3BTGiNM+IauA4vvHYMto2kx0Ne0xE42v9Y2oR4m4xCV8FXcRQ7vnRT6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786945489; c=relaxed/simple;
	bh=BOsWlzsNjRjW+LGvfzEBsGi7iZHKZ6oJ+OnpFU+/UbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4sQYLLpoMe//W04x7IeyTNE8GlusASPqDf2Jc7WzbXrQNmVUEHW6QNAr8dQburnRp1y6Ux23GW1U3IQO/TkMI1wX+gQDQac6dMojRJVQTHbznMC2ivMtoXlkru1LcM+Rj4w2gZ3l64pdW9iJdeJQPmTDMXfW1PPKhynUhK4X+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZB+O1Wf5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNVJTFwu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZB+O1Wf5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNVJTFwu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLCNCd3656967
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 05:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DxIV54bZW0mbknxQlawpAwW+
	cPAeEoPsp3aYvzyr9hY=; b=ZB+O1Wf53eu36mBtTwPud49KO9hQowP2gfnqPgwE
	2shvJmDSi8qJt95K4SnQn+tyaY45tCdf4ZJzHSb/H62tfWwBX/py+yXLoG1Aq1ze
	vrGICIKVmH2QZGLg3CXfySNST6xBwDI1l4E+6lOz8Uq6kjDJ1I8iZzMwp7E/CtSl
	notJcVzkiYG0MEc1Dmjezk/FlFAmf47khwLJA9xeJLp1hnS+cPQ94KNNCiY9c0oC
	U7U/GsExkWKnkQvDcRF0aZqXTv7GfOkm4wgsmUtmSp9zk9IUmdQY4Z61fR9b+4+N
	TYENKCzlYJXUcJ6Ub0KcwZ0FD3fYl+H++JFzkgr4z3sLKw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2h9gn8pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 05:44:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d28f8737eso55640401cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 22:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786945486; x=1787550286; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DxIV54bZW0mbknxQlawpAwW+cPAeEoPsp3aYvzyr9hY=;
        b=fNVJTFwuKMSoRVveah3JrO8CTqdzT/eUTuPLpxSJtHXQqCsS1J1l58zw2A4xDiqg7H
         wVGAWQKQlMTyV8hjRkM7mFE9qro1PmDGmavOm8mh1oFpA79wFcIGbJE68xhfBb4qwnsz
         DrBm3nSIcaH5WeTnTz3hP9SELNwTGb5Ps/Tl17mr2lSZ/80VGaUeH36/Svb8GW3tKRLF
         g6rizOOluUXTxdvuHwxsW0/sgp0FGTa0zjLvkrCuBNKiP+e+QKdIoauYcksNVYYX5oHq
         euL5frECSZbJZjPWuqzhj/8vjKLIHCPjqerYPmi2lo/je3sa1mM1hUZ5A4s5MhuFXRNE
         4r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786945486; x=1787550286;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DxIV54bZW0mbknxQlawpAwW+cPAeEoPsp3aYvzyr9hY=;
        b=eWrNmQ/HO8AhEL5TOJziCkNI8UcOgUnIiK1DvPP94ptr9+6yKQ3VHVXhN+DVXs2LxL
         yWQyqXXzni3B3KlZLJtiWK0c0CF+vsR6/Lr5syLX5wLuvC+9MqC1au7t/DxDVnj6BKxz
         LVH1BPK620GLxUeKtOwVx5ROzY+47lu6FaZcUkAJ4K9vtUJel+h44Whbqp1Wp+YBob4d
         Sjcl/dRF7ggoa04ifog7/bZ5TzA7kvlRQuCr9HzSS71/6YRl3CuDx6Q4xcspAiI+kNms
         oZ0utlzIP62n2t+4JsmGPwq+vdcm88wKBRjDCZsWzWp/HdNrz1jKKKRrXdDdpNS4UHoG
         20oQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKBO9TyWhCeBjsN9nr5V7M2HwutHgkOz8O60h4FdTFZHFcKEedkP6Sy4mfSEcVvQFXBFXB5ySo9zOydauS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9FVmz8dsokXehlRmE6AEb83PaWndjqhNGPg/QLZgNbKXR3ces
	aH8b31DpC/tGZBf7SmsHoiuiIk6KDAaIUFyi20NW2R7SlZtbHobDM2KopgmNfieKGzWCcx+yX7l
	UJzWKIfG/DlA3gwYHVLjP2AvAJW+i+3HGvG5Rvdg12V8v50msDYwK+sSkSTwU+i9kUNBO
X-Gm-Gg: AR+sD10MXin5IXGnicd0MWMu5NuVr2WsVTnBMOjQRnqUDx8ydqsb0MO2DydEbo9chgg
	abQJoO7F0YCJTyuCuYYaJQyZ/EvgbxAPs2QkDv71nfuOIlKQhy/J5JEqpntZibaNK3sD7U/pU1D
	lDpNX9+qyW8GVXXA7LEnvvwect2IzVmPNiGodI6uw5TxANk0qLyAfLC1mqKDj+eMEO42rK+Is6d
	AJHUzamizLiBdCzPO8SfGG/rioM6QAAFMMtTwYHo1FNGxSfRxf3znU2qkJVKfK98OKi+ETWDz0/
	2v72lU8W7z63o3o3UiWsnfIxEPhqQnRI7Amk/tKyaIMqwPBhnbuH0fKTECz+Fw6sKAD1mBO0tht
	GHuxm5V0SSfxhITYe009CWTnQF0BFK+UICB3NPUsh3Q7/FLvJ+5oDn3hSzTouun42Aq3ACfDzf8
	quCjfY+uKHACOU
X-Received: by 2002:a05:622a:8451:20b0:52d:882e:4986 with SMTP id d75a77b69052e-52d882e4c7emr139157261cf.4.1786945485952;
        Sun, 16 Aug 2026 22:44:45 -0700 (PDT)
X-Received: by 2002:a05:622a:8451:20b0:52d:882e:4986 with SMTP id d75a77b69052e-52d882e4c7emr139156871cf.4.1786945485468;
        Sun, 16 Aug 2026 22:44:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cffea7bsm89313e87.50.2026.08.16.22.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 22:44:43 -0700 (PDT)
Date: Mon, 17 Aug 2026 08:44:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 15/15] accel/qda: Add remote memory unmap from DSP
 address space
Message-ID: <6k6ogbosxx4z5bh7uriu4fnj24ycuakylq6g2gnuwsbckl2zww@e66jgj5xo52o>
References: <20260817-qda-v2-v2-0-757ab8ed2f64@oss.qualcomm.com>
 <20260817-qda-v2-v2-15-757ab8ed2f64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-qda-v2-v2-15-757ab8ed2f64@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ixyDJrGuffIZpDSlbzELoMCeDr2AUgtV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA0MCBTYWx0ZWRfXyM3d0Ce11Whz
 XvRXv4AX9OsmQT1BldcnHQcuzlP+eP63IlMPICMVPIuhocvB1aQw8lHBlmgccUlxkPO0qKgVkVw
 MDPCuEbNNy60HRGJyXVr5HDAJUbjces=
X-Proofpoint-GUID: ixyDJrGuffIZpDSlbzELoMCeDr2AUgtV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA0MCBTYWx0ZWRfX7CHCTZaNWSUw
 htuaw8/2sW49khnYF8yBrrqVocPlgaGGmH4TLAaAylO6rPcSx+s0f23OyhSeewrG176ZwVThHxQ
 XA7uNc1csz97RctG607x8z0j53u0JwT79IhRR3qLlHoQ5F+Ibyo7BVDue9GRYt+gZrjiXw06htm
 Zhhn3/m4eMdM9lOKsHfdm2fgdoa9UICK1sAuxATUlOYMsPFJGUQtUVTLWLWw1mQmFapAJWtgtGw
 4Km7LettIRwZqkqbl2ygN3KT/BFauv2A/xdYZyQGRvdOqOM1oSCLKVn6JZ0lEUfqX1hBBjg2w1Q
 wZyEyBy9DuFmS63xh3K4PcrI3T7v5V/AJ5Cck07Xjf/Nz6vsqtunmMyWcNSILc4tkyzQezFadIr
 FrbXKd4hAWOJNdGOK4YRzYHI6oyOKGMxKDLLyJDesEJLthiiwAl5xbDPaQA449N0kusWqpACnYu
 KyHPLCIBJ6V/TXPxA0g==
X-Authority-Analysis: v=2.4 cv=XM4AjwhE c=1 sm=1 tr=0 ts=6a829fcf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Fyn7aR8NovT3rRngz-oA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170040

On Mon, Aug 17, 2026 at 10:38:45AM +0530, Ekansh Gupta wrote:
> Add DRM_IOCTL_QDA_REMOTE_MUNMAP, which removes a mapping previously
> established with DRM_IOCTL_QDA_REMOTE_MAP from the DSP address space of
> the calling process.
> 
> Mirroring the map path, the DSP exposes two unmap operations, both
> reachable through this IOCTL and selected by the request field of
> struct drm_qda_mem_unmap:
> 
>   QDA_REQUEST_MUNMAP unmaps a region by the DSP address that the
>   corresponding map call returned. It uses the vaddrout and size fields.
> 
>   QDA_REQUEST_MEM_UNMAP unmaps a region by buffer identity, using the
>   GEM handle, the DSP virtual address and the size.

Why do we need two different operations? Can you just pass the GEM
handle to the IOCTL?

Also, what happens if the buffer is still in use on the DSP side? Will
the DSP crash? Will the whole board crash?


> 
> Each request type has its own argument builder in qda_fastrpc.c,
> documented with the packed argument layout the DSP expects. Unknown
> request types are rejected with -EINVAL.
> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/qda_drv.c     |   1 +
>  drivers/accel/qda/qda_fastrpc.c | 119 ++++++++++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_fastrpc.h |  34 ++++++++++++
>  drivers/accel/qda/qda_ioctl.c   |  22 ++++++++
>  drivers/accel/qda/qda_ioctl.h   |   1 +
>  include/uapi/drm/qda_accel.h    |  39 ++++++++++++-
>  6 files changed, 215 insertions(+), 1 deletion(-)
> 
> 

-- 
With best wishes
Dmitry

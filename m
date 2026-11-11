Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406009;
	b=BK421OT6KvPI62qKU9iy9Wc2XcJxkTMpGGnau4zKfgibcZdJFP/Lzp1PU/9KKnhdWMOu
	 YyxBsyHvfWPzLBk8KHkNi9845/P8CpzDI0AoKrZAH72PTqgX1DHaNLxYCJxNFetjm0hIn
	 0j/qfuweAXI96ewlJ3zRSorKckfNYxl5LMHbwpNnrifCfD5zmIW5ibgo+64m+sOEzy7r+
	 JAucxIjzftoq3OBroQG6YnTi+Kx99yMXNyEZkQRC9JO8xcT78pSQr8aJ3QgiKwZ4ZvX75
	 Or29mAfdFyBm9Ye0s1DJexGBCmdQkbFRuiqAVb55hK3z0GPNknKkwE5bWrZJaZuVRoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406009;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VNI21V2lgtz8Hzxic3v5KFi0FrkQQXKocGAVFanNboI=;
	b=fTVQkSLwQlGBK3kwNk+s1q4p3WeXdwUnefc16teZYMUG1Gj7gNqwXJTK2CPTJkkpHkU9
	 m3Efnpfyj7wgClPCx6G5P0bTF9w98+iQdpOoweRoaK0HknFpea1ch1pHTnasCYMLkJamT
	 Cykbedxw/pIIc6+jrq9QEeRbAN2iII/lna8OVdWt49lUh6UD9KnavcykreC1TXV98nY5q
	 NWoTQraq4bQlQWL1rjkCLD8FCnYZR1lNpjyjxNbHwZ1+0nkdFavqf1nsmxXEDHYZx86KC
	 fcjaRLk0UUNoV2XWXj8oMwm318WwkB2tuWbQMgP4emvTf8zCCxep4lSfRb+pIF70slQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGfjdUv4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DJRtNHY5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B9F606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18B9F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGfjdUv4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DJRtNHY5
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYwsb2356537
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VNI21V2lgtz8Hzxic3v5KFi0
	FrkQQXKocGAVFanNboI=; b=DGfjdUv4+0wwjmeFWoYwb2ro+r/udE3aAA/oqPIw
	ZKWbQgx2p9MmF/XtqTK8XexmCYHJOR7R/XRdRSTqGcu0HBlrXXXpt3/Nd5VS6/kO
	lso3tYXcgIEoYmwFeRDrpKM+UQlHiFM1zwieAElsE+Vv5Rc4IwnfgZZpxUtudSin
	lBcwKuyvjdygaE4mj4rCSyRdR345eGIajAF21QoB8T4C/Kce8aLTEjUnxDmJWlqz
	WW+3dMRg+8ADOF57x7GKIkKYuspxTxafAMVTkWNATRAyS5cen7N/CbJdz6xOeoKF
	1Uihh/sP0TXwyTHX6d6U899uXiR5q5j8kX/SRUFNbU6uMQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdj49u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:06:48 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-999bc06bfd0so2256743241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406004; x=1795010804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VNI21V2lgtz8Hzxic3v5KFi0FrkQQXKocGAVFanNboI=;
        b=DJRtNHY5AZlen2W9SnLi5XVRPEfyoBIoLPinLwHx3/Qa0n2o7xBf5iH5Myb19Ehj3L
         UzizI91FK3yp8le8kRDTIb7Vc96NeIWe/jWlu26DFs+eoTIIC7HNFxoO5Z35Wn679c+s
         JcSABsgg3rLd1VtS/jTSDhoF51j30f8lUEB0NWgKfoRT4gY/X2s4Sp10yUtw72hggFSG
         jmBW1yYF58lwc0QjUhFX+G6yqvzaWKz6C4vw6It9iSdlFXkiEPMgabAWYLx37jCaHVJZ
         7x1jy8MEipaDUAJy4s5rQRnA0b1rqlJ/6kFwxDJjwyaLIw1HcJfPImfcJhiR/4166Xmx
         7Glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406004; x=1795010804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VNI21V2lgtz8Hzxic3v5KFi0FrkQQXKocGAVFanNboI=;
        b=cFDhjUs9ARq5WM1I90GrFwrh6o83bxI3qI8gyjVfize7bo7+DAEYjIJg77Bg7fQ0tB
         qpXgkSOYfUuDosBxacacUC7ZmcrUhHr1LmQRMM1SmODg1VIZyB2veUUnEXNszIPV1XNI
         lxvUdm//qo+I357k8scpCKKrxo5pAutP/R+khJ0Uljmm3hLYMpz/X0nolbj2BjXBiknc
         6+1nQKjkoFFPCaxYm7pCu3IR4ETBl3qyjC+gFXqIIlBGOWec4DFqAsTuETFYryAt/xgF
         RTXxB0K8D4eRpPTRwBMeEA52QdwRKIqVFv0RpQWIPNTNTY6ohAB6SMQ7lB3tMsOGwfHH
         j98g==
X-Forwarded-Encrypted: i=1; AL+hErE2FOKox8J8sd4JhnbhxXarcvc/f2fDn2soD+ZB571rzxqvpKGPO+A2NCZcgWyMdqHLgEHhdFKT9X6IJCth@vger.kernel.org
X-Gm-Message-State: APuU4Z+U67QcNtP/8X1gTmHHsfGEcKYvBoGBvsH1ibx6cNHchMpRjQCX
	Ze8BvERtLaz1gEbGo65FvEm/huCU8NwKsMJ/VxGQNanq7wEXBBVGC4q9nfiy5dPfoTjSAKtmQgG
	Ou2Oz08OarE920EnkJgRL7+dRBa7xo8QiJ0Jzz0mdR6JDqxSvKQtOOVLIYZRYjRvBcgXl
X-Gm-Gg: AYBFou3ifIgN1MaQLMwnJe3h8qgIYJMPB613gWPlQ5bX3nyN1QxvVhdcFi3S6o7uNYr
	8r0Fb6c30i8mGZO97B/bpw3bTimFJNFt28rvxwoYTUO7WE9uDo2U9wlmotVRRXEV+VhB7xzd7hj
	ITYWngID4f5aRVhLfcsvYvUIR0Cfc7sDej3n715O/MF8hoxRFz+9CxIJ6s8yJSzoQ+x3uZpnyaX
	XNwtTOxtwwnBEfhuYRz3lpUJajJ+UznJL1nMcyHG3P6W9UbVdEUvmLkkf6jFgs439Rguwl5LE7c
	xzN/ZQSWqMBiqnukS3SzWcM9cu6NxUzBWdzx3gw3Mv0NRhJCvceA9Gyknk16qCXPaNzV/ErJ/Es
	5BwvIMrOJq7OCWJ+er+7uEArzqxuVWzzLFga6J+BAFHyju2DUua7aKtGhO1p53b1kqxeR/GC8Ny
	KJ3rs6Q3ERG8flTBNeIW4NO5+LBnMGl9+TtrGMDCZ4iaodsYalUNLet1AqKn9PFg==
X-Received: by 2002:a05:6122:179b:b0:5ea:d10f:2394 with SMTP id 71dfb90a1353d-5ee1c40c764mr813260e0c.10.1794406004307;
        Wed, 11 Nov 2026 06:06:44 -0800 (PST)
X-Received: by 2002:a05:6122:179b:b0:5ea:d10f:2394 with SMTP id 71dfb90a1353d-5ee1c40c764mr813200e0c.10.1794406003823;
        Wed, 11 Nov 2026 06:06:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c159702ae0sm815407e87.20.2026.11.11.06.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:06:42 -0800 (PST)
Date: Wed, 11 Nov 2026 16:06:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: naidu nama <naidu.nama@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, irlied@gmail.com, simona@ffwll.ch,
        Saurabh Anand <saurabh.anand@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com, quic_vproddut@quicinc.com,
        quic_mkuntuma@quicinc.com, mahadevan.p@oss.qualcomm.com
Subject: Re: [PATCH v2 2/3] drm/msm/dp: Remove redundant force_link_train flag
Message-ID: <gfzdwaeouexratptiktpzodi44x6ztsfttqajzr5wxtrluyqjx@axwlv5jlakcc>
References: <20261111104434.2222182-1-naidu.nama@oss.qualcomm.com>
 <20261111104434.2222182-3-naidu.nama@oss.qualcomm.com>
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
In-Reply-To: <20261111104434.2222182-3-naidu.nama@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af47678 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=uVK0n7524QBmBBgzDoUA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: ypb9cNdafXUEvsM5NbobH8CDegZHuj-V
X-Proofpoint-GUID: ypb9cNdafXUEvsM5NbobH8CDegZHuj-V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfXz01qT7h1Nbn+
 S/OoDxYnJWAkwM8Lxs53o459E1bYzQF6fuyUL4djreJbtJiSeerLyTOnD6YlQtKIQPv715I+Chj
 uf7x0WtfRrgf4nEddguYYnItv8RHxBeWdQgaP+hNkXwn69TI6nYRWDDS83vVPjqMCMqPsqqIpW5
 crKDCMY3F5mcVtFtHBeyTYdOedjnH9D9YR0YJKYDu+z6NZ6uTBsEoWbmNzcdIE/Ek4h9r467dzg
 IxkW5/tA2R/uHYp2SD8DNLrFQmdelKSUXd7zwPqQB6IbQDbpsHO1XYr9vPEFr0UcApcvnGZZvCI
 vuk26/VFWt7Vonsa5M5UBavXspDaZjBG/fHHi9LiRGlIecprja1xQebccSW7P+EpzXTGin99F0Y
 CWmB9m5P4uQrD271dhnh2hLuBYkFNZqrvNY8go3IHB9mo42Kmox+k6gbhRv5tQTgJHCY3pLf6tl
 Rwo6bT5zWLSMTEm0vbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX3woX2WXaoTIR
 ysG5wtVuVDhi0GlFOcEbzdLB601iWZkkQKbSEysZOYovqS2qcKHT5SqmNT/Z2IRyEa/fXNcym/o
 zMRrKjyHFRy70R2vGP2YqneNwbk5jrU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On Wed, Nov 11, 2026 at 04:13:54PM +0530, naidu nama wrote:
> From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> 
> force_link_train is always false when passed to
> msm_dp_ctrl_prepare_stream_on(): the initial link is trained by
> msm_dp_ctrl_on_link(), and the flag is cleared before stream preparation.
> For active streams, it is never set.
> 
> Remove the dead flag and parameter. Stream preparation still retrains
> when channel equalization is incomplete.
> 
> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 5 ++---
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    | 3 +--
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 +---
>  3 files changed, 4 insertions(+), 8 deletions(-)

The same SoB comment.

-- 
With best wishes
Dmitry

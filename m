Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411775;
	b=gs4ArjLt1AROVgM05NxkB36IogLBIWdU2Y8mex5qAqvMeuJZCeqo9Ri4g+mRBz1hs6Hk
	 MSRpF5T3Jf/y2vErS0NqauX0k1TAQZmek+Odgrrm2J+wAst9RrU7vFulsNLNA8XgLOZhc
	 kjnI4Xw+8NS1xpUg5IMC+NGTl6fdFVyFFQ9VNNYkTQpSFZsofGGB0BMTzvNg9raIamxO1
	 j2s0TIfAxTjMoRFwpgkU9Yvhionlntz3JZZI1oEJia8nakO3IcmT8MSoL/p4hxvmobxbj
	 1bRx87mKA3oAIPEUQOeWrQWPHjOxIOw8Ip4dLyK6FfHtEZ60UGi3spjua+INqCmC5tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411775;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ka81IfeeRWUOIRXxY/Mzm37rR2+cA3vNQJzHgs09LJg=;
	b=pCaBz5gIAmww5AwoijNl07ZBtG9ZJ2TMmFVOSP+M11XGKovfjawsHjRrmmEX7iaE4gTe
	 cw5Iobke+W7YZY/IQhfVfq6jANm0hai2kmYIAgHcvD0MZeK9mzl0/MmuigSkRPQNekOKx
	 0bjPQHO5nl4SDacDYCRG5KxKhEAzRnLkWZwM3NVVyuZup3WU6MwF0i4+7br+UXs24Gilt
	 0g0/mWaAlDkSZupX1rBmlaQ2UciLAJ305POFII3Kzcdb/nuV7v5RUF7SU8HsLur9sFD3F
	 5JCE2ytXVyOX0CJ2HcxdbjAMC3KvhEae+B9iaFrpW/khqXVzXJoh3Ix7L8gTfH+B5tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fhsA4Yuf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=azO4+3Oi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CB0606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09CB0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fhsA4Yuf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=azO4+3Oi
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0HnB2651051
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ka81IfeeRWUOIRXxY/Mzm37r
	R2+cA3vNQJzHgs09LJg=; b=fhsA4YufaIN+kkNmUeaJjEhXD+Ay2S74Gbn9zVTK
	CL+52LVeQ/1bp/2LFslDYc+04X2tLRxzv07I4P+zXc+39zxf57p5lzyev2ZIhlix
	+/6Mn/DfKG+mBN+cyE5YrV47TWwkbC/xXIOTESGtKSFElRM/Xv7Dbh+MjqQYMjX8
	ND2dQtH85W0vrQlyMkLCLnI9cTpeeoX3TCN2Mi+LfMHL9L3soCWXGC+W9gxjWgID
	PSP7heUFaGzTm/0qUlmXBt4iVwnj3ecINoeUwWKPNGJUvI2QzqaJypFL9a2SQ02i
	lbsDrcA80QUgYI6tkocFBjX5InTBX5JFLkN2bVX5YMhRPA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmbf1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:42:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f568dee56so500875085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411773; x=1795016573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ka81IfeeRWUOIRXxY/Mzm37rR2+cA3vNQJzHgs09LJg=;
        b=azO4+3Oi+qzzKQq+Iv5hBjtQ/I0pnmiZW+zT015e6y+NdhnN+UElV6UFsWMqmNPq3V
         VGmA655dAEND2JS3s/ZvoZUwNeFgIX3ymE8XqngCLhQqDN0p31jvdopxGxUyVODnq/YF
         gw3WqSiU/w136N/PSha7uLDQSHvAIE5UAHZb4LyIx/ovYtenKN7vcBP3vuMvYQK/geXy
         bd8AHH8jkwHd3JFd5nLjF0RAusGSSj1h5Sz6IKqdR+yotU0Gqt7emgmavxY63Rg921OW
         1pWQEtfKzSdapRRbuO8b98PdS1VcoeR+dUlPeJg4WybwAzvnytVe+EE4jZz7BXi8llUV
         1ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411773; x=1795016573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ka81IfeeRWUOIRXxY/Mzm37rR2+cA3vNQJzHgs09LJg=;
        b=FOF3KMX90tjshu1+DPw0Z4VgPMCXb2wGIBKZaMLt1aC9/VAHOfQvuLu8MOT0Eh8JOl
         pmZuUo1CKLbZfFttsjdIy87qtkeknSoXCiGSUr7WlUVdwN9kMhnuRuLWnXqcHhsyYFlP
         cLj8bB5O8YyCPxl/VtQWYD79hnSsR6Z2coh7Y77GvQwDRZDuuYat6eaWJTSKaVGcMOax
         kTrPXXXlJr2ErokJndvQ76uVTamSH1Zno3fdzQs9VzK/eGdNxnzJ1GdntrqO4ny0WiVJ
         SgiYABtt48Mz/dk1w/4MhufNQZAPfPl5hKFgdIJLtJXHftZYIM7Be4oZdWOF1lGS3clX
         R0HQ==
X-Forwarded-Encrypted: i=1; AL+hErHni6tGXh4rQvbHG5dbQ6mTJh/P50GpgsqEkcbul6x2tO23MWfIxcOS/eFQxt2AfAN5xUL8AhbCM7k9slm5@vger.kernel.org
X-Gm-Message-State: APuU4Z9HKpPQMi0TnfQtjbC/yPfBuGyTmLo6AfBdHdpf/mWQwz0EGeiC
	PVUN5s9IHytsjp0OyKjqvOI4T+WT6y1uCfnfgyNTyHKRF1YMpCIzRBJlCatZRzWMT7U5qHBJBrO
	DGa1HZ2X/NDSvddLgcP9XUwqNnOH6Yf2UCGfklwE1vI5gZy6lcj6d53GBr0VV/YryjmUe
X-Gm-Gg: AYBFou3FFETh2oRsawrUja8UYxEg8zs3T+AUFGRVf82o2jGd9yBrjhCLUTY9jfL7WXR
	fMGsxSIEydOrte0CBgV+TRaDVSuN6rJEqFPdoy0ir7DJYHuVPJwh0hJsypJlGi0gPFcSeXqi1ee
	ceHJJ4kMKlacsKapo2FVZcvxZIAPK1IBGkqcnqvXkGMfl10NHmsokZPyxcJiAaAYgnYQGkg+muK
	dGqSUge6eNPjh5PKfV+iTkCPc2uECyUF9Y++6nd9hN1K+OTflWCUNbxW8XjgUqmcYEo6jZfKeGE
	KopDjCqZk3X/AdxCgAqxu0OIHgcKr8rHNICJeu/BuZG6RVZSaprysYqDZZT5y5GXKdP0ofmVau2
	57N3+TtwXMH66eKJcBLWqs3QjNdoizumWzHRwWkNUW/lZRvWRLxt8n6M7hHjnNQrNUrPYShRUuu
	0ju57eodpWge1ijqrdTYrvHUGiK5g3iDvA7aDE7UTq3pBrwE1M9QyX7Nwk1UqWzA==
X-Received: by 2002:a05:620a:1b85:b0:937:6c0a:9b65 with SMTP id af79cd13be357-947afcd6309mr364200185a.7.1794411773285;
        Wed, 11 Nov 2026 07:42:53 -0800 (PST)
X-Received: by 2002:a05:620a:1b85:b0:937:6c0a:9b65 with SMTP id af79cd13be357-947afcd6309mr364193585a.7.1794411772617;
        Wed, 11 Nov 2026 07:42:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157ba565esm984546e87.19.2026.11.11.07.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:42:51 -0800 (PST)
Date: Wed, 11 Nov 2026 17:42:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
Message-ID: <xih7e6366voj2awmlhdkmhtyn7qrcwsv4ejp7kz6vvszcxdrlt@fyn6e2wnwlkv>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
 <20261109-msm_gdsc2-v5-3-4a3159b5e4b8@oss.qualcomm.com>
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
In-Reply-To: <20261109-msm_gdsc2-v5-3-4a3159b5e4b8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: IBTo-lm65WK44LGR4e7o0cnxtdqvg_vh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX3PULz/r3Cv4U
 F+pbbmpfdFIq5iNdru6tD2vyjP4WePCPD6ydbHDMdySw0C+UpVxlJP/Or6pBPqYcFUOWS3cC/2c
 NJW5I/dYvwja4+NnFEw163qlrUBMF6Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX1ry4R34HZr/a
 k+UhcrN2ags5aka/rtusaEJZp7U3I3kN6dG2iLwwxRVlntffWT4/+gINAELoxemDQlehZ0QEiRf
 CXyk65xB/+Kb14WCZBl05fgqIgIfLxBJ9eNl/jJBEHzgqy9LggOk8xYXQ7IkQLqZIGRQeRJFaOz
 QzDCMVB9AHGFUqo7SvbVznyGZpFPvTTkdjXs6EVHAr0BV9IameFC0allzCHLa2tBK/z3uYF6ggK
 /Q6HgWZhAn0rBEGVKyUimtx/oK6MNFKwbfBKdDx14JgJAVAUjwO5GXi1P3f3hJkSQaG2jpItOBt
 Gy8eKFCbV6VtZI9joSt0E4ogy5Tp4lURM2cFXU8qVSv2rKfb6zIy10CNFQneeGHTZxwcG/YTho7
 xUx8yvGK1MjAPuq6y09L/7VrZN4/knCBWDMExVBQ3W2u4xW+g7ogY8WYhqIgVWlo0zvLRAuoZK7
 zOp9VkE9CTgnpfEnVyQ==
X-Proofpoint-GUID: IBTo-lm65WK44LGR4e7o0cnxtdqvg_vh
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af48cfd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=lIS-3JFwHiDYKImdvy0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Mon, Nov 09, 2026 at 04:36:37PM +0800, Yongxing Mou wrote:
> The INT2 GDSC on Kaanapali (SM8850) powers the VIG2, VIG3 and DMA5
> source pipes. Without enabling it, these pipes remain inaccessible.
> 
> The DPU is supplied by both CORE and INT2, so describe both GDSCs as
> its power domains rather than attaching the DPU directly to their
> parent MMCX domain.
> 
> Keep CORE attached to the parent MDSS device because it also supplies
> shared MDSS hardware outside the DPU.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Joonhoe Kim <26rote@gmail.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

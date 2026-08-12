Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF57D4570F9
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544942; cv=none; b=f1ecp4iCsB14mkfOxh+iItCHsqxzoTLiFjErORKls19lOznosVWjSVKeowvrTDYAnnB3XGEvcJQXzmKsdeXDGEwTC+wArdoWmq2CGPxkeqrbjDYyMxMicOrzvbYJCIC5Glrre+nO5re3cSXbSUaZ76s3tdUohRf+aoppRUV+myw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544942; c=relaxed/simple;
	bh=CcSkNXWORCp43UbyAGGH4gUSwAWZqTXZjks06PCoJK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSsL5JpbFIhqe+Jln8Gg3ZzxFlbBdJwj3paKHZGVxGhl5SHCRzPRogBniqShtKGvZhjAr/WGXfnXlzZnme2NyORo5Kbl1f7h1nbH6F4dNDfWAtQnlT7K4ms1QOrtLlOr1FfYniXNFM8G8f0hAxmKkXvW/iBPYzDnglc0sItdJCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHmaryBQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ejim72iP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHmaryBQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ejim72iP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbSL0899510
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 14:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rRTRNjqnMuQmJhIBf/iDfReXyCTGBmAaSP7mRWJ3Hb0=; b=oHmaryBQeIzxliC/
	6lwV34HNXaETyWDqwvcSZbxwQC4GEPtqZqdmaNqv1wvs5vzzbRRaWokO21Wo5TXU
	XZNtWpeGD+CmDSZBVUPfSEKmIyvFrmsbQAORZdmZr7iYKhvaTG3BjbHZye+Wa4rj
	8YrPByIsDFPx3U2a+QzmMNUDEHE/GW/HS7qDyGiTy4uuotgnMrvjXUFlRKmgzdxR
	9CYdvT0wP7MAqMwQUHe3mwANF7FH80d4xWGzhwx2TV1/m6Da3E9GpKzwet6SGW0j
	xH77C+4rNCQpXDx0PmTTqQ17VTjCAgUgPIM4ecREDSZGLvT2nInW59/KmwvgGGxe
	NdciMQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nut993t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 14:28:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-907c59bd73bso17299166d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786544935; x=1787149735; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRTRNjqnMuQmJhIBf/iDfReXyCTGBmAaSP7mRWJ3Hb0=;
        b=ejim72iPgEGFgVTmo+memPUnNvxkcZA/JHJUwdR1IJLxW77Kp9/R0+tepRDx/5yxt/
         WBw8pfebTufIb5iWWWX58bkrYj73kiDYksMVaHPx+EWPW1mPE0QzOnZXeDTvFqRS/5nn
         A+8KKGGQgvOwYeWk3Az6L2sQd5FfQfR6p5y4pFPKDWm0aACJJIq/NMZ1JkBnji04825C
         rttfFGeOKyeRur2ASbz1Ocjm8qCOpPSwJivAAjAy6SrgAu5uvTd9w6I/KX4AKChC46Cc
         oY8pE1y5vR9qC6bwCpq2OhiG6w0nUpx9kFMyIwuqsvwjryM5VXdWv8KuiadY5kM2RV1c
         AYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544935; x=1787149735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rRTRNjqnMuQmJhIBf/iDfReXyCTGBmAaSP7mRWJ3Hb0=;
        b=dr0hjSNCNtt7vDrpBKPP3aDgbPzahoyyUAyPIFJC8+E6pOOB/TG+kLQHYcvWi5xbwm
         PptTZixCtJA2UryOpnussLYIhr0umE4oYUee+OVccvXMRHKX7VqtazQ1klQt0c1Pv8cQ
         I/kmtwY2mEo/JXiznBZltksWWuInyBPiZxUxOjBZ87v6q9B7hYgvX0zf8/zBLSaU4e5Y
         DGb2f5s8x9+LlhAXoHK1rSsoR0G3vvFD6rSCF2IWtZmYNRkeHBQUC+PfbMrhGbUweP3I
         Jk9RT6P9KJs4aJBXA3jEE03aDfRXh8VKla6OJOGw5IWnIJ6BBzweLcs8Owg50ftRY6/f
         w9tg==
X-Forwarded-Encrypted: i=1; AHgh+Rqf9Qrv69ea6TZG+SvC+KH5Tkpxi51GGqV5PPstSq67eGzZwjz4cSvyK0VPQgHHX6dnjTMpoDf1Xwg5SdIz@vger.kernel.org
X-Gm-Message-State: AOJu0YztHcoMmc6HmpvH8LPrNh1M7O5fbww6mcwYCqSFkxE6/+3lc3/R
	7ReLIzPLT3plvg6YkusyFcK6vXsKiscvrbGWrwU1VBW1sPBYl/QE21BvdTZSGj15pOYX1boTqNv
	9Ek/dm/PWR7hzaP2k/8/xfY8n38/N8zU5bktifwC4KtNrvu/qIJ3AoT3WZK3e5cloLJMk
X-Gm-Gg: AR+sD12O3PaQUVwBed+DyvdYgv4pkTS9LKKfuqoiaC0XPmOLDM+lAD8pRFLEvdJYO0a
	C/9S8TNhpLRSuUT7Eukm+yeAWql9FhWTCDKrJDTWe5SB3Bw8mk3ZV44U2iBhHLzvGtsO0663B7q
	cYO9WQSz2ROvsuGyTMHLU8jHqsSE0MwRAAkNp1BSgmpp3cQ8u9/4bng+6WlVe0LYwVUj9bfPxd3
	VeI/Ai9vygduaPcx5PNEYIwjyQEEHYj/Y17JyT8uv0SnWPgMrLb8HNHndCCv1++QkMoCmPYd4OL
	eSC0VlhXlPyaxiN65j2poogAe4Vh7beXHH5zCkyEUcqMXbgV/q7y2OCOx4g9z/nF7Sq6QY4mk+r
	Sdd7K2Iiv6BfYjr2D0jrQrDYkIY4QRSoZnWqsPb9drj1/cTR0kRPCbZI/eXJudErEYp0g7J9k/l
	ZIUj0GRdg5N2Ss
X-Received: by 2002:a05:622a:4d8e:b0:51c:257c:8166 with SMTP id d75a77b69052e-52d6482e3d6mr47449721cf.33.1786544934507;
        Wed, 12 Aug 2026 07:28:54 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8e:b0:51c:257c:8166 with SMTP id d75a77b69052e-52d6482e3d6mr47448981cf.33.1786544933971;
        Wed, 12 Aug 2026 07:28:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a107d20977sm5067671fa.15.2026.08.12.07.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:28:52 -0700 (PDT)
Date: Wed, 12 Aug 2026 17:28:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH v9 2/5] phy: qualcomm: hdmi-28lpm: provide dynamic
 configuration
Message-ID: <w6mq6a63mjzhjirvvgetcdptutkq3upa5v5kmdcezjke6rhkm3@lctdutlbnbud>
References: <20260513-fd-hdmi-phy-v9-0-ca98c72f1f9f@oss.qualcomm.com>
 <20260513-fd-hdmi-phy-v9-2-ca98c72f1f9f@oss.qualcomm.com>
 <qxuzipnza3tzoig7xp3653vcqwgubf6zerzbgdmx5h6acof7zm@quy7xzjml7kn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qxuzipnza3tzoig7xp3653vcqwgubf6zerzbgdmx5h6acof7zm@quy7xzjml7kn>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDExOCBTYWx0ZWRfXzjTEmkJmghCH
 VlHErIgyTwXzJ6zcHjqu2C68+nbq2NTQ60CJuCB5tKYhMVMBgVCuNkZl+od8i6ULYZD6vufRJ/c
 jhslzCb3kfJdboveyYaXjvOpP9OA4Ec=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDExOCBTYWx0ZWRfXxbvKG1VrXvIf
 O04ReQyuxJj825NA0MNHfSFJem+8xJTBIsDsBRhkCK+tIhUuV3khW/B0vTWyschayX4XdfquZ3L
 3wY0eFyvz0vNXEEoSgL1kOgsYaCQuBp8oU6ZwcDqWzqsABbIZCGsCOWdqdi8DdBr+1KFfXFMTIp
 qYEILmU7R5s0b1xRJJ/0daxmGi03U/J0H9pahkgW/VWSUnNL5Oa8s1BJk9RPqgL7dNUUK1qdiPw
 Oc3gSIKSCZLxHLbgX65FvubgT0jpYYkNGaIormNH7wc51QVhtpCw1gVHZnd9L0IEj10OyfQPdbV
 Nwie+8fcqcZRFYVLYrGO83VKIvGA/1XKGmjj9rTSQgvSjAPCCxdxwQOHwFa7pGqwERcu0X0UCtb
 Raglsr6btAaYarE5PFeBu9pkNUvXx4tHYTyrjQce7IWsbtBQ2m30fOp55bcG2QD5dikpSqWD5tf
 e7YhoiL59KJo6TCZJ/w==
X-Proofpoint-ORIG-GUID: q6GyHpIWXpkAa_0rVRNsDSIBlpBPtnxU
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a7c8327 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=eL-OflJxe-d9IbCPJmsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: q6GyHpIWXpkAa_0rVRNsDSIBlpBPtnxU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120118

On Wed, Aug 12, 2026 at 03:51:16PM +0200, Manivannan Sadhasivam wrote:
> On Wed, May 13, 2026 at 09:14:05PM +0300, Dmitry Baryshkov wrote:
> > Replace fixed value configuration tables with the values calculated at
> > the runtime. In some cases the values might differ from the original
> > values. Those were validated on the IFC6410 board.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> One nit below. With that fixed,
> 
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> > ---
> >  drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c | 325 +++++++++--------------------
> >  1 file changed, 104 insertions(+), 221 deletions(-)
> > 
> > -static const struct pll_rate *qcom_hdmi_8960_pll_find_rate(unsigned long rate)
> > +static inline void write16(u16 val, void __iomem *reg)
> 
> No 'inline' keyword in .c files please.

Why?

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
With best wishes
Dmitry

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD444407CCF
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784659374; cv=none; b=bwPiyFmPdJ2Ja19hZytMF6hGgx/FrwPxrXWDF3tWty9ReFtEOowAzVfA07QoNE54CGlsw5Nh4eW0HE12e80EiMTixsf2PpW+w3yRWyJXO37MlAXS1rCvcrk+dvcXgo6k2aBPj4ii7XbXXUZ4miHgn5TJ01JnLTr3TyNRMM7yODY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784659374; c=relaxed/simple;
	bh=fjpw1sQqgStHrAS/eDLS75HKyQR/DUoBY8tiQEuG5uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDfRnzIybP+ixyLMTv+7KbmINCFtHqh5Sfrr6OBr56gZ+GRxqhQ2sbl82t4Q9FCGgPqGXq4tzs+JWSdxqusQ6oeqgg+b3ICeKxhNYkCsr1XL9kKMFwYjzDT0VwbvAUau8e74HKjaAEa/guFxHwfHdGS1f1Cu1NN0gKlkwj5TZ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opjV8clX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b7dKHPOJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="opjV8clX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b7dKHPOJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2hX92418325
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XxgIPt4uIKTpJH4ljRKs75ea
	ji3gER7/Fq9oXA0nBdo=; b=opjV8clXLOL0QZpRZ+/bFbjrIAApYEvrzR7E6Xe2
	ixLtkAIGosyJkCJDa+pbdqIFMVHOoauJtd2j/ygxL2vvAn0oP4oKMRiQXGVduTDm
	FcPA7GGBLELmQnS+MeHYcNW0Dr1HgwpKSyeh6sEnFPmk3NpB8SQkkHss+vf+CR6C
	YXRQ8WyWgGgypPe78CvuCtCqTLOB5fZrWXj7iHpCkZMDE1r4NKPq3xJNdp2ExRF9
	lzFBbRUqg40SNeCC+XIc8yMOyzpcDy3CXHK0bNwx1HzOSX/3hCU7LvIrUnBPYTMc
	cRNjMQBV/Euz5oSEBNhn+lNmmvOoZdFm5v+DlJVpIjIPCA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs9nc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:42:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8c689b5fso229078341cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784659371; x=1785264171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XxgIPt4uIKTpJH4ljRKs75eaji3gER7/Fq9oXA0nBdo=;
        b=b7dKHPOJ1JuhVOdj6EFw86qjPi3g9kGOY1JUnBBETeyCCUmj11rqiClCy8sajBSitE
         aWGx7AClvZjyG2x750ZiI49tcYT8HCgVnwnqN61f7PmyjHbtEIcHsapUrJY6gzDmueT0
         lZvK33KpWH+UVN5aqHz99PgY1/WK1bPqWoRa3T6/1C4ldw6JO19EzWTLnrtjEYwmiMCf
         4avo2IiajqNhPu2LTW6UuDUrzFZSNoap4COn2lLM/PbeeALN93A3HeeXsq5hCKWnPber
         E0oXA+VwydUGdCw4Hl15/pGCXxVr55CORyoYGUZ/qleQBYutgygpTz+4tGQfOYgvOs82
         Je3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784659371; x=1785264171;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxgIPt4uIKTpJH4ljRKs75eaji3gER7/Fq9oXA0nBdo=;
        b=e5uRCWUL06PV1BZOgBxsBAAIQOwkgDevrhdryqjTLBIOr0eB+j87+UoE2XHcHZBp/k
         agYailPROcl9bH/aBmUu3KRFJlbJh7yfiSor7XJhIbLUa4Hg7/wMdGf2sAdoYPwdWLva
         UucNUX0v4xZapwERBMz4Q/6bVqKV4ocxLgcXI/QO0ruCwwnD+/Hbc+vASPxdWDXLYqX7
         5JVf0N4TCwKCOwyIhkNpxNHnf2Rt3r92EQ4jwL6PqMR6wMlsLqUFBZ7pSifwofY2UBkh
         y3tuMVC+g0iqWHgEbTmt1gwsVOkyXG4xXuonRkSSAAJxzl8smQ9Uh0UCc2rRjQ6Nu070
         5E3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpkQ2w7zkulIpNlSakFqF2sFp5q6NMaOcVTam1pGSBu14EakLUndB3sI4JXk0AAwDT0bFv0HOCTPi221/8l@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs1IEA0PR7kyu8tP8eLSVxUZBKTX7zI1fAAXLugl9RsWeo3N0N
	IBZhFF5nX6ksfS2xSViZH+HlTu0nHJENgYwFW775dQ+X93ZzBqyYoSUrl7GRPYx9MevVRT9k7jA
	QUtaQKrBlzJPa+WzuxgZMhAVP9us+QBlP7Q9lzm5LbK7AbzQtV67xMkxE5C/cTTr7NwIY
X-Gm-Gg: AfdE7cnEc8yUrUEdMueJG/DoxUB+5kCajrkRdQSGvmnu/9iJZJTTQAq9v1gyhesMkl5
	39ifUzQ9kaZJj0U6gl7yHnSWABV5I+pHX7NphSJMb9iigs5PNfOX4Kgzbg2mmmRE6vOs/eF3mlV
	FLGhXo/YZNy7fCJmnkLFpEgBn4fUFGvWHay5eMQIF5Wqd6aCA/WEgiIyPG80lkln7bizX9DsagS
	BINApsmjTW/d0CLALkROpN+j6ZS1+PEtfrGzwexRZ1xE3Wo59GQoAzgEwv4DP2sbnwSAnOmV7qh
	5+IDucaX/aYB7VdKtz4DBQjhRhhfr/QaatM4i1w49H1yebECwkxocjyGvs9l6h86jEuhO2k5mRi
	FLpShBNzvq2kR9SjXRMW8z/ZhQT8+71yIDg9LmgYv4zArIAsa367Rm7e5P3FAjubrCOjj5udIAk
	w3AH5TdpuIPtgmpg==
X-Received: by 2002:ac8:5e4e:0:b0:51c:1a17:eb92 with SMTP id d75a77b69052e-5213e886198mr177989211cf.63.1784659369314;
        Tue, 21 Jul 2026 11:42:49 -0700 (PDT)
X-Received: by 2002:ac8:5e4e:0:b0:51c:1a17:eb92 with SMTP id d75a77b69052e-5213e886198mr177988851cf.63.1784659368825;
        Tue, 21 Jul 2026 11:42:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9ba342esm71324e87.27.2026.07.21.11.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:42:46 -0700 (PDT)
Date: Tue, 21 Jul 2026 21:42:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v8 00/15] drm/msm/dp: Prerequisite cleanup for upcoming
 MST support
Message-ID: <holysetuq67usmwr2ueyqhh4rim373g3kmxdpaatymhqu24c2o@addzr5eufp2i>
References: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 41M34y3dz2L2Iz3zuq5niEWzXy9S2dCv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NiBTYWx0ZWRfX2JRrz5I3lgOc
 0wPlvm5wfiz+m9WJYlJqkznid0bANIexQnevDCgcUsuOpexdJs30JQf4IrvcoOa2W0BKpf/POom
 ykI6C0uXMoi2UkHxaycEW19kEmmhFNwiYVY1Rh3kxsDdyYHaGhqq4deQlXWz4dGysodNzEaIEnk
 3hYTiNZmhWw6DpQ6tI1YVgbbQzldXqOXrJQkFMZmiXSvMAc3AAl9driPSKVWk0GIzZPsLWqAGE3
 4lef7qMXJ0f8fNsW4w3tznoEQ8kKqjednkrKOn7qXlfdnas/d8S7tn6OgwOS344KB9K//OaSsP4
 tcw04wdAJsoVKhARQRZM7hIwJ1b4iM2yEUqmvL/pc/u+yKXs2LIOlEaQbC+3f9LSaGcpOOzoKzS
 EUvYhXwc8U2jm6moejUJvqrNWNwmxyLMNSINzA+/cOwshZPzEi2NaOyot/Yc4FVwb3VHsjcWVHv
 3iNbMPpOGjPDSHSGYhQ==
X-Proofpoint-GUID: 41M34y3dz2L2Iz3zuq5niEWzXy9S2dCv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NiBTYWx0ZWRfXwE1YvF8kGRB1
 MgcoPiUwKHyePEeR3YvE2wyzY/A+aCUQTca34gzcAoKFCuEGBovsgTA5CSHFCkqgbZH8o64r+PM
 IulLZfzwQj1LVWUIuuZp93zwYWUVz4k=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5fbdac cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M23Z6b5qFLN2yysIzvQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210196

On Mon, Jul 20, 2026 at 02:08:07PM +0800, Yongxing Mou wrote:
> This series is the SST-only prerequisite portion of the MSM DP MST
> work. It refactors the existing DP code paths so that MST can
> plug in cleanly in a follow-up series, without bundling the cleanup
> with MST functionality in the same submission.
> 
> SST behaviour is preserved end-to-end; no new functionality is added
> here. The intent is to land these refactors first to keep the
> follow-up MST series focused, smaller, and easier to review.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
> Changes in v8:
> - Rebase to next-20260717.
> - Fix comments from sashiko-bot.

Which comments? In future please describe your changes. (and please
update this entry if this gets reposted for any other reason).

> - Link to v7: https://lore.kernel.org/r/20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com
> 

-- 
With best wishes
Dmitry

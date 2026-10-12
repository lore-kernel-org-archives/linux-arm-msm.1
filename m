Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EA648B368
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808246; cv=none; b=iqoIKDrx/yXXJeBa7Ams4azWmxRkV38f70QMzgemJVC2hI7hhNRZmPntVeVu/ItaTeaOffOonbQfUTNnYnYiNiJwkp/UqwsnAzgPrdovUzdO3sJGme2i5WCQdgFKuFXj+QMmr4/JldAqcJQMBMye04T7WHN53KHNasyYWNRzCXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808246; c=relaxed/simple;
	bh=v7inc+BvlhYaHiXBPenT0ZSdp0LR04zp97vmXDriLIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PU2EoZ8nwbHmzFHfX7V5xJo/byNL4LbNw748kWpZ9HZkU+X//ZQgKMdTAKvpaYSl+6NnfNsG2qQxtmwxft/3fgsodF8+C8LbRW9BjL4uhx/5L1uRCYshtwEe3A2SnK2pBqLraEAjqgnrhkV7VNsiRr81ur8LcTqPa9VEuJfQlOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFrGlgPT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LAUv+l82; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFrGlgPT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LAUv+l82"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0DXv1686432
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e0yYPVIKMmnK9rTXk1h7BEsH
	GLRAY3pbRSFJzuzDlBQ=; b=GFrGlgPTPBFwYT3nhbJPmE3dcVIoCq37LB36kKb9
	8zWXD9iu+3iL+xBAPAOwncIHJScQX0RwOubckj3WlTA3XoHcvSvhZGi31k25oxp9
	EthtTvq38SgJROc84nYFblFiA1db+uNiEZe7fOfmstqSz3bbQq6+L48sE9WragHn
	P75oHsE2vgNiLS9+ZvX/HWSPZ+MwoM2VpvZnuSdVIa7pfMCNUcOjlr9PE5jys/tN
	VXwr9BXgNinf5DG4so5PPzI1L7fOURdgO3icrAZRtIj0rtFFc4TFqrYBkxAP9Yx7
	FGpkQ+X2hkH34sv2i12UOGAiM7tzG+rQjemhUD+TKDU5Ag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc0r61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:30:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf6c528aso329445085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791808244; x=1792413044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e0yYPVIKMmnK9rTXk1h7BEsHGLRAY3pbRSFJzuzDlBQ=;
        b=LAUv+l82Mi8yHS8f3z9azcCXIDU20yHADC0I1vsZ9RhulwHPmo+diWdppil7Cl82qI
         p/z8toSnrYWZExzKS6cY2/b3lttY2iCRi7HXnADA47gFgQfyzVBm7AHdS/xD1XlvWFq2
         de4y1bHpQu0kHum7HeUoeczKWaeiLZaG3QJGFqxfbRgYfIHPPQz4Z/yOXFS1a34Qs0BY
         V+qUdHmdzmhlDo9zJg3ZzbYYZOEbr29zfIM5Zy7q/hkX5ir6qjQAD7DKJKchzuQETFIM
         5rVBT21NFTuqOe0dyDEHEfLBcBHTSfVK3+seC34j7njw1m2rBWMNafBcCKj8pdNmWUNc
         habQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808244; x=1792413044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e0yYPVIKMmnK9rTXk1h7BEsHGLRAY3pbRSFJzuzDlBQ=;
        b=qyfp4zho1tBTLAGx6sPirM5OlOAUV75X3CFU5xupbwh95zJTFwOpGDwQlP3MVZmkLV
         EDyFUK/mUedacFYe1y77bF/hxElJA0uHatjv6Gdd8yrnR/3gKX4gqWbvv7wBKc8dmWHV
         /9w3jeikUsBoazMsKKuxFw0rNUalj+f9YTzD+wnnuA+9MH4tDxh/0cowafT+yazJw3B5
         PyCJJ5nAJ7SUY6adm/CVrft85xrQmJpO2NES54Y+2mA7VUty74r4uvdPzGynrzDPM73m
         qL3UVyd4QiIOGVhaM1csdCe1XDXg//5NDCuxH0MAb81+CdbbwK23bzH2BSi0qDZfsExB
         ZXrA==
X-Forwarded-Encrypted: i=1; AKwUvBx4KJFp9MURRqrmWIKpK1VKJVG/hwBx0GjMcf64hLXt0Ap+pgfsEn75IxBvD/wcDUJkbvQeWvAVcifcGoCm@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3rg6qiC3w07f1kEDXX5HGYJbRlAr+56US2pyGigd/bhWGoCYY
	jBDX//Bisag5imn8Fb6Gk9ukIIFOUZIWDAlg8rXwTZBSASI7Tza1mewlDcWNpx0KCMpHvp0YB+u
	oW2SCQGqajpbwBzCfT1dAssDUtuUAmXzZXG01khyuWAbHWAivVg9HTNZ3XZJjt0lke0NV
X-Gm-Gg: AYBFou2RLjVFG8bjvSS7lcVbGxckyWummu31iaPE09R1syBcJxAd4/7lrKnyPTg5ESM
	zTfJYkQBv7A6+YaFVd9I/b26jUaxb2vhub56FOFSMQDVJgIfpq3sRy4MAOOrKBXMnlirGbd7IEk
	vxp0snDThmmhK8u/d0iVeBatbiHSmWpp5gB+UGQ5I2OZLhpOMp5O/1RvfXJfhl8cn3+rYa9dxOf
	LyGJlkygCsQu3LSQ2SzxGReaT7879dfeBgIRJ9IGnFF3Fq39/Swtap34vdXTI9nfz/YXYd2UvIR
	BRguRsTAl2dMMQw1nyfCWf8dLbLw6/TctwrgAidhUQ7i1pAw/oZuK80PK4eWgAxLuPxQhBJFlHT
	1wrNbhl9MRL6sR/jnP0BGuvXFAn/bAnXYGYnoG+es5aFquPmi7aPFm8vM1DfjRAK//jf56pqpBS
	0E2kpgOuksVtAn
X-Received: by 2002:a05:620a:890d:b0:93e:9627:533c with SMTP id af79cd13be357-93ebd265157mr1462918485a.50.1791808243421;
        Mon, 12 Oct 2026 05:30:43 -0700 (PDT)
X-Received: by 2002:a05:620a:890d:b0:93e:9627:533c with SMTP id af79cd13be357-93ebd265157mr1462912085a.50.1791808242582;
        Mon, 12 Oct 2026 05:30:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde912b3sm2766910e87.21.2026.10.12.05.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:30:41 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:30:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] drm/msm/a6xx: Move a702/a704 to a6xx list
Message-ID: <ggwbnf4yr6f2pguzu444akwt5fdl2cwk77ovhc5ihnahnc24yf@ohnqcwyo5pb6>
References: <20261010154125.726149-1-robin.clark@oss.qualcomm.com>
 <20261010154125.726149-2-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010154125.726149-2-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX5r30MuhRvSDn
 m/eKgU16lR4nUyx2m5M0z9XPTqpAUpgItbFT1+EhNUAYRj0PVvyMII7/Ef+FO0QduOb9dlWiA7E
 Pi6TbUxrUH6HV+ntlaST1sWvmXC0kZs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX/nLKq1Hm7o13
 1Is2wOMiM8Bk0l5sEk3y7TBylXA2zFV/q53ohPaEqGO0JZQ16AUw95mX73zgE8Hu66926dSNzGI
 TE/73xXKsdzJcJ2QrnzmvsbeK7AjgNh7HY7HuqiRwb5s6Cdt8FXjoYo551touTQlV9DnSRwpEMX
 SJEglyQOdv1xmrF39OeF0dUFUNUm0pkZ7KJFx4BgnDrxzTAbaabSJQH0nnwW2ucVXCAkwarz6O9
 osPN07F68OCm51miBAUjYX7jqgQmUoiEyL+KR21623HHQtjVmmxYjOEOkGx1PkZ77xs5rY1F3wc
 lDcpOlYBrJGoaD2pqZd2oi55RQBXm980uLhLirEZ+Dj5RBwlbyC13SArWY3v0sL4NJ/Fi/A7A6B
 8aShTrjuX7ulBnpSXISDAhzAEEg4F6CcwdBvy9F8hKiusV4cuCyxiuV/kKlAEASCp248xXM9Ktf
 ZHSZ/Rn6ZWLUWIs8k6A==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accd2f4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: SzUn138x991xVh3MkZ3QqUYn0dEbW9yf
X-Proofpoint-GUID: SzUn138x991xVh3MkZ3QqUYn0dEbW9yf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049

On Sat, Oct 10, 2026 at 08:41:19AM -0700, Rob Clark wrote:
> It is a bit more a6xx than a7xx, and this simplifies the next patch.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 168 +++++++++++-----------
>  1 file changed, 84 insertions(+), 84 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

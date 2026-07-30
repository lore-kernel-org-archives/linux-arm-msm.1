Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135C0402444
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421869; cv=none; b=b/Sg+Y2NQ6pUltmdZOfaf6hhQ76uPUUJbTXtVaKUu0YrJ6/LoWUx0QvT2pGktOEefFKGyVN+X7cPw3XKfSGVlozi0taalReuRUS8p6L31NamE0zwGNxoPDU7ElFLAb5tOv7M+ufPxzwmGRgbO9BBrozOHxezYOryrfnKVN0g8dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421869; c=relaxed/simple;
	bh=XofIp02k4nBi4eiowNOYNf7H0Xpi6iQH0NOE8i7OsKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiXD7hH3iM1Cv35Dp3LOkAt9/sEMh/+acFaW3rqXXUnVy+Af9StaSEDys0LRjT8y92XSvo1IAS9Nw0gX4bPhr020kHHQtVPWqa2KHtTS3K9XjHQs1qxuhvAh/ibIpchGThe2DlTqGLAoanylEvfK1SmQ+vWahUN1Dqg8h8vMBAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mgj3dnWs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eExL9aXy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mgj3dnWs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eExL9aXy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDKRP1062930
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:31:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JCT3EPO7gLLjh/8pAuKmI/lG
	uSDERijqki/K1oJAcNU=; b=Mgj3dnWsw42JT8wCEe7gC0WI0m0wu9ltMTFEzBqx
	cAVV1sX1YGzCvyt5oYGWXMEOh57YBzudwbAbemMddwEkTyaU+JHpLkz34sqEyOQO
	3ejldVR3fxiH1F44uSYVnueLQKjWVCDjjRU/3Anjgn8LfomDsBUMM0KufS5LVam+
	ekbDM4DwSQHmoG591C2HZzjNu4hnWIgy9zW3JoSoQxLNpRUW1Cd5dzwv+nPLl+gn
	EHCiA5lIpNhiO1H739gFU1XJPBtX46AVIWbWBzORlC0Fe8aUvRX8c4LFu5zc25aT
	qd/m4Rg4r3aP76j3MdokIfVmGfte9HijtCo0fx4MIHkbow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6yfrf7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:31:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ec91dc265so204916085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785421861; x=1786026661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JCT3EPO7gLLjh/8pAuKmI/lGuSDERijqki/K1oJAcNU=;
        b=eExL9aXySalkD6X1/1J1ybgH7vw15gWvzgKrgTqfMnGvT+jVWp0LtcU2wouBRKmR+m
         2KwJRt7OU7T0yp8cnx79akJln6D/0tqdso6JwF/5w6x+Lj8TVKan1i0Ef55jSdxbsagN
         mAUq3lKGF47SqrKHlQmm0VrhUK99no6/omMAB9PV9yRJyVPLPmT2+6YjVdS3faJb2e++
         HYPL4xvDGVD9HdwaFKjhIFHytMeh++gHzaGe4kLCz34FDxcZebMakoyAmSYhpHL03hE2
         6UYtzK83aQ8JeVYqIrCh4cjHz3Ntj0Zx98VqQuM9vQ0TGGKxwQpXmnQeYRRNl8vsP9GY
         FMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785421861; x=1786026661;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCT3EPO7gLLjh/8pAuKmI/lGuSDERijqki/K1oJAcNU=;
        b=B5VqNLQPdXQ0mcRkr8C+EfSgwVQp4Tza3/lyOIBHWAxqvugI59EsbbrUo8G/GXo0ZE
         +03DfGE48F7WhpXH9IserloOcH4VvkHajOA0GkTAGM9NwxmRPvJWuDYzZB8PbLmlUVBQ
         E0QEwLFdmJXRh+xPnGjjIZK6sbGf4lVTxxEZ7r1Tn4yUfE5h3D4mki3YxbNWDnGDG8ZV
         Kmh7jRD7LNoVBaofjaO/uV17SLgYhusSwm8jgYd1g4YaG1lPXD+2q2s4cgCTYUIboGr+
         aCwM+XZM4oDHmbpX9CC/iay6dMedrlXFAXR/3nqbPyExmn/zp+R0V9b2n061gmCKRGPC
         p+6g==
X-Forwarded-Encrypted: i=1; AHgh+RoE58V0XumTa1LIoG5nrLZbg+3KilcqgSwLoxCeu+OgLY43CekNJLDIIg4lemDnaZItohOeYQ8awAl4cK3d@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6dPBMyAABWY42LBhonj3mJzBkoep6Gr0FIkyLi7rDeGHTJQSG
	lzyXMotWU4n9YT5PAp3QDGAa1R9U0rTS/Ieh1U6kUlUH6a+ZQUArapf5DeCYd7vHqMs1owZK9yU
	Hr2K0i+ztMNKEP+ZzpdY4apeqghvC80NVbjzbUNLCak3OksFjFM0iK5tyzJ8nSKtl1RAj
X-Gm-Gg: AR+sD10oBG+oYfwUF6mHERShICd6iz5FdJzEctwLou0sAptN7rgh8PPmIYS5N3ePHrZ
	Xcx9mnDcFbUBc3tQYl8ilk+Ox7wZZIKOvS3B2PmBemqmxC7CwW8Mj9QmYeeRUjSXBIiYNUUSoO7
	j5DxFwkR7KfeRd3RHCBCZqg0+YTAgQVyIqXC7CMq66T6mo+4XyBNNuonQQSmo71imMw0CSvSQjb
	jIHgg7z+JY0sv0zuZfslk9I1mukTnZJiAaeVbJwl/7zYr4nXUJ3YdCa0Qpob8ZFUZacucmSrbR1
	E9TgGPshEHmcBPPNHt/mnRxYgbdGI6iN//b4NZP1tsSq1y02kzDvmmfvcurRIC07MzwDfDN/8kk
	Q72951+glBSWKTVN+JpTUm0jqNnBVafU4fFvADHjQ+kyNXfY9vUIWmR6g2woQ6x1zu8YB/FnWCW
	0hmgmyjO2XkMitxw==
X-Received: by 2002:ac8:5f07:0:b0:51c:7b12:1201 with SMTP id d75a77b69052e-52b386c7b4emr31713411cf.79.1785421861202;
        Thu, 30 Jul 2026 07:31:01 -0700 (PDT)
X-Received: by 2002:ac8:5f07:0:b0:51c:7b12:1201 with SMTP id d75a77b69052e-52b386c7b4emr31712241cf.79.1785421860267;
        Thu, 30 Jul 2026 07:31:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9c5196sm377549e87.56.2026.07.30.07.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:30:59 -0700 (PDT)
Date: Thu, 30 Jul 2026 17:30:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Joerg Roedel <jroedel@suse.de>, Russell King <linux@armlinux.org.uk>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jerry Snitselaar <jsnitsel@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/3] iommu/msm: track a context master per device and
 IOMMU
Message-ID: <ketiunovezpn76nxocpima27esjt66vve6tmqg3e4murz3yjga@pxl6kikpbk5l>
References: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
 <20260730-fix-qcom-smmu-v1-1-b12fa067804e@oss.qualcomm.com>
 <c77db81f-9fb8-4803-8efb-078b8cf70fab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c77db81f-9fb8-4803-8efb-078b8cf70fab@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExMCBTYWx0ZWRfX6/NoWIvvYQHF
 LsI3aRmN7KD0Dx9vbpqvGtYRP+7upuGx9Zx3UmraTpOsjsV7P68aBpE60jeUJu6jqYNt5EKTMjw
 qpXBkfiVWExgoOebxKcpIcxCTRf7epM7CZa7yvuy4pwXJ5CZf0PN1l3wQaTK2eZBUBX5wP2KwAf
 pd4sSqPLQbT4dyWrSsz1iO/a7sm/IPPNRVi3SuFRijE6b/iUtQNK23YwTtJ/ixrYG0B9hO6Sm/x
 FmHo4hgF6VfRZ2xvZCkQ/FQGh4jZ0TG+OOxkT22YJQGOdKupC3GDnsaze+a0AxGLAMV8Ljnzv+z
 Fqo3BCDnx9I1LfV0CmO0qY2mg3WeOdE4hWkkZ0BzpUF3HZ0LOeiwctqyJnWjBkw/AwD9gM1KuPg
 9LxyLQKrefDEnBkt3HiZoi5PbmuEwn4BshDb8C3RX/ZxNnWrvXaULwOWAlejiOegyNtGhHXtVA4
 EueVBh9ZPN6YCiVWU1A==
X-Proofpoint-GUID: ddhRoKn8Kbw-9_OuMJs950hTkFYsxUzd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExMCBTYWx0ZWRfX1E6s0e5dTXkE
 1H5UXrqRN7PCISJe/AP9hevPPzlWJAM1SagDYf85ffUlK12tJHiQCwJK7Jj+mGgUCgOyYdkqgHe
 tXfYTZThWvvU0336Tj9Gslp6XxRllXU=
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6b602a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=6Z1frLYTuOUDIWW9GX8A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ddhRoKn8Kbw-9_OuMJs950hTkFYsxUzd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300110

On Thu, Jul 30, 2026 at 03:57:42PM +0200, Konrad Dybcio wrote:
> On 7/30/26 3:29 PM, Dmitry Baryshkov wrote:
> > insert_iommu_master() decided whether to allocate a struct
> > msm_iommu_ctx_dev by testing whether the IOMMU's ctx_list was empty,
> > caching the result in dev_iommu_priv, then unconditionally dereferenced
> > the master:
> 
> [...]
> 
> > -			dev_warn(dev, "Stream ID 0x%x repeated; ignoring\n",
> > -				 sid);
> > +			dev_dbg(dev, "Stream ID 0x%x repeated; ignoring\n",
> > +				sid);
> 
> Is this intentionally part of the patch?

It can be dropped, yes.

-- 
With best wishes
Dmitry

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDE0349CC1
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784701560; cv=none; b=YS29z4LWBtghLRi4qjLsHhkYXyyzFvQa+Bxet0pPlNOadNqR7n/p+qyoshXhKqxWoANWy8viJy56vYIb5ekS4ztsUWkaEz88eNBzVhHmo8ai1gMFrlrilQ/kZRNvwKSbK4GpWkdO4yXIYhYUoFsdmPFXWpGwUKP93tPZtvFIT9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784701560; c=relaxed/simple;
	bh=Ddaqyw1m/14YYHGc8xCANc13nNu41Di6AXWRLFx2tX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfbvo37baU1/+e/MC2vdalua9p/lNWXKhJd044L9nXWw/r0YFMCGSKYiyAKB3SGlJzYHJ7qVa/KRLdEuBljKQKudrOm64qV2Y0dQN3WSWfIwJo05lg4AuqHPerE97a+8yJcswH33K6iIRGCmLs2qQK1wwtErddxkVj0ZZP6lGRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dOqbvS7T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YT+0JdUw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dOqbvS7T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YT+0JdUw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53kks4045687
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rtCPHKhPDf9C+0niIN8vrfYp
	sjSbZrHpfE+J0tDFNoA=; b=dOqbvS7TZdyE+L5yVBE9M8wlnmjlbnVBE7U6iEKU
	O/CIbInbAh5fOlLBEuBfQ9SeFOTX1XMNhh7P17DMSMvhmnmXGP+Jml1wr5r/DS0+
	EGba4PjjSN2Vqh6ehzEtRohcwCKZw/LXDWXoVSRavoB36cKYfDJ/Z6xi64N1C5SR
	F2gjzwl8LKdRJxjfyEaj1tb931Y9AVFZF+olLBfZMJOgwB4udqA/3qTdkVLOXhge
	Gz7gforDn+ZyJsVQzgJspHHh0hqwjLlR2GBRl4OBXv89BfZpLnwvk0HjvC2hpICh
	ib3hZAE61M6NwzbmrsE2ivqEe5iXQxHij6lPhMyrNe8BzA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6dakn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:25:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c12e43b98so235653661cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784701557; x=1785306357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rtCPHKhPDf9C+0niIN8vrfYpsjSbZrHpfE+J0tDFNoA=;
        b=YT+0JdUwQNtCwqWtugw2W1MilHNYZ5o7wiXKOXmnKBJTZdqBUiRg6sTb/d9my2r9oj
         hZWby2vzWYv8+uQIZg1TYnxcN4lNkfFhvV4l4Zg/R7RMIAYjQAS+FVs5o9jfXNV3t01V
         m23N7R0xTXzbnXMGk7V+D/dJ5+FezMFEeRnzLwmClePuUv0XYE0aXO+7ryXy8hKu1ioh
         kngIPAj8pou0CQKpAvf1zRgi+EkPbAXeqmrKXIZp70KATRZUwrMrUBUOx4QdZdPKhGLD
         e23NHaNZKn/rLicKaUYjQIF7/ILWGI7aKQzLM6j/Qq5B2E7zsSwd+HeaTEODU5AWh68S
         FVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784701557; x=1785306357;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtCPHKhPDf9C+0niIN8vrfYpsjSbZrHpfE+J0tDFNoA=;
        b=Gonf8yR9HP5EPgBaA4Kl+bMJWYzVCfriNfs/8rEvAxku2MkLXxFVepSwn/5t82UpAY
         RbFsZ5CHc4N4dPF9lFpQHHOoPbH47XqCY7qr+KtKTtkp1xWTlnTNmPToaAwLPsPXY4wV
         Y4NvRPMx3QoIpUuv1DfUK4hfWIdmFMt68alAn/C9sd51vAynj6Cq3PccA83xlpSmSqZ2
         6AF5RfU+/7B5dU+B3rOy4XbJATvj57QdOG7PsZaMoG51wTzreZtY64I4298UWjQt4dOj
         QTkAThgmvEyEGbk8arGRvfFlHIXuX/M3qGXrtvjWBuByCVSIo/PQw4GNH4XNrotMt2GD
         4cWw==
X-Forwarded-Encrypted: i=1; AHgh+RrU4kyKYa3UgCfJzv9bkWVIbAIy+kd7W3B84Q3hAOcAvPmQ8zMt6YRkDHZADz2gZ62G3BlS4VCnPXSW2eYH@vger.kernel.org
X-Gm-Message-State: AOJu0YxpIEovJCIKqh0fbrsbydaK1w80w1T7ZehWBYKqMh2YfEfa8qGb
	px+4n7hvH463AXlfWNnKzNZHM5rDGBHtoW2PRgg0W7dA0Cs7Q1QxvJ/yV2AyspM4T8EZ98niKQa
	8XjN5YZB3FBprzUcZ1nFXFIIMs7CaKi3smCCaAFvAitC+BjigUW6Nmw/zr/9xEIb6XXcpI3BS7C
	SX
X-Gm-Gg: AR+sD10TVtRhZ3mY3/O7wsWHZhV5PXC3t5n67Ib6CCz6VNv5o5COAmxkR9i3DAkW+Z5
	F24B398OFxyXMyaY0XS7t9585Ms09gL6mc3jEFL7g9ZYBT+xrB/pcPf2B1uO7uVoPJStKomhcPU
	434rIJlBHwURrrEvofv3yTGPcVAOniPJzpTHdS1lwihvB9YwV3RqvTVXtnU0cPd+creL4gnex50
	fURgLjrBLSxuRd2MM4nvOX7Eohx77XtoOxd2Xhabz8yiUUnO/8sfFWWp+oqxN8KFVt7F0Xzh1a/
	YFjVkYs/1KmNxkiVu0HyW1is+JLZFBOPBxJYVPKpAoqxfzpMp5ZhuQNjpwRZ9QlRYJLBmmzeQ++
	yitbfYbFDiUqRob7m18ENa8kFe8L98nycHn19c823uGjaYqxSsIEv+mxQAG9g00Hw9LT9UI4x0i
	oj9cIasKbjLIykrA==
X-Received: by 2002:a05:622a:2519:b0:51c:21d1:3852 with SMTP id d75a77b69052e-5213c00ef25mr200940721cf.5.1784701557323;
        Tue, 21 Jul 2026 23:25:57 -0700 (PDT)
X-Received: by 2002:a05:622a:2519:b0:51c:21d1:3852 with SMTP id d75a77b69052e-5213c00ef25mr200940531cf.5.1784701556887;
        Tue, 21 Jul 2026 23:25:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9a801sm293855e87.19.2026.07.21.23.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:25:54 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:25:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/msm: limit the per-master Machine ID list
Message-ID: <luaghwrvbxffhgku2y6pwysrcr5zcd2s4gn3pu6z3rtu2ryevj@uaqnkvlkyvhp>
References: <20260722041619.17735-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722041619.17735-1-pengpeng@iscas.ac.cn>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfX+udAWxCWhuyg
 9ri7lhIk0prIDDbqIEOidAd52XauY2WDLeVT/3cZApAXne3KShyLGd+1ha0ejbBXbzQM5mhk705
 7dsSQUHaMWj+bjetYizK600O7TDiP0Y=
X-Authority-Analysis: v=2.4 cv=Ipsutr/g c=1 sm=1 tr=0 ts=6a606275 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=zmGlE_0ODbVwEF9q14gA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfX/fblekgcZSd8
 lwORDhtAAH8Su10JbGR92pGzCG+tlaKBAkXwmdq3jrSWMQVKlcbvnGFlWSYTqQOvsCjlqb/3A7I
 X+MBqz8goq5+IffipYzBKc9UsH3cxc3iJg270Jh0+PXM3hbuvP9vj98dQvvFlZEOmGIU89MnGeo
 VDOdINYyyfAE78gvlX4g4uuMgUq7i1yM+1KajC48V6PFItBUKntYUz7snsKP0MyDZNzCH6gdE68
 tVyqb2uFueLTKJ7K+oMykXo25DrgipBtk/3sRZ4h1O2b8HIXljBCG4sveZL8po8lrtlZC3LwCm3
 h49Gg7yLZ5bhwWXL6IYTOTsnqBDeWlRkxtqPRC3EGvm+1LH95brOvO8IlZ3fj1LNIoO52QGA6Yz
 kR2dRREl2UlSnMODDTDBv1MfVPaydyJEIzI17QlGxK6z9G2j7afIgUY8OjOVbfOYgkTrDXY8cJ6
 WBR7rWFi8YdQTileLAQ==
X-Proofpoint-GUID: qQ_e7hdy2dPq5DqV0-zuPYXP9DHUondS
X-Proofpoint-ORIG-GUID: qQ_e7hdy2dPq5DqV0-zuPYXP9DHUondS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220057

On Wed, Jul 22, 2026 at 12:16:19PM +0800, Pengpeng Hou wrote:
> The OF translation path appends each unique stream ID from an IOMMU
> specifier to the fixed mids array in the per-master object. It currently
> has no capacity check before storing at mids[num_mids] and incrementing
> num_mids.
> 
> Return -ENOSPC when the array is full rather than writing the next ID
> beyond it.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/iommu/msm_iommu.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

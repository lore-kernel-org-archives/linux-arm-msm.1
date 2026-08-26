Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42BB3B14C4
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787729632; cv=none; b=t12vbeqxK8Bm6+jbFqNQW9sL64pHtUSao2rHFoSW2QkalRp3RRB8e5SMk3c6/hwOoIPHMYILdqUiAbKtNYPRbzSOchJ5t25kGGlWeuoTqpvyFzgcmJGEFwxYuBTdhzw1RSth2biNzDt68Nwqm1rd1woKovJ2DfPr5AbXOJV3foA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787729632; c=relaxed/simple;
	bh=8kPZvBO340xns4CP9VY5wrGpBmxirmg0KvjLfFXDGiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PB6EgZgD5SlmbLbL/9QuwmhitFmGdKoIcn1/RPBmQm08WGxoHgK6sPk5tJCe7Zcb0Di2PQO9IIw5++9M0eXkL4UKlbxQ8b1qoKzdUcXBLhGAFJ74CvqGycZTWDefjb1b3M3+/7TpuZ+OFu1sdkPjMxrq7MDMT3qzq/S35YrIFh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfhvB+n9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BslpPhKf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfhvB+n9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BslpPhKf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6Rjbd3689427
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m7+teW33YtH3vS4NveYRxOW9
	xtK2h1OQ/WdzF2P2HbE=; b=mfhvB+n9cwA0XB/eGOR2w+nY3Wb29hVGgIs3nhl+
	a/0L6e3YriC5Ijwhqz6bLIaqs/KnvW0A6gx7NI4HkkidvF/wQnl7B3E0ady1IfEU
	8RvBMCrsRuu4znqvQICK8I95Uo57S18QxdOYVEPKjXMp7EB+SufXwwOl0u19QNpa
	Vt5IiFJ+m7Jq8LqsR8ePGvZ3YFnXQYh2cWYtqKv6ojqhwRym/K+xpG9702Kefce8
	v0D0/nJMQ0tzUcvbxQlv8MjRQEhmwVhASoM9P/qQKfZPm/Fcx4GzVA58dOhcX7gT
	r5BVpRWFY18PxcvJwczQYoIfbBpcywRBt/2dqN7M2O3HDg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn2q7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:33:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8eec6acbe21so12988966d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 00:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787729629; x=1788334429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m7+teW33YtH3vS4NveYRxOW9xtK2h1OQ/WdzF2P2HbE=;
        b=BslpPhKfFGZzL9uZAkN12oI9PXisTym0qhouknpwpVFJJc7VDn2AgOnYeXPE37kCe8
         S0B8KdNFupnnlDOqppLDp4GIBq6aBw87HomwpogMdtNjAgC9WKSGwyoPETd61WgCTvJr
         KGjtUt9bzYd24IpmMJeUy8zw3UDP96dgC5jc5QwoZHhh8YPuksaBB8mIQJndlsFaaKU0
         TY5T78bnT8eJ0XrR0wdYIeDdluk8NIAonfNdcj3pKqipoDcbQwzpxaq9O84O9zpkYEGt
         ZLy89iDg8QQhdJDk42DXnQXOhIPP4emKowjdC/Jf19QurTp+/GTpBdEkVZ4fEHNLU7VC
         v9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787729629; x=1788334429;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7+teW33YtH3vS4NveYRxOW9xtK2h1OQ/WdzF2P2HbE=;
        b=RWvKFh4hR6OgbDz7MmeYCN7vKDlpoHDjmRkcYPYINcQxfaG+E5bgkLRv0doudpXPCr
         VuVhAOzwWGyp7v1RbcoqskIqbN2RgIkSaGmqylQmBTu7gnIIG6xJbwYtIt1+2mP2YxYc
         GAiYbmP8wK1kG6UvMX0cdINfzMF/enOeUtyNcpOq7jAAiD8VrGCantbTK50XsM7a14ke
         IMmNL64aNYpfFIJBlQ9Oks5990zuRw3G5Y/t42Us4t1Gg+/kLacJR12dOUN5SsXnGN4c
         Xap7lNQnOBs+faH8Ni1WkgaPG9cPFu0Tg75L3wB/TWdGUcmY4CVXWXG44vrOJCXhIDyA
         Qspw==
X-Forwarded-Encrypted: i=1; AHgh+RqqlEX6S/jLfi3M3Cv7oxTSD5FXArZJZvFrqstt6ws4lqtTY6cCT443GZlzHh+5E2GDNIUKJEwhOEZTnRsS@vger.kernel.org
X-Gm-Message-State: AFuF++kCLMyegCzMcDVXyJhA8peYVpaRTGk5hZNxl5YccrWV+nrxR/BI
	9rPGH3QfVNBmavbfp487TfsEnk5raxTvyorGQLZ5YBjwECi5/Bilji5UUQe+yVNzHfQWRnJRDvc
	hzrjU/FwbrxxB6Yk1R4kMTYUXouhBbVKGWtXGQV4c2WcXZMObxGxrfoKn8j+ND9qOx/qx
X-Gm-Gg: AR+sD1248i1EldH2PLQJ+JHqrqAAUNCROYamjpVf1Hbs2dlQMfbD4v6jZ3MLinHD7LZ
	w17b3oknLyCM87Tn2OYorkehBhl1F1SFiOPr7ZzNSMe5X+/kni3X2ZjUDc+7KEOCJXsjRQSNNSu
	s0SxsI+z1lIWF35I4vNJW9Yd2oQwGmA5DmXgJj3xWo0/IseYXyLpGMBeefEmgYEQg4bK+RZ0Eo4
	GuVvndQ07qWi6uXUAHqNvtrsgkln1ymSo/5YT6FoKAumyUMBm1fifjHQwFIPB/HOcnBxHlKhuAo
	eIl1Id1BjOrqlboMAa6KuLxyVjBrk8OQc4gZING+xRHhqbLaG2UHvnOCceU/D6mP7BgITfcRGXY
	0lyF2gkZtI/pk
X-Received: by 2002:a05:622a:394:b0:51c:1006:a024 with SMTP id d75a77b69052e-52e4247fccbmr39044151cf.43.1787729627905;
        Wed, 26 Aug 2026 00:33:47 -0700 (PDT)
X-Received: by 2002:a05:622a:394:b0:51c:1006:a024 with SMTP id d75a77b69052e-52e4247fccbmr39043431cf.43.1787729626932;
        Wed, 26 Aug 2026 00:33:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d647dsm327339166b.13.2026.08.26.00.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:33:45 -0700 (PDT)
Date: Wed, 26 Aug 2026 10:33:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
Message-ID: <vzd25hldomvwelwiijjnmhbec7zicyvzqdpcc37nyjrmmdkfvq@vxylsjp4yazi>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
 <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
 <xmhintkzkhqbneo2edosyqaxznb2e7sak6oshydtvq5q4qctvb@7axbwfxghvky>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xmhintkzkhqbneo2edosyqaxznb2e7sak6oshydtvq5q4qctvb@7axbwfxghvky>
X-Proofpoint-GUID: fLVwgN6Hsk0Xh9a6XGvzer3S4KWcfM8n
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2MSBTYWx0ZWRfX4jwm+CRpSUaV
 xvAXlaahcaMFkCyjb6PJOBrarx1pLR0nMMqwrB0BlIhac0Q4C3JacqgfP8J3afq38NvY69lahs2
 ZUTRHZNTL3W67m7gqrHzIZ0JmzjVIvU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2MSBTYWx0ZWRfX5VVJ2TavBuPr
 laL0nBPpCiAzg0Oy9iuBEuGMZQXx7pmmXf4doPtD7Rihd2CisePZA38w4Y1OS9YWEigJtw6ftuA
 eJg6pPaZXHLx1ZRRmiSWTvAB+Xy2OvoiLBLim/KS1Kjlfh7lU74K3Hl4W6Hr56t+6h2mghmEtoi
 Cm1412zWNDhKtv6eiruvJccjECLUxPF49+JbtbNOXeREZ6elhFaAE91YnUwSVflFQThwHHiBGu1
 VihNObSnqGFO6td19hDSx34nnP6XauxsLBA1c7lKM6t9kurFvD4kbmUQ2073vwx2GXh+aG469yh
 7D78P4/RSBCwnJ7FvOkwcQXOqCHlXwXH4LGqNP7HiCd8bmcQ5X5vl9g/gJI215Src5pmdLZI1XH
 REkNTeFT7bOlc149/ZfRKraZ6EKe8Bs61rEl/tAYB/53MqUH8cdMwlWuksGZuMn2ujQDmSEohvH
 Z84PmAQOJd8xPKFcmBQ==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8e96dd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vkuWnLlI3icQtIAv_MEA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: fLVwgN6Hsk0Xh9a6XGvzer3S4KWcfM8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260061

On 26-08-25 18:37:53, Abel Vesa wrote:
> On 26-08-17 12:10:06, Konrad Dybcio wrote:
> > On 8/14/26 8:30 AM, Pankaj Patil wrote:
> > > On 7/15/2026 6:59 PM, Abel Vesa wrote:
> > >> The suggestion of having the CX power domain tied up to the GCC
> > >> controller started here:
> > >>
> > >> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
> > >>
> > >> and then, for Glymur, it has been brought up here as well:
> > >>
> > >> https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
> > >>
> > >> These plus a discussion off-list led to this patchset being done.
> > >>
> > > 
> > > This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
> > > Reproducible on latest tag next-20260813 as well
> > 
> > Yes and the ""fix"" is to disable the GPU nodes because the custom
> > runtime pm dance done in the gxclkctl driver keeps a vote online
> > 
> 
> Actually, what happens is that a sync_state dependency is never met.
> 
> GMU doesn't sync state because there is no driver to bind to. No driver,
> no sync_state.
> 
> Then GPUCC doesn't sync_state because of GMU.
> 
> Then GCC doesn't sync_state because of GPUCC.
> 
> Forcing sync_state with timeout, allows the GCC to drop the vote on CX.
> 
> This is not only a problem for Glymur. I have the same issue on Hamoa
> (XPS 13). I'm almost sure this is going to be a problem for all
> platforms.
> 
> I'm looking into possible ways to get the GMU to sync_state.

This does exactly that:

https://lore.kernel.org/all/20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com/#t

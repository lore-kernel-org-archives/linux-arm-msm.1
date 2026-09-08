Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540B839D6EF
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 07:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853183; cv=none; b=MVbNLvqKfhUsdH70DC/qcH80bTfjzFbiuZKQJsk8qbWLFQv/kJ5o2t1S7Bv5LL4OJSQ/wpo8sL4AyTRaGZk9op866F4Wos8oyhFm2z5UAK7gGk9JvMoEp3tsO/sEYMHXRBuoYr4f/JXxLxtSDZiO0oeqy8LLORtIiYMLSKU+XCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853183; c=relaxed/simple;
	bh=vL81cJgOvudKv5vx5g7F21SEULAc4ClndxDIMCUG2Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWbCZ0lE7BMH6Wb7zInuo1OMTUItrzyS8oTep/Dr1qmU8o331dkjQh8dWlhXmMrnIs3UyR4mL5Txngd4wHErgrP+TTqS/s5X4ZiveUG2wX3s5r3sL7LOk+Q1zjthQ1Zu3opshC5Qy9jliEa+rXLceZe2ktLsrv7h2+YfWoIDEws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HFifstF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lf/cUTmc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HFifstF6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lf/cUTmc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M9xG1521684
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 07:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=731eDWp0YnMWLXrCZivqIdRg
	turWkNpesp1ykF83iW4=; b=HFifstF6B6fPLfEXAb5wmB4vBKuf+6i8xygebpmZ
	s1rIsZ/Clom1pKi8D8Et9vMJKXWuFVEfQC6Cq1K3tuG3zCz6H+A6H0nHzWAaKNTY
	KMml/gS0krD/4zbvT7zdvMXrwKdZ2OW78W0MslO67EK0rjneEeIx+LkaDnicVoE6
	mjOP49uzcyjWJm+DTIH47zveVRKlMa6NiTMw/SggPousd7BRAzVamA72jCZcpoDy
	/FbPRsROzuCMP/6bnoV80+u+3vrbA7AjAXby0qz2Hhqvbh/Rr62NwKRSl00PONJA
	UyLZSGxCGLM3T3hhXFTuBexOFvK+TNpErWIr1IDQj7UzBA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077jkaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:39:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939a00c45easo307824885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 00:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788853180; x=1789457980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=731eDWp0YnMWLXrCZivqIdRgturWkNpesp1ykF83iW4=;
        b=Lf/cUTmcfkP7+E7dgbqrg+capnc/Jq4lJSIdnb4/MQiTOqVEiFMUTPaxLQiCI+LSzl
         G2k3jo0WnNNuPqfPFVz8qZek95E26yRSz+BBkclBjZ/IgPJNRbOBpK3/y5BDibw+qTx7
         a17KUWKw+lvF0+Qh8g1e9MXb1SIbwFmRXoVVm373DY9anNVYMxh6STenMylW1QhGBMRJ
         /uvx7CCkvF7RdnrO7R8u8rOblk24a1ZA5fnH8n9szMNQv+LzrLLzIwSdsMBUfXvRnwCh
         dG+ldT99Zfq8XKIGKd55BzhmLX44BWi1xDedpyMEHESyfUpR8xzTwt+YQuWOSdd1UfWN
         B3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788853180; x=1789457980;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=731eDWp0YnMWLXrCZivqIdRgturWkNpesp1ykF83iW4=;
        b=mkCS8hlIuR6sWtzELi3d7DDoDLWitj6ru4eH3K3AEM3dXcLC1jGrmpJ3YUJ5+5SckA
         YULqldb/AVfJN79mO1XRmG86FkyLxr9FCSkY/iuiAh7Vj7mM2h+x+dr+7QMyP5+xFBhC
         1sMPyP/3/WARMhVpOI5T62ArtfEGn3EYznmWCj/mLUhygfxQexe7bBV6G74NB9Tc01zY
         /zr0ZFLVM5CHUoC9K4/Oi7lu5iTKJtLDe6ENg7i8vRXoP8PsGaJR/AQiveckF2+I4oHF
         tllmIlw6t8CLbaYurBlqmUL74yF3XZWLT+s0dCKKQynVQ+rJN5QkcQ/dMBuMpgRxcjRS
         tE3Q==
X-Forwarded-Encrypted: i=1; AKwUvBx+uYGNtnk+I5Kz2B1F5+GahDmRFXYprLqR4xf3Vmo6zY9uPCuAnLQwDGYqkcgh4giFe7qq5W3kzux3GeDr@vger.kernel.org
X-Gm-Message-State: AFuF++lbsQnm82347NGdOntxAREeNm9feZ4c/uzw6e6cXqiNhvTC7Ff9
	lkbU5yOvhzLp3nDOTZVbOnCo1NvXM6F9QN9crxVlVIXARjnOYkB8/pBctoaY8cglyOmZOY/Rn3s
	dj8+5IYOIs/reyCx7cpAXZvUg+IrTClqfWG6Pw/Edd2GOa5mj7HG0tM/Rq4q+lJ2YB0MW
X-Gm-Gg: AYBFou1e+FM9MQ8tmeNrdmPCVijlLMCEaTtdCrKxRGSZ26Ilhxo4YR25i337quee6lc
	W0MN/UR8yVmSTq1iMR0o60sIpDfAOVEB5NXpfFuAgi5algtyWAfrDBv26qALYkuhzHhG8K1D+Cf
	vZmLjzWJg1KarXRcNBH6S9ei12BtWxXvfHdFGmfs+8pPCyzgA49CACtCXAjqfVjh+EmxjlCHQse
	krKrGW9hn/5i4IdHNwD6adEjd7BnuXl+Km7EYpXXUPWGjVvpg3+p1khq8YDjiXmpml8CrYcr6j0
	uPoVPasIlT5Yh5FYryNqULp7w79LnJ+3NBosGj2TNGw8Isto+dCtBbbodBwXaEM0q7IdodXWLm1
	X/LrP0uw70WM=
X-Received: by 2002:a05:620a:460c:b0:930:a26a:fb2a with SMTP id af79cd13be357-9398031b58fmr2707865685a.2.1788853179507;
        Tue, 08 Sep 2026 00:39:39 -0700 (PDT)
X-Received: by 2002:a05:620a:460c:b0:930:a26a:fb2a with SMTP id af79cd13be357-9398031b58fmr2707863185a.2.1788853179035;
        Tue, 08 Sep 2026 00:39:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48594172546sm25535999f8f.15.2026.09.08.00.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:39:37 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:39:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Aamir Ahmed <elb12345@hotmail.co.uk>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: Assign .num before accessing .hws
Message-ID: <ahxoakctfkslfiybmxgbvqvarznrbiwohr3rnu5aonmyhkrfmb@cm6mm2azcqvl>
References: <AS8P251MB0001B905088748016A0965F1C8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8P251MB0001B905088748016A0965F1C8B42@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3OCBTYWx0ZWRfX2/BvxYrjFF94
 KOy/iTi4RkEwoNAPwx0Ad0eVUYGKJlpdoe+z18K83wnJTB/09RmXizRyZrb8DyV3KllUgoA2dt5
 Hco7KhVPYg6g3cST3jAXrkpUejU4TMXQo4PyHLWUTqEI/XStQiNsIjWIzM89zFCGz2H7WQQNyIg
 yLgdqEDv61IX1iEAFNby035BqXnxkAiv+hUV51UX9HfdVeel1166MzburLOx59+GUVnAr91CtMR
 ju30YQ0kuD20hengTZzuHhYGxue5jqT+oUYWZA3CNdsZ9LLK3SBGxW5MCJ8WYvtR+ydagHpYBi/
 PjrMNgQdUscAdW9Q+RAs0kjOYCBuukF9x3TNCvpTioYavdcVM+ptL0NwZTlcbwWtCip/DcKrabE
 mhfIdM22eOGCaBknWmX1bGGHQLPW0rFf71ftwPinfeVnlG5IrDiZETY6fymJa+Bxqzj7iBxaqzp
 0AYLUYpN1rb/OB6OzkA==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9fbbbc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=Zo5euW2OAAAA:8 a=EUspDBNiAAAA:8 a=hKUfJe5KFNZvrTfkyfoA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 97y97NnA-nDSCiBw_Q7wlAHE2JNxsd1U
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3OCBTYWx0ZWRfX4QwL9snp2baS
 Y+ppgWPd+bTPBtIiJvnL70BTblIjNMTDQ9wWgzDz9DdCZ80qs/PUag/LfJW/37tUDbmDZy/LZzQ
 1cDT0OmZyj5uKLxYs+UA3xx491Ffny8=
X-Proofpoint-GUID: 97y97NnA-nDSCiBw_Q7wlAHE2JNxsd1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080078

On 26-09-05 21:48:25, Aamir Ahmed wrote:
> Commit f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with
> __counted_by") annotated the hws member of 'struct clk_hw_onecell_data'
> with __counted_by, which informs the bounds sanitizer (UBSAN_BOUNDS)
> about the number of elements in .hws[], so that it can warn when .hws[]
> is accessed out of bounds. As noted in that change, the __counted_by
> member must be initialized with the number of elements before the first
> array access happens, otherwise there will be a warning from each access
> prior to the initialization because the number of elements is zero.
> This occurs in ipq_cmn_pll_register_clks() due to .num being assigned
> only after the fixed rate output clocks and the CMN PLL clock have been
> stored in .hws[]. If registering one of the fixed rate clocks fails, the
> unwind loop under unregister_fixed_clk reads .hws[] while .num is still
> zero as well. With CONFIG_UBSAN_BOUNDS and a compiler that implements
> __counted_by (GCC 15.1+ or Clang 20.1+), this triggers an
> array-index-out-of-bounds report during probe, and with
> CONFIG_UBSAN_TRAP the first store traps so the CMN PLL clocks are never
> provided.
> 
> Move the .num initialization to right after the allocation.
> 
> Cc: stable@vger.kernel.org
> Fixes: f81715a4c87c ("clk: qcom: Add CMN PLL clock controller driver for IPQ SoC")
> Assisted-by: LLM
> Signed-off-by: Aamir Ahmed <elb12345@hotmail.co.uk>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9782F6596
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726625; cv=none; b=ltMgzhVJ9dnrQIeRsAw06EvAfKpELQ+zrlgO7Y3/tj3JF4CAS9EWT0Mjg7clKx74fgz3dlqCrTlkFErrgUIVVz3ndOMl5BVMNNVutjVP6X5M+aZ5FofKFcqaZw8lC9ASXq0Bf8YRaO9lrGdnTywAgstaLTmoIUr2P+TWrZmvoF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726625; c=relaxed/simple;
	bh=GAUXAH/+jcrj/0omWp8UhQTaBRuNlXrbRCuliCA7Q/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtFFYDGW8IgXjLaA+trPjw5Spf65CuyCl//jUbC3BMqsHTJYTU6MuV1905nlhtGbR1q7WvDCx8ltHr+5D1/5zvLzNhBsoaGYelLlhSj9u2E1lldetnvtfGQAyqnkUCpeihm7U1DHMXycos5TDa2thdieLiMxC+nzIdi+qIgBrsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxSElfCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PVezbDnD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxSElfCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PVezbDnD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDGtoZ855693
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T97adHJ2YBIYEe292GMps06e
	0kZve/Z4wOJe9Q5DRF8=; b=kxSElfCvDxt+u4M5ExpORvNUFXzGN1801hNGRxR4
	UGz4aOQoTnvmE6dkeQHy/+eFxz2bJCzOKOPPUnv1cKDxHwMHnCHjXWr730zYNqqa
	+JSX5VGI5/rCqYKU7Q31Xt5oP42jBsaRKAhMJwtvsZTKx9G2xjMD2xsqFCz1VN/i
	6Pta8xF6hwi7F8xBgnaRd4QT6lNb4ttuEu6nnN6pAEYtT2jyOfhtXazoJQfdAcgq
	lCnp6wlm3behDpEGS+Ko/CFC77Ag3H9SuNJLhtF92mYYDGqbC9kScimQ6I/SkJ60
	4UXZuCrooLGX8sWpJZoafIINnXHV8tUHDnz9CmPjuSP3rA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm100u1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:23:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c20762d21so125236111cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784726622; x=1785331422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T97adHJ2YBIYEe292GMps06e0kZve/Z4wOJe9Q5DRF8=;
        b=PVezbDnDNgGwdKiLSdUF2IDsfVpl0hH//OeDWrg98JYIZ/GoSuQCfPivdA07chgeFk
         FlBlOYbAbt14Pz019M+u4vShVFpRLg8mtOBgn+5aIAPBNT31Vtt/qmdrR81Cvs0MbKnQ
         akCbg449TLgXMQGdAyVO8zjLskWfCCKKPWeF23+7twjqyJjBkkr/EmnXg0bD5EpmHXxW
         D2RUgDI1XyaU8ipY6kHXJvhxpkzwjqtp3pmf6BDd0L6PR0pRe2BZTa8mXZun5lAOQpeY
         T6e7kd3Qpjzwc3gpS8Mhd5rvUM9QWnfeOwdG8/zdW6DePIqHIk+5MF7319AQ/bOyKrau
         Ouiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726622; x=1785331422;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T97adHJ2YBIYEe292GMps06e0kZve/Z4wOJe9Q5DRF8=;
        b=I/QX7ByWxaguwDkeWquXYVRBAl7ZVuXDBqQ5j1xYWCbdRVf4+2rlrGWwjyzj1kJkm8
         IxHkorQ2Cl6y68JzE4OhVUkvKNvBG6S0ym3F0deIutIODnXHubBK9nfjjT/jHrMa0NKB
         mKfWb1eJMUKFRp2XvZWVN9uW2NCBSGq6uOJOjPrjjnFculsfDU4nV2zEuCsubK7TE2+q
         JteFWkws5IJlLzyh+Lt3RWr/ZOIqO+1OPM2o7yOBjeKqv3DkY2E+KfQp5kmvTREbDK4i
         +vaH1pq6QkGo5beR8NuKHC30O4bxYJmHN3o+8FbQYqhazrk5AmvBxEsm1FHPZXb/RbB9
         1PXA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+PEzAC4F3k1BfjcR8iXbCsKUGHt+b00ea6wKPYQ6ghx+b2eSliUUv0Aov0dGLqWwVSoqarlEG7bhXbTLv@vger.kernel.org
X-Gm-Message-State: AOJu0YwlIcfTtIMOyQF2MRXcMhrAmLtNaRsoUKcqBo8v7rj9ZatBzqDR
	W5QR0U7/iDgul2i0zum4GFHw4jjvyqUMjyhNIGmyalr4PlmajKmvNeG/ijxHci2PKNU+yW+tk3H
	ZbP8j62QZM0TThvZq3cyBCsXRMnVjTDn6XzP+JKucvM+AbIIvI4kRUTWB/c8Pf5QsAOhvLp4M/W
	Fj
X-Gm-Gg: AR+sD138ZixU1aUlnYLLcNYoDETWt1oVHU50zSUotKpw5lgdtDrVNQqR91lGV+jGP0E
	TtLziu6zbtX8zUkpsK7F32UyS8Oj+ffAGhG4tJk7OoF2R5GEETmuyWduhCaEdeo8kLQ3WAenRgO
	2Aho1dsDuYOZ3z3Si+lx0Nix5+haGI3rMXtiifOWUEnbYnHO8FR8Zo3wPXzriBtgr8STx67dFq4
	dlySdvnzTHwOvEVGJ88dBVqCRzBUXcbwtLTRQTb7FqTz6ZVtHPg6TO0Hw0lCJCyN1jUxQguBoNN
	+iic1O4XzRuBFCjF+slnEsleI3asEeooqUhywQD4UcZWUDNg4Q/xCCD1axT6+DUStRn4bzitdW3
	iX4j0VEUfxtjY3R/okQ8i7fqvTo2E61jTB4lZSexKg/lL7T3O4kkAZYivBMCM+asyyra0ufdK25
	czqL/9kCC/OPRUIg==
X-Received: by 2002:ac8:7f53:0:b0:51c:849e:e222 with SMTP id d75a77b69052e-5213cdcc8f7mr224047601cf.36.1784726621491;
        Wed, 22 Jul 2026 06:23:41 -0700 (PDT)
X-Received: by 2002:ac8:7f53:0:b0:51c:849e:e222 with SMTP id d75a77b69052e-5213cdcc8f7mr224047101cf.36.1784726620901;
        Wed, 22 Jul 2026 06:23:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e4313fsm465846e87.60.2026.07.22.06.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:23:39 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:23:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: qcom: dispcc-sm8450: Fix
 disp_cc_mdss_mdp_clk_src ops
Message-ID: <2fsd7y2myhb4tx4t3owjiqyavvhly5qewpfqlaujewnlvrwejm@wqodgnuahspo>
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
 <20260713-sm8450-qol-dispcc-v3-1-56fd05822270@proton.me>
 <e43fd30b-4f97-4f14-85f2-7d113c0dc1c3@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e43fd30b-4f97-4f14-85f2-7d113c0dc1c3@ixit.cz>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX/GfvvLRR1zE0
 7R8k1taNtkj+e/tEGZuJH/9ajhIQ+WqZEKUdYbRJ57q4G3/S0wWvppfwlQcug88Ygwru5fp1NYt
 GK/sYhO9ZTLk7APe5v6gQmTkoaAEZ48=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX7371mTKVUUAR
 GN9unsZkJVWflF42IQo3PZ4nqmrohliVxC9lL4Sz8DqDNl3fFMGpiMXrghWbBZQqKcuUWsC5Bmd
 jiugy3kMeLp3N9hqqjfhH65505zA46Z+EbQRAHkJGhvWgac3Q0lzhs3F2yrUEahh9/yCLS6HIhi
 0Qse0vLTR6xVQ6adY/4NDS1QFQhDqyUlq21YVgkztQcdBVlG+9pCl8vu2HtMYgyuhSaYo5Xi7oV
 67GkrSwPLIiuJtNimEoUz/6QepLGcpoeXgr2jAI9ts0H3geuza5QQEu05IwQ12rcbCof2TNaufx
 KB+C7l2h3FTS6rbUwyTZN2w3Wp45ZeeYMnkgRF91gATPgD4DHMmU+RxTMM1xNTTrbau5NzIJVBx
 LAjE7BlyFVVL20cah+B2F7Lb56nInqzCQ7wfokhwY//OGGqgUa/OGoqXD537fge/ovBrHHpJgbC
 VTEhBlNrV7QDc5e2VLw==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a60c45e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=PTqE-MslAAAA:20
 a=EUspDBNiAAAA:8 a=3Q0qqnQoSDvQtWHvQ2EA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: TqtUX_xum-9xhPfW-TPfIgyt2hznxt9U
X-Proofpoint-ORIG-GUID: TqtUX_xum-9xhPfW-TPfIgyt2hznxt9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220130

On Fri, Jul 17, 2026 at 11:02:11PM +0200, David Heidelberg wrote:
> On 14/07/2026 05:28, Esteban Urrutia via B4 Relay wrote:
> > From: Esteban Urrutia <esteuwu@proton.me>
> > 
> > If the clock frequency is changed at registration time, a flicker will be
> > visible at boot.
> > Switching to clk_rcg2_shared_no_init_park_ops fixes this.
> > 
> > Fixes: 16fb89f92ec4 ("clk: qcom: Add support for Display Clock Controller on SM8450")
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> > ---
> >   drivers/clk/qcom/dispcc-sm8450.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> Heya,
> 
> it's likely this change will be safe for older sdm845 too? Comma.AI people
> have it applied downstream on top of 6.18/7.1 [1], so I'm wondering if it's
> something after testing on available targets could be enabled for 845 too.

Yes. Please send it (for sdm845 and at least other dispcc controllers).

> 
> David
> 
> [1] https://github.com/commaai/vamOS/blob/master/kernel/patches/0004-clk-qcom-dispcc-sdm845-use-no_init_park-ops-for-disp.patch
> [...]

-- 
With best wishes
Dmitry

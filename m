Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293D747CA9E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 21:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791928243; cv=none; b=QT0ubprnsc7ypjmK8DvYqK1ZnyuPv/rze1GTe2lBf7O+OY4cR0Ky+58tpioDplg6q1WgP6R6lMaJnCarpamGDvhc9npu35dCdxQ3vhYy67+88RAn8ryNMkMv1nEJtX0Exwy4hEzoXxOW+Lrpq++IITLtx2K5M9VXgGd+B6SK//M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791928243; c=relaxed/simple;
	bh=UgMV7B6SyaTuXMQ+t9yxiRXnDIwWqWpdaLzbmqJXiRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoPBvPV3Uy71hUx8nAMrPtL/8yZLLBJlvQPZ+qCy7ILvpP+B3vOSQwtmHQ8xZ8kvgGmdog/EeN3RAJ/HaL06wgHDOMiTbWxMA9p8EVpig+KMcsZHuDo3udSL3KtPpReGJ0MnNHaQzECtfHbLwq7/RgpWMCM3FbHaVrdzCTXvSxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C0JFjXD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N2bqbK9J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0JFjXD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N2bqbK9J"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DKDqVb1999284
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 21:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n/7XEOYXM7KKJkDW0CQAS/0h
	EHAZRZ621cOKXBSi/ZM=; b=C0JFjXD2HuQOQt/nO02PEbjyrrGsBPrvR/wJypQ1
	DQ0Op1sIByLV5f5100OgloDw1DdylTCSLQgZ3uilHIx+MPOWAql8Dj/issSWwz9H
	1P/b5VEZ3X6Xq5ysPKwrBTOtdFvQo/q+ZHDec5ebOut7vUJaDOF2Q3h+aLqhJTnL
	sI8CsVIvrKv+3XHVtIa5OGslGeAH79kuEs2JXht5ujAyzQY9jWKtgDMXvePBG+ZD
	fnGOwjFS1Yg0UMU4VB8rwMazi0vsJYG2OtsQNrk7fHxFIluiLcXcH/+IpClPlXxU
	yg31j7D+Os+d4i23I1pmATFRcXHwnDisPBAlPWQGbmHCdA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f62c14b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 21:50:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc40759b2so764774985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791928240; x=1792533040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n/7XEOYXM7KKJkDW0CQAS/0hEHAZRZ621cOKXBSi/ZM=;
        b=N2bqbK9JtTwWUPbnbQ/FNDrgadMRrA2wQWWtxlO8bLelkl09kpXVWBkfz7Da0QFGUY
         U3spYZ98gdkJwdo9vPmfeVJmr2T5tAl/qZWG2jAHa3/TMoeV2X3ZJYK6cRFeRDGez2xc
         LFT7IDooffpayXOD4/VddmreM8hZIm/3644PMCx20lctL3fNXmPXBgmwVs+pKXiljGCO
         FRH95jXNGhd08Wec4l/EIm8P6U88Nb4OJjH2Cord53pZ8midYqHNQcP4d5VPPE0VX2kv
         oNXX82Kf52LLghuiZ13c8nhGALViJ1Tl0Z0BwrNp7hO9eb0aM0bQyqzdIAlYkiwegKcx
         PCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791928240; x=1792533040;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n/7XEOYXM7KKJkDW0CQAS/0hEHAZRZ621cOKXBSi/ZM=;
        b=eUWTkzH4LADNwosIvtagS39Y8yw3PRVfdMIRhdqQkdoBqHBkSDjiM8HvYPZtgMInOs
         jBRggE0B0feGHHx3NNQdPfxYE7fxb9WPdvSgBoAIb78MZ6Eah8DUKEXrkkKkHdDc00zP
         gHDF4U4TwbNYbBatWHuVFnXIf0eZyb1WE5+Ug401U5v+DS76zDvz6mtYxQlKp8B+xwv0
         Jf8BZSVmfy+uNhM03q6fpLRHAsq48BMr21eiLhkMH2ZGgl1Po5vj09GFfTeqCR5Ry6kO
         DMoYQsun7uYvRw++rvN1hSpBjGI1WlLT2IR5w3FqkhynbCCR9tkqBN/tNXWB2CMek61o
         xbOA==
X-Gm-Message-State: AFq9FYKYdAF703/qSRoAxj4/ln5Wp03p5NNNOvFb0yUZYCL7nmQQyE67
	YUlXI9692iFkAT1e4JRJ5aLJNNOq9AnVO53+bW5FBX7kGF7hAemSs4caPjLBZaTODtILYm1T4Sr
	Ux+VxW7uWbE2xqHlfEliIDp6N9JBMo5YX858/U2Qay9sMLvohJmjzAFiXUGND6H36xNCB
X-Gm-Gg: AYBFou2zJS8B6MexxxuS1roDLzCATezRe30PDXl+rcrp/JSwK+EvsdepWEOIEp03pWs
	2b1BfAvYKDusyExh0zsjhXaX9R7EtiOScHYEjZmn0O2yH8c5JUasDJSjMLnDcrQ32vT55LGkzjg
	o5mBm3LLNrBfR5SBJYe7TucUOIghrbCRnc2KZAikgiGnycC6d99/sp4NhKNoDX2fRRbIPQOUUfR
	KTtg5OOgscwCr50ginEt7wTL4NLUvuPeg4lF2ZLpeTU6kJ6LL2tqOTEvitKovCgocQTW308GJ6H
	/+ObMAutHV91Hq94O2SbDG4i8Jus1j1oug7cOjJfe0Vvp+Qh8jLTawlvq4HD2ueNFzxuScKvqRn
	EX8CXjPslN1He1CHHZoGlgGD3O7b4OkGmmWY9mE7IfsaTmwTfnHOeEOEHG63ndjtu3Oc3CUi0si
	gJy2WpPXdE8MaY
X-Received: by 2002:a05:620a:31a5:b0:93e:920c:bfcd with SMTP id af79cd13be357-93ebd23d1a8mr2326184885a.57.1791928239738;
        Tue, 13 Oct 2026 14:50:39 -0700 (PDT)
X-Received: by 2002:a05:620a:31a5:b0:93e:920c:bfcd with SMTP id af79cd13be357-93ebd23d1a8mr2326182185a.57.1791928239306;
        Tue, 13 Oct 2026 14:50:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3caab0asm37232051fa.18.2026.10.13.14.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 14:50:38 -0700 (PDT)
Date: Wed, 14 Oct 2026 00:50:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v1 1/1] soc: qcom: cmd-db: Use %*pEhp specifier to add
 some sanity
Message-ID: <rriyrrvmyl36pzrgh4z6olspfglrme5fu22ohvozlbvqbbcvqm@vyxcy3ao6rgk>
References: <20261002103209.875124-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002103209.875124-1-andriy.shevchenko@linux.intel.com>
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6acea7b0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=Tc-qSVFKjPaH2g1F6FkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA4NyBTYWx0ZWRfX9tpSV7Gt3Vmj
 zFZUY6GUKpGpf9zyWNw/q86NGrVo9U1kT8dorWZ7PvHad6/MnILMgYMUXXVxDIbQ1vlunscx/LJ
 6yD9zAqB9inzHKK2FEJTkIgTVHLB5Fc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA4NyBTYWx0ZWRfXzfIgUIpt8Ud0
 AVm+84GMGAXRy2IN4fKEevV4PqMG9ncdGWsmUKMF0pYNi2rolUcd1tSkdWe9pZLtG0xfQKWISKP
 Sq6QOl0Q6QbCPl6LhvriNWbEtV8M0o9xKH8t6NkQX/dZRMu8WLv4/jCGqt9Ntj/wiDX7NWw17rq
 KdSb8KKe6OCfjPwC/Ozo30uiUY1IvgcWFiCFaXRlFkj22JzHp6BMB8yvPHhXeniuLuiC8lTUwv1
 zDS3BZO5/Op1UGkJ3cDQd1RNInl2qohgT/BJ9PH7s+8BYXU5wnNb82MXqCosV2VbpUoJNb7B5uc
 CaW11dTal/Jdc3XGUHZdRHEo942LMo444FSv4jVfFTEyn7MOkGUzNyGKHjtGcFwm/WUbH0laU2o
 GbjqgywkiD+6+HLEb8Bff683o2OBJiELW2GhyylkGODbnCiZz/ANS0Sfv61jyDleTLyrsyrYWv3
 3rplqlv79KtmgrkNvzA==
X-Proofpoint-GUID: PPRJkGOIPGauM2P3etJqVv6Q3IHcQCFk
X-Proofpoint-ORIG-GUID: PPRJkGOIPGauM2P3etJqVv6Q3IHcQCFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130087

On Fri, Oct 02, 2026 at 12:30:46PM +0200, Andy Shevchenko wrote:
> As Sashiko pointed out in [1] the %*pEp makes the whole thing
> like "no escape". To add some sanity to this the used specifier
> also includes ESCAPE_HEX.
> 
> Link: https://lore.kernel.org/r/179089728102.434549.12368098081790653201@kernel.org [1]
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> Just a Link tag (no Fixes et alia) as the escaping seems to be a guard
> that never fired so far.
> 

The names are ASCII-only, but it's worth using escapes just in case we
parse CMD-DB incorrectly.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

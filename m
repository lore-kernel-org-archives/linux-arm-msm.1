Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AEC3264D4
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243707; cv=none; b=X+QrfYs+z4tI60fvxSRjBaOxf8rsCHn2Df7d88GSZSt4lHKs+7ZXC5ZgJU6dZGHw5nmCad1ehsFXn7OnG8JjQ7BEgQ3qHxaQP0dDZzmzyzfC/4Rdtfsw65KbR8KQZyhN5aMyj2TeYQ+gF1TFBEzLVSeNYETKVTwt5G7gl2R2WcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243707; c=relaxed/simple;
	bh=GCqtV7gztwacl1wtluzqhR3Rrfm+XRlmEFzBMnqYPH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Py43xJHWfOj0OxUDb+/Q1iXk4i4Izj9Nk5eCcYQPeJUnr1T8xuMBlqUnZ5qNkuBDLjx2HBI19l15a7D6SuIESsgHiC7Mju4gvZtsEIAUx4Z6yjL/Mva/CgDj3ICsiPGL894WWldjf8dEcClYTnL5bL0+bGQVWgDP9mSyeQg9m9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKC5m7Xe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j20lRTmm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKC5m7Xe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j20lRTmm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9QCaW1774063
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pV86+SxpwWf0AIExCaUJX5mz
	1KnFAgW0PzRtHkqTKtY=; b=ZKC5m7XexAj1uVzerlg6Mt0TSm+38PkS1V+9Qt4Y
	YElhKNRlrSX159eOOMp940PNXHR1HW3yWxMnqntsD1EfPSSEaMdPSaLB6uTGnam1
	qNy6LdE7MQixUhdCO4v6dcdzFxKeZQKJlttNeV2kx2kQlhOQfjSYVM/DOTtbAIos
	qzeRQjCJ79e8jBRYHN9fpYU5qHM9RV3FVioxSBGQFB9ZuIfeiU0Cz6ImDVjpWlAT
	lZSRPtNK/NJ9UI/wueJHwS1PLCiy4nJYE4P80GWTt3sikVa6lrnjjp32TECWIELk
	mCIJSOAhWg5eY5Izqpa+Symgr8rqATajL8VbSuMtWmA+mA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb3sbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:54:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33310847fcaso3401936eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 02:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790243686; x=1790848486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pV86+SxpwWf0AIExCaUJX5mz1KnFAgW0PzRtHkqTKtY=;
        b=j20lRTmmfOHbDv7gGTGXYYbWmOuokDAcpp6rnaUWB7hF2UkCFRzAJpnq3nmFZsJei3
         m2Hh3KttptTbPt30qXsI++UmiM6ACUl/0fW8/SHdtk5EfTLCdzstleQoduASQTvohuRH
         NQFKQg7zBNKw/+Qsqcp0+rdVi7TizHG6wpozPhL32sRMauxFBg5c3PFStKIgmH6JthZz
         hZA0Clru66HDspgC8Ps1xbbZVW5WTr5pe5KrCT2Za9SGR3FLOEPhwxk7WH+SgXj9FAQV
         KQXzW3F3/3qk82fLWY94IILpWx05mp3n+XTXfnxl94kb2BCYHv+scPKGhYe8vsxLJji8
         dT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243686; x=1790848486;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pV86+SxpwWf0AIExCaUJX5mz1KnFAgW0PzRtHkqTKtY=;
        b=vvLVmtBxu/qwXgjPn1945yED8wlG60t6SByIGItEVT17q/Qbn/au0QQ6iDd+aInI1l
         7L9hF8Tih21APZTvhiePlfjd1XstxC7TDsn28VgrL4GqKIaPMejuLXCcl69+9RQ4ZueM
         2dqgdN/nA7sypcRAcq7r2DNJl+S/sGe/IeRyw4CAAxXx1w+Trbg76LDICk+jce4tOsbM
         iuDzUo9bVD9hMS3l1Slx2rQEuvrvqtr4FqsTcNsWVn5BB3lxGk3AN/vUGImDw4Xdrhr9
         9BuIRfzk9T565vLKcQM+Ws1qkJBfbqLymI3Uox8KUbPuZ4lHt4UPhbhZVXXdd+bpQiHy
         XgKA==
X-Forwarded-Encrypted: i=1; AKwUvBxwr8iHGGkk1lgQ3XWvX7MWh5glbY0ugObD5yt5VTPShLoM7xa8q1JEQ6FLO3yNZFzlOx9gKFQkP20LK+oC@vger.kernel.org
X-Gm-Message-State: AFuF++l7MlazBh7a+2tbHX0O7YzOVC/L1SyCHgxsMrxV7ieSyVinlIrV
	k+RN3xKwqXTi2OJ1G8mJXF6V/mC/Le+iMfLMv5vg/9RXjGhqtXcs7sd2NgVz+5VP807Dx3eSH1v
	LDPY8t2tq1xWjWC5QLzeAec+cNGqO+INWm1I0bs7OjCwzhK+PkBM+QUnaA7ywH53enEcQ
X-Gm-Gg: AYBFou1O82IqAeQYQ66zdqku9VYx8voAH2hwGUiria45s17MLDhKFQgBcj4jeN12Mps
	Pq8HUI5oBUt1uXYhf7FSZGKkL+epzARZ92i/3fSAkbwo6HTz2ODKhClak/6wapUdfd3wjsuQBm/
	CQKg1Z45thxMuWo2r1EWKTkw3BJhYtLgAFGvY+uDgG5uPqkgtcCtK5esRe8Sr5rkv03gXPbDJIF
	zish/pE9/FmojXaQmZrYUcG2LGZC1NgCcP9TxnBd7V2xPvdOdZk+Ppx9/pnaL8Y2KmaSdcv/ZvP
	z1aExKKULsPj0NntNww3JAFt212QSauaxVJuNhANWd4lMkeFdt0Kjlz9UXotyxi38k2mAEt9W9a
	PyI3UctJMWhcy3xvWCNzIbehjnk/m+L5NFcIZMKu/EA==
X-Received: by 2002:a05:7301:618d:10b0:33c:342b:3742 with SMTP id 5a478bee46e88-33ffed51545mr1451047eec.12.1790243685765;
        Thu, 24 Sep 2026 02:54:45 -0700 (PDT)
X-Received: by 2002:a05:7301:618d:10b0:33c:342b:3742 with SMTP id 5a478bee46e88-33ffed51545mr1450900eec.12.1790243680436;
        Thu, 24 Sep 2026 02:54:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625921asm12706547eec.15.2026.09.24.02.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:54:40 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:54:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: nord: Add adreno SMMU nodes
Message-ID: <arTzWkL9kTaESj9s@QCOM-aGQu4IUr3Y>
References: <20260924084805.1021758-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924084805.1021758-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: LcG3lqD4kCQAdhbyYm1OyzlZh8TIGniM
X-Proofpoint-ORIG-GUID: LcG3lqD4kCQAdhbyYm1OyzlZh8TIGniM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MSBTYWx0ZWRfX/FvhW1N8+yPJ
 fN8VCyy5B++TLNkJlkqroUV864pbH5v1aQ714M85t07+7if1XkTNcNfFvhsJjnDsdYp+4w025rb
 uBwap4ivcWNTaeXZBBeThGzZXcfU235IHQ4wD83R+TH7qyRxkA+NcPogF+EQlUHYJ3Xhr6ImtLf
 WttoYxpALrAstD7s6wmVgAFVgkVknKKP1c9s4Rhy43SsqcAnisYhGGfgTKTzxk+HpyTqsoWREhm
 tOtCZ1bLeLI6984FRvjtltYRVl8RRjl6FzRiyMhaqXlT/Pca5t3QpcbDZlr3pZKK81MTbakEf/l
 /Ca2L02dSkWbCgWXyDZzbVWRglV9kpev78LB+U/v1n+cRoBYCJac7s+5YbPdRRQQoWfUh4O7pNV
 72ijjQaol/Gpbav5YYfiS7vXAJMmKlu9xJ2Ls5qBB6vBaRPouIrGiighBa75BZPfrkOjpAS8r0Q
 Ml3aJVX5M06mqfzTXQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MSBTYWx0ZWRfX0q8JFENiqPd5
 /H896DreQUCWTwjSkaiqSeS2NlLFSWeATaubOsrJFl4NBbxgJVP4HerqhllKokmznLFFXET2Zwk
 09FrckCs2z4y56kh8GFip5igk/RI7BI=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab4f367 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5bXfVmoitGlP2aKi_t0A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240041

On Thu, Sep 24, 2026 at 04:48:05PM +0800, Shawn Guo wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add the Adreno GPU SMMMUs (MMU-500) for both GPU instances.
> 
> Wire up the gpucc clock and power domain on both adreno SMMU nodes in
> nord-embedded.dtsi for embedded Nord variants where gpucc is available.

Oops! The nord-embedded.dtsi changes got lost. Will fix in v3.

Shawn

> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

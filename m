Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3534745C6E7
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 15:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447760; cv=none; b=SrjrOgPCrwyLvXoevUB4SwGG7axwzWqCax+j9mxHFWFVcdBepHeWHEzg4ytylSiGVwGlNbwYYRHHxnxXqRDGxjGsiGxkxLyDKchotUdzZbL0fR5+8PzncYqrZgVHTZS13HLzXWthZ2W5OGzPgZ9LliXseFZVh/zkNL+o8soW6uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447760; c=relaxed/simple;
	bh=AxPbjgW5hIJNKEht6e/FfDCQU+F6mgJwY4mRccMHmDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dUbWRElg6dMbWR0p8VGoiVs1pl0kvgL0Rrj5yjv5WCVvSN4cii37YXk3vaTEEJwfhApXZEvEmApmAEOtkf3lcUkhQUSd9kQ58bNLR5DbMuK6ZMYbxqYsRTWd5K4bEHmhHQ3+C1ldYJvha4hM6op140sPXemLkzaDrAMJJZIeyhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niV6h4q+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T8pHir1S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="niV6h4q+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T8pHir1S"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAj1K707880
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 15:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VsBOWHIG/eoT3H41FqfAd1L5ODyMGMsTY1eqI83neLY=; b=niV6h4q+H+Q5VhBi
	LYH7QygpAFEOOnqS7RB3wub2fEBMJ3oFOE2NaC+urEeb+PEz9mmn+i+eZNPSjbQ4
	WEisdzwGLR3JnZWoXSH8Y/I3e12kJnT72p/GNgzzw1g+GmX0WOFEL6OutZXdRDRK
	jQvaUCUrtJYGmWdJf1P4CRdihYJcOt15o8l2pTEStifUe26xRfV5u886s2HxbktA
	FjNZtJtlRXg3OOBopv8r0PPps3iy0dti525To8MyBpcJxjaPynNXp7cJiqYoA35K
	qFeJhLbBP+Z3Er9CqjO9jeV+40mXbGWR+ZOY7ZLDz1I0+Jfhv2kmZHf+mpTzcUds
	5EFBHg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekhwmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 15:02:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8553305b7c7so1979917b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 08:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788447756; x=1789052556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsBOWHIG/eoT3H41FqfAd1L5ODyMGMsTY1eqI83neLY=;
        b=T8pHir1Skcqz+cPeayqdeA/TqD1GTh712Bw9/a8YI1CQ5smd7k1FjcNBHIzKJ4SdYB
         1NP2fOF0TVn3XazcZldGUs08eMsoMfgipFZ2bB8EZ4Ilsg8RikZFDQwYhUoUhpWSE6or
         cNGOOTiPmiXUGeNR0QcHyrK+1te1yLzR2/xwDIVI99tIzuRpP8IFxavzL3qHSsEbHEzs
         oaRlLvellRJsU5gFmxGxZFZI/J0zKf8oSNcvLoNxklAXQKE1iH7aAy3XAW3tv5JayzhY
         wXDeCGlCGdsTRnsGzXtfYG4Ss/gVspcvVPEe22+kCje66b+x2X6e9gJkPAM1Gp5Bzdt9
         7PBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447756; x=1789052556;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VsBOWHIG/eoT3H41FqfAd1L5ODyMGMsTY1eqI83neLY=;
        b=XJYrczHPQiiYEsfmSrdw9B9/Wsc4Vz39aMKh2JajqmcUhzmUdKHcaV4b9u+b0ha69K
         PtMu94W7DtLQ5Pwe2YovoR88kE2npYo+D0ysDU/6/20JbW4Elt4323OqTVBGyWVhIduE
         yMtDXGUwgHX4gbX3613PMx8zfjzSp/84CbqSq9JWYGzIPBPaXs24z/yE9NT1sSneWG06
         hxHNrWtSGAjU7zAmr2wkXuuY1PAUVaafig8fJ7LRmuDxGN+gAEmnZ/YtRPb6h2+Ue9/w
         WTlRX5y7M64nKbVbvKs+Zb5qo/N3HZI6i2bUXI+Lx++lN/7KlVCoiIiW2vxrnWtdVRAl
         4TTA==
X-Gm-Message-State: AFuF++kCGTU46DhulUUj11nJfOwEqDhs5JzI97aMdWTz2cjNdxsjeemj
	ipnK0kLEKs1SoCyU+zlPjqJF4W2G7n7wbvhVuZ39xjyi0OXRTNql705xlkc3IJojRjL2KtA+QmI
	bJjvXsbDDza0p2majlYtz/ihTOPri/JKZWyPoLjfpiLFHfs3E0lGSjf6BBucHhBQQBc5w
X-Gm-Gg: AYBFou2JvO+5ACVkzj5UjlW4Db3d4N5bvAomZ/wQDQCoQNgrCueQNhAWyIqGWXqoO7U
	SQ6GwZri3no2xDu2J/FEh/WsCqinXVgmk+W0ZN9b/OEsYfz2Uekk1VwE8JOMk/0Uel8jo3V1zZe
	fnQMIY/tGTvv5UirqlISeNIuOULWG6HehcGp7hllQxpkWhB9Q1vAfJ334Qp7F4DnT3tY5djH1wi
	WWEpj951xtdw3vG99XdpAf9qqKSbL5r24BGk36w15mBbiaBjsfOOMkos+gbg1N0dR51ZcfGjGnP
	GYPGt1R4EQf3N8pVgGqV9lnlJp+WUtCwSlzJfJ20YOOsYVtEQClbBPXISyQp5bvMIqWDhiWI07h
	UUw+v2CNA4XY7ZUbhu4F9bGcR4kwmESpIBDDBQV57C22Zit3Uq+2YKxkH2kRl97St
X-Received: by 2002:a05:6a21:1509:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3da35d58df3mr922381637.3.1788447754489;
        Thu, 03 Sep 2026 08:02:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:1509:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3da35d58df3mr922230637.3.1788447753951;
        Thu, 03 Sep 2026 08:02:33 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d3a08fesm1113532a12.6.2026.09.03.08.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:02:33 -0700 (PDT)
Message-ID: <a032745b-e4d1-409d-865c-49e7cd408906@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 23:02:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] clk: qcom: ipq-cmn-pll: Register CMN PLL /2
 clock
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-4-21c3db378611@oss.qualcomm.com>
 <219ad037-ff37-40fa-babd-21276ff23f50@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <219ad037-ff37-40fa-babd-21276ff23f50@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EQwBm7U33wEZKqY1wNBeTtLuRT7rzDLI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfX8LTxUXrR3otS
 2j915A99ih+G+PedYkEfsvL6vUQZdxvyFWBlerxuPH6+JgEz6nzSUZ3FtmzsF27Z+q3AQfLQ7x7
 FjI1WRJmxzw9i1DT8P03mEjyZk41Clzqj6ndAdBwV9RU2zamEKwFreBZCFsOJ+wJJN3hcW5IhtI
 x0l6mChVygPEt0S0CQub78sJCrXCJjdHoduP4t1lXisYnfS912c4kd1Jk50GZ+cS3jaHZxFvfTa
 sbH9GrDVcUPBKACK3Lm3PTMJ56ta2hzkY4ezgNeH6GRK2R7OKWE3yQCck8EjyfURCGT/XUusw4B
 agAmq5r5FyBIx/8s6B9SNsm72ll7iGIjJZxPgDYT1lFfGwGcYVK8zUyj8z4aeT3+sm2Q1N4G5nZ
 lmdeZbW2JwqketP1wwC8xO2jQf4sSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfX1H+8ZwCvRPo/
 mHKttaNuPhbQkw/NoRjEm8jSIt+8cLCbXLxk2TIazGUn8XyTEZHyDYvBF2GYTiC7vuMF2NPI2Uu
 IwLqn0kQXrSjH0v+3CvFRotqdBJd9oY=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a998c0c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=tiEyg7sXe0Pth-w7ixUA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: EQwBm7U33wEZKqY1wNBeTtLuRT7rzDLI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030130



On 9/3/2026 7:55 PM, Konrad Dybcio wrote:
> On 8/14/26 2:48 PM, Luo Jie wrote:
>> Most CMN PLL output clocks are derived from the 12 GHz PLL output
>> through a shared, physical /2 stage, ahead of any further per-clock
>> processing: a gated fixed rate (PCS/ETH0/ETH1/ETH2/EPHY/ETH), a
>> configurable divider (NSS/PPE/PON), or a rate-select bit (EPHY-RAW).
>> This /2 stage is present in the CMN PLL block on every SoC supported
>> by this driver, not just IPQ5210.
> 
> I'm not sure how the mention of IPQ5210 here is significant
> 
> Konrad

The /2 stage is common to all SoCs supported by this driver. I will
remove the platform-specific mention and keep the explanation generic.


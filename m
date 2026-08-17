Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788A9314B6D
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786940587; cv=none; b=uwdnBcsbkig3q7zYyYuGL563pZkj6Z+68LNuLhjPiu1ZFzxbFjgycwSgyRxyGc7pr8tMFazQjX9NOERl+zV+jU+DZlKsuxD7dkirTKP1KMXoNq3af24UjahkSUOgUMnqiTIb4MaddCgZWgg2CxvRMg31mNIb6JPQLnryYlZAVcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786940587; c=relaxed/simple;
	bh=4Eq3X4KO/Ipz33FGDKM+RWO723WANUHv1aaioiwwoIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjVixxVzVpjYCL2kRbg2fnERrp0QsanKtlTHbzuOvxxDoFTQQBZ7LCl29Y0y/A1nndSVl479xARuFCA7YmbteNuhl6BmDDOVaHA0A2DukHrjoGTYBjoZvHAvNfVGwYViBUbIRz8+sh1PM2JgPxhwklsO3/kFRt+Ko7WtNEZKsLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcLnJ4g8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2KuPr4p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcLnJ4g8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y2KuPr4p"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLDG8f1386269
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ASxHMr57CeRiHl4qluMm7euY
	Vc0vlVaWA8aqdtapJrI=; b=pcLnJ4g8fstRm2x/GdnWW2tP/k0mpFemKLTOrfy6
	LbgeUUHe+TtslOzAhJ3vRQ7mQDaLiPUh+E0KXc6TbFfzwXuRAdEdgeYioCBXT6JU
	HwNxCR0jJLS/TWO/UMZQpqbVOvtm6EzbiYKrnd1qU2+Kbb335iT0IGUjpgPqKCMj
	2IhocavzF/AgaO8LWAWIGiEkBSDSo9RedbiOODH4G2EGmK23G1lEZtc46J3+e2kp
	WShxWuQ82fQncfMMRUImdpnJMbuemr9fBfu/b5e1jN3rzYurgmNpAbeXi1nNjQ+k
	X3zY+1EnYXoXvXOcEo7joCPOu5t7tIgf1CVQbpBwU13Low==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3mx4rsgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:23:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b571432fso283974885a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 21:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786940585; x=1787545385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ASxHMr57CeRiHl4qluMm7euYVc0vlVaWA8aqdtapJrI=;
        b=Y2KuPr4pvhWgq9H54CTGFMgyn8++/7SlMFOQSr9xr/6AkHEEAcCdIchzEZyqUNpzez
         s+E+KuNIkuuyOlsPSxK4ban7qbQSpT1G1bPr+s/4p2E6beK00sEWT7glbMyRIl7kFOGJ
         /ILda0fjhaQQ1Yjh/kLdK74gn5zYhjpYaqh8u+q2VSN5d6uYZaHlOkUKq+6Hc574Uhmv
         iX5/MKxClppDanAR6NO8vujKq7eYuEoT8EtucqsE9jvqvJgjGyJAJio2ypuSu0k+Lzjd
         rHjGGi6kWjOLKHUFLh6ML43F6BiGPN8dFdwmIpQTNoZ/A7EcrI90gwBFoHMo2GxJfn/i
         tYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786940585; x=1787545385;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASxHMr57CeRiHl4qluMm7euYVc0vlVaWA8aqdtapJrI=;
        b=MUGinUorbde6fl9oaNt1o5CWcbBFWV3JrvCrm54ZJoaegmQPHxM1f22sDcuSFtoAQG
         6kaOah0yjCvT/+jBhqLqK4z76OXbenWcixijPuN8SKW0+OyLx0RG9NfeLjhn6WBH8mtn
         NTa3DLzu6LqbmbTiFnYLZjTlRw5neMYz/gDAWZg0j81WdMM+SR53/vX/0gakjVH3UTSa
         Ris3502qmO185di6cIOuGifL7ZeNubLY/zgq1GFefhuPXmkHhuKf6Cqsl2wVTGIGN4rA
         MZofWmLtbYmxyyMoMN0fm9pYdOCVYE7A/PrfjOFLJ+J0vKXNGmSDXVN+sEW2h0qEUi/F
         GdgQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2vx/iOAnaHdLorlnpHmbF47BxKlkwwPpIZFDUYyQyAdSSSHWx77w/z7dk5/HGrOOWkCMDIFHF6doRGCHi@vger.kernel.org
X-Gm-Message-State: AOJu0YxHHVIyI6Q9mT0R6dEKysf7QGsrr8sEQ9IcxYxjaJg++8u0DrJ7
	jBV/kxX8qMdWuTWcr4r9KoXIRqENGppYzUX1Rcve3QrEEHei5ik5tPQ9p1WI0nnUTlyQMxK85Yy
	otM2hCBei8UWvnB6mo5YvEFqsjJxYdy99M+jw1Rx+Cjp2udsUDM3kNIm25pArWZV+CFzt
X-Gm-Gg: AR+sD13nM/1lTXTDNqxlJDANOo6GyMddPGdiw4EbiPak/mQ/5rHJVl/8dpESAfO+NTH
	vp4ypEe+SQaQ6006iNDa7KJFU/uVxJxZfz5mXmSB2YDjBaWKluT57/e5RsAXFSj8nXFxyDEWTWJ
	vLKJ+AQiUCigt++iN9PtkEPjO+lNtf8AAumImtd5hx3MRvjD3BRECZJQdLu1Sj9oFSOnVB0nomp
	lg5xVXBEXC2iuEcliksLy8+V5xdQ26AhW4vGdBa/o0OKO2K2mOqmKgklxgd3xI7R8ccWj04dTdv
	71TPA0TOZHNwHeRo/HGU1YFHhfUzfHFtcZ3ztOs/lHCfSjGQgA7khTxBHTpLuulexpWC9EHNPf6
	Bj7N4F1KNb/Mnujs56yGojOukFU4spDsAcPGiHFiNRL9xPK1317CcRge2JnRreBRh0FEFAstzw+
	pNFH1kkvDtiidy
X-Received: by 2002:a05:620a:468e:b0:934:a0b2:9bde with SMTP id af79cd13be357-936c07ed845mr2962552985a.23.1786940584782;
        Sun, 16 Aug 2026 21:23:04 -0700 (PDT)
X-Received: by 2002:a05:620a:468e:b0:934:a0b2:9bde with SMTP id af79cd13be357-936c07ed845mr2962551585a.23.1786940584424;
        Sun, 16 Aug 2026 21:23:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cffeac4sm41308e87.39.2026.08.16.21.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:23:03 -0700 (PDT)
Date: Mon, 17 Aug 2026 07:23:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_tdas@quicinc.com, bmasney@redhat.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: rpmh: Add SM7250 rpmh clocks
Message-ID: <gjphxs6ixffy6hp3nbwcwbfvszob7hgfths3um2rnn7joiu4fi@4bhaf24xfw4t>
References: <20260816131646.10551-1-sreeshankar0910@gmail.com>
 <20260816131646.10551-2-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816131646.10551-2-sreeshankar0910@gmail.com>
X-Proofpoint-ORIG-GUID: R6WMSgRapqvL-gKra79ogUA6f-3zbimD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMCBTYWx0ZWRfX0P0lq83dBKpu
 w3cPegq/YxONF4Xa2Tj3IPYabvpEOyGz3X7Gjh846aLoxR12vD5TDjMoeJRoQq7hSRLUhAKaV/Y
 uPa5Kv+svdbbrX98mVt1qna+yuNnOw8=
X-Proofpoint-GUID: R6WMSgRapqvL-gKra79ogUA6f-3zbimD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMCBTYWx0ZWRfX9vncIUZuARTq
 H/swBofpBzh9BJCsN2oPbLTYSQs+BF58hNFjSES0A7VCeaweGsywBjOEkz93IumyGFyFUPrGsKR
 B2Y/TcbSRid1EU3945SmNl+3FtCL5luJ9DAGmjCKqGlVLHccL2ijSKuwkmFci9IBJ3sf8Vj/s7x
 S/rseN0DEXl+euo6yZOBwGetsPdrj0mlp1xS6QI4Xn1e2UY06vdEGuj40Hvwnkw3rhn+2s+bgtJ
 c6OZQWVGny/58lWKIZsijtmQUT1ImTwTef+2Q49OVR/39gSzJDUJKVh/Z53F9Ac63cAFDwXoUO+
 vplYCPk99r7wxiw3vM3X5f31yiRYo71srwkCXHVnUk60vsxfKnDzJSsHxi2VLPV+tD0LnaaAv+s
 ZoUGVN7tNR8jWzWk5X58+Tw8sTcvbtveHkEnjrez2iSFkvoFgInMcXfI5CYe5dcXIGJyhJSx5xw
 uwm0izze3FUioR4wIPw==
X-Authority-Analysis: v=2.4 cv=Y6XIdBeN c=1 sm=1 tr=0 ts=6a828ca9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=ZfTvDAhhgTXKM-HDKzAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170030

On Sun, Aug 16, 2026 at 01:16:44PM +0000, Sreeshankar K wrote:
> Add the RPMH clocks present in SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

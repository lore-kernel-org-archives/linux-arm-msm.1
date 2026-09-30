Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD30E47143B
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758730; cv=none; b=DZzVCCQWQnwJsJI8ouvRJ01qUPiglQ8VCl7DnNgtgUOAHYHO8myhHEHPQfeaj0CfTJedCtrKDnQGn/Z5B/sCa43khjW9TxPrXJdNs+1UoNUT/kuK3NkyVmYvVkofrHfEHOsJD2ogBOkjhu8wwNvQCUsRtosT9JSuysOzC0b5fNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758730; c=relaxed/simple;
	bh=mZ62Kng/0Rgnxdkn4HmMlG6Oxc+tVal1JPFn6pjaB3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYgN27jmYRasPMpoe+2pP9PKDg4wIhxGNfDPfn56pseFvJOpgkaBaH26gDhOvc1VkOUdgCJVkRWxUTO33OnGRSmUt8vUHj8NeLcCP7Y95fu+2A7oYDTr5Sc9U78ag5HJFQvqFEKAxq8wzTocPEKxJoIcTu+nw5HRlwasSPevl2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHqrHBC8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5LI9n/L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHqrHBC8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5LI9n/L"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dV133489196
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 08:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rmkFRaiiplQ+paOGLk3epfQou5738Zs3wOw+JTEUgjM=; b=WHqrHBC8V4pGgxVA
	VfNRGe3zNT/WpiNniEJpuWIi2pZQX6kET54Sb4TmmoCPtzFWuJny1SxESPsDqcM0
	Exe0ObADWSHVwWqlv+UTWqaXMrvJ+l44iY5SUGr2e9LHSnuBHCK2ggOPciEb5B5j
	ecHhtI65evHiOrlZ3YNRzSGzk2rYDOIjcrmqyp7Y+j+EGPce60B+6HNS/Z12fWY+
	n27bgDUvNbVoMTRfw9UIdjoiQTQBdyFt0ibzUyeV2IjlyGNPFNJC3WYUk7j8q43s
	cdOYNwwgO8P+8izf2v/5lR2XdJO7Hffqd1Mo/MbUFyN8Mt+t9QIvC8DISXDwJvMi
	u6pAxA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97uc1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 08:58:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso71212585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 01:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790758726; x=1791363526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmkFRaiiplQ+paOGLk3epfQou5738Zs3wOw+JTEUgjM=;
        b=K5LI9n/LEBSCGzZqqzT3US6Df3aOh/5cpCFhzkDw8Wrtoyj0NRIDrzibziWPsK8pHl
         WNwWViRL0Hhb7nIbpqRmdVKIgAWJp7y9iug2ShRxlTBwT4mepK8DTMZUJoSVpEgsw4kb
         HMoB8Rq6WSZovdM9zQgGTzAUoe8GEi2OL+0Wx5LPCrrK1eQaTOowo8Bape00SXAW+BpT
         xa3NARcDF90c773JqQzOVt+sTLR31NhweP+hthOjXxsk43xl61dObm7CbXcGhNwhENPi
         RuMikjclLF1p9+jSAiDEvMKhs3qN/K/YBQwYRYLQrpL2iR4sGbiYA302QnOjPBg595gC
         /t5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758726; x=1791363526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rmkFRaiiplQ+paOGLk3epfQou5738Zs3wOw+JTEUgjM=;
        b=joFunflNxWokaZIp40HX1oOPpbvrrP2DJ7CZRDIVyh5U4wl/wIq+2DfA2lEgYC7+QN
         kiQj1orFY05BGbiqKkBDuRSB573e3PH+oqz0DOxzSRSdCzBxXZn9wTOGgtf1JaLfVdTC
         jKN0H6cLSeEEkc9GziA3dFz9URjiycaG9bZf5o5jCWr2prTDDMGvXQUmUwUlPLZnGH74
         JP4qMqR+Mbnv0cfKZVmAJMDkdEDegG3QkwHX3mU9Xy06fdY7nYyG/DPNIV3Eac0Lc3ka
         LAgaBjg+tI+jhoGVihIyZBTTcWtr8CLMr35Q7gpmRo7p4WfD2epHjjdBgVdoTIzX+t1k
         0dOQ==
X-Gm-Message-State: AFuF++lxBFt25LoxcgwnoQOJZO14kr8tVd+VnJCNQnsUyCAZJn81+ZLK
	NHCLykza6gMBYY7jamNpF/5uy/P93qMykQl8JM82StGeJHHX3jnrnacFexU7wt7kWf5qSJ82PEd
	Z636TbFZkL5aJWU1lNF7fFVyBmty0VWA9nj/YL7nbMU3xiFfzQ3bMk2J3ci4H83PwTOK3
X-Gm-Gg: AYBFou3+0I82eC5R7j4qa7qdklbC1vbUFnCXFBEYbmH4TjCpKcu64A8b/0nZlRdLqA6
	R2GoJisxhR75iM/ctPeSU5CEHdHYLCsTvazvfRbgUwWgDzLu7QHR2gEva9Bf13LB3ew55p6Rf6x
	iy/xGTcneeSJB1YWrn1Atwt8ynfb4G8UTXqtK1GLrquXiwE8i/0bobmxKd54gjFeJTWvfRkLDAQ
	cbs2O/1oKDmME43qu5nPmClkKdPvKGdk/QBOjtnW510Bj+Hnt08zkrvP97s/ceSHvKzGlpW0prk
	hbfP/iAj0c7AIQrcOfURVfZido+mHiMoZfhmaX4DoSay2q+65cPXZTBLzDHB+G1707Kz2xIDO0v
	6U5f8vdF1uWBgzX0V1y8W6A==
X-Received: by 2002:a05:620a:261c:b0:93b:c6ec:780d with SMTP id af79cd13be357-93ca9880834mr94464485a.5.1790758725818;
        Wed, 30 Sep 2026 01:58:45 -0700 (PDT)
X-Received: by 2002:a05:620a:261c:b0:93b:c6ec:780d with SMTP id af79cd13be357-93ca9880834mr94461185a.5.1790758725400;
        Wed, 30 Sep 2026 01:58:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f79497sm31063166b.39.2026.09.30.01.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 01:58:44 -0700 (PDT)
Message-ID: <9b4eb301-5bb6-45c4-94eb-a6a3a2540309@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:58:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sdm660: Keep the USB GDSC in retention
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928-sdm660-clk-fixes-v1-0-5d5bb84e3258@gmail.com>
 <20260928-sdm660-clk-fixes-v1-1-5d5bb84e3258@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-sdm660-clk-fixes-v1-1-5d5bb84e3258@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: osPH3Iqbbm3IeHXHG3Z2u3hFNKfeobR-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzNSBTYWx0ZWRfX86d2D8wgmAew
 AAcDDYv1QL46xwP9JJLog8NOoRI3CyhEZ6iyM7bWvR4PuJBVFJfmPmz8F1quZ05uhGywfcxb7hl
 JMeKb/HO2Y3Gt0B0hagK7PKmQoWM3fxgNlPUQeWwPNiEqvHpfOVhCumV8jUXBU7eMXVSoVnsbZc
 QyREsdnGXHWKVO2hD8Du/SKjCCwIvjTOpLGs1Ji5EInm2Q6/t9NIVYL2RSolKEL/3jcExZIeEYT
 H7G+RO/NmshvhmGe91kDASu+PrlJhH7/5pRnyew3twijt01mQSX+ks4SmOQ1nNyh/C9cDB25CMQ
 F6qfhVqOQjy0HpIjOA5X1n7Ydshu140RF9J7rzfPMMX40qgg2rBHB+PLqNBCTIS1DxqQmCnrCzq
 36YF9/kqlMW1oYzqhgo6/Sni/KtnNfuzwP89QLunU15+Z912pat4/Wjl/edbEZRN02l6cR0fgim
 fwGgJ7NNLr9kC1ibmUA==
X-Proofpoint-ORIG-GUID: osPH3Iqbbm3IeHXHG3Z2u3hFNKfeobR-
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abccf46 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fhGIgCobiWGKHZvJdykA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzNSBTYWx0ZWRfX7fY8JG00ortj
 ZEkjlC4jn1wydlfl2rhFGJs8kNuhHCnRzs3OuO5pUU6s32GN1z98A5Zu4JLMBQ1pM9v/QboYCzg
 7Yk8AGR7Qo/vpG7HBGRUlgVlzWM5bhM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300035

On 9/28/26 7:41 PM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> The DWC3 glue writes its QSCRATCH configuration only at probe. When
> system suspend switches usb_30_gdsc off, that configuration is lost
> and on resume the core fails to enable endpoint 0. Keep the GDSC in
> retention, as is already done on:
> 
>   commit 78a2f2a04fb5 ("clk: qcom: gcc-msm8996: Update the .pwrsts for
>   usb gdsc")
>   commit 83fddbcc8337 ("clk: qcom: gcc-msm8998: Update the .pwrsts for
>   usb gdsc")
> 
> This change should be reverted when a proper suspend sequence is
> implemented in the USB drivers.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

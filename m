Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610043;
	b=EjgFj0GrMX+x3l+btba6IVZyQq3fJccysz7ng6yvxixJ0XTp6DdlvFud7TlyKISM7/Et
	 2Gsjg33OSEvOzAx/PV5XF7fLP57GxYPbHsZKWlWIQxzxGfbe5Vsa9eA3ZmmC1JAX1SrQZ
	 0AsWWGKjKEWH3xjCEP17IHCLdc2qEBSzWgL/GKZ4946JUBLQmj0ayzmGkmHEqqehfJkXB
	 sHB0qKiSw7IFcyVQb8lYor+8/TRH+TzaJgI+2WblfRZI5QYutY2LkkOAcNmAmMOQIWtih
	 G508sEHUxe2YXddeH1lSkhEat+BajyZ1hBuv36jkHH9IblwVIC630OYoQwS+jd35PJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610043;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nOcvMumZzN3Bc76fhfQiJYSnzdlCLq4dg/sHISVji/Y=;
	b=NqTb2SnS9fVOU5TVZCRJpcd61UB8EcgjYtgOO+M/9jlk5sS5z17KeUVWIlx9Visxwf87
	 /+gwM3idy4QO4B3TxB9H6xjJ/1N65raoTBmR4a8J6sd7dCTSzTnUnY+xu9FKzWUXRl9k6
	 97ApkN0foHIMEgKYodvMuy+s8IapEfKciKAVh0/gbwE8Zy+AzE9ei1IDq+oiK8k6pD6Kz
	 1DP5wAi1EX3cL4AnSj30S6sWmfQ/oAdmh2tLQFBuuQVSRVJfaAMgrlqZPYFXBA0DhNIrA
	 D5zxS10UMeeVNsQIqLuHiW0LudtmxotvEJeRHlIt+qsawtLchkijT0nbYEXeLTTH4bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eRE7g9cP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WxOuZsGq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA550606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA550606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eRE7g9cP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WxOuZsGq
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A28wEfL2852306
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nOcvMumZzN3Bc76fhfQiJYSnzdlCLq4dg/sHISVji/Y=; b=eRE7g9cP5PFqV68t
	f2y3yy2lqItpjGOxNutZBZForDbf4pvD2iJ0/0gWMatRpSt2Aig6WPBLEBY66fNF
	8n6mdkMe9hoi2jz8sDxP4Vt+H+Ye8Zg3bLhsYKGm2LwggATEHxxmuOHjiP1tjdLm
	7RRdl/2yvs9q5fhpb7S9I1q2kUrwe0Vh+nbpHuZsMtuV4sNRU+1GZ2NgIa2W1Waw
	bXNN+mgXFqxXc4mNqZmoK/65ejgRCRXfcvsF5SVO/S1SEdIPdWnvuAHVkCQ9+L9q
	Aur6Wo+J+lCDCnRVAaq3BfC+qvPLNQKhRV4j++xuX69mms94srrfYPeqPReLWbxR
	HFML0g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrg0c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:00:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea785a4decso33874595ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610041; x=1794214841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOcvMumZzN3Bc76fhfQiJYSnzdlCLq4dg/sHISVji/Y=;
        b=WxOuZsGq69M5/eSuRGkI3FZQWdSQjOkS7rW2QlRaLK+S6r2ZHizStMAmtMvLsY+UP1
         KXOztXiemyYri4qg2DxEIytMsWIAcLDE+ozZPc8Ik2IQf1K8LsnbxzLrREjkR2pZytBk
         0S7GMTO8JqgRwe4fVo04mbORBDWSsPbVsihzAKH8LaNq4Kfw0rpx8yVupdN7vUuUShrp
         j3PpADUN5Aep/PiF6RZiJFNrOnYbAghIClyzdVOn9T3Vbk6/YqGthutGbttSwS9vxkZI
         KrMGxLHeE1oebBuAR5iHsTmQ8dMN3KRAVeIaxNEt7T8l7xDPtZ+ZHEXay6gscPYDntTi
         AKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610041; x=1794214841;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOcvMumZzN3Bc76fhfQiJYSnzdlCLq4dg/sHISVji/Y=;
        b=OmKT2RurY4lgc4kp2HcH2m6GzG+W8JWvDRAn4fbJsmazqE1j89kIp6Ls3/MJXcJeTS
         HWIfho+W1pOPKvtkC2z7WoKvncaBOF8i+Msun5EIoK8wdDfOaxxs/6SFdvLG7kKzzHDR
         y4vkHXkeHyEjIcYdwOGR4OXCbtZRUr4/TvqQZLcpFijGmrd6q96JBQl//E5jPKHY/iKJ
         kOz695GTary7YC1i59x7eeF8K7CCDzF2Ef2q1HZva4K+cXgTzwpeC+JD8ljMQA/uuNbg
         GC/zlgGOFOBnbOHc2R6k9F6MhKigqhl5gOvVXFfgmYHlL1RgRgGlue1BitWkRS9q6l7t
         hTEw==
X-Forwarded-Encrypted: i=1; AKwUvBxMt5L7HGjp729lJFMTjZQnc97nDcwAFeromdjjE9Yu6VXy/WoWrgycwsH1JogtxWagArSw3FUBAoW1DhHt@vger.kernel.org
X-Gm-Message-State: APuU4Z/IWjBc5uEDf0SaCT0vWp7IdAmfCTUGiWjlaS2a9VYg8cSSG4K6
	z0/to5lYDi4RAtZekfeZhkMY9+uvqYGr12GBfLrWUIRDy7XzF1Difj/64l0t6ZRO7puDn+qllan
	dKSjCGof1ndOOT/4PZUhdIG3xrr9O4TSfwh/yUpRBWbSC3oJ7tpoeThpdMgdpVNaRAuCk
X-Gm-Gg: AYBFou2v+dI7DhasFy5BTO1/K+SyXout28Rjw19+6mtW+3PDbLRGYgfUxK/yvJncpMz
	HWrkSD0CiVCo0K7LVgqNyIKq/50zfk6JvcZa1FjeUAL94plC4LnI/O8sebzpTIZePyFN/BErxrf
	c4X+ueWWPmpXRWyfz/ccMvWqit+6XWI7u7LqXcckXfgJY4v+E9XVQQy9ITgtZ5dDLiNlszJ0eje
	Z1WbcJ1N4LICA7UKSTCy4o6JONDZZ6N0ygtOUGKm3/uM95f4FDH5ryLRWA+rAVe2HD90Ypsak9d
	eQU9iktO1hWIsdOOnwd8WYLXwaVtN1KN95ujzzrCISGyn209b85Ke4Zlxc4B4wWZ8XiPUQfwSbm
	+uqxL8BfqhOVrFY7sptKpFXN6gnAVv+YE+bowQR/7uj+j+1HjKNGoeZsjWv764YhkvadA8yM1IY
	o=
X-Received: by 2002:a17:903:1ac6:b0:2e9:5313:8f7a with SMTP id d9443c01a7336-2eb1abd06f0mr88117955ad.6.1793610040728;
        Mon, 02 Nov 2026 01:00:40 -0800 (PST)
X-Received: by 2002:a17:903:1ac6:b0:2e9:5313:8f7a with SMTP id d9443c01a7336-2eb1abd06f0mr88117735ad.6.1793610040232;
        Mon, 02 Nov 2026 01:00:40 -0800 (PST)
Received: from [10.217.217.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052edasm25048465ad.4.2026.11.02.01.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:00:39 -0800 (PST)
Message-ID: <c644812d-1b3b-4e66-9922-bb39342700cf@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:30:35 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sm8450: Use clk_rcg2_shared_ops for RCGs
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261031122037.565113-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261031122037.565113-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae85139 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qS95yi5fV1RryunwhjoA:9 a=QEXdDO2ut3YA:10 a=Z8N5utuJXkwA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: tYDmhugxbwRq3cvHolNtR9XuHuZvpty8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX29++u7U/LJrW
 LWndwCXa+avZWZn1tzb+LUTNc0g0zIN+bKZqe7g403IZunqnRFXKa6UU9u6EcmJWouU6P6rd5ii
 s/JNosnLz53PuSV0hyicI/p6+WbnXfg=
X-Proofpoint-ORIG-GUID: tYDmhugxbwRq3cvHolNtR9XuHuZvpty8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfXwL79YR4x8alS
 sUyRLuJGSDxWFic/wuZcraSgLRL4i91LpoXfdiUDQ5vkXrqkC3x/Cqxn8oJnLajKDC1dt0H4Hdd
 m4Hkl5jI6J0YlhgW7DbEOtOPKewTzQsqI6HY1ZSATnoyhvOEgncUpRN+QW8ieFtxlZBl1dAnWKf
 2migMYqHL1f0HpxWsGfgteuGGEcH06jzM4UmAwasqOpQEo8rijfW2QdgMHeJg2axzoiE9TmMiuL
 3WndVS7j+ItEnfNjtoVrLZXls0q2vJQ6O2AhKSs/Wnj9jwH9/yFr5/Ab36W8s9zag+2l2AtZO+/
 babl0baW3VrIaYPOV3SE2XaJ2q/1zIddKABxioAZ3PbNDxBbOI84sOn3cLSnExHFvT073Cf7Xjx
 QdIAOG/3mbkcF5EJ86KyTz81jH+bv3huzNzoVpr9xJwKhNtT+0XPxfF4M1uG2Aq+HQxyBRZS0oi
 p532tYj6/fZq/4+E7nQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020035



On 10/31/2026 5:50 PM, Vladimir Zapolskiy wrote:
> @@ -1480,7 +1480,7 @@ static struct clk_rcg2 cam_cc_xo_clk_src = {
>  		.parent_data = cam_cc_parent_data_9_ao,
>  		.num_parents = ARRAY_SIZE(cam_cc_parent_data_9_ao),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},


This is not required, as this is XO clock source only.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>


-- 
Thanks,
Taniya Das


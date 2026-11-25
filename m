Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601198;
	b=tpruNjHCThA8+xawPyKC9UUdEuJbYx2BFkabCzm9AcGXUa9wlFz+niIRsmly0E3O29Vr
	 2YYHCnJELI5iRY6MW53zfPPg0/aw9rwCWUPZNAQbM3F6NDwRRDghc7OtBnINRnwE4ymXt
	 y7DM7iBlRxoHpL2o8f8HxtQUjSb38bBWguNT0WzrhtwUS/i44Ls11ZBq096uOz/WaAgq4
	 JvY/0XvTxdNQdhKchpr/cJKovNUF8cBpFrnxeHw9isiLofCpr2xy8oplOgcVGzK6O1mJF
	 uNIrhqX1fiObFfmrSLqI4jIC+ViPEWyPGb+onVVMQUYJotyaKodOnQCPzqf5+wYGGFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i+qX1LTo3z91ny//6ym+Y6Hu9qRNdKNFMdFVecYgBqw=;
	b=ExnROYQLoOrN5OoR3VL50OmzhlyZkMeXRzi9rUUQrP8mNTxCDOR3tk5zk346MgxOWYAf
	 hZS3RtMiXpnhz02+mdrGfwGbFYVBkLOMFGNNjeKpD8rVyc1BU2PZoWSERTBrMTAvBUJlw
	 sox06uIssrGAs/5/o5u/GSxdTx+LnJPqj2yRQitkOkv9s1g20XTXa/tFWnF8W//54Oizp
	 FccLvgfNFDCDspofpFHBiPMywdRvP/oiXJvEji4+2wkw9fHcWNR6jgoA+dsUaHiTr3hS3
	 aACA7q3StBSIIAM+dP3F14IBiUiT5b12Zz1VltFHe32+RwCflrdicqZGTzYCfdB2w4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FtM8jcNu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q8ua5MlD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C426F606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C426F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FtM8jcNu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q8ua5MlD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTTX4034159
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+qX1LTo3z91ny//6ym+Y6Hu9qRNdKNFMdFVecYgBqw=; b=FtM8jcNuqXTceVBY
	NbLEGpJWJTPU6Hn/uqxdfp35oXWFXMArCvjCPYodx3ScBW/nqYS6nj9UmyPWusU0
	R72bY2/CvkcoBqlxxQ2Dm2h/+0okr36Q6EmSVAvMGLonhVF9OfErzXhm6l1XQ63C
	5bztMJIGJbzLo9HOeNweMRdindBxJzaIz8e2dYU8gjzCWpkgEMMqSd4z0jsnWtPJ
	K3ApGKCL/MyfMzuF0sg3+lTqzehGU+NLV2nq1uikczk86jZXA0LCNuIrPd3QEGjw
	zXCRti95MCb2fBaG3RZgOACiiqSfWQkz9lXJlZHEE8X+k6oE1DIR84Cmwti35E5d
	h8YZSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbj709-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:06:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495f7e03b9so54361185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601196; x=1796205996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+qX1LTo3z91ny//6ym+Y6Hu9qRNdKNFMdFVecYgBqw=;
        b=Q8ua5MlDt604OTd6VeFhRkm+JtxTjgKYKi9IroxtzJA/+qnCzCKZ2Qk91BOCi3Dh93
         aTI05lHLbl4rljk+3X6p7Zjfa9Vv3pp5F7HXw23MPVjcvoJwPfJNe0/NVD5QM2gbOE8I
         rqQ9XU0Z8nwqfS/gcOq79WK989TOzX6BRVQC30NMAXZARGoJAZyhrAWqQqB0o2oYx8sK
         b3E0Tj9tueuYUXmGv69Okw8LKXWaI/ZMHFXr8rgil8PlltmjmP4FSYTWAO4dcrWNVETC
         nlpx2/tzGY0qkscv4CJMDv6sbZChfNBP+/cqWvV4LD7JqMwIm5NWPrv03uFqSsGjmigk
         HtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601196; x=1796205996;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+qX1LTo3z91ny//6ym+Y6Hu9qRNdKNFMdFVecYgBqw=;
        b=SU8IeCQL312tJSeojUI8fpFhYU4WcuSTW67h8DHlJskhZS4Y+L5+B3VGVtiMBlgdhO
         CDhxRrMOcovB43PBc36SjedF/4kKjXK4TPFDIO/tPakSabhzfFClPjWXbvgH0Ix9A+Sm
         vcXm1ef6CbrPcWfGUEfdh87VroqLrVeGaE8TyNs7TFTrO4k/4n9bADAyrqIuVwOpSoj/
         0Hot4QXw2lkSl9bLdMne3YAZ5qsqKRB9tbH+E3kssvOK4z4Z9ljijik6qvRfT05MUbpp
         u+UqSjJhvNNOP+UKqJeXNe+zE7ZHTZPQhAhFkmwAKlpQvRqAre50OgCbjUHrmq7Bw6Qb
         JBog==
X-Gm-Message-State: APuU4Z8caDRELT9O8LpVRgFCt57welIvvpRFlCSzp6+wVnc1Yd/rS2tC
	1jSluCKuJEmbBncgENzjLspJr3PtOgp6g1QPeolRq8N81oLLChetkosuy+ZmLVxYjN4E/BnB82W
	pnUjDGP8C+EF9tQJK27JPIY8x/3e9VbawZ6u5xcEtfmyE5d/FlbDoFac4k2EfK+AHQKzh
X-Gm-Gg: AZFdTZcr7R8hZPjYge1YIbU4pta8toVbIRg5ci0fJzW6Ey9V7id1IXe/77N2HgmvMXK
	F7vzr0VnALTh2kIoCi1ecnZJwJl1S8cmZu6M5l+xnwIH8iNuhvTPprahUPPQGk4mAAjgH6Xougc
	5K2cnbSN4jAzJKKyR9kNefcRg3GLpCOj5Qpy/meVMhqrvuxeEVqN6v/vNSZrg/LTIIqqvdI4gpQ
	pW9pymCl08hi1Z9lCcKVM55nvk3gA41YXu0ucgXb/5DDGsg3KRm5xeWKaFmncklKx1MBE6ghF0y
	GLlnZxcr++RO76NJED9dGM9QH9QZVHovlICTKkIHBdxyDFgsa3/vuFwiQxu5csJ4tT8pEWZmdsy
	o8IEmu88jLLbJpPSqLwXRatTEJ37nBH6tYLG/t0Eth6XZCSW3E+qj+Dpjp1arCvp/39rQ620=
X-Received: by 2002:a05:620a:5408:20b0:949:ae35:480 with SMTP id af79cd13be357-949bab50fdbmr3023307585a.6.1795601195987;
        Wed, 25 Nov 2026 02:06:35 -0800 (PST)
X-Received: by 2002:a05:620a:5408:20b0:949:ae35:480 with SMTP id af79cd13be357-949bab50fdbmr3023304885a.6.1795601195554;
        Wed, 25 Nov 2026 02:06:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6663esm621139466b.21.2026.11.25.02.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:06:34 -0800 (PST)
Message-ID: <4c1de002-0243-4948-a175-997ab9f4db59@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:06:33 +0100
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
Subject: Re: [PATCH] power: supply: qcom_battmgr: stop faking battery presence
 on Glymur & X1E80100
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20261121-batt-pres-fix-v1-1-2e8b2cc98a1e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261121-batt-pres-fix-v1-1-2e8b2cc98a1e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXxlO63mEc/Z9T
 aC3XtU42ivPv8nXK8NKrDIo+0l+TekOaEKxQHooPqoY7/zaVwSSOVEAWmTWewJABe+28C+BFRb9
 0T9/wyc93fFvP8etxwXI4imXb8Aqoq4=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06b32d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ddAWxhUWpO-MbGeArb0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXzHR5CDSugua+
 uiJf23flSvnURlbnyxNKlHiw/+e7tnoqHeno+Yw9ixAAwAahybEq8Z6Kv6UsyAFOydi7KzrX18j
 vUivVogggQp1VE/gZdeJQJJ0j6b8y7jrvk67Z+X7qoGCN8R5z9PemQjGoE8dwS/kyeokwJW7S/+
 h7MUMDDKWMnN4ruGkRr+z0oTbA7R0fyyl05u2jaHTV24U5MWRWovQ+vWQOdhPJ+D//EhbAfAqEc
 vO3lAh0VPCj8+8G1shwa/O7dyMqQmPwRWkg2rE6s6hNeZ9HFdvUjrCdTWMrO9CJIVjbj8deHiWm
 ANnpM57sdg446OdyBmz1t53MtIgBUI1jFM/oG+fefaNvBSkJ3LocyGVFQ3cHbfooR+mu63UYluK
 Bhl6fdEEhInbXBHFtenLMQQib0Fn6pjM8M3Yf0fXXAInkHRRQpCY2nHtsZba8pb2ze4i4qpSCiA
 bhINlCLlklluwH1iP1g==
X-Proofpoint-ORIG-GUID: HUAX5i4eCakAqt_3G3JpXOmFBMWY6OXd
X-Proofpoint-GUID: HUAX5i4eCakAqt_3G3JpXOmFBMWY6OXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

On 11/20/26 10:32 PM, Kamal Wadhwa wrote:
> From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> 
> The qcom_battmgr driver unconditionally reports the battery as present for
> Glymur and X1E80100 variants, even if the battery is actually removed.
> 
> Fix this by fetching the BATT_PRESENT property via the
> BATTMGR_BAT_PROPERTY_GET opcode from battery firmware. While continue
> assuming the battery is present for SC8280XP platforms.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  drivers/power/supply/qcom_battmgr.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index 69473ea753f6..a5262a7e8836 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -557,6 +557,7 @@ static int qcom_battmgr_bat_sc8280xp_update(struct qcom_battmgr *battmgr,
>  					    enum power_supply_property psp)
>  {
>  	int ret;
> +	unsigned int prop;

Please use reverse-Christmas-tree sorting for local variables

[...]

> -		battmgr->info.present = true;
> +		if (battmgr->variant != QCOM_BATTMGR_X1E80100)
> +			battmgr->info.present = true;

Let's make the condition more specific, i.e. "if sc8280xp"

Konrad

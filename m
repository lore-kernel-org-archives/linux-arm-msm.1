Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7168F3BB684
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735497; cv=none; b=ot62Z3JKBXmSs2ckiNstZ3yZ6+53vcET6lk7DLJkughtH70ThfoS5ymRbQOl/J47aEPAS0ZuYygMCQ40XClnRu2x4sGjv+LCkJWlAnA86lqPA31GFxhcBaCOKRmjRN3TMfpXkS9KgwCsYflv3Nf8zKRKIcn3d4IGCdm063BuxEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735497; c=relaxed/simple;
	bh=ZOGT5dUC6Rnm47HFVLH8CfdqgxNOzrfjBCVUzDrefa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u1a/af0UyAO4LKN0c7YmD5v1SOjkYgCsj1/YjbGFBi2eqNpjvsTR2dXo9lTx7d1FdMGhADr/Vd5ufnCZVD5Ew6V7P+btwua6bbPSlXcAAl2CmSnT5+1534DQA7oW0LaLFQGnbo6Dndh78QIdf9fz3YCuD/hEeYEdWKpLaIyc2yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=htee3Q/L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AN2L4fe1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="htee3Q/L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AN2L4fe1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6S5LT4189856
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVOIFW8wsSxMpU9OuswIxO6oXHfoMmQNkg0fEYStYcQ=; b=htee3Q/Lh3ZJ5lTY
	eyDwJ43kHbBRTOg2Gn7rO0XdSt+r5V7OKMUbweOv9lNqDiDo0LydJ1FI6dhqWr10
	w8T40lF3pXas0mrTb8myetoInhKo3in6wroymTNzHMhAwN77DqpcZ7nHTT8hROGh
	9qRVBmYFuq8jwBId7eqzc9Dr6sRBEbjK3mpuCKSY2Oe3ESbzQ5/ITA9HTbgXlALF
	RTlXydU6zHPILMGNMlw/gPxuru4Mm6cC9fgACc45OFN7ktp4sKpv15fIj+tTcMz8
	t2q5dy9VLA+g9lb6NZiMKcuf4E6IaZZLDu86C9ywnikMh4Vigefjkm9wfezl0/hl
	8PO95w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9cgpuy0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:11:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ec556b441so9731cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787735494; x=1788340294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVOIFW8wsSxMpU9OuswIxO6oXHfoMmQNkg0fEYStYcQ=;
        b=AN2L4fe1bDcOI9QrI77YOm2v8HsVVDBkzRh20VmX5HXATWs7jBP7loSjTGMwG4qV1x
         n3umphtIysVqKdSktO7SD+cNKwtjvqKmfvpBOWbZ8BFPEgi1+yAX01OQ24IM8MnVfVTD
         i35pWqF9zS/S1Uy3XTmZQDvmszOuYvIq2Bs7f5Hq1CTXW6BRkLMByVblaL4K/FDad0Ay
         Bf7VoJyi1BCeZgHCeWBJx+dlas0Kc2wK/7/bckLxiqc/h4Ls5ET2CeVgY79Q3JY5luJt
         aRNbEw40bgLircII8lixmIdYXO7xYC5k34pdLcxEvrmCcYzMFGCa9GeB2VIKqPUj1lUw
         O86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735494; x=1788340294;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVOIFW8wsSxMpU9OuswIxO6oXHfoMmQNkg0fEYStYcQ=;
        b=dNiLR+jajBYgDcHLGZR2KiPo/XWIjxkX9MkLumoihrePmZYI/IYgQnx/sVD6ThTOF2
         3P3cXSLqJWJAcNuD5hel1CcgWz38dlmjA3E7wpJBauN6gzWxQfDpLFszWG1U3qygmM6m
         GsSZvng5+hJumNP4UTsgDhlUq1QxcYtCMGx9Prtn5Gxqe3/LFm0H/EJAwvMnLwNvksY8
         Bb3TjVfgwaCoU7A2y6xCR23vTcj4UaOOnc6dReLe/qVPfXhAB3Y6rVYurSFzuOSXKFmB
         YHd8JUxMjPqYvMc0a8ZKDQmMaNirEFdDeMlvFDWqJ4/xv93IB4uJ/x6vmL8KK4PSE+sL
         VuYg==
X-Gm-Message-State: AFuF++nH3jEWSk+sGD6E54YInYkoyKSa+g2dnXw5YTY3a0CqPo39cjkJ
	xLmSgNRmuD8kcQEyHMvh+G4QYi1O+k5s0ffFlbVe5vKTBk7GaihJUyIsv+BqhsYNh2V549XG3m2
	Vz8o3kr8fMwbEVNYlJ5hQaGLGsk80BFCo6FCcTRMy9Q9kv4lOe5PdsDKFsV8UWO+o9svP
X-Gm-Gg: AR+sD12Ne+ycqLRIOZ9+rrd1yY+m9bw4XeZxuwwBTpeS3C5rCJYosYrwyJhnsuxMg1s
	TV4W6pmUF+zsQ3QDoxr2FhMUqg9oG4G2KvYKdDO25LRu1HlREq35Xn+/4yBvBxX9RACohwHWX7r
	lx+wfM7dx+wkuqeBITvF4zx01AE7DOk03er34ylPnHu0p/mNEE+dEmwHrX5Wav/GPzG9/ngfsw9
	2K6bgjIvzpTMe8+ZzWABqFb3q6hYc2cXb3oCn1hhPCTBVYvwy22h9Obm7ntswyDTG7Ip5nHi54n
	iT5c1Ms+OODOKfkqAnAdpC5PunwxbErxvj2J2T1pGEjTVlCPPzxwcUubhdSOI9A1yGhCqivLT5W
	aBk+tN94rCBc96+eZB4xMiSlN
X-Received: by 2002:a05:622b:11b:10b0:52e:467e:ea8a with SMTP id d75a77b69052e-52e467efa7cmr10644751cf.1.1787735493699;
        Wed, 26 Aug 2026 02:11:33 -0700 (PDT)
X-Received: by 2002:a05:622b:11b:10b0:52e:467e:ea8a with SMTP id d75a77b69052e-52e467efa7cmr10644551cf.1.1787735493309;
        Wed, 26 Aug 2026 02:11:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5e0701sm401036566b.12.2026.08.26.02.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:11:32 -0700 (PDT)
Message-ID: <72be72cc-57c0-4b17-ae7d-0b28752bc708@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:11:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: shikra: enable ST33 TPM
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
 <20260826-shikra-dtpm-v4-2-8476223184de@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826-shikra-dtpm-v4-2-8476223184de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E5V-447TN32B82DnjwGOx20OMpNOVnkF
X-Proofpoint-ORIG-GUID: E5V-447TN32B82DnjwGOx20OMpNOVnkF
X-Authority-Analysis: v=2.4 cv=I+NVgtgg c=1 sm=1 tr=0 ts=6a8eadc6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=yLgYBEAqgqfNvTdY-4EA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3NSBTYWx0ZWRfXxivwVNHFPafI
 iyr8sfLj0N57LgtVGKE1aF01tN/jFdsqv8/UEwp1A/PW1f3qFbD9eq6BLatLJctnAAERLT734JT
 s9zgn9H0pT5pfHUvZn1su4fLN1gwdRbeHMym5aAkqF31q9M2J1ehjdaS4Yi/V0eJpOEL8Jw0zLU
 05chj+xUuc03nklcwekXGlfKMlOTiKVxbdiXJOaRoCjho4eN7cIKkudRVpga+oyNGQw7RFq8PNZ
 omXVUKhaVbXwk9mTAxj057k53Dh62LpXOClAnr6qclb2JeYosFHaUqXno+n9WHtPDjICHKiCHnY
 qZh/L5yNOAZYagph9TiMbrPu9Ib4JsgwNzfWAbb9zLq8gP1u1KbNht0lrwem5Xo1OT1+fQg16Xf
 P2rZO6rhxd84MvrKoRM3ALorheBcgji+Vsk0/WX+qwHoFrpie57gbsAGKU8Ve/DINXSDp/V+MW+
 5Z/aGw4QCB3Wokf2rhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3NSBTYWx0ZWRfX0MMiA8oMkxon
 qNyrbZLCpfL+0hEJCLLg2EAn3NNpza4rms3RD5SiECWQktk7n7w3L1t+B9KkktCA5PnvjrUhmoJ
 vkoB43lYDhqJkB6RgTKDwwqeLXbsSHQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260075

On 8/25/26 9:13 PM, Khalid Faisal Ansari wrote:
> Enable ST33HTPM TPM over SPI5 on the Shikra IoT EVK by adding the
> required SPI and TPM nodes.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> index 6eb4184f7642..9f3a880e95e6 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> @@ -12,3 +12,13 @@ &qupv3_0 {
>  &uart0 {
>  	status = "okay";
>  };
> +
> +&spi5 {

Please keep the alphabetical order of node references

Konrad


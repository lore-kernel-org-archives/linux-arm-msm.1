Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235677;
	b=LQOkDNY+ndC0be3RmYgcbDa7N+yr5iAqagW7wgeFrNWJidmHQWjJxJ15QRWV5HjnZecL
	 TOq22IZ8yfLVqOusQvgJSpyVVUFYT5j/rz2QRHa4wzNI0R0K0GA8RCky67/Q+0xuy6TqI
	 IZhn0yzGLf0WwdCgle1YpQMTKRCa+okfQU1ED4w2RBGRsZKPU3jZOZJ3XCCXca2HN9nXU
	 tTQDIX4qzddHUxU7zZmzqqtufDeTQFmdgoYxwDhZFfrzFRccQirTY1ReCzHxdjNfYCt/+
	 IBhTiirKStJ3eYT1n7sYzedq8HgIdMF+FAuoF6/6y1uSw+FyQrIe7odLWawdGty/A3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235677;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8S+tQBGffx4GavU3iQOwkuWydZ1DqkTiSiHsOGPzy7s=;
	b=0gOLgSjno8Gag1x0ZVty2Td8ORNHuJ7PZQnRfUF4QKqD/3ihkfnrnVtPGiLgAqbJpUns
	 XbPny7xixB6y6T4jZ44MAJj6fH9eL25Nri0wdEg7YrtXIQjYcvCSaTENmkWGKXoJIzn0y
	 Bn6T+0UhIkUBhepY8HK4O0ohdGF5uKJ1KfVEQCB6wP0mofp+RjRxb4boaUI2Rb0TkYu+W
	 Ap/X2L9Ma/hVGaN7VULlPNIDknBzGMCEIwYEFddv6H0wOw4khtH/I/NV4zLZGeh9Yv+0Q
	 X4ALBaU+Ea+OlGBTx3UHjyiLLCEj2DV6C8Pnw7hpCANuVSVhx6O6ngPLiipk9LujsTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V+4ERrG5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DdDGw81i;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2B9606D826
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D2B9606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V+4ERrG5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DdDGw81i
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF4Vq334842
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8S+tQBGffx4GavU3iQOwkuWydZ1DqkTiSiHsOGPzy7s=; b=V+4ERrG5i3T8g0Fd
	Is/6bobd+s8g0yAgT8c5rZRtQeeTMs+UNr/k0xVQZu5BNGkn07kkYc3GFwGBdtfz
	JLXYbROt5NleJlGxig3qsGMChILhk5Z4FCqqRbrIjzagCTEvdWQdFS/fFFk6WTFI
	uDzWWSpqUNF3Hw1uQD19qXqneF5LTVK/saAZEWmJvYq4kETLsY+77mpmi18JtOuv
	uvkrQ/fOKX9yLnC34jXUpzvfpbh7xR7hHNljYZc68x91gD5lrHhVpp0SNtUDceeX
	XjACTel0HmBAMWfM+WOOsyhq/wl+9SLTUdt/OC1t7YgQ7ofQTdZgLoEFYxi7cp5u
	fF9ibA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf58nr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:47:56 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5edfa7703ffso40744e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794235675; x=1794840475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8S+tQBGffx4GavU3iQOwkuWydZ1DqkTiSiHsOGPzy7s=;
        b=DdDGw81idsDaSVqJdnLFw7iYk0LASCh6eDnLvNFODhpqbsOgT5XiqfP7hKQ/kK2+WP
         liUV43mHTt/nHfUgG0cAD4E3vmKr2mKLbFWZikdmH0uEwmYZUeWUVC0bYuegc/HZxJZm
         o0ZPV+zOceM2/xNDPTld/Ir5qz2FyMiEzln4LC1R7IRLWElWAqtzyRsB66UG2r1x+S3l
         A4yt6ZAe0FuVfNfME3lW3sTIR04nKgTDNwwivCcw/q292HHf71kwV9BuVleExMUtK6IE
         1dCBKJE/zgAXnOWyYK7z1YeMTNmnEcTCgHL973r43sBcIV/i2CoFC2XAf+dtuXETFFi+
         ckzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235675; x=1794840475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8S+tQBGffx4GavU3iQOwkuWydZ1DqkTiSiHsOGPzy7s=;
        b=xa+KXdiHrPSMYzWro5Fa9ELPJHDi9tivJ3lvkk9gU/1ubtAsDwhOPXVIom1cI8Z56h
         +Sam7tJM58MlaShN9d/GPPgoFfT8S9ozW4/lxMPrsjsVaLnoyefGhTwb8I67ITLhu1g9
         Yoi1/MyEq1S/uBoPz0H3LbitzFbkK1XtZJeRmE6nLZLdepBuHf8NlEVwMXEwczKsegxK
         ZF9GMb8QNSQxg+GlFS0aXZgOk0eSYIrJqBfe4X08ESFUnP11Xq0FYFVUtlY8V9axn9MB
         aF/0+WR0NW9N2/uWyqveNFbVsS+6ukNEcSaM2fvvC5dIAzLJbtHxgVD9UQ4eC1B8e9uo
         iwBw==
X-Gm-Message-State: APuU4Z94sQS77iaSyfGXGKF7M8yJuDS28HQN5/EV9jPZyyCNdiRbn6GL
	RS+HjX6eRblh737WHn/UWpHEq8BnS8Ej2B6S6BFK5XiGhSgHTDkHEeM3w64/hwMeNaUdLPjAWth
	uOdguqhS+n4F0zAqPx5qpddl+VVM81DmAjjA2mLO45yGdc5qANb5W2XUjjy9pXji+Mgqa
X-Gm-Gg: AYBFou1Dp6wDW6d5hk2LAyRfVy4lEiArAWbAkqAlIpl6R0QCQIDEVKlLrGd/Hzj3gQm
	Y50Q1zUihkF3yEThVVOr0R6LNtNjw7NF04fiKctEyibTmlJVwqaAwq100xlA2ZpMBsBvopO9pJo
	/qymN27eMrY3afo4TyyWZh79649Qlks02TKVCC2Is8IqmF1uwi0EvF43eJGqMoYChOKHO5KJ/5F
	IFGAhukcKSEXufB9pOV6dlVo9PR6k1ttDnotxcMEh5uZnEKkoT2cX7zit4f+G2cQDVO3FXHjMJ7
	Bn4Z5b9CVfXa29LSvG6mB2apggECg5Y8CYeRH+f6gf3zD7JaWUNhwCrQxBQZSI5I1oWFRM7yx2l
	erLJhJweprkBWnlMydi9cUp1V8CFgGrFzpwO7IZTMsqTK1oJhnZsZUyBJuV6cbyl6kisDxA==
X-Received: by 2002:a05:6122:62c6:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ece74072b6mr1736235e0c.5.1794235675533;
        Mon, 09 Nov 2026 06:47:55 -0800 (PST)
X-Received: by 2002:a05:6122:62c6:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ece74072b6mr1736221e0c.5.1794235675113;
        Mon, 09 Nov 2026 06:47:55 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f9384csm180195166b.13.2026.11.09.06.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:47:54 -0800 (PST)
Message-ID: <8015c245-5bdf-4088-bdce-7e81b3fa440e@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:47:52 +0100
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
Subject: Re: [PATCH 4/6] soc: qcom: geni-se: Define the QSPI firmware protocol
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9wdqSJPaM0ZiFsUV5eUDZUytVGNuY_gd
X-Proofpoint-GUID: 9wdqSJPaM0ZiFsUV5eUDZUytVGNuY_gd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OCBTYWx0ZWRfX7Msoxh1Kt5nH
 Ta/FuAc5sBaOLkES3YwLZ0QR5b4T9u8+NH90TdjLjqVstIvrst6IpMbYiUJTbGAa80snPYXQ0fq
 hlSx3OBnWGHBQBC0akHyvN265EeTGPM=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af1dd1c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=AQxZ4Z-7SMcdX-UDKNcA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OCBTYWx0ZWRfX8khazA4e/sHv
 h3PARWxyHvCPHpNGJaPHZ/p8mY5SXNtVXCwiDp/vDYkm6oRPLzxFBECDtAvuGjEM/rKIfNmw9Ic
 HKo+JZsdIi9LbO6vawyts0xHWqUHeDy4rXqaTEXH/COMQvJ+Uf79g+E+1p5BSvXk5HSXxNMOFqR
 U3yiUrGRq8w3J+n1DKFr6WSUMFov6/rUDW4i9s78LcbLq/dJzEd7Zz2ru8YAO1kVtqFclwe8KIL
 vJn39ajuUumcONGNig5ACqvEQE79r6N5EYZpjgLESFXvZitNPaC4YBTtP9vZBkr/BROZ3nx/9o6
 C4MZw/Ax2YSd9XSu623mk6OSiSGyWEeXUqyt1llXXkuyhixbRcP3APILQaK5m29xQiExeqajZT8
 5BjzfpGFWofhsoQ/6sWjUfJiUPIa+PDwZPQzs5GqJBnbigW0CZWqQcit2wDJn3lgkreiwtbZM8p
 g5iDcUmZq21ZDZkCrkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090058

On 11/6/26 4:01 PM, Jyothi Kumar Seerapu wrote:
> Add GENI_SE_QSPI with firmware protocol ID 9. The GENI SPI driver uses
> this value to request QSPI firmware and validate the protocol running
> on a serial engine.
> 
> Extend the firmware loader's protocol-name table to accept QSPI.
> Reject unused protocol IDs in the sparse table before looking up
> firmware.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom-geni-se.c  | 7 +++++--
>  include/linux/soc/qcom/geni-se.h | 1 +
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 873bfbd6b2b7..396f3d81d292 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -122,7 +122,10 @@ struct geni_se_desc {
>  static const char * const icc_path_names[] = {"qup-core", "qup-config",
>  						"qup-memory"};
>  
> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
> +static const char * const protocol_name[] = {
> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
> +	[GENI_SE_QSPI] = "QSPI",
> +};

Please use designated initializers for all values here

Konrad

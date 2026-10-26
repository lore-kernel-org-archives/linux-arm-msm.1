Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023764;
	b=AUHP/DWr3pOnzJiI7q9j5Pkg++DG4KEWrKdLRo6KQDRedtC7aGVc2bwJCmyTiyqL+q3C
	 qrvlrDfraBANz8cE8ZFB4cIIi7EXlAPKhHF2F7g+n6G2O7obM4sUq43Svk3KhleFJeIXd
	 gD2VrQS1UbUC/Hbxixhkqmo2ez8vzKmUICGg1sLsc5AR2rs6yz+ry7yKo7/e36AcoT5cy
	 TS4wdF9aJuQXWhJz9mK3+WZO46IWGcZgtFfLFA0iLoqQV6WhQB3Ca+t8uEBnm44U3/Ymy
	 SIpA6PQRSFgaDImbro7Ldgj6lpMK6gKILUFvm4vF0p5y8WjYOR3dUjdpqk+ZNnuVzww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023764;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kjExBJFPJ8m4Vc88gOC9yuQ0s1tBLMjZRS5SoMRwaFI=;
	b=XDbOF6O7KlO7opDBKXSld+T8cjrLrAXv6f/4/JrsExoHixrY3+w6igaQdXp1uKUADcLG
	 es0pWI7KblhPCtvwGboh7GffAY07DLXTDG/hvmOyYCrAoGdVTnERRNsGgJmgSkhbaLifu
	 UvPVTVtfaR2aU27bhYPoZCk357e+2UVQvsBtL0mK0Rq7bsBjE+Av7rOb4gNeaI1gZhNGE
	 VFxJgVUIkojPAJSM9qh037/bJkJWku1eOWr/RGjylgcVDRQeSzefFdqwqZHoKbEkev4x5
	 mbfIFo9FdQ4M6WDgprlzY/P+BHhmG4J+k9lTcOb5mL8cP9NgBSL29RiVbOlBDmm2GxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aUcMW0tU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Owk7BbBn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F68606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38F68606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aUcMW0tU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Owk7BbBn
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QCtcZO3349056
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjExBJFPJ8m4Vc88gOC9yuQ0s1tBLMjZRS5SoMRwaFI=; b=aUcMW0tUHWN8HD1W
	dpe1Bn6fpeQNb3U7MLe1+zdH/rGccWVqU+ga8nwyjOnD4at0YsDtHtIOmGUdA29o
	BUgmkfZ5bIn+xsqujuniL9U4ku9o2N+Z8u6HfFabm6Pa3f2AM05l+Q6fwvzFuAWf
	ZeQTNutR++4ilP/3IBmIN56q/LKITodwHih4/EIpBjgsX9fo1XP/iwN/DCNndISE
	M/JSu93FuyH7PQABjBC4beCuBMwVpvgSLFj3RZhFT1a8GHir6PNaqlKCjIkfdkO2
	gYRanFWHxQyqe83KBybbi7vLKFruTs3vVulAfWfYi3rrPgiBTPbh8SiCAwPC5n5P
	jqyCDA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xr9hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:09:23 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ead2112f11so85864e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 07:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793023762; x=1793628562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjExBJFPJ8m4Vc88gOC9yuQ0s1tBLMjZRS5SoMRwaFI=;
        b=Owk7BbBnazj/kmdfpqpodZNHpb+hi5whsWKvGo384vGRXqp0Po4sVkSwDdGN8wUe2r
         rMicgKiGMI4lHMM3fwEfg6+qMYyM+OnEd0QTnGEu77EtPIpQ3MMx/n0OmwcjT0ZlY2q4
         7pemx4QjXR01qIWB15jyoZyKHTbGsETyXymF9qhpxrN9Z61x/D9g5GcTO/fMKRFgDlZ7
         U9UdVZMMe4p5ugAXSJnaI25MGrV/C32ZMUa6xO1POug/uerYjM3CT1Dm0BXLDrOQ/ICh
         31D4pPM62EHLhro36vJ0Mr3Ao8LQaP1E5n5Og19VPH79y8K3bE4JAgOq19bKeLQJ5xjT
         FqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023762; x=1793628562;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjExBJFPJ8m4Vc88gOC9yuQ0s1tBLMjZRS5SoMRwaFI=;
        b=PUlbhuIVS9lR4uI47/3gQtUHytq/uDLKJQ43PGqGPlOpPDSzVnRFhg+jIRE3YfFB1m
         VWWjK9NqUp/u/eMOc/IXt5402rh+uazZNOgqNFEJQcqy3oBLQLTTPRQnFqkaHVnSH97r
         CuB3WqyJM158R5vlys/zJwF/yBdtJ35ybu9lZRPOf+XT5N7D92r6DddB5FGSRMUyQVyB
         1pDq8+8Hdg3MRSeLwgEsWWwd1qFml33j7rirXQIJLXk9kIec6nVnpKx61xBgjl1x6stE
         gXBQ4Xr6E+F0YV4NRJXkRUoPGrM58SX1SYTgOzEOVxW8uP/3/znApLawPZVU26eLmJbb
         +o1Q==
X-Gm-Message-State: AFq9FYIeZ795TexSR7P2L69MkoF6EHXcEGt9YK+R0rPPOjpEYqdffkXX
	bQoewH5DH2ioT+OsnD+wF1eRquHh5azNs9IsMLS2SM2W8EeUW5yEpWHjm0ostlRyguIOc0HKx7b
	CESmHvIb2LCr+Ice/3N9qNkc3yfXn5v7X+nMN9p2fhMGeyusn5S5tVP7Yh4PqdUB+6n10
X-Gm-Gg: AYBFou0c9GeD7QJrWv60VJ/B6ddHDs3nns4bsziCqIUdzEeWDnBOBNvWd5m8UkuZmNX
	Jdsm5lQDnLJAuktsBJ9zFb6lPMp1j/Y2PpfRf25QF0rE76C4J6dlziNF6IQt4B3kmHDyUduu6WA
	Y8U0mdHk/FKJanl/NMSnstOh+1Jc5mNeNGuTb2OwCRRU2sTQA9n3w4oJCS1mRY3AMgghL8Bx1cf
	TWkZxRLZBX0f2Q0UBXn6HPDq72+E5qX786lxl2BvFZ4HSp1c5GgV5hNwMpTSDDiTCfWOgGqO9bf
	3cmuN313HNH3GBXOjwmpGcBUjDTUtK3hbUxAW16ZE+1IurEspjwESkX7DcWb7+ORXc4ozUM085k
	db/x1FbSCQFYh6e4NdnWKZw==
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr2052706e0c.3.1793023762364;
        Mon, 26 Oct 2026 07:09:22 -0700 (PDT)
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr2052661e0c.3.1793023761845;
        Mon, 26 Oct 2026 07:09:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7b5d54sm321487466b.86.2026.10.26.07.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:09:20 -0700 (PDT)
Message-ID: <14fabb77-ab9e-454e-86fb-e5f8d0d686e6@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:09:17 +0100
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
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8450: Add description of pins
 with MCLK function
To: Vladimir Zapolskiy <vz@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20261023163057.775917-1-vz@kernel.org>
 <20261023163057.775917-6-vz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023163057.775917-6-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: m6iMz1AicvGTPMohc7xSuPUwjJkabqcd
X-Proofpoint-GUID: m6iMz1AicvGTPMohc7xSuPUwjJkabqcd
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adf5f13 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=euT04gI7HyjAtzR6ms8A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX4G/XYN9QNXca
 V70+86Rdzdu0u5blfcceGxXH3c0GP+zPxM9DzxBi8H3ngZ9OrV+efdn/0yAsIrnam3R7zw7LyRu
 u09fLuDO/nJR6/SXI07RbTj08xcdplM1sdq0L8v/2DnBqVPHVHlFk8Dk48d0bvEKf/63THOhjfe
 dWLy5vCqu7j70jv8s9TQoSQmjzGWL6tZWWoTG0hVtmLRpwXynflTgM8ETuG86XQzyCIHzsKC25f
 N+d0rxJcfB0/s5WFOlWvFaYrhIOKTXlW6HC94HoJ5x8hhau8y/4CY8XlcqSgrpzwrhLU7vDBKQ9
 dQbAMVLQbLVcLaXKeYn+mkg5tLzfdnAoWcXdJMgXY8iRHIMLeuf5vbI8nuTQU/1UzpgV4xbP3ZU
 COPxbdZxV29SZWXTlNyloIBtklYkFcon5s9gETXkPW+o19DICI5slHRAi2AFUij+zZ7GGqyS+Je
 mbbTwUWiq1zizJ/u0dw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfXycGLhwNDxtWg
 J4MNGyu6GcN/VYPgvw9wyXNlGmNYrR0VGyftWLWYwa/bxS4SHbMkUNpX9jTNKpJbJXLoSfjsERb
 oFzndF1wyrP7RSmuxQ1pCABfjpNCj9Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260056

On 10/23/26 6:30 PM, Vladimir Zapolskiy wrote:
> Qualcomm Waipio SoC provides up to 8 MCLK signals on GPIOs 100 to 107,
> add the correspondent default and sleep pin configurations.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

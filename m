Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBA03F328C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 16:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736615; cv=none; b=PoEcFovmoMY5ahKdwN+YGaXI2L5d4G54KaHez0/K3Q8d9JUTzvd2O/OU8T69/xl3oCtvaooFDOqKW1EhQW6Al9RBH4BznnUF3CD6G9obADG7PCn+DpK/alQlhs/kz9kxoQB2QT6Iyar8g2tHKbzfEf5Ap9z3Ft5AgFtrHYm6JYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736615; c=relaxed/simple;
	bh=ygsI4zv/jW+3AX1zDcDFKyDT2frDw4My01kgEz4hjOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=utM6xpdBzFVDR5nQBMUR/kUElmYFEfQPWVRLuFjfEcHBVghX6bVUAJru/vO1uksbCLBfRaAMw2aE+2uK7fGTdqed5fUnfms2DsUKaZu4Ll9Q4SDIloMmCAfpjocznG01hVpR/Al/P664rRcgTcEZkkRJykGzFoaDo4r4w3PIAWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcVkMAgs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGMuTHk2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcVkMAgs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGMuTHk2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MFXp9o1259130
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 16:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9UqeA08xtr2nYCM1EGeFESAXA0YISWIb/8TTe1aDw94=; b=pcVkMAgsaSsCHVhA
	uoc6RFvZ8ScHTvSEt+1cCYKdWiBxCh5gCx8RF5CjewSL9CJ587SBR1WV/sI5ozQl
	7VWLOK+T8QT8mfbbgYGYigw5cKaMimgjhPSbslZCpDLpUlr8E9EE/I5Z3iV9AOIa
	CDVndRxFhTgdS2J3ARS0iX8prYlxxEDn/BXOPphfJF6EOYF02hvCONtfKxSF1KNu
	NlK5AwB4qM6mSNVZeh6xaxjukqT0Qjf3Rp4VlF0qkIXcCzMMs1mMX7+bHEhia3JS
	CMx7mMzvwHdyRX5DNDgWvMwXgb8lpjjvr7LUuvTgxtlBIsygvoXGi6mkD1Rt12Ck
	s3DAvg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu79fn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 16:10:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca860baea9fso22400727a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784736562; x=1785341362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9UqeA08xtr2nYCM1EGeFESAXA0YISWIb/8TTe1aDw94=;
        b=ZGMuTHk2dpU/J5nUIXAEYdx5TAWyFKog0OQzfgaKktWoXiexiqjLHB/o63rlKRu1qQ
         WsqubdlEkdziYNIsyKchOUfXGXXY6jcfCMNcLJ7jobBGIV1XiAMOtHypuR0px9F3gIA0
         Chmruka4149+8gwj1ROiUDGNpAEi8ytsuvYP+W4Ho9f/y0JKTiaHbuWtF9dERMDCrMKC
         ozco8hc6/dcZ0AtAw4jQv/lRVzgXoLBliCz61rZfvOQ3Z/kh0yg1hyccmjmjmZCVvhao
         9N2wR+GIZ0MCVWfkVY26I5zAL2iuqy9y7RkKGgUy1yaU6dxuvqVnyWKAhVGZwppDqIo9
         rvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784736562; x=1785341362;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UqeA08xtr2nYCM1EGeFESAXA0YISWIb/8TTe1aDw94=;
        b=LSYnF/et6Nujh7part6nQHKRM42TcvX35nIx9dAHMZQAjKFH10QqQ98cEZ5OBGnt2N
         KatxSDYEQJZLppQE/c+ysU2lcRB6hLHm4uOLM6HS+iA3iaesUMyv5Ro6pK0VZRLqIAKn
         DIUkjanBwRmkPkb69rA2zg4MxF7xg5pavKV0tJXuIZlcNFJAnjiqYLeZvkHmq5OwP6fz
         O6ZWAyWH1prUD7yUJCjk0+VZXK+xXMrlczOpVl0Y32ZmwvCCNHDndJItw994Zha0AM5G
         PzR2rpWjdTJZPClFMH82vWHKzfETp+FtTH3AghpT09tFftH+lGLnFut9w4gTlnszvxpK
         ogkQ==
X-Forwarded-Encrypted: i=1; AHgh+RoB6wKILwceKDcS/nisqaNNXL/Gp6nUT7Eirmai+IhpaNCoxo3dXZ0sZu1S6XoY+PvLUKAguVdgNuGSme64@vger.kernel.org
X-Gm-Message-State: AOJu0YwvcvsVYqkTYVbV38pGYPTOylBJD9AaN5ZV6W7NILZVBwGzYFjE
	UDyc7UJYS4MlC1Nn6cbIho5Imh5O/P2mLy0vNfG18MGOTYKyCejYw3fINX9moyyFPvYAY+6i/I1
	yMdD27gWtRhUWP/eqZApKODGElH67hWi5fsmtTQcsqrEPDG+LvBXBvpgXkWaVqtdCywz2
X-Gm-Gg: AR+sD13a3s+UBF2k1mxcytdyhHx/5IT0QiNFz2HDPm5TcWDH2eJL3dhjITNTw8Y/io6
	J34y/NMAEH+Sidgh0UPrPNku5K4G4U+ecIC3ZHC9nFNieDjo7amIfi16ZucUpr2MkK/Kv++cl6L
	vgJOlzGWhqC9nXZyDcYclZow2gphjrA6G4TsbZ2VwvlqMjokzzE4z4/FpD+OQeCmb/WpgSGTOfc
	FhySRIDPTJgPijPgkdb1VHbgUTBHHRKiT9hIKd9EZGjK/rdR/UOpOWeNe5a9BHbdSzbuLvaHmap
	V3p30KoBtRLzPpMA8DZIE5oeAgu387e0TH4ku88X3r1yrrUwNIpNGYy8L5HYNOmiw/erPJYmhqf
	vpcdahZA/C+nlw8zlH+FZmpPVTOWliRA=
X-Received: by 2002:a05:6300:6702:b0:3c4:302e:803c with SMTP id adf61e73a8af0-3c4302e81c8mr4231482637.61.1784736561809;
        Wed, 22 Jul 2026 09:09:21 -0700 (PDT)
X-Received: by 2002:a05:6300:6702:b0:3c4:302e:803c with SMTP id adf61e73a8af0-3c4302e81c8mr4231428637.61.1784736561391;
        Wed, 22 Jul 2026 09:09:21 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.203.111])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a6adsm10322604eec.6.2026.07.22.09.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 09:09:20 -0700 (PDT)
Message-ID: <b99f7d35-c54e-49bb-a477-577ef61ef553@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 21:39:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/10] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
 <20260720-shikra-dt-m1-v7-10-7dc99100c6dd@oss.qualcomm.com>
 <5houmyc3fu3grxqajn6ivucct25yz34p66lwha3icmcuj2fb7f@ypz3r3mqwzwe>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <5houmyc3fu3grxqajn6ivucct25yz34p66lwha3icmcuj2fb7f@ypz3r3mqwzwe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kQJDAysFzFCppKQcjKKCXxzr6WFjvrD_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE1OSBTYWx0ZWRfX4QmUhFuMvCpI
 BY/K4stH4AhhSMXmVrwzizz4C0LfQlUaF0n1VLzZamgUREjY7v3qw6KzJ6U0lCqKbVRnR3H5InT
 9C/KsW8NXkSpE6CFF7LW4FIsrRFoC0E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE1OSBTYWx0ZWRfXxAzNnbd2IJyp
 W7BknCmU342wnk39bTU7kHz52//mNm66V/A6/N2HasGke9R+GxOGucfEjzvrhciDWctc7FfQgPX
 GStaMZGfr5RX1YvX0RrlNgc9jevKJ3DzR5XtdjDg91Z/AD9YPbJt8niYCzXNB8VOQvTXz8Q0nYk
 R+lDJzzrt+CkSjIYRD4c3z0AQ/arqqaypwEErP5Wh/N9ZRXBVjoib5GmC5hDVGcsZQKoVdlbXgY
 N4GsT6rWBW8jjBycHv71TW+lZXxrl9hPDZufbJhPCBsQ9akis43G6VmcXIT8dQ4/mftqqU+a3sS
 zqcx5JhtHT/DAZq0H9NMH26KUDKYRUIhytrQp3j0w1oqC5TycKNq5Y1D8xraJg+B/kYIyo/SCID
 DQSy0HAfeI69kf+K67m4iY70ch+T0K5uv0oUz485ehogy2FuBg2Z4B//VaZMCi/FWY9YJ9mE/nY
 qAM8WOKJe0fudGphpIg==
X-Proofpoint-GUID: kQJDAysFzFCppKQcjKKCXxzr6WFjvrD_
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a60eb62 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=WGt2SA6sb8UO62j07QM/GQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=aBxXs6P8EyRdFk8ceQ8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220159

On 7/21/2026 3:49 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 04:19:26PM +0530, Komal Bajaj wrote:
>> Add gpio-reserved-ranges property to the TLMM node for both Shikra
>> SoM variants (CQM and IQS). These reserved GPIOs are inaccessible
>> from the non-secure world and dedicated to fixed functions.
>>
>> Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Who is the author of the patch? Why does it have two SoBs? Should there
> be a Co-developed-by?
>
> Other than that:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

You're right, I missed the Co-developed-by attribution for Anurag.

Please add:

Co-developed-by: Anurag Pateriya <apateriy@qti.qualcomm.com>

Thanks for catching that.

---
Komal

>
>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 6 ++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 6 ++++++
>>   2 files changed, 12 insertions(+)


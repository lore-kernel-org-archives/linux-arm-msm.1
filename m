Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631671;
	b=xCH4qv2j2vEDE/qsYxT/8pQ6zCztryPc6itnbl5yj/QkIwFS36UaTUFjnxgdRkovQ4+K
	 6RjGyLNnKtj7XtKhBPmZVXoBeXkFK5Okig/oD4kvtNXh7KOdNL4tN86L8LBNH86Ulxwif
	 0ksSI21i5M2i7OSRBkhvExtKeBN873WDKIDt/WxW6hOSrlREs1i//Hq5vL6/OxkfBVvI4
	 s948HMNteeCK9ziVilg4tLIjkiCF+7CAce+WBk38xqzykSzzDh4j50O5Av+XaW3WBuLc3
	 pyHHMqUvRt5L5uvWKAAKFKjce5q4/o7zwLUNSrjxO5EMDQ+544uw3ExQipPJOEL1TFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631671;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=74G6PGzB0IBFkJAll8hZCGBsF0CZ9KcUm25pSQbMM2w=;
	b=mpFXTrOwQ98018mEoZVXLpqR689+xB5G9eqvdsntN1GElmg72ohz278e4m8LkzAZqmn2
	 /EjjKEvAQIWoRke1sjkqi+3tfRkLdCvoIgrlluHNpL8fN6lJnUgh6jQTgjFuN9FED6/ME
	 77DGatQlbay+wibKZRc4FENueIEmS4HT09e5nsYlfxIfIkXpUFn6uz6joFnC/bOQMX0zR
	 iYEe1QculWC7VUAwFW4WOB8W9n6yeBaCfTAnjfNGCADCge8zQExlfEfAQBQYAZ3E5XKMN
	 BG2lpQNr4tm7NU/Gk9D5SdXmz/Ogu0OrKIQ4sTOm6zAitXSlWxLk/Tvt78gXL+Pq8rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YxM/a2GI";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Mr/ylzXN";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9B5607F11E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC9B5607F11E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YxM/a2GI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mr/ylzXN
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpPGq2449079
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	74G6PGzB0IBFkJAll8hZCGBsF0CZ9KcUm25pSQbMM2w=; b=YxM/a2GIs/doYuxY
	9s/3rlQo3QvRMfIZgFux2lufmjx/sz809/lQTjbejlauYOmewYUvEEFr10MEp4hn
	1LfGZLRMWrbMeDoTyQPElGaQ9kNWTSXvvaFu6cX0Xkk3TXuIzrfpQmNscMDzsa/l
	J9bOknL4EvV18r+f8ViJEFcMbcTkcytuPdOxYMseWDftiPvvwunIQJXlOBf/8U2D
	WDkN7m2/T4Yw30EUQ4lMlKm6NJCZlT7u0YZVQm6El6N8S2xP6sfuhmfY+wWM+mJS
	Wxe/gM1dZKZrzOPKlNKpHDhY54VuUO5kv3cosfxswUH7PLyi3TaUxMRzo04qSj9/
	djKkUA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4j81q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:01:09 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eab0ea26afso100224e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631669; x=1794236469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74G6PGzB0IBFkJAll8hZCGBsF0CZ9KcUm25pSQbMM2w=;
        b=Mr/ylzXNgz1Mzjt7qZwbGrilQCNE3766w1B0RENkPY+vT+krL7Xx/TWue0at7nsrGX
         7JIQAxLzOC7c1AGfBsilCypzZTW2FDtgLY//c9lxFkEQroZ+87zEUgptuGAP2ncHVjl/
         JFujXZVFnQGZi6DxM+cGBXAzwDaiwapf5W8OBk7vuDGlvJpi/AV7o1MkWBQbuXzmYmPW
         9iadOmmyulzUc2L3B3alJhTNPitXUvrLS7gEX0BcG9BUDmfggiuAysW+663d2yuhAiDu
         6YBLVelmBgP6yecqxbhYKeUEKHTya0nAJHIKeWNJYAjKCgIaCCFkHIz9airVt45kcWek
         /RZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631669; x=1794236469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74G6PGzB0IBFkJAll8hZCGBsF0CZ9KcUm25pSQbMM2w=;
        b=UJEbof/YpsX+FwVIqryhXeaIrb3EpN5HtHmM00wI1KsQiCgTDTkXUSBMnkI/nwLXys
         MswAtJ7NriiAc2VfsjlW+kOMVaXrmAPA+ZdR5pCM/T3bpdRQY0l8bLamQzWAnN7zpLSI
         kDTNFWZ80x3yKmQ5/+BAT9SfQ5rxKOKtYzgwNwFYAtZwWpQj9oQOORcnOkje2w8H4UX9
         DNoNXLJPGKK/qYRkxgLVQFu8Z7aLXwJPajOI4ZbEjUe3zMfm+S0zs0T8XUKY1cygtCuP
         aflGDrXTVQSIhpcjt4smmAHxtNhNKHobNVoN6c6bBpabewcnHUh+Mgxz+HaM4n6qayt+
         wEvQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3ZxoGPf9ZRI5mbtM0W9uhn6y4wIu63AwtBm5tqnP593LWrZ4r/nCYA2vrZUIi5AI3JDdiCcdrGLW5d+pv@vger.kernel.org
X-Gm-Message-State: APuU4Z/PtQjStnh9jdW5GAdpHBgupcv0wL0VuCwbA9sWdl1yuOt2sgI+
	LzawJ+tbj09dSO7ZoY+KSqTOYTWgML2qZOjUqgjYGYeaorb//1BKUHBh2+cKff6rFeIJfe9Oayq
	mm/6UzW/mcfxacOpyffzBbC4NR/ercZosySMYXLImdhVzIzwPnRhlgPovb796VHEhOxFa
X-Gm-Gg: AYBFou3WM9udlGYHAr8fcRx6XCPc0+Oz0Llvsr/tkb7k0PdQx5Jqk7fy5EQRMJOYmbC
	o04tzXgDFhwTB95xQD4F6kjX1wV9rmF2QAemVgsFXqjHqcBwn6j8jptINKYwtzj0Pl/oVO44kKf
	2HBJtz6jurKZBn7kx39xslxkg1r9eoDLbkepaT7CZgtEkMbkxASIrQU/Q4owXOszc+xoUvapIey
	r5qFvHjKS1K25LCmf6tFmxPRmjCJSV1XxFfl11mt+xLp52jP+i+gv8MbXumTBFmhsgZDUPZe905
	aOtWnZto3aJxaWvc8h5AsACpVbmRcySi5yp+UDutrcS4TAl99GLCvS598A37IaBPvzpesU5uuYx
	P541xBZHwulFX97vzb8oMQ5loogCnvA53CuCZMLzjEjM01pLzNeMFrOaJjCf0BLYM+Mp0SA==
X-Received: by 2002:a05:6122:2b16:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ec6896981emr4312282e0c.4.1793631668560;
        Mon, 02 Nov 2026 07:01:08 -0800 (PST)
X-Received: by 2002:a05:6122:2b16:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ec6896981emr4312211e0c.4.1793631667906;
        Mon, 02 Nov 2026 07:01:07 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4cf60sm403326766b.53.2026.11.02.07.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:01:07 -0800 (PST)
Message-ID: <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:01:03 +0100
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
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eX5eCRvZw2ju5ANinN6DXka0CsxNra7n
X-Proofpoint-GUID: eX5eCRvZw2ju5ANinN6DXka0CsxNra7n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfXyvPgYK2Tcztw
 Ce3hoIXb4aUU+2GFfLM0J+HdTcVnsOGwVjX8CSoH4bSIh/eU+vC4pLEVSgQWaxq8J3VOuWxbbon
 F2L46I7yb3mxTVghxB55rrqxvecTG1A=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8a5b5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=P02pymlBJQeI0XzeDM4A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX28dvbcDSNVr2
 mxe53L+lYRQvqRgNLVIwUVsrnkVeK6jkaWTDrqmMv5b6DdhmJ7Ik3L8Iu5dueA+vXx0qUcV+OKR
 RpSRhRy9IArksxj4uowz3/mP94J6l14XxMl1ypWcc8mNd1k9QSoKJPnfEKkR1JatMCROzsqzm95
 csZM1ikuXYrCU6TFrgUX0znaTqmdmM/GtZ+4HdaZXMhzRZqzzgxNm1lQjBYviHNc04DnwpIqlHO
 hXxvRnCXW1sTDlxgnxuKfyKp97lvmLTFvrLKnce6asWXkvepqOC/tKglGSLajmK4l53AJA4GF8q
 aaAzO4S1QYReT4wdTPGDQnHDBMIegpDq8Xr0rCJM+x0BAtJn+8szAD1k1+e10s7xriKk+suXcqK
 Q3HfnckT02ZqpJovk2jrwM+FD0Yrna5niDaeZmu06bFBWiLDA7wqz0So8nIrSEgJQs+sKUEagx2
 AMPUrSusFI80z3ziyKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020059

On 11/1/26 9:04 AM, Shawn Guo wrote:
> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> 
> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> and DMA queues.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +	phys = <&serdes0>;
> +	phy-names = "serdes";

I believe this holds for both GearVM and embedded, so you can move
it to the common DTSI

Konrad

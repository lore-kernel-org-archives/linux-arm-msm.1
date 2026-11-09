Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242745;
	b=lBNO2dYXL/XL29LuX1bG7v7grMqQhawjPCbwuym3+n9IVJMyApyclNIs8GVjn3ylubeb
	 T1usbMIZHGzwkpZWCB50eNcoxmG9fYgDmrccyvQwnybWgcOZHZCDYa+YSlSQpnRIQ36se
	 pRIvSGukINzFIjBG8HInO0l2kb3chP0fM6pNON1F/zM+QkF7vIld4kjOc2F8jWt8GihZY
	 ZJeCz9RhisLXiE8tG9Xk3XuYiiyvbJ25jGPPwNr9kW+FJ3TbUrVhQ9qbJ5bZLLHcv1Kv/
	 Eqq2KQ1cza7KhY8GkPbXWbeDbh04jNYZJDXWi7RZ6Zja+0w08E7REgGCknJjd9/Fn0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242745;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VBx+pQ4H2H3adUQa50cH2AZAKCnEvci20+6PQw1MHT4=;
	b=Y8TVq0ya37ZGQ8XnLVp2RHQpaoT6r/l1Y5KeC6ABC7Rq9dA+sWLOIlVXA6ao8iSh/O0w
	 lncKSQDHkjgI1ligXzyNl0QOxdl2LA/SytiAYpDr0loeMCu6hCnyFaQ7DD641pyXuif0a
	 Lt4cuButw0Hy8BWARDGf5+RVf9OWtrv6YTm2HYc0TFGNUuu9xXluDzzVSAkf9mOLWJbtL
	 35QVgc6ThZdI2b+Zg0JvGp8yt2eq/UerKymKcATXMqDcvmlX1gBQYxWIKr3DSL+Qf87LC
	 JFBqRW1ZL3pOWQqa2y5+ROwa5W5D5Lt7QrbaAWCgbpZ01vFbX/Y78V190lm2hCU3m3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z9znmG26;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kHrtfwZF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25688606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 16:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25688606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z9znmG26;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kHrtfwZF
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFUsr359963
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 16:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBx+pQ4H2H3adUQa50cH2AZAKCnEvci20+6PQw1MHT4=; b=Z9znmG26EPaUKSEV
	VRmBdJyuq/dFZiiTn1J2Anbbvsi4om2vKXrB51eY2pi22iW3s7MXTtByigsccPqU
	rOTBswiRDzhk1/Pdgh/sPuXwW0bsjZ89D0S0Cueyfs2L2fxwl7NnhCrSulkvepbM
	O2KFLbserTnhvUk7KLKVorj2eQNbC0yS5EpJA8vDz2246cgugo9CWPKNh52oKoha
	QDc0a0ue27Y9ssBfOe8zk7IruUnT3Ku2hSp6rAcOtsCuy7by17IGXgre47d9HMB7
	Qu97Mp2Hz2vxE/OjDX07IPjKVnTA6BJ1JfSXxKZg1wWHYmEnNiqP0y+LOU4awjtX
	MLjTXA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2jkxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 16:45:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2381055eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 08:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794242742; x=1794847542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBx+pQ4H2H3adUQa50cH2AZAKCnEvci20+6PQw1MHT4=;
        b=kHrtfwZFqd47WfddUOdWZKA/pr9I3C0Mjh5EpKkgM5wYv+wYIdMAD8eboLskQ2D+OE
         R10tXlf+XCJ3U4KLHiCEIl4WJ0z9k/1rpPcU5sIpQveESP2qbB4AqO3Bew05Yqi6JE8c
         q+Ka8CBpY4U0AFE0+3tw7XK6m9mC5ystpbynrbOYm30NaWyfYNXmQf0OLHUqcDMHU3wl
         9TKdyZ/pQHrVlhpNdTZZmomKW/TTeDZDgq0bCYcHkffvrPve4iNrtpoqV+o/24XlUK/I
         LauKMk9O9JYrYRDetrmmhLEFrSgx7W7PGL438LEvR2bMVoRfOnr/erTr1pVWtZ/LDO2N
         mpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242742; x=1794847542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBx+pQ4H2H3adUQa50cH2AZAKCnEvci20+6PQw1MHT4=;
        b=flFCri/T7OiB6BqoMlXOPoFVufn03LWInipkBy222niFY+QEmGdXZfXx38zOng7fOp
         KfBvzA3jq0v+3mWjnNbSHSN2K/DKYCSRsz9j/wPRDQvNXqC61SjTTSp3mrGlq9LkLDj4
         U9fkE0veijD4rOT+vu7Javzayvi630NrqSPnAvVPeWOOmcxKp+G+ea8LDin/xO8zEZFr
         fPjY28ZohmFkGiPf+t+7MlyUbNyWrjpVmStK96rf42+zSYLkZYMF77ijNP6yWUZur42y
         BRlTn065B52nNYIpufdlf+Qm8HossyxexjiRuyRnozCKaS3fNHxOXVtXxG+Xt1XQggbS
         zC8Q==
X-Gm-Message-State: APuU4Z8tLAAxuWNSp7meZQy5Lk2CU+52RLOsY+lxIcnLcztTpubbPaOx
	reB6KT8sbkBVSUpqFeMZWtXNf8Kui8RmQbCG2Y/dxgNfc721PvbmbERGku5AFz8tzUyPoCItP5V
	U17+MNywTifRoyT/SzWVRGPpCRiqx3aL9wPVh4C1ywP1JE0yUETU8SV18s3XuoX70CqJv
X-Gm-Gg: AYBFou27HmHvdROjSFPO45Z+4wjUfSRf8jKnRxoS6Sqtry5reC2NkPiYh1dfjj58Yoc
	4pyxW4FVmeUN+GjdDfu7i0B/QWw87Ae/K9dqYOUPDifR8pjCbz1E9mUpyhVrEVq7p3t9g60QR4Y
	cGGcxkv2gnYyy70H/XGLa7kI/HU0vAmM5o+otLP7MRYR9k8RjyaycuS/5Pwf1z3vkS4Et6jerSw
	FXuak/oLeFmzkC9fcuMvhCPP+Ub9gir9XzAytbG+ueVeBQDw2yfs+gD12urE+xJVHKgSh9tLEfH
	WUcqADzkUa/PXX71oOew4nsbFMEygfc2LvTCk2NHfys09/26JngIaQy7FeUfe9+eVoaw9/f61a4
	PHHu4kwv1J2mDRg50hxBxs6fDUpb8gk7/h52jvghvyLwMOruEkZsWAbZzhSjegGcJbOkwfjlBJx
	7agEvm3JsXl4BL/fZOvr1UJ2DDvYb8B5E19Q9ZH1vq0rtdBcOgX7Q=
X-Received: by 2002:a05:7300:6822:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37256bf17efmr8459335eec.23.1794242741975;
        Mon, 09 Nov 2026 08:45:41 -0800 (PST)
X-Received: by 2002:a05:7300:6822:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37256bf17efmr8459297eec.23.1794242741349;
        Mon, 09 Nov 2026 08:45:41 -0800 (PST)
Received: from [192.168.1.66] (164-34-238-49.southernonline.net. [49.238.34.164])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372660f385bsm15132197eec.20.2026.11.09.08.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:45:40 -0800 (PST)
Message-ID: <37560f54-ee44-48a2-aa33-5229a4087ccf@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 22:15:33 +0530
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <8015c245-5bdf-4088-bdce-7e81b3fa440e@oss.qualcomm.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <8015c245-5bdf-4088-bdce-7e81b3fa440e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af1f8b7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=rh678R6S33b4aGV2lqlmMA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rLV7qYPEkEEFJh5gh6kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfX23w/uQpLRI/2
 fVg6ocLBcpRsddnt6tcH7rJG5B4RCq5OdigUESuXlfvCPgjMcxsXiku2K5oK/PbrhvfaZSopeQc
 kpQER0fFuWORVcTZiyydTQgjCA6sePb2U7Gp92O6Eko4VKWQh6CreYQoOCYWjknWJwE+rQ+HbuS
 g/nDfnLiBMItrLqJujFQMbFOhFITqKZoWcaaeIqEbzhh7JmnR+Spe9mwuuBuBeFMeGXIkH0cNwR
 uY93EGRwPbEMIFYWnJiXmp7+4W6S8Pf42rfPReqaTUyMGce67f4zQrj1YOJCU2ZmV3GBEkGSKJ4
 UDY9hx6qWpscsTWyEQ3erkUT7UYST/mO6e3ge25y7VINRskkfAQfmN8NikDT45h1FxK09Dm24b1
 rDWeg4vXpasgqaoGTmecMjcAMJMDLgwEirSWPY22khdCJc2wAPk55k1Pe/al+ZsxPbvuubgmG0/
 t62N8u4XMayD3ilI3Kw==
X-Proofpoint-GUID: 0zIUH88ZvkZY7n9ujNSRsPNJMTNdDnbN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfX6jjMuA/b1Quc
 8lYWYRFGPrIyd8K2le33t95MdvRQTSCdEi6HeD2y4Gv0dxOIq9UVetRZLMfXCKvKFi0eTqh/HSa
 zUqiKrQz7YfnsekbLThNrSP661/zuKI=
X-Proofpoint-ORIG-GUID: 0zIUH88ZvkZY7n9ujNSRsPNJMTNdDnbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090066



On 11/9/2026 8:17 PM, Konrad Dybcio wrote:
> On 11/6/26 4:01 PM, Jyothi Kumar Seerapu wrote:
>> Add GENI_SE_QSPI with firmware protocol ID 9. The GENI SPI driver uses
>> this value to request QSPI firmware and validate the protocol running
>> on a serial engine.
>>
>> Extend the firmware loader's protocol-name table to accept QSPI.
>> Reject unused protocol IDs in the sparse table before looking up
>> firmware.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c  | 7 +++++--
>>   include/linux/soc/qcom/geni-se.h | 1 +
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 873bfbd6b2b7..396f3d81d292 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -122,7 +122,10 @@ struct geni_se_desc {
>>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
>>   						"qup-memory"};
>>   
>> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
>> +static const char * const protocol_name[] = {
>> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
>> +	[GENI_SE_QSPI] = "QSPI",
>> +};
> 
> Please use designated initializers for all values here
Hi Konrad,

Agreed. I will use designated initializers for all entries as mentioned 
below in v2.

static const char * const protocol_name[] = {
	[GENI_SE_NONE] = "None",
	[GENI_SE_SPI] = "SPI",
	[GENI_SE_UART] = "UART",
	[GENI_SE_I2C] = "I2C",
	[GENI_SE_I3C] = "I3C",
	[GENI_SE_SPI_SLAVE] = "SPI SLAVE",
	[GENI_SE_QSPI] = "QSPI",
};

Thanks,
JyothiKumar>
> Konrad


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5302851615F
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983813; cv=none; b=XNnFxYU4b6nRFp9fmUgYpM2D23DGK9n/qU37b/giKEZcRNgk6wG8G2ERILiRf8Hb6NTKOy9Abq8CrwE5UDvmPqKFeL5BtHfPNmEVBeQ7LZbNkRKVf+OW1thpwwPMUWJzKo6E4Tg7SoQ020DjY5nwRbmEBhxnMbg+NUz17qOiKYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983813; c=relaxed/simple;
	bh=4npBNmQefRJR8xa2dduSk/7pfLxfCk0b5l+Y2SHGdY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PVVWmtDXK2FHhXaqMYIJyxPxZk2nnlrWKGmzkQLb7n8QMOWCraFJNMA2ww0vVweS5kWgQDHVbWs/+zUOY8E/VgwlFGQLSG8jDkH+Z8JRZqz5wOhLnS9UlkVxPwq/+VehWou938gGjUQ8j7AB54OXy3lSvTUnwPyG5yMWaVMyeBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePLoD1qo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IrMMIjVz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePLoD1qo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IrMMIjVz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAR2ci466227
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	93+igLrbXqmsFz4NTS+REhHzmDb/+QOuMx8GvI1OmbY=; b=ePLoD1qo8aYjB+Eq
	BSCyJbqRcMYtKATzRMCaEgLzrVsT8eqXcN7htzjwQj5Wtz5tGIDEWRPXeBGnZ98y
	TbtIj7wVHcYdMTXVqiF07GOIhNdlrP5vVT7mGStDwUZRsdKHcY3JdNb+s/zwXHR5
	s3+S5uun+8T3d+UytyB5kyvv4XKtPhdfFw7cClptDONYTDWR0L4PgX3iwZHjjOP/
	X4VCvcfD2nSAW4VPUbyPB6WQbJvt9P0i/vQWYJrFzFe4ksSVMsgS95yXy2aM5YIR
	HTXEmbwQO07lQ9qmx7IcElCuuM+KKLFx1MOxxWyXKioOhIiiB2EAnHDYyUPnFWtF
	TpTcBQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80crmbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:16:49 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e97467c334so6594e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791983808; x=1792588608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93+igLrbXqmsFz4NTS+REhHzmDb/+QOuMx8GvI1OmbY=;
        b=IrMMIjVznnDRsFjzNCaTf1Ol/3SuMi5tJzLdfr9+McbSr6xhXYmG50+lH7q2cN9LlL
         nuNxzceKe4ULUVY/vQruoedEZqiU2pVx1D81QigHQt7U2UqWPyF9QVKzsjtOPWbzAc84
         j7+ZqrAff97d9ToPV1joy7pSj+qrUC2lzsYgL0J5MleXe0UmDHsZrbqhkSphNG+Jrm5d
         x65me3xUv2kh8bSZ9cdP4MJIDiGl3nxrBpoHZX4Uk+bYLtjnLq998VyjkoGMMJdlI4J7
         tOrKT5ItKuCdqH2jfAXXQp+73UpGk19FjnkAmKtf5OPb4Y/15r3qIvl8OeZzmQ5crdvA
         IsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983808; x=1792588608;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93+igLrbXqmsFz4NTS+REhHzmDb/+QOuMx8GvI1OmbY=;
        b=sxbQf00te5ttu81U8m8btHgMBdY9m/LMRcg42PZINUaqTV9Db5q9BD1qjC+IOWCq44
         7ZW2OuSpeMfhpttxJGK2acxBJKaqvd/0ihAVOHS2r+lnTAMQ3pocl1eN8c5kU9RYE6sS
         Ky9U+D8bZ0CDZkGT1MZ9M8+7muqBUOGl6WxxgZGJsoD/2KGuCgB9eP0kN05/6i2r3ZGk
         MA72925tNuLG/PyWPnGVkTjSL74UKloBqjtAbYURyxNjJSiIIEPKZ25n48VSdmQFp4Zk
         nPCG3ExxX49lv+3P1LTeZ7Pm6dJTbjUzjT8iYb7ttBalw7+QcflLza1vnKRTJ70iKoSq
         g2+A==
X-Forwarded-Encrypted: i=1; AKwUvBxitdzIMaf5GEsaIB44wMRf16N6c25CYrcV7ArGxDvAZDjef6Zaie8nVLyjgj0K03h2fGKtdfHvKNrOpCDu@vger.kernel.org
X-Gm-Message-State: AFq9FYLQHvWVB2vAS8zWc32oXhCwdf+rRFjRJn9C5Ak91hXVdFPCCDTV
	lUOrI8fqmi21oun9AYvXZQpKsNnOg3TqZgjXsvGLgAUb5bhe9lCAEsOQrYNALNSY4bOhn3+uqvh
	z3Pn+qMNXclZgUhSE7EjOvKMUWoseW+WBBFQDj+CqW8mOLGOiP4szq5qtswwA4Oc8A6Ek
X-Gm-Gg: AYBFou25zfMWAFCDYfSwl2HqlGFohBKnw4ricJK0YfPXUizc+TtOkAgFeXdXuyiIUlN
	izEkJuP90TSvBv2gUo/Qpj0w9Y86uFyleIPd7bHbAAMR0ATqg5t2aWGXIbRGJm9npUFxTYzqyuc
	ie3pDmdFVip4jlFGa0/djA6RvOKkTeY1L0XaEseUrHH8HHFSH8D/LCyJ7rVym0bVsihOH6IFIkQ
	v8C0hbDfMNS6Q5inGM1fEeLwkrPGBkGldsvSWbORHpsxMJj5dVdeNc0Kj7nm2mEOXbQS9P1419t
	Uub4QRanXbn0x5dPK608I4PPQjKXATFrrcx8aIxXAiqI+P0dw+vJYRTHmb/fIY7cPbIKB1R0yXC
	sbgGTr0FSqky61KTLtr11Rw==
X-Received: by 2002:a05:6122:4a52:20b0:5cf:69d4:10ea with SMTP id 71dfb90a1353d-5e92e15cddcmr2779017e0c.0.1791983808469;
        Wed, 14 Oct 2026 06:16:48 -0700 (PDT)
X-Received: by 2002:a05:6122:4a52:20b0:5cf:69d4:10ea with SMTP id 71dfb90a1353d-5e92e15cddcmr2778945e0c.0.1791983807572;
        Wed, 14 Oct 2026 06:16:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203865008sm1075601a12.19.2026.10.14.06.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:16:45 -0700 (PDT)
Message-ID: <ac97e06f-9ce6-4c02-804a-f45ac3ee1bca@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:16:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650-valve-deckard: Add initial
 support of camera sensors
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261002101748.2454305-1-vladimir.zapolskiy@linaro.org>
 <7ff7a265-59ac-4ab3-af14-385fd02fc6ce@oss.qualcomm.com>
 <8d7346c0-1eda-4e48-8df8-926d05c370d3@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8d7346c0-1eda-4e48-8df8-926d05c370d3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX/OnzAU/CXTW6
 TausQ7Zoia8lHLq1ZJlREspoE4ppwXkGxLCflvFIJXyxVOluIGsDC0IztefYBYZ03qJbIFpw3F9
 Z6EkrhVN2Q1TUSZ8TCAuyw9KQjDJoug=
X-Proofpoint-GUID: II8xHvRjmptUef1iksPOBaztpx43h7jz
X-Proofpoint-ORIG-GUID: II8xHvRjmptUef1iksPOBaztpx43h7jz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX9x9NWfHhdhIp
 AuDqnc1XGXieWfrFeDZLtQMTXFNF1Nbt7rxsg30hW6fG60dg+Mzyd73q5gqKWwYsjErzgznuxyI
 zHaWgMGoWZ5ZePpkq+hx1Gv2YcjWp95oA2uSlpqCpLm7B7q8jpKZIDTth/vX4P2EcD36eJvB5qZ
 T75BIcbshMWkDRf1ZRFOqYogK7sPW+/8fBv63iI7KWk5BNCdUsiv85BnzfzusWosViPz2nlYoD5
 LWSX91TuPZ+oyDSliKJmwOShHAi3T9X3VrHaQHcm4yAn+Q1yO/WkGDt4N9CblvIpoFphRRnEd4S
 36j/MAFoJ+NXD+m+r0LSo+aXlfBNugtOvVpCvj3OAa4wkXu/WrzVDBUTjtRy3YbERH9E+ktw5ZM
 OMYdo81L1w7s/DUM2mrMmhlp9FdklV1G8au9La8rD3LCPrJ1RKxqagAM5eRG9HDVk7ZXSMl3qO6
 IXu+1Iy65WZutiJ0eLg==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acf80c1 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=sgVaJ9zI5xQqhWRQL08A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140052

On 10/14/26 3:10 PM, Neil Armstrong wrote:
> On 10/14/26 15:07, Konrad Dybcio wrote:
>> On 10/2/26 12:17 PM, Vladimir Zapolskiy wrote:
>>> Add initial support of camera sensors on Valve "Steam Frame" device.
>>>
>>> The change enables CAMSS and adds description of
>>> - a pair of OmniVision OV6211 monochrome eyetracking camera sensors,
>>> - a pair of OmniVision OG01A1B monochrome front camera sensors.
>>>
>>> There is another pair of OmniVision OG0VE10 camera sensors found on
>>> the device, its description requires a combo mode feature support in
>>> the SM8650 CAMSS CSIPHY driver.
>>>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +    vreg_cam_front_left_1p2: regulator-cam-front-left-1p2 {
>>> +        compatible = "regulator-fixed";
>>> +        regulator-name = "cam_front_left_1p2";
>>> +        regulator-min-microvolt = <1200000>;
>>> +        regulator-max-microvolt = <1200000>;
>>> +
>>> +        gpio = <&tlmm 37 GPIO_ACTIVE_HIGH>;
>>
>> GPT points out this and vreg_cam_front_right_1p2 poke the same
>> GPIO (but have different supplies - l2n vs l2m)
> 
> This is exact, same gpio for 2 different regulators.

OK, thanks for confirming

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

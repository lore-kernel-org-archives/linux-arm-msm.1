Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566542;
	b=wEuI0lAkvHbHvlsW99aq/F8IdFIhKcdCs8GHmTcYueJyFVbvVDEnXdeuu8nHMhpmRRSa
	 TlFjJ4n1cXNvyYnajt/cXCDZk25zpsxqlmeFXGVSl23UX6np9Ggq1u3HKH2bZA+BmmXO7
	 i2ODwScpu0CfbthPwD1C/CUxBYE9YBswvjVARgflghHso8uxWYybR5CQu4F/5RRvj+3Jx
	 n+mq9EMHPu5rWxQzULSQ+NtSVYTbC0OU3zhWGp76OJh1Bs/Oo9N0rlfKO00YhAHcCh2Bk
	 iKHg1JNFlBVEwQ5qpWHOS/dS9Fr6Mw0XSUSlaCdDo03gRCrbD8qmndOdo3WT7j8K/8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AZrSqa6J9X2gCGozWEGsXBsDcpp0b5wmHfpwSMEBVxs=;
	b=VLOzLbrC/Ec+RC+Y+MNxfzNqiIhJYvYHykUbTUb1+L7UcAfuC9hNcjEiWO/RIIq3uMKA
	 R0FeWOkIcuAar1Ypz4bVTVHdcSC8t27bAfDN8LaJujdFb3+A5yINK6B+8DtqQPSfGvmr/
	 bUzTux/sFjAaxwCEOIuz1PAQT3aLcCdS3Oz2us7aM2U6tre6M7rfwmGKUlJvEVrUOJAK+
	 1Im+V2zXuaJJvvz41EVnwkJjE/w7B9JWS5H7J7/YIM1M/e+bAA5A5OLgoCUxwcEUA4KmR
	 UfDn4WvrotZOabajpN45wm3BJ28+tbh+eRZkf5b4Jnd+gTp+1kcypuol/WvIYtyRUcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Lyx/avOW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=atqgKOv9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BA6606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31BA6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lyx/avOW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=atqgKOv9
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADA55UF1163210
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AZrSqa6J9X2gCGozWEGsXBsDcpp0b5wmHfpwSMEBVxs=; b=Lyx/avOWN/Gzjezo
	1q2AESFfytV5VIPa/TFcWve/Mxfl/V+aCOt9f8aw3eNMHwK0VaiLSqaOxgmdBKTx
	AVDWT3kGjbqmV/Js6jh38h8s0VKLEBlnvSQTetiltKShQnuuzdn3tTmZ0Q10qy7c
	4a8RhL0pqt1jbknUii0S+rcLSTFW+SYa4urN+MPCDD02uqWnkP58g4QfcRz8G0cu
	5UzleEEAuvGCadrAoXU1Ya5Q8vbv+yFJNwfEUNKHvgwpIJwK7cNP2SNSju+wL3Ha
	i1waVTAMPVu8sSjEe2InKqDe1VC00uYQvQTfA26sKweQFrPZHUexdAcb2LEDsx7b
	K4DDAA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g203dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:42:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso3687059eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794566540; x=1795171340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZrSqa6J9X2gCGozWEGsXBsDcpp0b5wmHfpwSMEBVxs=;
        b=atqgKOv9tz8jDQ3rKHbgm/q8bDwkIK0SZYrA1kLe/dsjwxxziwfV9m8SwVkvnM2X8m
         2HqKRoDE8FHY4oZvL/1230OqS/9L1m+XCpc6bIE1z040ORjXHmVqf8cyo4/0iEBsMCrL
         G4RSTLo+D/mi3POVCfFWaepd927dg4pKr2RCL3WTrPR4U0xmDxcErBKz8+D0XbDa9Vah
         Kq751Q6JZ2Lur9iprrMXZPZ3JITjXg/PtHUf8i4h/l9auW5IA59lVcCpkGTggCfQk87Z
         2pKSm2aEO28GJbSviRxwMchy+O8/Z9974gu8hFgQNBtwMX0AIcEF3zIcXMknzGkK5Lg5
         0BVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566540; x=1795171340;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZrSqa6J9X2gCGozWEGsXBsDcpp0b5wmHfpwSMEBVxs=;
        b=V0STqpzlm9JUg7glFevade2AGIEVNDaK8GV78uSIXlhBYYUFDLC2XPi+cNzsVkKnji
         qvv+oLc1nrrC2XvoM9S5+gQyedt8P0jv6925crPKQZjfaouO4+LpT3svOCQOz55At6DV
         iQJekokh1rraNwovwi6mlO0pm212L5MXzqfCLPOj+nA+sk9P4h8NFmWGrVE5qdGpQ5bZ
         I/bwzp0YoQfhA4omodi8hrIdkxMIJTHM6cwOTZiJjW1rHCEWzRlDPvL24dbdJwmZvaLH
         Nsrbc2Wfioz8MxkHp8/ayo/a1N8JO4MoEE8ZIFlgXT1Vphj7afkgvejiWshNi5/SkLyu
         EHYw==
X-Forwarded-Encrypted: i=1; AL+hErEv34rftglI5HKvFyxjN0lz2HfNpMo95NnkYsnRnyEbjbTM91ip6FhOvTZx4N8cdcRsRSZb5/AdjcclkBsI@vger.kernel.org
X-Gm-Message-State: APuU4Z/63+gAzJAH/etiv5FphOXj2ZvzlrdKsk5EWBjEl4pvCpaWAwd5
	08mCXA7NuCVFu4hnPvOeZrfCccemcf0H6dZ6KcD1hLv6pahDuPYP9cqOHBuXSvJtVOSeWXo+zsJ
	lbYC224Iq2w4i8KubVREdAhdg29VzN/5/mi5zLicvMp4Z6j2XPRbALm4kUjupeCP8LtLd
X-Gm-Gg: AYBFou15k3OoDN1+WfoOnCydiTw3V5caMxvH+F6gzTY+xaMfDU0pqj3caelckIrcVjT
	9QNSYaFSL59YOLc4P//I/EPcoWz9HOsqEbrLtvH0lbt0NFaMaTndGJIkaWTEVg6gPwcVws7F3Cg
	PyYPyA4sw+T7aVojJiPP2iJ3Z+P7J834uTyxpbnrvqU9Ff79dKM4TiG9FiB6RwzoFezqtc7QRRn
	3nxBaIKz+/LTD2pXmKTMnPO24BuqD/h8xfHCBSKs64Of0KPbWZAa8/VTUCH9WN/0DovpCXOkwyz
	7VGGfZtRU0JGjOMe5DxDix2MR7Y0hk7ZKc63S1G9bJWhODV99VH1JvrYmLqpmeBvSBqxuI/zc3i
	lZr3Zwybux9WG4raNAp2K6DYYkj/GuEv0MNbLqZOI6GFcF9IsDvyGaW5/ciZJJn2y05tXuYe/wo
	1lYg==
X-Received: by 2002:a05:7300:c594:b0:36f:a72d:29f with SMTP id 5a478bee46e88-37967ae6bf2mr2219897eec.34.1794566540478;
        Fri, 13 Nov 2026 02:42:20 -0800 (PST)
X-Received: by 2002:a05:7300:c594:b0:36f:a72d:29f with SMTP id 5a478bee46e88-37967ae6bf2mr2219869eec.34.1794566540007;
        Fri, 13 Nov 2026 02:42:20 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm6363256eec.6.2026.11.13.02.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 02:42:19 -0800 (PST)
Message-ID: <ff2e0234-3e9a-4ac0-9fe2-277735c8b1c2@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:12:07 +0530
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
Subject: Re: [PATCH v2 01/10] dt-bindings: ptp: Document the TSCSS on Qualcomm
 SA8775P and QCS8300 SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-1-d5f575010427@oss.qualcomm.com>
 <20261109-qualified-pristine-newt-ba1c0c@quoll>
 <f2b119c7-ba01-46fd-96c4-10b918f98d53@oss.qualcomm.com>
 <2cd4da54-1dd2-424d-a9ba-e3e4fdad502e@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <2cd4da54-1dd2-424d-a9ba-e3e4fdad502e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfXxnfO6FCbIog0
 ewSNH4JafeyqoGyzyFgK4Fo+SaLthnyNesZaKb9qqvPNk7RbZKNqWtsJR5444vg9TYq4Ay8fQwx
 fcyNjG4EMF1IBThL6IUspZGHcvTejGyNFkNjEIMvxzRN5GP1IP9GzUAXrslFtqii8CmZW2MckVe
 97FjYsDGe1OMXmSGohojFlxbvUH/dc43xdy5pyId2iSEYlzjtnb+cKMRnwh6HLJvTK4RwD5Q2wF
 BtVXU6pi1OL5BF4quHz4wrLSts2FC0GtIdd+TrBibTMz6Tl7tIUfolnxKJub+dBSTHNwwHwYKDY
 PUsUuqiUOdUr/o8nxlXuq7BD3GmWCyk7MnyOJrOkQYE49XPcGuI2wfz0PNjZTmpp5mBUY2jGcmg
 pEhuAyCFxJwmJmclO7KkRiTNbBrvjyR05etbQGMSm5KyTq59n5kr/wDO4EroMDhMwtCSZ4yvUlN
 FicQv2BIKgP0cNNfbeA==
X-Proofpoint-ORIG-GUID: LHgxVzmmahm2f1kh98xd5l7smTh_bQBE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfX0Cf1VjWmapu7
 TLAZhuN1xI1uXHiWRpw/1nSAK6Czs7/3MDUFHxfYhzRdj/N4sICthPdJtLCX2E+Rh/TYI2wtdIk
 pBE6Srb7jfQ/eFpiEW7Cm7jG3hOurFo=
X-Proofpoint-GUID: LHgxVzmmahm2f1kh98xd5l7smTh_bQBE
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af6e98d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=A8zP-s-B-IGqv6UKJQEA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130042



On 13-11-2026 12:33 pm, Krzysztof Kozlowski wrote:
> On 12/11/2026 10:31, Imran Shaik wrote:
>>>> +allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        reg-names:
>>>> +          contains:
>>>> +            const: etu
>>>
>>> Reason for same devices with different address space details should be
>>> provided somewhere, preferrably in description. Assuming in the first
>>> place, that this stays because how two devices can be basically
>>> identical (same compatible) if they have different programming
>>> interface?
>>>
>>
>> TSCSS is a single hardware device, split into two sub-blocks - TSC and
>> ETU, each with its own register address. Every SoC with this compatible
>> has both blocks in hardware.
> 
> This is not what the binding said.
> 
>>
>> What changes is whether the vendor/board actually wires up the ETU's
>> external event. The ETU block captures a timestamp from the TSC block
>> when an external event fires one of the ETU slices, which are driven
>> through board-level GPIO/IRQs. If a board doesn't wire any slice,
>> there's nothing in the ETU region for Linux to use.
> 
> This is not what the binding said. The binding said there are different
> types of devices, one with etu and one without. Look, easy to spot:
> 
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> 

Sure, I will drop this reg handling, and add all the register spaces
support by default in next series.

Thanks,
Imran

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793244475;
	b=ww3GirewpETt00eBHWKJ2qLZdy5o8pJ26mlAQjegSNwgMBYzvpr+FaHIheWMXbJC+Axa
	 m35WZ3WK/y5zBN1zneNuX4RN17MIbdeP+1llhGPGsYW8tNaQ6mz1qyqvHhTCmfWn1XFEb
	 959zGUXTxXtjJXt06dnaX+lu5Q9nuonaWte67Edg6HN2h8B27U0KzPhmB9b6MmIt7ZxGo
	 oDI4jsw4Y/yJCLRFI5K2gvZdqmPfzmb1169vORs4C+UFvVczXtU3hBaLyuAkUJ5YKOWEq
	 bifjR9q2RrXPt3AI+zlnL/5RiWbwlIbXD810xLtL4g1zDbYpU7us3h/udg6GoSt/Khg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793244475;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IwMAPaLlLiUuoEsFHqZElqUlGj5P6ZenhreeAQP+akg=;
	b=FNME3SgIZ4lQppr2/SkvJTvG3bv8aMLgFXc5czJcZq7fjKo6OjhWo7NRoAFVWLtmLOzs
	 P9Z6+9nFvIda0SkM9Ei4aaiBOUbOEAWcEiqWpky1p12/xDsiNeiKYYdLJ9Z24LY0mRrId
	 nZZug2doz47SI6UJaeoBiCeQDHwb7lWKdk1hIAl3ia1K9+BCApe30DmnmET7G9g2jan90
	 GUA3CCcxJpUMLW1ZUjjWEnBI3Ogz0kOtJolvhAwhCL2x8LpFCIBPwlTTvUc0kfb5tB5vs
	 YaRPVOx9WgJMYRTIs05GnDW2etfhrDST9YKFBhkZlAJ2lVrYR3ewGc++HDDGPbCy8qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gYHsIv1N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbhzBsXQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C976D606A31F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C976D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gYHsIv1N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbhzBsXQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jZBh2338897
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IwMAPaLlLiUuoEsFHqZElqUlGj5P6ZenhreeAQP+akg=; b=gYHsIv1NKRePU59Y
	9555y6anHD995DoIJJv7WhyO09xHvQxdRvFjJhkx5HixMUF1Fd4rwjLCyH8y3MXi
	W+3gG6Ez545ztoyahx20ZZTM+79U7gmGoHUL3oblVtbG2QKDVPGt0A5NhAkeo0Nw
	fWzRfz7+JKLEM4Tb/ojNpLh8Vi/PK0KjsoZVkQ71wyXnwMaG3fAznvCFTGJIu/xs
	/orwkq2Ro41wbNMUUxk4MydN0abkqLUuqbVrfVhleA3OQbFS0EK/QAg4NOmFPA9i
	gAwvML7SQmhcQt0GMtmYHL1erkvw3x77NESE9HIBTFhbOiPp210w577TAzCFwcmx
	z7X3Sw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3n92s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:27:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so1495736a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 20:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793244473; x=1793849273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IwMAPaLlLiUuoEsFHqZElqUlGj5P6ZenhreeAQP+akg=;
        b=MbhzBsXQgb/jjo88cmo65JbI2G74qP767UJDH0riA28KKauwL1yw2NKjLOKMlYWU+/
         l7zE4q4v8UCYV9/emC5LN5Z9KrByEQ4FWvSSvhCuxZ7YiCq6E9wBQRh/QAEWf9Ag0lOP
         fNCzzt26L1sv3/cGuvyxzJH9tKxPCr+ZvVrKAf16o0BaEWRQ7yuOvn2zsKnLi21a2D1f
         qTi+O5GwUWhhj/2VbIRnLxL4cC24AjwD5NejrFXuZImP3fOZ33AB99Hc8cBNlBxJIoee
         xoBMyGthTqr3nEdFcuxYjtaCHe5J/CDzcYJmsuKFjQNyReoXXf7+vkVY+VTRbHXIASqB
         yJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244473; x=1793849273;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IwMAPaLlLiUuoEsFHqZElqUlGj5P6ZenhreeAQP+akg=;
        b=YhahfLEsV5R82vGHRCmdU2JK8D8XILlnFt7O/nig8W+itWS4F2p6IUxyMAK+mmdWFo
         AESPkuXmydpkx1fATlHHBQOhczMr5MAUUFQopFVrvq257c4j/6QulQUGeiCpN+fnHEXX
         9QJSe+GHjYz0kaeduNG4zJSqmsP+JnBKNR0pVoi5Z8VOPkXr2HFxpbSak8enaVgRVwoh
         3yPTBENuJBvgeBV/Pw4Aj2SD64gG2Pe5LQ3n6gVzb9ncIYVWfx7imD6jujYcSRkJNtFF
         QssAbRP22yHk1XIFzVYMBr0rYfPxzaNs3nNBqa2HbUeKKIz3lE2RS0hD41rn6Erhmeu1
         Fqqw==
X-Forwarded-Encrypted: i=1; AKwUvBz0pNpcI0+wjQrjsUcATAh3S15Jks/7ntjYSWbvjXN5vOEtPA1qFZtHZMKar6nPwZXLrW4A6qSjbJecWGoV@vger.kernel.org
X-Gm-Message-State: AFq9FYImVXPi4v4HKP//panOIt6ffyZd64c4Y8yrSIjsoIta51YXgkSk
	8KY4mSnNSiZz7tfIqHkjClYUpx7T3jmpYZut9S+Zgy6FtiicvmOUD/rW/dM4jMxcPj97+vDKjkU
	665HvYE1yP3Y07wd1tNF5tcEu3ggmcIHRBnTXQAT7ix2YbPQn7UdnjgZw4yB6Q14Zgrut
X-Gm-Gg: AYBFou1qfgdIB0ThB+J7qkd8WwOT+aQEUYVrcJxg9sl9rzLz2JP0CGCKKXX859O9wEF
	GfIsiOlXUii/xhSbzt4NPtGMsPmuSks5UK6uhMqA4pOsSP+TL02+R5/vHzYMcZaTU8wr/yY6mHM
	SbDXwPP7nfg2E1TR+Mla4mxgp7TotdauQGDhUUrLE053CVnPbY6+vTNCajZu1cZgl3HNu5bvA/i
	qkHOJj/JwlIoX7vOdxL/CwpiR5IYPM0xUa1Il0eVNOmncclJESceMaN0O5rbiebacL+osrWgzLw
	G+y2YmCmXaHwxi3ogrFfe8Brlb1MER911uy5xu7B8+Oj/kNnwFF4pbVhVIvLiYVugEFnSnfra0B
	gcMZ61LBhDfQP4c8p4dM5pC3+IpR0IO2XzLUDf0Epx9xj22Apb0KVq5WwVcpBzo9MfdJy//rVI6
	ZEuqpHzoMtemxtqRe5MPNjQudMx3ZiePVf8m3i
X-Received: by 2002:a17:90b:528d:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ae580cda50mr3543168a91.22.1793244473015;
        Wed, 28 Oct 2026 20:27:53 -0700 (PDT)
X-Received: by 2002:a17:90b:528d:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ae580cda50mr3543143a91.22.1793244472548;
        Wed, 28 Oct 2026 20:27:52 -0700 (PDT)
Received: from [10.133.33.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a6dc1sm1885033a91.0.2026.10.28.20.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 20:27:51 -0700 (PDT)
Message-ID: <55e20ec8-d6fe-4613-b7c0-d748f2e5944e@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:27:47 +0800
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
Subject: Re: [PATCH v1] arm64: dts: qcom: purwa-iot-evk: add missing DP2 audio
 link
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
 <01b4728f-a78e-4932-96fa-795283e91cb6@oss.qualcomm.com>
Content-Language: en-US
From: Le Qi <le.qi@oss.qualcomm.com>
In-Reply-To: <01b4728f-a78e-4932-96fa-795283e91cb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XiOPPldMa4dFNOBv_3h6ggs0gONNmoBY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMiBTYWx0ZWRfXwI4njzB57ELc
 xXC/t0orIuAGQ3UkEJvNv0gD9XOa0m6ZReo8BuPo3QpenNiwppZLbH5suwkr0T3Tv2SCCCg+b+6
 2TIPLV9o+o4QQcmMYMqHnVSHy4wCUmyowwDxZBJU/7uAxIEJDuB5Jd/9KoNOmCh5KRYImH6/Mpl
 HeC3tgMFQ/d4il6gMvja1qx/gNpVJFBZAgLQmZB03MGNqEl4Bn8T0eggF+GI1dW4kwkxx8033Ai
 T8GST2Kp2R9QLszEp+SKPxaLP66ridVieaQVzz7uY3o5dtJlIJ9ChKrwQC9wmhQA4eh8mBSmZy7
 oI6ZOI8wRN2FiJNYGFM4aMwDHIo6jSCg2VjxlU5J0Hs5H5nl/knIT3MooVYOZQpB0hGhPfhnaaM
 iprL1TKB+RoQUSNiaYgxFDpJ+AmxqLrRR/4MhYYew3ECiOYVTA29KAKwG5b97QbClxjdKkz/NZz
 q7e8yYcuJzbqbAb4LWA==
X-Proofpoint-GUID: XiOPPldMa4dFNOBv_3h6ggs0gONNmoBY
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae2bd39 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=e3FvKZFSWGuFtYgZOwkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMiBTYWx0ZWRfXxs1oJx81uRIc
 Roe+dojMcKKUJ9ObkQi7U5vWA8oppbd8m4IBON9lNd3foOuw/PT4IiXdIs4dyMfXSTVDNWajD1a
 32QXZ5IvyvEOfVOfgzRSBnt9HkB6Piw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290012

On 10/20/2026 6:14 PM, Konrad Dybcio wrote:
> On 10/9/26 5:04 AM, Le Qi wrote:
>> The DP2 DAI link is missing from the sound card definition, preventing
>> audio playback over the third DisplayPort interface.
>>
>> Add the required codec, CPU, and platform DAI configuration to enable
>> audio playback over DP2.
>>
>> Signed-off-by: Le Qi<le.qi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> index a811d8ca2dbf..93cefffd1f46 100644
>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> @@ -641,6 +641,22 @@ platform {
>>   				sound-dai = <&q6apm>;
>>   			};
>>   		};
>> +
>> +		dp2-dai-link {
>> +			link-name = "DP2 Playback";
>> +
>> +			codec {
>> +				sound-dai = <&mdss_dp2>;
>> +			};
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
>> +			};
>> +
>> +			platform {
>> +				sound-dai = <&q6apm>;
>> +			};
>> +		};
> Srini, can/should this be in the SoC DT?
> 
> Konrad

Hi Konrad,

I think it is better to keep this in the board DT, since the sound card 
is board-specific. DP0 and DP1 DAI links are already defined here, so 
DP2 should be added alongside them.

Srini has also agreed to adding DP2 support in the audio topology.

Thanks,

-- 
Thx and BRs,
Le Qi

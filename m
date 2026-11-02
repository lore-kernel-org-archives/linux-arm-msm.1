Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631463;
	b=SDaraislfdc7aYGC/ymm+pWb8P4R8yfHCP4Z+nw/CFbtjMx7e+r0pzQsWyg3GkbQtMrA
	 DrCKSgbrN/pb41NDiOwf4shH/8Rcd2iMLm8sdiitKSzKLi9O/08SCb3KPGA1Wq2ZjFmnJ
	 4Ily8XFwbUaaglBsRXqR8g/VzME6XhWXg6MgyTiHhHpBsF5ICvwVnL9Sfh1IDBKT5rlW2
	 +suENiKFDjNzaGlTHZF3Sid2qBY0mru66/iRxPpmu3/HlkU71ahkjCUKa5amA0mve/old
	 TTlqHyBwSuPgAzIdzhGv1ye2JHOn+SL4JCEEJqZQq9/gqIYF9eukK7dGKlrFmJmR/gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631463;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V0mwm2S6a5RQ4bVt2WgjrUUgoonka+5P78C1e4E9nWs=;
	b=jIU1tkD6Vt2apurQwrVAFaTilbDOlQ/NIKTXpelq3zDU0vuqOLNNPc4rtV3hK2tQN9DC
	 ldJ8qnoWjVEdbSmaK46QmkYXjgOTkvE3/GnhOe47fFqEjXVIH6aRvKqX0NswZegrXC+DU
	 fDzm9Ghjfy5OafIg07vFCSuc/8Q/7UzEXqbrWG25bR+qjfoBlAtPxIn9T5kDfflclxHbn
	 LXkz3GSJ/3SqS8ytKnwNmPtXBdBaoCENMPhwUGNEszHwXc/qP7AmMJ0d2K78EfMEDTBAY
	 A5wfD4jg59gfsWzXwZxJkFuzm5m/H7W4dXhXB5ripR2fIvOG9fN9ASPFNWy7RbNDdEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MOpZb9qc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M7LHIB2L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AF4606A598
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 14:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70AF4606A598
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MOpZb9qc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M7LHIB2L
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Dpluo2449634
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 14:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V0mwm2S6a5RQ4bVt2WgjrUUgoonka+5P78C1e4E9nWs=; b=MOpZb9qcza/MuWZX
	/Jhnru7VEoNOcXEWBrMOe4c8Um46z8/+YAJvZR/yOMWhkntzp0w73f2g8COfrVBp
	ZkS+uYPf0SuJCg/k7HoBtS2yIzuqS5yDwo9CwDwyFK7aaFg8LvzQG5wdcLwGk1g3
	Yy4uS4mgwYvNqsjB7COwbhe8pOVb7+qW6NYbuWZ9hhVJea7hzpIcvOXaVoiwPuD2
	9UkJ7P069SjJQCBj92oquJL2kEjHOZnaQDsLWv7W2mdvxbHf2actDhwEl5BwR8jk
	pLDgUmg/PFMigixW/a6hGVgJmwxHue7j/yc4KvptIwmCOd7z9BUx/AXPBYYCLCdZ
	qwzWIg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4j7kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:57:42 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-77f133855b9so104094137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631462; x=1794236262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0mwm2S6a5RQ4bVt2WgjrUUgoonka+5P78C1e4E9nWs=;
        b=M7LHIB2LSlAmt2WIaDGGugI+e0LZN2Ap/7uQhtFI6O0FpThwkasInkZ2gbutZcrzpM
         tlDNqeLB+JRa4aqXSRNvrKY5cTHflQ3WvgpYC3I+uPXGQZPLVvwcQiBOauXN6GQcWGJX
         Wy9lAadPnolUuG76oJEm3D5pyGCY4w7I3ZcDRn1+F4o9snzRsV9MJPauXVt4jKCm+uew
         /1CVY25WyI0/S01hMUPkdywoGjaM7DBQA0qdANn9jNz5p22AI9L/EnCvLUB33JFpsVlQ
         MA8tWn5mzaT+ABGFiGxrbPkc0r25iC81JwAwNAd2ommuGAppFoL07qblA5pQG4ipDfp+
         6DdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631462; x=1794236262;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0mwm2S6a5RQ4bVt2WgjrUUgoonka+5P78C1e4E9nWs=;
        b=jcspsz7e+3rC01gERoaKOy4jW+soMfKxGPUxhd1RjlRUR5l1LxWPJ8mn5tNcDARQi/
         iaBiMsnInq/Yumc/Y9PFsQ4kz1m47UAiAFOtMWLtGZLagSVQ5WBL6E9FH6cs5D6HsWYM
         l9oyTRk7KsusKH8moBzfmSlYTCRk2Q2XQK7qh0ljni/31cXGs5dxuZacOSeYTLw8a6wv
         XSO8K9RP62XFKsv5gfIenjC3dGERLfHg/uMhE+//mJQqZPzsokIRJ1s5nIxLzgpnrkR8
         yPJwZBGnj132r3Iv8gUf/EtO/jkNx/27IKfXia6tODmWt5wPauqdJtzHliz9NGCJT9OZ
         F4fg==
X-Forwarded-Encrypted: i=1; AKwUvBzkxEi1PwKqRrvlJjkT99FphKT0+nuS9qmVS8lQtwI/ePkpqZobP21vL/iYUvw297U6fcoNghdbJaN45nCt@vger.kernel.org
X-Gm-Message-State: APuU4Z+JFTmvxXxQ+UUrK86JcvGsX5CZEWB9FEGy4QT3yi9U1fbvOSyL
	PMVXpjvXcdbT5021gAeRG12DzNDNvv++jFpGy7Ldmy6hekmkf71oiMV8fbNi2RRMGMCRrYuShAL
	Fbytsl8AzHbvsh7EFd7I2hvRazMjltG1k1vX2z1Ry4Xdbb//ZreYgLJ4DsDSVarR1IGrN
X-Gm-Gg: AYBFou2DUqBPE9N9gl0qtT+qGe6Je8uezXsRmDu4Hg+zW0ILR7Xlpd+4iXL5JBA5TwT
	V3qXhqSWfZb2SKNsFSNZkEzaH4+HsOyMqeWQw92IGlzia+iZSFeaR0OUOXYg7qBc5IkR2F91gZL
	KQ8drtOFE8CwyBoXVvmh1cQcbiqZFMwXnMTzEvCxy18zvDhxT0mhg7T08muhfZO7X/wvpkFlyh/
	LzzDTo/NlN9sbD9Tdo/sUaUX1Y6tvY23HGERrWHDR/F8CeG9dw5EoNxD052etYWQol7YjdmyeRM
	HuEYu4iA67iTh+C4MeoQ1kOxdOCytD42Vrem8Cid6QdOssdkS5rnyvgRUCDsBEToT9GfrLhpdqq
	pc5d8k6ShHsYM9TJyv7umVWO+BSVKy+6Rkj7RcG5D1c+cGwprHXCz1DUbsU7ImOx0rOzivA==
X-Received: by 2002:a05:6122:512:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ec682924c3mr5548009e0c.0.1793631461777;
        Mon, 02 Nov 2026 06:57:41 -0800 (PST)
X-Received: by 2002:a05:6122:512:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ec682924c3mr5547994e0c.0.1793631461382;
        Mon, 02 Nov 2026 06:57:41 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc7bsm401506066b.21.2026.11.02.06.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:57:40 -0800 (PST)
Message-ID: <ce3b0670-3de1-4c3f-a485-e6bdb8d3d95e@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:57:38 +0100
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
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Le Qi <le.qi@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
 <01b4728f-a78e-4932-96fa-795283e91cb6@oss.qualcomm.com>
 <55e20ec8-d6fe-4613-b7c0-d748f2e5944e@oss.qualcomm.com>
 <23ac857a-b340-401b-ac24-77b89da2aa8e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <23ac857a-b340-401b-ac24-77b89da2aa8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hlPV7OPhvysT18xiXqxPEwpVKpAJfGEm
X-Proofpoint-GUID: hlPV7OPhvysT18xiXqxPEwpVKpAJfGEm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX6P9tlXBn7Lzs
 iaM9YHp/uSasRRUUG4fbpmThhxukbWQxlil0yMJ+yrqPYFC83jzWOUQJ8R5TDz2I9j1q65CPv5j
 1sf4zDJBAe4QFcvTEM5NzvdOA/qz5BE=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8a4e6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bylRaU9mNTR0WGHX4M4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfXxjiTZZJciQ3d
 RFQdu7BLqbn389hL3mTC4iUSbFVya4IIdZMdhCCcIJ2lMsL1+acOCH+l+yoQMRm7n2itzOLCzMD
 iQB2mMR+ibA1gbSMgOL47bVTTnahaVZxHSe3+HVm6bCaYhihsYnRSPFaqZ6Uh0+NibQRBnoFBVn
 IZbOseclfayLodBk1DcN7L1deXe7QpW3vXRQ69HbmqHCYuxf5H93OfkmNSJq3ypKZtyq3KoQ2x3
 8MmWSVGB5Ai6t2svKNqmerNhUFaNTIww2/ujfRSIrR547rHvp9v0F9Dcy8zfjkJppM2YPMgY0HP
 oA0UPXuzu9Xv2MC5DAWsdpzlAu16enaPeFEN0ukblFNd12lsJP3O4gN13taxEH0ZQymu2m3dDd6
 CdjsYYSdMw+YkewLXBe8Un5jsrQeIcNlnOg5WvD43t2VIRIS/CQyhIC959zEHjqoloJhYbOkvIZ
 u86fdo6ks6+LxSAGfGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020059

On 10/30/26 10:09 PM, Srinivas Kandagatla wrote:
> On 10/29/26 3:27 AM, Le Qi wrote:
>> On 10/20/2026 6:14 PM, Konrad Dybcio wrote:
>>> On 10/9/26 5:04 AM, Le Qi wrote:
>>>> The DP2 DAI link is missing from the sound card definition, preventing
>>>> audio playback over the third DisplayPort interface.
>>>>
>>>> Add the required codec, CPU, and platform DAI configuration to enable
>>>> audio playback over DP2.
>>>>
>>>> Signed-off-by: Le Qi<le.qi@oss.qualcomm.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
>>>>   1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/
>>>> boot/dts/qcom/purwa-iot-evk.dts
>>>> index a811d8ca2dbf..93cefffd1f46 100644
>>>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>>>> @@ -641,6 +641,22 @@ platform {
>>>>                   sound-dai = <&q6apm>;
>>>>               };
>>>>           };
>>>> +
>>>> +        dp2-dai-link {
>>>> +            link-name = "DP2 Playback";
>>>> +
>>>> +            codec {
>>>> +                sound-dai = <&mdss_dp2>;
>>>> +            };
>>>> +
>>>> +            cpu {
>>>> +                sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
>>>> +            };
>>>> +
>>>> +            platform {
>>>> +                sound-dai = <&q6apm>;
>>>> +            };
>>>> +        };
>>> Srini, can/should this be in the SoC DT?
> probably not,
> 1. because the dai-links do not have explicit disabled status, so these
> get parsed
> 2. sound card itself is board specific.
> 
> --srini
>>>
>>> Konrad
>>
>> Hi Konrad,
>>
>> I think it is better to keep this in the board DT, since the sound card
>> is board-specific. DP0 and DP1 DAI links are already defined here, so
>> DP2 should be added alongside them.
>>
>> Srini has also agreed to adding DP2 support in the audio topology.

got it

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

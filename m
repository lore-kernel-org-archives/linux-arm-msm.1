Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865540;
	b=hEpSRDyV+1VJUa09oSTNtKwWoPbvK7fYcEYQ7ISkgNz3LilbyQI4HPr2Pw20nd+kb0VZ
	 zOjoDNSHPV1ppNnw5zQAd7H4HC5FiNX6oX2H4GxonO6oBsgJcyPL4kAoZpCFi5j49774X
	 PDtKWadDOoayeoq0/aktSXg34xfI40JiSBWONbqEZf7Xg2TrGpK5P0LmzK0NA+QvxeuIN
	 W2wcGCGbQzL9rTFvOTu/mEs0Js2CkTbvLVnzo2lqV0i1Q6FM4zUL2J8+ZRdS3lC6wsq7V
	 l0u97NpkQ1jBqp8bRe2zOhN/WZbwVnJOCkb0EcGCT/SAYdvxZ9DOAJoqVuAvKs6bPDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d6cyErUoZNT1XzAJAXdnq0q0iukKQ64jlicZjmtk+Xw=;
	b=neqYwKSX6JB5tv6mcV6mMnWa+vvbgqc5Q8KiHyO+0YwLy/D9dCIYCLdBPhopneJS1ds6
	 WsNB3FrRHVABhJHb6lpuTlbNwtyWsMOr6O2VFpmGanvUlf3eD05g4cRMsPqHQyOJ+cUcn
	 889fAv9l6gDA6ouAOJtShzgs30+CE/VE12/5Ai8JtrqDNe8nDWutAF2Tq/sP1YfKTow37
	 U59GYZPzpxdkf2MVkPn7/5wDVXOwf650m1D2aDrnlKusTTszsi0+EgqwYHk93m2eq3CX2
	 KduvlDusoytStLNT1VQaFviDzhCHAIHKHq9qHTIA5lx6KxTbGcBMmhAWb58b6RkDm4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OOlZFjrD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGkhiaKN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1EB606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 07:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D1EB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OOlZFjrD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGkhiaKN
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56Toa33223016
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 07:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d6cyErUoZNT1XzAJAXdnq0q0iukKQ64jlicZjmtk+Xw=; b=OOlZFjrD9w0GeGCz
	YEebaqdzGvX+Zz6fYOfT25DN+oBAkUZ2/pEB5DUq6iHZ6ghWtPWNAG1x2V5WBJO/
	yDB0G+jqksL7IfQhxCI6FvgcrTtCv3pHSNlC8wxcyG7zTf3XH7c1u/Ku5ro55iuf
	So+EB42xFzGc5bErYOYBHjvm42UtdCFk0XNPBWNoDHoV8x30iH9Fy7cOQl5t08Se
	aAkqNR/R7QffC5YvRWbWPOT5mfYPTNNW7U9Fp+guKvAvJQiZoY+wk6bPOxfV2Xu1
	IL0tw5qb6NnLmgv3w+o1WcjQiEMp4NWUZqCT4ddDW2LAHMI8yxk/Gc6GRxp1FSiD
	MhNk3Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43gxme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 07:58:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91e7c9ca738so3578766d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 23:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793865537; x=1794470337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d6cyErUoZNT1XzAJAXdnq0q0iukKQ64jlicZjmtk+Xw=;
        b=QGkhiaKNiT9vr5kCX6dAtivxGCBdWrbOKPH7x7LrqW+qYdpMYC5vIhSoCUsF2xEPLX
         X5fXaAGk65vls0bF8uhZKZQN3Pk6x0yjfgpa1QQ4t3htUclq7EkhV5rcPBq0xQ00Bhz3
         M50u9YIxnou7TZpbSuE0AMyvebUyFB1Uirn8lLA+cDs6gu75rJUDU1Bwy2gnQs4hOpzo
         cmZWO5utzhVL3fSvIFPJ5DeccIgt2D8Dz3JzypHn+Oj4hu5npq4z5UeB8Pc8ZOwgnWpR
         Swu/NXGhZbS5+S6osD7H/ekIbV1W39Vi8BkPEL3PgmGQ44C5hZZ3RRBd4BR7bsoINBGt
         jlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865537; x=1794470337;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6cyErUoZNT1XzAJAXdnq0q0iukKQ64jlicZjmtk+Xw=;
        b=IX0cXGIgHVdYc5hc1WE9vqF8vgg1AhHrURCeTgDe8VyBIij/W193i+BQp2T0oLBmsJ
         iAEbhdLDDumvz9F5JpKZvy2ZdJXeaEZrUXAkGNMNGY2q+h2gF5KWH8OhytMvq/tpHo3z
         V2hc3KtWq4pYM1hnrYmum3J7mdt08EPmGqsWiSVRRjMYJ2pG7hnE3t5tMdeF8jonY4yM
         t3Ag8cEZ1cg4Ppd4lELono/6BL1tJRdqDA5UI3KX75C9B/YiQXv9JkQkhALLavlXYaab
         +abR8vhUTIPfNO5lqp1w863D6rmY7kVcd+12eQkurrVeJpG5OKHeoQDzD9BEvPHc5DK/
         vihQ==
X-Gm-Message-State: APuU4Z/7+gZXMeA+srU/KzMwyD+PQgJdSqt3rVBfjn778INQ9CHfl5al
	QA8P00WVDtbTtAr+i8KwDzBbGa+1dRtu69P1ooRbCLadbThWxKEpKJxa0P6HjEhniH1NVSAarM1
	ccm/jNIilcINVmb5DeeaMMxwPmB/at8Sd2j/kMaXj9IFns5Evbn8ATPh/4xWHKKmJuuTG
X-Gm-Gg: AYBFou0IYt+8TZNLApfB66lZEixcrFpa2Fcg1Cv2BHGavNtjqch5v0JzZ7SX2awm4Jz
	5DOvhto+MoC5nzHEkuP8AF2LARnLdkbz3Jx9OR1kFmjYUXA5Iu/s/U0+0n7p7KRu3ISio3hvmn2
	L2FZ30a4XRkp87ZJmvHDgRGMK+oUDd5xMOHC7/LL5ujyBC3PQC6Pfa3R5KbeTIhRjsQD++9aiyL
	I7m72V7ANxlHoJxWNrV4elixchDXGsjzPbB/daRoIlAvDBuLFI9girN+z/QA4UERcnLGCzctA7J
	EHdigA9L6D4Phne69+8r+e/lBr86zqvvsLLir4OOrBUHFxV/+q7QLg1q/ofYKoQL3K86eWoySXa
	ebkEyBqBiSlkiG/wYGpue4C92CJWZPdMtE3/unuKzT58zLQZ9587WeUzimyLg6zDra5PU
X-Received: by 2002:a05:6214:c6f:b0:91c:6ccb:4442 with SMTP id 6a1803df08f44-91ca4a4b1f1mr414798616d6.2.1793865537436;
        Wed, 04 Nov 2026 23:58:57 -0800 (PST)
X-Received: by 2002:a05:6214:c6f:b0:91c:6ccb:4442 with SMTP id 6a1803df08f44-91ca4a4b1f1mr414798016d6.2.1793865536835;
        Wed, 04 Nov 2026 23:58:56 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e46876asm148250766b.57.2026.11.04.23.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 23:58:55 -0800 (PST)
Message-ID: <4a733192-37c5-459a-9fee-079f8f813b8b@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 08:58:52 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Add missing CPU7 3.36GHz OPP
To: Val Packett <val@packett.cool>, nacht@dxdmail.cc,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaron Kling <webgeek1234@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261104-sm8550-prime-3p36ghz-v1-1-c72630265379@dxdmail.cc>
 <ef120d58-fb97-4c67-a29b-6b9b07839227@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ef120d58-fb97-4c67-a29b-6b9b07839227@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eq1AUtvkmff3vjKp4ny39936H_YIpZCW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMSBTYWx0ZWRfXyXZYlsHCEyb9
 MHTusKO6lE5oTP73lwifMGsINmnwXPIgsbduo5CQd/hBAYnUJCK9uddRK86Lb38Epry3zEcYi07
 dZUDlBmVtm8N7ESDoLO7IDF8yHTuwI125/Vnnao6yQoTdUVuH/OQ448RgFkB7PrTxuWoWxE1Ale
 3l+Sy135USV0EUEU+DbP4fg1O13Cvp62/wI40iZ+rR9a58TNDKjTl1p/4sY+vrJQFwvjt3fLZnD
 KnJsv3Vg+FGxfbGpSI3ELw3w2ZtBvLfWdkVfrP+gwe1+NQyHMJO/fJ9cSr8417tu+WapPo/QbaI
 /vZaQzUFwMVeG8yIJtUoSp6buRf/iYcMMBXWPUBMiyQ+YkzAhlV8rOnuqHq185gKoGyOgLRRjBC
 NwEDJsXp2Gi5ZyAHhvzoUO6U7yCbsRunfylk3CD+3KIkFcj/a+SofcFyII8Ded21aXukdv2Ix9J
 Ra6Fratokn0Wo926MAQ==
X-Proofpoint-GUID: eq1AUtvkmff3vjKp4ny39936H_YIpZCW
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aec3742 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9hb5SW-Fs4uWgb81FvgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMSBTYWx0ZWRfX5jjLK9cI02Vs
 XLxOzcAfAE9POZSWiGdTPEcxNxAIuKxW827g/NdF6aCFIsh6yp1EMLH2s9xhOjdsWskAN/xh4dZ
 uWPMyBakYdn3crogFtBr3bMm83rkKao=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050031

On 11/4/26 10:24 PM, Val Packett wrote:
> 
> On 11/4/26 4:41 PM, Nizat Mikayilli via B4 Relay wrote:
>> From: Nizat Mikayilli <nacht@dxdmail.cc>
>>
>> The cpufreq LUT on the Samsung Galaxy Tab S9 Wi-Fi has a 3.36GHz boost
>> entry for CPU7 without a matching OPP, so the frequency is dropped:
>>
>> cpu cpu7: Voltage update failed freq=3360000
>> cpu cpu7: failed to update OPP for freq=3360000
>>
>> Fixes: 3f5dcc05cd33 ("arm64: dts: qcom: sm8550: add cpu OPP table with DDR, LLCC & L3 bandwidths")
>> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index 03f6d40edea7..ed6e34ac8d56 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -752,6 +752,11 @@ opp-3187200000 {
>>               opp-hz = /bits/ 64 <3187200000>;
>>               opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1689600 * 32)>;
>>           };
>> +
>> +        opp-3360000000 {
>> +            opp-hz = /bits/ 64 <3360000000>;
>> +            opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1689600 * 32)>;
>> +        };
>>       };
>>         pmu-a510 {
>>
> This seems variant/speedbin dependent and does not apply to all sm8550.
> 
> In fact a quick web search shows that your device has a "Snapdragon 8 Gen 2 for Galaxy" which is a customized chip for Smasnug.
> 
> You should just add the OPP in your tablet's .dts I think.

It's fine to have a superset of supported frequencies in this OPP table,
the frequencies available are retrieved from the LUT exposed by the
microcontroller anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

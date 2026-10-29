Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264935;
	b=llkM+gSyzrZFjT51Fxp3XhCAwiLMpl9pOe0LNEXCWtcUvzPr4UnKPg4z8ZW2r4oVUQzz
	 vsGtxbcw6fqcSE4CHuXVujfZea0j8Wc4KQvK7L8+j4weh4cOO16grRjxgVF+xjaA4si4c
	 VcbMvXWUZaeoQ59DELwEYrA/Ih2E6NKuYCJ0HphgZUETh6F+KjeXebEg3WWJ1jCbobsM+
	 U3b2s8BFuwOI58M5XBaYFyNRGq5EKJIQ9M+V8xEEwFOyA3coojsTa6Fpzw5xyi/RFoLRZ
	 lQ81GRoBGQzAe3uHtF1DtU0uRH1o/faRPxzE741y/RucaHUhBjJf4S7LPMZeGb7cayw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DOlAawHBxXeFHxrS7siTvjiMPfoJDvNSyTz5C4Jyf4c=;
	b=PbDQuSITjATj45Tx694pXV8QnkyQNr0lxi0ROrFKztALKoDE385JEDnovEGBkXyY0tMN
	 AawcAfVJkySiyZ+6cbUrqkGBWSLGFtd6yMuWg9ogqFm1yNkENXXxWyRePTfvi1KUyEVar
	 HEkXR1yoDNqrcd2SMtyYth6Qob0g+gxny1cLXeD4R4YcZ6XSgMLnWZe4YrPRtbUtg9P0y
	 kwpn5ezmB7/SL+7Ri1Ha1xYVBaI3UyFF3GLlCPjqxpUTjf3vkTUfzJr4GJassel78juF8
	 ahPoiwuTpfyd7b0+As9igwYi3BsBQx7nXj6JXIK4jPjWMfXKAnJuAGEHECigM0+aEZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfLpqT4E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CJcgHsMf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D65C606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D65C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfLpqT4E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CJcgHsMf
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vFjF3775305
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DOlAawHBxXeFHxrS7siTvjiMPfoJDvNSyTz5C4Jyf4c=; b=JfLpqT4E2z86BnrD
	rpjh/O+SJAZqd2RuxnUSnwHWbjQpSzdsEuO4rPVslqU81GRZPwV9M67X2uP39che
	+8IUmRGwImPFC8500NMG4G+ETcSn8jeyvI+ik1W3QQF/4114r5wdglAahfyz8C0M
	6T4KMrfAjpvdgfT3FqGQA8hIvfW3SepexSfKwevJLbI/hZffAEq0fhmIjQgm/pte
	Y3Vg5idvHPghSVexB5SJsUkfvxUCeY2o1+sBe6sU/FzCo0ZFxazdzCWkG/gLGTNh
	HWbKyMuTkhJ3DUZl9RU71C5MLG7qa+5ndmdGBhCQ1SUVFg2TuKKl7yhJHeZ5Q5Y/
	HMPe1Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshs0pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:08:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so1098179a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264932; x=1793869732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOlAawHBxXeFHxrS7siTvjiMPfoJDvNSyTz5C4Jyf4c=;
        b=CJcgHsMf5EX6+gI2yDqQ861uOiP6ReCSiXGlMgLjNq+thhc9dM9PdWlwPvLWTh5SRN
         HJPE7pUOibNEYXiybfcauozltWvvZqdhWnJLzMGKRltCSU6o0fpBVcFa+bCybTjePyvR
         CNc1GQCw3gzMGaau/w7yBv398MuDrgrzgbW51bWm5UR5SbBk6sAoPlEtAZtkIRNEf9cn
         vOozfeGJKTrMRKKMp5gTUlfuZrbBujdAZ1dj02GJOzlRaHnJWT/1mnhjBQg46abLrA/Y
         aBKhKGaEI681+3hSWQuIKvifKMws0+flrcp8VBNgW8GN2c/mWQiOlm5Zog8XhhqrTnDZ
         lWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264932; x=1793869732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOlAawHBxXeFHxrS7siTvjiMPfoJDvNSyTz5C4Jyf4c=;
        b=J7O21zwr8CXAVJcIscb7hYe/7sLtgyzOjqgRFCDZkFqSnJUy75BlogLwIW8qhO9iZo
         I/AN9PhSKJQiBQlPEdO7DvUDr3g1LZ0SLBbh7gW1yCFsV8ATb4Wa0OKa26aUlZCVFd8x
         ZiMh1h6C1Tun0zidWcnCM9IFy9CdeiEivRLmWJbIZ6Uv4EPZpFq91QQAsBg/mB2fdZhl
         kGjOxC4K821aKZHAenVVBJdkbNps39f1jTAyQbqBfjY7ZoDROPV8mWpNQJoQUOK+emPg
         uLcJ6qUb9/rR6rgbSobwVUi0w2jCul9+TrSBefBUWL3YkAVowhu1iRa8GoC0R9adTJvV
         c7TA==
X-Gm-Message-State: AFq9FYK5QJBSoD86proNFA4DWCuA8Z9IAjV6ex/HCTPz/xTefbdXs6KG
	OidcaYi0IEoAvZlE1tKwTEX4P2ioIbZVLjvrqB0clZxeF2K4NoAH6izsczI9xLOUxmw3y+3XPYK
	hQYy0x4xE0vCcdtdAHB2Ohm9UnSzn6l8DBBiHlBpAAeJhU2KzxdJDD0+WDy4tOTMIVpIZ
X-Gm-Gg: AYBFou169/faGO4B0iZfyX7duhY7eWS7R0GvvqH6V5rrlj9BCGn0o90Poox+ftZWOlz
	GRnA/QHbMCFYYy+kS6Edmg4R1p1Tg+ewOO9R/n+yr3D6u8Wq/nESpu529BfIvcrnI1DrhXwwEue
	CqoKJuCA5HudGGt6GZyrwc5GQ1lkqUIPHCy1GQ3dClTZ1UnCgq5wYtHthg5dCryQL3RcITEEelv
	lFc/OSvWFcsB14JQOhFP06Uzp0EY9joLzHGhVYRpFX4THbE3AsAc9w0qo1DrzNDo0rDcBtoSIki
	ehWGunhdHjhB306yflJnpot3ma/7VdE37c07i/JzEWQHJSUVR/ikKm9RM1OLDijq1HJpzRMJ94e
	YdEszN3NbcjMmBIJtpK/aklGEd7lwzeIEqXf/mxA9iU46YNuHvtsHKXyiueX4ltRel0P7bMEIWW
	l/0R0yLXaJOhEqjp30XAx8FLZTr4HlE0Iihe5TKyIT15c5YZivjDU6K+DiPpFt
X-Received: by 2002:a05:6a21:3405:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3e90235b9b0mr4036785637.38.1793264932309;
        Thu, 29 Oct 2026 02:08:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:3405:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3e90235b9b0mr4036765637.38.1793264931832;
        Thu, 29 Oct 2026 02:08:51 -0700 (PDT)
Received: from [10.79.116.57] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662e3a4sm2039697b3a.28.2026.10.29.02.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 02:08:50 -0700 (PDT)
Message-ID: <5d84ee1b-a765-4d6c-ab01-ca1a06a0e3d0@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:38:44 +0530
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
 <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: n_t3dsRjQNWWkLvRZDCUIywPEI3Pv4H7
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae30d25 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HxamSshyuiQp_YgWtbEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNSBTYWx0ZWRfX2mktaHZQ3URr
 6DhNWOCIrf4bymVIYph7ZAxpy5CH2z2Z3Q79EAS2QZg3T6maJxe3nbsVIhp1E1Him2zwPXbyIoD
 wvF39ABY/tqH5JBOAwYZwoZuDJtcjDA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNSBTYWx0ZWRfXzEVmHMr7O8NC
 zCoAJBcG+FSI/IiPfEX5xtjfGgAieVH4Rxy6nE4S29/5u0RqrTikvMAL36DABAzC7HanKssPOgc
 6hpkOIx9BZvXWWpNG9+FK4i9yb7NiI9AKVJiFriX9a/j5LvaJ8nwnDOVcpjb0aXkM25Lmn6J4Ru
 Da5itGcQGiPmJ+aL8XGAl5SYybNGzNPeKzBpqy1tMoJ5zaWAV5neSDsi0SmHPCjq5nKDk34clUd
 ejLiYdC4oXPwBjUSRGojqoVWwAdbUJ0kkIDDqFE4KuZoAelxGyvlHGmEuIIs6VAu3NO22HsdlRU
 jy0azWlw6ad5IgpE/rvyIXXarHeL3h1Ubqx63y5rHptArKy9CBynP3XXVcU7QRO5iXnDdNg4g4F
 3tKad+/49E+3OL3zaWXiaJPs2x2pnKyNArGjTYIrsvS4c1DkBHjSM0vhRmT2Nro2ghw0q3FYse7
 uwPaG5i3UEo3SpjgHug==
X-Proofpoint-ORIG-GUID: n_t3dsRjQNWWkLvRZDCUIywPEI3Pv4H7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290035



On 10/20/2026 1:33 PM, Konrad Dybcio wrote:
>> Add support for back cover, keyboard, and SoC thermal zones through
>> temperature sensors hosted on the EC for Glymur and Mahua CRDs.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
>>  1 file changed, 44 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> index e27c697e3170..571c98124a40 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> @@ -594,10 +594,12 @@ &i2c9 {
>>  
>>  	status = "okay";
>>  
>> -	embedded-controller@76 {
>> +	ec: embedded-controller@76 {
> "ec" is a super short label, perhaps let's spell out
> embedded_controller
>

Thanks for you review, I will rename the label to embedded_controller.
> [...]
> 
>> +&thermal_zones {
>> +	ec-back-cover {
>> +		polling-delay = <10000>;
>> +		thermal-sensors = <&ec 2>;
>> +
>> +		trips {
>> +			trip-point0 {
>> +				temperature = <90000>;
> This is *really* hot!
>

The 90°C trip value was suggested by thermal team(Manaf Meethalavalappu
Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>). We are open to using a
lower value if this is too high for the keyboard and back-cover sensors.
>> +				hysteresis = <5000>;
>> +				type = "hot";
>> +			};
>> +		};
>> +	};
>> +
>> +	ec-keyboard {
>> +		polling-delay = <10000>;
>> +		thermal-sensors = <&ec 1>;
>> +
>> +		trips {
>> +			trip-point0 {
>> +				temperature = <90000>;
> Likewise
> 
> Konrad

-- 
Best Regards,
Anvesh


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660200;
	b=44duAEpLnVGU3horkz48TJGBdrwWW/P2cF7kUjUr4jAFHMGLP+vsmMmj50IewfmeJp6n
	 5IfLF/5B53ybVZCNfuDLCiwhhKH5kT45jl14dkGsPhOrdE11D6vM019yWF0pKAXBvAGZq
	 jaYbfp5Wc40+KkRBN6frfeCo0K7Ufvd6FfbHA04bgQw/vSjNKkk1p1TOcOhHYIIUn3NJk
	 g27uq3/H1DAX7nvQize/uDb3izbulsNhOFgWAoZKcz2lQvV9L/Ao94Gmq0vcYc2P/WELN
	 +jNphAK66AZWOj5BggEDROlGBaD4CF+6N0MIgzt3nm4AjSItiOcNFyw7TSsRIlBhmmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MuprgGBEIk8/OmsFZVmehe89ddAzvU7HKkgdbnCsQyI=;
	b=Rv2VYH5cHNHsDs/yqEIHMzKCvTI6m89IFpg5UG4V+5YUHAZ/FIwOinGVh7iC4TvO0z9x
	 o6qUrfdbv4FDNb0xaN8xJ3/qqwQY28CBsyf6o6T9v6xtMxO9BV+wLA2lsx/o0W7+ZfKSi
	 QupkRyg/gIrBICM4cbQWImPs1Kvf+X40hJtlLo1hyRIFK1avF43bAR8f26911ESV3cMjS
	 JLT8LpMPjlxUn+jEjpo7BKchhvniKpl8uqjBT+lfz9G537GxrrShHjd/7ojx38H8mUkA4
	 4WNB3rBrwRdIFIMb1ebFMEBNYNTNWQS2worcZ7wed+eLTz9lzoLVOHJPNqPrDWwPq8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cokJDPuq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RJCm/ytu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D32606A32E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D32606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cokJDPuq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RJCm/ytu
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70EHV2516128
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MuprgGBEIk8/OmsFZVmehe89ddAzvU7HKkgdbnCsQyI=; b=cokJDPuqF+Vy0B54
	oofPLXV1SNCp2af/gPNdNs16tsHZSPlzLzk5vR7WPz6H9IFjTpTID3B+LBfPvt01
	YB+iCNeeQYoywYV1hO08RgGendxYh698aDt3sXVqlOZhfcKx+TclNwxLk4GRY38L
	4bOvopEKuswG00Gm3ayQ8MIp8/si5626dbbV+dASRCQrPzPegiyKymUXKeiYb9wI
	hiN0SPAoojQo8BZk0tAsl3YVsMWMxxIRIxbHiC8vJci80SYPC9g7UKQ5N79gz73b
	qQdR3SIOS0oL4W7zbueaR9ArbM06lBh5dMEerFjQlyWMHzJQNwtcAVLa82L29A0I
	/jc80Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9mmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:09:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso18272685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660198; x=1793264998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MuprgGBEIk8/OmsFZVmehe89ddAzvU7HKkgdbnCsQyI=;
        b=RJCm/ytuCwgsjLgToibkZVvgT5eseFiQ9DtpCotzXIWhu0av5GyvP9yTE+ggQ7XL0D
         cX4pLiABHInNMJ3s1g/clL8ZfttxKURkTVoobzFieCeG9n9jNGd3tkweWSJ15ozCpcrV
         EaVZ/e+a8Zl+UWtg+ZXquAbNAHv+mF06f/x2LclgHHtIircb2oraiy2B2QTRjjkf0VNu
         KDgV2/Mdo5eVkMpa8fZuQLfImv0EeD/SWS6H8RxqApDR5EJIGgvLaGKy/EjA+dN8/oXx
         T3dGOZJyDHHJKdlznnaYn0YrxO9HCQrtt0rkdVJ4u538ulwVMs9WQ/xnel4EUOuOkI61
         7yqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660198; x=1793264998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MuprgGBEIk8/OmsFZVmehe89ddAzvU7HKkgdbnCsQyI=;
        b=biryqodo6NjaPNiepl7a9QF4WQTVKgR4axPbkHWnrI0/y9ywK8AJDbEYs0iUBr/MER
         WDeijs0zl3ERqkLFD25Tq7uqGxtrSVC9gGI+f3MtQ3nNh2dW7Z6+m6bCHdyk7ptV0C6/
         5inGfk1CRKoSPgmX/V0yCDLgyJ4eZgwsK0PtjUQPVWcPPvCwfoH4NIdxeIgMWAMODWpL
         zc7yy00M6OShen44xI07R1JOAFfgO/RverqnzwMSFULDvJlf7eXmkAG5z/tGZd0+9Wf8
         kP7sa5lvzis5dCycCLSx8RUvgocWs0FGCz25Wi++xJw9EQIu6x0HgtgSKEJ1FWbjpHDA
         8qdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgJmYZMYlYzKT/yfyUyH5YpzNxiyYsJSwosYkbEF/XR5wOAExRkupTv9Gd9qvzx/ma3/ZhVfIceN8dPdzV@vger.kernel.org
X-Gm-Message-State: AFq9FYJF6ZQjvlgOJEtn+nmzmSBgnMdpJyyNIRjMziBnIMFxUzDJfXxg
	708tWTZ9aiEw4GvmPUDsqhYaz6ozdUybLTL+gN17asg2HqLmNYiAHYvfZxoYUITJKmGY3t7Wfv7
	6K/WYiM3p0xzerLRINdR8w3ivOkL5w9ok6wE5oN20IXB8eq/b8U3hGzAdRzqwsxW1+FHx
X-Gm-Gg: AYBFou1Ilm2+mdIouCB81q6nIXC4lL686YTKtygmJXqzCZ1whwV08kKSS/U5APmJB/M
	naJEf902ZCwGaaVvCsszzyzQXAFcScxZSm0InCM7Z+r4C7sNIIi9sA4hWtYyR3uSJs//RWuKpms
	OyV9YyRwkWuicNRwRqa+WbsgFuewNjhEk689dPagFkrOfQoqQltLs8Zi5TnydOzu6SpYdvGkpxd
	Ww1xY2kdj2Xch7shTFor1G4/DyFxIA7jr6Ykvl0e4hvKXTbkioEdGXZupvrmQT41LIuCdY2SBZ+
	2VbLxTW0ls1i6KT2V3IKUrKszXbj4g10DNM+b0OtnI1cRKl2Mp2pa+i0nelTiGWgibQjj8yTOFy
	K5smolZjiVDNDyDzPiVSOAw==
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr985405985a.3.1792660197988;
        Thu, 22 Oct 2026 02:09:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr985403385a.3.1792660197581;
        Thu, 22 Oct 2026 02:09:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55ccabsm82839466b.33.2026.10.22.02.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:09:56 -0700 (PDT)
Message-ID: <9800eb77-0188-4b16-a672-adb7ee1a603c@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:09:53 +0200
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
Subject: Re: [PATCH 5/6] arm64: dts: qcom: kodiak: use thermal hw-bin trips
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-5-5a29be7e8ec5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002-thermal_bin-v1-5-5a29be7e8ec5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9d2e6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pjWewQ9WiOT9jlYbxO0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: e68tE-1mYH38zw1gOR3a2NLtg4utALRk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXxW59Mf0TGp8Z
 chgFFtQ7liiYq6Bxy7fXgk+c5qM2gCRNgnZat4XwLm5inxRvsQ6HpKqZpgvTnel41Ak6IESXtoZ
 q0B6mtZzz+sVWB2K2tSHtAiHo2pKpmo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX7t1ZHQhisoHs
 kuBPBTfWyw30aMKxmKl2ZAmZ4RppJ4AsY/iFs7YVGvix9Ug+YExqLUBptcZLdVfnTVC7sdPO+Pf
 v/kzdsB5/ZUUMvkqC77cvkB7uV1T9i432Zu/kxG9XFLhz8XGBc2ntM6n1YuaxAxT7nfXVi6c+98
 b6Cla9c4NGVZVbbLJjvAeDs8LZpG/B6UCkerkW94ciObgkyekFNMa1EXNtVRYAx5BkjzGCJIHAN
 bLIZ29ewm7+kJ9YyvRAdMjuSWCQIH7T1basEVF4aHC1iTP0reRaBKKc3EkIagcJ9V/ZgFsR4twh
 uHpCY1uD4s6hMjmU4zX0yi3DwlfRuj4pDFTv/RvLs7ekVDcvVQYp7cKrx5Qfnxey1BmuVRKKoMH
 vZBOGnqR7XwkCdZmuROiLPtv2oHlYREwI9NdhKhX90DajWTDthU8CGgqZUunuMDkQsSDNHgjP37
 tTIalmAmu7MbRLxwb+Q==
X-Proofpoint-GUID: e68tE-1mYH38zw1gOR3a2NLtg4utALRk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220036

On 10/2/26 12:47 PM, Gaurav Kohli wrote:
> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
> 
> kodiak-based SoCs are binned at manufacturing time, with the bin
> computed from the jtag-id and feat-id qfprom fuses.  The tsens driver
> now reads these and feeds the resulting bin to the thermal core, which
> selects per-bin trip temperatures.
> 
> Add the jtag-id and feat-id nvmem cells to the tsens nodes and convert
> the passive mitigation trip points from a fixed 95C to per-bin values
> (95C for bin 0x1, 105C for bin 0x2) using the new
> temperature-bin/thermal-hw-bin properties.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 56 +++++++++++++++++++++++++++---------
>  1 file changed, 42 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 347815e5983e..f3bb9cd8f393 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -1019,6 +1019,16 @@ gpu_speed_bin: gpu-speed-bin@1e9 {
>  				reg = <0x1e9 0x2>;
>  				bits = <5 8>;
>  			};
> +			jtag_id: jtag-id@180 {
> +				reg = <0x180 0x4>;
> +				/* bits = <offset width>: 20 bits at offset 0 */
> +				bits = <0 20>;
> +			};
> +			feat_id: feat-id@180 {
> +				reg = <0x180 0x4>;
> +				/* bits = <offset width>: 8 bits at offset 20 */
> +				bits = <20 8>;
> +			};

Couple nits: please keep a \n between each subnode


[...]

>  				cpu0_alert1: trip-point1 {
> -					temperature = <95000>;
> +					temperature-bin = <95000 105000>;

Please do <foo>, <bar> instead of <foo bar>

Konrad

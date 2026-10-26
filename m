Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010838;
	b=NFhQYs47oiVGNs9DAnES1guWmHrFe+hw02gjXO3rooMUDwI4obF5csYsB/09LTMg36BN
	 bqrcAlwMknj79Zi0jOYDhxdnIAXeUwwLG6uZoRN+oEtPI3SeCw49htpnInVKFShuCEjQp
	 pGd9XKzlgR5pse4dCdGclQp3Xp+rQubH/ZwtRybGQe6/7NShBKR70cRp+i94scXF3MBpj
	 b4/ELeACGkq6UBzYH8WOes4dwbrlTWQfmxvi4AUhav8+lEHnCrs22fNtfCvoRDsLA1JGp
	 Fh0emHJLajhbH0ZsYrYERPsOW6udwA4TlNZalgl/SAeuOpddpskD7CZ6L836Es5VbcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+PNBpgjpi7/qrYdi32lyRfdAOZDa8x83xqfpzeO/qvI=;
	b=4rD6W+dh0slNvOowsBQbayZ7MUkG7JnIVrhK8XQ+TfxdC6FzfoAav6h2a4lEBloDtdXq
	 Tm1dpbFnAO2MtrriCMV634UOlK+SwwkmBqNvUMoB+U9hRXa+Y7ewQQNSZZVtjnqkyZl4x
	 UKaBzNF1C6vsyxv7vEfN7ttgMKK+nb6/rT1wlu9snBQ2tOwoANagd4SkQGFf2sgUmhH6h
	 CYJKlivgEvWfrBz8E8la06PVi08XSTfk44VH+VNsiMaBBBOIa3tM3FH3AHxEEigFI5MTi
	 1BsitusmTOcEUBtnLJ5MJQBmlmTaAAtddgmhfWF2ivyJo3dMf7701yIJM57o9xQaw1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=efqPBj42;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X5CLsUL3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E32606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0E32606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=efqPBj42;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X5CLsUL3
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QA3xKQ3521900
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+PNBpgjpi7/qrYdi32lyRfdAOZDa8x83xqfpzeO/qvI=; b=efqPBj42DvWp68QC
	tQwCrDbi6t7LRFAf8E6X1hSi4442mMaqva/7TPbCoAz/hyQJhtQSA8JpEyAvtOH8
	6yujr3DFSVqMiDC/uZBSRdp8s7XFWbPapYEiUXHEZ/Cf8xYPVG0V7OlE1QRyDcNp
	MrkpLfuXMmiQ0/vzWrAM9o7+e5UMqBGZxXNVUOxYI8hDGx3RgkoP9tNHd8A4Qqo9
	6jL6Pan/QDV/3FKzje/XIcbh9MxcFMt4XUohTFXWb017edqcQi5qbVOeBBtYo4sH
	cOG5L05lrh6yIXe9jiKjbyHt5+Ya80FHJbbIEOTIZARNYzFLP1aHi9aJdvaaQBWm
	xUiCHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf03p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:33:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso43472385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010836; x=1793615636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PNBpgjpi7/qrYdi32lyRfdAOZDa8x83xqfpzeO/qvI=;
        b=X5CLsUL3Zvyu1h2hGlesrWmTgs1x/c8t713g2Uk7GKt3LRAHX4hqFtLYe/25XS2Wfq
         ixHl1lm8vC/cSibFfssPr01Z7ksyS780SbrSLXFObqNnYB6ba/bPa4K6mmm/hpDLbvk4
         Ci/QHfY9FkTq4b4Eufo6fCYoKKkZUiP4rNEsy4dtC7TyrXufHL8tFETzmnypin2FFoZt
         VDb4Vzc8YE9QE/GE/0C8lwYzmSGswYn/AxabBX+3qbv9A8ExCwNZh4MdyZdyMpQCzUUt
         cKZDp0dHSAMMuR0KYDmmcVhcMaln50yUlhqUOgr6KUz3QofLzaHxLaXLHPJzgeHs5XVw
         4yhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010836; x=1793615636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+PNBpgjpi7/qrYdi32lyRfdAOZDa8x83xqfpzeO/qvI=;
        b=VyBleFWwjfMi802FK5lh8/R6nDsVS1BrKxZUzDublq5GbLTnx8P4UY8IxxZeJROquF
         B3Fb9MaI0wnXYzfnLAeD7bSZ3BREIAH7dmfaHirnX5xXBGvVlWGpFcmu/TqkT9+AZV8w
         iIcXbVGTplEbdbWSJ6+SktTsGqFUk/vswSRBVfOlZNutU+idndJHVYH5lkY21zq9EjuF
         2JBEW65wT4rQaSW3BhdwMHhyWsi7xVNHktzFMVP84S0+hJQtAVEzrw3gW8TLBDBomyrv
         xC0hwsyZ5rNpOcnDeKgLE0N8gEWsOZDoceEEQCfERypA3ClImh+cwUR1tlG/HEwLgFSQ
         rjNA==
X-Gm-Message-State: AFq9FYInbEsQBxuoRu4n1P0wUHg0xwWeopMM0JT4WYP2E0PatfqXxHZC
	YwaKv/E8dKYPKjEG09Ms5PjW9OAyY446KVRPN2PFjtGkmF59TRcMMYAG6+VFoRdoQs9XrpEjPeY
	qCS3MMwpn2Dy6ZQLCUE4vF8tvhDClztf0T3PVDMkUEPQfuq+eESiGPidwYxLKV+83Hut0
X-Gm-Gg: AYBFou2OL/jl+s5olWChT4A164oRG5NW2sWiZv2L/f+/sBPG5GyTLY8s7v35KlXMQvr
	wvEwdLAYe8EzX0e3D0i8k7NWc+u6e0Nmsd2iBulIs94QXZkEMvttlaqgj3juECEo20PsFuDBVl3
	0fjjDRGV97u6NiYrbUsDilH54tZci6dys8qEOdbdvxBB1Jjd0va8GqaWOu89Pv7KvTE7SOeZE30
	ToLagsSFEPzu+2VkpC9qO28ptxDuLNLd8j4fKllUqs8R8nN7MYhM1w0qWls/P6HCobBB0/zRB3L
	MtEgSkwUj5EWHbLXl8qG5EB1Lna8Dq7zxdHyKksvXPlWKH/zg4vXCnv25vUHu0MTqsWF0V3oFjU
	vuwsrN0jwEAKTlt9Q97211g==
X-Received: by 2002:a05:620a:8794:b0:93f:43a4:a48f with SMTP id af79cd13be357-940ef96b4d0mr926285985a.5.1793010836234;
        Mon, 26 Oct 2026 03:33:56 -0700 (PDT)
X-Received: by 2002:a05:620a:8794:b0:93f:43a4:a48f with SMTP id af79cd13be357-940ef96b4d0mr926282985a.5.1793010835661;
        Mon, 26 Oct 2026 03:33:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459918a8sm3369634a12.32.2026.10.26.03.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:33:54 -0700 (PDT)
Message-ID: <4795f0df-bb11-4c4c-aa05-09b7d4896e3c@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:33:53 +0100
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
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI
 bridge
To: ShiTou Hong <redstone.dcity@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ShiTou Hong <dc_redstone@outlook.com>,
        KancyJoe <kancy2333@outlook.com>
References: <20261023072832.2642647-1-dc_redstone@outlook.com>
 <20261023072832.2642647-2-dc_redstone@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023072832.2642647-2-dc_redstone@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX2UHcKi/qPTHf
 r3qoMbq1m939jNm7dBFLXouspSeqAGLnODEPDQApHfdRAwh5s4bJC71LDcSg3jCgjzWr4ddn9hU
 DeIySjSXiGGGQragBTXcUf6EzcqLRI8=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf2c94 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=biRb7e_lRXOmE3YyW80A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: _3q4819Fy89ah9YG_5BzxomV7OFzTpJY
X-Proofpoint-ORIG-GUID: _3q4819Fy89ah9YG_5BzxomV7OFzTpJY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfXy6sAwXmcoWOK
 ICcv8ZInDAKOlwu/vDw5IIJHLIbvJpgAemzomzjYX2BeuJfuMl0Xrgw0HcG85xddIKxRAvwgYTg
 UZsPIvqRfl60595sFilkwu4ZXzAW/bdzubi88FFnUQSC8v4ADJvSYv2R0mkds5Pf6LH4O3LlG6q
 4mqsiA739znPqnDS/yLjqnuob1X3Dnia81CMqMgH2mRYUEazfFnVaEL+1Pys+FNB1cABQ9Yd+ry
 JsHDyVShIxerN4Stjy0JKKLJPZlPoPnwpBAM0mZ1IoFyqHi0vZfx/HpfenVm9wWIj7BVZgFBB5y
 eYFiuBmZq7j05ZBs+lR/KbpRY0hpbUcXk8B7fC4ZvxarZGc/8kKDNwA59R+AiofLcnhZlytC8Qk
 AlbRXWK0BsxrwT9ZtisYUfokcZAIPy3WnrOMBgnfNfJXw9aZHswulLJJFsnf/IKkRDudbz8Q1q8
 +8Hk7Fm3U7n+e0GABOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260041

On 10/23/26 9:28 AM, ShiTou Hong wrote:
> The sm8250-hdk has a video bridge chip LT9611UXC
> converting MIPI DSI to HDMI, which hasn't been added
> in the dts, so we have no HDMI signal.
> 
> Add the 1V2 supply node for the chip and the HDMI connector node.
> Enable the i2c port of the chip, the display controller and DSI port.
> Add the pinctrl of LT9611UXC's RST and IRQ pins.
> 
> Co-developed-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 105 ++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> index a049d78f5..0bc946682 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> @@ -44,6 +44,18 @@ vreg_s4a_1p8: pm8150-s4 {
>  		vin-supply = <&vph_pwr>;
>  	};
>  
> +	lt9611_1v2: lt9611-vdd12-regulator {

Please keep nodes in order:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

This DT may need some love in this regard.. time flies, 8250 is now
apparently 7 years old..

[...]

> +&i2c1 {
> +	status = "okay";
> +	clock-frequency = <400000>;

Keep status as the last property, with an \n preceding it

> +
> +	lt9611_codec: hdmi-bridge@2b {
> +		compatible = "lontium,lt9611uxc";
> +		reg = <0x2b>;
> +		#sound-dai-cells = <1>;
> +
> +		interrupts-extended = <&tlmm 1 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&lt9611_1v2>;
> +		vcc-supply = <&vreg_bob>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lt9611_pins>;

property-n
property-names

in this order, please

Konrad

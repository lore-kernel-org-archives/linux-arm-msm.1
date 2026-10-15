Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5825744470C
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792056169; cv=none; b=aZZknl16dci2BoWD0y728Z+3PweY9/ZXopz6YiZEEvVsznxArfvcVVHEd03WsqLKZ7Hyw0ZIaUn2Av0M1X2EtTdHfw3V4c4aDksU8tRd8t8uX7cAiUrBRmIE0mNDmURDJkW7SxHC3/UfMhk4Z3naZCUUhNpk0tmaRJKIDheRTts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792056169; c=relaxed/simple;
	bh=hMfKOvmAzlo5fI5dBlL9WCAS+avt+pks4MJuSRxNFeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1BB5MDo2HCQD2qvLDAnX3i6jqg+9eQT4v847uedm+0HifI48bw4JJ0mZOSI3AWtSysCzl7M6G+u9cYQxdpY1jeE/YzcNzROIEx4Bmp7QPp1byHPQhFBC9f9KQthY9tde8jjl2Gt4i6TlCwEjxgtOpe97NBHONtTmiit9dmb14k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hw69Rp+O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXGumam5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hw69Rp+O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXGumam5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F72Vtv2121303
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YIcabBqKQNdc2sscABVfZLyCZqhIe0PxX/KTiOQKlRE=; b=Hw69Rp+OZti0pWo4
	dAnFhXof4mifnLJz5qFIrgrN0bySW9NiMCthFE/NI/OTvSxmatjP0I8VXddUFaPZ
	9ug/vTHXge8hL++FL66FylhdNj+Y+keelsgmaXESGGxgQrSDUyXUOBSQTW3IPxgv
	bdnStMhLr1AMzbL2NxjiEbdnl1V3/Z8+csG57MZd2kh2ahrj6eUrmll8D6eW3Olb
	kfU1LhCp/Pis5vVQN68G3yKjPIkwUvrZ6WYPrHH2CPxBl9xodYxqAakhUlkm2rwT
	8iRxzJ088aHS4xYVAHDDlChixzmeHvcbQX4kV48HqWvMj6CNIiReVZ8oIfT1/OyP
	QAS9yg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn1yty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:22:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90520763ceaso19429426d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792056164; x=1792660964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YIcabBqKQNdc2sscABVfZLyCZqhIe0PxX/KTiOQKlRE=;
        b=HXGumam5cI1CeEIGI1V9fV3Yz6eVGwXG1zu0A0s7eSrfMANOTloS1wUXDvbVrBmaYh
         K16Zbbw9n/jRQQrnH45DNvhsa4PAHS9mraOLfAjA0S7OYKDzDdOwGYsfLFW4b3T3zHrE
         qJNpiC9RkwAlD/eaic/Bo5K9P7m1/KG1am99jVVNIHvOJKvvV/pklFzyX4bUuXKvcxUe
         XWfxDt1ZzjZ1iMqS+JLtkC5yuI0wkxkKYWk/2V+fZhKAgBjfVBF5s/iwvVlv7t1A7iVl
         Et7he/k5Hek/D9H07kpZ/HlfsTaLkse20imIXlgQlUOVF1svDBAgLEqBUIaTWTYhrtIM
         P4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792056164; x=1792660964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YIcabBqKQNdc2sscABVfZLyCZqhIe0PxX/KTiOQKlRE=;
        b=rDhrx4elCWGbcH0H3ywN/X9Nda2q4ejA0AAoa77dV1kfDl6aI7e3ld30uB9KKPma6A
         6kNhUIyZM1km1KzXu2oag9LboKoOpy9sVZ4/F1PU2LHCdQ/0nCwJwM9ZZu6An/9DNsfq
         TkgSoIYmeBUDkpP9NLLI0XyIT/g9KjIQuBA3CcVKRGRdeFhpIfX5whYA4IyY1ldqjiGI
         qejpKIQlMM64qFeWE+8ZDfWzX8QU7pw5Y36OkEUM6CwBZIqYYJc4KxhFBu6fBDbPy2I3
         LsPd+xbDHD+e7Jk/JDfd7z4VEJGYM/BXOAWthpThwyaErUJqwR2u3veb0Xa/9jR7rB8o
         nShw==
X-Gm-Message-State: AFq9FYJF66ikw+EfO2G/tuVGQd6aOlicuBl5GnrdU65UbW56NUYG2gWW
	njIn19f4Ujuf+27fDkgc3CdtXr9XNAfMQdTHijBZljEBlX8LgwkqLXQJwP0M4p+e6szm9uk5FrZ
	uLO8tNIeIno7bIF/SKxt5I9bpBtql2AKVOU1bp2I2ZqSaM5AWQRYQglv9Tl1H27CpDCGM
X-Gm-Gg: AYBFou2kTBhOU3YZ3NAsn4iQS0l2olc5fOCnn7jWHqA2Qh+8JiXLyJdRXyxB0nkrJSg
	N5ieRBhuY0iHmW0220AbJ46L4oM56a0cMywSKEmdVFS8aVoLvv5KtHyqKjRGqm4buoSJ3TShRO2
	oSBXqHeRhT/mL6+wNVBuR9O1zr0C1iQAT0FLrag8e0BuVMIWlQSmw163I8P4YcWkA5LfQwdLkhj
	/oRvs5+0c92shY5trr36In71lmM0lkGARPICqqRf851lhzg/LPDZ2dIQykm3arBCA+UXwg0NiOS
	iXik7Sz0VfLVU6AHdCXzu8tONHT4iZuIg7yQ3DrhrTCNSSN24Bn2G+bN2Y2d7rW5+vb9aVjc1UQ
	aYHh4bR154dYRsZcYRPDK1A==
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr3098127785a.5.1792056164153;
        Thu, 15 Oct 2026 02:22:44 -0700 (PDT)
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr3098112685a.5.1792056162106;
        Thu, 15 Oct 2026 02:22:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203863511sm2303895a12.20.2026.10.15.02.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:22:41 -0700 (PDT)
Message-ID: <40657da7-b823-403b-a5d1-ae384db7f3a8@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:22:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra: Add BAM-DMUX support
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stephan@gerhold.net,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260920-qcom-shikra-dts-bam-dmux-v3-1-91474d507d61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920-qcom-shikra-dts-bam-dmux-v3-1-91474d507d61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNyBTYWx0ZWRfX1QSvSkNBq7qD
 Msdem86LP2VI6xODiKL1JOC5kBGFxNCRCprduVrSn5eMMR8tgdimgXp0ryLK9sdXO6Nn8oYr1NY
 Nec1wjE4vaIObYxhpElS+zTqj4FKoXEB5HAWZtVmqRuuyMItJRFCX9kFYR1BChuN/tl81NtCZIC
 VrV2Db8+jWHidhQtUvJjHFV3hGBjJ/32amRDQQrym1WKHAwxmJZ6gbFbaX96JCJOs4k++RZnLy+
 O5BUBpnAOTnJVn4p1lQO+tKflrA8uByIFB0GSVjzOpAZ/B64L1SZENWUgtUjIZSAU05OOpiaJUG
 NTZSTGjxGTlzDTeDD0LswLK1ZdgbqZvcMR7JDSEQHHHiAUT3VAbvQs63+gH30ST8YohNjrIAP5K
 xTR8G6NaxNSO9TuRgPQdM7VsgxA1YLgKwWH3VHpvc0HOKgfwiM8uVTEQHuvSYHliuxzpgDbsN2q
 g42R7c5HDVxpCWxQFKA==
X-Proofpoint-GUID: QSf44qmJgfzhoPpZ493RiUvn5k2Yyxxh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNyBTYWx0ZWRfX+P75G2M1cefe
 3xkRbM3tq1PFymeRE3qzsDOXTpgXyj3Nx0MyZtsc3zAofgxpJQ3LSUoHKPCz8P1dkFD6tEWOA8G
 djxEw06Yi6XIJVpkv9WgvVLzD05+N3g=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad09b64 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=n0qhTGZLqvVnVCnvLeoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: QSf44qmJgfzhoPpZ493RiUvn5k2Yyxxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150037

On 9/20/26 5:28 AM, Vishnu Santhosh wrote:
> Add the SMSM state entries, BAM-DMUX node, and BAM DMA controller needed
> to provide modem data channels on Shikra.
> 
> Reserve a 256 KiB restricted DMA pool and reference it from both the
> BAM-DMUX and BAM DMA nodes. Set qcom,vmid to NAV so the BAM-DMUX driver
> can grant the modem access to the complete pool before requesting the DMA
> channels.

[...]

> +	smsm {
> +		compatible = "qcom,smsm";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		mboxes = <0>, <&apcs_glb 13>;

Why is there a "null" reference?

> +		apps_smsm: apps@0 {
> +			reg = <0>;
> +			#qcom,smem-state-cells = <1>;
> +		};
> +		modem_smsm: modem@1 {
> +			reg = <1>;
> +			interrupts = <GIC_SPI 69 IRQ_TYPE_EDGE_RISING 0>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};

Please retain a newline between each subnode and between the last property
and the first subnode

> +	};
> +
>  	soc: soc@0 {
>  		compatible = "simple-bus";
>  
> @@ -1866,6 +1891,20 @@ glink-edge {
>  				qcom,remote-pid = <1>;
>  				label = "mpss";
>  			};
> +
> +			bam_dmux: bam-dmux {

Nodes should be sorted within their scope

> +				compatible = "qcom,bam-dmux";
> +				interrupt-parent = <&modem_smsm>;
> +				interrupts = <1 IRQ_TYPE_EDGE_BOTH>,
> +					     <11 IRQ_TYPE_EDGE_BOTH>;

interrupts-extended = <&foo bar baz>

> +				interrupt-names = "pc", "pc-ack";
> +				qcom,smem-states = <&apps_smsm 1>, <&apps_smsm 11>;
> +				qcom,smem-state-names = "pc", "pc-ack";

1 entry a line, please

[...]

> base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
> change-id: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
> prerequisite-message-id: 20260908-shikra-pas-bam-dmux-binding-v4-1-6044889e7e3d@oss.qualcomm.com
> prerequisite-patch-id: c3d19e8dbf9451f9f8155c86c21a4e6b5dc796d0
> prerequisite-message-id: 20260920-qcom-bam-dma-vmid-ext-v2-1-4dbbff0e57c8@oss.qualcomm.com
> prerequisite-patch-id: 30840b157a197cc896556c0152b26a00abba0010
> prerequisite-message-id: 20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com
> prerequisite-patch-id: a9c2ce26fabf293f94f384409991f8a9b3afaafa
> prerequisite-patch-id: c4d2876bea87e825468eb3bd116bfdf5a203f7c1

This list screams ""can't merge this patch"". Please either send changes
in a series or hold off until the dependencies are met.

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D4656B869
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096195; cv=none; b=O1gxXdk8PRM+E6EFbzzr9bLz+oGPMaEAHMCIrD81pYkvcWhnYeT+LrpLZtTGxQfVeteiecPMFDt6l4iSksy2SnyrOcuhs7wZWJAXkllXeAt2cUmiqCqsl2u+vThs07cwaWKuSpjLDrE5/lZMaee8ibiWtB7ib5ZwgKDb+SrWjxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096195; c=relaxed/simple;
	bh=Ng/5uaFZi9LYWsGb2fCTbvjBI8go5dl00sRS5YXJoso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JIWj698kREXwoXFBzIkHlk/pUG+I+PImm0QeZpinXaDetYJEHrtOjK0TqcNeg/5/OuQZ2AIwSXa86wdGeueTKn5k0eL6PTjlGsSIO0UZebXpJRtFUWD5FKB3Qbs4egeCkC95+9Hv5+ffVh1cbfnGqIH6mo2/tsw6J+qWjPTWRug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZA12WAif; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdtEHzMT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZA12WAif";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdtEHzMT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEikUe3924100
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8wROlQAz+HLKs1Kk2OvPyUzCFdF6E7hi8VD6cVYK6FQ=; b=ZA12WAifBoEcqaU9
	TuoGvjLHsrp5ZGwabJqI/RF8d+pMnmaNZoIivif6kAxLppo/wjKEapCtKUt21u1q
	/507q6WEv9Wa7LwwVnvMZ37ikoBtA+PPH8TXQqFX+xI0zHyA2YWC6wniDuP8TvIX
	lIVVjGU2C6XHE7XFk6Bd+J1J9amTdaH3zL+NTh9uU+H5hj2RfjRuXe36RTsHa8JT
	dNUuO2cH3DDiT6ocK4ErhIPoSuNioA4ZZVuFsDcRcuLyUBKx4t5vth1ebDdFBfxO
	l9l3dw4Tv7iKOfj99UFQecpjxO8j7gcXj7dketjKeGNJpaw8w/nIgVS+ncqVjF6u
	fcMp7g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec0sf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:56:32 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7a6634ef51bso1814137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790096191; x=1790700991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wROlQAz+HLKs1Kk2OvPyUzCFdF6E7hi8VD6cVYK6FQ=;
        b=OdtEHzMT18b7Pr/bMMyi+wAEA9hYHE6yU589IwyPJbjkmbLTJTUAfFh7ofbPxZCQZm
         sg2Vx124uT95u8AGDjCgZGQYxo9TbiVzX6tklG6EH3EuW6igRDuJR0h6bwMOLP2sm2iy
         XHZqm+lfBrCvFyjbFABwH9wpC9rbHYS/BEsutpDFHD1g81TZPRGmabbEpQGqaQ02jV9L
         y1DPBHE3yBXPst6evNt4/epaJaJt3Fhj9v19ouvCNsYmP1RmTOE00G3whjeTuQHB+RdD
         mbFKx80GvB9W8DQLoMzOBAbXM4HttRjEJMGZSSBvbOxlbL+2S5sAzvzBd2z3UxWpL9aq
         UVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096191; x=1790700991;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wROlQAz+HLKs1Kk2OvPyUzCFdF6E7hi8VD6cVYK6FQ=;
        b=iXZkFr2c9nZFq/e/u/ZCcS91UpKet+P9ZCWY1theY5KxIWVEi8qNbzLVHZrC55DvC2
         8woOJqoo9qFjcOPeynW9cPM+xj43Ofb/U1jRXIC7gzkfV0/c/BRFxmfikoXdnTlOzC6G
         tOoNVgedWp4s0sRYk5+fgR013kbxqtkkcrZ2WbMo/TzyXBiKkOHtu7O06bxhVhCq5D9c
         nyO+hRIwO3D1lFnYqSeIgORBtDmcf8UHSlE6pWhjkh97oYJj2qwqAcArA7gwzcWSzfvS
         AGAMx6toD2dW9MZXT3JCsBTHB9TLkZDxan4uZOyXw14ZGZYgxZsE+BWi/yhmO31Mn12k
         RtOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzr4ty2tEWibSZCflI0VwoBWjsnGD82urHiLBiptc57DKj+GTF4RE9HW6ghSHZL97oIZh9Jr4p5lxQU/Wu8@vger.kernel.org
X-Gm-Message-State: AFuF++kRviHZ41Rbh8dOPo4MDPWNya+EefTenJBBmRaZZUgZPa4RT1yu
	dt51dMLOS4hNX1RhrMstThA7FwzJ2poLz3Na23N1UG83Lc6I/LAmWJB4L+a5f7jyE+UFqAFg6qC
	oS/RddOIuP57f0vlINRaMwn6ma3I8ULeLBE5IykYLoutK9g0BFOQNK/6fgXHLodD6fsjN
X-Gm-Gg: AYBFou2jEReH/h5eZodW+73lngFZIpwZrnQpu+bJsV26Cy02yBBpOLxkNsEMn+RDtgn
	qO/yO6jE8sMkPkys0Cv9OS7zL2TpRqOVfrLuM019HIJkt9Fbh5X7KXmgpTdcbI5v8nm/3Y9jhxv
	DdAMqFhYXUioHvZBj6p7HMJuHk+2/qvBleYLheRclUMcJZyxUQyr4pakhJlqDXOjXhspcil7Vqm
	9ZA6ZFVwtCv1jovDCELajdtZ/rCNMMvWTsPpAUjCAbdEnQp+CbutKvtF+f0UQNi8IsICZ2DnyuB
	G499ukPGoINFANVR2m24xxsvIUU9XY29bqX4DVNJmfWRj5CHNKmagx4wQZSoabgFA64slXe8cLn
	4wNtMIAANh30KwfZpH2fJUA==
X-Received: by 2002:a05:6102:3710:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7a7326b6d93mr6830213137.2.1790096191427;
        Tue, 22 Sep 2026 09:56:31 -0700 (PDT)
X-Received: by 2002:a05:6102:3710:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7a7326b6d93mr6830165137.2.1790096190901;
        Tue, 22 Sep 2026 09:56:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c6241a3sm115662466b.52.2026.09.22.09.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:56:30 -0700 (PDT)
Message-ID: <22b6ac66-a29d-4e9f-a02e-f0d38e0aaee9@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:56:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: shikra-cqm-evk: Enable sound
 card support
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260910231642.1794948-7-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910231642.1794948-7-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NyBTYWx0ZWRfX+huZNfG8S7Fi
 HEgpOxDXZyagvXi8/+qxXZ3uWJaymZKH2wlNIQAGkWYwTpV9uElHyBCU50+n5ecFink24Ibh8Ri
 0tpws0F5OhKWBDrUN35+jNOiBXoMIGNPlbLt9XQMINiAV9mQHxAXNNN8FlM21IhzBAqugKuSco2
 GBvg2JM8RpStYsq1qcumNXoFHzfvFWrz3yqwjOALmlFEE7pFeRTJJXHVS47caNJ7HTiFgX9CSwt
 /gmKDC1l1jPtXLsxeIxelPmiQculQyRy7NsDwk+RRzbrtoqnNT7YdTiWuJGshcI754/7z/U43BD
 Bw+Fc2l3XbVE8rZS3OW1XWdEEvR9CbRbqm/fYaLUn1ShNT5Rgsv/OHbtk8NslAWN5edNd6VNbrf
 3IXwekfqpieuDAQfGZ2t02/ocR2T/nmfxB0vX00NnxWJeSbaTyAY+aE1FI6If0Gv4MAygm1F3SS
 5xmETxiZjxcHpok7xAg==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2b340 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=RMMXu7680as21xinOGwA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: DdSZHx4jDCSaxlsE_zTmaUAxm1rivqxV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NyBTYWx0ZWRfX0rzCOqVU+7RJ
 xPL9ptCRrRhQbfHAjj7Xa7bPtnAvpmO0d+bS56xygUC1cmHFoMW8JsovjeMVqtfMzAR6EJrEYvT
 RIwigx66I64Wqd/mu8thwxO2jje4k1w=
X-Proofpoint-ORIG-GUID: DdSZHx4jDCSaxlsE_zTmaUAxm1rivqxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220247

On 9/11/26 1:16 AM, Mohammad Rafi Shaik wrote:
> Enable the sound card on the shikra-cqm-evk platform, including
> the PM4125 (Rouleur) headset codec, WSA885x external speaker path,
> and QAIF backend links.
> 
> Also enable the required LPASS macro and SoundWire nodes, along with
> the necessary pinctrl configurations for DMIC and I2S interfaces.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

[...]
> +&gpr {
> +	status = "disabled";
> +};

Why?

> +
> +&i2c3 {
> +	status = "okay";
> +
> +	wsa8855: speaker@c {
> +		compatible = "qcom,wsa8855";
> +		reg = <0x0c>;
> +
> +		pinctrl-0 = <&wsa8855_spkr_sd_n>;
> +		pinctrl-names = "default";
> +
> +		powerdown-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
> +		vdd-1p8-supply = <&pm4125_l15>;
> +		vdd-io-supply = <&pm4125_l15>;
> +		qcom,battery-config = "1s";

[...]

> +&vamacro {
> +	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&tx_swr_active>;
> +	pinctrl-names = "default";
> +
> +	qcom,dmic-sample-rate = <4800000>;
> +	status = "okay";
> +};

nit: please keep a \n before 'status' consistently

Konrad

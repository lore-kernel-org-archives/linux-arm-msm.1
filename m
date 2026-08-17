Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95364442385
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982357; cv=none; b=a75964JHMKSeibg+4DfT/tqDRvok68SiGijGUuCy8PRoIlJbDCyMmj8V1eaWDtslZIj6yklilC4U68L/ccDyWUl/JNnCSEOr3SFDiSDlBP4cjFgaulgDTIfGwcaeaisG5OCQKvtGLiWiev2oohNfikPZtV9EuZHGr+ZLBg+oU0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982357; c=relaxed/simple;
	bh=aaH9lbVuJj0q9BWXv+5Hkwn1QmGhneskXi8mbAoYU5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PrrextmEDlkPjBs9uqyB+9SpFRJ6588VLGu/1Nx1RVU8DGNOqdCm+J38vUwt0DSafvCf71WSsF4nLgvf4xk01Khod8ojeQv4Rc7/zs8hQfhLvhMQuqETvkHsyG5uc1dkZE54z1nfdEHYCti5giZDTFAQIH/WNvh/SQmzq+tJgss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrcC47oC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrOko72G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrcC47oC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrOko72G"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYsMt1840275
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 15:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACldy0aiVSHL8k6IBZhXMiInAvqs3SiE9+icRfANvIU=; b=IrcC47oCgczwrEfb
	ooUgjXIwljq4P96rWO2Noz1JZFvdyV1g5px+AImCT9D0glgVslNnjj3KAl7eBeoH
	RCEWKameg6JQF+lUJE/31LASyusw9zGQOcAH4o1JM4BmWu0pSM8XOajJpu0KnvZ3
	VJa/jjzjWUBBinjWXOevcpau47jXXHQh35AyMMJPWANFnGOkezLRIgKBX+1qm6h5
	7V6vsNHbS5W8fInJ7oM9kAWZQ4ilQF9wd4N6ZZNcrj6I5CS2d+oWq+9YAJ32PCxH
	+nTxibx6e8geu8a+tVK68JzQYpmHlF6AK+hTZshyQUnDa6aRGwKIF5a4i5yZxfIY
	iWDezw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3x30hx0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 15:59:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d57d17d6cso4941381cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786982355; x=1787587155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACldy0aiVSHL8k6IBZhXMiInAvqs3SiE9+icRfANvIU=;
        b=DrOko72GfYuPgAN6Z3BT3OJfLHQ++xOD/2wQsuvTLVbCiFTZlM3GgpmDeTMhqRfrTv
         8/K0rd9XEH4xzI45c1rZMe7SHEqwo0vDffVstskWzDxKWHUZmka+rpzatI8Q0vR7rqAo
         bdRMLCBUBrRsUFmrbPSTdLVjCSx5ER01/3USJKjrK5rQbZevqvGerfEweRnS2b3yqVI3
         Q0sACQJvUFPz9dL/Jb8SRrsxZOVIR6aLiaMMECbGMiVkhpQDoD+NJgxXY6DYJzVd87Mc
         6vjFmodiCip+dqLvSKszh7qG//tsyTdQpIB+SlOTKukS6mnAx0ojEgLBzYPEdlJWeo4/
         5PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982355; x=1787587155;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACldy0aiVSHL8k6IBZhXMiInAvqs3SiE9+icRfANvIU=;
        b=DE3F6ay4fG/ZzNXmU5n2L56AI1XKAbzHCCe77IMKSaYulErjXD2Aq4YgU78mgs652l
         rOr50c2wkXQiKhE/tIKe6aS7X+XR63RXvxl2ZpxUk53sA3YtRtXgh0i1OOpnV973w80/
         6wIshFQa12KWZ2e06in7ljn4tmr5dfiY3hTDJOxGBxwRsgxHVKVpKYvps4dEwk0rXFXi
         hIpgKvluEzVXJEc6Ff59gJMj8KJTMAt3VPw8nMBbIVMSMHBYxkl1CbO4Rbgsypdl2M5M
         f1pJfcBvDKSb7Ssz9rhLsgAjSQ3GM1WSftKy/3NrOTeknS1NJVhCivGMKsojZZUYeLU0
         06Vw==
X-Gm-Message-State: AOJu0YxAI7bPQ13yj6a9SSAmEaUayn/3dt+Nfxj3wbZ2Osip3nyVoJav
	2UCudghPY2/z2NKvRj5vgMHSks8Qor3Ijzxz8TwF0oseFs+UNZp/q9SP+D0ML4stRWFcRHBSuuq
	3E8Nqkj6ZsM25u1qUESwfmmaPxGkcfwFaEVOoBIigk/riABzWdLYqdQY7NtruSkZxl4jX
X-Gm-Gg: AR+sD11cYFelD+oJvn1pczsbLrkBzT35XCjslLhRl0zZfXL4bNcnas9FoYLxR9F0KD5
	PqWN0nMbb4KsC/gVLw7YSj06i5mcx+KyiBEyD5c2n3zSGnSywkRQUiNmkMvstIcEsX7qefkSruT
	D6tLgKlri7piE46RNrG16P5bIXnxhC5qM397MQRcmaehCileHuqyjDDFh17UfCjv29LZtmhCi1z
	jZFZclMt0pYtQnBwlJAY0HQcnwYFJS/gh1kptn1ES7pUT3DaPmn65HG6iFs16gSSB+YkNinul4w
	BLA14o+4ofkz/v/AJRmd8XqoARYuqG7GYdl4Fs56IQBDu1f3/2zoWi+XFj8hSW2Y/dIY6SCJqWn
	XusjuCI19JMZ2A13x7LlUD1QY
X-Received: by 2002:ac8:5fd1:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52d852d4f3dmr190512681cf.1.1786982354412;
        Mon, 17 Aug 2026 08:59:14 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52d852d4f3dmr190512041cf.1.1786982353825;
        Mon, 17 Aug 2026 08:59:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b74059sm45883166b.38.2026.08.17.08.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 08:59:13 -0700 (PDT)
Message-ID: <db394200-2a29-4f17-a2d9-61d5ab15df60@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 17:59:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: Add Motorola One
To: Adam Skladowski <a39.skl@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
 <20260810-next-patches-v1-3-79a779d76173@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-next-patches-v1-3-79a779d76173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyMiBTYWx0ZWRfX/H1X+0AE9oJg
 X61zSIBARr8zXUQFmYDbsJU1mEqUFH4WIFouUdH54D8clLf6YXLBMfyqQwQQZtYbI6QfxoiFhV9
 yAuEKWMhSJz/5KYYpKrdFi8kwemOupLk5qpRJqsOc/da42/06EQUwncSRpIup2FMjcf4ci+EIEN
 nZzc7sD83KcJZORAWUkJPDIluTuMfMRMZq4JPfB8rVolPUNe20BfQOFHx94USGyXJd73N/mbl81
 kSfg7oaBzMZ16SwR0nOnhmHWqSSzCZReFxRoj7msvOYmhCuwDrk4n4D6VxbkvPXi7UOgZS+qI62
 L8hccSpxetf1FkzKA2fUYna5pKDGkZypRFdKBgutXN5mp7Yp0iQdULpoglU49HrueiHSobHIX8h
 9RPqeM3NbUpWPsS/kgBMtsDGBf48pJA+rkLnUzr3VIF3S0Ntj26V7Sqk9UmH4zVMN1tnes0tNr3
 19uR3KQiCLn21XCspLg==
X-Proofpoint-GUID: fMOabDs-Wmee5Thb34RE58dmWCw52Fvc
X-Proofpoint-ORIG-GUID: fMOabDs-Wmee5Thb34RE58dmWCw52Fvc
X-Authority-Analysis: v=2.4 cv=Y9/IdBeN c=1 sm=1 tr=0 ts=6a832fd3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=kDiaLF9t6-FkB4tI0JsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyMiBTYWx0ZWRfX4o1kFEJoL8nd
 nLuZm7ZcVIAjjqtLdDzchhYgBsHVVWxsr46JCZbM6KKCzstAUlorRVX77iki6vbQ/SKauq6Dl0W
 AM3rFdV64ArkVQTGIol5TCE4P9nhSFs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170122

On 8/10/26 6:55 PM, Adam Skladowski wrote:
> Add a devicetree for the Motorola One smartphone, which is based
> on the Jacala/MSM8953 SoC.

[...]

> +&i2c_1 {
> +	status = "disabled";
> +
> +	typec-portc@22 {
> +		compatible = "fcs,fusb302";
> +		reg = <0x22>;
> +		interrupts-extended = <&tlmm 9 IRQ_TYPE_EDGE_RISING>;
> +
> +		status = "disabled";

Why are the bus and this chip disabled?

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <96 4>, <111 1>, <126 1>;

Preferably one a line with a best-effort set of comments describing
what these pins correspond to (see glymur-crd.dtsi)


> +
> +	disp_reset_n_active: disp-reset-n-active-state {
> +		pins = "gpio61";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +		output-high;

Drop output-foo from TLMM pins, the consumer driver should set the output
state via the GPIO APIs

Konrad

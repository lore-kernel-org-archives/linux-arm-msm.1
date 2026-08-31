Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D323C197C
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160420; cv=none; b=ozTH9AUm9BCQwYzL6RB4CWCyAmfusWyBQ3lOkiag/IohxHkwTu4K77EcIZRZliRc0XFFbugU05BR38ATBEOM+lMKA5QFvGyjP+r4SXtPE1MZj/331OLY0QUijN0PCiUbl4gmDZnWwZyIT9NMxXd/CD+f3ah075XbvcpEHuxCZQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160420; c=relaxed/simple;
	bh=q6I4wCeLjqNrqvwZRLZGmC63ff7DII28bBJfKKCRnYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPcZf4XM+RDygyZtjqVqx9SFmof9xnli0/hGeWkDDDgWQWCHIBAg04tYL9nEsK0CPgRv5cM+63ud33bMv81gruIjaaQh9bnM89/JiyCHHgn3x9xcsyFvhzO0YR6pqkMj35bBHdvgbSRZ1mgwQwYXtJ5cSGxFoEM2h7d3M+747+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRW2H7zd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gWjTpvhF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRW2H7zd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gWjTpvhF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V75ehG3542898
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PocnQeQ6O7VcIvt0+JawoO6B6p/AFAhDCRmYQgt+CKY=; b=QRW2H7zdyW5a40ix
	znEwMpOjKQtWUuDkBP8YaXRyDcyURS3goBBsiQOk8W9FqV65FQ2xGMRG47rKaF4a
	HULczAVCtKpsZxQvglMjAU+LoIRN4UWSlnWyGqBofA6ooudcrUXz9SUFCK+jO6M9
	kivpOQqJyI2QXmxqNNexKzNeLUve6fPoShCEpOqy4uyxabNfFrAY1l523D2Nwx80
	j7CGmbehc7PQY7kRReRbApZDgwkR8krOlL1DjG9IxhQX1atciIOr0kIarBCzle7U
	aNpoQeW4wjQKMpk22FlZIoh5ItETNXjEyB65czVk50qxN4nlBw/bDq1sHCxeb9bn
	YWA7ow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4x08119-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:13:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fa40fed05so6304121cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 00:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788160416; x=1788765216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PocnQeQ6O7VcIvt0+JawoO6B6p/AFAhDCRmYQgt+CKY=;
        b=gWjTpvhFT+BXg5LbdTP35M95jc+UC+5XwIMtQCkECIdv+Ce+rx11IMauXIZzasMbyJ
         NQnEmG0S/pbXXb6bZ83qr8cYnBCpvQVTSSFZZjT9rESHY+E4ggqoyeesNmwXqyiB31GZ
         pR9LLix39Qe2XplC/JXI9yg3wfVDa97UI4c9BhgwMZdRfGnDJ24h7QOSjtNqygB49wjQ
         NIHXTu/8kG7bd2T++Q9Hmhcp0ona7nbEiZIXvURkke16/GGX8l0sXvyLl7s6NBmKp6sY
         Zs/7C+t7oeWwX7W+O7U3wjZMzN8mVLs3lEIHVQn9awWl2PFIGPGJAaDdFhZcSlIbHT7B
         ZD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788160416; x=1788765216;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PocnQeQ6O7VcIvt0+JawoO6B6p/AFAhDCRmYQgt+CKY=;
        b=PCymXIMOQXP70sbP++QF1LSdSfz3kWBa0Yin9ZQt0BNAJTu2c8FKCu10Vn3FtiokQZ
         87N5705rBj1Pu2G6aGj+d1xEeVRVaP0e5c2PWIe8vsgaMEkaNSSgg6s5H8dPasXf/yHt
         ayzF1l2KYxAPvFAnt2rJOQH3fosdRfmeib6u8RwvOi/sOsUapexQmGArPhH7pvlb/130
         PcX2JVf93zX9XpejB1nxZJ4BkasuK8kumFgp0L5wWL/OHz1AiQ+DRjgdF1W811onYCnc
         e5b/F/BPMCj6sMijPOcVFXDap40lQSJU6XKg2ppqwrTePNxFX1njM20+qOYdkerj+qVf
         +e9Q==
X-Gm-Message-State: AFuF++kx5RwqQr2j/PNaA9OKVjfOmYH6miEmSNbyYErMK07jHOcdws/m
	P3Hh9n2DMOkJd7bRdUrqHt7+m0BX4Xkh7uek2R5CPOe5cj+obMeRwVEaYo82jx/YB2HTBN0UoQI
	Nzwg971w1tshuQfIhCIUF8t9h5QfWcvpZJZE4WtyeRAJFvpT+cioGaaHOSS7mXubDbe8hK6Jaop
	Rg
X-Gm-Gg: AR+sD11CMEnfi1wQ5mCWs4LCiCC+VDGu3D4N+fjGri5lXUtJIzQByUqBaLc0JzlQyrn
	3DrmwQ2jz+HnHD//nhew5d+YC5Ws8L+NVjJQpqq30um09mqhVGySbPj7I3l4PsUrxoQPaPvI2/e
	5Em+IBkG7Svl+g0/klJ1EHsmDPuu70NoBxU2chtm0g6hoq+9Pc3VXvkhHwNfaoRTop9+7+/RdA7
	tdWlq6seNlYjsTCoTa+PIp3dK0EurU49ThfM3xAj0a76rBL9/Yc//1MKoUWGwZm0l1Qu+r3nQoe
	b/G60uBqDvAkczsN9KNEpDFqJsWJZFAmsqrErwB/9Tv66nDkdtEmgtk9ex3drl4MCLv9umrK0yC
	bIoJk2bWRcHYtiFXX9e2rQw==
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189054351cf.0.1788160416696;
        Mon, 31 Aug 2026 00:13:36 -0700 (PDT)
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189054021cf.0.1788160416343;
        Mon, 31 Aug 2026 00:13:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a64fba5c16sm607868a12.22.2026.08.31.00.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:13:35 -0700 (PDT)
Message-ID: <6f33aa1f-563a-4ad8-8c81-6f64fb64f6be@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:13:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Add volume up/down GPIO keys
To: Dale Whinham <daleyo@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
References: <20260829-surface-pro-11-volume-buttons-v1-1-ace589343a68@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260829-surface-pro-11-volume-buttons-v1-1-ace589343a68@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MCBTYWx0ZWRfX660ykN92Y09x
 7wfCDyxvsogtyl9CSEputUiAukiCz6ywo4wvurMFqVP+Zm3qWbgn748KiJqAeNHNrM/PbEXaVWi
 wJn+aU4uBz2TNHNruYRyRFDyqYnoHWI=
X-Proofpoint-ORIG-GUID: fFZSzKp0qmhms6M5jxk3kOUEt3c_PfBI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MCBTYWx0ZWRfXy9fopTDtiIv2
 W6JRR+CHCwc3saUNJxcCxALbw5SQfmAUjkhKLeEAFPNUwEoH0xAbNxk/duLrUexQG7GnhOWz3Fb
 75iujN83um2TSrXUI/J+bhqHsqJUXGvdpM7PfDxWSgHV5EgYyPjcMUFQuc5geGzfp37wniT20qH
 B/akzG49VLQoryMJPBEvDSpDjoTRGJsmqKBBD++m8xJnM1yrFx9kyPMcJy2WJw5vV/l0iD1E0ki
 8PqYaRz6P6+qvW2U8q43c7xOSOGEW1GhynYEWyK3HrQNvNASUzLWwaVkA2ENcFA4p0scrKe9ozd
 /aPfEr/SfTzZv4Zkmw37WwEJBqxHZldBkYw1MV8fEjt/aXPnS5js3VH7ZqFbxWymlzN8vqg0jG8
 I2WPdAVSzgPA3R0PgzdZF202qp8MAIgP18/itJaTBUTvUvvIQm2l8S112/n0pMokzE1xTX0BydM
 qG4m9RlRSQlPGLEZ+bA==
X-Authority-Analysis: v=2.4 cv=Iqsutr/g c=1 sm=1 tr=0 ts=6a9529a1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JO05NdOSlY_Y-sYczyEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: fFZSzKp0qmhms6M5jxk3kOUEt3c_PfBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310060

On 8/29/26 8:41 PM, Dale Whinham wrote:
> Configure gpio6 and gpio8 as volume up and volume down respectively, to
> enable the volume rocker located at the top of the screen.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---

[...]

>  	pmic-glink {
> @@ -995,6 +1013,22 @@ rtmr0_3p3_reg_en: rtmr0-3p3-reg-en-state {
>  		function = "normal";
>  		power-source = <1>; /* 1.8V */
>  	};
> +
> +	vol_down_n: vol-down-n-state {
> +		bias-pull-up;
> +		input-enable;
> +		pins = "gpio8";
> +		function = "normal";
> +		power-source = <1>; /* 1.8V */
> +	};
> +
> +	vol_up_n: vol-up-n-state {
> +		bias-pull-up;
> +		input-enable;
> +		pins = "gpio6";
> +		function = "normal";
> +		power-source = <1>; /* 1.8V */
> +	};

Let's order the pin nodes by their gpio number

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

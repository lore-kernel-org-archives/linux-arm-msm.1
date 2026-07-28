Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1023B8948
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785219498; cv=none; b=cyhSh3QhIiBbgxUwN+4p1S5ndeo7az2RNi9nnHCWQGEGxnIfHbhHLB37ZGz6hiBa/sYz3C513DPNOvkdfBp7FQ/cSt5Tn0c6tzuAlS31Is2hX1q5ozK1gcaMyRkMCEcl6339XCEYIPW3C5YnZZA2HWwjlkPT5f2AT1I1pRVBtGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785219498; c=relaxed/simple;
	bh=l601a+13X9ZKLQWE7X7p8CBEF37BsFxy25IJ5VhGl28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YT93Z7MVgPrSjKf3sUbtz2GADkIeX00Vic5T/NyqH2Rax7b0jlFKegtN3nOrUtxLVmnzHkDEmKfLGebiSCLCCb95v9zrNZ2ExjTl/VbahvgUmBJ8uiH5oJP5Ye0T6DPc+jmaIeLITf+osWMvGCedYp4+vAd/d9+9xZnmcNqjWg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hr1C/vKQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYvtU3LU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hr1C/vKQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYvtU3LU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S46YkZ1821247
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CBQMlCTxvRw7a+s2M64d4ZZ7e4rc8tpMkTmmX/Uerdk=; b=Hr1C/vKQmteTWGT8
	SAp407kAGDl/1/kO1hwtAhtQ4QEI9ze7x2J77Jaq8gntciG4VyEA/BQ/lOcah73r
	X97lfOxFCi6WA3xSlHFZjkPIwfGH5qeMlbYZWAxXBRjcGiqLppGN0WjwqIKkx72V
	QTdLdwa5d9o9vEfpC+R92ZbLhkVGLnEBsZ9h6gyqITLn04Mxcar/Pr8B5HTvVr1G
	Jiav1ODqBKzEPe0g/1CYHp3nGxuKI6XC7upH2WJdSIJK+fMBjZXKxtTScFaX+WD2
	Nl/KU2Co1H2uKg4O3WCBdjVhywYkuyoeWw5pKKWM3tzHQX3djmDhSx6IE2JEjCl8
	rZ80yQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn3y0dpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 06:18:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d001671a54so29616775ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 23:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785219495; x=1785824295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBQMlCTxvRw7a+s2M64d4ZZ7e4rc8tpMkTmmX/Uerdk=;
        b=OYvtU3LUu88/HUzTtVzr78fQp6vYFYuY+zQLp4fhzTnKMe5m04WC8m1I9GTiIFjBXj
         yUS/s4jyKWIeAT4EBKVoqyUne+qvzszmfLoiCjPaXzh8/LOeA99/oupc8bqDFVvRs1Op
         iwpuXUi/rPocJrhz1Ikk5Q4kULdxM75u+GaII9KlxxCcTUhG9+JmFVaVm9CiH7UBzpey
         cAIDjKkJ/TrhFywjGTlNwHEexx8Y44kJNASPTdhZkp0QlcopUOvTSUDiafA1XS1cQD2N
         /Zfewxputo5E4gzI3rdrktOyCbN3QF2bxjkzTPjnCisyGXCOVCPx5noHsAXZU3MAqnac
         NEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785219495; x=1785824295;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CBQMlCTxvRw7a+s2M64d4ZZ7e4rc8tpMkTmmX/Uerdk=;
        b=Ka99tG/twa2+pbAb739JMAVZYsxXw0EUD+dKWU3V1AWyNgipxlnpAhhKdNPfGrjEhO
         OzaTZZveaVxDXbwNE5O2eqePoKwx9Xa8qN0gFTj8qFAAfbEYB365FwtTrvM81UdZraP+
         z4TPeKufim563Y/iQRhefwUevMQggX4SVVVC35YCt/FebVrKdSZX6zbFh9+AJU3VlFei
         OmDQ8eDceYNM4K0vbJxLbjNQZPagZjEkWK/iSCdqLRoaFELtNfK6db5bHmqdT1XBwLhA
         Kc1bPWkQHmhppYS4A3FUKJMT9UdAisnM0pCYWcRcwcNy7FGk/I7pkkxrRI5bjfFTQW3c
         8H0A==
X-Gm-Message-State: AOJu0YwzxknbtbkuTTsy7PcToTyhKXj5PDeXjqoUdjjPdBdTWMcBgxds
	CaqZ4XZn/oCi1jSqGr2GGOnIQVUa02ov9gRkdCZSEXOFyPQdvRI7CMkH56tjhNeIHPh2hnviLn9
	DZGJ/4PQWVvUt+GTiKpu9wKR5A+1522/Spz+MXUfvLEfc9FD5JPkWEuC1IPM2lJZnWRyX
X-Gm-Gg: AR+sD12chH920dDM3Ts7o6np8lUuj9FMNcxZzpoREXTkOEbOcbRp9mcRVEtsQnry1gw
	AQ7uQgMrvHLg96oaMZXZHBNZPaFoB3cTof9/E1kw61egJQN+JYM4FTm/2D45fmf3itSUnwWwrDg
	x+jPLYWyI1kQ63M9Tn7H0yHb0jfd5e9AAPk9lZS2AZNUYsB8rlOMRJt/zLmNMP9mQnDSpo+iEuY
	+E5DPViCf4OKudolwNHHC7vqbhTaYwTMacYOHUXbsZFpwHNk2doZCEzi+hPS9EEIhK+4o/avjhY
	VlVs0KxDXjjzEw9i7Uv/M+hHGec77/e71J9G8EdKPFW7FHcyt3b3y+JFsPZk9FyLr6YpeZdzC2r
	ohPEdIxZuIqzZY9yw1O+5ZMytBpOE
X-Received: by 2002:a17:902:d4d1:b0:2cc:fe03:dc75 with SMTP id d9443c01a7336-2d015d44a5amr12297885ad.27.1785219494968;
        Mon, 27 Jul 2026 23:18:14 -0700 (PDT)
X-Received: by 2002:a17:902:d4d1:b0:2cc:fe03:dc75 with SMTP id d9443c01a7336-2d015d44a5amr12297575ad.27.1785219494548;
        Mon, 27 Jul 2026 23:18:14 -0700 (PDT)
Received: from [10.219.57.117] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7f4a05sm45410835ad.68.2026.07.27.23.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 23:18:13 -0700 (PDT)
Message-ID: <7e9f457f-3ac1-404d-8cf8-ca06842b9c1d@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:48:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
 <20260713-shikra_stats-v3-3-4be17121729d@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260713-shikra_stats-v3-3-4be17121729d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fbidDUQF c=1 sm=1 tr=0 ts=6a6849a7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=twTbfQD5VkRrgihANLAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA1NiBTYWx0ZWRfX55J9MhhuF0jd
 YKfbwNBea7Ow3oDndWTy89x0sAr9MSuAaJRlEpw0cHI/y7eEgq+RZUbZZkOHRygqHa+DB3C1Za4
 0AQCa/LlX4k4LasqOAw6Dw3wHliqoZA=
X-Proofpoint-ORIG-GUID: zY4gLNQl2AyfIovRhXsAp11FnR-UHRc_
X-Proofpoint-GUID: zY4gLNQl2AyfIovRhXsAp11FnR-UHRc_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA1NiBTYWx0ZWRfX3F+RGs1pzYca
 Gu+My8YzL9zUYXW94hMB/ac0LU1dFBOy+qmaoBm+xQhlEd761Lx9o2srhj1VXbevlj3whUQBxWD
 QXuWYuykZhrpZfLL+0li2XqtE2CJ5Xs49gmqTjZHdaimykJN3wDzS8cGyFE1R2Mgj3Wq/LO23HE
 M2/O5dHUczeviSABgqbTEPSBHlst9wlnr470k8d4EopeQdvdIvulyj0NsKpVEZsdQo0hm+SyZ4u
 6NvM89sxLQ3EoKBgKvBzrdcvdhRsjECF07ENQBBuYXFyN6n/LTJH/EjgBCk46eHiyAk0IbH7Eaa
 96DUw5Nn34JDu/MMJGHepp1AN1q7GlcFqa/DeuM3HunfDJJsNSHnkuP52nw5117miDG5jvwbtIu
 kVzAP7IAzyOYvr2QcFFDqZIb20MZUODCK+YZ/tBnAwC9NqoCWDNz0SgLlUQuMA9jhSn0Bpilqh7
 XPHrHsW0FxEghVGKU2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280056

On 7/13/2026 1:46 PM, Sneh Mankad wrote:
> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
> stats like vmin and vlow.
>
> Shikra SoC specific compatible allows reading individual subsystem level
> LPM stats along with SoC level LPM stats. Change it.
>
> Keep "qcom,rpm-stats" as fallback compatible.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..b299f316e3c61858c4b380f6211d0f36ef9fecf9 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
>   		};
>   
>   		sram@4690000 {
> -			compatible = "qcom,rpm-stats";
> +			compatible = "qcom,shikra-rpm-stats", "qcom,rpm-stats";

Upon running dtschema, I see the following validation error:

arch/arm64/boot/dts/qcom/shikra-cqm-evk.dtb: sram@4690000 
(qcom,shikra-rpm-stats): compatible: ['qcom,shikra-rpm-stats', 
'qcom,rpm-stats'] is too long
         from schema $id: 
http://devicetree.org/schemas/soc/qcom/qcom-stats.yaml

Thanks
Komal

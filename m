Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEC64A4841
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820356; cv=none; b=LxJs4xD+a6xtAwS3CxmBnwzgY58aSp6nzOeD/k4FrJfziDZcE6TbvCiFlKg27IYf4J9gTod67c7DgSQAZXvi60gne/KQjl59dbbiz7b3lAHYqn51LrBczZdgaYXlyTm20Ywfvb/Nz9xONnhYnb3k6NUeouBmnO+AVXLgG1KC0h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820356; c=relaxed/simple;
	bh=BAVulmbfeB4WFKNjWlELp4bbnw2TudrBhLztaBT565I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHC/QY0BJFFToaIQFytPAkervxU3pT6unzLlUerYIGHfo+T/oh0VebGg7kcHkcQOEZ/tkeHBDi9rLqvNN/REreTMSc5kEq76xeC+XKX0D6RY+kcdsxA8Pcedv0zzjlsu7/suwY4asyYQ2qVE3fIhtkVsmVAONV7A8dCSvdqFmSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGaoAsxS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bo12ahuf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGaoAsxS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bo12ahuf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFekxt3782545
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnkCBBW17Ri5LY3kFYxYgET+/g7jVRj8ss0xDPrWsNw=; b=CGaoAsxSEbglfnaj
	MvnlCyS8J9tjH0a3InFETOfmOgpU0XfJ9rD0Uf44p6mfYiq90Jf8VmsDDVBiHCR1
	CFwogwqjpj7yiezyhfj11VrggL+g1N0dfjJ9/xFA4hwG+DEAZlOx+9uKYiixISDr
	vJCxhRr6fWTEHRr074y9Msr/D6+WjvAsKSVR4ZvUJuDIqGa+paftMElC/k5SEoUl
	WIADcN1ui+Xulzq6MYZmUY3haGftUj50XSyNxubELihm7rwEqgqgTiD0Ym8EVXYv
	2yZcps/BUqP5Qsyhv3lvFjxTd15V0Y7DL4qx7gmNqwns2uqBmEjKQW3b1GjAr+Pf
	DAKQzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j5h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:52:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so27706385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820353; x=1792425153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnkCBBW17Ri5LY3kFYxYgET+/g7jVRj8ss0xDPrWsNw=;
        b=bo12ahufEc1DPn98dV+qdnVJU7Z9LxUdnkregrGX0WX0IfBSIdPh2ekw5ZV4onkKrg
         HGbU3SFblCyZhnmc2iqzekrCwlyrq1BBRMmnFm6FGbJjTnKg6GLaCycdOua8Pd0gHRfQ
         1xAgs8/tvHvac5WpUAwhuy5j2as9Zc9FxlcsNZjFrvxzRFLZF71h0o/rcGXTrqJ5mv0M
         byj9JcFqmIHdmS/dm/PonHoNgZT9/Wzzb/yX5MbkfhRMj2/Q+t8AASzF/qiQvrHpy2nc
         /Q+oOpkeuajTdAodzMO4qaeGy5MkUuTpOXcSV0Gc/jTX6FkPwevg8ETSoiFcYSCbyFRE
         2RRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820353; x=1792425153;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnkCBBW17Ri5LY3kFYxYgET+/g7jVRj8ss0xDPrWsNw=;
        b=A93q5CLviT+y0SZUhKVM4Pm4xZEyRWyYuAzEWwwvpSkfF44G43ub4ksWcHd1mRctt3
         9wIkLSHVVHCD3DxwkapnvXKlNrPk1mwtrByu6MJBSboMUwBXIIweDJvdep7yEcepq700
         hIRnVfA07mWIdNYTLJCSvc9eSRG3QROPRx4BP497OmqEFsYkWOYQvSWBe5y7fz8zKb+j
         7yCtKIUvwtN3k82Mb8eUnf2XnMsvO+43W4cr3l4VfadjlWGlUbzXeiwvLYRj/OeliFom
         g1IYTnyyyahCS//+IvE+g0M/C2R+MqPqWkOI5U0zjrDkyfVQvnfCJKL7oODPvNEqfANt
         QBCA==
X-Forwarded-Encrypted: i=1; AKwUvBy6k9xScydkO0B9Y1Nk6eQAudBm5ofNFL7ksKH/bllFoEpjzZ0lERc+Iqigvy/vdswiRwNlI5q7wT6Icd6/@vger.kernel.org
X-Gm-Message-State: AFq9FYIfjJ4A9x1wEyappwNFGuDXwcvQoCA7+P/ZO9pe702mz/esqMS5
	bPA39sXL9zkrGT+tSLVUwVgZcuT3/Wgh1OLg+n7CMPtSTJXk33qS7zvr9yi67QLRPKCmwA6G+gD
	vBoY+kbQD1aNJteDCrqh4WpbTu5d0Hcphpob4phHsGSxDFnbLnvRc2M/ZYLwxm9GecaP7
X-Gm-Gg: AYBFou3OXib7DfaTnvh+/FyxkI9pFi/aQr+HY2FqSRQyYpgKYWbiHmbQVptMdFbrQ4N
	dXU+KO3s93IT65tgmwGpdiO8JfuZxOm52lN1mBFlHVCq8DQ7HWk30+nNrcGBbsSJOisEMSOE9Bl
	K5jeyylYsmRtiELOYA8lHDuVWxs6v/Nfw8umo+ZYthmlqVdsAnu1uuynboipH98sDap0MPQr2CE
	DHUJT2TPq6Oxps5hsB6EJv0/9eAvp37wuGWFv41diCK9i5dciRuo//R78Jn+WK8enBLZi+6ytn7
	b45o5aBT303ll5V4ykU/kpaZtZX0kSviTVfzndDapg5MJH/GD5tcrYUkE+brdwSTb5Bc/M6grGB
	gn1zq4kIVVx5i+i+ZSTr5AA==
X-Received: by 2002:a05:620a:72cf:10b0:93e:e24b:32e3 with SMTP id af79cd13be357-93ee24c5086mr447407985a.0.1791820353256;
        Mon, 12 Oct 2026 08:52:33 -0700 (PDT)
X-Received: by 2002:a05:620a:72cf:10b0:93e:e24b:32e3 with SMTP id af79cd13be357-93ee24c5086mr447405485a.0.1791820352604;
        Mon, 12 Oct 2026 08:52:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3bbc9sm480313466b.20.2026.10.12.08.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:52:31 -0700 (PDT)
Message-ID: <f2bde571-89d2-40c7-9ff6-c23a56b3dacd@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:52:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/38] arm: dts: qcom: apq8064: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <c1886d808858a195ec78425b293b2ccd3756cfaf.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c1886d808858a195ec78425b293b2ccd3756cfaf.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX9oVsfJuPHxeA
 +blrWI9iprg1K+mBXN9t92Z+u5rcAjJSPQGRH1GojuZPsCj7l3MXOLr5Tlqg/UtegivPWtg7Maj
 OGa+rnNiQj3bkEOCLse7qJPHGgFIfKsJ38cb6mI5N8H14/jufQlthg+9wyCQlQ1pyz+Vsghdq3c
 qpfDNnVu+Q888IzH9EgQaI5P3bMSjMu0aVRBihZ9/CaUbEAn9WHayqpxNyo1Bi4Fx1oyfaAdqoB
 79x0smp3rVmRQG6RrqKwwZcYC0lwYbibxojp3Opf/dOUdfDfz/dGDXffrTpHrYV/qgqPcF9KliG
 QunMzZ+8kvDfbdfAHTooBp+QuJAwKojxHFw2P1TbOhPwF6j4Xrd+w5rQiko7NhJ8qkYfkcRsNlx
 u6Z4G+hhnQeJav775eFDRTZX4Teoc2GeFDli3ithjPD7qtUxdEn98qCwCrSzCw7e6sUOITwwfrA
 sIAryb1DSJpfIV6Ytyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX2O/vLVFAvI/C
 3iaNbdrl/BexykyS4+Xkn8vCBac9B+o/v3thKEuPfZAwyzbpVNUQMe0lK623ct0TfzGbqUGei14
 IVHqFL/NvPNPHRwdSZvxUXA+dhpiR4c=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acd0242 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=aOV02CK0EVwC807Rud8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: BLlLF9D4LBgrraxvcsgPvUFV7EBCVdPG
X-Proofpoint-GUID: BLlLF9D4LBgrraxvcsgPvUFV7EBCVdPG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first one
> or properly indented with tabs. Found/fixed with dtfmt (Devicetree
> Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 98 ++++++++++++------------
>  1 file changed, 49 insertions(+), 49 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index 150b5670e13b3..565f98c00b3fb 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -89,7 +89,7 @@ l2: l2-cache {
>  		idle-states {
>  			cpu_spc: cpu-spc {
>  				compatible = "qcom,idle-state-spc",
> -						"arm,idle-state";
> +					     "arm,idle-state";
>  				entry-latency-us = <400>;
>  				exit-latency-us = <900>;
>  				min-residency-us = <3000>;
> @@ -1036,15 +1036,15 @@ gpu: gpu@4300000 {
>  			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "kgsl_3d0_irq";
>  			clock-names =
> -			    "core",
> -			    "iface",
> -			    "mem",
> -			    "mem_iface";
> +				"core",

As before, let's add a rule to prohibit `property =\n`

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8E42EC571
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340975; cv=none; b=NDqjwFHV+6XNIB3NaGoa2tEz8zrqB8DFO9d+tQz2ntxVJiuRP5vAUDlYlAKWjCx6MJ8t4LpZPHknpZrnGadlN7CHVKDBU36zv98JkY6wOyDreFLDsD+G8fJ15CTecgF1EWxxvPnAjgoTHIvWj8U/gkwJWNfxw4X4AVpNMeZPyyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340975; c=relaxed/simple;
	bh=JGXgRYjd8yDyKai/4QtwVt/3NsYTXnlmyDcHu9Y+x90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WMvcOo9rTJGfxUebb2ag+kQCttxSxmgXy1u6BbnuyDyxhtfZR1qvdc7YHmNHCcYPLPVEqhwpkQeqKSEPBwdEzEGrC1x+6Ok+o/Of6QuVRE+Xg2msuxaVaaFz5uMJsWp6WI/OEU1iggUATRUTXJhkFnwDxni9yn/1NBEsIW2xz0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtNR+3qJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IS5VqTBL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtNR+3qJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IS5VqTBL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBLcc5900226
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kYLubcSggVH568urXptvuU1LtJ2UBHszAH+bCVk4Uhk=; b=jtNR+3qJEGeBld3g
	yVZDEMLZpkMX0d1+TPWGPWF7xcD2TIv886zKD/Rp+6CF18AzhSfgple9M/Hrukbh
	0W8pp7VSHjMVfLcG0AWPsOYBOu5mp5ojwQoNDbzVOD1h78s1yRGvWvTlYZV0SAD8
	+cgsFBi5Tm2IZLBVNbDrg0RpY+/MVWK7JVMnzNK119b5UKT9QLWcfRbJRs+q+o3l
	P0Xxwk93EMwI2F30UJCmS3ZMfrA7xcdtkeuubrytiM1clGypKQsHQl49+e7kSW+X
	GeerUfBcUU4q1SoLg2E7Vax+ouROYchqVDpnt0VxPNZSp9Lj0Vno6JZY52+px6Bz
	hvKijw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr10086w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:56:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9392788b3f8so7248685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 05:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790340970; x=1790945770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYLubcSggVH568urXptvuU1LtJ2UBHszAH+bCVk4Uhk=;
        b=IS5VqTBLCwAIFlQ5uTKRyYfqhPh/wF4/iWHLjnYSUpmwb8ckwPShZObiq0qkGwgzlR
         DE+oSnDHfKjXsWWm58yvdDDo/bSP1APW+sNlBUIIv1H7tEkIc+29nvv2ERm9PM47hqls
         MKp0bL22upCrvlLW1590fLLyWBZLX+zx1NBGtJ796lZOMGndYwHuOxKht3okmVo73Oh1
         mNcAmqaC4RXfHRVaS+Nbi38dEL9MzCHtS7jIqlb8WlqlUVPMz6Qiy1vCIUcvOYtPdrC6
         Omg2u38/YSiHgDVpclek4AhWkgaEpW/ixP9d/hf4We2BkIr/+78DKKbeMU9OYpTi1Sx/
         U+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340970; x=1790945770;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYLubcSggVH568urXptvuU1LtJ2UBHszAH+bCVk4Uhk=;
        b=unD8dekVgr92/VeJRz7jrtyVK5mBqHGjYSJMWPbIzZ1eaphudLIhFdOp+5rU1FkSrp
         zbLSKYcex/aoP1m3eSVmPTXkhp3NsLxBq/nKq/50euBkIx5bq1BcWRoJpRevkMevyc5N
         6uSzs8ip1fBRm1HB24auhxiz5Izi6qOk389XdTsaMlIyFsl/P9TUJFfVJitHw+vq3HmV
         51NNYl/PFDsGeiZd6ATpvWdVkKc5ZaKU02tMAAZZLG6973CZuzqLJgAZXZEfeWo9Jm8n
         3oIwkhG/NrL9DNiYtg21RZJlof5MI9qHYGVatzexJegp3Ofu4HuB9rVVWD+f/JKO05lU
         DyRQ==
X-Gm-Message-State: AFuF++nEVKNUPFDYpdiDMqYeAIhxE7gAvQlHuhxsTIjNt18J5CWXjkiQ
	MnHGiDgnKHp/vcmSIb8qdPnrkzxFRxrrss8YBOGonjrbsOfQVXFk9AzAVVoMCtraj+gcV5Ad2yU
	z8krI3oVuoD/Ci9OzspS+ZWnkEp59d3eZL5niMsIs88atohzgQn6uk9HD2aYbqX3Wu3Ba
X-Gm-Gg: AYBFou3EPY0kf8+WkAfS0Sc2EJhFWs1FMnHXX0vOsiNYoj3FJxyFvGxAOqD1C7rKM7J
	+lKGXroMbEK9xf3MzHZ/MoWKS88mDMF5IlvJ1OgOvmmL2zjUxftN+W3B5a2vgMgxl64c2k01106
	xgzCxXfgIFfMLaix+c4wvciigIFN+cX70NRFaU0MmqFefRus3zC3QJVSyB9qfoIywG18+OiewWW
	KNfKk6pVNHUSp6zRcG0gr2eH1Qkj2zwKaR3RH7UpSeXxycCzOz5cWI8gbHKifRuGU63byYv8NYn
	1yPGRzPcPrtpofv+QGQ4gMBkBsU/Bbl5jodcLJtYP6Dk675kYrIwP1P7Gv7fY059vP0G5GCQLh/
	XobE2XPohAqLOVETj4s2e4Q==
X-Received: by 2002:a05:620a:370d:b0:93a:14c:329c with SMTP id af79cd13be357-93c43b93796mr422142285a.1.1790340969769;
        Fri, 25 Sep 2026 05:56:09 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:93a:14c:329c with SMTP id af79cd13be357-93c43b93796mr422135585a.1.1790340969110;
        Fri, 25 Sep 2026 05:56:09 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae77feea6sm110852766b.50.2026.09.25.05.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:56:08 -0700 (PDT)
Message-ID: <c3a7b4a0-e569-49ac-b18b-c6c63df0777a@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:56:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: nord-rrd: Enable USB ports
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
 <20260922-nord-usb-dwc-dts-v2-3-ba2b39f1a843@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-nord-usb-dwc-dts-v2-3-ba2b39f1a843@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfX3g4c7zt58S8k
 miw3UPVYWjkVwms38gja+Xx49hHIEeVy64VdYg/j1GCOjm/UICKIQDR/SMa5P1Hqtn65xMJVAKV
 DPB0KEW4dwtpBMto7FeT5xeu72Y4zmtN0KgY8Wrz/gRFErchSa52PSZWp6VP8aGCOOOxrDHrfc0
 fmDMKXesdOIwEQ/PzVDGXmiLvIrviSH5LJGFSQOZXQxkzeSMcWK5lX/Zfy/vsGnY72Q9mEf7k9/
 mAKyq7u/q2Uju8kPyiKVwNIgvkFqykgNhNrS76y7G1r6gBAj0Q+Z6JWlSrnt4OK/jz32xiH3C9m
 tpR3TjIQ7mZjZd6sMYLlU2tTiYd5HpF1D+TeZVFhImBGUyEdcTGs1k/knm1hiMWqRd+F5s6AyH1
 UqrQZOT/eP8XgX5eiaf9Rk0qj6Gb+qsXqgYfxxXmyiqkVTty3DjPA0avmvN9Y2Pi+Q6fazwAqjn
 wZ/udUqOkQxQkfWR+OA==
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6ab66f6a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=amNV6NwrtHp0R1nwlYkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: h1WyMs2yfqQfl7BNE3ZXwrLSl6uz9dbG
X-Proofpoint-GUID: h1WyMs2yfqQfl7BNE3ZXwrLSl6uz9dbG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfX8W98iB3yj4NE
 hvTuBIicgmhEppIC6ILt6tSLuNaC/0HDiObl7+1KL5OQVtoMOdyFpp+OoFgm668/HWgV1bEPCZ4
 BrBqXE2elOlyv/YOrQbUmLHvEf/9Q2g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250051

On 9/22/26 5:01 PM, Bartosz Golaszewski wrote:
> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Describe the RRD USB topology. Enable i2c9 and add the two NXP PTN3222
> eUSB2 repeaters for USB_0 and USB_1, supplied from vreg_l3l_1p8 and a new
> fixed 3.3 V pre-regulator, and reset through pmau0102_i GPIOs 9 and 10.

[...]

> +	vreg_per_3p3: regulator-per-3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_per_3p3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	vreg_hub_1p2: regulator-hub-1p2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_hub_1p2";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		regulator-always-on;
> +	};

Please touch up the order


otherwise looks good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

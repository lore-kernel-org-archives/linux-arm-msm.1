Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AC022FF22
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787628323; cv=none; b=XQJQpyLpzHJ62HBOsUKNfZOxWZJgwWpX7+RatWzDFLlbZ31ORkH/mzlJw/YY2YFLeBYgNUEMGSIJOXTpxmaGdTrOA94Y4BmoBTDoeyXHryLb0lrRRSuE7lVyK4Rba9tVm5VceCRat/GN+HaEsxOyLBGzqjL9raM8z4Q/UbDI2c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787628323; c=relaxed/simple;
	bh=5sC65HxqHy2q6gQj1Q4zZfKf/D1v64cBmlCVI0LSeQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=joC8KpYwh4Fx14y4ows+XEJlIy7OTYgq720pTifCFChkMzBQt4XTAQtIJhd/M27IS4sg49PDJYoPbz7h6ccVUAC5QFyopEVMd3tH0b2jUK/CG7U+A71Qv2wvKAk5XO71IiEfqwZGC6phM5efFvd4t0YZtf3cVMYszCUvfcPtPYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V6OD9ZtO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYUd21C4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V6OD9ZtO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYUd21C4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2R5sq955282
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7MYeqv+ALj6Cfd1bCbQ++2ZAswFiG0g5XGZYlJ4WVnU=; b=V6OD9ZtOhTIn3JKB
	kNq+UJQYved8AOGPa85qisU9WJIlRsXI0h9cYCGJ2yQueinunnZM29aRgbxOwRNu
	wpwFOjJsQK5Vbg43pX2t8lu+31aD3Er4XQVcxkblA65XTfzROIO7OO5GG/eJIca4
	56714EtHPU9+biAhlKVgxcV2n3k56XluKCUs09AXJr731Z7K+fJXkmOnMhJjxsvH
	KOIdnnceJyw69XXVdeTS4sa1Ml7EcrTF57ZECMMNNoxGPSgVkbcv32uG8TN+Cgg0
	khPeWrcZcYMsdBd85jBVsHH5nQAkjoEzToDNovHa0VVfk4iw8PNtsl+oT8TFccfJ
	os14Jw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgva6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:25:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so5451062a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 20:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787628320; x=1788233120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MYeqv+ALj6Cfd1bCbQ++2ZAswFiG0g5XGZYlJ4WVnU=;
        b=YYUd21C4xv3RyMwPdeWC9pYF1yyMOlpi5JeFx/vx1b1pRTv6tXv5D5/IzR74tP1WzE
         7g6hNj9SCzrR4cmhSKEL2NqIkBwf5rng+jPK75WahRcdnLfzl7RGM0Pi2xZruRFXW1Gi
         DqmYcNddpBLlzGgCXZCjJX0CbH/N/aPMtR6NmQFolAHr7T5+QjzxBmyV9GKm/4vFa7cG
         jTqOHNMsc0vqp/oCP5Tn1lOAImq7iCPRZi4cguXG5RdNQizIE/4wYLdahf6G3NZwOz0t
         OEv1XEeu9B/RDKwaTk0ZqsaWkyndM/cv7vCbChGmCf/052SiviVKjaFJgcK0CNbnwW0D
         Hhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787628320; x=1788233120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MYeqv+ALj6Cfd1bCbQ++2ZAswFiG0g5XGZYlJ4WVnU=;
        b=f2Nl2HJoQWS+84JTLMitVW0sfvgY9rFMUXiYAa3vnP9dVgi/z6sWIEHxLB97EhhSGR
         4xp5Ds7V3PRu0NulkxpvlkBy9HV7ULFcxqZLn+mo5BBuNGL0MeLioZKxgqzQfWmR5O3x
         T2oak50vcmU+dwctrYA7a8QHsVoNdi0UVqcbaVA1s6chlWe1kRvEqP4OvzYtYfteLMRr
         5Z6CdrbZgQnvwVOcPxSGDBt61HttRnajVWo+i8atItDMc0M2xIMw3lmRxAQ9VYWefua8
         KX2rKrdykH4dBVwi3JQtMs1hd4SyZECrRdB2eKHaFlJxmZlM+owbg14d7JTe7aY0WuOq
         xIkg==
X-Forwarded-Encrypted: i=1; AHgh+RrxAlq1Ggm76cS/QE/9Q+b2xWPHwquKOpMAqTtqqqvM/NHrIQ4+PEmFZlk2TmCWTgyYv60zLappY/2P2LQ8@vger.kernel.org
X-Gm-Message-State: AFuF++n9kQjF7n7CGO8T5LWeLcrC0uE9reNPj6S0B+Y+vltw2Ct0E/Ku
	zcQYXjeKWzBqzwCcD0K+0Dp8OCkczpbK+8hRDvge2IPuV2c9L1/qzh0EShNRwiNYxfuKeHd60q9
	GErqKZXhPAifaIfcDs5140pOqn8w1pQw79dRAk7IaV6RwYdq/Vg9cTwEclY/PWI6CJolf
X-Gm-Gg: AR+sD12pDACSHBFk4eTMDrRzjGmddfod1ciubZnxnlvk5MjLEuZ4r48DMU+tVbdPmhr
	+B+iIerSXuONgx/9GM0dYvai0dQgcGCPzaUQmMg0WRRiSwJTPr6kOHGSNBb3ofwNGx7Y+YB9G93
	/dsymY74byJIl+OfRPpRFDweXy/BrucOa5f7jQJ5sFUhSnqhiB2Kidw7W3LNyu+w5EKEwMYM0V5
	TmTiqKa/pyNEtVSiSiHKRPCCTnDDV/rv8Gdt1Kj+bonFCYLWnIgw6/5chb1FZZBzt8pdNDupPcN
	ioM8QmLh5HWmxuCuWcuUG9cvYmYKVV0hMReUw8KTnri8fkhp69k6cTpUpXJC5KmVyXYk4oJ9uU/
	npfRIrx+X/MCN6hQ4F35QX9NrzDGN6TsqEYdA/IGG9HmNtIThuoDkGQlOWYFAaPrYVT5g
X-Received: by 2002:a17:90b:17c4:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39646519363mr6263291a91.13.1787628320010;
        Mon, 24 Aug 2026 20:25:20 -0700 (PDT)
X-Received: by 2002:a17:90b:17c4:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39646519363mr6263184a91.13.1787628319525;
        Mon, 24 Aug 2026 20:25:19 -0700 (PDT)
Received: from [10.133.33.69] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645bbf440sm1944627a91.14.2026.08.24.20.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 20:25:19 -0700 (PDT)
Message-ID: <e4ef85f4-3f1a-435e-9bbd-86d499733a88@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 11:25:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] input: misc: Add Qualcomm SPMI PMIC haptics driver
To: David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806-qcom-spmi-haptics-v6-0-19fcecd5204f@oss.qualcomm.com>
 <20260806-qcom-spmi-haptics-v6-2-19fcecd5204f@oss.qualcomm.com>
 <214bbcf7-38ba-458b-81ba-d7f3a42cb73d@ixit.cz>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <214bbcf7-38ba-458b-81ba-d7f3a42cb73d@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAyNSBTYWx0ZWRfXzt9xXYip8aI4
 QpPkcYsyvr958APnkkF5fUD1tyfbODZ1VFWOks0DbIEsyy+PkMvRUXsWvP9tlfxY9VLXcrY807n
 uLdbO1/VCF4mCreMGrwhEOAGym6XgA8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAyNSBTYWx0ZWRfXwv3NYxDYbt4L
 NyCm9OdOCwGCIkUVNCPcyVf8UJjJTURSg/qJs1zQQ8icsM3bLAbV4PIL7YKeGXeQTvz3emHJKY3
 roYWNlR4MMtLlOckRX8JMYD9mjR7ErE0pV/qXlctJ3iCKlQHNcvkuQbB7jlYvvaPNYMmSeGu/dA
 g4ZkQ3pEl7fiNBHD1s8rDAprR1L3o1zeYOtCLZ4aodGQYg7IZ31rS67nfpj8bmF0FXN3DqCGjH8
 sedJ21Zkwau79GLX13ETUAUwBKVtlVD/Ut8esmpKO4+Pa6xZSP66ro0lX4ika+x4frj2/8zs+Ia
 QsVaxOu14Lr3txqYdWjBX/AICtuEiet1v4HGBeI7gqP2CrPBqOREGD50v9AKIVs7Tv7yrPaIZJ2
 fM55Hw/0aZVrTHwj7wd65wP7dEOKPnyEWhIAeaYs0hBHHrWMpNP8vJ7Ed9J4F2TZ5oYtdOUZYdj
 q30kZE8Hr1XFrEeH8YQ==
X-Proofpoint-ORIG-GUID: GJJ4LHHUay2FGvYuTP1ttmlv6OGf6haQ
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8d0b21 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ovy1QOkU2M_fSUD7NcMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: GJJ4LHHUay2FGvYuTP1ttmlv6OGf6haQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250025



On 8/17/2026 8:08 PM, David Heidelberg wrote:
>> +static const struct dev_pm_ops qcom_haptics_pm_ops = {
>> +	SYSTEM_SLEEP_PM_OPS(qcom_haptics_suspend, qcom_haptics_resume)
>> +	RUNTIME_PM_OPS(qcom_haptics_runtime_suspend, qcom_haptics_runtime_resume,
>> +		       NULL)
>> +};
>> +
>> +static const struct of_device_id qcom_haptics_of_match[] = {
>> +	{ .compatible = "qcom,spmi-haptics" },
> I assume this won't work for the Snapdragon 845 (and related arch) SPMI haptics.
> 
> Should be the assigned compatible (and relevant data) wired to the PMIH0108 
> compatible only?
> 
At the moment, this only works for haptics inside pmih0108 PMIC, which
contains the newest haptics module among Qcom PMICs. That said, with
some code changes, it should also support the older haptics modules in
pm8350b, pm8550b, and pm8750b, since those PMICs all support DIRECT_PLAY
and FIFO play modes. I expect this change to be applied first, and then
I or someone else can work on adding support for the older haptics
modules in the same driver.

It might be very difficult to support the haptics module inside pmi8998
which is used on SDM845 platform, as it has very different control logic
than the newer ones.

Thanks
Fenglin
> Thanks
> David
> 
> P.S. I'll be upstreaming SPMI haptics in approximatelly 2 months for the older 
> chips, please feel free to +Cc me on followups! 🙂
> 
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, qcom_haptics_of_match);
>> +
>> +static struct platform_driver qcom_haptics_driver = {


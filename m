Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5C7477E3B
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326081; cv=none; b=DVxq+jR1VP0LDHN27GBHyocw1OHZuPxHciEf/pwa1Kjs7J9jzo2TQqvYnKEzIAZwaZVcJdyLTahbVfAUoF05Tu0fp2Yt5v9sd7rWn93PJXTI9CZkZJYdj5TvuQZuhWlRZjCOLfF+2B4S4uIYaTK+VtBZbP7FVHPvHdvktq6tfgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326081; c=relaxed/simple;
	bh=9a9so1CYH3stmaNiF2igDa4SDSwTPoO+r+0jxm4VP3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JPq2fr8IoA79IQaURTCdzRoPidiS7qpRfxMd+CDXxC+5lnJN5wFoAtDcTipSAIYYnIItv1LgaNai63B0SF8UzSETYjP6v+hO6LOGjklt7NiiH4vIsA6KLTSXeP2Ojz9xXtF7HJpUeK22gQT5FgwHY/8e4hwi1zN0XQ4m3vMJGK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggvTB0Q7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C0ENa+xE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggvTB0Q7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C0ENa+xE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBsbIN1637689
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6FmIKkJTESuL46QyrIupTolyqTQ4VxA4jR8F/WmR/GU=; b=ggvTB0Q7NEWrk2/i
	ICsIYlqYDS8gh/tIp1vUJE4+a05LTveWQFwroV0Ub/EemjMxEOa5H2eQ913Z/frn
	ZavclWAelZhQsV+MHSjB7/6b2wqJp6x7ZJfkee7g6QSOFV9smG5rtWRm/GfjYhB9
	3pu3F+qhHSlD5yYvo7tmQoSLXMd2awV0/fm3vTXGh34v2FanMpYOLCocn0MNyPBv
	pOsSHuRHIsrF0JSyMS7ng5EWIHR9IB8AJqOlcwefh2uqyI30+4idgkIN/T3yeKwE
	imC4VP/xo2wbJYp6PIhfcXM77GFfnVuOFdr36xBtb0msn4+K/oYRpRVZKIWkMoeS
	L7T0/A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh2d800k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:54:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so1600637a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 04:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785326077; x=1785930877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FmIKkJTESuL46QyrIupTolyqTQ4VxA4jR8F/WmR/GU=;
        b=C0ENa+xEBxWbcYhrfnxVrzeItm8BIlP7cblcHcreTGP693rE7Vs7L+HI0c9PDQrg4L
         hyybNsN0rm1uDmStD8x6BNcigDJctzkY/+FpFsFsUTkp4QOL+Gl+fFpFfhIWzfKb/m3j
         J158TsnljuLxopl5tktQztc4/n95EdjMQpLYUgLKoPA+tfGTq6p2nFTjUE5DkqjuPz/5
         0i0CautQ5WaJyGydE6zM0twBY60lIIWSpcZE3XR8HjiuI6FHeG27GwybBuXhuffr6Qvs
         2KNh1yF1Pmmcr3zDtosnsQawgML4kkG2/DpBumXPxWopt7KNsEGAK7W/sIlvkE9yBOfH
         VknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326077; x=1785930877;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6FmIKkJTESuL46QyrIupTolyqTQ4VxA4jR8F/WmR/GU=;
        b=Zyh3Wgy0t8kz7zooOxlcM82jbhbhuScSSW53HWV8IUBQNZtSY5p0FwagoZLeLxF2LW
         Pvhk8192NIlofaujrnHbnIoMPIfFGQkagS/tAbIMO+Uc9oGsU4Pasr25MgGYbXNvyxtv
         wmIhFq7g9/TOZd53ffjV83xUZPTTos3ua+HpuDfgRPNOcfMICCkjwOx8VTVLCtSywWb/
         4E0gfXiI6NQ82GP2d/KZgeSLViSMP9YIAR/rLgNGjnw6UTrEoxAenAlb9o2Tgr7TbSu7
         qkgKR9aY1EuxUFdxqshMYiMZZhL6fVx3A+1WgYvR0AOnTgppzQmjqXmcDz45zd2DeRJ0
         L7DA==
X-Gm-Message-State: AOJu0YxLm6P8IoYAvHNC1FzzCxFqdl35TvLFSX2D+WZYf1aK+4bu4xk8
	oVPxBnDKYobfouXZZXPOKbKsS52sprsm6QUP09PrFsTNPpmlat7NpDIK2W8zDrx/v35OLWdpJH7
	V5AH/BEY+Oh2OSciboHbxJ3SO29yxDDke1EFloPWkscx4cpn+f0Tkt/3/tIdg6EyiZmJd
X-Gm-Gg: AR+sD11a5QNPG47ZBcmAgwSRzRnoWnd99cG6xqwewCakr3sDSHFPA8Zh7kzIbeQv0ni
	rL77kLl0TbbrS/WG6TRSPlaprYDLKZ6vJ876o1e4Pb3CFh2TaprLxjlFPamX2EH+0KFqZEDPAvE
	kSDdQexgPANcoVksoe2RaVgqZgkgLl95wh1kYKMyekoJV6UuwSDMLbh4PpQnsno+TIf6Vgvgtcc
	qftB8UcX5efSiV//Pu7La0ABGXORv9ANDDfyzQLE4P6dY02AGX2oApta6OqmTbSbwJoE9GgdJTg
	6whh/ug4PIc6/wFQRAfvoVoLOcWlQHBIgG+TOHAA8+rTw90d1xFVPCWRZz4rvF4m1RKJZ/d9doB
	InhMKOTgms1iJdxTixcXcnznE4u43JOtfSp0szdq34kf3eWf7riZr7mOET3zeKctmyJb2eu/3Cw
	ShVIZdPCEwxlLK
X-Received: by 2002:a17:903:2351:b0:2ce:ed59:7044 with SMTP id d9443c01a7336-2d015d4610bmr68523485ad.30.1785326076803;
        Wed, 29 Jul 2026 04:54:36 -0700 (PDT)
X-Received: by 2002:a17:903:2351:b0:2ce:ed59:7044 with SMTP id d9443c01a7336-2d015d4610bmr68523165ad.30.1785326076380;
        Wed, 29 Jul 2026 04:54:36 -0700 (PDT)
Received: from [10.149.71.180] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bc6d56sm10233465ad.49.2026.07.29.04.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:54:35 -0700 (PDT)
Message-ID: <d1af3fcb-f2cd-4e37-b1b1-d8caff984c84@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 17:24:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
 <b7a45a38-008f-45e1-b138-91ca34704bde@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <b7a45a38-008f-45e1-b138-91ca34704bde@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T9m8ifKQ c=1 sm=1 tr=0 ts=6a69e9fd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5Skys0qmx9fMEjuPsKYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5OCBTYWx0ZWRfX+/U4OPLHJZK2
 sEpXmiKykGrE+ip2QT6qmpRi6zVfyqK+yfbt0pzC15PKFQ/YiBMUIrW4Ej4eIcmGCQzbEBZGxHr
 W04w1U7H/b/A18YnFzXB8flJBzGP44m9nG0QlP7FmRdIAy6LZJlSYDBbmp9di99DHeyF0ATRjbc
 ZAvgbhptnXYUtfBFjYuDI4Q1IumTuz6nxA9uoQCEDtAvsLxd4i1rXCUZCO+1Iy36/e8P0IUEMBH
 1hGGAJ1xFwTled2jubq0AmHPcXsIDBWDn8ek9byUKY65iDas/ufJgFq1O2+5ySpkwntZqnirxy+
 3GWhcpwn7VZPOoFPdYCMoccdLGuechkOzBZg4sOKa1KKsiCDQXzBqPTzLyQrX6W3swPoTwRv2ls
 4TXn+ueeyVVWAZTY9O+zeuGluuDvo4jkOexRg17KZ0uXCM4lP28pdY7WOm2hmxmbDXm/KljnI+m
 C8+lzd71EXC1U0yAkRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5OCBTYWx0ZWRfXyKX36BfJupR1
 rcHjPHd1Ug+ixbw6i801qFL3anx7Nko7mwI9vfnQqQs1zY1Yt/vFiks6EZtV+8Gd8znxzW73Ha5
 ghTb0T3apF8HgfOPAoK2ia2ful38Zmc=
X-Proofpoint-ORIG-GUID: EVWTuHyl54p6l2czYmpIru9qI-vPqMPu
X-Proofpoint-GUID: EVWTuHyl54p6l2czYmpIru9qI-vPqMPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290098



On 7/29/2026 4:38 PM, Krzysztof Kozlowski wrote:
> On 28/07/2026 19:44, Anvesh Jain P wrote:
>> Add the qcom,tsens property so Hamoa-based boards can list the tsens
>> providers, and how many leading sensor IDs on each, whose readings the
>> driver averages to compute the SoC junction temperature reported to
>> the EC for fan control.
>>
>> The generic thermal-sensors property has no standard semantic for
>> selecting a range of sensor IDs from a provider without enumerating
>> each one, so a vendor-specific phandle-array with an explicit sensor
>> count is used instead.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 31 ++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>> index c07483aa5937..ec809fcd03ab 100644
>> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>> @@ -33,11 +33,40 @@ properties:
>>    interrupts:
>>      maxItems: 1
>>  
>> +  # A generic "thermal-sensors" phandle only identifies individual sensor
>> +  # IDs, and thermal zones are a Linux-side grouping of those sensors, not
>> +  # a devicetree concept the EC cares about. What the driver actually needs
>> +  # is raw readings from a contiguous range of leading sensor IDs on each
>> +  # tsens provider, averaged together, so qcom,tsens pairs each provider
>> +  # phandle with a count instead of enumerating every sensor cell.
>> +  qcom,tsens:
> 
> 
> What is the point of having internal review and then IGNORE that review?
> 
> NAK
> 
> Best regards,
> Krzysztof

Krzysztof — for context: I did move to thermal-sensors after your
review, but Konrad separately suggested keeping just the provider
phandle instead of enumerating every sensor cell, since we only need a
leading range per provider. qcom,tsens was meant to combine both
suggestions, not ignore yours. Happy to instead just go with your
original suggestion and use plain thermal-sensors, enumerating each
sensor — let me know which you'd prefer.

-- 
Best Regards,
Anvesh


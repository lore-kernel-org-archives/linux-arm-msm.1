Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6347F5427EA
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953043; cv=none; b=CjeDVkCKMfodBUyfmW+ticLm2y6iGTetvzy/QfPS3jvqDeCnO2PzS0DYHgcQ9qShL2pytqqYYdT7ohgbi+ubUSzU0FjBg2mSfWa6M/kRI7U4ZE2OTgSqVWQ6w/ZPCEaBVX/DGNchyos5G4K2zm8dEgwgffvPVIZqBamseuJds7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953043; c=relaxed/simple;
	bh=DWE8M30v1bz99kwMIXEjqNz+OAMhMFZrlkKR4L9XjpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oaRhA11jRbniiwKaOOOu79jOFOJJxv7VQlbICaAIA4a+wIQKWYwk8zJ980c84HSzNgJNQGdOwZ3Qj1O61+Jz+bEwK/W6r1deYDHIJmuLeUj0WPQ7jk+k5S3tUJEnm1tBzVSq8Q83aloeYxOPb2PqW25mD04PgSy7qoOeh5etAhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8BVk2HZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6RyL81c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8BVk2HZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6RyL81c"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689AqxB52294353
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CskMLjIGx5VAfoOYg5Gb98OLWfFaaV7A1gfjsZXCk8M=; b=P8BVk2HZm+8NaB6a
	2Yb1WhUvjntlhKtSCGglZBEpcD9l/Ed8gdn++IihAmIqhHX9pTDxjiq4sNhepaVV
	UWf+186NXeXtU3mKDASnDoFNofPnDzTlVQ67IozBXDc8J87RcM6Je2C41epiv4Bk
	ACU64hO/oPM7G03tw7ub6CgxPsxK+hbJBrrhOPJPh6pSmq3hmHV43Zf8HKJEldPz
	cosT/aHBx/yLgYkyAuDxAwPAajdrzx/zC0FETF0cCL5OtuMdOucs9D3WwdablH9H
	nGzlzrGyIrGPpELk06p7UxBJW+qJDWjMZPKWTDlRiKHFGcI4XlSv2+Zr7FPVitJY
	ZjHi1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru06aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:24:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930bd2bfc45so75926285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788953040; x=1789557840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CskMLjIGx5VAfoOYg5Gb98OLWfFaaV7A1gfjsZXCk8M=;
        b=g6RyL81caOHLH1Ln8TE73UCIj2ljr6Nkae1TZL8Tggv1BQ13aUvuo7NRnB74j21te5
         JaOxWSL3FTLPdek6vAUI8QSi9KE90bf6OPZ6othdjk1hAcPeDVQGsZZFvJp0KI9WpMNc
         z74MDIfjoqnRZ7q/s/31sb31fWnz4ggtUJUZYS3F7K12KyAuHERmMwMRJ60fz6G6m3RG
         5GPwO5nbBOSrXkW38kKwa3TT4kamfeeoBVJ96vtf+T0tLRUkvOrmt0ACeabGqkw8r8Cb
         fi6zH0h1ClGINqcoz2KkmAEccmBaxCIF7IDbCmv9lvMmv6OcdZ84pJeIUvwmT+qDwhQw
         R/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953040; x=1789557840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CskMLjIGx5VAfoOYg5Gb98OLWfFaaV7A1gfjsZXCk8M=;
        b=Uh7C2lv/4Xnoe6LCyZAmev6W+csdFeMehRm0O0UhUX6Z6DMcKC6mUOMmoHHM3D4CzH
         0oXJ5NVgD3x9vr2AQqCUns4o5WbKdorrVONEjdS8wY5h4FLOpL5LC/+cujh7u3qteNBa
         +Y3RQdWY73I1tf4h6EUVCl28FDmsWUCEu4t+6v1L4e16E0vmBp9YZKKjx/lfipDLsvvS
         ufewm0KbkPqfRtJ7gfcXBZwIxf4EoQLA2ZhVo46sl4hjApLAS4UDh1AiSJUlyoZHCVQW
         XeYiZ9qnpD1J//KFliL+82wEVM1lPjTXE8nMjwQS3y6TTqffV2FXPCE1tO+AM1LmHszV
         YX2g==
X-Forwarded-Encrypted: i=1; AKwUvByRxKginUVoZnuEDvgm7DORbIETCh2Nzxcc/dtxL/J/2V0jKV+a5F6RKZ1LKVkA1x7Ei+MqrKvv4d08AZWc@vger.kernel.org
X-Gm-Message-State: AFuF++kUPCJaDoCk/QGx/861WCKcrA6SSXDqsMLD55PuRwvAmO22Xnus
	0g9+/sL4HzsMNc3RWXrfrGoEphxxs7wmiefB2pFZdQxRnRRZZTolrCvBbCg4GAe/iSLId6M2E1X
	f+JA+Gqna4AE1kXizP7shOaSuQcBlWpOK/B/4vTuurzAM2in+jnu5zG4S4RDHC8O0//2k
X-Gm-Gg: AYBFou2CFK5QsIgwDijBGE7jR7SZFqbQwrC1XKCLcWDsn9LJABFNnu4rtsTcuHfkTbO
	MK5O/wzXT+iGyyxF6GmlZNZ+NiyLUtKZIbTl+Evb7vMVVvp24mCM5C9vGRrYNrEXO9McXOjaZY7
	3Ej67kZuVzHApI1+EwB18d2uP/rD5aRsiQd0GRHGLoDmJs7XV+sP0QgFraHnFRvTtqxuzq8Dmqh
	Qhj7Y54CG1tYU5i9yNE7X6bDPJClLBORPqEkP7LnWQnXo5b42dx6BMMdJeDDCMZEwj3s6eOzNVT
	/W4qB9V2ZDbp7LNU8afizp09eQKsweCrnOtAzv2S3MS+RUKfTh0GDaQyUcPUXXgHGZG0jcGvLwq
	WAlz3urnJWz7JtWK17sXzqw==
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1146508985a.0.1788953039528;
        Wed, 09 Sep 2026 04:23:59 -0700 (PDT)
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1146505485a.0.1788953039155;
        Wed, 09 Sep 2026 04:23:59 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm671326266b.25.2026.09.09.04.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:23:58 -0700 (PDT)
Message-ID: <44e0cf74-93f8-458c-8374-a1de70b0f2c9@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:23:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display
 overlay
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
 <20260905-lvds-support-v3-1-b40a1b03f63c@oss.qualcomm.com>
 <5954fbc2-08c2-4509-8703-ab20d57be309@oss.qualcomm.com>
 <aqA4xy0XoXjLrgNN@hu-vishsain-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aqA4xy0XoXjLrgNN@hu-vishsain-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa141d0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=AxN8k8jw1LNhRdHrB10A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: r8H7WHZEGCr9P0BpJ8tpEf0DllZaKHB6
X-Proofpoint-ORIG-GUID: r8H7WHZEGCr9P0BpJ8tpEf0DllZaKHB6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyNyBTYWx0ZWRfX5i982LfAf7fM
 2x+u22ZBtIQZANmZcb4v46I+jA8H+RT1/HQDTVgbiupiBZult2Bz7/X7csU5FmphV2907B5E7fU
 2+gkNE2Lo/RqB/RnSYZ2e2nfFkuEmXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyNyBTYWx0ZWRfXwdvM+Xtt+wg/
 W8z1A7xWlpeduCIYWMpUGl14FpusaQXsmMlWwtmhvrGG4CXX6rnR5lBoS3tqiaJTqwI9T+vXpLP
 capPxQWuWObH0z+6J5taICuzMn8oF5L3+XulObzaSgNwrtbFLWhxD1RyyPEU+dmCfhEm2J61cb/
 1C+SbE0J9svGbhLXUj60UAOTSyxLKdtMQwYM65yH/NX0/yFa/GF7QS4ReSoNVbzTs43ZJ9BN87O
 wCYZlKRVvYjRscqPj+Z4B31dySgxQ0ArvjGaZWxbBj6wc5ciHwCLNg2yC0C8OqFfkgsPm6FCsZq
 rxvFAyL0KHY41st+IZz7FdlbgiesjfOYMu2mJXXt7/czrOd/sp+Zi/1+USWz+YBJbAVUnA0cmrR
 OinnskXFbU3XpNhnmmeAUtCBILuGoK8HaSkBev2YHuVCQWbYAiIC4B9NcL67SR9lIa3UBtX0Ylm
 tuKa49dIEmMzK21L74A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090127

On 9/8/26 6:33 PM, Vishnu Saini wrote:
> On Mon, Sep 07, 2026 at 01:40:52PM +0200, Konrad Dybcio wrote:
>> On 9/5/26 3:30 AM, Vishnu Saini wrote:
>>> The Lemans EVK IFP mezzanine supports LVDS display output using the
>>> Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
>>> DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
>>> VESA-24 mapping.
>>>
>>> Add a DTBO overlay, lemans-evk-lvds-boe,dv215fhm-r01.dtso, that wires
>>> up the LT9211C bridge on I2C1 (address 0x2d) with reset on GPIO37,
>>> a panel-lvds node for the boe,dv215fhm-r01 panel (matched against the
>>> panel-simple-lvds-dual-ports binding, which supplies the panel's size
>>> and timing internally), and an LCD display bias regulator supplied
>>> through the GPIO expander. DSI power is provided by vreg_s4a.
>>
>> [...]
>>
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -58,6 +58,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
>>>  lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
>>> +
>>> +lemans-evk-lvds-boe,dv215fhm-r01-dtbs := lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo lemans-evk-lvds-boe,dv215fhm-r01.dtbo
>>> +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-lvds-boe,dv215fhm-r01.dtb
>>
>> I have very mixed feelings regarding putting a comma in the
>> filename..
> 
> I named it similar to "talos-evk-lvds-auo,g133han01.dtb", but let know if i need to remove comma.

Ah, I didn't know this is already in place. Then whoever would have issues
with it would probably harden their tooling against it, it's probably fine.

Konrad

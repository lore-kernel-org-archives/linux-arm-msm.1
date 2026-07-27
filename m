Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89358377EA2
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785154145; cv=none; b=JphUsANlFBIRemA1ZsqRmqNsx7rT+ZNlsXtB5LGeM6zqcexSj5gBKhKB3LmBzmsunvcJnUM1NVe/97fs5CO/6kqu/P5D7NgNVdQ5EXTEO7ByKfoqsko9dVd8wnoTuB2dOb+0MDUFIEUXD9jjv+noRf5KG22fJIiAOsOmaBieXCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785154145; c=relaxed/simple;
	bh=0wWzDvNNjRkNz1TAo6T7K7FuqaOiulsSbBPgyayaXyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BCIkuyOjVtim3YCz2gdVv/sKuPZ3+ru3QDfKL+3o1hNZX8kMASfjCYz4vZemUUmESeJQoNI0BOa5ZmMjTkUvB0uO6v3j2XgmFB73SAgYEyzja28TSOQobpr2Ou1Z0LUp4S5oi3KR37C7fynKlaIk99tSQG3PhDZicgosvo85nnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4DM9jqV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvhE9GSh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4DM9jqV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvhE9GSh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAM0Zl3570852
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PYxOnzKH2aprWq/GgtxhEywEUx5h5RTOvxVs/rm9/O8=; b=l4DM9jqVDwmFKRMb
	ZR3DqzFoNgecI7vziP43G8bmcbmeH3Wm3yfdhkOigBs9fiRECzioNskJ4yVqcEGE
	uLcErD1mmlVY608aL0VbvSdzkgYkj5ijaoNuWtCatf5uo44yYgYBKRLc+P/h4+S9
	PvM/E5HaG1C9c61uIXs8vnPrdb27yhTEXeZBMWbAMCnVGBRLHahbEv8xEb0NxgfC
	BC+vRyp8Ug61y/o8RI0lgL/v9VWOk7npdmz+dtNH+dc1vY1VX5yfiNdn/a0mH595
	0J8JG7ho7hSiB/fCcpjuiN85MNJ7Q4wBlk8W/OKeUfFFuQMM4taYrn87qPdkR3s1
	cX3SYg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp30g146k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:09:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c01ff996dso25848981cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785154143; x=1785758943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PYxOnzKH2aprWq/GgtxhEywEUx5h5RTOvxVs/rm9/O8=;
        b=cvhE9GSh6uLSKayh4ccretijRSQkdw3GsJuH8STXnyVZGEMM5SEIl24wd1/t0jEGM5
         Tdw3uH5Q3pon7MOpur240/+tFfnwHQd3wABlI/lNsrDVDB4ZzRlMsWTT46dxaucThjRe
         eZqR6ZsFsgGKvbVIkNmzciQH+9CEs3wfOf6njZVkeuHtwzMt0B38oDzxa9bYPJG3o4hx
         620c04rGzyII1G9jRGHIwM0022rxko90VqpM1pz5PnadXQF/cQfkdzd/+HxDPC6DgaWe
         wcTPW1wWXF6O20EvpWXaIjo5DPei1IMgsZxOm+uOnxmNiYsF+l9ajLik1PpBxXQus3uH
         d0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785154143; x=1785758943;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PYxOnzKH2aprWq/GgtxhEywEUx5h5RTOvxVs/rm9/O8=;
        b=Cc/4NfwNlDlcDL6F3V1naKR8eM3MTW+Na6UjGzapnT6AN0HV67SA9JimV56EqqLVtC
         sw3fX8ZUPMXXjl9VN8nU1KBnGCtluscCwt0eYth8F0BCuNsazhJ77ksXHnteQwFxQtwg
         ycQhCDEKvK2xR8Qg1ZXsAaE3cfc6Jy4LLy/3Jq1n5YoEcGG5A6ZltIbtrryvbfKbQ55q
         izVHL0p28lvafGnDze81wCzRNO8yaE7abZInQz8mIYjGMyKdcZqLMAtXleV/FnKAlj42
         gMXITYKUYbCOiGOZA2aYPkYjtPcirPNUkmH6mPry9Vg+QldGiMmgSD69NdBE1HlK8VbN
         aQag==
X-Forwarded-Encrypted: i=1; AHgh+RrEZE6teAUJBbtniF9gcNeQE0kOa3b+5AQIJyCdmdozq+DrM6m6ZNz8I4RLcyl+dh9hTRCW342Gi4h5y2q+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8AfaoGuacTQ4OdZxclKzP/mySUEqYly+QCxzWcu1RRNMAG5Na
	9mTwM7aHpdiB4rQpU85LhZf1WMLRaFiwzSK26D4s1M3F6mSxcpmGYq1IZSsjHW+SKIO77oM1Ulp
	Ric71PCScBfiMJr750sAhoiSvf803qNM99rJHx/uwBxfc4dtExoFYpNbTWJReKtfSUZ+E
X-Gm-Gg: AR+sD12OQeSLgiAp5KBuk1w9ry3VtGBZ2sAJK7w8fwCohUH/a6QjBCkjka5iwvkK56P
	/tGbT1UrvSPBEBI+W12B2vqDn2f85nBr4E9MDAhrbb6KrgrmX8VGypik00PaTYptSmukMeL9L17
	YbIG70qV75CAFuMX4LVUgDNoBH++KWZ/AK7eF20yCSxAVFOIjAQXsufLQBEuoko4EXBY7ai08Vq
	humJLBbFylwCkyqaq2a3gXU6WZQfXCEOdB5wGT/la/CDwsgsq1knAZtRCcjoWpaV2p8QRySG/P9
	bZCnRQ58dMpP/mIcU+JbGe+w8liRrKE+PbxyDSKwwx/R9IS8DlxYLjYnE1HB3jo/HAqr1yj47sq
	0204WaI2REpEGHrxWcsKE0y5jjC2nLg==
X-Received: by 2002:a05:622a:4ce:b0:51c:7b12:11fc with SMTP id d75a77b69052e-529a87635e4mr85501931cf.74.1785154142767;
        Mon, 27 Jul 2026 05:09:02 -0700 (PDT)
X-Received: by 2002:a05:622a:4ce:b0:51c:7b12:11fc with SMTP id d75a77b69052e-529a87635e4mr85501571cf.74.1785154142302;
        Mon, 27 Jul 2026 05:09:02 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be077b76sm1421416e87.13.2026.07.27.05.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 05:09:01 -0700 (PDT)
Message-ID: <c230de1f-0000-44aa-b7ba-0133b381bdf8@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 14:08:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] irqchip/qcom: Enable compile testing for QCOM_PDC and
 QCOM_MPM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260727-irqchip-qcom-defaults-v1-0-ed80ad83ca53@oss.qualcomm.com>
 <20260727-irqchip-qcom-defaults-v1-1-ed80ad83ca53@oss.qualcomm.com>
 <bc71b5d4-7ea4-4c84-9cf4-b26827a3f4d9@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <bc71b5d4-7ea4-4c84-9cf4-b26827a3f4d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a674a5f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UPCNcHXCk93v0Sf9j1UA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDExOSBTYWx0ZWRfX00Ibf9eIsYxR
 P4czRw7VFiFl+N7B1s1vOlbhYbLbP+5TJhusYUw+AmPdLZM71FcK5q2GYVIR1kBXlRWCcJarzGD
 tALfuL4tCu7+F925T5Zd7RhufKzfCYo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDExOSBTYWx0ZWRfXxUp9zxzBs/s1
 kXs+gerUVLlgCA+CHjw/2I2JPh/5p5tu9iz8NF7eFvlEMEQO7X6IM2x/CoJPNzhs7K5RaGn3CDX
 +E8ZcK0hO54lzrtlSSbfvXoJJbpY1Tf1nOx0hGZznv6KvZTmTpfL2Ur2eYer9WV+FiIFKGIoYoK
 /bjPyTdXNU0UCXtTUdE3vGoHkjYcGV9fl6e/+1ueSEdksG/HmpKxgSKd3ybtvgu9U4ufk42/3HC
 5BlpOzljehUzbrLNPv12UJLqOSUtWVfEUoNaLFecDFFMYtjf1g4BNjk4DlKlXP8Lju4FJwza49E
 YY54RNhn5bsSoT30Xnsn/N+sCKOVJOunuro+/LuL8yCngDAjKqAQYPkcWcLz71pqaydfqdouHmN
 ZXtwAZzKTXu0P5pFlkgsvKX2WVeGRvpNRpQtortQH2nY8oQ5YmiQ7WxW/mla2hcTJqoXp/rxB7B
 4Q9Jdu918dqXAxLagug==
X-Proofpoint-GUID: ac6RYfWAOkA8jQdGWveIdS1AScq_Yx2c
X-Proofpoint-ORIG-GUID: ac6RYfWAOkA8jQdGWveIdS1AScq_Yx2c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270119

On 27/07/2026 14:00, Konrad Dybcio wrote:
> On 7/27/26 1:44 PM, Krzysztof Kozlowski wrote:
>> QCOM_PDC and QCOM_MPM do not reference any architecture code, thus
>> should be compile-testable.  QCOM_MPM is used only on ARM64 SoCs, thus
>> there is no point in proposing this option for 32-bit Qualcomm platforms
>> making kernel configurators life easier.
> 
> This is only because no one wired it up, almost/all 32-bit SoCs
> have one too

Ah, then I will not restrict it per arm64.

Best regards,
Krzysztof

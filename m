Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E21476CC8
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152187; cv=none; b=i0Nh4h9wXsTmpEqLOlMWMU+bij5Un426DSRr2Kl9Vbo8tP0DvB66pYUivjHIdQCsaJOgDoF0Ofdkr8Tt9iot1hYFW8fX0GpFSn3rx+p5QI1k00SV1rWBvV8o14Vn4KPfK2rD85DfuM+iE7W1+S1DNurlbvDPiDbdkdEIrJWv+vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152187; c=relaxed/simple;
	bh=SAhkw0bfytYb3FTzJCRNYTSW5l51qXJupqJ4BUIGy0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oyavh03HIRfqUjlZkohpHDOg+aDV42wZRmUq8RN208DwMJoYoyupbDc9x0lN8Bk97FrkKORrbUMnTzm43w3+bqugLpq1SlXFQuYWrai3VQGDJT/Yo+xPE5YUDyO88A1ppLn9fQgi+oZTPnw6u+xGkL200UsRlGyBgMl0EIv+i6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uen1aJ0O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FMWl6Wy1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uen1aJ0O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FMWl6Wy1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbVT01620492
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	87gawTrACARytKs2W9g1jU5WlVCJFm6E8Bwk97GilTI=; b=Uen1aJ0ObHuv95vH
	nKpb36NuX8aPsUtRDk2iygHYI+5ff5FLf3pkwRH4mH9rBJ5T4oHpnmhtPqRJyrkC
	Z1O7mydR6KVlKwzXXz36B0ku6dxsZLHaJ3uvqLob7DpbVlfqGk9oq8aw6sC7aJVF
	/oorHTtJ2wck1RPkGlVeglJBIc+rOmkH+7WwRyfAIqvvebGyiW0K8OHl7GCihWO1
	63EJ8+3yHHROJYwpT8fXtZlRS/YvfcAH6jPfZ1VUOeZFa/6L+nJr8V303QHschhE
	2exTQLNuZSA82e/wpIwWyvjnDuXnw2FRw46rEARwuxOiAm9NNp8IlMrPKHFaXhmL
	ODj0Bg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e83r6eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:09:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51e9d892f0dso3108741cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152184; x=1787756984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87gawTrACARytKs2W9g1jU5WlVCJFm6E8Bwk97GilTI=;
        b=FMWl6Wy15mhBuclVanh1+iYbb2svAAEGHmDD+7kHtkZR4+MGz8LC4jcUmUrL6EXPhU
         tVC96pLbeWkFFBJRq5SM2XGqiWUyVLKKnNAQrHT3uuhS/canisodUFJIFFJah7FmuwcX
         cCrxEX0i5E4hK92rFUCzLTKBiPom8aSCR0UIJIRwyc6UzATPIXGvBuFnAUyZi7rD3A2a
         MDNJY6z+pUNdbzBRr6MIGN+F168ScVeKpAyIRCIMfQMKCIehasUSv3raBphQ6q57xTES
         xaqfVQSiD1bloAe4nd41MkpIaEIWv7/VBnu5KEhY+HhFGtTWaI6WrohkJHTPDdIhVRUU
         YGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152184; x=1787756984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87gawTrACARytKs2W9g1jU5WlVCJFm6E8Bwk97GilTI=;
        b=cJQk/gGLM9zAMN210bqfF27MRAY2h2P34D38vsFAh2242DlBWsmFWY8wO9LHmz/ET7
         cDqBeF30FeYQKq1NfEH4DxWTX1YtKQSDLmjSb6FAYUyiTdCREWd9plKkU2bYPlVKWq8D
         aKA3qvuMzJcxTEwk+wPUWIlDILABZyOjPamvgAXWsyUGZrPCgP60aphkGJgGQMA1oIk3
         wAXzi2tBZya/rNJh2WZyBeqPiXcVzWqs0jUXsGkUNOhZc65QlZkw1A4tmISxk0O+fSH1
         sQ376JaOsXoSo9+TBWIts2dvMzLAVPtYOi8JtYmEbuHHCiTbz/7w/n6YKJfFSjnG1Lk2
         T8XA==
X-Gm-Message-State: AOJu0Yy008Cpr26eSTO06XwhdOGXbJWAHpKtuB48Q9bq8rTnL+7ph+JI
	IE3NJf2DZtkAW6kX3cnGp6aPhGmL0O6AOSkyMv/Jh3jSG4Ghz2ZZztBN7DF20wiOU8HZXVO1Y4e
	Odz6wMrRpCXNbFa7BNDTwy914bSbYYwAIIRf7AJqAER2NYVB5l3/jBly5gXptGvT29mvS
X-Gm-Gg: AR+sD1349eYkAQzfJBex52wlPkx8Jzf9kq03PQuy1tsmlPhXK2rpN+oBK2MmyFZObwb
	s5VD0wP6JcO9zbLcHWxsZkcWy9GWKW3+/VXlfg2TEsWsiT1fi2+d0NdWRUsm2VVEEHNmHi3slAt
	dXUKMHI586XsmjqJhc72tssTyikp7HL2KsFBrrNZvWfAykQ7TPIGO7zwYk3fYYR6pPjb85pV3di
	/2dNjG1E+MoqsKVvT/TbtBCgbYr8T1Nx7mviA568ubIp9SE5/HwzKGjm8191y9OebkleXsbZAGS
	BatBVYtZ+o4JSST/KxLu8hEGn4foTvC2Dd8mYDbPqUuMiNvoki1itfoScDpEkqoH1cHZbA3j493
	wA6GGcO2SV/7g6ILUePMspY77
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr37247481cf.3.1787152184208;
        Wed, 19 Aug 2026 08:09:44 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr37246851cf.3.1787152183676;
        Wed, 19 Aug 2026 08:09:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c7a6be4sm93083466b.21.2026.08.19.08.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:09:42 -0700 (PDT)
Message-ID: <8e3fcba1-dc3c-42cc-808c-4f2e5b6ec7cf@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:09:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] arm64: dts: qcom: Add AYN Odin 2 Portal
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
 <20260727-ayn-qcs8550-v9-5-e3db456e10e5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-ayn-qcs8550-v9-5-e3db456e10e5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX/5MU/A4TDwsi
 o50996zNYcMFbgxgldQ/RIdbDOW1TaKCQ4M5ojGk4BtPRMiGlAUDSkH15Yt3H0NKiumRhf2grjX
 HqgVn7P2yQGZef8HYD7kUAjZClYB71I=
X-Proofpoint-GUID: 9WZ6lgx7hU12Nhlwp_DbhZ-HIGGuV0-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX2863QbwjpVMJ
 ESDESguaBjANHs1E0wUDT1R56zrm+rYt4RzT8FFZsRwONNT+TjaGHLfHtbeqI9pq3vY99Y4pUBt
 JtR8V3p6mQcd9v81rF1aQ8RQFsUhZbzFxkhAbtfkqUlfe+LAAXnIE17g4/V+yap6ZZ5QCB98l7m
 xccvKifCrhr/HXn6JFXf0fZkKyosDlLN/YGEvisjq8dSQqugjDgzx+9j41oHqd+jTi1WkbBPZCr
 G0QclYdlgVnsyxN+6V2mkgoqWYR1XHxm2pK42d5HuMT7ICwiiQ7QiJRZ/8MoEhnkmpv3wtcg4N0
 QGeDmUSKe9gXkI5NdS88tKSX3PglJqUrFpFwbSwkHmk6zdXsI2SBSbg/hxbPdifA4tM0TrwkOmX
 nM2xDFWSmdd/pedYcxgWs3Mu47CBVZgp1Ob34AacQfHRGK807EcDm1Ru8P/ZzDSK0tKm6IUFgzm
 it9k1Ux2yyG7ifudkSQ==
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a85c739 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=4PMlgOObqc5rzRHRgksA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 9WZ6lgx7hU12Nhlwp_DbhZ-HIGGuV0-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190118

On 7/28/26 2:20 AM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> The AYN Odin 2 Portal is a high-performance Android-based handheld gaming
> console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> 7-inch OLED touchscreen.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

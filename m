Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51853F413F
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787652734; cv=none; b=LoeEtR2oV0J72uyw35CgWSIhUsQlSTrv8dln6K3pzI8skt74iqQwvmAmXV6DOxNK4dyyi/HVgYwZSHHUwbnTB+v8VEHsrCEl/DiYSil/bdOBOrfFyGfed5d63RRYrDqKrqgzX08DA/66hkgR8mwMh9gbbxXLS0n6RTi1YX+oJoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787652734; c=relaxed/simple;
	bh=EQSGiojsYALTSGZ5Y4YskmupYqjLh+q7MfWEhQtMbEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QahXTm8GjhyE6JOkn7rCACZPCYXcof9gdlGuFGGcPDDnFgx80AnBfOg1hXg+u1C25HmrUOBCb0nF8g/X8wNx4boap6VJOpm6Dpj3l+IOp9zxq4RQ7S73EMvhCgQj/RIMD+yUFgfu2JNZOmiajy7qAENU+8GcDdmiiFQ+eXJcAD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dvmQlg1W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0nXYuev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dvmQlg1W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0nXYuev"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P9YLbh1074726
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZJEm0YAVf8sVvEnytUvJioE0+EoqWLxL+9jnYrfDyFg=; b=dvmQlg1W6qBdV8t5
	7FwJqiHhyXr4gIu/49lbl63+mHf7l45oVoapZrq5gPw+a4vrnAACOMHOuNkkGym4
	SB6NqfY1HhpSw7/0V+/H75a/xQIXjSJNTlkagZxuiK9K9vXEDxSYu6CVJHxa/88C
	60hZxJ8qkA0Vu18yrL148a0y3iHVyHvxVKjciYrtTDKTBdz6TADlc3tB+Xkcupgc
	kyY1+QKKAy6WB7DXCb3kLY1SDJniDJqs57e3ynY00/sIpMLcvYFCqUFOzr8dNizU
	7/K2+B53g/sPIstZy+67+nrZ4zUg58McZIxr7NYkkvXMLjhbw5UOYjr1PwfVvOHP
	6Qm3vA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g98hp056e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:12:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee894b3d8so81642925ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787652726; x=1788257526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZJEm0YAVf8sVvEnytUvJioE0+EoqWLxL+9jnYrfDyFg=;
        b=i0nXYuev8HRneTJzUe3MHSnlOyNVlfoWiflTbONXItcBWAYlh+fWwmQ03YQRnnmMK2
         gF8qGstANUNkIfOgnZg99AbdgDwZB8kq8epkrsTxg13WDPtAXlj1zN7tsewsYgwvCMWV
         IOkOuk5p1b8Aym8WfCrdkaGuJRu60n+3urRABDvfHcA5mEtTLQdNDCvFTKRgtOkQrolZ
         6xMbDlQV+QMiCk0QHVJHtwlQZuplUIqkrLX9LmRZtXxfqUveQ+cO0Tzfo/+I+EGRD+bq
         Wm/RjOyUwNcJBXmXM4AxXAattUELQppsUSAHy/wBEjvhUdE7CeuTjKMqOBZAZUF+ON/f
         /CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652726; x=1788257526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJEm0YAVf8sVvEnytUvJioE0+EoqWLxL+9jnYrfDyFg=;
        b=SundVjiS+9k5dqd9FlMbMM1BUqEgvi7UfjTV1O2SqFk6Q187T2Pqw7BPQCA9e7GqzX
         TmTkyQ/mbYJSnVwwl5SBukzuaFFQxze1Z7uFeVdZ7aKNKEGiXQs9yLKAxgw1Dmg3Ox42
         ZSZoZ0czR/9sWXaK82VDAEGveIksF84yvEWSII4tSlbJQ1cjqMRSaMjT1syTw67GPOp2
         uGzCFtp5EQG6sxnFWHzWe7B35PSPcvHTfzRKxfaSZxlj/bHT2GGdwYu/8mt2eXDmm69Y
         hWiYStanvktamDwv8XEtmwZMnAm1vZcqk+A+FI9VsY3AaoVOt01u/GsjqKGE6a3M0AD/
         8TjA==
X-Gm-Message-State: AFuF++ljkRxlbBM4HfvK4Nd1h4O5yjksSdS0Bq+SjoKZriLpNJrtO0PN
	Gh+w+mMrXrMORX1/deZM2KZhkB6Qeg2C64Vk+9sFgKSte7pJoCDQyPMFJU/xYckPj5qr8oW+AyH
	fFmvk7YU3+YqtImgPN0ANdXPWiVAwPQs3QDjRIFXlYuR+o6K0mfqJ5aKA1OJznUO/DjNF
X-Gm-Gg: AR+sD12p/NKTrpbfx52GLYGxNEd5kwH/ewbLTJ7EVAOH6p7rPlz4dmjPpdK5L2Kv1CC
	dr6dMFFFESMGQA9+mOPzPMIRJnyJx2iKMqoNxX0N87k5Yg08OSn+4slI3FUCNBm5mJQnyRGe83R
	QseZ/w5qtNtfULT8ctbIhfW6/C8Fobtuek374qNEAHLfAyS4wvjdrYv/W5rsq47zFvw+6h6nA2N
	JO5WIuMBoGFJh8/YlEkzdRJLu79ZphE9+xYvNpJzLomWCcF15gsRU9gyy0suphDOFJJjXf709Kr
	ngpbXDuKj15GdUMiMFplgBvbV37gark5vswzl9cenCtiDTYDmPJNt89eQR/a4vvEAsfe90XxAag
	eF/dt4p3udlotC0E0fYBXrRvsrb66GsM=
X-Received: by 2002:a17:902:e541:b0:2cf:82e6:a5 with SMTP id d9443c01a7336-2d670cbd08cmr430892555ad.13.1787652725989;
        Tue, 25 Aug 2026 03:12:05 -0700 (PDT)
X-Received: by 2002:a17:902:e541:b0:2cf:82e6:a5 with SMTP id d9443c01a7336-2d670cbd08cmr430891585ad.13.1787652725581;
        Tue, 25 Aug 2026 03:12:05 -0700 (PDT)
Received: from [10.218.21.115] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676761cf9sm26410825ad.7.2026.08.25.03.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:12:05 -0700 (PDT)
Message-ID: <f30d7e3d-6f48-4c3b-acc3-36f1eac1c5be@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 15:42:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com>
 <b9b07abb-b9be-478f-8e4a-204d8ce0586d@oss.qualcomm.com>
Content-Language: en-US
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
In-Reply-To: <b9b07abb-b9be-478f-8e4a-204d8ce0586d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uXYLxe1ZBayGzindOWuUkA1StXlrK_dC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NiBTYWx0ZWRfX9IhjWzNRgOzD
 NHzy+a3fuUx17AUzIQZxTlhQ0Q7h1kaSgCCnjUzyBMvBymOjKJZQEBWMBFrYwz+Uyvof3CIMPid
 wSKGT5d/vSiq7yQKvKxBdLK8K6gi9dvN0iphFiFLb4IxK7yphYyqA7qpP52TWrW2ljxf74DLqkF
 zLdHoq+U99y3ldIWcHQDNCq9lYppw+qJqJTl1XSQGEMLpsRbts0lQuSnXTx2C92ogwjH4wjp8zW
 /ZV+qwPG+gvGn35CBuT6XeDaNZ642kljRAHt062dt6ec24ePenoFDBXt7X7q/9GZ7/bG0penTJ0
 bb68cHub24ht5z2tlv3w+koQUp6DSVrnH8Xi53YfCKrF2DNT1ZRUmFFyZ3jkdzB443dNv915OBl
 fK6NHHmkcqOgHc6/qECgazVU36kAS6j2LwVdsIX31QF93LspNWNvKC5aTLx61HjOjUuCnKIx/Sj
 x/hL2v72XsQ0kEQ2cGQ==
X-Authority-Analysis: v=2.4 cv=B7CJFutM c=1 sm=1 tr=0 ts=6a8d6a7b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zVusS4tTP7DiVzkMLGIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: uXYLxe1ZBayGzindOWuUkA1StXlrK_dC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NiBTYWx0ZWRfX8/IcoH5iHUy/
 VwS0Lz1Jv8NwXRcln+UcVNcvp6mokx4DxEED762K/L54Tog7s+DJ3XvudR2JD+8Tac02oh3a+Qf
 S8IkPq1ZI2UzU3hQ9fdVYksRwlk3jO4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250086


On 8/20/2026 2:52 PM, Konrad Dybcio wrote:
> On 8/20/26 11:16 AM, Khalid Faisal Ansari wrote:
>> The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
>> connected via SPI5. Enable the SPI controller and add the TPM node
>> with the ST33HTPM compatible and a 20 MHz max clock.
>>
>> Depends-on: https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> This is not a valid tag to put in the commit message
>
> Why haven't you sent the two clearly interdependent patches together?

I referenced the SPI5 enabling patch because the TPM node addition depends on that change being present. I had followed a similar approach used in an earlier submission (https://lore.kernel.org/all/0afa55d5-20bf-487b-abe0-4e2126ccf453@oss.qualcomm.com/), where the dependency was mentioned in the commit message.
Since the two changes originate from different internal ownership areas but are functionally interdependent, we have been handling them as separate submissions while documenting the dependency between them.

>> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>> ---
>> The Shikra EVK boards (CQM, CQS, IQS) have an ST33 discrete TPM (dTPM)
>> connected over SPI5. Enable the SPI controller and add the TPM node for
>> all three board variants.
>>
>> This series depends on the SPI5 node addition in shikra-evk.dtsi:
>>    https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 10 ++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 10 ++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 10 ++++++++++
> Turn this into a single addition to shikra-evk.dtsi

I intentionally kept the changes in the individual board DTS files rather than placing them in shikra-evk.dtsi.
While the current EVK variants (CQM, CQS, and IQS) all carry the ST33 dTPM, a future board could potentially reuse shikra-evk.dtsi without supporting the TPM hardware. Keeping the node in the board-specific DTS files makes the hardware dependency explicit and avoids enabling TPM on boards where it may not be present.

>
> Konrad

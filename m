Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679E3441022
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320899; cv=none; b=hTRzyMyGRjzZHE2hJBwBPjxOYMbjtpEmy3z4o67NrII/kxklW95T+bjwZwVKQYqwOComMhDmyaDd70/sciFvf/8vXNzS8tLIauBhOVWUzGkzPQTDp1tRdwqYfe3JKmZW/4G9jQrfyDwGA5nX8laZZ2ZW1PfFpSBYF1FjJIIl41g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320899; c=relaxed/simple;
	bh=rtGE5fCt0KMBQ9H87VSduJpBxkTP+8WK22wMAKvNLHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cs7SY/QGv1kS1oDMm7wZR4OI5HxOMB4Qi8j1km20ENIfykNEsT0VrF1Wx8bGYPjm08HPknt20naPvnC7g9eH6ZHLLsHP4TPupVDwGJlQscDaeJbarTM398zBVtN68hzywyVYO3VZSWWuGHDQNT8H4R0xNUlTt4lXqhW8kP/VNwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fer+PjKR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z27GhhzL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fer+PjKR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z27GhhzL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fWXB1054076
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rtGE5fCt0KMBQ9H87VSduJpBxkTP+8WK22wMAKvNLHk=; b=fer+PjKRQhUEOWv5
	BIHIYC2E3JeS5j6cV7dEwROFaBDHVzQjVSI2EB5KRPTmfEljxoJvK7HyQorjEZKl
	gWuGs+4MCQ+BNXrp4XNEN6vDOGdaNbEhaDpetjglZ1Hm2RYM6HuFCBn39/NdrnOJ
	J924b6a+qiIFrxfBEeqEpYT8y0/LfNhYMILcd99xG4B+/T70+b0goizzYQSYIedK
	EJZyvE8SsKmtqvmm/aejZR9SX2o7dXEmyRUjS9ZPpFClnY++YQ/QmjZHSkXom8bE
	do6zEwOn67qTpVCFslNr1IxYyEimSTXpEHbAH/36rtWLtKMqkbdGt5DMyqAIQppJ
	He2cUA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqa301fvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:28:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce870a060so19989925ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 03:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785320896; x=1785925696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtGE5fCt0KMBQ9H87VSduJpBxkTP+8WK22wMAKvNLHk=;
        b=Z27GhhzLauKVHdxxYaAqq6D07hH9P1Bdzxqo6CZFwstaHRgpZXB39J5vVr9vVrDKGM
         5BvwKnzV6zjjV9MotO4utsFqrSn6xqwQoVk10gpfP8HDBzTP+//FEOHzWAyTgrXtBeSG
         9o9i3rbtzEC/SO94V0FC69XH1TZ2reh8wVp27/g08iVk5va/fXEWgu5o4df5eYLc5vlS
         Bz6LAmNvfi3j/GpYcvbrKMT9rMrZMLYUrRKN3ns4jMbOa9f7upmmfG7WkhCeIVkkoXjE
         ettEfMiSFlJfDWC6L71svLe/Q5pJryltYxT3B/932aXQ4ojTaJ0p/x+lmhdTDsQPxwPW
         2KSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785320896; x=1785925696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rtGE5fCt0KMBQ9H87VSduJpBxkTP+8WK22wMAKvNLHk=;
        b=VOZiTbWbHCmX05eqkIYMuwhDdVN+tJV/1kB1nT1scDEamYulGfQeTov0B0paKCHXRS
         waM/nkK6nAyxSSjj2Hdj5dpk/GwImzAiF5xfQTZ/KF/T4y8EaEqW3PPlw615RiyXW9dF
         X1mt3y6uBOMV6ErX07h49K2XgsCDUTcRSLwnSxr+fU3Wd/3YUSVuL+JYACKjBbjbdlUR
         zt5pVAH7oXIBPq86JkfPqOiYedRPETB7YgRFuZkUQqTgiPjDOHeQeV4b37JkobLQxeDO
         LNCF8ixosIaA5B1nRxKlz3/rtMpVBmZT74FkDQt7+iduApB7uY2XC9UxxJIkUlwg3Att
         65rA==
X-Forwarded-Encrypted: i=1; AHgh+Rro4k7xRYpOr1vOBp3fVzdcgyCVIkM+2aMZzAH/qGOcgsEfL9gF/mL8dNtc1WPL7LXNDKtfQfCox946yYld@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1HEx+SZrsEPyzEnDzpd0W4x6lwwBx+vJKAULAqYdW0PNKGtx6
	rx1RZb5Eo+XlUdD1G6eGOUOjO2WGby+cJOSJZD7V1rn6umnO2nf1Yv9MJkuqqrz5Cw3wa8q2Bhh
	FACYwh6cTSg6rDiApXj2kO36H+ghhjT3WwRuWdqIlpWrZBf4NAROJ6SiTzOO+i29NO9X14ctnXy
	lO
X-Gm-Gg: AR+sD13vf8B/dGWFJXahtJ9prqSXFh6SnWuLuzVW/wTNvQPsWzTtBKiJ7Mo0Qeanmek
	EY0vWt8Nn5OF5yHonn+JlOxytAx+imPAd1SrG+GeCFYhe5NG0cw7f2q1gOILnKesN3Nar8hnFTb
	7Kt2VddXSmdKpD2ntN3tLLM+uV5P3kPZmLWXCR2J7usfK6GRbAr4zuKGY3N4tBwUEloJ7+snDKv
	+U8kivffmBd9u5YTXqQovGTDBa1N384EuyANEFjcDthLwIldi1YfWG7F+ifdm/zOMKyJKQir7O6
	OoDEYp7wskZIXvjPsltkBzNCXKkK/pzSD6ao8MwtBClJLxSzgsZ+1E5LlV+kSHd52jJs+k5Uv03
	Q1AIY/p8oupCd34ru6zknGU2hQ1NvXCa+psQbpu+tS4cwn5avDl2uRyOyARWkgTXiH6YxbNhlsB
	nQsTnhhiY1lJMxWK2MVO3e
X-Received: by 2002:a17:902:d584:b0:2c9:97a7:71b1 with SMTP id d9443c01a7336-2d015c99798mr75071795ad.44.1785320896340;
        Wed, 29 Jul 2026 03:28:16 -0700 (PDT)
X-Received: by 2002:a17:902:d584:b0:2c9:97a7:71b1 with SMTP id d9443c01a7336-2d015c99798mr75071485ad.44.1785320895892;
        Wed, 29 Jul 2026 03:28:15 -0700 (PDT)
Received: from [10.190.200.29] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a18abasm9257345ad.5.2026.07.29.03.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:28:15 -0700 (PDT)
Message-ID: <e861a5b4-38a3-4f39-932e-558188b5438f@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 15:58:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260729-qcom-geni-se-armv7-v2-1-dd6dd1e112f4@oss.qualcomm.com>
 <24f7a6f4-e369-4e63-ac2c-055f159c4b7a@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <24f7a6f4-e369-4e63-ac2c-055f159c4b7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uK4zLT-3e4l_uPmGjsyAStyxFzN__Mw9
X-Authority-Analysis: v=2.4 cv=EME2FVZC c=1 sm=1 tr=0 ts=6a69d5c1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=tV_EcpEIayrKXZkcW-IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4NiBTYWx0ZWRfX0M5KaxX4efVw
 hohezpF6xHMVaOJfhB8cOvmhfwThf0UwuPcRzlgO+6oB/VU0eljxQG7FDA+mSs/5y9PjjnOnTQM
 tgBOE6lhzGgsoK+0xu3NJB1eVNowI+g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4NiBTYWx0ZWRfX8N+Ha4tyzobx
 ESFElzqzSPZ2UI5Mrtthxsemk4TGeS2BoBomlJlWiBmaY4Zgay4kxZ6SrCIscDqO8nfd2Vmz6XP
 4FZa8IOxYUucezYUlxql8QmqCJdkUSossGY8Ii8bkmY9ANJB9yFFsz5+kTzM2taXhDadJw9U98A
 k/7FH/ZQbT2dHj5rjrg8+W3kAO7Y0kO1xIMY88OHW7IBjH8mWm/JKKPHLJfyx3cltPVS8uCjAyH
 bby2JmOPXYEGjicNz7ApBMrrHDb1tRftMnw7Zu5b76oY+GmG9XsymOohgGd3o6nZYo03AXTI+Mg
 lKqjYaEbvIZXShytsNt+z+ercc1/3MhcKxGMKxzbsS2vSNBO8j8BoBLeGzIpcTbplCraXh6xpqT
 1jZzQJTOb0rT5BM0b2bX5ZJnDFWr7t2Lg+mjX+TW68dXVnCQWi4VLqyMqsIWAn9f84pwT4YTzEZ
 PiYFxnFTWnsP/S++YpA==
X-Proofpoint-ORIG-GUID: uK4zLT-3e4l_uPmGjsyAStyxFzN__Mw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290086


On 7/29/2026 3:30 PM, Krzysztof Kozlowski wrote:
> This gives me nothing:
> $ git grep kuno
>
> Are you sure you organized your patches correctly?
>
> Best regards,
> Krzysztof
Hi Krzysztof,

You're right — the Kuno support series isn't upstream yet.

I'm planning to upstream the Kuno support series shortly, and this
Kconfig fix is a prerequisite for it (without it, QCOM_GENI_SE — and
therefore the debug UART — is unselectable on 32-bit ARM).

What would you suggest — should I fold this fix into the Kuno
series as patch 1, or keep it standalone and let the kuno series
depend on it?

Thanks,
Hardeep Sharma

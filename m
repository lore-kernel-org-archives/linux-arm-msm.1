Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9854B1D10
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167981; cv=none; b=f6y07ACHTLszPZMPP9aNO2f1rvfg2TwlGiRlhrkWQVDdfylWNO1ZC2hF88rdCEnGJ47AuIgbNS8Sjwpby/sXg4IKgYoQXVTS8y0WX6KIVUTiA+dt89B0acMfObbpZUqM60yLO3wtJiTYMGARkrLh3+TJ1GRdzaBN0ly5FRtgnEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167981; c=relaxed/simple;
	bh=g73K1kFJKClIKuK+3AW4NuAPAHp5cYsn0gAPJiYJIgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hRWVDdfm4RoR1/ud6zoyx3TZ4qtTY9YyoJxwC8cR99mpWc45mQxuCz90hksWKvXuTuzBuJAO4tetsXFqR5eyr+Y5ZHyoe91Fwhy7YInCF7IClG4Wm0mLfjKAmMBpyOaujnarsBZB3bZo2AsH911dbXs3Yxag+qLYCyNQ4x/dSSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VmrVYs0T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jo4+x8WY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmrVYs0T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jo4+x8WY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbfok2638328
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3TBru2LjhWrK5UI6Nd5iQkiMg0zqz5wNpP02NfK9egk=; b=VmrVYs0TbJco0JQV
	7D1VASLt1avyVEu3F78DAt7pnsrW0yAs3VB7y27joLefvmGty36nkzNLzcYgFUgU
	Jv8wvNBL2HtyMeBJp3UyexiwmmvbenV+vdF0NUuQqgMeIuYEJDKeGH43LoEYz3I8
	8F26WoVZJwwFFVO8febfx3ijdwrmPoidtsZBftEb/EglLLtCc0rpJSLSzZ8r8fkv
	n1fyMHH2Nv+Ax5vSK2LyVXDTpC4zWo62jmzZUsJWhf+jLap48oywq8JTXZ+e3CaC
	OkhV08huoG4vqyP9AyX7OL8y/Sk3oiZXTbx62UxdtIKlKsQpe5CFcIK6EsfDr6VO
	vKmrAQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqhmcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:52:59 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7a57ef025a3so56659137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 05:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790167978; x=1790772778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TBru2LjhWrK5UI6Nd5iQkiMg0zqz5wNpP02NfK9egk=;
        b=Jo4+x8WYcn8Ev3PaNnZ4hvaKVPE9bYMNLYrlZUxf7vjlAR7OdG+Q8+usJxG5lKtJoS
         uY6edCMFMWZDu9zvJfwrgm5nzvca1RpKXO7xdUyWqnsdW6mex3qb+tJZJmszjp2DwkNq
         cUklF5cYYO8iltQl8jAr3a/Q02PeUmb4eQpSLb2ENGZ58ZYKq6iRS07pFW3nEszvyfKZ
         UKY0P35nxO/hk6B8vNm8ZcfyvoT6lDMhDPeEaf79/T8CEpz0N8H/pw0k4OJGI59tiBLZ
         2IhrdteIQXiFeJYQanNCXXNIUdJLKa+cDB9+GtUx7Q/0w2nkP37QsaN/jK79WPUqh7eO
         DxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167978; x=1790772778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TBru2LjhWrK5UI6Nd5iQkiMg0zqz5wNpP02NfK9egk=;
        b=fd4qWaTmlOecj0UhCI97754xcQerSmu4USfXhgdIneps47OgRrTlJIXXUxyPYY+7yZ
         urZw4/F3HLdJEWYa1r0yhGplVCgJw3rVEewVwwELEXYmF1T/C8hrPnyBM1PLyUPPkIaT
         pSDteRQv8zwjQa2ZvS56oYZ0R35re08Cb0x/AYQGjpnATb9IyJr1FwGGfboRG/vsHOgk
         UKiP4yGFBkNclLa0CZYXTT4MtTezQenR2pvOqw5IxAA1hE14R/Y8YLYp3Ulo0tBR7tug
         YfvDivbHMSF3s3GJoExpiLGR+0wxvJC069xGyYrRBvABL6Of/H8kEUmd9uSshpUO2iJr
         mL8g==
X-Gm-Message-State: AFuF++nHMCKUu8R7QJmAu49MynIKrAPISFqegBbOJ6PHDP8+x8jKPCLk
	fxSq5nHzW7tYdnNYnGiVWNdcbJlrzMH+GYmGwDiuxxgEU7s+aAoEkFHcjaj/DboR7ctLmUUsM+Z
	Yk2Mm9MUhZUO0WzVk8HQpua5v2iVNZeMtqPIML3z/kLfUQpiodfkABlc+pTnqMzTF1Sll
X-Gm-Gg: AYBFou018dlCDJN+5WjyoMfJXw7x7GW+bVUhOri33FifMi0wkt0BkSpI2yFw6rmsUaa
	6BMnf/ok55KjR7kQhZhkrQmYJ0zKDYUcx/mF6siw4s/tAQ58GYuEjeAcc07fbuq9DM+ufiz6aLK
	+nDHfsLsFbpZn19lCGPEFjA5BCu0woiJAOgl+JIgaUY8B9EXUigGMdKMQYe0V8eyJ+HbSzeNlFo
	BfAKz20hEdWucE10x/vMxeyPR8sbYPE/EnS/xeJzwYUAy9OSbAhIbvuRSj4YwsAHuzNGrindZt5
	+KZZ/TAaODG9dGQwev8MDVnlxPyKUOfTsOYnn8VGgwaHV36hpdQZL1MoO6K9Z7w9fRqBTxEC95q
	EJJTmwm0yAATjM0iG7LC6qVoR9kYmEaZy
X-Received: by 2002:a05:6102:508b:b0:7ae:544d:b36c with SMTP id ada2fe7eead31-7ae544dcb9bmr399730137.3.1790167978554;
        Wed, 23 Sep 2026 05:52:58 -0700 (PDT)
X-Received: by 2002:a05:6102:508b:b0:7ae:544d:b36c with SMTP id ada2fe7eead31-7ae544dcb9bmr399717137.3.1790167978161;
        Wed, 23 Sep 2026 05:52:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6da6acsm110013666b.59.2026.09.23.05.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:52:57 -0700 (PDT)
Message-ID: <6f07518b-1917-4560-9b62-ca21e8eb56f1@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:52:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: eliza-cqs-evk: Move sound card
 support to Eliza EVK generic
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
 <20260915-dts-qcom-eliza-add-ufs-variant-v2-2-86d72a2a8f47@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-eliza-add-ufs-variant-v2-2-86d72a2a8f47@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 44ExuQ6W6gETb8ucjhrFgHJGH4QCKD5p
X-Proofpoint-ORIG-GUID: 44ExuQ6W6gETb8ucjhrFgHJGH4QCKD5p
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3cbab cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RULibRgnv89dH67Rq6kA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX38x8RFZ8+pdo
 1bprcvXqEep9s19raXp5im44pB3Mu1YjRUxEEujyM1i2VedwNMm7ppgX8m3ZQFFl1ozl3RfGr+m
 CuhK83n8tD4yeEOlb8DNftNaTDHm3WY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX4Uo7V86JJ9bf
 hcyFiArVnQA5f6O2ktQjTqrQMrb9oh7sUXvKxGmAPh3BYvz9cG9y1D+uIFRe4/zLuZUu0TTP1E+
 XYhVsMK+91yP+GoJIGzSUim1DrQp9ugd/sTQOypeL0ZrgxYk7BJS3t3Dqcry45brE8OP4LFHGid
 cWkl6DWaOLZ8ba5euzOVOuc7qP7DAgAfVDBwF1QpVNXLO6yq8yibDFsP5TIptskAqLUl6yOsBRY
 aRnKNnIFpuyyZ5x8bddM9aCb2acSHcPcIGKUhdOJ8O72rU73ad+2OVpNuUEOhU6ODm/HJTYpenF
 U2Dyjbw+4+MdOvUkh6jtLFdA71IZvuinlILapthvmqJTQimGzOm3M4lcl5Z1xrMjqfCJ6RDRH6U
 cU6PpbqvNESHnQR9fUCspb7dycqya/cWfTLAgsYFq8rmI/kUSztr840d6SkNxNNFS8PJQ8ThkTF
 2vpe5GbYPQkeaEKPkWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230051

On 9/15/26 2:03 PM, Abel Vesa wrote:
> The sound card support is the same across all variants of the Eliza
> EVK. That means we can reuse it even for Eliza CQM EVK later.
> 
> So move the sound related nodes from Eliza CQS EVK to Eliza EVK generic
> implementation.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

the soundcard model part could be moved to the board dt if
necessary

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

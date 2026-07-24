Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D4B38A29A
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881157; cv=none; b=o6fgIDDj1GhovASgB2utU2I1WS8zg9OVoAchI65vVo862sLMGDqIia96U4oKnak2cEIy9OSp51OYKJGNZ8LA+Mt8L4xnPYSvh9rC67QEffG598gvAUtBWtE87q+ol4kkonwvdl6UOdjeChT/z/kLbzG3AE8OO+4rAOqDD+gJEU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881157; c=relaxed/simple;
	bh=nELjpqWoI93YcqsYxu7mwnYQndQk6TwGgVXH7OUR//A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=M09rLUrW8nL7c4dW9H8WrhPpDwV3eHjRwl8O/OM/ZgdGpNSO8TnbUPk1Zf7QYFZk3LWP/jTxdG46YRxFJ5sBG1QMX5m9s7wU0j5I+QfNmaQ3VY8vSRqzm5SdV9z2pQPxu0BieaDcWs0vh/ZJf3O3YwgpY0rHgjEBgusI3TeTv2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KcMtiDPR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CO28DOd2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KcMtiDPR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CO28DOd2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4soD21897557
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d5hAZ8RNm+jR2e7QCmc6v+/wNwvrdwBN8Xl4r/Hc6iA=; b=KcMtiDPR+WFMKx93
	jleerMmt84p6aTcAMH7CdC9E2uLk9q5cQ25hgSUW9NrhQDiUtiWaT0d6kfXkoUpk
	A7Qb761AkFHnPwYB0ZF5HedGYMyuBg8OLe6i+ymu7UcMI023m+O3CvqYtNX/N+8g
	JAAWcCPhd7ZnT75t9J3rsLvjfGm5GtD8x4V700/tnyUW0xi7uIlW1Bk1PfjzVpfl
	Z9aZtB9nCTyBgcmiU/GOXn52ZQ/bm4VRZ5uxGxYEZD0Mk9vmjet8Os3olRBg6iZS
	hxxBdNdsMb3ZOwoIfat/Hs57Z8MpW2K0KXUJF8VLDzN2hEdAgDvnvk7KGALPnFPi
	LMP9CA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm1em8pg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:19:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ebb599e528so294086d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 01:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784881148; x=1785485948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5hAZ8RNm+jR2e7QCmc6v+/wNwvrdwBN8Xl4r/Hc6iA=;
        b=CO28DOd2yki8V1LEnkBFoyOi0U6tVW8EdzOM7ln5JeV1ro4/pDyuf15W/oN72ufkNk
         88ljx73Eh1avvJ4AVbd7mWPo/xv+rEs7RbapPJqI+uhnqqhG4O+aUuawW1lk+EYXrpuo
         Q+WK8Ev8cbVFEZwN88UZX6OwYhKfJbtT/26NfnIP72MfReOr563tkNoS1ySjdQKNvWyO
         7mTiZNIzWOZBEn5mZvYRKhf3BK6zrrV5EsRMbFOxzo+ZFPlVrbKCN+9aTLavBr6G4Q5A
         SUszRzIOKC6dOwJPOdWsk+9jF8a+NlgSPynuICVBHPMLTN4alw7TTHwAzHBtsU9cysaG
         1pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784881148; x=1785485948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d5hAZ8RNm+jR2e7QCmc6v+/wNwvrdwBN8Xl4r/Hc6iA=;
        b=WqufO6L96geugVjWB5MoAXI7nDPkpQ2ajZjdQTdeOZZ75i6cJYiqxd1auIPH3ZMMeV
         mvPr0/fDR3JofdsXHVBHM+y+a6HHHOWEoxMxPIWU+ys0+dguUk55ikQAN1dBkaUtleRU
         IeqgCPuzGIkM0WXRFBzPjx2Fy29wwASwwcN2WQ0VKwmjwtOTd1A2S+OoJmAqS93XyOSs
         E5lyX0qsRu7JFikLRl18fdjCg1uX3g4uOs7i1qwkGRy+BpaDMRGXCSSRO0t20Dg/UI9i
         VzoHrj38lNKjJFJ5os1Vyq8mXwm7nNbJDPFvzUWY/ixNiX7xdLKRUcAIYqSzDuJhHGyL
         TkPA==
X-Forwarded-Encrypted: i=1; AHgh+RprdLjIjRqrHOnbAfKLtYMVkVhykH+BXTmcfT8qYHWQklzCaL20Bvlafa8JVPxwRThU0GjfxqqYiAbeXmIe@vger.kernel.org
X-Gm-Message-State: AOJu0YxCJokUpev84A371GMDBJrYFfPq6yC55pcmrFly/YfexbwdkL5q
	IBygxBA2LmTts6HWvAX6v9OKmMLTMC/EsG5XI136tIHW5R3InsNvzLSgYS+LWmNDAZCd1f0LKYu
	jA4msjZu4ds2vyexa09AwIi57vDEf3BgvUG2ejwoDnQMgxOJ9LqgTit/8JoVjAsVZIca3
X-Gm-Gg: AR+sD10yJMNXBNJIwBUQIiMEeoqX3lLVrxY6n3aLA+scsjkklksFstIJ3cL1RWAPY/c
	q0AdRtMsXfPTUZpWjX4oaNSn2ugUpUpyEPUTPjtPolnTmtLXF53x0ZLljJRupqoKKEwThJKyYaD
	XNwEe87y/v07RDTqHvThvHMBkPRFrigObr/6GH9kolhuUSupeGAF7HmvbVsm/lNNf2lDwo352qH
	NzbIEDlPmSf78uA0gdlVrQ04WCNL4aZdmIej+aPxpucVAkvLYfczBCBCXudbkDvrRzV/Xah7Gv+
	WUoTtbw7+t/n+uIqob/pZdwmoaZAfU7NAuY83jfVARrkvqNeHGw9zk+sjEf1OFnkeZJX+neDO9h
	s+LdN9YHJynyLC6a+NotDgarN
X-Received: by 2002:a05:620a:7181:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9315e3553e8mr207637685a.7.1784881148634;
        Fri, 24 Jul 2026 01:19:08 -0700 (PDT)
X-Received: by 2002:a05:620a:7181:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9315e3553e8mr207636185a.7.1784881148237;
        Fri, 24 Jul 2026 01:19:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f35025114sm2829815a12.24.2026.07.24.01.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 01:19:07 -0700 (PDT)
Message-ID: <e90546f8-6ae7-4199-92c4-5cc223dc6d26@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 10:19:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] arm64: dts: qcom: qcm6490-idp: Add IPA node
To: Pavan Kumar <pavan.m@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260724050846.3413161-1-pavan.m@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724050846.3413161-1-pavan.m@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3NCBTYWx0ZWRfX8bdc+cJRy78p
 5JCLQoQ23TI4EJYPMrAFLuvc+u8HfpypaW7+xddQM/bnFslDtO0rolk1eVlrHC0J/gQwhX9AsLL
 P7mqdhJtawt0Fs8t2skSRDH2KAVcgaA=
X-Authority-Analysis: v=2.4 cv=BIODalQG c=1 sm=1 tr=0 ts=6a631ffd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MdxDABNhWrtLJrUeo-oA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: wzRiVrTkY4rfHvz6hjqAuUNrJidsgJYo
X-Proofpoint-GUID: wzRiVrTkY4rfHvz6hjqAuUNrJidsgJYo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3NCBTYWx0ZWRfXxnf/HayaSp0A
 vzARK3hmcxOUbVaWXjJnw1xCzsXcJy/7ZSm2BOek/Of0GUhV1iHkb4EpyMLJJG0HDVngY/F6IMU
 QkJEfKZAs7k7Ycz0ajPKgHcauUqg57QyhFqmsvr+Ed1IC5z7st/P2uzi7bQY6JoDjd0KU8WIdoe
 Mo3QkcbeyiMKpNxS2gsQtvDRBaQNHKuxEsFC6ykQNrox+n7dz7PyyrAE4V7LzQ0a00gAsLTE0Q1
 HEN9wKyeXuFEIZJjS8cdiowVJLt3QDpUdiZTtoiYEJyZnr8FEt9DGZz3NcV11DO8pT1BXDkNpbh
 0DoIA8D49/DIVOslAr0T9h7/7tIXBorsk+Rw2JCrUxP4bIaSNq8H4eC7v/4OE+gksQR8RxBI+/u
 dFHnXk1AZOcwmS05Gz6HPWOMZ2YDRnentMBUegufKTtvKKDVXeMHRSaet1fpUqQKYy2hgs2SZcB
 11ZE1VymPmv8/j8WIFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240074

On 7/24/26 7:08 AM, Pavan Kumar wrote:
> Enable the IPA block and provide the firmware name
> required for firmware loading on qcm6490-idp.
> 
> Signed-off-by: Pavan Kumar <pavan.m@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

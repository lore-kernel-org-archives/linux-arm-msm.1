Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D2241A500
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319216; cv=none; b=ha3+c9RprgDraRtcApU816Fefbkq8HfRSsyTVvE2XZzLvwcRswv5drpM/SAFRjLq/onbV3pny83zW7EU4cIWWI0EePFOnaEtvcoNDup0Qr68FxI/liJgna9NTQbqJ92NXY9bNXXBoCdQFjAit9CiZDdeELFnvvLlTr1VCyfyIC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319216; c=relaxed/simple;
	bh=fjAkJP1QSQNHOLZJDopiiSpstANGhbdIkbSo62xAORI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+PJZku8GNLNTgnqtQce6T94T4LFQPyC/0bY5cX8tfg9gm3LsQ/A6JuPKIwNO4nRpanmEbt2yKkN/IIG1aLmbVRieAnknkPeBA+UK3qo6WlJHteov+4kvA533PCSczU4ldOhrLwCduGP0Nka/gKS3yE4XPhrTvxoCTx5wzhbMb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1E0DJ74; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ra9f09/6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1E0DJ74";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ra9f09/6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fXWE1054099
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wat7Prc0FVa2oiK67YAeJJbYMfWOgePMl7aVqPbJ8no=; b=H1E0DJ74ETWsZu8m
	4NylaD+FSoVBYyFIwG/1cH3UsyF0zvVQrARsZ1/2w7QkwSe7EcrEe+VN9VPflRSY
	KEjKJG0VT73evav7y1ZFZI/8GXo0aSgz7XOKGCrLO8HzLtd0sGsiyX8Akk5iVGcs
	ygIyh8yMYvRapvenzHcGYdps3NtKvYWAN1fs9YNXqAiy5qqRWeYUakCxCv3Etwfs
	L026y4BkepVhCKd8KoMjeTc8/tnRCe3TmnULORlKhIkoDntUnVKfM8kRKExLuqDX
	pjAZpWpHHwKddB+88HJ9H8XL1WbUqSOz2jEedvwizNqVTgCaIty8ZNBV1x+Aamjh
	1mYZFQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqa301c7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:00:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5283df62d68so8177801cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 03:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785319213; x=1785924013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wat7Prc0FVa2oiK67YAeJJbYMfWOgePMl7aVqPbJ8no=;
        b=Ra9f09/6eWBrseTxVCTxUBsPVVnpIwirLuZZJdQW2KP8+ePBJbN87gkZ29EUYril60
         QJ//CcfNUkDWIkuG/BwKB3DhjwR1IchjvEACOY4Hk0/ui8d0RLm51FiLPcdxVPluG7c/
         qlJMOwQrNgyWXJ1e2+5RKZwFuL19cKXOuvW3l2XYD5vKbkd4UGbb2s3ZGzZ852we6FTU
         mL9KpxFeClRlo9BO5+v54oZhT8DzyvMAdNI2LY1s8kOlHpINB+jmz+xBJ1kiAxHYp19L
         FVWGGe6ggJoHLoku9oY26HBYAuIrA1kUagnkLexyD3Uw2ulf6hnS9WIsWGYCoNOdmQu3
         dHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785319213; x=1785924013;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wat7Prc0FVa2oiK67YAeJJbYMfWOgePMl7aVqPbJ8no=;
        b=haaYeeN3kZKfkNGnhoSBnLnAam8y3pii+dk3WMMecCcN8H3bk3QguqiHRTkwsrv7Ye
         FV3WwViax4PMjgtxvooYnKkSgGatEJlWwsfvK8U+py5zb8j8oxo5tkY2k8iUHGx2ERMZ
         kZacGsgCq9PZ6Z11pygil1UtmEG+98UPAyH6LiuXYEaI/yrVpQSVOe3pHcTcKDYr3x4w
         pmz94NNJdI+OOXYL73gp0+4wyjhFpx4LLDW8GLPirHhY1NdO58k4Awe+sEv3//PZyLoq
         l+nO4vjPtw8dc6KsCgH4pmwhYG9AVy8N46RaovgKgvCpSLUy/ZpRV7O83YaC+4PRWt+D
         ERBQ==
X-Forwarded-Encrypted: i=1; AHgh+RolRLC/DUFOpEmoebyH34GDyNpxOtodJFzToQ1XM27Ao6b49/G44tNhSSKpl/bI7Vx3UwILkLC737HpnC53@vger.kernel.org
X-Gm-Message-State: AOJu0YyvYsKde0W2iuvlhzuzzEdncMcF9oAtmG8TfSKurwGTBaWl03oD
	vGxXzpcbMTB3zEDaCpYhFJjlGKB4mNyB703L6u1b4OyDRyCJ2TpJ/NWjxWdxQD120BG8vQGyH23
	pmyeeQ/m4PneCBXmOR5T+/WFa98Otrb5Kg3QZq4w4QMFLArDxWHlwAU3snmOYZ3sWUCTm
X-Gm-Gg: AR+sD11IvM5OjRVus2dVuAE+qzFasAoTFXj5UMEHUpczNIdyef5lNcGBxrcdBA7VYzf
	5KEodrQQ6mQgSuUN8N51E9ZdmubN6SIX18CmpD4yqxLCtrGwO3kKgwxhYaZXzwUXNjTrvmyQteZ
	T7rIwJDhUtLZcpmdKTQRtDo23mVn1Ac2SBTu/uKmBIIYEvi6adwRnBD/Hz0yL4ZobmrYrMhA3xo
	csfsBRsqSRR8GLEayioAbmM0Am+thOD/bHDI2+woM/4EzrysQRoBafcXEoIRxWMm/5aHqpzs4oG
	ra50huI5qRVCj6oM2jXrG754MSRpVyMv7r10tSW7Y8c37paGpV7XXqvJKlhr/5E+rtHQORwAIXi
	7wOyHivaERgBPsB0=
X-Received: by 2002:a05:622a:103:b0:51c:99b:d668 with SMTP id d75a77b69052e-529d70d6bc3mr55481961cf.49.1785319212807;
        Wed, 29 Jul 2026 03:00:12 -0700 (PDT)
X-Received: by 2002:a05:622a:103:b0:51c:99b:d668 with SMTP id d75a77b69052e-529d70d6bc3mr55481491cf.49.1785319212379;
        Wed, 29 Jul 2026 03:00:12 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4625161sm139548835e9.14.2026.07.29.03.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:00:11 -0700 (PDT)
Message-ID: <24f7a6f4-e369-4e63-ac2c-055f159c4b7a@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 12:00:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260729-qcom-geni-se-armv7-v2-1-dd6dd1e112f4@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260729-qcom-geni-se-armv7-v2-1-dd6dd1e112f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LWXxPpjS-lnS9_N9CMRbiPDibbSRAV0-
X-Authority-Analysis: v=2.4 cv=EME2FVZC c=1 sm=1 tr=0 ts=6a69cf2d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ZwD2t8GgK0TnaCQoTb8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4MSBTYWx0ZWRfX96/MEXyS3pr5
 lbjNJKz6m5V6Eeofbhn4cjJ26N535mi7w6O21C0X0y5cr2xax1ipshDNefxwwQTJ2q6mNEgMCkP
 9XXX1q8wFmjRu1+We5osewGL3tHKfAs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4MSBTYWx0ZWRfX9N9U/MiMaCsU
 xpPPC4UoKnLpRqioNfyDUQSowCnPcCkjOBcKV9VSp0D8b/qy/naOx9dC0sD+D+fLOAUP7YDHwGT
 mz4gDu7vajGV3ZsZBVFHdSNeC/9r72nSMfKmcdX3kg38Vs8if+o3T256PhlVzK+FMvqFtBkLHIo
 qjYDNcRhd1GQ9yyHpUb1Ek2lrPZ7wJvZaAn2yUN5PMtQudFct2aDA9jio1+ikyI5QS6PXQejgMh
 8jp4s9jr1nOXbxTU+lUnpXxoUIkZUUvwtcsyIfvaLCi+l8cFuoN6SvXLlJ4jHCaqCrZQTalbhhS
 0wpQXiJ4otY4h3oPiVtTXk6U0EZ92BeCwKFyfmklnoIxbnr7A6/EDVDoPXqqocmSvnPP7LdU3SR
 i/hDNqDfDhtdSYeP+V2RhszPT6udwKsC/xjsXz3Z1KDv7wT7ECgOCnuhQo20rp3ApJFvRtdUCO2
 PTXA7dSuFzEAYgKD1HQ==
X-Proofpoint-ORIG-GUID: LWXxPpjS-lnS9_N9CMRbiPDibbSRAV0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290081

On 29/07/2026 11:34, Hardeep Sharma wrote:
> Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
> assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
> hardware.
> 
> Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
> wrapper for its debug UART, so this assumption no longer holds.

This gives me nothing:
$ git grep kuno

Are you sure you organized your patches correctly?

Best regards,
Krzysztof

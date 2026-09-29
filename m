Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8208052D2D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690107; cv=none; b=GfY7ka9xor5ldVXOC+VQ9ya47jTgpblGVZwoEJHQR1AqlcykIe+NqEuJbpeQErn4dj7WdqGu327W/RaD837kOYG6BOmY/jA3LKn15XIxOwNpV9IkhIvTxY4fr76Qs3Zgx7naS3xpG9qmwQ20vsyjwQZfexxeQKYOC3kWTmENsHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690107; c=relaxed/simple;
	bh=E6VXpq+qZYhv8tNTG9AR+0gEd0oGtsHCFPhCgKyyYsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aj3SNu/plJ1UfccNiESUDNtL4lkBHd5xwZIupRnM5SOpCEH3Q5wzwmB8REWe9dyBTfPNnvrRV4lnCagMbnSoZwhzcO9NKw6BU+vVAzrObUBqDuF6DdO0Nal8lPXaV5dtZ1LG2ZJOtVtkJy7h9rtPHmrzAqzXqxNoq1v1zCsiCkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2X3ibjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XP0wovkA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2X3ibjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XP0wovkA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqkXt4151472
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBpZuxpAB/NHE21T+jwIIT0IiDN/7w0EffTqxQ3ZtAQ=; b=F2X3ibjpwHeKsvqR
	QnZpDC274JVHIHnuDE77d/hub77UkWSpJBxKivaemAs0oRjH4AHwkmZR5J2Yrx1N
	Q02efD1KBucNc7QMwPftugSkQ+MjpWIA4lL7/TZtk94QBKHSUC4BTaXaDKYpkfj8
	kly/ktqpcAehUdEoRU3AUlQVOOtoP9IskBv9KqbOYkwl5kkH6XNJ1LWvi+JfqPby
	4ANR7PqoC/wH2q1ZsvZyzO7YVuT/TEm1ghgwKTBwE3xJSknTICd6Cy8W5H9i8onU
	TQLO6jyLOY3/1MeYCjoJd11TF7lTr6A58UuvUOwkq1Iui5IXb8JvvBy9iIBZgh1q
	iIb4Hw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnccvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:55:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso89896185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790690103; x=1791294903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBpZuxpAB/NHE21T+jwIIT0IiDN/7w0EffTqxQ3ZtAQ=;
        b=XP0wovkAHwywF4w+5A6bn8nD88vzEYlHfaqAdxHxA2soCSXwggLRy3xWRQeT/+gLRm
         dcgKmQqtkqGb5f1n4wFvbtZq/DNTpubMJDVGCxbfmA0eTQbNNzve4oI/EDtYoS9lqYe5
         J12BMb19+2/Y8mMibM2ebE6xG+14IrGRkLhhpnCwNvARihoRzzaLaHvqpqNJHwlvHKLU
         u2upSKzRFMJBdRliTGqi9eBarTYpHWqynvBm81rJ11fci8FUVZ5MAwvpDFNItMmT38DT
         Mu0a+2TlON6RKnQGaSN8LHgXOM7KkLxjmnr6oyj+kazvTURX7QogzY/KlZpwfuIbYxvQ
         vZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690103; x=1791294903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBpZuxpAB/NHE21T+jwIIT0IiDN/7w0EffTqxQ3ZtAQ=;
        b=N8YMw8WtcwV9te8Hg+nwBCzafuV5jmfzN838/9eSTlFqWafyowPl+U/N2VUFt1l0xQ
         A9A1uDY0DmdsAvmAtxkcpJBbOp3jFPxBnl4G8AQrb8GVLv+tJSyFg6vPEzkZ+y3Bxsjs
         kt/mJQAQX1ykK4TuR+qBUz4+IU0Mor3EXcsN1UYUOwUnUahprz779L2reIjsUHk3ZRkW
         6LlMc22ECbfQzLWdEn/cex9Xlr8H1975VrAxbmmHp0NS+FmnYQMtjlj6aG9bzbdSXifW
         CuS9jyEy69ZFPI+H+GLvS7a1Gh/W8CdqI5fVeA8CBzAi6+jB9S92VlLYVysTQ1TDwzKR
         d3uw==
X-Gm-Message-State: AFuF++ljNd5wENAsgFsRuXKtv1ggJK6rx5R7uvSBGIuTlSBcaZ0Bqdpx
	a79GWTqcdber0j+A/eso6MykcS6o47hYHQ+xfbukDC3AzTMWmSa4tckhaXlj11B6j5dUT9Vktcx
	3d1SiEhjkBxfgYG4MHVhKJwqlTX0C7fnMQS5YAHZirGq6kYa2+jSdUUogJZ6zQcbmWEFM
X-Gm-Gg: AYBFou3mLUHTWNtAJWKGdphSxLsI/aFVjW1a3bd6EJHEeTpRi85xyfDGubiu9/P9R/R
	7p4pDdloYZ+OXwr7z4Umd42Ii+rFwTlTi1HHc/dh7ZRQq85GoEN8WZZ2mQs+WmKP2HqCr1ZCi2C
	S/7rtg+tCaedLv+S+7USFrv9VxHBS6bPCYxD6HKgo/SSnNRbzx58re1hOIyTBO1ex+u16SGD4Wo
	GhR1bvU5kIIlNNlYCGJcar/Jol5Z3EbmYZXRWwBWDI3ZfWsSMuTgLrDFGHHMp4rSgR5yWxcHRq5
	qRiRKOiT8uPif6XmmtgeAyNdQp5eoejRjOfJSdy3gDq+s63JQpp//aZntgnvOVkXkZv2qkj2b2/
	1soU0LQgUR1KgKV0WI7PG2A==
X-Received: by 2002:a05:620a:4503:b0:939:8148:1e3d with SMTP id af79cd13be357-93c43bd1bb0mr2533927985a.2.1790690103010;
        Tue, 29 Sep 2026 06:55:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4503:b0:939:8148:1e3d with SMTP id af79cd13be357-93c43bd1bb0mr2533924285a.2.1790690102568;
        Tue, 29 Sep 2026 06:55:02 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64c2fa412sm41413991fa.22.2026.09.29.06.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 06:55:01 -0700 (PDT)
Message-ID: <9a1e7a4c-3a9b-4233-ab4e-93a9878dfa34@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:54:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra-iqs-som: Correct PM8150 L10
 voltage range
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
References: <20260929-fix_l10_max-v2-1-2fccd87115e7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929-fix_l10_max-v2-1-2fccd87115e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 58OvJ2ivFs-TKuumL41GY3MLN9ZXJPK_
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abbc338 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=NkAsgdMbsgjDGuKY8CEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NSBTYWx0ZWRfX/ksL8hyolfnR
 GcokpcJ66dkIouKSNUbNNTbKcdDH8QVRKtX2TkNZzccqYsnWtsXkCSmojt/fOHw6HKof6BiHLIX
 ojy4WeyuJ12vEbse8Khz3R361NxKoo0qqOxbcCi34FdyaqehKb9GwecrGSN94R3rUvwz4/6jFVv
 3mxYcwCSat9asqwnyzFYL8+KpEy8MMgvUUIwF/z+S2gXLMUAD101D3Q9gvguVe5Ntl/s4iijWwo
 t3dpWpfH++EX8lNQ5Ku0qaTCBFKi1xCTkKKRh+YzZ36axmVy9rwCpf9RQOT/zx4Da6+8A/y2cgo
 2Q9xybL/LQdqPWE76yclTLexVFgcVRcUYRImI7l3vhGixCylKwPxgj8ilmRsjSWqcAPwWwidYvY
 xxweENhFuo5YzxA9p2KJY0wP/TWA/5LHyY6BNiwHSUjJdYz4DahuUbegvYmbyLkhMhvw1ViPG7R
 26uB569RGVBt6a1z4rA==
X-Proofpoint-GUID: 58OvJ2ivFs-TKuumL41GY3MLN9ZXJPK_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NSBTYWx0ZWRfX0WK4hmY/E+K4
 8PmN0Z4PZSNjp2tkTuuiU8ypnSBcsgliS9NTw5wk9h9tdkboVo4YluzAxLoXkvqQiHIKG6+eGjn
 rqHysg9Axvop10baSyOtKDvY9MxINYc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290055

On 9/29/26 10:35 AM, Rakesh Kota wrote:
> On Shikra IQS, the L10 rail supplies the SD card's VMMC. Its maximum
> voltage must be limited to 3.3 V because the derived VQMMC voltage on
> L2 supports up to approximately 3.3 V. Allowing VMMC to reach 3.544 V
> can drive VQMMC beyond its supported range, potentially causing SD
> bus bit errors and resulting in the voltage negotiation failure:
> 
> l2: unsupportable voltage range: 3500000-3296000uV
> 
> Reducing L10's maximum voltage to 3.3 V keeps both rails within their
> supported operating ranges.
> 
> Co-developed-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

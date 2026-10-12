Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2664908D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820277; cv=none; b=E1YUllNIbYs44mX2cvstF8u3hKgECvLreWdeDj9uNQ+40qBxylLhXUZFnzJBfr/kP8sNkUZupFpObzbZwjciEMKPaphqF2L8evtIVKVkV5VT6da+KGO8Jmkg+XOBV+nJuECDLjkzVIXmo/juhCGCXip+4Heq3yyaKgg/gkSya5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820277; c=relaxed/simple;
	bh=TpFiEWahAUmXhWwUwv8m3ObKJdXib6T1GyKvu7O4dHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pi9bErvM2MV9HdeKVIJytbfRwVgc+GDR5aWztNovSGQoJniKSej0tbY9sOGfFCrg46X5r9AeFydSlv3sG3DjNP886h3LUIUM56DsBMNQWNGHMeM6Emc4WOLAmqL/UiIX1HoJwUDVTDdZzS/+3MKL37Db91bLMtjpDGMnK2IEa9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gYXFXdCL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFzPkdcC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gYXFXdCL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFzPkdcC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFempE3782604
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jr24mde86SxLZlOcpFzA4cqha7URXRsTA0ve5aSUVtk=; b=gYXFXdCLmbv29x9q
	zdqLIy2xE9NXV0yGoq2NG0jeZmpD+is7h6dSz/xYR9TlY8NQ7zkFdrsOqcnS1uBV
	0U5Wbb4SiwhLOjasQSjVwtGZ6pYrEKAjgyX9El+Ul1OWOhuEs0zmjJSeXmukG7oq
	tP6hnjWyM36mXfulz8InCdaaVVZkyJlbViCHvOFiRKCdwJf6vCTXDUrgV8SxQmIo
	lFxYzM8CgyK2anCYJ//BYRmS3JuZOmm12EqNdVQ6SpNMnV5mNXbYh6QwaYjoRrGC
	VeN5Z/i1IfWmqg4vJ3XYjaryRZMq+Q3i9pgiIQWnjIBpkOSV9XtT4P1G6m+zKtPs
	FQzYnw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j5ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac58b24so12933885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820275; x=1792425075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jr24mde86SxLZlOcpFzA4cqha7URXRsTA0ve5aSUVtk=;
        b=DFzPkdcCjxrXxoSzCei36uk/zRK1sqcDIbSTnSLgwzc2acNljIS3BN33grA3heBE1p
         YKWs3lhuQ7DIubOu2EnTNugDxzcFJwoBgU8SqFvczTZACD9cr/wuH0hI5g/YIu2fzxrF
         Rf0O6a+sL/1WfEJrYh0Anwrxd3mZvi3Ozj5HbHFbCJmnP8X3rYihlQl7CmU4fP86VuCL
         CeVMneWHJ1m2ETfBpitl2Jml1jxvJBaPPbdeP1vBqw/9oU+MCN443kkdfoFi7IimSV9E
         WEcT5bsUFalLIq6sLIkx88o2R7qlaFFtx3lUFiRxxuM260VA62giaLtC7FJwHc/hI0Av
         Arbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820275; x=1792425075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jr24mde86SxLZlOcpFzA4cqha7URXRsTA0ve5aSUVtk=;
        b=umcUbWZ+rIKdePuGaD1Gi1tTiQe7+dP75j8EbPbAHBiQgL1wXZgtiGTltk3PWZKlie
         itgtH08lO4mH1l8mHzQfhBAASIg1y2Z0I9fOxSJn00Yim2DSqZu5NWkyOhMoShoQ+b9v
         b93PQQCi2469EgEC5wFSTUeRO8NmpDlVyMado7mlSfr5ihT52nV/gJ9eO+dm81dtHorE
         j1BTT7LSuZXTmnwD9RxR409t9qeQlik6THeBd/+pZFOfcwTXsq+s1oEGfcKOMj3l1LPW
         sPu/GI4d/7lMf4uxA9/y14derFCN9c2XKvGu2GjlPBMsbvG8jlxyLaw7QWSY46iBxyqK
         C9Jg==
X-Forwarded-Encrypted: i=1; AKwUvByQyRqqL5B3/G0gdY5+OWd7meoaIAAC1xmTQOFVn/YTnQBvMPUmJWCo0YZkIu7osf0ZlrdwnruM/+bVIsjp@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3/ejQy6aUU2y1ukGKaabvGnXM/vAraGwFVwzLIcmmhAu3A97l
	T+P3AODDhm4d40j3CG6cWmp/cz8PHFs0snYhRkORH7InYdkNapthXMOUBFTlsb9bMDszfFef3PZ
	2Va0BlaCiBaYof7FFXFFPlRFl/kaSRRyQZCruCp6iOUwcdbJ+YTRK5jH6DRf3nWxNlmnI
X-Gm-Gg: AYBFou27sDW56+7VGvJ6NWZdEtgxnM96XkKmSPQ39Fm/BHo11J1lx2TvpcmaAJ5L4cb
	RvnYLqNOtxk0PJRgeTCt9hs5E1N496CKUiuE6hiUApyxz4twDstBY3gaqPghA9TQSoKcHk93qtC
	8laYm76w2Z52FTUlNynr0QIDH6bo+O1aAginO5LgKgvTDYT+OWT6cSDjtlH4xpcOvoiktTPAekq
	4G2vzyfm7QlvFO6p2ROc46hPRoR9hvbYwdppbxW8E1XyHBcBCSUk2q3rEPtvlUaSXKtzEiLWAZU
	waPmKoPWSZcVNvLSgpWJIAE0z/AtmS1seRc8OnFJM40pIcJWwYgJHeWmcBiUtcq5RLx+9evos3A
	w0lm1hiuJr6NaSyCofsJE4A==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr1852566285a.3.1791820274756;
        Mon, 12 Oct 2026 08:51:14 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr1852562485a.3.1791820274344;
        Mon, 12 Oct 2026 08:51:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1b3387932sm2043906a12.12.2026.10.12.08.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:51:12 -0700 (PDT)
Message-ID: <efce358a-6279-4b9e-8328-6e704541095d@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:51:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 34/38] arm: dts: qcom: msm8974: Align closing brace
 properly
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <b5553955f03b7fc44d073451795b557668fe0a87.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b5553955f03b7fc44d073451795b557668fe0a87.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX6/O/FvUeqpUG
 pzSMPW7QtTOOTISwQy4w9kDJW052nCd2csZIBZiVQcqBP8q01lGRtuKOpmdfP78kx/onZ1XKTol
 eQ4DHTTsOJnEO8V03syfc/3F28BK02x7DG/xMYAAIChfEHzToPIEd29ykflYDdqgfHFomdpcXQm
 2W29kfPFKMVFTV3KytSiUi7HzvJPrIdKRQiqzrMr0oRYOQVJT+MKVMmKSOoVbdgVOZqBgYlSap1
 uaLjiQtmWq2t175TRw1Z76JYvHKFfiKgJZ+mFn8xfsQRJp1Uof91xRTMoAxPZmTBEB4XRjQDgY5
 wM7D4FYgbmUIYQ4hOXXcresikDlxgLdMnrDxklSsrR+Srq+TJN2ccMCdWoTZFgLKnYUV31MGFVD
 OfpGuBZfrfaDwc9oUCG4zmvGOOOtckAspnG+bPgo+aj+E+pkSiFBaYQAghq+xmQfEc+cPnS106K
 x3hW7aTyPIY7EL70Aqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX4Tf4WGUlE44M
 n0u4ss05u7x+amMr3bCQ3BiXaUoA84KPMJ8vz720wGCKZ9ZcW2SAKKtmBUqy5fP4gdfGEvvqOwe
 6LM08zyZPu4NBQkNlXl2X1RfcxlkFdY=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acd01f3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=K5Q5qJNcHL0jdGHZGqYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: 9cXCwg6JYrqh9rNy9asMC70XGXRh2fVc
X-Proofpoint-GUID: 9cXCwg6JYrqh9rNy9asMC70XGXRh2fVc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Closing brace of a node definition should be indented like subnode name.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

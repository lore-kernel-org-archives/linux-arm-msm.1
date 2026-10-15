Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAC04BEE58
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062029; cv=none; b=jgYfIkUtlhKUmfNFymX7bK9kmvQQb5vhry1WN99Di8RG9Yzv1HKZsIb8s45ArdPv+1XKMiHHVO7hLMwNbg1jIaJSH1KafrSbtm6X648hIPTxV24/42F5qDuS2ejl5nt1j7zNkxHE9HPHDJG4uUMilb6w+PUdmxTVewc54tHpCM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062029; c=relaxed/simple;
	bh=rBYJ+VBooPiZVjyoQritmIrBDC7txb3ZU8qUUwQjDyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oIVvWvRSFbJH1vrr42YkbidbLgi7LCyD1hTx/mjScAzEgbiHDldQcRk/UJtmpgH4sL3DR64RC2Z8XIlqd7hX8zarbcNm6UTzCKdzzw7Out+8aHNDWlrxUhPdCXMeLyAa7UA0QFVM2zhxiOP24uZUskwRwtljVJJE+rn9btaS4Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9HO6y/y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5oXgeAK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9HO6y/y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5oXgeAK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jT4H2809312
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2PoBbUGnti8pllKSaZNU3jmgFnOh5+/gt7g3sYXDcJk=; b=j9HO6y/ydwVkyQOZ
	K8H62hOQxCyXL01kFo4Cp+Ga69p5a/kYJYfitjkaFWM6nrwxHgR77RQ2mqAZ4ur8
	9MHoSRTgy/IviyWUUIAbw58xUl4vBiKIoaB7pxxzULpV4w3K2Q6NnWPXOXjkmMEv
	ZZdfFtaWmC3ptr5DJ74mB43KWQHAkf6leg3SA9moBzm97wbWFQ1+NxJmjHWnEdNB
	dfy1Vcn4qiuJNApNuURj7LrcAveB3fq3DpFL01kBeAr5QQS0AL4K/G7SwtISwoHh
	zvdaTiOLykLu1FWwkmIpJBLkz8w9r7Jt+ttmaYToZrThrYeMqlFg2H6C+SZkSgFa
	arFHzQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54t70r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:00:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so1704194a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 04:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792062024; x=1792666824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2PoBbUGnti8pllKSaZNU3jmgFnOh5+/gt7g3sYXDcJk=;
        b=W5oXgeAKPuWboxjvGh+NLz9BLz0M6NCqIgJnNRqTh6UvWTW22CN7j1FpNUHGe5j1ti
         Ylz0hU7S77E6tAW5Vv8EwQHeO6foQ3YEx39VdcSrIepR7i8VLEB9KVs6ln98uFzDEqBE
         LFAPh6iVY0p8ex6TvQZQi2UN1rbfrCCs8OlObFPqhk89uiOts+ghuaGX5i05TJxl7nrm
         7AosqAbNDwcZX7GVGIgWRP78cIFcgItN8G8+JjMRJh5bb64JDX9mUE3EOzKnE4uhEbkC
         OrBwHIMDOgPDk14zoCut8E+mGZEjdnOFX6Of4rq6UDIIfs1qt2+2eRfxwJCf2wXZ45JQ
         P1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062024; x=1792666824;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2PoBbUGnti8pllKSaZNU3jmgFnOh5+/gt7g3sYXDcJk=;
        b=Sw3ce6MBvfi7F5JnQnkqNctysSL4M4JYJWR0KC+vlDtw68NnpXfPFQAnY4q3RsGLVa
         zHIUPgYKhieOqrUGUhoakfMh5kxwqSrXh/FsqnfBZ1fpWmSPaytnYGZ6BMsFXlGSKsn1
         Gx66nooGeZrf/A7CaQvgAY4Zll/2wacpLRip4bOWiMVNLztyTvulcYH2CRB7+Nm0KRDX
         pWq8mn/svoZWZPYATUVj6afvOARa+HYQMBTWEA6e2lhmTxoGTvUyFuJ5SNHVZ+PdZFA7
         aWRhyMv1a/9Qf59TqK1dBKJGaQQ/eGjQ6u9Eo+AHr/YzFTQ0zYThRZfm5te4CR71p1As
         E3+w==
X-Gm-Message-State: AFq9FYJlUWM4Ppfd30y7MI/AQHVq0xdIv4+PrAZInFVFRLn8gZzj4Xn+
	0fiLPE7hb4QLCHHf7eWLfhnvtN2JEmhGdPPTNkOc7II58Iz8HMhbye+uTz8b2G7i4XnMqP4yr0L
	vpLhJSGZAZfJXoZQ9jAWC7tLOI4K9q/O5qMB8a/gLQq0rcDyzypj20/xvmIzdsu9Wz5Ls
X-Gm-Gg: AYBFou1tGLciu14fwayAWb4CcXqw81qtCXA/+xVTwk7bHDPEUvre03Xq677QFsS4FFL
	IKjXt/ky2fVIE1CZuQ8fP6aLyg37hS71dQChU6O4ZLo+N6rUtVwvBUfSbWX4GAt7kaefExHw/r9
	6GPL70odZXMsQPQdsDLnVscq+UfQTPMVC5/67ty1BfKLOlkDWFdnnYWXoO7EgeOmx0thAyvtryq
	RpgNcpJ0Y6jJsq1BiJlL5HYAiaP2qsd04c7H8J4lZNKDIgKycgWTdH4e2Fqab6/NHxqqiBA9+so
	avlAB1Zyuv2YlMeBgRaADcjfEBJd3b1FGr2ZEaUIGBNIEGGWoN7QRLmM1cAytHr4SqN8lxI1yAY
	MuZ9XY/4geLLPaRgZH9EKmAVDVe0=
X-Received: by 2002:a17:90b:1e41:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3ab3a9726admr16268702a91.56.1792062023478;
        Thu, 15 Oct 2026 04:00:23 -0700 (PDT)
X-Received: by 2002:a17:90b:1e41:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3ab3a9726admr16268644a91.56.1792062022861;
        Thu, 15 Oct 2026 04:00:22 -0700 (PDT)
Received: from [10.204.66.72] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a31aa8sm2134817a91.0.2026.10.15.04.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:00:22 -0700 (PDT)
Message-ID: <fe833dd6-0124-428f-95a4-bfc48c3a0dc7@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:30:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0b248 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hpE6E10lv6cxlDq8Q4MA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX9kL0wtsoFYnX
 QVkc9Z2U7UrZswhrLGij3IGvxHkJgBCqajrEi7i429qOGFDg5HTRmzAX5PTLXgV9fuLup9x9Q8N
 LjFINwkiidBD6bjNJp1RVRNmPkNUupI7GM9lqE57/I8fR7QxXnEZOFmcVGrqZYFwhVNCTazTHXd
 9Pup0/cP0hMu3Udz0tKli2lZUOsr0U01ZR6LjvaaOiwnpyOgkMHBTTRToY100B2XUDBvsiHH9EC
 YB7BP4IpSNfaGYuZjBQ+f4yCU4XRj1HwICVfwIMm0uFs7SP4oufqB9iSfYB2PkExQtgNnlyFIlr
 FQM550XgrBv50m3snopkAZVWxMjvcfVGlGbSfuC4Q4mN3BNFL1uf79vQXRol+tpEgh/X+BpTpH4
 LSetnCSjdk5adK8RJcS1TY93HDyr0YvGXmPY5GwpdpqJU3oYXNc38j6L454qNEPwWHZoWvFkODR
 8MC/QhzUxcIHFBT9oyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX5jDda3BwxuT/
 MMTxCke/0Jh4820X9PSLOZdeonQi73z8E3kb0nTRC34x/2LoGW5+U/KHf3Uf6nkq75o2lDagFMo
 NZ3vvCwy6ZgEv2vG618zbT07Bh+4Qcs=
X-Proofpoint-GUID: Da-m3Xo6YT4rpNYJ3lpuQZ9NC0gl0frO
X-Proofpoint-ORIG-GUID: Da-m3Xo6YT4rpNYJ3lpuQZ9NC0gl0frO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043



On 14-10-2026 16:02, Jishnu Prakash wrote:
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD

> ---
>  drivers/mfd/qcom-pm8008.c | 82 ++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 60 insertions(+), 22 deletions(-)
> 

-- 
Regards,
Nihal Kumar Gupta


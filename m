Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658581;
	b=elR+toNDMXwYBHe/305xxxNVMk2LEuaIzVqboQkJsPnFyldlduyrsJ/4zp1RlOZA/7RE
	 oyeUx/MPr78j0v0gWZpSANY2HWmch0iM0cMSEyFjN8P4V/yLcIVRLOO+dHIFA5cO6URb7
	 czlrQTLkXi+JDoM1oGTDX8NpoF0RxqIVNRLsUaA0m1GoFIcTxhX7cUOMeWCY8KQEeukvb
	 3AcEuntgKNh225lVRecr9D6abwfqdqqo6WjDIoZKV/GUcYqAhnAUneGWZxHaCYPfBCCf3
	 hb6qPkWopzZCNmE9TyUoU6ZhM7tOeGnxx3I5ydnS7oA26vjnuNePn27V2RAVFYfrewg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658581;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wq4BgAJOxS33r70ErOyo9pTWYNHSqnL5o2cT/KMQO28=;
	b=1gg+gJK+DF8e9nNh+iWQUSpz8NZTrsTxiU1f2CA0NxCEhNAmBCgAQEgTBdPzSRtn8fj5
	 PYYd1Vh9xFbNYSZgLuw/vhblgRc5EOfPHsle+YFFIVEOx3xQ/mC6u7LsZp0Khwi/MLTwb
	 4VTRd0sFshCVCICw0ycZn7173gTEQ7MSrLSh1byn2YIjJ7mu3Vlxwvs1JvitK9Lq1zLf+
	 Aio2vdj4u/AX7TcmHVoq3OmrCgpI8qJYqn2NwL8ZT4xefgk5hWVnEUwTgLCvkThkYwLfk
	 CWxZAVjK8/d7bru2ZnwhYC5InLHfyZ2dKol2ykN5uqRTCtX1ySbyHh1G4whiOOKWLWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UCSGe98M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ichuT6E2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627E0606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 627E0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UCSGe98M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ichuT6E2
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8BGNe3183120
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wq4BgAJOxS33r70ErOyo9pTWYNHSqnL5o2cT/KMQO28=; b=UCSGe98MnsUuyhDh
	cA4uW5rR5UfdQpzTvdb7KUu6cDh2Hmxp88qSgVTeaWnaG0yqed3z9VB2MdSfDRsq
	+yTRKUL2p5PDaPOe6cfSQdLfGCUTsJe0gbtZWp+/h3e7XTxmqc0SqFFnnHEcdmbF
	WXjgCfFgYoWxJr1covmyXjKMvaHEF6TXRbWgVuwAw3cgZMColKh8Qwff1DQjYX3q
	D+kMMoeSW5v2DBTAu/qdXd/JEJncGxt/vwCzQ1kft4K3PWj1gjPv6NH+PskCJMmZ
	6tZxgiyZK9/ttGnh05MPuQyBBjZ5D77xkVUsK5jyU80XDl7hk+a3CtCI0WKogg8E
	ods/jw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93asf0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:42:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad840053c7so1571289a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792658578; x=1793263378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wq4BgAJOxS33r70ErOyo9pTWYNHSqnL5o2cT/KMQO28=;
        b=ichuT6E2x4Tp4oysE2ZRo7yJe+flVEBM/gy+fGinn9yrQAhu0HqgzF2oEcmDpmWES/
         JC/sIp0BjR1/b8HSQZdFcn2cl9f2jDWmV8jDeF3PYWg2E8+F+9xSjTNw6WwTYtp9pAJL
         si/eVwYdS1v8qMw4agZznSe2AqNFa1cvjCn4MK9ZZvWU1Rs1nEQ0+X9RVQ8/1DzB562C
         a8i5hF/lG7WuCpAx+cQr/5iiIPTtaPJxy7VizD49JHkArLTvvK3QhBVJCRxGvg+W6hXI
         XxyhnNJc9+lTnqth51DYqckeHC6eZqTRWdqulpZwhbLrx7hhG/HA6QRGqSA9nTfU7bXj
         JfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658578; x=1793263378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wq4BgAJOxS33r70ErOyo9pTWYNHSqnL5o2cT/KMQO28=;
        b=k/v9G3L8zLoe/ipVfwls9dq41Es60LhhVHDIO7FMrY5QazN8OjOi8O/jBgpNvyY5nt
         YQjabfyKoZT8x5Kdd/JULNKPaLVm6BfhyWJ84fRRa6hyF7FEzFREfBpFR2O+yPtnDMOz
         30Z8j/WRXFu2kRrGhjS73hyTEGkx/ZR3E/UpwKnU54lR63NGUvvfXR06WWiN1Aduim7K
         h84WXCrt9+nFhEQOW9PLxEOJPP4pNS9DuMrNBouv8a8ojP3Anvq9LXgcn3Y0WlvrUhvK
         F/Hk/Wbpv7ojnq/pM5tah22MODvepRtoRQTeRIuSe1SbzJGS+ZqJL6yGw+VmUGPT+/L8
         oRvg==
X-Forwarded-Encrypted: i=1; AKwUvBxgSc6OXOJIFtO2vWND4DEe3Wn8uSN+M3mMwnM3HvwchV8wpMPCpSqHo8Ym8DT59dES0TynZ0MmgE71MHRv@vger.kernel.org
X-Gm-Message-State: AFq9FYKB1IKilWbpUHB7FP/q0eyw9dOlqMRgaLyQQoPIe+gejbPdlrDA
	gL2Y45WMMgv4OJ2j1pKSALbsFiYU/pLj5QpX64+NfFOnYr2cOpg1gxqx05ES330DiOZHWun/039
	h39r5iP4w7io3IGtATUELNzclQNk5b+o72aEdWukfKtYp44Jet6lT7bbg3BTdfZF6nT2r
X-Gm-Gg: AYBFou1wDk9wQN0ka7jr0v9vmrT7hGz3z3ajzNNZcmQlwVRqEgIzNqphpgGaF6xRqAb
	u3ETcDcxL7wpZMLiiqd1B1RjK0XRil5wpu81SeXICsDYY2OWXtI7gXasBksJvN85Um4W7K0XwrN
	mM4InEOdRR0qrPWOOWIxrH7aXRZoRJkc4FBx16KW+ln61EgvcjGe+YQPNM4LstAIGcZNbje0vju
	OQFgZe3kjCObR6Inv06541Tn3bOmPGJRorKleRcCKNfnJFHP6GOjcxlugGJsN/GXgQyVpm0weQo
	RInkrJTRYUU2Rgyd05cEi+dyksIPrGwtTaCvZ2cDjrLxigrjUNiObp4RHFXL5ovGScVNKo5xtuv
	YwxZ4afUv6oeC2IbwbWBajMwj5PH4
X-Received: by 2002:a17:90b:4410:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3ad86e97863mr3524475a91.18.1792658578392;
        Thu, 22 Oct 2026 01:42:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4410:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3ad86e97863mr3524466a91.18.1792658577942;
        Thu, 22 Oct 2026 01:42:57 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada47f8ff1sm3380433a91.0.2026.10.22.01.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:42:57 -0700 (PDT)
Message-ID: <6f7aa923-e67b-4bd5-bf8b-085623d094c8@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:12:50 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] regulator: qcom-pm8008: Add PM8010 mode support
To: Guru Das Srinagesh <linux@gurudas.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura
 <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta
 <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa
 <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
 <atXJp5ct5jANeo0T@gurudas.dev>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <atXJp5ct5jANeo0T@gurudas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfXypY8bPltAfa/
 L36Z/tYywyL7msJRxcAxADNRUXIfVENjuBBdSSsRT2osaTDlgeY1vrT9MYOlhAs4vgCe84f1Rxp
 yZkzhwiPN1qXBSRntVnJGWwHTGxzL+HXRxpnelQb4rIF1OXyzCEpgm4MDuNhWOqSBV7ERyCT+Pt
 davssVDALZH+kwBohHKaUSgNAGMpDgv0uMHYMYlNiBjaNMs6huCZ+5+ChD4ee1xUuThHJ2j1rLf
 KV4gbDrk78YCnt8ku2lMVItOQdP71L/vGUqbT3qz0nfbtC+q6jecZDuOlDFH+GTJDzOY7IpkM8+
 m4e7yaqnVUhlYKHKFlir3ojId9iSoZO8izlacDQfHnw1sf1sOM+oDLRUki2nbeM8q9seIJsrzO/
 SS4VvUsqurBkghxEhMEzirJ5FW3BKAR+GQcZb+0sv+p1vqHhFHdvpXqoewOcUsFy1ae/ZjrGTM5
 9v7q5UYM+3cruwL6Yzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX/Kp0nlouxGoc
 TjsmXHyYJnaPui9a1LX1do3h81DbfBa1V036m/Em733VoV6dNilP8Ej/ilktnw1xPWpBILaDxZz
 apzPHY/rUXU3rbPePX1uhzm36T1Mjjg=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9cc93 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8zo3re30kI2txGzbV-0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: fM1lqDRvtLVzdiFB_KDJ9-A784MSlM1A
X-Proofpoint-ORIG-GUID: fM1lqDRvtLVzdiFB_KDJ9-A784MSlM1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220034

Hi Guru,

On 10/19/2026 1:11 PM, Guru Das Srinagesh wrote:
> On Wed, Oct 14, 2026 at 04:02:00PM +0530, Jishnu Prakash wrote:
>> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>>
>> Implement set_mode/get_mode support for PM8010 LDOs using the mode
>> control and status registers to allow clients to vote for LDO modes.
>> Mode voting is not supported in the PM8008 LDOs.
>>
>> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  drivers/regulator/qcom-pm8008-regulator.c | 75 ++++++++++++++++++++++++++++++-
>>  1 file changed, 74 insertions(+), 1 deletion(-)
> 
> ...
> 
> Patches 2 and 3 both say "Add PM8010 mode support" in their subject lines and edit
> the same file. Could they either be squashed into one commit or have their subject
> lines amended appropriately to better reflect the changes they are making?
> 

The difference is just one word, patch 2's subject is "Add PM8010 support".

To distinguish them, I'll update patch 3's subject to "Add mode voting support
for PM8010", I hope this is fine.

> Also, patch 3 uses the wrong subject prefix "qcom-pm8008" when git log on the
> regulator driver reveals the convention is to use "pm8008".

I'll fix this in the next patch version.

Thanks,
Jishnu

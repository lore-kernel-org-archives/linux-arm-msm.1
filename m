Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F56353A82
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 16:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773288; cv=none; b=IFum0CAZdsGXWQsHMajq5mJLsuSvJnzlUcmisfZQ7kKCgeyDRsSf25iiNIDKEgoRJTswWcezI+ah/gTXyFkw/rHGyu+zRybj2TAGUECFFVQ4mzld0ChUKJ35ES+DWmdMKUP6cDPB3VX+raldLaYcJkqDl6Ve7AWFVe21LZCjxJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773288; c=relaxed/simple;
	bh=csla06snuN9VjkN1hGeLOQVUZAqgoCg5t5mWgUC8ARk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hjhp60jWJpJf3DSJq+GeIsBQUiR7ZLI/dYKpYjaNEFtLXcfjHhpUe4eeB2YSShJZ6HXHA4oyTt6pbQwR5dsxxhHnFq2TIpFYh/rjOD+u+esPSPRTmy5lkp0eYnau5Ilb6LjW/gAfP4hIxw9ZkY1a009e1Tw3WfRgpSbuEmCFvsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ktXqH+A2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbZNxYRz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ktXqH+A2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WbZNxYRz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673EBx771133450
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 16:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9I3A374JuaCOS61XrBrM+DV+XqclJ2wjoW+D2U6kWM=; b=ktXqH+A2KwHFkyPk
	zzZPFYHjy7B7r4UTAdealdFTid1pJ7wPECDQd2IaERgYVHPCRzTlkKlf0dOQZ1si
	QNkS18H/h8XWVVKRWE/V8WRd99n5/T3IJQ7mbRvCYuO6T+avEYkjl0KAulEe6XD9
	CWoMIYEy9FmTiL8twRAUlnezxlP5gpmxbcm0FQtOQV46HP3CH/lwDerCQVVCYY5L
	s1VuBd6RmBa45Lc/zs3GoyI/Ssqnyb60kpX5+OQKofX5pTl8o151olwRd83iiwcJ
	sdLLdSUA2LJfXkQ+3mFfQM71fw4dwmgFk4br89tpQV1ZaVg3LWlNjXp1kG89us8X
	Ly/4/Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnj7aekw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 16:08:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so6260051a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 09:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785773281; x=1786378081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9I3A374JuaCOS61XrBrM+DV+XqclJ2wjoW+D2U6kWM=;
        b=WbZNxYRzGQe/nJ5mIzMkbVU83PYP92AVVzR3rVRIuEVdpKXsClF1ybeaFGMaRrnTB9
         lprk+yyBPrJr5YqFhlGGgJB4XA6L/mXKrWcNI/jzgGmjL7vkqP3bOxj8raYe6Kjp6Myd
         PVDozxm6QeYyYEBP93Ep+UkMajs0RWcNnDZXpj7fsMgy3K0Z4Wa1JTrtGOVscorpc9E8
         pqGpwdGFGLP1xeGzT7fDHk4dRk+csnvjNNeGhwgNeR3OH3R8Wsm5k51Amr8ADVWGk9I7
         hD2dCx7czjVY0Tg2tLFYZIqSgOqpPgnPewMKJ1hRfpllUSPWp8gg0iFqmRYFmL1I6bMB
         g9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773281; x=1786378081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9I3A374JuaCOS61XrBrM+DV+XqclJ2wjoW+D2U6kWM=;
        b=HIMCIyEY7hOVYu0+eITdlfsix1sqxCOvqa34SyPI59rx6h1On4HsLtRC/7Mf2qg7nm
         o/hMJnqtzmcd7tumPrGyYLNezYSp3kNUVQjix+5Cf5HqZSZ8oYG6Rv6ILJzFwAu21AGe
         PjZPx1qTH/vy1/BWDsa4eIX8tkQtkNXi875pzYEPPe4xX3evrXR/u+sEaDRpGWXsI/AP
         1TO/6Kw/JmOuC98XhAf0ljgU2tDdagt4ZHSscg9QG7SpN03KT6XEeB4Dxqg1BDAYmYke
         fPBUgz7pU0cM79Go9uh+pLXmWUUe5RxrP4iDtI6J3DeEeLh0CJ469+vJXHhkRmSeJqmn
         qAcQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkHrYQm4A+GRs87OD7bP5xgBU/+3oeCxFzOxwyFx4IjSEPTces2LPwfl0TjcxjnF++3o39okLjuFBibJC5@vger.kernel.org
X-Gm-Message-State: AOJu0YzILzBvADM2CkaHMOYxtJ+a/fYqP4TRkbBZGFk3UzzToqkCg2iu
	nXVtFT1ylhdBCGNVCwFZdY5etcTBYyONgwkTsIjXjy7+pQ0koO71TsZi5Rv63q+REGo7GEMLo32
	q5mxf1tNjMS3GQr7KuL2JJQ/DSdIEt+K+QY+Ko6wlu0aH56lr4OGbZOB/oXJi7eMrwFPa
X-Gm-Gg: AR+sD10mUiWqDS+rjsNBu9IgQZqsikwM4K/RK5ddp1s3qgKOkDJfAZnOQzkYxOyOFx+
	xQPxlH/2zrMHHGEoCjQ3cszfuAaW0BIYlk1ACt7pqiJ5cw+k0YHWNcxX+vSXbvuTa4UhOy5AKOM
	ggelGVY/di2f4pIf+eGSa+I9UgEkx8rkon/Rw1NaM9zMuda+viK79X9sWgBxzee17c04g7Rk/Wi
	e0EO0F1ZZ1aAu8iR1DpI9gkrZ5iSyxJtFrwXc9XGkIxpUUvU+jqNXPpGNOGMVPCBmb/FctMHWVv
	EQnP5RyCmcsO/4CudFjQFBWrocLGEIo/FM6yYl8DpWov4v4yaDnTotk1N/5r16JR/sZWL+3I6ZB
	12T0Z3sXa6Dflc4mZS58Ry8eOvUALKs0lgQ==
X-Received: by 2002:a17:90b:3802:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-38fbc0b4707mr9724600a91.0.1785773281292;
        Mon, 03 Aug 2026 09:08:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3802:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-38fbc0b4707mr9724567a91.0.1785773280868;
        Mon, 03 Aug 2026 09:08:00 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab14475asm31387356c88.5.2026.08.03.09.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 09:08:00 -0700 (PDT)
Message-ID: <a8157d05-6196-4f7e-a900-f1f71b26a2c2@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 21:37:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
To: Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
 <20260801054610.4047089-4-prasad.kumpatla@oss.qualcomm.com>
 <20260803141033.GA3231247-robh@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260803141033.GA3231247-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: d-Wm3oyus8dmtjY7RZ0awraOCmsDiVES
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE0NCBTYWx0ZWRfX+8qJN0VauyCE
 yGP/EBi6wXPsRan19rbFsnSTSEFzCjoVlx0Y0K9bfIWTF3rSvAWWHF/QvU0Gv3i+qjMnaGwv5al
 ViAAHjLjzKHb4Vn0Mwy3V/M3Yx6qjycmaf9jfyqe80PpPTTdf9clm1h1/PZr+JlhrOCr+/IMs2I
 KkR3oXpD0BDlTvk5kt1iukDnNAy4c5u/YS15Oou43ClbVMkc04ft7qeeEvZZRiXbVC7HPSVNA4B
 AO6BRv10l+MylBwMNupCwLR5QV2eY5eOHnWMAAWBKptUwejZX6/bAxJgCA92NfHbd//iWxe6+JR
 /1nA+R0Li2Rg2/XWHZBF3jBfdXdhnZPleQBKb8Nio2IOpuIFL32E60wS5OGTesYX1+ffkllnioC
 KieZddUra/mmsfhvBtKewkXXf6uqi7akcgDCOkEoPw8AZ/Q3nnSM0q4dC2JuHbWGsfqqO+MI6Po
 fBUF0wLiSk/c3BuCLVg==
X-Proofpoint-GUID: d-Wm3oyus8dmtjY7RZ0awraOCmsDiVES
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a70bce2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Eipt-u1mmVIaEvtnkvUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE0NCBTYWx0ZWRfX1E9xOmnlc1MY
 QtuEr9PgDM2MmJgCmtSY+uFkJ6ZMTYW+x6yUTPuneEdGV75dAVIwvKYRDnby2ktnHrPu9A+QFhP
 Uyw7VtxISfb7JmJLOikyXn2vW4qGRY4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030144


On 8/3/2026 7:40 PM, Rob Herring wrote:
> On Sat, Aug 01, 2026 at 11:16:06AM +0530, Prasad Kumpatla wrote:
>> Add the LPASS Audio IF clock IDs used by newer backend interfaces.
>>
>> Platforms using Audio IF module backends request the interface bit
>> clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
>> header so these clocks can be referenced from device trees.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Missing krzk's ack and comment on the subject.
Hi Rob,

Thanks for catching this. I accidentally missed carrying forward 
Krzysztof's Ack/reviewed-by, as well as the review tags on patches 3, 4, 
and 5. I'll include them in the next revision. Thanks, Prasad

>
>> ---
>>   .../sound/qcom,q6dsp-lpass-ports.h            | 29 +++++++++++++++++++
>>   1 file changed, 29 insertions(+)

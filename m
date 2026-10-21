Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575139;
	b=kDf5p1lhVCWneZiZcb79ntdG199Y/ENaStKgo/7uoO+V5XLaf5EqYD7ifzrTdmy+fSbp
	 rsVkE2FL6ZkfWjVPVCDDCm5+eNISWaDp4a0tm0VgVQd55P8Nm4JMIeEJXiZmSwYEVvI1+
	 mxpYHE/3zssI4Mt3MGFpZTyCdpRVY8TfKnU1ZYvVW11yY3Id4f9uyvW4wxk+is8b3q9MV
	 QxNn6BI0R+6us6IV3mhb+Vxk8FRIwxoVBDb5LA4lsAhbnxbmn6RDolYCkMOy7rnh90PZ5
	 h8hJEyczYHYD+05WRpva95zY7h2xR6pZyVMX3VzT9Hr7G0Nmp3AprX2fai9RFkqV2xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cFg9LHbSRP2xPyhOEVaOFhnmGTmawMBOLfYiP7u6GyM=;
	b=cxm/m6Z4f6kk0X/AsOM2xwtbLmsRJYNpJ/oAvMD6SVsMsxOhlEiy3/8dVwXsLMmY8UEJ
	 i3T7/w/xWfbKKsxq2kzbpGkLbH3Xhrqy60fo3mf4DFvF14NXUbSBanrR+0xpd+djsZXeY
	 eBVJQXH7/1zqfap96xE4Sl13Nna7zSxl2wgDfEiHBilCSkH34haajRM9yYDK3q/VHH2aA
	 RFpPlwXw/DVjs0ATFveWbvb4Ht7ZDTZk0mR4HU3vvNLEKPmQwfWsM+NKD3BQ5mDai/RBT
	 d3LAE2YCUo259hQ20VyXjdLTEALrCJo8L58G4YPfoGra9tP7EBsFH48MsMQwU6taKRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfvHmY+V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HpMxf+Lq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F717606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F717606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfvHmY+V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HpMxf+Lq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j22M165261
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFg9LHbSRP2xPyhOEVaOFhnmGTmawMBOLfYiP7u6GyM=; b=KfvHmY+VjG7+Ghrq
	KYG/RKWC3DY3lCqndyYs427hg4rcmoIbOoM2aS7mwOQL1lySBWMJF9m5EDTDvL6j
	40GH4OHn+LaUzPyegfS6u31qkJJA4prMKnxTsz9J3V/9t+WXwkaShb5XcPDTFRwI
	+VuB80ezlOT0gyFYQiUFeDKJW7C/wwoGoopBtJ0ZPlv5a5jdi7qaU59JuPin9ak9
	4S87pCYH0TAjPsEhwer2YyezJC8dJ+tVJjhrFN5IV68j5wWe0tjsjRCxFB3IXg+V
	438xYp4/RP69yrZlrppcXdZM/8muif03IgJE20RkOyUpWzTGwipuLMZDTKhMoXbC
	4hTeOQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02fxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:32:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9178ba8eb30so1341546d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575137; x=1793179937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFg9LHbSRP2xPyhOEVaOFhnmGTmawMBOLfYiP7u6GyM=;
        b=HpMxf+Lq4aX7f3KOVJRsvYnl/sRrEelfK8ohaoUZLzdN3ixN+KXIaCc0WWA7WeBmJb
         8Y0tVAgWqNSYB8G8nE7UaqJ3PgzERnti8hGO2NPjtqWrHDe4Cuvcvzaid3f809JdOK7n
         h8SVB74DcF2Lw2W5gjhJ267GFaLl/vnaRq3/VxwDpe6a6l8YpBiXt9uAFq7tYPpYSpyR
         i+BkrOb9xyZbgrP1o/LeFFQMLuE+BGUNXL/Agn7LZbMmXXGNM2dbYVXUFUht1eiTYpGG
         Yv3n+fZJ6X0MLJRaaJkKnVZ1hW3IA7nLk5uD5rmSZqluaSHYAXhsUIsiYyUng1BaUH5m
         U3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575137; x=1793179937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFg9LHbSRP2xPyhOEVaOFhnmGTmawMBOLfYiP7u6GyM=;
        b=HED350bxaQJBPdKbi7xQlBRl7BEhRVnd7tKjZ5Rz/zxxaBFbqfTYz2fzwpAK0lUWJl
         MG7z+oH/PTejDtsVSYQFLOQ6x3IoofAO4thM4TgxNDjxj5E4nkQ8G/7GoMuIEOVN9rGJ
         6YTDTveAmD5tc2N/gr8ylTNzf+uL9Akh6+iaqSUnxyAlOtfYTIDUVRSm2tnrJZU2PTB6
         C/RzjFRVNYp36qTyWhvc3ze9bUVvQMpCd6tPdt7XFQhwqaw01AJz6xmf2PZj+gAgL8UX
         eHT6+RsjrJ99rCDHt2nk6WXr0guUz3LWpFCUkVRLb2NBJBNlCBrZc0rPbaT8RgI2mF7c
         GZGg==
X-Forwarded-Encrypted: i=1; AKwUvBzeyrtybRjdpBilgyhhuea/cM2B32NYbuvYBj/NBy2ISzLCFH7GYjHwm2gg73e81zw0P+YxjEgJKEWpiSmT@vger.kernel.org
X-Gm-Message-State: AFq9FYLmQWayykbUHOpf14Y6dHNScrriQVXxzIzAS8xZJr36Ino1y/4V
	Mw2hSlkJOgCRnqhDQfX9F0VaZR9VIyDGJCwIyoTsP6WVy+xIIq/wTZ78mKGJRp/ID36skpZJ//u
	8Y54M563DxQppS5E2Ck5Ioxv9fFFu5WkDIzAJs8cnGy2Va2GfqyCg+ech348c9HctTjyV
X-Gm-Gg: AYBFou0XhfkcyDre/d+99eRsd/H7pxypk/qBcoqYy00jDWvBH11vA3PMhS78mmKEF2B
	7fkv3JZU18HYt7+G4Cb51qxRBpps6NHESlCulPm/rsjZxi+xqQ4ddp/dBDt8IFuyNQngQvbLMfs
	QUB+1/1/VdIP6j06Mr3nMdkcDfZH0j3vejBYCX1GLlr8sRb+ejqh2B6fZapZuqu+InYJY8t+UAk
	oGrAIqk40YEqP+8RQEp46/X++SgFh/Z1X6C+lDjSgM7w2ngIwcdjSvPSDJJra9uBbUveMUadlqw
	eHfdx4YR5PNkDqlrXWZU+NgSANA7SSK2thTo/qXIW1w/sn/5ujuIrBO3CwxBu2FpDuyetec5wcJ
	cAyauYweOjQPiXgNQVey/2g==
X-Received: by 2002:a05:622a:e603:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-5369b813497mr17675491cf.5.1792575137480;
        Wed, 21 Oct 2026 02:32:17 -0700 (PDT)
X-Received: by 2002:a05:622a:e603:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-5369b813497mr17675371cf.5.1792575137058;
        Wed, 21 Oct 2026 02:32:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46790055a3sm58780166b.69.2026.10.21.02.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:32:16 -0700 (PDT)
Message-ID: <c7253a19-51d1-4525-91fd-0cc07a4640f7@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:32:12 +0200
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
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261016-pixel3-audio-v6-0-11c88448b3be@ixit.cz>
 <20261016-pixel3-audio-v6-1-11c88448b3be@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-pixel3-audio-v6-1-11c88448b3be@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad886a2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=d2f5cIJWjcLx9DfYaNwA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXxj/afg/NPP2n
 Qmbv+uii10wckt/fTDbDvvuEmx4zYdF5zER9qkeNvvS4d5aBjqiywZgtj+D2l8TZMQ+60uswUfW
 rUXbkADPmx9Bf1TetJ8yd+nQVxFALEzc3ww7bEBtvu9jlXk9LPzdjhHrL8K9voYBZXirCmNA+Ma
 ElOJjXD8zR07vMgP7mlbwJW7bHiJkMY6HXofifEKKH56fTKT1CGJpZgak+vJg81CSB378pG6vDQ
 YMaonvlZ5ZRsHez4faEiAfkAUpLm53HYEqnrVeFZBdrgfbiPiak+lF05kMLpuH9E3s98KFimqeN
 o5qZFqEKS/Jn/45yUw7bBzhGIS2XDqEfNtz9ZCOaUPobhhkcVZAEx2Eb2XYt1iCQ1ZyLFNcGtBG
 9uR4dVwkb/N7P4BoM5YMTAlOyNf5EdaOFbVcp9DJ66Qtq9Su/mBNYBD5/++pyKnrGzTkLMbuhC/
 FjJtJlhksVo6JjI3XAQ==
X-Proofpoint-ORIG-GUID: nIhAsHmmjq6ELy18y88oz0oj9dUBveIu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXzwfxleMT7/m6
 mvEBpJRjFVFLI5p1ie0c7u16/nbp9bLWZVRYCgFGjOrR5/JATxxscAZ+PrHbuxILA0zUkrCvA6i
 CWuCekDErAu3Tyv/3vfYSnLX9omVHIA=
X-Proofpoint-GUID: nIhAsHmmjq6ELy18y88oz0oj9dUBveIu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

On 10/16/26 11:52 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.
> 
> Inspired by commit from Joel Selvaraj.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

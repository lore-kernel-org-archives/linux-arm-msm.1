Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693370;
	b=noG/9/dnh2W6ouHrXVgm//z6O8QcR/Kn8viR7nzs6MLfV6GP+OhxiUjKbwFfvPRMA/Np
	 01QVkEZopqG/TauK01nCuB0mgqG8Yt/vwp/pbOqL8Z+0+QOLEWsK+X9KGY3uU6kCzrGOS
	 AwO3ZrWlc9WzTNRChHFTB3hFzUhQYdlfeqpsRblbMIA/STd2wdQ8lskGXaz2XFLMptJeH
	 2bttcbM51XL6UE7PKuhxGqSiZW70frZmrmXOzw1t+oUF+M+VgpkfNLjPHnJMRHguyEPzE
	 +MW7Zxj0OV+8IQ74nU+kDd75/M3kEoXy7K9YGol3Avh5vmnZMP/AM01L6zCDmhjuPHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=I6lL9Zj57dWgnPBSlKlRN2hREBCW1ZtICTCl8DOJjUM=;
	b=hKnc8UeqqubigYQ333/B56LCde9On+Fp3rSHjDj/3VXU4khRGQ+crBvqLvxt69niAWL8
	 WT0ZWR3bNTyUyF0zhAvvKkGk2OlmyTuHZpA9M5VGy4OUZyHrBQKRRFVrN72ftyXqJrUIo
	 F0HHVncyJQA81d+BrPcfUt4aJpQodK7OX/Mwlo7JwQwMaWxI5VEsq2o+YBSx7Hzr3gW0R
	 o9qP+Amv1NXz8iXrYgB3PyNWggODPZrbHYLxZsPVekO0eAsSwcHgqDGr2SYn/KBskeFlR
	 UHa0rApuSGMlCuwvZAnwuoJq1HASB11/2Gu5A4nogXKZIu2RIR2pBhAGPvcSdi7v87Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JkopCOUx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AP2AUQBE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECA1606A33B
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AECA1606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JkopCOUx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AP2AUQBE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVM4x3177347
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I6lL9Zj57dWgnPBSlKlRN2hREBCW1ZtICTCl8DOJjUM=; b=JkopCOUxbdpRd6DV
	7rVqG6keB47462GxSS2GwHEhhenOwpI0TwsmYUqc0DBkh2iVC2P19I+puolPoxcc
	EmvK9DUm1VMedzGfxx5Y1CDGfm+41Og5hYVDR8g88oKiWGIdbz33+6/fBDTqY9H4
	YngJED1cUuZy09nbl1pnORhdh9ns3hlBBXjoZXoeuV2eaidnUBaOihGdlk0FWns3
	eWAzotsImLvD7T4j3CIXdQAK6ZRLSLIzJkEZ20V+5jKxGJBx/KWKr75W4ltdkssS
	134RBORNoKBOUGtluzxwCQuNKgqgwdXZ6CqaSdvxUeE9F9CTt5pFTMb2VKcqHzXZ
	zbeOLA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662say8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:42:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55c4997063aso19481191cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693368; x=1796298168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6lL9Zj57dWgnPBSlKlRN2hREBCW1ZtICTCl8DOJjUM=;
        b=AP2AUQBE4Cq3VykfUvh7xtdqiNdeuUob/5hUFKbarKYEKBxlqExqEpBaslyZuTELJn
         28oqrYK6UnH2WJv+A1XvLRRlA94sS3zQDL75CO+X+B250Co8h0s1R6GZLBaYQi4iknna
         yK5pbFl/JmLx4fDmbDN/+LimIZPpXgoyUNiZkHL+xtY86hVKNZzdy9z4ThR7hlwxHfTb
         LBPlQKFdiLT6gjXHswD6MqhnlMSdWqT9s8Aw/o4YLSulS+fQGrkbMXujy3m5oBAu3Nfu
         qpHuTYxTfZgtFmBfGlKybV5CAOKeuXJnMGdpTjmKG98m0yhuUGxbXFH5ddXjuHm6nlGQ
         hTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693368; x=1796298168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6lL9Zj57dWgnPBSlKlRN2hREBCW1ZtICTCl8DOJjUM=;
        b=m/5pfYethYNCxqBc5hD1He5w9Oa+HvXxhu2s9ARTxMQMi+JQKoUDfju0EHXX2FRNde
         qYhWNm0+Z4r4bc1tDQzoLoqUjIGnvf57mPtZrrIfAXJTyz0H9IkYpcvOXbbDErlLaYka
         Ld6rBq1NUWViAcBRixVwgjI+c+uyakwiwWa7nqM5mHbJcovRo/0aOzoOITmQTeoZ7hwq
         xeuC6rI4pbYhYs8Ho+v0gokK/TYn930gnMdJ1rRamOP97lSBi+AmOLyyokQaXbYhpiWp
         XcjOvD5XKN1GIatOdbDNRlrz6C2IcsUbaIhyCwNOeZSDqTth8uvtzl4cNFS/knqpdjIs
         r0vA==
X-Gm-Message-State: APuU4Z+LMe7Ke52yBxQjcGRdD4Cc47HEjduV6mIczorUiM4P6XdZ5Dl4
	CbpW55gWmcpqLpJ31HPvJdo15Yz5wHs+M4VvuqshrFjzSPbliAgS4YjJgS99srHKsTIM9XY3IMm
	9QbiH74Zd2exzGEjKMUEQV5Fem+eA+aKOyEuJK8I/WwexZN/k492ohldYnXtVBH3C+Oue
X-Gm-Gg: AZFdTZeRNf53/UriYL+jeC3ucbf2E/ev/MvwHO0HoaetC5cwma9090gILmu/JszMutN
	VQwoHEulT3wxUEss6u2Iqq9VcQH5Y/upz3C6GDQkc60Lhx4u8xN5LKY1dwwb8XazBPrR56RY7md
	hT1FvYLGEkXjdbid275aenqwPI7K4K65OT+vcYSi0FJO3+uWHKis/FqCutSbTZUOA5mk592lmK4
	sdEqwmsZYuhDV22KfSdGkAx7u3HGgjV0RswBIvtwUjwXaHJJGJQxfe9y+MVQ5JVYrzXaVx0Hct0
	Bflw74+FY/TbuHCLNcuUvCxOa78PGuxXGX4roSmYcUsSTDZDDm4K63GO0ajZ8d7juq1owCn34oN
	59O0cVBEDPdx4z8DNvGgqQMtYjzuLYImGx+31euCLe1rV4ZosRi6hREOClQEdLMoDHTNK0yY=
X-Received: by 2002:a05:620a:6f8a:20b0:945:ede4:d247 with SMTP id af79cd13be357-949ba82824dmr3397656985a.1.1795693367686;
        Thu, 26 Nov 2026 03:42:47 -0800 (PST)
X-Received: by 2002:a05:620a:6f8a:20b0:945:ede4:d247 with SMTP id af79cd13be357-949ba82824dmr3397654085a.1.1795693367223;
        Thu, 26 Nov 2026 03:42:47 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8ce16sm738945466b.37.2026.11.26.03.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:42:46 -0800 (PST)
Message-ID: <5b3112f5-6b6e-4796-bb71-3ad92238bd33@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:42:44 +0100
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
Subject: Re: [PATCH 0/3] arm64: dts: qcom: agatti: EL2 overlay and QUP
 firmware for the Arduino UNO Q
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b081b38 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4WvWY9BfOHavVd4mqZkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: FKjtlmXftENu00OP4CacrAFdQeMx8sYD
X-Proofpoint-ORIG-GUID: FKjtlmXftENu00OP4CacrAFdQeMx8sYD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX2Uf5QtNR36I9
 tGn/3niqytrNcDea5dwIkXiIYxGDMHl0oqT+CXvwnryTSnFW4HEl3KojOnPAY9SglGoG2tEeC7X
 5MfRpiy8ho3ndO71Akg7Rbjt6p1nYlO/UfXJWRIm+/97l7+xtT9v84K/owqWpldXN7+6louW+3l
 Xh1RemhpWH+tupqcboDNEfb9nTCUbq1wmofF1pS31hJXagTgsMLbrMQISaHQsJYhhtK7Cs5Ymyp
 RxagdHvmLbVcF5oWT7EIpysce1O67uv1MWYA3ljhA0Qj6hnLxOgjs5X1l9QJMTe+9qjfy2bHMWL
 Fn5yeMYDebO9PS0Lqmk+BHEhAQFPeSFXMh46Se8AIkVQ8WmV4eV4KcDvQhUZYhxToIKXWz7FOKT
 nHxg783uzhfjpH8Qgv/tcn5UfkpQJFrZBREd4TaGg7T4+LBanyOgw7X+mkB+oQ6fYfmM7Y0xqsG
 3SfplV3AkzOE86eg+Tw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfXxfAHbeBP/41s
 JpzGpbQGCQD6jRdSC0uzRVTYtLQBfbq8YROgBAgWLfQjUD6lauNBszzmUbcOE4C8rHnvMDKtHdr
 hcchC6loi3oMU81dDV2QzVaTiGAsfjU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

On 11/26/26 12:36 PM, Igor Opaniuk wrote:
> The Arduino UNO Q (QRB2210) can boot an open firmware chain: TF-A and
> OP-TEE in place of QTEE, no hypervisor, so Linux runs at EL2. These
> three patches are the DT side that this chain needs and that does not
> belong in the base board file.
> 
> - Patch 1 names the GENI QUP firmware, so geni-se loads it when the
>   boot firmware has not. Where the engines are already programmed, as
>   with QTEE, the drivers do not read the property.
> - Patch 2 adds agatti-el2.dtso, following the existing -el2 overlays:
>   zap shader off, SMMU stream for the ADSP remoteproc.
> - Patch 3 adds the WLAN firmware's SMMU stream to the overlay, as
>   kodiak-el2.dtso has it.
> 
> Loading the QUP firmware on this SoC also needs the geni-se fix in [1].
> 
> Tested on the Arduino UNO Q with TF-A + OP-TEE, Linux at EL2: I2C, SPI
> and the Bluetooth UART probe, the GPU renders without a zap shader, the
> ADSP starts over PAS with no SMMU faults, and WiFi associates.
> 
> Patch 1 was also booted on the stock QTEE + Gunyah chain, with and
> without the property: the same serial engines probe and the same I2C
> devices answer in both cases.
> 
> dtbs_check (qrb2210-arduino-imola, qrb2210-arduino-imola-el2,
> qrb2210-rb1) is clean.
> 
> [1] https://lore.kernel.org/r/20261114-geni-minicore-v1-1-a825dd549664@oss.qualcomm.com
> 
> ---
> Igor Opaniuk (3):
>       arm64: dts: qcom: qrb2210-arduino-imola: name the QUP firmware
>       arm64: dts: qcom: agatti: add an EL2 overlay
>       arm64: dts: qcom: agatti-el2: map the WLAN firmware's SMMU stream

Don't fix the previous patch, squash 2 and 3 together

Konrad

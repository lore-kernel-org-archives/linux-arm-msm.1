Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABE3423E94
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 08:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399222; cv=none; b=dtDwYhg4xAPhgosLcddgs+D76kzOJaUzBvuWONBLBmpqO5m1+kpiCyProTsAf06YdDcveIMdeeMZqD8PWsU74ISyjbFL1aTROu+UkWpDhiaMTR4oLBVt3e7k2MuuK8Sdm0HGrBlDQvm3VeQsHtxtE+1dq2z+ch5KgIpYCsHqMzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399222; c=relaxed/simple;
	bh=lYx+T5XD5OlAFVs0jRZnw5rf3XVTMCq2oMgVO1ApDPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYTPV5lPYLizcC3XZ3c3cFVLLPOLETx3pJ8rv+okAg0EU7RV34PvbBuf+g73jaaAQQHjod3nUCgpqtg+avMjzsQ+2vodUink7Q68eBtYNZClt5VVb92248U+5QaaRZjLDvIfUYTuEUghIbA4FVhY3sK5tKPqS4VVGemzC2UaZMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJjS4BwW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQhoHtWh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJjS4BwW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQhoHtWh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Otq4723142
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 08:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dLtFNo4cmirM2AMHrCIrwzllhvPjkaOAAbJ5Xt+0THU=; b=UJjS4BwWQKtZ+ZZT
	zdrItEsdxC/jfZLzBc9+oFOCXyfwLizJtrE1JGaNvFTqfQRxmSsoh3UDNH88WFnj
	r8ZFM95rjK64UKH7faMdbzHzpAqm8Hfbo0H+K0l179MLPmyninAZB6CJF4Ln5INB
	uZFQJofedTmTeRENhLiAsXBP/FF9c7GMu388L9tH7vvYOH9eoShALfEi3UQxUyyr
	6smWCddjm3o+1rvbRv9UqwBwC0Nw+0xHBzShdE4i17TlxG4+bboPy0SbO/06Ba2r
	VnGveTpW2VbOw45IlmZYSG/1ZdxyoZrlXNjQLItsQsRESqOCSVfTIuR1VT0hYteY
	SfZQIA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65g61v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 08:40:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so52804885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 01:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792399219; x=1793004019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dLtFNo4cmirM2AMHrCIrwzllhvPjkaOAAbJ5Xt+0THU=;
        b=GQhoHtWhJyFrWQ7zByNUcr4/R8S+GxPXgVIgCMdXBvUX+CCSNC+AczVgYTx0MlTog0
         SDD1SI+0KLu6PPFeRoNH4VWMbmu73thJDOeareVCyV8xqvCyaWuCj8WwLm3RGDWzCWQk
         YwRyEOHA8Ku08kekbg+GQXDZW4Ee480FJB9y2T1kC3eewPXWp1LTmp8hwM2nQIQwyDlO
         8ldnVKZBI3jtFwg/DxY8MMV1nBOyRAj5ZiRLU72yyIiDU5x2Ty0QD+6zursC5zsHUReH
         tnwnxzwzDPM7YQ0Cr13h+n7ORi1QvSi3HBldRiRtDI3RqCJHC/GISMDB29I4udUf68WT
         RAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792399219; x=1793004019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLtFNo4cmirM2AMHrCIrwzllhvPjkaOAAbJ5Xt+0THU=;
        b=iUuR37f3qY4tv0yjP1NOabrg8v08nF+L4mZM8+jB3ZG+LBKmOGG0UfrA+vDRjHotlv
         5AVdddjHucf64BQmtleijlwJ057KjfbDo81bfvyN9CuANroxj75cWH5VbHT2d610Y0yI
         MrGQEOQdYpc1bjNDsxt2wV3tbxbqfX3iJ5dXIpoXYWgLmgnd/cdyIAzMD1XwU96OWfO2
         LfIrG7ZaFWg76zTd5qmK9Qk9AIaSlfORjsKk+JrLjAzUdm5ji8oY28zxM4l4R80lzNrF
         1EreqtkayeVG9dFOHIUuiQi+JLwcK+Vl2E5Hkcx2eHxxPkKfzdQMfohYc1Ts7egBTqEn
         Bttw==
X-Gm-Message-State: AFq9FYKnZPTdQ+MGaLMWyjs7DJt27vijueAE++lUMpskGhLvhNb8JKIq
	qArZ0dVUzUC2rSmIQ7dO0C4afgfmqgIloinH0cB8qaHhKwFoncPBPte+ekFq89/nYVXJ1FtBcQP
	Og+3UuejA/5qAHpIzhtIq4cKMnN2pEygOxENdKoyLucdZJh7glzaSGCYzsM/Y5yKOvNorm/jZu8
	pn
X-Gm-Gg: AYBFou3m4vzAeu2hzh5/KU8FF97OgCQQ2L+UK9Kj3Zfa/3TCDSt3z+GCifx+2Eg7gp6
	OyIn6A2+CnmM/bYc7Nde5G992nSC468M+UHEnmEL4cp0GLduxYJQlpSeKvnBaBiApk7vOD99Gcc
	URwU2OZq4i1MXVD8+ePObZ9kd4oKIA4m1YlH/nZXuRx3Dvyfp13dYJB0hsvB+My96IT2XnemdJ9
	q7hW+9dj3P5Q7VPNQ3UtdyrIDKMUo4cDMg3uOBAIQmxkcNnwfS7xztonNntsJeApmQC5aM0OfHR
	CGIKhJG8qfqgY5po855IUv+ftSyzGCmDO60xd41EaEd14vw07L+S4ndVmLoRYYjDWC/UWzaJppa
	+t6vwLJIviIsQqKlRZu/rXw==
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr73832285a.5.1792399219331;
        Mon, 19 Oct 2026 01:40:19 -0700 (PDT)
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr73829985a.5.1792399218887;
        Mon, 19 Oct 2026 01:40:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1eb8dbsm3515694a12.37.2026.10.19.01.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:40:18 -0700 (PDT)
Message-ID: <73ab680a-ad47-4270-a7e9-48df70e86fed@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 10:40:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: icc-bwmon: drop the bandwidth vote across
 system suspend
To: =?UTF-8?B?UmFtw7NuIEplc8O6cyBNaXJhbmRh?= <ramonjesusmiranda@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018155424.1299645-1-ramonjesusmiranda@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261018155424.1299645-1-ramonjesusmiranda@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNCBTYWx0ZWRfXw3sELA63bAwH
 V9XefCs9mCQB8bi2hMPPXlPQRiB2Yt9+H5ocQ+xsimit0WT3vj8lGaIAdMUjfvHHpebkG4dDFLS
 3bz6zZSBRTnjICGuh+atCTovqf0Vzd4=
X-Proofpoint-ORIG-GUID: -bnEL9JAt5Vi1KduKS5BuX8k29s2my3g
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad5d774 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Y7Fq6njcUQsdDXMDV7gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNCBTYWx0ZWRfX0lEQB1G+s3p0
 38oqt3ryYn5Qcr2jtGqJgh/0LZzMSPUYVkM5/iSk63BHIBWtGj+I6zKSvA5kk6DWqQLJS/g1YOc
 ZmqfBH9s/zRIaBXz6nodsnSSvqghhY7ElLNlcidz8y2qjrUaC8P+5cqYMJs7mt/Wr52Wwqgjmkj
 MoG27m7NBNce03kNWxRAwI7V4f073butnsa503C+ijO2ZPtbdqArrBvqIn4/1ELf13jbTd4DVde
 Gb/LZB3qkSXt4FhGrnddDGbjD8qUBRDAhVQr6dQ0QJ33znW+56APRkeHGjXqDMp8KvHGmVyJwAR
 fzrfrU4VAT4HO7X4gL+DehgLuWHN7ht7Yb26pTfdXJQyORl1cbTt81JdaZt09xVjNqpNJ1al1DD
 tcbrDGgfocgl66EsXfFEQ7mE6pQxFL+U1Oljy2k9GWry0yVXg8Fbyq7Bw4JdJyrCPAjKgBlWoVs
 15COK91JZzHY9IphwTA==
X-Proofpoint-GUID: -bnEL9JAt5Vi1KduKS5BuX8k29s2my3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190034

On 10/18/26 5:54 PM, Ramón Jesús Miranda wrote:
> icc-bwmon has no PM ops: the interconnect vote derived from the last
> sample stays in place while the system is suspended. On X1E80100 the CPU
> bwmon was left voting 800 MB/s peak on the DDR path during s2idle, which
> keeps DDR out of its low power modes (the qcom_stats "ddr" counter never
> advances).
> 
> Disable the monitor, drop the OPP vote on suspend and restart monitoring
> on resume. With this change DDR reaches its low power mode for >99% of
> s2idle on a Microsoft Surface Pro 11 (X1E80100).

Have you done a negative test (does reverting this patch alone break
ddr collapse for you)? The DT uses ACTIVE_ONLY icc votes for BWMON,
so as the CPU subsystem goes to sleep, these votes are removed in
hardware.

Konrad

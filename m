Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577457;
	b=wHCCgYw4lIX2+a673vBdImIeNyAqC7mZw+1A6mu6Crr4EqgOT9w1o9GsnHEr4Og1JeiQ
	 EQzSDHq6lCNK9fSzz4X5iRGPXbE9e7t6F3nCB6mCQk3XKdJRFJ4mh3l48lz2brGa18dBI
	 f6XQhH9fmukc7LDy0DVXepvY5zjqVkd3cw+shrBeD3ODDaUCu2M1PkxoDfeI/UrOkPGvc
	 nfu0CS78qPK7LPH6+ZPEDFtlJjMNmDZUVbcpJpLA7fI6NRXyvQAuD/tHzGMJ6RmlX5KXF
	 XvLhL8O9170qJfCCre0hMyqqzUc5nYgPN6RceB39JdagXWdwnwtX+gLWczHlt4zYeyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577457;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=673uTcdPoIY68ipEFGBPkiSaf6p7WUQ3Lpb43q4E+tM=;
	b=D5FUs8eINPJ6Jh4d5Lkgrx4DrNlbgLEeAtQ5QuQvce/JfuTI2tMb8joCfXLD7JStji3I
	 DOkdFj452chfhvGqgS94o9PKTJ163I85RD1xuV0gxUjVQ8BGhUf3FHuEcXIpXFlIV8xWH
	 UW2eQuIOLLmCxGDn/+8gVZITUah2c5kkGSpO9+1W90/9O2xxqs96mp6FqzFO9fmh/NiV/
	 g8gzqCPCUb3uFDzuoDnT0qYgo9VepzV5HnI1TnXD7QMNxTDbORtUvsKcPT/pdqGSK8n0M
	 SyRoIXml4vIe4DO0i7M1EBKGpZDm5bxkYnIwECy4od7QDZWTgfsaR7P6B9zq//dj88w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7vVOmTG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwkBaQMq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E26606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23E26606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7vVOmTG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwkBaQMq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA63mP1358647
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	673uTcdPoIY68ipEFGBPkiSaf6p7WUQ3Lpb43q4E+tM=; b=Z7vVOmTGITXiDNua
	muhpHhaJi5/fqve85RitVzb69T/cpqG0It+jDxPr+ceRGTxmgkETGGn1/fmZtLk9
	mHH/EBU46wHV6IC+88OgXVpVbTw0uAJ+mO2PqKV1Hlpc0vdrlrEWFqEdx9OhpqBE
	fV2EGRPMaW0sUmv2A84aC/6oMPVqz9d9OT6zIVdjOPOvlvjWag3Bh3HvxTvqNJe1
	c41ydk0xIh+FCHQtM8h3iJ3sr4qicmxk5/wzUSSWCyvAMEcwjFt7FJHIqzbCIRlq
	Ueh0ag9FEFQvWdAGXFTnT8r4KXkJ7b2lIQlYAA73wzolM3AFSIs6gsQknNnPq0vb
	TM//Uw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4ucty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:10:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so8938485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577455; x=1793182255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=673uTcdPoIY68ipEFGBPkiSaf6p7WUQ3Lpb43q4E+tM=;
        b=BwkBaQMqGRS9tmBbtD1hDdiT1+DajI1zsk1iix/Uqdw30dEGt1DPCZtiSwGkgS/i5O
         8Qc1RlBnH6cSlysqZdWX24fgHjirbqgnmQRQFSnqe+Zz2WITUqqFi0LTGbHXhdypjdmf
         p4nDXrN0+/ToZSKf7vg0fTUEgZbyzhm86clTumzFjy04zQwesS8wRYOdEFwl6G2ph4CJ
         p0d7BgikkMYeZVtK5msUgoQHbURIZTwLnWdb8nYVoAbfk02/Ru6IMjHybjz8MwULGPzi
         qCVSAe6cdC+wdtQOuPgR6XDyWOLzAS///kxWiWprKvsQs54mFCDl/gir3DB5Rjy/wHta
         okAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577455; x=1793182255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=673uTcdPoIY68ipEFGBPkiSaf6p7WUQ3Lpb43q4E+tM=;
        b=fYAzbPYAdVG8gITqIJyekPwRJI2dg2EnnOG//QPzUBWsU03Po6BpuZYduTK9Z3774m
         Ixu5io8YOdjuywWeAsXDGeay47Bid0im21z+takSACsh7ge7J4Luxk1068pjYHHcdtH6
         rKdKRcluhGo0AMXQaLG8XebmLKefgEaEZuV5vyxvLerGJxKka2uzS1i7Sf1pBMLP8HX/
         d8Y/NvL8oc83O4Z0X0Qwo1pLGzdvGPubRfUbDgj6YL+QCqOIOzqSZopM4PdfxGfp5e67
         GMB6X8TdJds0cSh+2Yv0etNdgeQNlUmza2ccliE9kIdT4sV1nLnVHeGZaQJ5iRns7fQ7
         6neg==
X-Gm-Message-State: AFq9FYK1e3dKod/TGs3akwshMeqYRXQ3bV1+5NcJ8l2X/3B+nONyelRi
	AIVUtFh79R3aA1AQGioXs990xGiC8Q3+q49crjSytIaDiDvTlODZrXh87E3nAIASfD4Fwo+1Y0h
	v0LSh8w+CWEhAhNzgk/WbgAiJorcKQkp807A5xXVlIkh6gZ3OpyWSE25DXrJRgc/l+fzs
X-Gm-Gg: AYBFou2eQGkSTThbNgYrs9Urz/7UrPCOwovzzvY3rSzY93EjhVLkHprNEYD3j0x1N0r
	I8o2jZpAzr1lyCWuXUNrGa9IO9zbIWjoUg+3oAwn5ruHNNkSTir3QSOWKBJRRy2EpqKc5QJy/kT
	1Jcr+xHScRV8h6HUYy2IfPsUwFexp+aBwVrU2R7CP1jTWLUsGo1IQ5vTPCha1pSWMkxjOMl/Y3p
	4w2WxB22l6YBrphRLvj8b60xJJM19spXTNI3Vyp43XC8nlqhocc4oahezJtqSQfwRzFHTgJqDpj
	vSLByjGOK9DjGwilKUvsJFwMexVREgwCLG686ZBfJCPMcW4GBaGjXjYORoAg+E3i7eJYr/2cNlE
	p9aOn3VnqZ2ZO5S+InSSTTg==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr370002285a.2.1792577455364;
        Wed, 21 Oct 2026 03:10:55 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr369998585a.2.1792577454891;
        Wed, 21 Oct 2026 03:10:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46790366d8sm60349366b.87.2026.10.21.03.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:10:54 -0700 (PDT)
Message-ID: <45d542f9-1de2-4d1d-8a89-763f7c96b8aa@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:10:52 +0200
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
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_adsp: Fix 64-bit address
 truncation in translation
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
 <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-2-f19b4b947bba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-2-f19b4b947bba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zaT1sYJEoPYqiDvUEeZK6uGAm_DIY-Sc
X-Proofpoint-GUID: zaT1sYJEoPYqiDvUEeZK6uGAm_DIY-Sc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX7Jws0gZpP7C+
 fDkEJtJy2GWLy6FmpuoeQCyV38zyh7G/JDVaGWg2ksWlT/t15HKkzmCult7eSn0XEoLyBs8Ns0N
 FDQR0fpXbcoNAar1kGYGsXOaoREBSA4=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad88fb0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1FkldgVRT0rVbtvJ3NUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfXyue8SotUaT2m
 SO4I2BKXwq+9QkzxuaSrTz08EFT7iTdYAx+QlKjJF15no3Mjy0DIXsy8tKMBTgkiQs4fzg14fGD
 6crAmEzDfk6mT4NPPkOneU7OavveEe0NL87fyx7OUC8JTOOE7CMl3Y1i1Xniyjdrc8nZYa5+n3h
 /g38JJFsirb9P6q77Pd7kLkaBfFQDT2RExEwQM5CLVn0b93kezea5UwyfoFK6ThxJ59bjQ9eu88
 O0rXUH2d6zsVc2Wqh3YnOakYZLvTwNOeGjY6GEUZNNfem7fhX4gni8Bl1cfrkGMkbDLtSoeTaPi
 mja9zbIeD9KlYdbF7azHQf2/FkunOTgyCMHI/5w55jwVbR+OlOrXgquG+52F8jT+HbPFbQHWQj1
 63lVdaxHQgpw0vC4W6bqAXsdOiYoykggmyn7HEouFfrmYgTZ5yDQW4YHUJBu46kdOXhBU+seaZ8
 keaPbzHlqKz/ZfJWeyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210040

On 9/21/26 6:36 PM, Anup Vishwakarma wrote:
> In adsp_da_to_va(), the offset calculation results are stored in a
> signed 32-bit integer (offset). On 64-bit architectures, this can
> truncate the 64-bit address arithmetic result if the subtraction exceeds
> 2GB, causing erroneous bounds check failures or invalid pointer
> translations.
> 
> Fix this by using an unsigned size_t offset and explicit comparison-based
> bounds checking. Check that the address is above the base before
> subtracting, and use the form (len > mem_size - offset) instead of
> (offset + len > mem_size) to avoid unsigned overflow.
> 
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

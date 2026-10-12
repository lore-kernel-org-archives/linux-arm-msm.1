Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229252874F8
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812596; cv=none; b=Uuw4JaYazKfSovuCmWCJh6yW860z3/BDtwukzt6ffecVef2LwveqiLmM3IMutv200f07o1RiPBlUQdPt3ihfLjZyE5L9fgr7A3bhEdDmElVpE8ciQp9fr8NtVh+QSDWaZGTnP6IC/zLf8gjtMfejOrwCEiUNIR3hXF8i2/Jghc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812596; c=relaxed/simple;
	bh=ojPwJAgsetXnrtPs14XE9oZv8ih1NyGg8lkFMVoqD2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sNn05N2PUzN/138ZEshXfAlVUpMLhfo2eACdtcSoCjJw8wxklOzeHIzIV+eImE1/4QNXSLe787Lfgqw3tNnBvJJtzbN3a+1m9kiU8tk6SeVs1BHsPjYIjPGXBMNy/wqCuoRDfl1cfqKPq+nWl1ZMgnYGkyUYDp6O1UYC/OA38FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzSi7+Z4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZHBUaKn7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzSi7+Z4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZHBUaKn7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Xia2252940
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hdl12bkFpyUTMKsiLcjDxAcTyyX+15u1DUZNz6HUJhM=; b=UzSi7+Z4oGakgIg+
	tIdMKBpelYhMaHGbAleaOhN1RNUq5FCgFQJplKcdKGU43nQJLzVgcFn83me9N+VC
	VClISBDRUtjnF2t+jqt8tBg5uHaJ6C6JQW2YagzOK+9IXnsSUHcmfshYJomSWi0b
	cB4jIzCyDdl5d+gNfFLoFvDlpbDj1Zu1dn88eMrHfmfCnGAj2FjNwOpOe51hkAL6
	MyT5cJDLbBgJgs/VrXbeA6lJaviEUUv70N13tDxnD4lOW/uEZ0f/lXAVX6k8gwJB
	FqahZItnra9hw3VI2XNiILEQnshv18luZcAwAbupoTE++yUZBE6o25+gh0WiofJy
	3GWR3w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j713836-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:43:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917ad3b42eeso5220516d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812593; x=1792417393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hdl12bkFpyUTMKsiLcjDxAcTyyX+15u1DUZNz6HUJhM=;
        b=ZHBUaKn71g4O7ahJNxmh4E03fLTvOVdSh1eu9nId9TTq7peVhHktexQJb+w+Kzak/m
         NOKld/BPXpEYGEslS7bnAcQQr0UJIuQBxLuGGR7+UZZLp4L0lfTMC+441/bVTiBMOSSm
         AoCCQ9f8L09a4xpo4sGs5heZ1K39pGX7sFVhKGzGiZZcVfryXKkRBb6VmTfhp4DsGdqr
         WoPFU+hAKDzfqxMWJoyTSnDIkHwBTZOTu4/HXZPsPOTEM8EtdNUkZMPNJ1JQxUCiQLiZ
         XynQ3W0cIApWQgy69gorKIeugIC4B+vbRx1hVoHnFPLcqrwQdUnzLwOGmVpRG1Ij6Oro
         ENEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812593; x=1792417393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hdl12bkFpyUTMKsiLcjDxAcTyyX+15u1DUZNz6HUJhM=;
        b=QcgsS1SEXP0FyVBHdqeLG+TRdSIwJLtuDLCRvV/g0f5gcpLnRLonpKVkFcZ24XL440
         S5pP8jfvd3wsJvbUw4k5rsYWphsctZiihwPXVwNDjdCW+AJe5xSKMOn9qGbA12FO4Re9
         i75WfGVjKes0oDS/q8/IaI94wJnM5QnSfTAlMGao8wqmL2MeM+y8ckOhjUNK/tMyPuan
         ktWlp3iYUEngBS77ZhfSnQWp7NhJo5/4VfKmcuKQkjafEolqSJyVBUJlm5OAAtsydAM7
         lfkLAwST9iUEdGSSlIo8Ja+qgsylIaPo96Xbc/TWVvv9N7p+/E+WWRtO20/bOjPzuf12
         gSeg==
X-Forwarded-Encrypted: i=1; AKwUvBxfm5rNdkOxoPv5ORICOglhSxqVEax6S1b6Gncj81lejhR8mUNIYR1YZEIwVWthJ7eNoTlwZwrT9n2+XHAL@vger.kernel.org
X-Gm-Message-State: AFq9FYLzl1WcSUTW06Uyay9rNfu14JIPPj/ub2bi1dKes/7GIpMO0Hsk
	0Zp9frwFYeZgB/aAkT9mjavBtUybpT60lfgkN+qNA/SVA5Jq7sfg5jJiXkiI30T0TM98TVt1AgS
	xNUaxkpOQITudY/8YYy8LDxs/ScjVVqTjWB8kln9BIHxIyfMdn+b+bu2QGfpq0vkGMACS
X-Gm-Gg: AYBFou2/cQKEnhTfxFggk3sSCWrn9+okWKu6FnPLUywqr4ZxTD+uk7dwHNLMQ2UDydv
	hsbfIzIbftOpfMVHY21RE502RvkGQMJM8m8qdht41NhhZlqxi/7nQn4N1bjrFb3dWfY7QIUWoWS
	2d27OdoUVgxr4fg3Lc4XyCO+STXopG0dlGccuHc8lfRjpRgXC3DPwxPn3bUA+srl6TAB4izVTzY
	Sl1yCQrY+hCQ9BxKRgcd897ZB2vMJUVkoZ3uAE9LYe1aYrZH1Vb6f08p6SYd3MS84ARIoHjDoyE
	bWqIJf+c8issO9Egzr3QXQ+OMN/WJA9ThSqnQ7RL/X5o1wZFQdguNH9msYjdiekAlt3m1ieFDCR
	j1uLyKhjD9Q6+cdfXU33KQA==
X-Received: by 2002:a05:620a:44d5:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93ebd0c38a2mr1750681185a.1.1791812593280;
        Mon, 12 Oct 2026 06:43:13 -0700 (PDT)
X-Received: by 2002:a05:620a:44d5:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93ebd0c38a2mr1750669985a.1.1791812592068;
        Mon, 12 Oct 2026 06:43:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31b9a2e2b3sm426621966b.52.2026.10.12.06.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:43:11 -0700 (PDT)
Message-ID: <9e3588eb-77c8-4cca-8548-3ee4f58b1f67@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:43:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: x1e80100: no AOSD/CXSD in suspend with APPS votes at zero - which
 vote is left?
To: Michael Burch <me@michaelburch.net>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20261008215540.15933-1-me@michaelburch.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008215540.15933-1-me@michaelburch.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NCBTYWx0ZWRfXxYgMiTtFWktM
 ICVDTsUCATjEyWxY3PGWUZsn25ZW/DaEqx2qY35hc52LakicWC94fNBuFJR+EcsqWyAG6o26h/K
 G/M8l16vMgDyxjadSwCnTp6mmvhA+P0=
X-Proofpoint-GUID: E8Qnlk0aXY1YEM1C97ihp3TMRqJ1WDCK
X-Proofpoint-ORIG-GUID: E8Qnlk0aXY1YEM1C97ihp3TMRqJ1WDCK
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6acce3f1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OWIQM25EAl0gKykMja8A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NCBTYWx0ZWRfXw2DEeDVJhVgg
 /1FczZvQoc4PexE+cpnLFI8d5HE0i0vR43jnj/m/nDYbqpAUHUci7vKDzexfhl4EjOjppioE9ss
 WL6jqRTjOebVVY4dDzZbOqwLF8ME9B5ECQHtiC9wNzrl9zov7QQFZcmxI2NYFN+7tGtCUH5m1VJ
 3Eli1z2IdEkfAn+TL38dUzjUrOaCSqFxt1KQYyZEK2zCBaTHQiqPghE+suazYYG4O1DoU/Wp3BC
 wZXpywvg7Wwe1mt5FK0AO6bEpCKfVkwKe0moX6ocJfr/S2wbMvaj2CdbbWpb9Vn+gPKALH6r1MC
 erGopatJzzmWUYaLsCM2Yim8qb6MJ6z/Kb7MJiQghmzCHcVZa7MFaQmvBEdCnihwLAXsrU53Mjj
 xfLTcpRsWdojSr+XMhy3SCWWKLb+kODiJdToe4KU+2BSx63NBasKo5t1leEkjwTqZfAT4UgVE/x
 a+N/nsmB/1fRWS+IiaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120054

On 10/8/26 11:55 PM, Michael Burch wrote:
> Hi Maulik, Abel, Pankaj,
> 
> On a Dell XPS 13 9345 (X1E80100) I cannot get AOSD/CXSD in system
> suspend. APSS collapses, but DDR never enters self-refresh and
> qcom_stats aosd/cxsd stay at 0. Standby is 0.43 W; Windows on the same
> machine and firmware flash reaches 159 mW with 99% hardware residency.

[...]

> During suspend
>   apss         +1 entry, residency ~ suspend time
>   aosd, cxsd   0
>   ddr_stats    0 in every LPM entry; mostly 200 MHz, some 547 MHz
>   lpm_mon cxpc (sampled mid-suspend, DRV 3-21): DRV5 and DRV21;
>                DRV21 only once the ADSP is quieted (below)
>   lpm_mon rbsc: all subsystem RSCs asleep

Do you have leftover non-active-only-interconnect or RPMHCC votes?

Konrad

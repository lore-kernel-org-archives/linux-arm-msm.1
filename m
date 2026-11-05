Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865985;
	b=Eba//XpeucT6keCoIEsES/LrZC2cXmcXcifFzJeMDfKuj0lVIKQ3dQwMya6G6FdmjWpm
	 70+o0EZLar5OVIkzpX0XqaI8H4AvV7xfTbFg2gmbpL78qAq0aN7Ea68nID/Wa63Mj7p6k
	 2G/CAXKoUdYo1gi7UzQOdFEQf5obEDKrslHE7EnEN3hj5NPtcAuCyWzI6BaW8OlwqDXk+
	 lWzL3NgGriwgGqy/+X+IbtJZB93q8JlIYTFglyjDO7fdKRHcTMPqwkGpPY4e85keARcXT
	 ehraKXkCI6nrlpienN2UQ3/yjh83nF7ma0AbhRG+PtVTA2IMGRXRhowJrugg6ihcE0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865985;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ngT2Zr1w4uRruIUqboDeGJXzhifvmqARymXgf1oU38U=;
	b=tf0H22d2G2/naOuGgIrKJQ9WkjkOCysfzVWVJceXyrsI6ELmBtBruUH2G2JhVThwsRBK
	 59ySB/34LvY1VkuZFehIJpG5Qib0gH+0vDZigixSgMM1QMu6zY1WfVvAn3BBMFA1tcHYH
	 N2p+DhHgBEbWAD9+k1izLFvaVbiWIUXvZh1A/zzsorGyEqfuPuXA11g9xKHw9a5rJLJHo
	 OoSgKUf5K53qsJihhypTQ6kRDk3SEAEeo+URwq3QWCrslsBF3759WWikKCVoZK/zyC3yV
	 NKIk3512y9i5qqfrg9piohHK3lSlnOXbLbkcpMB0RrJ1jKrgXQ5es+3mapikKTnNAQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hyCcL2bP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RSifANim;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EA1606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5EA1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hyCcL2bP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RSifANim
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UGFQ4179302
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngT2Zr1w4uRruIUqboDeGJXzhifvmqARymXgf1oU38U=; b=hyCcL2bPYYDkie56
	xQ0ldzANVWAVN/WJmuSz0YvmE0YcO5OMBVmebfyZ/DtDdmY8P/5rSqGHwL9rrMwm
	vJBbdkS34hwQhsloWQSJbEZ7SpSlgl3ipOskQZjimZcTZcsUulE6YGYuy/HlgRTO
	8/F9fOiC6yTzUpOuMwLfkFkIih7HhxJzL43xRp7KHxvhQaasvDazgVDectHPO+Gn
	jFCVRX3zAXgx+45ZsUW7WLR2Z2J/xzA5mu2moiv5W327u9DJoY9z7gD0LsVQRfBX
	My7BaSCzdAWVr4yWeQphklmafcRjyN7/LQh/mrnXdfsYyaMUhqRHZGcFSK9mMZau
	avNsNw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn4jer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:06:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-54d1b91e088so773291cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793865983; x=1794470783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngT2Zr1w4uRruIUqboDeGJXzhifvmqARymXgf1oU38U=;
        b=RSifANimv0yEnp8K/iJ29ge6aNg8x4hP5I3RkFj2BpMAGzRjerLyBx0fj+QyoCOZuz
         gSijooXQNO+1X9oQfT5EH04mHW82yfz94Wjbw0XtqoPnl8oOI0uib6phUCkFRenYC7NQ
         xpQecf0sncWeGM716A2n7eFXNAql05e2hmZ8d6k3SXr03eDMoUDKgMvF4aHNgrgUTWpm
         V93rkK0OipJz1OHR2aC0Ur11Qwg7oL+k25QDmN721cPz39JwzrEdmGq58HnbnvOVpwps
         RdGRxuR3x63f0LAsAa+luLPGpl1NFATv06d79MwqYkpL5URMNeRaYrN4jtgfUewIj3Jt
         c70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865983; x=1794470783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngT2Zr1w4uRruIUqboDeGJXzhifvmqARymXgf1oU38U=;
        b=wlD57jnibcukD5dAGSMpu1Ltz8ZYqE+YKi2M96RNs5jh25bASWLMovyzQopzhY4ulP
         ToOiXDmY/uwanhuNUK3/5Iobah9pIktA1WQSLv4Z7kY8lmviF/Ok/NDN7b7qQz7Hj9SS
         wnt4CEvWtdKAilsLIegDNF5GtD6knm02KpfY+cymsOoRFMqPdCo0lhF3bwED5tRSZboc
         CXWRc1NrzxkJaRhIaL+5vMBjFszejJsNo6pr1m1Jnnd1Z/s+obVv8LNrstfug1KoK36O
         VAr71hJsLQSd98IlQXjqbdugfBYULQ839sI0ZvLDNyPQZiYL3WAfvcbwIDUVKDaRd6gq
         qQFQ==
X-Forwarded-Encrypted: i=1; AKwUvBy04yjoGJnqgm0zo2ea56K57z2BXWdJZscwqE/NVDEtFVBz01c5j2yTRwa0V00ym0GkshdQ1uPH+qxoIPcW@vger.kernel.org
X-Gm-Message-State: APuU4Z96In0+r6NR+hSBFVmmPodFK0NqldZPmBccieqmEUdjFIDZNZOs
	pbi137IdKtV5wg/+EugCMSGeums+++cC7UK2jzXmcctMnbyaQWvMj8ZsMAS9hpgUunVtbWZfZvg
	9gMNkzaHFQgFe+O0zB1WCvWinOawyOEeEEJxRi9Hr1w68bl0YQKKBlTiGY1f5+i52pBrE
X-Gm-Gg: AYBFou2Lelr0fuchI1Oo8pQV8pTZPFSTfs70UNfEouQlIN59jDpWh1PCaU8ut/B5abb
	g4e+tj9AQvmd9Q2GVmx02jz90TUJUPRSsSdN8jE+8ebAJrzhJQcVbNLcUAAteMZd0pyRVCBDtf0
	IpeWfu1ILUkigrmnLb6Kkk/B/zEkY03v9Jn1pSX92MtV78veEP3Y7yGueYE9H2U3yYcuuWuK2Zs
	vD7McsvJ1fvCxnTNxDEeOlPnNXKrtv5BPhLAkrr36Zg/ZSVVA9DMFWdgbk3jce0HVNAV1bn561A
	+DLW7kYT8MhX8yMsEA6RoN6nGxYQEq0I7v7twREfr9nZK4Yn0z30y1MHR7JkTnY4nJt+pQoasRa
	tk/5CCn6hiCCoKvz5bQa6AtzF2y2R9Y2jsXv49XBXbHnBJhUpata++RjuBVYnVvdt2AJW
X-Received: by 2002:a05:622a:e2c5:10b0:54a:a0ae:795b with SMTP id d75a77b69052e-54aa0ae7fd0mr101400541cf.3.1793865983105;
        Thu, 05 Nov 2026 00:06:23 -0800 (PST)
X-Received: by 2002:a05:622a:e2c5:10b0:54a:a0ae:795b with SMTP id d75a77b69052e-54aa0ae7fd0mr101400251cf.3.1793865982586;
        Thu, 05 Nov 2026 00:06:22 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4a771bsm145751966b.85.2026.11.05.00.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:06:21 -0800 (PST)
Message-ID: <2c31e18b-18a6-48f5-b892-b343f47907a7@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:06:20 +0100
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
Subject: Re: [PATCH 0/4] media: qcom: camss: fixes for SoCs without IOMMU, RDI
 and CSID1 streaming
To: Allan Siriani <allan@fatecpompeia.edu.br>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfXzO3475Kh+R3I
 W84y/Ea/LdctfsHW2+5KolgQf4I8ynNNA+mmsYVEt0F41hi3yGjcDc3W6eNi8Cn3MZqLf1w33ro
 +tGPkVu6Qc8TJt8T7l2eqUDPTBqohdPXwmpl7MZlZrw+Ykz/zv7v5QJXUldPZqfPs6g64gILPJV
 Px4PxX2GmC38MNCIohmTp64qHo2ouVJAExKUQC3vbqeSFMMlYBRZQotXcPSLc9iwAzNrRv7E6x7
 76GMXz7Y0mmJxzZ5Nf5Eu8U7WoEQ/VvUfImQ3njttajJG/6YxyXzKqHFweUGXCeu1jwsaf3NvFL
 Q0/eDVYKe179vxXPli4r9pojtSjHxzYAbaXchuuV+8JpIh/ORSh92f8pGCDE1SdEj8jrrUWjwyN
 +y4pNbYuswQw+pTBN9cPcO6qpcnsAvnWNKJg3PE34X/ebyqB/dGwHf/1Q44NBXVTorCQEtWTG2r
 Mf8drwnwEjgJskQ5bhA==
X-Proofpoint-GUID: wqJscQvodXJHflf264rJwensqP-aXDEb
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aec38ff cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sv9X2YDxvq9Wc_PriaYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX76OgNNt6pxPt
 IyBzLS59IvrwQ/Ow3mFEiKVALNv98tczYCPH9xUJGxHsBGoDf7++dXtqCFdk7/jMU11MID/7GJi
 D4/3UH/y34R1q0MydUz5LKWaQ6CEbqM=
X-Proofpoint-ORIG-GUID: wqJscQvodXJHflf264rJwensqP-aXDEb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050032

On 11/4/26 9:23 PM, Allan Siriani wrote:
> These fixes came out of bringing up the CAMSS on MSM8226 (Moto G 2013,
> "falcon", MT9M114 front camera on RDI), where the CAMSS is not behind an
> IOMMU. The MSM8226 support itself will be sent separately; the problems
> fixed here are generic.

I believe that there is indeed a IOMMU in front of this, at the very
least in front of the VFE and JPEG. I suppose this is "just" because
upstream doesn't support iommu on that SoC?

You may want to take a look at

https://lore.kernel.org/linux-arm-msm/20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com/

+Cc Dmitry who poked at that topic

Konrad

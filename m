Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68900135A53
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922951; cv=none; b=StIqhE8mwyZhMcdNuNZqbnCurUhBtKy/PEPlblpd297AVcupEKILq+UI14sJAOd2hn45TCvFufwJn+NPiyliHSU0rWHTLK8IwEuQ3WFUs8sbimmSMg2HoVpGjfCxAQ9mkM8e32GRcq3/6/tFPi7/qkWP+5amKb5IFg6jMvshSdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922951; c=relaxed/simple;
	bh=iePCwxtbzLSdZC1CQ66MmSNEzBXjyySM5S55IHQlS0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e05zD3Ad1YdTyRs8otQDuTTflEk2RP5ZYI9zu6CfzCk5MLY3JUWMAwWr01HHP8J9y2j61nmik6SKR3xvgDvGmLzrguwqoWGxb/ztBBYZxXIVX42pjkE9YET7kTW87BKvVCFE+0rJj/THtss2xi4j7/c/kBnlA+Hkyvt4ah52I6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvvTGBUp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FF7X7I+/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvvTGBUp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FF7X7I+/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7HCn2167544
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kf2gNLK0kyVT47HLDz9mth3TS9O1NFFYC4viST6weVM=; b=AvvTGBUparWamklC
	OOSNQ20TngU3RSWyETRpCQ43xrF6+As4y/JMCHxytpUWxc5zdKG2if/ppy7TeH6F
	8JoA0OiuwFhXmBZiRT/16d4kPM9iptm4fgrkgaQdT/9NdWVwMoSGAZ382FfwloUZ
	OTPNOG956WdudxmTDWN6JGWtv+NSammzQlV6ID45JntPG587lGACzNcpnr/sb+av
	b22v3gVzjV3iNMfXCNdG2bpud4fUEFbooHgpSP8otlAOXRFbb48WO4uvgKl4ZL3v
	pUQ5i3+KE+20nn6c1zMwGdWdYlaTW3NpjYnk7M5j64wCu3yFyxGs6DM2Jh2/lpMf
	FoOKFg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb6h0147s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:15:49 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-77969cb40dcso18336137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 06:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787922949; x=1788527749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kf2gNLK0kyVT47HLDz9mth3TS9O1NFFYC4viST6weVM=;
        b=FF7X7I+/h6U2Q8FkIQyunOiDW3ri+CJ075chZOZ9oLe+PyE4S2mdpJqTUBDpv8jHG4
         ngV9IEtP6n6ucIFo5dGGOlx9Rx0uIj4dRrDLys7WPeolDamBdeM++/3RGMk9/pH9H70U
         77iLQDQpMHfw+GuRa2CIQEBWJHdEEE4mh/hpyEMC7THN2o8RpD3FxwUiZGFleupO5+FN
         GePfRyJ6KIWa5DudDHbk/Mul8uwulc8Jwr+iWp7+lTrY0e0DZtQw1hSRldkmkuIsmYtw
         je4MchUn25Bvf/TtlKtIB/j3eWta2StWOo7SOgFJe7WaG01ZeufPXoI7NonzStaUM6oo
         Jlew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922949; x=1788527749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kf2gNLK0kyVT47HLDz9mth3TS9O1NFFYC4viST6weVM=;
        b=qcCiJj6aILNRbHa/ACVpn7Fwlu0LqRrMoYO6oU7xFPG2Jyr8Rcne14uGLZ3L+tE8HX
         ZR692WT13/b6c3IUxaafRxHSHRB5wR2EvW8FbPaZB1gvYz5izP6RA2ExjUnO7aPqvnTT
         9YmhrRyYmYufTAdWS05T/EdU1EDYoDiwzN5xMH+09Fg//6mAlfZSitv8Tfbi2ErwxhLb
         R+qzAkS8SEhdPl+EAqMPzeBu7YzC1lLrE7xctY2ne+EV0nEabHFYgZmtd8Y8mWwWNxKf
         +i5CrurzRnFnThqSjjXIC1AabRO8xr1Eqhv/jn9pMtaZtxndCUCSNvvQIV60qXHNqzNt
         5w0g==
X-Gm-Message-State: AFuF++khCgD3H4kBjC4LNQXy62eRP/YS4TmGqmfVk2RriOM/J4z7bCv4
	5beq8iJvcHqi+R4w6Mpy2ZHkHJLd7qt8PmXp5Y/Htfefk0qV3Z1giqKQ9y5EBEMVkhyuC1g1BI5
	eL2rSnolTbtzBhQYwGQnV4WxT5Lk0/fnuJLfIF46QltwkBGuuEyyg563655nvq/CVpWkA
X-Gm-Gg: AR+sD10P0JbNrrD22C7fnREvjUMHjlCHs2+BCuePplAEn2u/0M0BPUO9hsrGbFtFVRj
	ukJP5RfOGGoZCeNRk025grKm1SjLbudHmIttbMOmV9MFZCMMoPTRBbq9uFe/lHopzsW9CXkNCaW
	2uL9iilbRmxMQvPSNljg4LzYb94RdvAnHzQ1w67SEuUYtZHAg06Lqacqo0aMp4aiUTDfV5A4EMZ
	C8coCdh41Cbl73wrxVH9f0T3YLqBAQYPBw777JEp8DFWAJA61PKbWQYMHHs0zYQOJHxlt1AlK4l
	BW1MG6Xz1ycFy7FyjX8qYsgbkG7ecNgnlRyaA2Dt3fSZ5+EuCSFrEp9I7hXdhvGJKovuNHMCOaZ
	+T1MScQRyX6ulqjhxT/KMhbw=
X-Received: by 2002:a05:6122:6b86:20b0:5c6:56ae:2534 with SMTP id 71dfb90a1353d-5c681519d46mr752285e0c.3.1787922948694;
        Fri, 28 Aug 2026 06:15:48 -0700 (PDT)
X-Received: by 2002:a05:6122:6b86:20b0:5c6:56ae:2534 with SMTP id 71dfb90a1353d-5c681519d46mr752259e0c.3.1787922948209;
        Fri, 28 Aug 2026 06:15:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fa3ddsm78819966b.45.2026.08.28.06.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:15:47 -0700 (PDT)
Message-ID: <673359ba-7249-4e0f-b5e3-4c729d4fe6fc@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:15:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp-x13s: Enable HBR3 on
 external DPs
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
 <20260827-x13s-dpaudio-v1-1-da73414c6ab5@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-x13s-dpaudio-v1-1-da73414c6ab5@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b-RF0wmeEj83Qn-LqMwa-976DSoHAWvn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExNCBTYWx0ZWRfX+ha5XIq1uo/+
 MXKkL9gY+2x9RtzAN8g+oaiqi3cL6v32Co75a0O3kZnyVnPHEi9d3EM18Y6wmO0cDPJlq9pWGkM
 YGu5pFq/h3caGRP6VOikAEkCeWWV4Vs=
X-Authority-Analysis: v=2.4 cv=KPpqylFo c=1 sm=1 tr=0 ts=6a918a05 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=Uer6SED5Sbd5OPh8DIMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: b-RF0wmeEj83Qn-LqMwa-976DSoHAWvn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExNCBTYWx0ZWRfX6GR/Ccx9iHI9
 xOVoHcIOHWz9tGwPmHn/9mpUjoOvM4t5VH0r2809HedBzMd1P3mi4xY7LQawEyEanuofBNcr57M
 ak5XE/Q8FvCjFI4EEyB1uYKCX1lw9695HL08+vYjuNW4xMyGTgHjAZXy4PT764evSayI4VPvjgg
 MvSQEyGry0DXn73IiI9+iPIICmCppZmJuxQfXmjxnr5w7uV3pWxc81bwdSZVYtDn5H9nfMbNjCT
 4n0vg1HdISDcPvsPRsfRcMxHzksNtX3oOWmsX8NCVIUHdfBDy3AmhMLowWjmYm0F1OXCYMT0YHW
 t/nNU5hE5nFiPuYMufL6ZOVGnK60BQvVmr0N20bq4RVLdd29Q5i4Cwvab42WOUVLkaWTU34dsGP
 LY4WTb3POt4vfR+Da2AciYfLB1+9Bw8S66M3RZncPA/xzOAd0JU3l+xmPa7sOUS+If2kcLglt2n
 HwlK/DvcoDnmtNzWScw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280114

On 8/27/26 9:52 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> When no link frequencies are set, the msm/dp driver defaults to HBR2.
> Explicitly list the supported rates including HBR3 (8.1 Gbps) on both
> USB-C DisplayPort endpoints so high-resolution docks and monitors can
> train above 5.4 Gbps.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

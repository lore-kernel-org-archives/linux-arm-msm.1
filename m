Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760422;
	b=UQAxKarenz9LWHtBCkTKeM1aB9QD8TNIA90qyOmidgGObn0fSxb+w/CSY3yFPUIBloRb
	 LsQjX1Ehy555vcisu7r3mqmfW5sRjgo0OS8awiMo2946yY3BoPMyc4azL0twL1otOF3mV
	 +X9aUnIMZMFgPTmjSUDB1HdC3uS5YTqU5UKo0Od5hHh6dOJT9tIPUaZIzwtREStc66/hO
	 3aB1ghmfnFu5Pf5CPx+FKKcBeJ2tUvW+ssjajeld7q4/P/1W9UKXmLhxAXCc2390jUIL6
	 B0EqXXJOUPJT5WxHJ71zUJYYvrjlta6rDooK4X5AWxSuFsaKUC1ODuL3BRuidZHG7ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760422;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5bGzjW5BQVL4/1MWcPv0UVT5BAw+v3bGVIV2PO+7sv8=;
	b=5KhCGjC0A3iLla5Wyyde/frGr/yxyAN1QDm96jQpW7FEwLUT3e5eM4EVgKnAvk5+Pnek
	 6c/NcEilu98+d6rxKvgr0LVR1SoVaKTQlx0eI7jojWsUhibKBsJV4KmegoPVW48H2rK5N
	 6yBu+rQPxqAfY5HKQ7/MBp4FuvMXEgE/5osHV1bpVq1hnJRd2M4okZXHgLIzH+VteXUhF
	 uLvMGwUKky9A6p8lf6R/ORTTKOIwoFP8k2brSsqm6Wyq/o0jmysXqfcJ3q7LpqW4nU7kN
	 nDb2zlq3OpSr56hZtS3WHU7qczlGHmIpmwoZp5+jujhs6LGaG3SZpRkLU/MFT8hRTVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XmieGpUX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyB60LJ5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96582606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96582606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XmieGpUX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyB60LJ5
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NCC9ZC2752140
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5bGzjW5BQVL4/1MWcPv0UVT5BAw+v3bGVIV2PO+7sv8=; b=XmieGpUXPHVVAUJu
	9UoiWNBrGGKz23ng9ITn4UIRUpaNmNhV4PCqF3BwLOT9/SUIPwzBEcKo2LzdtdXy
	E74XOKzrIuOsQ2yVb74Z/CA3KitlpieCkhQ3u5hFxXpTcHX5S+iEbZ5K6myJ+a1Z
	dA5iV99IEbBbRHw8bYg+3+lwFS3PXLRZP/iyo1DNW4AzfXjQla5eTDAqIHKXpN9L
	szTrEtQnwSCX1c6+2FML5nK5/UkPFV34uJ4F/SiQibUnXR4acM0yXUqUbtGehsd+
	S+tF/b/61wu9Efkfy6yFZTmzSWDv+YE51LtTD1ZMpmP9SoDrwf/MwqIrGaJ64afD
	HPRfrg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn0554-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:00:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so22697585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792760420; x=1793365220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bGzjW5BQVL4/1MWcPv0UVT5BAw+v3bGVIV2PO+7sv8=;
        b=EyB60LJ5uC9kaik7AmuuWZ8F11n0d2/NsnZY1scDZW00ZEOU//wEvtQK0bfIK3oMyF
         ZonF6z5OQPd/T+iSHsMWb10xdf8iG3Qk5RDanayDta1oC9RA75DyvlYXx4L42dJGdnYc
         a36PY86ejcT5q/fOqaL3777aTv71pZpuy4SsZGP10rfpHZjSHipHAvyH5RrQzl8Qz8Rn
         jbzb0A5QWHlMNw2UTrZxVnBQ9MyKjwbDOkBhSjJpz1ddxkDWiSOnkGbmX7bRBIC0eXom
         yym7HjpNAy3EkhPv8Sz7tAxCsLPLmOhw49arW1+l8ylw52pvyHoqyPv5+pYzbKpwtP8Z
         +iSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760420; x=1793365220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bGzjW5BQVL4/1MWcPv0UVT5BAw+v3bGVIV2PO+7sv8=;
        b=rypGo1zA1zUliXjPU2wssyW8JwWb25FSlaU2oAe6Tph+P3LLGftQZ7jsDPhHlECjq/
         irYBFCXLFd81Wn8H/n4WcLDQRKRNkONTymNHSme0/lwSnSY4hif68Lui8iePYECy8v7/
         RS3K2Ub7oL59hiS/2IprNo+puCoX/jMCdgnVcHLuJ5BPz8NPgxH0kxvxXZpXCyFWjkub
         qjJ9FWHXBNIVz/mhYlzXjrq+ifXKQ436BGo/hrlfVm7HZ9uK13ACHyuWtwLMxm16dLvQ
         Y2eNFqg5mKkkqzGL6pbn235WzQNJ/+BtT0Aapsa4B2o9dksHfIFIoWHczyo6e2pEe5AO
         J6EA==
X-Forwarded-Encrypted: i=1; AKwUvBwzmy+/8fmyuchEUZcjsPViBQUBTWGcQz6amkz8hLerAHy7wSyaH51Pq9wQLUwZ5fkF/x4Eo22TFAComZuc@vger.kernel.org
X-Gm-Message-State: AFq9FYIsQzInEsQFiUIdgZ1duZfog0DKiXrN8DwV6kh20gX7ogO30eYU
	E4EJQwngYQkF37Wjrpk1rkTI5guTSpUpoMHFiHCNmLsgCmMwaLVDJu7CNre7hV1w+wq9DiyCXSf
	6+wbxyXYGaDOmVC1HqarRbOf/7kV1wwiYSOA4GsNrdlkjEu+v/mul8XbHAR2ZW5ngN+VJ
X-Gm-Gg: AYBFou0tltYRSwVVCU9Jd//Dhc1t2doCT77DCs9we5DH4u/AZmsat/k8o54NqsDaKlx
	CSi8zcLXG8UkIcObC6qtjPCMhynoed/SjSL0sRNvtagYlBKKsv2q8qDM6bEv+EiavRVbkDh3UEc
	+hnISZk8oTVTDRL0nu2FfY7pE/x591Wzj267sfgp2MCHxckcAkARfBglN83D3y03V/OUxOn6zgB
	uCXUL3aDmyG2/75s6kqE/tymxq1NovE0UTtSbdx9SQiMSgOl6X1B9KfwxNWzYdPWOJgEI7mpORm
	Y5jzGvELXG8GYKZ4fK7rNRoFiO5juVvBKZkymUd2XnBOCB4B+/kBp2v4CfAdHLwilLloIuC0Lov
	RDap9rFrliuy5O2a2KnjN/g==
X-Received: by 2002:a05:620a:a182:10b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f6f9c2625mr365492985a.6.1792760419382;
        Fri, 23 Oct 2026 06:00:19 -0700 (PDT)
X-Received: by 2002:a05:620a:a182:10b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f6f9c2625mr365480285a.6.1792760418192;
        Fri, 23 Oct 2026 06:00:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5ca4fadsm100981166b.50.2026.10.23.06.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 06:00:17 -0700 (PDT)
Message-ID: <497c1d50-195b-43cc-85df-edb7f4babd16@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 15:00:14 +0200
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
Subject: Re: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI
To: Kaipeng Zeng <kaipeng94@gmail.com>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, jactry92@gmail.com,
        andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, robh@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com
References: <13181dfa-b92c-43b5-ae12-912abaf79c41@gmail.com>
 <20261013015728.43307-1-liujianfeng1994@gmail.com>
 <74d7c3dc-0880-40a4-b056-f9a089a0ddc4@oss.qualcomm.com>
 <CAHk8ZdvrVt8TkZrSd7qyzi5AirL+FtwUpHT0QLcUd5qBJmhy+w@mail.gmail.com>
 <f5d77b3d-a6b3-42ea-8b20-939a301ae331@oss.qualcomm.com>
 <CAHk8ZdvqoEE66xPJmV_p-2nCrqNj9yQ6RbjD_wTrZZM84bYS4A@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAHk8ZdvqoEE66xPJmV_p-2nCrqNj9yQ6RbjD_wTrZZM84bYS4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MCBTYWx0ZWRfX9h/JYGe+8qF3
 yPxLa7DBY88TrYZCGfdbvJUjz/qR70xIqcBYPc7gFr3S0k+5CqQsUKJTzTIWwbdo8Ostv8Z1vQk
 ZsxLQ6W9qDNbtSId3yZ+R9cU344w109UaH7k+H5PbXy7bH0GKH5dh+k3wVVLCEjCH0/IP5OGEsh
 YhPTW6S0/dZZMuo22zdqPfzt5soxVm7u9hIQhbZ6hPTp6r5CaEq62VEWiHGMujbP4HU+Vilcz7G
 QTYkSjpgA7AQUW+2w7zSN+4njUygT51MDxMSqyAxciAlz9j4tXXT71JtNwQ1BrCLY8OATCqLacp
 WM4m04t1EbacCqIK9FM1TYzwdDnQlPYUuZBxs3ug61M6hjU64crbUkDdj5wAZX3PNccAXP3ZSym
 29JMwuA1ymLXiyQ2sD25rSnobry3uxDBLQ7gnvA764qfJmV45w4LNACYRZzOmbyiJouJmdzWRSe
 m2rqe1wCDYfF0a48b7Q==
X-Proofpoint-GUID: sXuRqj1TiLgBot9ADJ4D5_3lh7rSuu1E
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb5a64 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=a4NEJbfMAAAA:8 a=RowYqNY7AAAA:8 a=CREK5DSrAAAA:8 a=EUspDBNiAAAA:8
 a=sngenQoBvZswEJlz6_oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: sXuRqj1TiLgBot9ADJ4D5_3lh7rSuu1E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MCBTYWx0ZWRfX5/0JfPCjmSyC
 M4g+IO9QSGuUMr3rUZGhv/RpxX/RCw4whJZVJgA4pQwGubIJp2D8gk0w2AeMsLeX9mFP5jTroIp
 e2/YWmXivgxrv7DOUpaiGS4qKUV25L8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230050

On 10/22/26 11:03 AM, Kaipeng Zeng wrote:
> On Thu, Oct 22, 2026 at 4:00 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> My reading of Jianfeng's email is that the "Go Pro AI" part does
>> not appear on the Acer sites
> 
> Thanks for the explanation!
> 
> It does? https://web.archive.org/web/20260314171131/https://www.acer.com.cn/product_list.html?parentid=323
> ("非凡Go Pro AI" on this page, '非凡' is the Chinese translation of Swift)

Okay then let's go with this

Konrad

> 
> I don't think the name (Swift SFA14-11) on the support page is the
> official product name; for example, you can find Acer Swift 14 AI[1]
> is named as Swift SF14-11 in there:
> https://www.acer.com/us-en/support/product-support/SF14-11
> If we are going to call 'Acer Swift Go Pro AI' as 'Swift SFA14-11',
> will we call 'Acer Swift 14 AI' as 'Swift SF14-11' in the future? In
> order to make the naming rule consistent.
> Sure, we can name 'Acer Swift 14 AI' as 'Swift SF14-11' in the future;
> then we lose recognizability?
> 
> It is awkward that Acer only sells Swift Go Pro AI (SFA14-11) in the
> Chinese market; so we can only find it from the Chinese website, and
> we don't know what product name will be given to this machine when it
> is sold in the global market.
> 
> [1] https://store.acer.com/en-us/swift-14-ai-laptop-sf14-11-x128

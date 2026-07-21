Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB71D37C0E7
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642696; cv=none; b=P7LzCXfekvb92azJd1VBqyhUlp5e/gdXe0T97UvuPKtiyU2BbQeSltuK/SnidfJT50uzy6+WUhGC851dAZZsOgGWk+yHj/p04cfNv3VbY/cdjfQZQ4lIGYqiZLxfkXxjzLRZpkYX58QJ5x+J4qVkAJuy4a5/FQSDTxmb2cPeLKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642696; c=relaxed/simple;
	bh=pRHM1I7lUzJT+3N0s27iw9xmGfYqNB1ayCPmfWgjoxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDqo/9WTjT5+E2yR1X1aupT3/XYgyh3djBU0AxZ6lPRffn7lcXycLXQitSa0Jta1myJS3zAvV3BS89XiYN6cLEUwhzIIG06dlSsFCmT+j1zPpuWHA4zvJ0nOHBuIYlh/qHF6zn1LcL+PhhxGgb45fGUacs4PRYrVD1366eHNeLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HkI9qN5n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6Shyt75; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HkI9qN5n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6Shyt75"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfvOs1841230
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0/DUjlFCrYmAy09aQhK13n7bsuLPJelDtM7or5scax4=; b=HkI9qN5nGZ77MmYz
	mLbv4P/vnbFmTCSauPSqpNO61cAJ5cW29RctxnC04Je4w8LPq8XEz2UY8AuqhGnM
	yd9iTtO6Z231rmNSe0kU3yxMg2WtkNOwZxQ5+laNAF5AAfhM8pibt9yCxWPKVVhw
	p878D6RhidzWIOa9ZjNNGzWQy9nD+8MerTDyycQ8bXAg4uE0DykD2GSXNEUcbn5v
	vt42wXy1Q9O6bCKgWqFSfbDLB5gKXbOVpg3iRrWk8bFdCeEcckIhLiMGPuRsrWf6
	lDryGgl57g4nUAPj6jPyRUuZ1gMLhaodMLKlyvbsKSaA824wD4mdb3CeWttxN5zc
	bEGMzg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se2kt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:04:53 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7359eba94f2so298842137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784642693; x=1785247493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/DUjlFCrYmAy09aQhK13n7bsuLPJelDtM7or5scax4=;
        b=A6Shyt75XqsE3T3mxiL3JXXhWzO/lceoAI+siuYPDOniHTz2Iqqq3viLJtdIRMWwzz
         w4wMccaFZyhdFf7S4Kqdv7dEM0ZlzXkZDcbNt/+PsgWamndc4p3RImZ0SiiGroCvJB/A
         XZVY8M9MB2T05n7bpQ3e8WNtWmBw1DpgwTzvWXc221UneYIxBrjM40La38wbduUCofyg
         Nxz6WTUGKT1Co8uAYv5oNp2OkQNQ+yXf2PlNKpBL6SMxQ+U3B/pNWtdgJ6TAJKlFRwjZ
         gbQrbqkXu6+/ZpJs9Oza8rJG9WNoQQhcPI+/aUgfh3c83N8TU5mwUCqm3EEP3XxF2J5C
         pYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784642693; x=1785247493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/DUjlFCrYmAy09aQhK13n7bsuLPJelDtM7or5scax4=;
        b=Xrl1xbUNjChw/LNvfsMzDETtiT8nP/xjgUGC8FDsFG2+8M1u4q0ut3+6pxfJvraa7Q
         5i94ci90hLrE9zRudS4Ao23PFPn321Pey7GDqXK/lxKy2wotN8DiecyCj7IqixXHE76u
         frhTpaY3kVqjb01tZrOsFZNt9suEQdeXj44XrgiCFlBwFC4oNuQ68tG1CHPPIyc83FpV
         uMrDQYqpcz9YiIwXaBPn71Sw80LQzHHIJ4WnujtkeWUsIIRY6dwUBtfY9WyU2mgfhOOe
         ZF/JdN6SM6tOHU5iMSg/l0UITEXN715ghtY3CuUzuGgM9A88wcgKvvZmU+Md4Rht12Gg
         aB5g==
X-Forwarded-Encrypted: i=1; AHgh+RoFDehkL2xPWyup7tjg3LLVizuk3z1a6WShoIV65Mm/8zit9zzuNPAXpc8/jO0R42RmZ/W/RD2O5a+ghuzt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8BfSmVrY5KcJ9EasFRGC0fwmqu0TG+lKaVKi3V8PgEX0g/f72
	r2nmhvgk44r3enyfG7T/bowUu+ThEtzL3eJkduKQvYvAh4DwXFyboanhPA3XK9GRM4EyMtF9g7D
	WsgAj+oX2BoixoWgdIdyk2DWUKWH6PSQL0vYEj6FBA6/HgRpo7r/KGGPhk6TgasFIOzyf
X-Gm-Gg: AR+sD13xuFQiDDMKx7BnlzaCb2dfSj+mTOK/t0/I3v7/yvC1c717Bozp7nKuLHFIAjl
	qfg41Lz8MTkwvsL5VbQ47TbRXCPAAhnMZSJeRVwRo8/7mP6jtrGMg091RQDJsQ8vJZuI405pii2
	Mcii5mPfQrcLOdtAnwi2T1hMK2uczfW8HAC0VEyJEZVo5d76YiJ+N05P2ma4THHbLCnRPB3VTUV
	eY5ij2fYlbeuWa/7s1IHWfISE9JfeqjuZK11/gp1O73/lY49ei4ZSaMU1Us3OVKYIWPhhlIx6WH
	vfYJjn0a373f5eOMEV9d9PMBn7suCvZXzlhqpXyYyM6yYH56JgCrs/O43BFHlvLjTygsgpkhA20
	stfuoqtuQAMJBfbgM5HNnGvxu
X-Received: by 2002:a05:6102:41a1:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-74abc282498mr514240137.3.1784642692989;
        Tue, 21 Jul 2026 07:04:52 -0700 (PDT)
X-Received: by 2002:a05:6102:41a1:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-74abc282498mr514224137.3.1784642692498;
        Tue, 21 Jul 2026 07:04:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705a08476sm609204966b.17.2026.07.21.07.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:04:51 -0700 (PDT)
Message-ID: <de0f46ff-f6c5-4853-83c6-1a93a8aaadc9@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:04:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sachin <ssachin@qti.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
 <20260706141346.4180348-5-mchunara@oss.qualcomm.com>
 <c7b576b5-57cb-49fd-a09d-8d1ffdc2d0bf@oss.qualcomm.com>
 <fe34a27f-2a54-46ce-a363-fb45a3d6c32f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fe34a27f-2a54-46ce-a363-fb45a3d6c32f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4vRA5DMlARhgHvHoLTwvN_7bn4cjVLpG
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f7c85 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tlyJ-ANMDxGhsohFwE4A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0OSBTYWx0ZWRfX/16Iy8vIGBzN
 h766mFpd2y3Ay0gmhI+HBGbtN1Wpzbxd8nQc7E/RvYYnVGYBctv0oXHrJYtcubIqxLyhx84ypIj
 pMAzxvcSon0/y04io8qq/6kc4DYcksM=
X-Proofpoint-GUID: 4vRA5DMlARhgHvHoLTwvN_7bn4cjVLpG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0OSBTYWx0ZWRfX++1pzEAZwfM/
 yOW2a+SOcOiLsYBxQ8UbKO6GDuHFQMCG7bh+btthpyAbRKm4pTwccX/Ry3QK1jxqYkfg/6vd6CE
 nRHfNOMlmgyC1FFqLHqFq+3LUyD+eyKDW1OQCVNgLC/tDfQdKLJJEp3YBT4gb2tSEChcepyeyhu
 LoYSYIbnwlQFFPnmEWCMirTfy8agtIwdsDAS64K48f5wB3AA0Lw/Ui/4AJB2+12h/ciWjwfKTUw
 51JGEwQEG0LsEYMXYT0DaZJUvhx3E6sotuv30ZIIRFCsDMd5aMQASWPyA0fFjEQXjYk+ZPkfRpx
 PI3RmmSVdhkMcwp8sjDykgfH6uCywdaEQvE9vhe+xKDQxZ+bObwbIbAvajTau3gT4YGJBG6zVRl
 SjiqEI6k/WrAgkl/L9pfJO4+U2jGNnGWUhVhWqZAtjxZBJQgmmfCmjymOl/rgtvSFFfhi06dBrq
 T42Yaj/lbe4S3XfEDrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210149

On 7/21/26 3:54 PM, Monish Chunara wrote:
> 
> 
> On 7/15/2026 3:44 PM, Konrad Dybcio wrote:
>> On 7/6/26 4:13 PM, Monish Chunara wrote:
>>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>>
>>> Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
>>> regulators and gpio-based card detection for the platform.
>>>
>>> Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
>>> Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 24 ++++++++++++++++++++++++
>>>  1 file changed, 24 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> index c98dfb3941fa..48407e47aaca 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>
>> glymur-crd.dts is the Glymur CRD strictly. glymur-crd.dts*i* is also
>> included for Mahua CRD. Does the SD Card slot exist on both?
>>
>> Konrad
> 
> Yes, Mahua CRD also supports SD cards, so these enablement changes are 
> applicable to Mahua platform as well.
> 
> I'll move these common changes from glymur-crd.dts to glymur-crd.dtsi
> (as is) to better align with the DT structure and allow them to be 
> shared by Mahua CRD. I'll retain the Reviewed-by tag while making this 
> update, if that's acceptable.

Yeah

Konrad

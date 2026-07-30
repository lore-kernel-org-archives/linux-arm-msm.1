Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393A63A425B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398407; cv=none; b=plZ6F5X9BEuXkh4KvM+/3cI3U6MM/+8EvYbdYuJhq+U9pgXYzrF9tuIK0jevF1tdJ8HFU4Y4b0PvKyVpnTnIOokTa8SKj4Ga1bZQO34oDnjMb2Bzw6M7qQLQHcTCRHMtA8UDINdKLi7M1NGqM9zAL9wMz5XdRieRSkV76b1JzjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398407; c=relaxed/simple;
	bh=isRfVqCrTeJuXESVbQDgCHVzjp5mrnfEXx8zcVOOmZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlJYLHht/hn4pX7Bl5bIjkON258zoHxKMp0YjOx13Hmp5BH5FlBGPUnIXnDP36J2q7++ZDWpClY5ndzIdXngNuiQG0WJctU6P0GRB/2Oao5Fh5Xre//uw5YAOKKdtkm+Dko0bdIhZp9z/yOQJeoYex46YUFm8zEelsVLz4e9d0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rpht+v6W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gjXBXzKm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rpht+v6W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gjXBXzKm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U7uXOx210575
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bKfAWqKof+fZNEYGEOBMVQlW4vh6V4id4rJXwvfR8sg=; b=Rpht+v6WlOKG5vyq
	Af36mYCM0yxOOlLbzpFA9cRzdkCNEoxHDavwfASIvgdyY/KFOENSsmWW+hIDL7Nf
	bwJHiq98IvAvLDLyMP+p6sW5UQHwE6DZ2QwrgDbQaA6dOKGPUcumpzP0dd/2tNVQ
	UwMiAdT3B+2Swz4f9KMYeA0sxRNPBIIE3jiwDGRySrNX/Z6ZWeQLVy/0E24Gike3
	T8IPG25xzKPOcBI41QmU6w8Ap5T9C/MH2CFbZ5/75hrQgRTgu8me11YYkSEDiOG9
	d9/s07TF4QxJPy23fHcPR/LoVHMyrOsHdOVe9q4Qpw1MTcYO/JDi+G4OrCh5um46
	MNiV3Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr2ntr0fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:00:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eb5f54b6dso17779185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 01:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785398403; x=1786003203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKfAWqKof+fZNEYGEOBMVQlW4vh6V4id4rJXwvfR8sg=;
        b=gjXBXzKmByW3F7yPjX9YPU6dPi0j43jd6cGdZsSy//k4qrRJNAaaL4gyCQqrLuilqd
         5gs2c3s6GheKP/OKeM8ojM6HqGTeQjxlKWHyDVUVJcH7+GEJv5ZegY+YUGv/HUndNDpA
         pIZqBdOAAVxzByJQ/KISJbAeP4EZFCgqci6CC3QRhUu8ASiBjaXZvcjDleg9alB9xgI0
         EM6GKD+o36NaFI31hDjlpFeFITiXgqZZlf3TyveMXgrfvCQA3GlQmd7vDQR0EdKWMdsv
         H2/eob6r6OjEI/uXmMqSRD7zN6Gv7AF3P7AfqV5gFNJ5rUn62PZy7CT0ES7oSrJX6czH
         DiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398403; x=1786003203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKfAWqKof+fZNEYGEOBMVQlW4vh6V4id4rJXwvfR8sg=;
        b=lOQC8riWtgiwCzKifGP4KG8uWnoYR3bJgosFgBsthJM59yNyIe2ep1ECbl6k40PZHh
         7KxngbhdNu2jgPhU3VpTeX2McOGgHkFWiUFrldTN4nRPWtoNZR/UTJZXMEhpf5M5o2wF
         PVhVLKBmRRpkCAusze3pgB4Vco2wJ7qQEUzdMFVobjpjG0zzl/yLM/eYn07odpN7iIEH
         GMgnRjEbLOXIPPCTHwoL/uzk85P56x5tZeXmhQ+jIOd2lVGDmCc/Y3ZjDDsS7NY9Jxxj
         APej8Nc8rWbHI4ZdYNp+hiChw5lYdbvPl4G+bUNleyEVdn1fWXy337EyxefOC0xm76Yt
         cpHw==
X-Forwarded-Encrypted: i=1; AHgh+RqHQiB5ir0F9Xsv6+dYVlltfVm94ekPp5P57pwGiP5NKEyN0jmylV+cBvTLYLCDbxE9wvtV581m4HvvAgj/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnmg9XB410zfwtFyvrWPFNt7/WPlysFjHWN6JV/2YsNv/xbJKt
	QwhEQvHEHirGtKGMHpnEBnT6QtEdpiuTTydjeE1CdHpEt9ZmWAPCgz3FAsJAP7WuCefvRy/pQrK
	d79aPWQzucSydh9iaQkZBHD8fBgsAoEX6ctnHlbKTgC3yG2zMc7vfWSH0yuwMB5wsb8Qx
X-Gm-Gg: AR+sD13ofQVLcJcD9ThdvQ2xzLwPpQyHpVmismrd9lldSaxh4HIgXX7B5XKNPUjvT3n
	/cbsofXQVSf2jqnrkNlNTSzhhPq9fpB2xw8wTLEpvUDBK068qYLhwZgdM9Cn0Y+Bmu+V69wDBhF
	3y9E1zpBlhsljEvw37nE7Fduc7C3GoYvDBf0sI0wPmI1DGxHqXB+sjphwiZe26gNad2WVn2KgS9
	3JR6vA4EZM4kdkmoTS6nWV9W9WPahk98pjBYG6PknD5w3Rw1qcTlbgRgnKPfhIfiMQgZLIS5qlT
	TypOUVHrgaSzXiLnpxEHGRlgEpRRC5AG5vknrMnsgw8/uaNljqaqd+lZH5n2sm0ZGHzjRcdYQ5A
	huinkPpICbW+B2Uw20Ki/cECk
X-Received: by 2002:a05:620a:a501:b0:92e:5ef1:9072 with SMTP id af79cd13be357-934861506efmr199728785a.2.1785398402613;
        Thu, 30 Jul 2026 01:00:02 -0700 (PDT)
X-Received: by 2002:a05:620a:a501:b0:92e:5ef1:9072 with SMTP id af79cd13be357-934861506efmr199725285a.2.1785398402121;
        Thu, 30 Jul 2026 01:00:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07c77bbcfsm278261a12.7.2026.07.30.00.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 01:00:01 -0700 (PDT)
Message-ID: <bf99f15b-da1f-40aa-b1cf-d33d0fffefd2@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 09:59:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260730-eliza_evk-v6-0-40ece2d33114@oss.qualcomm.com>
 <20260730-eliza_evk-v6-3-40ece2d33114@oss.qualcomm.com>
 <ofkvwrvfpyhjflrmbyi43gd4mltrqdmf3pzdvxwitrqshtttvo@r3xpfq3m42ha>
 <9a042817-3a3d-4637-8df7-466ffa380403@oss.qualcomm.com>
 <en6sfnjfh2anntkvwojt23xexkpjov4oiapcgcd4e7sexhdya5@xcohhiftv5b6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <en6sfnjfh2anntkvwojt23xexkpjov4oiapcgcd4e7sexhdya5@xcohhiftv5b6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NSBTYWx0ZWRfX3MOwJki2UjMB
 Ux3ESl8sKv2Gvy0iJb+FqIZ43RA2tTxArXw/sqNUEMmbnIW2YY5PzY3EGrxQKqpwM5iHMWmI61F
 kwF0sFk3vmForgg7wYQtFZB3Wr6vQq4=
X-Proofpoint-ORIG-GUID: a5j-dCf863qqKRF1nTbcJI8tzdeDeaH5
X-Authority-Analysis: v=2.4 cv=AuLeGu9P c=1 sm=1 tr=0 ts=6a6b0483 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=8zT0Z9mGZitViAjM5KwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NSBTYWx0ZWRfXyNw1IEjNkX4X
 ZOmvXks/sgQHJmlkLAHt/xh4PmQuaPYR04xux77HWsxt0n7gsRJE+5Be7EQWIt/rIpQZCFfA4Bw
 aSyzKomWkP1Znia4PO1dIStRf/02HpDkap6TpVZozAxwuy0qdYqBj8yiN0GGc6zz3l4gDgK+P1K
 nw0cZ7NV6LyMNR4lW/0DdnUMmblQ4NOc+nUxo6onIjb+12P8AcKTIemqyskKKlxfCUd+zjK6RFn
 yWRwpjh3x81g2sb9OgTFmYAQxFipg1sHRxEdPq46RLXjZQIQt4o15KQ1GWhN0Ole5RxNmCuSlcA
 cQ61QlYg8p6lLH5Sr9J3OCPoO243U/cEBAFuyF8vg6vPd1zHQuwcgKFiANDCJXOzAWph+pcFAdT
 F+7ZnsL84OykdG3meDAudbnUz2E4hICn+Z1UoPw4Eo2HeL7sUslBulkcjTnEHgsyJNG5eqM+bIc
 1rB/RRi+/1nhuB96low==
X-Proofpoint-GUID: a5j-dCf863qqKRF1nTbcJI8tzdeDeaH5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300055

On 7/30/26 9:52 AM, Manivannan Sadhasivam wrote:
> On Thu, Jul 30, 2026 at 09:42:29AM +0200, Konrad Dybcio wrote:
>> On 7/30/26 7:25 AM, Manivannan Sadhasivam wrote:
>>> On Thu, Jul 30, 2026 at 10:18:55AM +0530, Krishna Chaitanya Chundru wrote:
>>>> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
>>>> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
>>>>
>>>> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
>>
>> [...]
>>
>>>> +		pcie@3,0 {
>>>> +			reg = <0x21800 0x0 0x0 0x0 0x0>;
>>>> +			#address-cells = <3>;
>>>> +			#size-cells = <2>;
>>>> +			device_type = "pci";
>>>> +			ranges;
>>>> +			bus-range = <0x5 0xff>;
>>>> +
>>>> +			pcie@0,0 {
>>>> +				reg = <0x50000 0x0 0x0 0x0 0x0>;
>>>> +				#address-cells = <3>;
>>>> +				#size-cells = <2>;
>>>> +				device_type = "pci";
>>>> +				ranges;
>>>
>>> Sashiko pointed out that you are using bridge specific properties in EP node:
>>> https://lore.kernel.org/linux-pci/20260730051031.20D8E1F000E9@smtp.kernel.org
>>
>> Can we harden the bindings here?
>>
> 
> Possible, but overkill IMO. The base dtschema for PCI bridge includes both
> 'pci-device' and 'pci-bus-common'. So for the Endpoints, we need to restrict
> them to use only 'pci-device' schema and that would require adding
> 'patternProperties' to cover the Endpoint nodes in each binding.
> 
> Since this is not a recurring issue, I don't think we really need to go that
> far.

OK

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9133B345ED7
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151326; cv=none; b=beSeYzJpCuwlrf/Oa8YvJRhMFvJZam/CVpjNi+xJxEs8uS15JTdw5RjEZpMSInwtq/KJL1xCdqqRgVK25U77QRhPy1FM/Yuh5L7KjdoNq/ai+zBC3NStemHzbhqPk/XXgiQL8OwrRI+DlqGYib3uQj2JXOie8g8OUzap1CRK1Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151326; c=relaxed/simple;
	bh=TLKz2tkdh8lJv0J/8XsPsHyNNa+jfSYRbBvP7VowacU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0vIKnZcHH09sDnpV3o/cP5Rn66k9y4eNYe1Pd4Qa36OENMFPUPgDHaeGMPYFYIyrIVHU3Dbwn97G955otoA3Pnygh8i2upjd8AzxnJNfmoAZNKLrsz8S2mCYOmrvrv5a4EhWOmECMX4JZwIyAeuLP9I4e40+v/UE8/AUEM16lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IwE7V5w8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBazTKnI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IwE7V5w8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VBazTKnI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEcI9c391103
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDZ1QP/vNoRR+LJnQczO1bgQpPSvMlsTZ/OLeNftYq8=; b=IwE7V5w8nwcTje2I
	OZ37uUDQMStKiMrdsf+El3KWCXRVVVWnobsmHfhZeB2MnE7wP9AmC2+l380b0JRl
	j1pJV6hBZZH5x4V4KVBnESRPBUNABGhhSnq6BTnD3yBMR0FkCuxHByK8c+CFEHAE
	NxB9k/CPx5LrjGSG52TjGZhYOX1jLwQg9s5mnpdDc1uP79I52nAdoEZrWMLpP5/l
	aIgekA3l2Tk+qQH5hMLuhAyOuwxQ/r/aJllscVCShPhqa1d5PjhRDiFiLofUpdiP
	hdEUuhHUuW3r7qU2CcChvdzUfzJaBiNSg0S7RPca+KGkc8iaLvD+aLkU+ze9zaFK
	MUgnhA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjkxs3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:55:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51cab6f7517so750571cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 07:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787151324; x=1787756124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDZ1QP/vNoRR+LJnQczO1bgQpPSvMlsTZ/OLeNftYq8=;
        b=VBazTKnIU9SMQVyr6SwgRQhqEFM2ayqx253O11k1GNdWARw3e4KgdXTz9b7QR7pied
         o4yQUYCmaG+IQZRmvfb5Sykr9+ebpvrS+orKPy14BzDr55k+eDDMR8N8lOxQRKGvZCFA
         USN2MCzKfyEZdJv0CYdv8QX1RJSchhyBjN4CJccg2JziWMhUuO/96xeduL4dRE67NQ8s
         TvH+2BwED856ikPOYIXtO+BqMH8Zp8zkNXGvpKtrp7C/48VYWAc2r9wM6dwWsdy2rr7h
         vamu+/qEaph2M1W65rTlthw3Va1dHbOJ03PGja2dRR0phUJ2F4s+2yj0IMTrSkLH98Hq
         mxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151324; x=1787756124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NDZ1QP/vNoRR+LJnQczO1bgQpPSvMlsTZ/OLeNftYq8=;
        b=VWvrOGWCXbzhC1nFWdmeKZhqg2IarlAurlz0kWLsWeaUJkt+bC2T96aG+pDv8tLh58
         Y4wS/nWggDPDYnkpdXDEebwYjOSSj4Kj4ErG6HzuaqLiFUwfwgPQ7zLJo3j4ID0qk45a
         KdMnuMkkrivqQjEQDdGbFpQ+DRuR+sSWbdugQwlq5DFO8abg7VI6jihXh68ZxOiAOh4m
         pJ2dVfUPeeoV31Gi5QlHmpyKGfeaqw8I0GFa+HN9GouXCQQyuQDKIfuP5LRDtMi7Y04X
         ZwF5cKbhjUizzdPEUNAn9ECcvOIl10QPnG8eyt0r3Wj64lBPkn9979/fgLRmoWNGEbo+
         5KmQ==
X-Gm-Message-State: AOJu0Yx3yriwn52IrFHW5+blcREm6cxVUE51n/KlPpChm8+TFlmZHXuP
	dIgB3d13xUNKbaHXbhgxnx3oJeL8nIFK1CuJ9kE0+UEAZOQQkv/5Qlwdt0ZB7RS0lX1wTu32sLi
	bE4+6Bfu65bRbsqk4ABozpEhcvK4rkzqv2OYHy4CXAUzbr86HsAT1aHIyRhPd7w359btS
X-Gm-Gg: AR+sD135xT6FKKKYJHdC0xJ2orjKixsgOzGObU37PRMU4qPZlhU7q9hgX/HToaL8+wd
	09DGBVXK56INUgAhJfdhUVmG6yVzJN4n1ah57sENXTy/4J9WVi4Fb/4rmzlhtE6prtR6UaohVL2
	3mKxERfPRYJgM7afATubAKNWBNGuAYXSB2RQPTFcYg0Z7oIM/Vi0xROPBMevjZMA/vZz3HqN2OX
	W1WPA3uFsxnAy1EivhImQWbWhrkaTG8+JdQ0ZDGdAe71PucqsbuZZjBVs8MszIJKuAsHh/E1hCZ
	JLrWLWz//JOTsyD7g+IV9dKmjTEwLLUFTDvmec3bCXe/sjTRrxsY/QkpIJGulTDuAvG1Q/ybSGQ
	O3vbJBPW47zvfZvh9gbH6ExkI
X-Received: by 2002:ac8:7e8d:0:b0:51a:8945:312d with SMTP id d75a77b69052e-52dd4e01d31mr40069511cf.0.1787151323548;
        Wed, 19 Aug 2026 07:55:23 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:51a:8945:312d with SMTP id d75a77b69052e-52dd4e01d31mr40068891cf.0.1787151322798;
        Wed, 19 Aug 2026 07:55:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c38c2fdsm89593166b.45.2026.08.19.07.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 07:55:22 -0700 (PDT)
Message-ID: <caa13824-a26d-4165-bed3-067665075f62@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 16:55:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: llcc: Update the SCT table for IPQ5424
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811-ipq5424_llcc_updates-v2-1-1e4350585671@oss.qualcomm.com>
 <28bffcd1-4743-43ae-936b-9f9f92117a9e@oss.qualcomm.com>
 <18eb2d9f-474c-4b1c-bb57-87c7568f6612@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <18eb2d9f-474c-4b1c-bb57-87c7568f6612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExNiBTYWx0ZWRfX0EX9sN44LDV6
 uD63w6NMN7oJdm0ogDNNOJuRhnNfBevG6OJmRo8Ih03C2dmpI98d9SoWo8zaPFDItR/XQTXR3Ju
 YG7T7Ple3syKFttJjfqnP7lq+4j2nc/dDRiCdIQvPo+kql8+4+Frlt0lbDaSzJySXqjXQZXHiPv
 Kcyy0VNofIfKD+xKf6ZghmkSyuRp0sBlUoWo3UeNZMMm5LeAed/ozCJNpnESjD5FpvUd3evxIju
 ShnbstZbMKILfVc7v1f5SOgTai0mLWsygXjskZhtrYKGlYM5MO5b6jMD7qI/jcl4T0Pri7M3ER+
 /N2NHWCpYzA1/TLRHSilAvrT4JWN3/EkTvMxjXQna3sD5kjHJXf8sPDu9+YgY6lqawX4zzYf+p5
 EweH+/GWFFZaLsZfWFQPf0lGGA1i/qXxHMB0333IExKntLj0fvzVI6F6+DdKxyWrPQN7/31AFn8
 G+GzEKUNwMNwLgVXLsA==
X-Proofpoint-GUID: tJVhIugEtLQhgW92IAqku69w4p8Mc78f
X-Proofpoint-ORIG-GUID: tJVhIugEtLQhgW92IAqku69w4p8Mc78f
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExNiBTYWx0ZWRfX9DBHSZ8GHGzA
 5MsyWuTk7vp9Ci1JS2F1MWE4Dd0sMPpRfk5rYUekq9PcPue84W9KUsxATuCyjBxdjVlaseh8xPx
 r01QSjphNy8jS05YM02PSIlrdO2QbWw=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a85c3dc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=iL7UruJw4oydANBOf3QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190116

On 8/19/26 4:54 PM, Kathiravan Thirumoorthy wrote:
> 
> On 8/19/2026 5:23 PM, Konrad Dybcio wrote:
>> On 8/11/26 2:34 PM, Kathiravan Thirumoorthy wrote:
>>> Update the IPQ5424 LLCC slice configuration table to give the PPE
>>> and Wi-Fi datapaths dedicated slices.
>>>
>>> Assign slice IDs 1 and 5 to the PPE RX descriptor and RX fill use cases,
>>> slice IDs 6 and 7 to the Wi-Fi radios connected over PCIe, and slice ID
>>> 2 to the CPU subsystem. Adjust the corresponding capacities, priorities,
>>> and way masks for these consumers.
>>>
>>> Having the dedicated slice configuration for each of these use cases helps
>>> to improve the networking throughput by more than 1 Gbps.
>>>
>>> Rename the usecase IDs for slice IDs 1 and 2 because LLCC_CPUSS and
>>> LLCC_VIDSC0 do not describe the actual users of those slices.
>> This reiterates the diff, but doesn't mention the actual reason for this
>> change (updated recommendations from the hardware team)
> 
> These slice assignments are based on recommendations from our performance team, following throughput measurements on IPQ5424 — not from a hardware team. Please let me know if I'm missing something here.

They can even be called the navy seals, just mention the reason for
the change!

FWIW the diff itself looks in line with the docs

Konrad

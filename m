Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590797;
	b=CCL9e45PpPyDmdHwPlgodi6DMG0Odd17HBarLDltbk98kczrA7OQ3mvWj6V30FOKNJZO
	 1ritJEcQ6K4T1jqL/kDmpSe+zcby7pleIjzVE8My0vOtGAkHI/IaThAtl3P3fYIN8PipP
	 TTpHvq3sNzn16GMfazgjL120yymT1UbT6A59DbsIa78OCAEFkKI8fJbE0tqFfPBcJgAgn
	 g8IBZVHv00FE+DAI/eI97W+pdE8oSsqJdMGFdq9ZhKSHzPahlv8VkIscYkNYi5s0YfrFB
	 o9tn9c5TY4cnDWDllLnfx3KkrHlFlHSDOh8UIz1YLp1iE+kIJdqy6kkbxtwS9aTTMiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cA3qliSiZOiduXdaWhA7g69m50PQzr3b+HkLCh/HevA=;
	b=ETH14CNutLelURTJELqlx22tdQpU9FiPbsM8VVP3SK1rb6xuZYruCZP++c7JU7ixNMp5
	 mZEkbAGHOSOadvu0tgFEjqs9L+jRSfTOTSuFVEldJqgoSAt/87kNh+nft1qRWm8BpXw5V
	 QKMEpQD50oOZU1Ig7C7OybWRHFfSr1i5/q8WjyPRCRMdXt0q8qqqu7XwUHWOYRTxwqF76
	 cSIEUEyfzxDZE1UVGe78StK8YxGZSPS4DRTy7ZNPsClPVsDq3ppYXMa4G1gbZqB3XLYz4
	 DNXQraVvAn7Z+ymuaO0FSEVH7AYJ5ngQsC0FtvGMFxGe9h3QFShhW/fy+muBk44ULyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TPkk6EX1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDEzQwaK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A99C606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A99C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TPkk6EX1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDEzQwaK
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDmj4q1332476
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cA3qliSiZOiduXdaWhA7g69m50PQzr3b+HkLCh/HevA=; b=TPkk6EX1WQGaj/YI
	C7L0wtDsRhlQPHtZU3CG/xkovzlHbC6Ksv5GcfSlRi/BfKoCgvPSYCOAojzuqxh0
	TYrSHKquaaq8ZwAj4kiRkG68picR23UuJOchkMRHOAbpoqOtvlchOd+j70jURc1w
	z5NSVpq+x9XF0/GyHzXxO4bfCguOM+FWMYEXkVoDeZCy5GkAgsZpCaZ3/baiROXM
	ujA4rApF6Y0c0ZYUpRRyz0UZbTKxuNY/BtjZvNyqfAaXm/+KWnDQ/ASlLhV1OQeJ
	P2WT1WuCI+GgcJGQrm2TOGTu1+g4urBlE5bLl1lk5SGlGW9hdBm7EUyB4nTWCE16
	WIFWQw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajm6c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:53:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e629c7b16so17898985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590795; x=1793195595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cA3qliSiZOiduXdaWhA7g69m50PQzr3b+HkLCh/HevA=;
        b=LDEzQwaK03Z4D3OYk1JHT+i07SnUOmrqE5i0ljGOeTiqkSf01v23RVNqGRHC/IZsGA
         1J/0Nhfu9ZPSTAKiBIpFq32nyRxTNdSJkyZy/s4e+oaanX/5TcTUEs55dfHHy1jVvqze
         1GVvhVYK0Yh95C0UkaT6Ds0sjzA9yIw+kS6KjYpy3lPA1Cb/MexEUkgvj3jzmbx/ICxj
         7rhTbiy2nqg18X1tYpIPgjAkzS31YMcNdldx3TBCeNS2Ib9Ic7NVQCWTGTKB2gNS1iMF
         9r2MBlxnw6Cy7f3NRV3RRAg2hqrbwvyPEqnSwVNbS1agk9kT9fGFOBuTAWLjV5JLahfm
         DzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590795; x=1793195595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cA3qliSiZOiduXdaWhA7g69m50PQzr3b+HkLCh/HevA=;
        b=a1cCLemYFOa/CAnnRIHRUbNnHk3UObsS7XLiE1VnRCDyXv3t3W4dhAS72seXM7t9i7
         snlxsbFz13JdS+EUg8Uqnqi7TEFMJRdq2oDoHzNtu/feYImz2jo7gD/Ib4uZeyhSOKC+
         4dz8B4Xr91RGBU3T843MBKg9yaGFJ8z7GFMUuo3SHPY27AR/oMnPMSwK4nWdSYmkV77u
         y7I1QzdMowWJ9UQooi3mfrIh4WZOY+8Fg4+6OkNRm1rINzTwMsFEkw++1QRf2YsxqWZ1
         0rInrq36dZl1KdOcX227z2Y8+ErvZ3wzhtM9pGmTvk8PIugHsOcQhX4DErOG4ssxXkzv
         7q+w==
X-Forwarded-Encrypted: i=1; AKwUvBwgGNav5CtRaUax0fVueiUxLQeFjXnzhvqEHKynXWw3p7Ir2snDn7408T4gzCfpdTlWadFzKkG24/cUC/AR@vger.kernel.org
X-Gm-Message-State: AFq9FYK1/g8QXxGkXNjTvWxMBooUt54ae9leR9n128MuVuK6aPg50Ii2
	K2xN4i0DvItmmTAKIZMtSFLPw66mqczIjGVmU3YlmOjJFikfY5hMWovhEoIq1cLT1a9sQYHtSkg
	awZsS3bwaV0Hk7DCHxzX2JadS8oEhcK1EwjESrJNexyoFxSN3oTB+HM0p50lNFAJfjbJ7
X-Gm-Gg: AYBFou3Tc5hyIwvmsVF7yREw5/2JNNnZ5NgTTqbJf2mH40EyEj/ruFX+/hcOHFX3B3u
	n9vCbAp5p4osUbVHZqTSO9nPySxC9f4Mj2w1kiBE+fvF6nBPcdHzZOCApMhSx+qg5yRcPGhbZkL
	iQ8WJ+UQElE6l+aalgIFl0ML3l2HLb19Rgy0rr/NwJjtAhOBydzYovfDXM3BJ4cF0cwZN8QNP1+
	IbKIF/zGoed/yv0QdWmp2fba1AUikhT7NLhVgm29pwXroq6oBPtsR5I0b8MQQKNtCUS1MIGCRCm
	m2WyFI0mP8gy075dHwNd0/PtY79kGxRqOZWO90XI7H3EHtO8hLoej1ObBudjJARY680OjM46+Gk
	h4iJ2AoxZRT+litKW2XDeFA==
X-Received: by 2002:a05:620a:2b95:b0:939:eb09:4458 with SMTP id af79cd13be357-93f57f7af95mr527537285a.3.1792590795183;
        Wed, 21 Oct 2026 06:53:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2b95:b0:939:eb09:4458 with SMTP id af79cd13be357-93f57f7af95mr527528085a.3.1792590794286;
        Wed, 21 Oct 2026 06:53:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm884023a12.27.2026.10.21.06.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:53:13 -0700 (PDT)
Message-ID: <b667b008-2d2c-4da8-8b1c-3b24b351ea64@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:53:11 +0200
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
Subject: Re: [PATCH 14/38] arm: dts: qcom: apq8064: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, kernel@axis.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <c1886d808858a195ec78425b293b2ccd3756cfaf.1790892852.git.waqar.hameed@axis.com>
 <f2bde571-89d2-40c7-9ff6-c23a56b3dacd@oss.qualcomm.com>
 <pndo6ctn350.a.out@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <pndo6ctn350.a.out@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX8YsVykBxLJhb
 0t4c42vzVwoytD568Qpgad5fUhseQDdtRHTDObLh5VB8wfEhvG/NO6IQ7bOzeXSeKmv345U7tOK
 JnfYJ2MDPQD7B5ur2/YP1Z8cbOSXpMLAwFyY/3Cp71B62NlHa7+pf26OC5Xkg/OB+Vg1ETSS4vj
 lQprxYAozxZivdnLiqqvABH6TFYbpfhRrvknZaA8ZkaxH4+Mxv9j3ze1rb/X1EC/6mTSgvU1qMT
 Z32A2z9Hf9CKuXxOwJdCK/wIxGwM2LfL3GOEoU1e5UdvPOeIwNgTBllfkPg5WazNQcC/+Bu9Mqm
 EoOpoAKeAcikSGQQTQ+HpdpsluB4N9MTlkwwaUKc5vmLrPlNSqT+vK4nWgRKTph+Yjl+ZCLKJyt
 ZF+R19ljGMpW14StxQPH7e9E7e4yjxQm7nHA3MA+4QMvHfGj0RGi5nd36MB1NVS0SCVDp9l8+Ne
 M01q3jYEWOp7020rNcw==
X-Proofpoint-GUID: kPE-xLqd494Rthk80J4aPiW9F5y3xgia
X-Proofpoint-ORIG-GUID: kPE-xLqd494Rthk80J4aPiW9F5y3xgia
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX82dL20/t6X0D
 osoSpYzUBaM/lwt/PqcdwA83YaMowXuoUOfGHdU9G1twS66jA2/bxEOyKYCUNCUTjUWPZrqMQ5r
 rWDR9IHzTc7q9h8ei7xtFaER7r9nFTU=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8c3cb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3-RhneuVAAAA:8 a=DkxrGzj7WmFQ9Z13Ee8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055

On 10/16/26 4:14 PM, Waqar Hameed wrote:
> On Mon, Oct 12, 2026 at 17:52 +0200 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 10/2/26 12:36 AM, Waqar Hameed wrote:
>>> Multiple property data on a newline should be aligned with the first one
>>> or properly indented with tabs. Found/fixed with dtfmt (Devicetree
>>> Source formatter).
>>>
>>> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
>>> ---

[...]

> Which maybe is more clean than allowing the first string to overflow 100
> chars and aligning others to that one:
> 
> 	clock-names = "corecorecorecorecorecorecorecorecorecorecorecorecorecorecore",
> 		      "iface",
> 		      "mem",
> 		      "mem_iface";
> 
> So the question is if we should either "try to fit within 100 chars, by
> adding newline after `=`" or "don't care about property data longer that
> 100 chars, always start first one after `=` on the same line". The
> latter one is of course much easier to implement :)

I have an ultrawide monitor so we can overflow waaay above 100 :D

But more seriously, between the low likelihood of this happening and
the presumed disadvantage of having to scroll sideways but still
being able to read without jumping to a different (line, col) with
your eyesight, letting super long properties overflow seems OK to
me.

Let's see if others agree

Konrad

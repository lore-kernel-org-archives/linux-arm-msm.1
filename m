Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7F852269C
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168663; cv=none; b=VGVpYWE09WyIWDs/A30P4xp6lnHbHS2+FWIV0WIKdEXRHHHmU9asJYsceyyXr0FEEK+MkwVCkdg3CqaTFMoyJ81TLCWZksxdMdnGY6jisJaO6jD2ONGUZoPi7sOhIePrNmZSJ+R6ngNbfLtqxiuhO5in7QeZB2/rzHlrvcrIp+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168663; c=relaxed/simple;
	bh=jAtUvHOL+UcHTw/1yuGYltepxe1MNq2D2AIdAMygYQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndMjMPg5SEpbklFkU3vL+we7W5zD++Pz0slyeVcDNpXDJzUh/9anzBlg80eBPIr7ivKN3kZlT4W7zWyyUeQnVvgi7i4++InBRYmQGe3vMDTlJzD7eEU0p3uc5LaGIy2CrMRdtE8E/wwXRhIqhx6r/rOAkaZsTEdJ5hRc12iZqxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k7z4xXkA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEWjqfy2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k7z4xXkA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEWjqfy2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBboSi3029161
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SvBLCJ2t9221TW4KYx3Wqjeb6+sRVpVtJ6KavLSqfA0=; b=k7z4xXkA/SZHfuhi
	vn9NYJh5Ahaxe+BXAwR8yjRZxLP4fJO9sswA51eQ1aMyN+KVgWKNMCTe9cfipXJG
	47EY/ccDUuzZ3MMae9a9+i1GRZS2jCa2UuGzOFaTEbKdusyM7JRGBiw78iQkBXrI
	Pj8hu5w1nBwa8GbTiBG0JBFKT3vDC4O0f1lQediXz8QuH8yUMXe/ZkDfyn+Pzzy0
	n/KZk7UWuwkQ0pwQ4PJMqJ25CL1sxzflSMYIQokDuC2W0cCLyn45pZGZs0QdKASh
	oV2Je+ZQvUeM6I+bo6xZ+NOQB+tJByfXS2u/YXRewmqRno/S5O11x+NSHRZJPZeI
	6AHVtA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwarx3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:04:20 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4bb359e69e8so87072b6e.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 06:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168660; x=1790773460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvBLCJ2t9221TW4KYx3Wqjeb6+sRVpVtJ6KavLSqfA0=;
        b=kEWjqfy2G6PvHxPaetag+A1fHiHfnVsS2QSSlwbx0N2I4THTv/wBirtJDvRMuIBICA
         ldABZBPPamygRBT4sGsAEfJBc91IFpGHJ6RENSb1DtaPoP3TIi94mm5bNUr+dcnT5NNm
         1C7/NjyVYIWKCdVkTOH3Q2kACIsfX+p94mHi9pj2gEORLwLV2MzsrRrpJMK+KA20u3U1
         lP1fF6Ry4Wqhj90dU7kZZ/CGO39Fcbm044hQslITRjZJ5K1tyHyEK52bs7sC+Zip0LLZ
         r6O8im6jmd+DsZyJLMmSUKx0Pt448DvVPV0aHeRK8q8I9ODN9PtkcNtASqo10Qpjl/2n
         zjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168660; x=1790773460;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvBLCJ2t9221TW4KYx3Wqjeb6+sRVpVtJ6KavLSqfA0=;
        b=1dmxdBX2W04Cm0/mTsC9ob3IrJeeRyQnTTFvvXl1LTQoKE4KoCKbyuEQWuc/U0MHlf
         ZLZuhrM1qnW3AkZ7uH1AETt+IunpizLfpAu7I8M9vl6k9M3cHde8bC5v+5BHQIuvzfue
         qxqOgMdat1wxjqqZip720l452w5SkGD4exmAOVa6c8k7qCvFKbG+eSzOOBXgoHIUpkuM
         dlzQm1kzQ0zSJz4UleGnIZgkssO2gblrqubcXH2oyVNdUPxRVo0Zbj3sWl4DpSv4kP6y
         7WIYZR/5W5GKUIG8PGokUH+D5JLtdej+RaPoRe6W5pybPgitE/tZhViJrSDTmNuFX2XH
         QZFQ==
X-Forwarded-Encrypted: i=1; AKwUvByuoDbNUdotpUvT6U9f11KYtg+U+TZmpusMgBG/brcdjLzjoSv54qfeQRk/tSKgOIB+TZJlj2Zds8/LkHYK@vger.kernel.org
X-Gm-Message-State: AFuF++lm5FL7YKpA9WmWZ3wAFz6ZNsMA3UF5CSgE+A1i4jkJeeIwFde3
	IlYcrDMS1B74UPqZarqXsbIY4FGu9g85xSkSwtlcsWgEgaNSXyZK3TuS38tDg7xqBGZKdWVYXxi
	4alTAh5JCu+95vOxc8C8t52SBjBX/c6NJre4MEVX994y2Ditj+WNTBLY0Bws859D7EFRQ
X-Gm-Gg: AYBFou1jFoNbamfROejmNvKRVDlfGwGyj5ACEp6TiwO2o5kjSyIzUQ1eJngSwJDGiLB
	pQt72qUKTLb5WDWz126/lxXVdfj3JEzg72bulzeVrrUeA6LHITME29+pqolr1RCG00PCAXij/uS
	UPqN42lZ30eXOaWdAeiK4Z224v+DQnusM8BpkZD2JVAr5cxptEsFA3kpmlkbta45Mb61JRThJba
	cfB0nhChKnzXcaEi9hZrANoLHWHq/+bONzDsm+EHc+QoWFWi63bSzJL3x65vrUvOyADokrQFaQY
	DIzrVNft81PrYAeg/Os38mXvrgEPcr7MEU8PIXIsPYbgTFM+48TVXwwTN+V2vZnWsQ4RR1u0Vxc
	lBM6O5pPsBH6pZmh7rIaW2TGNcDJ89tUS
X-Received: by 2002:a05:6808:10cc:b0:495:d9fc:238a with SMTP id 5614622812f47-4d5b8ddabeamr3350303b6e.3.1790168659797;
        Wed, 23 Sep 2026 06:04:19 -0700 (PDT)
X-Received: by 2002:a05:6808:10cc:b0:495:d9fc:238a with SMTP id 5614622812f47-4d5b8ddabeamr3350248b6e.3.1790168659264;
        Wed, 23 Sep 2026 06:04:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae62dabcsm115627866b.31.2026.09.23.06.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:04:18 -0700 (PDT)
Message-ID: <ab94b4e8-7de5-40ba-9306-03c4fb18fcea@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:04:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: David Heidelberg <david@ixit.cz>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
 <71e04eae-7826-4f51-bd6a-318ea1108c08@oss.qualcomm.com>
 <e4b32a40-4432-40c0-8e57-f5602c98f096@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e4b32a40-4432-40c0-8e57-f5602c98f096@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfX2FW31toxpl/R
 g2OkPu41NattwQBywrJ0upmW+mW9y79chUC00ggtWhBl2bfWntnvWpBlH0JhSJu/WSfzofgKPnQ
 lpmhwyr7loB/TJ4BVONOmniZ6HWQjvD7WUr8viS/PS88nePGd/71xnv96XTkCKgCMYsbK+k3c3u
 35QLYFlBcy8PP3sxl9rqibJSGfpC7KEIFZiCtImT2F+uIP1193KLC5O3BZadGECCakVfgn78UNA
 ZjRAfuJPgTGjLGf/A3JwhFW9GQZdL8GGj4L9/NxRtIjwgs3i5yQlg86fuP0cpYKTPrpIhnA2lpw
 PkTHkvp1OhnCEgM39pcagEye+zTNLa3UAyCJWOywkJebUWcNkxST+pUfwcSgjGbRc2WI5m0oWxH
 hlRiUqZcxNmPyOdd3oneQ8G3t50fxnSd4B9ep9xvniPKfCBPSxpYEjUcBRV8/wGNMpuV4Ca7BM9
 qsM2tF+x/edUt1ar8QQ==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3ce54 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=80cRBlfBHqb0UARuMZ4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: X1DRrwmzV32kEoKoO6zUnJvOVzvory89
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfXxYvHyP3RFHYk
 2I8u1BDzdMPoFfSnPNITSqw5pvse5WBXROseQ4xwmqpTE+Nu+kOpOMEi/cXVMXqOsYo3aYqfNCi
 y5lc/OLVP15HKVHNnkg3kffJFhsFJCg=
X-Proofpoint-ORIG-GUID: X1DRrwmzV32kEoKoO6zUnJvOVzvory89
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230052

On 9/3/26 7:02 PM, David Heidelberg wrote:
> On 06/07/2026 14:00, Konrad Dybcio wrote:
>> On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Introduce support for sound card and wire two CS35L36 audio codecs for
>>> top and bottom speakers.

[...]

>> nit: 'co'dec < 'cp'u < 'p'latform
>>
>> also 'c's35l36-dai-link < `m`m1-dai-link
> 
> ... aaaand **sorting nodes** broke audio.
> 
> Moving `mm1-dai-link` behind `cs35l36-dai-link` broke the audio.
> 
> For now I'm keeping m1-dai-link at the begging and added the comment why is it there, but I guess would be nice to have this solved properly.

OK. But please take a look at what GPT told you below (I'm in no
position to suggest what is best) since the automatic style checker
will probably be deployed at some point and may mess with this..

Konrad

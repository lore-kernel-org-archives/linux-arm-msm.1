Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DA94D956D
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888857; cv=none; b=u0g5Q4I++bh0Ho/hejYOdF16Sj+/KrWePTtp/m+1l9U7JaMgInmRksuNM1JPiFTL001iOBTdRrD+h4mtrCtMlfDVoY0Z40N5BywSyzWiBNl7EYSea97YNSFbipCPa60Ixc2C688RSD2qHXuK+jd1bnNt5ny0fXqf9YxInivKfU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888857; c=relaxed/simple;
	bh=du54ZCSpOjF0PwqwOCFaG0DjzSR9Rf64mnlvaVFtKHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+wRIv8CNAW33aPJy0wGrMS3spBfyCnVyw8V29QDp3rwMviL2FqqP2X+AlJqyWxPDZuXJ0NAA3ykJVTfVwV3hnI3dNGgYB/VFxIwBQFOhZ3crVlWLHIbQzW9cIlrhQnQCRxRncD9ZXPAqtLcLYJG/mMMIwYfAxudY5h/ysOkzLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0dQ5vKB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKZQD7rP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0dQ5vKB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKZQD7rP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CWFs949569
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqVI6Shzor4tZDXXHye8jWAK245ckJFpWtODLfywHWA=; b=Y0dQ5vKBnEF1RQJR
	heApgmIEPAVPIo/tTxiW+kdDcPiNl4H1cvd44WvGQrIjWNGykMQGEj0HGk3Wsxov
	b0vCO4+yB3AI0ZG2D836u29qpR4iOHEPHIR8gLfh/d6LsiU9nqVP2ifenfVlKPl+
	K/zXIOsq/GHPgCFezdKyf8k8EY9UAxLCL0u67qf46kAzxs5v1cKkYkV7Q1qmDpmU
	hMFHyau2H1D/HBmMdfULDTZmGmpVy/NS+uWNflxTXoM/k/x2D4lu7qwt90YpkJWi
	x0CduRPdV5x1qYCTLq+j0t4vqGTcBrJpn/KSAXrE4421zN6CkfnF9KQEWsmLWOSz
	fBLlCw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f629666-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:54:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5352eb4510cso4497621cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791888853; x=1792493653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqVI6Shzor4tZDXXHye8jWAK245ckJFpWtODLfywHWA=;
        b=XKZQD7rPh6XnsrPFyhQWq8ckJU5xY9AD1mC3HMob3t3s1xDU9jUbqqONA9IJKOmNZd
         6OCpnSOSeJH3yLuQxLX5iJJJhi7htqy8zzzXidif1ikbz8Dh0qNgNjWvNlOQtOC8Yw+/
         N64gVk7c1pz0noyzGSShIKpUKQMtJBhHyOiuX+CGAFXWGyt7zEFcgShVdZ6+6/XaGOtl
         okO3uym4sU+xReaOxfBgQeGHsZkPVV3S6x3zAzJF2aq0fEe60jw7JrNrjflIxPWC3PL5
         xhtwzIDnpDQZBidk2iw45nqHalJseQqUG7OhlqXfJbdgpticesgge5yGIi30lFMyrpRU
         wBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888853; x=1792493653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqVI6Shzor4tZDXXHye8jWAK245ckJFpWtODLfywHWA=;
        b=LJg3lTLejHFs7pEY2fPXE2ZClzM3oGkO9FfOvBQhqHPG1rGkE8CnFy7uS0oQbAPUyO
         q5FoLy3icCTfj3W5wh+dAyicvgRNmfuOBP42/x/Y2KnzrIJAQruzfLSImCJ82ixEcpxJ
         hf5RRZMqu/dO9s/Ak2pdYqb81hlMEatuGDanezNbT5Zql+JvCCRzbRzLhTJpFnLhZJli
         5+ZlN4hjbASRCcMH+x+qjMH2x2cO/qvu8WLaHzMemlSSs4EpQ40EAk9rScfRFpgsQfFy
         MJz8XAjVBToeNQfq179NisifNIJ3GXnn8xcCglEg110HD7JIQKOWvQisJZaAIa3iRAev
         GDMw==
X-Forwarded-Encrypted: i=1; AKwUvBxxUnmtcAN78Pp8qX7DDALA3HKlDVeinpu7gU3YfiyrgV1i0LPyFEmd1pTF2K/+5n+WJaYtwRMlqHbAN1Jp@vger.kernel.org
X-Gm-Message-State: AFq9FYKnzOX/Tucxk+nfxlwqg0pyGyltVnjJjIa1Q77jF229CYeJNDkA
	sjooy9QHODkD0ZkOZyNRjl5EKZMtDThBUPt9qvL7Ejgp64y9uceOp5HNXMLXKifkQmj1luzOaWS
	SE9oP1SzEUvy5+Sd5/dWFOBKJPyvg0PmB/t63yk9vG9Gw+69D+jbhX3hU3x4FcobDUCvZ
X-Gm-Gg: AYBFou2SFDYk08gQSurYGqzxMIuRKmQYjEJifJsccIBy3YD832707JbGE/9aJSWBKmL
	KVd94ZWveTz1VVgtj+3LnUCW4ixGQoPXcXkDxv3alxlNnqIjM8QrGS/4tWnglG8Sg+gwPcRva5x
	QevB23XKPlq+zTGMlLxsOOugdffQpHrM20qDUvUgxN+ErT6HPkrMFf1pyeqNMMdGX0IVak6j9S+
	Ruia+RmIRDeO5XfYNa8rOvc9pWITMFyQRbgNoaSgHJuuOTidVEW37DZ0nA1X8CjrU8o6tf8YVhP
	b7+d/oAAWNstWDUZDWhBEIDcMqZ6a3ijQfBNoq9LOlfapvuB9fxbRCZLFDEy9qjKqyKO8fCpTBB
	9wi35znZSNmu9pdqjvCy9Gg==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2381552085a.2.1791888853274;
        Tue, 13 Oct 2026 03:54:13 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2381548385a.2.1791888852789;
        Tue, 13 Oct 2026 03:54:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ab4esm570186466b.29.2026.10.13.03.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:54:11 -0700 (PDT)
Message-ID: <21f0c2f7-48a5-466b-9dd3-170a04e3af9c@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:54:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Yin Li <yin.li@oss.qualcomm.com>, Ben Horgan <ben.horgan@arm.com>,
        Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
 <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
 <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
 <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace0dd5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KDyaIH4IrjeDIlzbfNgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX/6HjEMB2smut
 KUgp9YUU14lWJquRCWpTWfDnLBZZWSgTdX62z2DaHlto/X8wAF9CEIwhQj/A9vd8zmJC4Co7DMc
 D+bxm3noZ7Xp8Tdx3/QjA6NFHXqfONg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX4TkSoNynnDMH
 9EMnYCBYu5WYynB7YSXxl3tyMjn2r6Giq+WpQaeJSyL4bzWcw5WJBSVCDo/Vgxu8gkji/NnyHb1
 e3ndlNCrVOWFCcqKjY+K9+Ui0DpaBD4znC07mDvwOEfLgP1SCQqNAHdbs+Lgl/Q76CtcFr10xis
 xWU+rEfGWRYFAuUNrmP4QZ5dCxJbB7C75B6OGgeta2EuGlc7av8oljRWvuzCpSYFAbDfr5mMvzR
 Q6Nd3Gewo1xtP0VIIH7T9qQHogAu8fMHIYx2N3aZs8kABT1bJLek0cX6yq57/oYlOmicULQ6yj8
 VFa+fUxHGQypTKj4Yn15+tkdKNYSe5hhIlcyvhCQt1VemQA3twjXEEqB3p5M1gzx+bGGnJAF6wo
 +irs8SukajuGCHzHFXAvXFYZ72TmmJKCrml7TqwZYKYQVDRIx2sHitYBduJc5hbXade7q90kLRA
 xvsXIX8+sza6bTmW6KA==
X-Proofpoint-GUID: mmSV5L0-JWFoPyikC4lo1dVPphXSZAsn
X-Proofpoint-ORIG-GUID: mmSV5L0-JWFoPyikC4lo1dVPphXSZAsn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130043

On 10/13/26 12:13 PM, Yin Li wrote:
> 
> 
> On 10/12/2026 7:27 PM, Ben Horgan wrote:
>> Hi Yin,
>>
>> On 12/10/2026 11:48, Yin Li wrote:
>>>
>>>
>>> On 10/9/2026 5:00 AM, Rob Herring wrote:
>>>> On Thu, Oct 08, 2026 at 02:41:17PM +0800, Yin Li wrote:
>>>>> Add an MPAM MSC device node for each L2 cache. Each MSC is nested
>>>>> directly under its L2 cache node so that the cache node is the MSC's
>>>>> parent device and its CPU affinity is derived from that cache.
>>>>>
>>>>> The L2 cache nodes are placed directly under the root node. The root is
>>>>> the root of the physical address space, so each cache node only needs an
>>>>> identity 'ranges' property for its nested MSC's 'reg' to be resolved to
>>>>> a physical address. The two caches use distinct node names (l2-cache-0
>>>>> and l2-cache-1) since a cache node has no MMIO unit-address of its own.
>>>>>
>>>>> The nodes are disabled by default. Production firmware does not expose
>>>>> MSC register access to the OS, so these nodes can only be enabled on a
>>>>> local test setup where firmware permits direct MMIO access to the MSCs.
>>>>> This DTS is therefore only an example for other platform DT authors and
>>>>> is not intended to be merged.
>>>>>
>>>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
>>>>>    1 file changed, 38 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>> index 131fd2a16c54..b1dcb1e9c570 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>
>> [...]
>>
>>>
>>>>> +
>>>>> +        msc@19870000 {
>>>>> +            compatible = "arm,mpam-msc";
>>>>> +            reg = <0x0 0x19870000 0x0 0x10000>;
>>>>
>>>> The MPAM register length is 0x321C.
>>>>
>>>
>>> You are right, the MPAM register space is 0x321c per the specification.
>>> Will update accordingly.

In Qualcomm DTs we tend to use the ""how much register space is allocated
for this block"" rather than ""what the last used register ends"" approach
to avoid holes

Konrad

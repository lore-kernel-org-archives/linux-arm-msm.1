Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F751C5F13
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786518973; cv=none; b=rnw8p+8/He7h1rjVjxIn49D5AtmhcND3Bkld+IHaiDQknCj2TG1qD9IUnoX6l/VpI//icOPcW2lgSkRF3XMqDwYUXp2JJ4JpJ2XJwI/QEg7drfKyIXda7aWfBE9kmfOzKgBy+xr35PQVCDcp8vfclfXKzc6VoPVmzaT5KTRYGyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786518973; c=relaxed/simple;
	bh=i0D4epZ0baKdSqsNsRJdZ8Ja7hyubrx3kuJfwPvyfrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vAlWN+4Ljvq1yA/y9Sw+j3klflgQKvKjjpyyvkir2FepT1cA5oAd69oIHdr6H5+r0ZiyZu3pv2pSMXInak4vNDqMLdzzjgr93muNbkm79tW91mBSmIC0hRiqw6SfMVpoJreVaVacFzMuYRjmTJM2/KTeOx7GijQ/BCZft8FllY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TsHst0cB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TYJhN/kB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TsHst0cB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TYJhN/kB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C623fi2593311
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2P/JGMpf2TsBH2XXDsN/J8Ig74olYysC6bSTdQJ/P4=; b=TsHst0cBI09WkqEC
	gYSYKlGSgot/mEXSK5qeh/AE9ecAecui1SFFTA5kiTNJHvqgyeWdXIBGrtqruDUf
	N+rrkJgcULoMLrA2Tw8vxTIm0oZZ0buqWDkOmVRHrsxKhaLR6e71iSNcCx+wnfst
	m5Lweg2cYZ0qgpXfBUC+fgwUyKpKb1em2eqZEOsoqxqvZVT8WGkdvIPu4/EDY87G
	KAWM5eHI1WGCRAGf2h1UifSRwow5yIxeHexWVQCfQ/yEhP+As79c0qiTSRvHeHZK
	rRxSHGhaOxPkkDwuzmyjNNGoAFj0mCVeHc6Vs4d/9PoDHC8i3aBTVVzHr8WN6FCE
	qI91fA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08jrjmjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:16:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dff6253so16987395ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 00:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786518971; x=1787123771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2P/JGMpf2TsBH2XXDsN/J8Ig74olYysC6bSTdQJ/P4=;
        b=TYJhN/kBEl5ObX7LAGY8i5sFlhmqZMP4A53nNIee4NCSYr1RAgU0uBfG+3ocgXUN/U
         QR7l5XM7L4xU5Zmw6QO6A5+LlGbIdC6FXP/3N0r/2bP5aJCdt+j08vREmKCSHvZnCvOY
         iTTeGp/PdVbvMLdg/Sfw/CsFqrX7xKYW1eqG+GRbxXrgMGCPWIo7Wxhoi/gCfh1dWntu
         Lo8uP82Pj+X1UAB8CfwjcOe22cD5UkgmvYIYoap+j5CuCTF4o2VboGxQfQmzcY7z/KV/
         y57fPml1GtKH4au0e9S7NePdmEbAe7tCPXXx2K4QVbKhaLi86eQ4jr2wHWY7yj2rn10P
         L37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786518971; x=1787123771;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2P/JGMpf2TsBH2XXDsN/J8Ig74olYysC6bSTdQJ/P4=;
        b=YDJqklsFMkOD1JOJwenN7zhdlPbnSvQiVkyko1Fi3UO9NdGmn3xUmUtoHU8Atum4hF
         EO/NoKfwxDmeiTFCTXwlqZW5oWMKIPcpljxVYS69mnca/r9oBujiWhpQij7hCHh7YLMP
         BmCwMsp0dbYFipJNdDTO3Dylb524SCFNSDwSpE/QCCsLaq2+4Gg3MaWslYWYsKuE+MI/
         VVCUhWufVniujOwka3kEo5k6jKs4Yt1tORnAfNYvyXKJXdeyl3BnSjrjm+2URecn5frL
         617+qJHXESY0ijb9gol17CY6rQI+HrE711x/4HVyFYucUSXJa0N4rfyJzwK1CUUHFWsb
         KR9g==
X-Forwarded-Encrypted: i=1; AHgh+RqUoa2Dv/iuEGTRdMdMoho/r3OUub4dGxc+KxxrqxTtHnCW5BzZQVnZX0/SG0GCAL9EAIamEDfautCiGBn2@vger.kernel.org
X-Gm-Message-State: AOJu0YzcRMSFAB1taMQtlFverKci3Wu4XsX71GLPbKYrO7Z2FRDbz4r/
	oCqimKANq3VL+8SclNoTDZiMQDbvNM+3oq6hLBCNnVbf90eiHa672qxlhurnV8jsXHtCsapCPQS
	nb2bZLL5lfBqymIEYGiwnpRjhppL4ic8Uio04QbHdLeeF5eFOhNTHAWMF0yL8k78RHUcX
X-Gm-Gg: AR+sD120vnGtU43AHawiHgkQth+HSnSHCZHlg5pTqATokFHGKZ/D9liabRBjDubJC04
	z2QnOFzH7lq3tlqyIV1LBJEDTeDZNwDlEozZrsVMDLaDgDdW4O1csp+BjrNS5MBvD/XuqsC6JIU
	hEI1ZK+NHf+48OVDiRMwTUcbIj7Q9wQ1XMTzsFcXp1jxVGu9DNYUrsArn0wTqnnlaEKeHCXHmpr
	bwj2c9FEHAzt3RbAsGG4qqO15xisgT4OSRx53qnEA+U9v3o3cSsUxjw0Rv/4+Pkf5j3SYZ+tFV8
	7gXrGyrsFE8SHEaHV/bIzZw1yVAGyEg68tAbB8/7tmAPUsfgpszI0GTcpq6NgRZ+9zY1scuavke
	M+0wt/jpTMPYo208E9O4Qxk4XXwwnAxXuZF+m26d/+YqlGPTQY8ikvxdNxOgQqybUkg==
X-Received: by 2002:a17:903:1988:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d32da51aeamr72286005ad.10.1786518971308;
        Wed, 12 Aug 2026 00:16:11 -0700 (PDT)
X-Received: by 2002:a17:903:1988:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d32da51aeamr72285655ad.10.1786518970884;
        Wed, 12 Aug 2026 00:16:10 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3521a3120sm2413285ad.52.2026.08.12.00.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 00:16:10 -0700 (PDT)
Message-ID: <1c260f20-711c-46a8-95f7-c03bccc41222@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 15:16:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
 <076b0942-7e1a-4a6c-9293-04a7ff77abcb@oss.qualcomm.com>
 <5a8a773d-5fa8-4e93-8130-2b49997691fc@oss.qualcomm.com>
 <oijzkh6xykig4vufjsxup6xg3mohgqcyhc3fxaimxbhqbg3niy@2c7tgkdk7tm3>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <oijzkh6xykig4vufjsxup6xg3mohgqcyhc3fxaimxbhqbg3niy@2c7tgkdk7tm3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k5lGw73Eg3nC5wZRHW8mZkIhgvcp6dph
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA1NiBTYWx0ZWRfXyToSEQOPdePw
 l+I4MNuXjqpAf0fRtYDixsxCE9M60WZ2oStCqAOXbV4vFBiCpupD1VKgbw1Eh90VS+/Z0aWxFG6
 p+MSvXcWVzcHZd50FHmE2UdHYa5rOaw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA1NiBTYWx0ZWRfX4/3Hbzpt38/0
 XmCLuV9WSZy24ihdqlvzXk+Bkc1+mrk/8oQzFIaMj4+7OLy2M/NTZKaXzYjH3VW/V/mB1WOmUAT
 U4kB3M0qi1OzkSAP4W7uHDynzBy+2L4lQYz8Sswot0OoOHZcPGDhwyYIPBzYDI2imhW9o32AgQR
 quLP5br2WMmj1d1U41r0VkCF7SLXFP/MEsIUb2vGAsP9H9QjjgPuQrm7/IJKjMg1GlJq6ZjKi8k
 OMZVlpTOYoieY+mo6zDd4UzD0DUm+9lS64B5RaolhfEv1dWioVneVHHq+L8w+QK7iNzgIoEr32S
 +f1c4D5wGU30zHGDiHXcmv3f5wm3zFexNo7unOc6aMwuQz2jdmFeobSy0E1zPZyPkVCiHfhQorV
 glhdcJn2EC7Ju6Nx3rCCjyyRrvRkQ2yPUBQualHo/PG0+aaE+ed6cU98RRt3o/8GwMe+yQTWNeZ
 HDmccpJA2EsZgNudpJg==
X-Authority-Analysis: v=2.4 cv=Z7Dc2nRA c=1 sm=1 tr=0 ts=6a7c1dbc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=iJuzQYvAr7YxkxZwkH8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: k5lGw73Eg3nC5wZRHW8mZkIhgvcp6dph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120056



On 8/12/2026 5:44 AM, Dmitry Baryshkov wrote:
> On Tue, Aug 11, 2026 at 11:24:13PM +0800, Jie Luo wrote:
>>
>>
>> On 8/11/2026 10:00 PM, Kathiravan Thirumoorthy wrote:
>>>
>>> On 8/11/2026 7:06 PM, Luo Jie wrote:
>>>> The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
>>>> TLMM pinctrl; without this the pins are left in their default state and
>>>> the bus does not function on boards that enable it.
>>>
>>> Should we move the TLMM definitions to the board DTS file rather than
>>> keeping it in the SoC DTSI?
>>
>> The MDC/MDIO pin-group definition is SoC-specific. On IPQ5018, only
>> these two TLMM pins support the MDIO interface—one for MDC and one for
>> MDIO—with no alternative pin assignments available. Therefore, the
>> definition can remain in the IPQ5018 pinctrl/SoC DTSI for reuse.
> 
> Is it expected that the drive strength is also common to all boards?
>

Yes. The MDC/MDIO pin configurations, including the drive strength, are
identical across the IPQ5018 RDP boards.

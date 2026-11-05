Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874275;
	b=IcHzORemH3PnYk8JagIxLs54gEgXz0FAFBARYADwWwD9Oqiv68lXvG64rhVHy7eiu6+Q
	 w75+QcNbZtSDsJESRkkfcsuJJ33HPv56qlFcP0eaEJSbhxAg+tZvAjQNrw7s3vcPloFWR
	 +ALSUW0S4EcfuX74hSoKKNiv6nrGEjjN+qVFDE4VaHGZRK5xqBBOnvD7Ixvil0DXxbAue
	 /HSlVfEG6MajXCbYgNFyC29zbb5b8Y+MdirEldyM+d+3B4+LWFTj0oVEPssSyhiMoVrpR
	 gOK3emMiV0uNzlzWxtCdvQbXxAD9Z+HWHq1Pfj7pFUTL4X12n4EZtD3DR1WN4KkWkXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874275;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dqJ1q1DQlaCmrIkM3Jx1h5lt6fWjwqz7XYSUxKV3SbI=;
	b=tv3hI9L/u4aPLk80lJMSE3sq3nSetyyzfujWDOG+8n1FKd6ak90eYWtZc+ZX2gvH6Mzo
	 2zLdntDMRqBwKT2YooiG/JLgDQoEKR6pnnb02F5K7gEq3ljiJ8kZuJ2Elz9VWdSimWdgl
	 U5JdB9TvXHJk3YYD5mhTE9o5W+3VYSLgJbBR107dXMMfmHflhx70g12EpPK0a/O6vbZae
	 Pl5/rl11HfkuHrfCivnwT/Q4Acr1iXBT804Lrs0Rhtu6R+eStwRZs0eci0QJ4aOHCji6f
	 tumHp6geA0KB7FeAqfGYgdVwt/YQZ9Z1Q0XTWQsdzSn23NS45SU7n5ohbjDzIMZIGXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z/iQnr3E";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CXw5y1mR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE39606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 10:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BE39606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z/iQnr3E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CXw5y1mR
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tTEt4084601
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 10:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqJ1q1DQlaCmrIkM3Jx1h5lt6fWjwqz7XYSUxKV3SbI=; b=Z/iQnr3Ebg/BdsPe
	DTEbDUq7ZhblP5itLN8zCYipNOVPYLBtvUgL4Qwb4/fQ+5r4iKwFweRFJow18N//
	Z36evofEUlMKD+o+mrQTuE9lxIXuWKaq+wyBDTbEC0SjHvxg13uQ7TmW/h8bos0z
	O6jvZuL1B/Kc2sqaVcxNN41Zs9fh8GN/a0qgmnSFSUBYcvb5dARVgnALkafLEZ7n
	t984WvUmsRio+BQ1PwMI9YbojqiV6Ea/6TGJm68xjE3+/iviRy3xn1Ec2IGjl2JU
	J5yrZTBBUGw1DTbHLUkxO7nUqsub5LwmkA0wte9ML3/vgx4z3In9fjIhTD2Oh9Qu
	ANP73g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkr4ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 10:24:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so3133863a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 02:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793874274; x=1794479074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqJ1q1DQlaCmrIkM3Jx1h5lt6fWjwqz7XYSUxKV3SbI=;
        b=CXw5y1mRI3f9WTkJStBFEZNSVSv3+TmDyeasvF6SItS4tsxB4ZQItHzvbohF9dNxeL
         oocK6/KELay7XWDgYcd/NtmvPIPrZ8tADtsyNGcDZLQoWZoYqUgNb/8nhR+3IvoMftLg
         /99nUcBDqdZ3NQX+he8vJcgGJxLQW+ieHbfFjrR3kaFuamjrGiXuVFvqn1vAQeoI55MW
         uQVUu16CtNMmjiuQvAkrrAaIrRYc3ZkWxHAuhhXr/5GJLzJQrd7ec7n8FFpg/urPYhTH
         HNn3JN25nUlBZEkyY2rvmvtjUb+g+kapApVQhvkMFt6WRMBvrbq7CFpWjPyVJaLZKVbB
         EFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874274; x=1794479074;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqJ1q1DQlaCmrIkM3Jx1h5lt6fWjwqz7XYSUxKV3SbI=;
        b=DAOKjTx15bqMj6ayBzLVLWQ1biEk2k2+ab74FxUQj/aSby6ee32znzy+AMAUf5gLNE
         fveqfDkogreoQJBma6h6TyKBoboQEq1rfZnOFa6io+OSnROCls3Rs2zM5CgV82HNzOS2
         M5XG4LbUVrA2v8DQI7oYbX8h3Q3iwviotZ9qfDolFAU8R56bfxiaA+NJ6XrEryh23PZ2
         HJNgCBYP6i4ec/kfpxF+f4s4wwaGa0OHu5I5MDnpHt7j2eypQsvvEEEuoWcFYKg21h7Q
         Bihm4kRBiuNsBcjZE3e22Wj8TgDyo24LOgE7JCR/JZJXKbMAeENm/2pzpBjhQdqD8JQ/
         qkLg==
X-Gm-Message-State: APuU4Z8aBTCC+bG4iVyzCE7P11N6cMT29bFa01S22LQtpuJkhQ3fbrS9
	sdX3cCO8S+I/+JctBQQ9DLBp23qzSjoOJ12CSNi7FYkL+Y2r7z1VPf2y4Lp3fd4h4H2Gg3xmOCg
	25+cy6K1H+kF4cgROPsz9EgJY/eWgHV6XXLP2m8ayFfMvGHiAWaLB6MjHW2zl9BwSauL9
X-Gm-Gg: AYBFou11m8m6I2y+P2fi+vfhMRII3qQO2dcPR+Qd7Sf8WHvbxr/meV0mcSz81XPxNWg
	ZDxXWObeKORXCSKFC8Ne82EVnYfUnxgpLo3iJ8/n1teH6GEYpYDHGOpQE9hjHBLIx37vLMxwofq
	fIiGmpNrWRrq4yPw06V+i6AcNVzZ/DuFibX7+Ly9RzcFreMnMhvQ6w4l1Kl4vEBlY3Fak+VPdmG
	nIBfPEoZ40t/34ggnGU0Maq1gzjVZhRaDZE8B61tQzWBWdGW9iGs3/USpNYwtdS2sKMeyTi1rO2
	0lDy+Lz48g8iT4cq5QON3ZV6nc7mXagdMaI3R0wYMIpZu8h9GlJE4UH5tucSJhdRNxNMz3PwBbV
	mDer8SzX8I7WEQ5hiJPd3A8unHRxCGJMfTzkDadRJvmjBYNiB2DGk/fo/t5w7Gaf8d6NzX49Kyd
	pjJtQ=
X-Received: by 2002:a17:90a:cb18:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3ae897eb520mr12487825a91.10.1793874273358;
        Thu, 05 Nov 2026 02:24:33 -0800 (PST)
X-Received: by 2002:a17:90a:cb18:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3ae897eb520mr12487817a91.10.1793874272947;
        Thu, 05 Nov 2026 02:24:32 -0800 (PST)
Received: from [10.218.25.112] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094dec0e3sm3488352a91.1.2026.11.05.02.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:24:31 -0800 (PST)
Message-ID: <9a6c67a5-cf3e-4ddf-93ed-87f0d3dead70@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 15:54:23 +0530
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
Subject: Re: [PATCH V5 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD
 Card via overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
References: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
 <20260826112456.482982-3-monish.chunara@oss.qualcomm.com>
 <cbca4156-a461-4d01-9576-352f719016eb@oss.qualcomm.com>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <cbca4156-a461-4d01-9576-352f719016eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfXyF5TQdVFRcbb
 raHzg0wRztgMR6BQKEzddE7mhBkdRkP1orkymyLGxDLNnBpFezHf8/yPu1mELVu9aK/Rms3oTv1
 cZKn7Gmk16NQ0mgaelBsM/kmmdqehYT493KI2o1Xa53ZVPuRYVCKzKzIIMsZHXeZJlr0TZdO9Og
 X3VKc/JZK8aaacXt3USaeMp9wQ2yyrlb6QlVmzXMqhAF5zI9y6a7VYpMpw5rCmeKoRkOQoVXdXP
 r6eEm+SJlvtt2gmLibXrdkGQRoRiK6/NWV5x4sVqmIfYuGfxQk3X+95+aBixpMxu2dipBv5CRqE
 Nc2I6I8QCdOhdkYy/8tEYQz5HlSge1SWppNOsqUq8kPZDMZrB+5Rvyz1AfzphrUtU25abTSOArf
 o/WhCtEtnZUC3xqT1j9s90s+R3iy5s2KMIhKgM3q5Tczs1tmha+4xOapk9dUou85iaNqPf/333y
 4/f43j8GG+J/CjiZVrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfXx6A42FXpHCDO
 qi8TMg0kMzt/oLw3/pA04CwFUiMOwGpnH6nzSg1uWykkaHR6rgwhFxCsx2mNReaMEZ2rJvYp18t
 wgx10wCYd3vN6E+aQ0Tanccle+7VXFE=
X-Proofpoint-ORIG-GUID: jghyhtpLqG2Wyb5h-Z4VGbXVzmuet6T6
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec5962 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7PiysLyHAn3Bg6R4OYIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: jghyhtpLqG2Wyb5h-Z4VGbXVzmuet6T6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050041



On 02-09-2026 21:59, Konrad Dybcio wrote:
> On 8/26/26 1:24 PM, Monish Chunara wrote:
>> The monaco EVK board supports either eMMC or SD-card, but only one can
>> be active at a time.
>>
>> Make the base monaco-evk.dtsi storage-agnostic by removing eMMC-specific
>> configuration from it. This allows storage media selection to be handled
>> through device tree overlays.
>>
>> Introduce an SD card overlay that enables the SD Host Controller
>> Interface (SDHCI) for SD-based storage on the monaco EVK board.
>>
>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +&sdhc1_opp_table {
>> +	opp-100000000 {
>> +		opp-hz = /bits/ 64 <100000000>;
>> +		required-opps = <&rpmhpd_opp_low_svs>;
>> +	};
>> +
>> +	opp-202000000 {
>> +		opp-hz = /bits/ 64 <202000000>;
>> +		required-opps = <&rpmhpd_opp_svs_l1>;
>> +	};
>> +};
> 
> This only adds to the existing table, not removing the existing
> entries
> 
> Based on the previous discussions at
> 
> https://lore.kernel.org/linux-arm-msm/de10ed05-a0fc-4f84-83ea-8810270ff2d6@oss.qualcomm.com/
> 
> I'm not sure this is intended
> 
> Konrad

Yes, this is intentional. SD card only uses these 2 frequency options.
The remaining ones in the base files are for eMMC and woouldn't hinder
the SD card functionality.

Instead of maintaining two separate tables, the common one can be 
utilized.

Regards,
Monish

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F003A545E
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145827; cv=none; b=ia/2ftjeWst+UKea1g1aE3AGf3I0XCPgdLUIyo8QeAUa720PvdG57zVWGBXleij00z/Z6czy0+65SIRHHUKHaJaFJItQjvkn5A0Ag+J6W+GmvLSTh7oce/gxUASPXUkH4qKeB893dB77sDx8r3UzUf+/qAy1vFUAdV2Dz+gv3Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145827; c=relaxed/simple;
	bh=8zEwHcSWYL+PfZ4t4xdDkAMyQ+XUHLz3oKHb9rAeYm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TjIUfmlqMR7VubiR24X0luC9ai0bXODN0imr4HLECqvcUTnePo0yz6J6AtgJybNsrbqJvUepKS1cwPfChfXkrgpufi/SWC1qdegR7dV9Pp/v6dAfoazyP4pQdnx1+nHmYOS/mhSlZ1o9393HICrJ+P2Zp3fAU2R3IhhsS0FF2zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phx23G3q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BTVWBAEA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phx23G3q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BTVWBAEA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0WqM4136800
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	esjYOP0cHWLWtJ/S0JzZjMyOobiP2YG5+HUVououevY=; b=phx23G3q36vzMkjD
	VzSOvzfRbKIAW+NIz7GVj/qufa67rrbVOaMgGYh5Vrz/zqSJprH2dHldiPQRoFSW
	sL/UvxndBrdBv4jcC+3gdRO+ib0m+i66VpURNp2yiEQa1txsI425LCh3WG5tyiXx
	PKYaXmLaDUEUreD2ZIxm/RmYvnARoQYjAup3yKJ+rEan1pc6LEdDWR1e0VBgh94I
	ecdJaJYTpYdiw0msc8AQo+ddKlmh16ekSYkFtzXqh7NANfW3C3VJxQbf4v5ClHej
	epJIqB6zEwGILuMhCWFzoywy2kbxqPQ9xIX8ePXSmygwIguQuVx+ud+uZzDwD6DW
	Qm6OzA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yffkap8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:23:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so2065030a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787145817; x=1787750617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esjYOP0cHWLWtJ/S0JzZjMyOobiP2YG5+HUVououevY=;
        b=BTVWBAEAMJEUl5K1c+3RlvrL+3+c5q44sIgFKbwh/cOqd16u4aFu5q8ehi9yfANXhq
         uh9euFnAK9WbELckH0OikbWN4Yp+HU+xxaraz5RlCxxFYSyKerOhhbtoppV6vITwB/W7
         DK4VV1CPlFj1gYCtcQ0L1WDSb6gg3bsYWt1SxSlfUqAXVQMUWPtznLmnLjjs/6PgLF+8
         7U5zSZRxXomT/IO4XFtp1ii0elrbFo80f8LH7RJqF6hIKai1IUcmksmUXl4BZ1Bpv3Ra
         2RiGw5Lj1XcmxBT//cpbtWFOKwT5NdFnVpc66vDuI1eHezJSMzV8iy4qbwlin7OZQc36
         8q8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787145817; x=1787750617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esjYOP0cHWLWtJ/S0JzZjMyOobiP2YG5+HUVououevY=;
        b=XQhX8BIg7lBbgTLuOJoNaN4oE+q7Hfp5MMaRTKUjieIoA/xo38jGG825WYuAS+SGcs
         Fjv/tasJ4qHoKwJG2GTyUmuTzbGTJoje6ryRPJErsQ29gaP60ZQzVWalfXk6gRs02nvf
         JD6wMzdrLrAxKlBp9+3B8dzRdcsa1mRSOgQ6yunDiOK9XnUhLBOychaop9++5WYJ+uEh
         lviw1rSq64imM2Y3Me1XE5SuGqVIPQNIP8XONVZNvosM4TptPpq4B+dBNpFFKcKA4u4O
         smgFnNPSvxXeWAC+FURwKAT12oWW2PKJ19hcM+59MOgZMaeZcNgkb2sh4jlzDazhfjHF
         hDTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rovu7uN1Ng+12lNv7d6U/g1dItYwCiWBvQYSs8DRMt3P1yxjWPQF91AOyz7pJy+9Z3QQM0SHpcVQCNcmKwh@vger.kernel.org
X-Gm-Message-State: AFuF++kAp0AO+IvdtYNjG/TAM9NiaJhOCx+1WzEIpf+sWDB5XOkBCw/z
	X2xPBsg4zKNjvsEfRdNNOxtyXBHXFqydBmZ5lyAxg2+akkeb59q1/SwDUU9h4FzskYTkfK2MhN/
	0tx+CWzJ+wodS+Do2KUubH+B5r3W/1Ay3KQO9ACU5KZLdYLJPVsSg8ONkec6vU8Zhewvp
X-Gm-Gg: AR+sD12k+yTwF+iX8QgRpFHqxPq42asLq46qsbrO5fs5MNHJWDbdt106zLU8Uc9wFWj
	BOL46Be0KxZzuHqgeXSnEXHKGrHmiTk2SdY4J6G5N0q7E1tQJPmj9nL1iwnmDmGGA1UpEPPruj0
	ae1V8ZThSAQUE6PBi9bDxVUH8mPUzaMU3MiNrfH5q000BaDnve5zBwuSJtn+neSWCmdN60LJF9r
	YlKOAtxBA4QqWB2Bt5TRd+LUmixcu4vlNMr8UUiMTeTrkHl/qEiAcWUhc6lUa8b0/eGHYO2gNR8
	zFB8kbmSpW6NMfsOF024vPK0UhDCh0OxuW/+74VPmOd0s6Ha0JnkXhKsNcvRy7e4GsqYUSfW7Bc
	ruzsD7M++400xKggqzW0EKn0BSsXEUw==
X-Received: by 2002:a17:90b:4d83:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-39580a91ad5mr8388495a91.2.1787145817297;
        Wed, 19 Aug 2026 06:23:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4d83:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-39580a91ad5mr8388382a91.2.1787145816848;
        Wed, 19 Aug 2026 06:23:36 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f9aaa12sm2843059a91.5.2026.08.19.06.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:23:36 -0700 (PDT)
Message-ID: <cf502956-8c99-485b-bf25-9f89d81975ab@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:53:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <f009a2fe-5c30-405e-a942-696ea65fb2f3@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <f009a2fe-5c30-405e-a942-696ea65fb2f3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX/E9SLGlVxeJG
 l/1kNvskqA9uNzaRAhbFYY3QbGhN2G6338RXpSqPWWPati47i1OgSeIdPyNrMqR3pafF7WiSMjX
 eGSr/L4FzQL+kWBir4nEHwFBNgz5mVw=
X-Authority-Analysis: v=2.4 cv=H5PrBeYi c=1 sm=1 tr=0 ts=6a85ae5a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z9ogCWloIzyHX_id1hcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ZCJZvteKEso-PpClKZfbmARCzEXuq7Uo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX21jvMiTx3DxE
 hJlfu3bfP47okZmxxxYiGv4hvkqjQ7GmII9gKcKAQuUF02Wcjy/0dtx2Cdbafq5ew5DrFcTwZOh
 DfFNoU0Xgubxm9bu28XYvPAjrTAu6Zq3ae/enXgdpB2vaBnhOe0OUPSW5Xyc2yco7mlikGZudEe
 zyGwhLfO/LMttNpdEmZFi+DcoYHHVndQ0KmV8B28+D0IaBJjnJW4hkcDUXwxXkVUEUwWF37okgF
 Oiwxt79J6+/wrb3PLZOmTalvqXAgLmy8FSmKTCe6k/Z3A55Yu8yq6V3FE+5yAjhqs8c43uGSPGH
 GMni7cDvoY1xaFce2Fhpa8E3UNduTOUhOS2OENszmQO4LBoGmDbNko/xz9IKNehh9U/b9FoICGf
 d+GVXFYRxXyYzUMuioYxuHn0oAwRiOfS/fGtXqvUkkouJI8+4WeYz2m4DEzPmzMV0QXiBWppGVk
 FzDLOSJP8n57hJP6VoQ==
X-Proofpoint-GUID: ZCJZvteKEso-PpClKZfbmARCzEXuq7Uo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190104

On 19-08-2026 00:48, Krzysztof Kozlowski wrote:
> On 17/08/2026 06:47, Ekansh Gupta wrote:
>> This patch series introduces the Qualcomm DSP Accelerator (QDA) driver,
>> a DRM-based accelerator driver for Qualcomm DSPs. The driver provides a
>> standardized interface for offloading computational tasks to DSPs found
>> on Qualcomm SoCs, supporting all DSP domains.
>>
>> The QDA driver implements the FastRPC protocol over the DRM accel
>> subsystem. It uses the same device-tree node structure as the existing
>> fastrpc driver in drivers/misc/. The approach for binding the QDA driver
>> to device-tree nodes while coexisting with the fastrpc driver is an open
>> item described below.
>>
>> v1: https://lore.kernel.org/all/20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com/
>> RFC: https://lore.kernel.org/dri-devel/20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com/T/
> 
> So this is a v3, not v2. Please start using b4 correctly, so versioning
> will be kept instead of faking the numbers.
I'll correct the versioning in the next post. Thank you for pointing this.
> 
> Best regards,
> Krzysztof


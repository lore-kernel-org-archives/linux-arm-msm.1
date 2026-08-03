Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74E538332A
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 10:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753189; cv=none; b=M7laNRA0JwuhrrZzSgcj1SDFd49ECKUv1E2CBG7buRc7oawou2F6zvsk95dgwi9Myn998+Tu6HrjyJbTZHrKeY3XCWabhGJ3PGPEmOsyKdxh0Ew3kzBgFj+IczWW45SJRdBdoRZtgnHB+oJ7/SvtcCHpUvf+Vdod0/Hj9/UryqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753189; c=relaxed/simple;
	bh=XBNsRZbfUu6fSuYCGSsDNVTBu2aJ569/FPmiJkl0pJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uYzAbomsekgc7XDKcNKy0BsgU+/mf19bEngL21khQAhVOsReDX1rP43Mf0nQHJ0/NA6hhfS65hivTNfQVKe/hG/4y5TC+Lns7Eaks/k/tv3laV6x7nKVRv0IGWNBWC/Qpcum4YA6buQ77FPgDnRopK0LPHyIsCVq77OgfPUZ4f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCoOpEQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXUkuO6L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCoOpEQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXUkuO6L"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673AX1HS4014129
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 10:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUVEG4Tg21b0/bBSzmUSCw72uxG++6DCgOpS4YwAsSw=; b=ZCoOpEQXZBKeUANP
	N5DArR8JHarQhGdsvvfy1Wm+ccPqzuXIpEVMgsDtFgPkKV4LM6dPPESHkz2YYx62
	KpUsZXmvaInaluqx9vctdoxCzesBl1apjQeQwfy5dKN6Z465r0soXr9D+uKUbEEV
	EXsjEaiY/N9oZXvmiSBta26iFXqgM3hMyeCKGOYVX2w29qrofNrWef2jca640+vc
	a8G6UaUIZIfgi/yV5msgkQb2m1mUbFS3kwCZQfaw0NgjwUJHUJFXOdsGK5S13qU5
	C+V+Tlt/DsEYYHsi3mQSou1OYHCl1+rd0E24/M8IaRvQVhfOW07fbX861LaTVMvU
	DIm6UQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrt92d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 10:33:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso4018416a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753187; x=1786357987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUVEG4Tg21b0/bBSzmUSCw72uxG++6DCgOpS4YwAsSw=;
        b=TXUkuO6LGTQYfRpopHsShtenTn3RE17on4P4Eyn04AM6PXU1y8zhyyFTe7QW1B4u87
         p8F/mcAYvuVP45cYXQ+nXLMaZqRdvyftqesPasRemCCbPnD8q54HS0ZDbC4N3lQloGzi
         MhGyUAEUBxq3B0IuBw7wYlwMX8845lWuBu2XgoydIrli3M+sPGULrfR11WQ6T3yN30ar
         MGeNhYZ2XGgZikIluRvk5iRKfp6hhUwD8uV6teFE6UiXDpaqXNGj4U35oTotrMSXVvxb
         k77vP29nGwru3Duzj/Vp73gbjLx69xacYsoRGoQK/jjKqybg9wWPQ+4itUHJwl70zAMM
         G1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753187; x=1786357987;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HUVEG4Tg21b0/bBSzmUSCw72uxG++6DCgOpS4YwAsSw=;
        b=g0HXBJifFaAUSld1t6T1lE20KyPd2CV7hheb3YBOuHhQgohjrgQw1O3Z/2Bvielo37
         bqnkHvleNR1fausKD0LHvariwuA3jv4m3vBMb+lCokIDx/qFTm55cAVDL2uauDLGKDVg
         wpPZ6haNnph641AxqN65foMSF/PbsLModJ7A9gc8N6Wjbg4fNzHXVWm7htAZyPNUOPSm
         5IoqMwENQ2mC1kYH+LTDARvNx3Bpq+VKZX7aSphop8X8Lyu9oh4CBY125/ii+VbKt/Pd
         da6LuGDHHhqhZ2n4iiKhyabnq/lDA5m1aAUx097uIabgOUhEpL/mfiMksdWUvqJ4B5w+
         qOtA==
X-Gm-Message-State: AOJu0Yys1Ac64Iell1nMNuZ6k5xUUjRyQFhoqA/XXLzg+uq1lu+1Fm0T
	ilE8fRgKU1rWz0/FLXCUT8dyzjmZelZ7YGLbOKurRHsCwia9GXJOe63QL4iB9B2F5PqUfxhwOj9
	IAUd6L1As71Qu/TOaDnlphcGWMMW1x6L6VAQJjpfUCdwjBottPYGnmUX5GEq7NuhiPMDR
X-Gm-Gg: AR+sD10LSJ4DCI89/JdNen8N8AGTgi/FBuB4ndbCmv81MKpnuN/W4LOEWV7DmDdN7OO
	rxbPyUdgQUrXbCKr4ghzSHvaJb7cTXA9q3lkPWiC9tCdRNZ9JErIDZwxZQsC55YQxZph7eihaFk
	jGFQeWu0FjoMDEiLwnS7iQRB4/mOBKt3IcbUWpbrmv11kz1eSIK8t6hJ/ewwIEecqYbTBoO/MLO
	pMI6Z6zHTLrB4DjPKaoef+aPc1TpPbbCVLXFB/HgC/PNwMXBQCfT+ZrLhm/Z7BQ25uDw6GGiPzY
	nAGIxuGySUNz8Ha8Czk8FOerHqS5sUPkXOBhUUbeX2aM+dM7N4B58/purj02Pp6bIxJJ86JttEq
	jCrFQTwx/qy9UqWbGX/4lotbbE4Pg
X-Received: by 2002:a05:6a21:648b:b0:3c3:9595:57ef with SMTP id adf61e73a8af0-3c92a5bc4f9mr9402294637.31.1785753186651;
        Mon, 03 Aug 2026 03:33:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:648b:b0:3c3:9595:57ef with SMTP id adf61e73a8af0-3c92a5bc4f9mr9402262637.31.1785753186241;
        Mon, 03 Aug 2026 03:33:06 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e44bcsm43148007c88.12.2026.08.03.03.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 03:33:05 -0700 (PDT)
Message-ID: <fc24d80d-c970-458d-a912-1d5f18a3a4b6@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 16:03:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: shikra: Add CPU idle states
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-7-3d858df2cbbf@oss.qualcomm.com>
 <5756164d-2e42-4eb1-ab18-69c6f784b789@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <5756164d-2e42-4eb1-ab18-69c6f784b789@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfX+FxduK1iea+r
 9e/j/NCMQvVM1wUbg/m0tJtcrbecKX5c6oP3RYYW7pZxuSd3aW0jKDF1ED03jhVwku7oXY4igIe
 rwKFlGaky0Uge38UWgLZGGZJmdzc1Xoto1A8JXLBK8DH+G8CGBPhCJExkYalUt5GQ7pOMvfeMP/
 6HY5gHzz/dVczrE17I06iE2AHlr5v1o+NDcJvKlzTib0flGqdxJT6h6VomQ4kiERcJUkJ2XZA0E
 ocBG5aJvQQOWFU3lfyb6VdWpPlZTE6ITqQWGO4u6QPu+TCdqvqpncqp1iElVboHbJVOh/VHHrC6
 h6TqPmg9Ret4kexZgxLX57xQKnYHrafzvv+gEkinGKchzOkANAMv3KVJ1UEM4SLai9Y75oXLyNA
 esOiCqq0P3mUnQmawC617QgKBw43Y0hBKN+OqzJy1Ty6wIBF1st8kzw8jzt79qDCwSlVaVSXbCz
 PFgxmw6mvBlNUiXHqrw==
X-Proofpoint-GUID: sXsGUicO1TYPEv03Bho6Z5Wg6D9yGBPm
X-Proofpoint-ORIG-GUID: sXsGUicO1TYPEv03Bho6Z5Wg6D9yGBPm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfX49kiH0fRL3fR
 +CEgsibihsXSQmJcsBckbgDFfVmih3NmT2aGDVlemUlKUtRSpsrQZNxZ4HAlMd0+lR/jqFLk881
 s8qULhUHpPWUsJP+s28rrP1Smye6mqE=
X-Authority-Analysis: v=2.4 cv=Ft81OWrq c=1 sm=1 tr=0 ts=6a706e63 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=eFh9wa1xyOHWc3L4cLUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030094



On 15-Jul-26 3:32 PM, Konrad Dybcio wrote:
> On 7/13/26 12:25 PM, Sneh Mankad wrote:
>> Add idle states for the  CPUs as well as the whole cluster. This enables
>> deeper-than-WFI cpuidle.
>>
>> Add MPM under cluster_pd power domain.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		domain_idle_states: domain-idle-states {
>> +			cluster_sleep_apss_off: cluster-sleep-0 {
>> +				compatible = "domain-idle-state";
>> +				idle-state-name = "cluster-power-down";
>> +				arm,psci-suspend-param = <0x41000044>;
>> +				entry-latency-us = <2752>;
>> +				exit-latency-us = <3038>;
>> +				min-residency-us = <6118>;
>> +			};
>> +		};
> 
> Is this really the deepest state available on Shikra?

Yes, this is the deepest idle state for Shikra. It does involve
handshaking with RPM to allow SoC level idle states to enter.

Thanks,
Sneh`

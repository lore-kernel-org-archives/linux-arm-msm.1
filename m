Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F76331EB3
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 02:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788834488; cv=none; b=GRc92p0Ib0vx0vtUnhhLIt4IFVTspxAWRGytwIFt8Ai69BT1KHNdz/AZw6GKY3dnfotHs6QYC/GK7iRTdbl0Xh0169LilsgPEyiNedk+/oyXddl78rxNAGPOsWP6NDLHFxTTqmrZUYV4/dyPY/h1e+FtXdFhdJqnfxqiUJmnj10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788834488; c=relaxed/simple;
	bh=xYnBMto8rvMbCeRYM848J6cSC7ZIBWCqaDb3Q9LcAuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QR4hJTo4a5YP40PC0dIE8asvV8+B1Pxruv3Aw7DWtPcGex8I4VQD39ZGd5pNwr6Dpc1k3yCqJXmPtrdPPsyDPzoKxq1IzN2JT+hyFwifBrZYM5zWbQygg5pGux9CWiuAc65EvmQD4ARZ8yo/Pf0lKZFHfHvlW/zjxqXiCVKyi40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JvA5m2Vd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fD0jMoIE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JvA5m2Vd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fD0jMoIE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687NlM1w1518376
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 02:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jmXnlHUi4LLtLAOdsHmNQhDdyaOor2/XKd/6FC92eGQ=; b=JvA5m2Vdfcw3HEyg
	xV4P03lYk4P/HMW4zF3AQVlcJZ+BSwSPjQCrfboz/I+7ctavqu2N0QbWrVm6hpLL
	wWHIf9UJ773PQNWxsZQetdYiFPCSGerTSWaKsBu1ES+ZaVsDe7Iz5aXb0bsOx5RE
	zOmntix5xGmWHqmkT/Wt5zkCV0wGL/KosWrgRdSXRi9Ar002Ph1rlClRdpCuoRRh
	y5/6cRaTDE8FVbkKwE/6fuuNqzOTpwjnTZyeJn3nQTXgsEdBqDiUL5zeSbNUwVSG
	9hO0fv5pVOK6GEpyx8RRIexcdTBLCOXDOT8hagMXZ4GVhz2vaxFBl7/8tc8oFnSY
	vW+K6Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86ufq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 02:28:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b6416441eso2996249a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 19:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788834485; x=1789439285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmXnlHUi4LLtLAOdsHmNQhDdyaOor2/XKd/6FC92eGQ=;
        b=fD0jMoIEQUffreailUhHHiB8mWmzKRLtm1Lc5zPFa7mX3bUi+VONzk47WORCMDMNK5
         Ci2sw7MA6G4FwvS/4QQpjqPwYLXKNtAODz8oOGpM0AzeBROUps0eqAq4rGzK96Ubro4r
         1BfzyQS3jNcLBpcezQSczqKbh4GetjUB0yU3igTQnUApcz2MoJLgpSxuaDv1aTH9Zubb
         c9+43NFf6NOkNmtuN1OIOWdczljvnCXoA7ZaOYX3r4zYzh+VXMSpjW3qt+g9rixZAtOc
         +x4McXfbtUbqDa2y/4p9pADlDRV5GzmKwmWoBb/Khjp5XwmdMFuBd0ZatdtpHCn7dwD/
         9+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788834485; x=1789439285;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmXnlHUi4LLtLAOdsHmNQhDdyaOor2/XKd/6FC92eGQ=;
        b=FfLEJ3CX+ZvsRXY453gX0OjWKuuUgNrX6o7kLAi2DK6DLNQvq2rZQDEahHhOSNEV19
         5jV3+QhGqnarOKp93pFArCFh/1ml7px71RfZs6cYSbIpv3alNwzefo3WFfUgeyFdZXNF
         /WrxSmA9V8BFHDPhKckn7Hpp41CJ2CT3nrRubfYhXNfSoqN3HqMQlqCfGP7nCn/pVtJv
         rnIIfs/TCYe87/HVYpOqUGSZ0DurG8TQ9F/islN7U0oJPzbxs+7CXhVyxmihy0QAqz0H
         2R4NwVrawQDH94+PVb9EHEY2Fa0ThprMWAkOZ4hDuz2Rhw80Sbe5eyrY3VLCXlfQ+df0
         wS6A==
X-Gm-Message-State: AFuF++mkjaGWnoOot61+u7cQ5o4uRclb936c9FCES5Q1z/XXp9PTg9qZ
	6V3o1txvI46BAbTizRJMqQRDITKrBmBVMzBc/YE/IzaUCd8PYcAdp1KhQ5Pc38SjKQGhVllJHWy
	RSHmNZS1JJOzDZAIZItOQSe61+YYthfT0n4su2cqTgveOSnZRRNIX468LOhuYhVSllzLj
X-Gm-Gg: AYBFou0kOy02y0JpaRW6yAS8Th3gchK9+itmb7SL/JB+hzVi7FNBnQg3yNiOApP5cJn
	svAWfMa1DR0P1WsvJURK6sc6MKqMif/2iOIX852nCj/Cm7Gu1WSBeBg4GKbE4LXoD7PbVfeXMvi
	+YZriMD2cZbM7lfTMcsHdiqbVRZa1lKzwS1kckbU6c6YNEkBlSofc0BOc5tTr6rPVXmOZdmMuZj
	tb/UCiCLkgObRRWYUfvMJuQnc4x774Ar3Jh5ZuZPKyW8XMF1Z1xYr227vmDkAr78x6D2dsJpF66
	OYQJPZ3DLYI7TZpnD9hpqfulTMIYZ63g2vPQFIhrv9aWQv/vM7tH1YdfiNHIMbDYm7H6Ecl1/8c
	kgumct+4akbtJb3pynZr0McsY7A==
X-Received: by 2002:a17:90b:4ad1:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-39b2616ef8amr37057489a91.11.1788834484662;
        Mon, 07 Sep 2026 19:28:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4ad1:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-39b2616ef8amr37057434a91.11.1788834484196;
        Mon, 07 Sep 2026 19:28:04 -0700 (PDT)
Received: from [10.239.155.28] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcd243sm30538730a91.5.2026.09.07.19.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 19:28:03 -0700 (PDT)
Message-ID: <dd810d52-ab6e-4e8b-ae97-32a140490cc1@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:27:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] leds: rgb: leds-qcom-lpg: Add PWM frequency mode
 support
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827-lpg-pwm-fm-support-v3-1-88ae5208c57b@oss.qualcomm.com>
 <20260903153028.GU2133376@google.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260903153028.GU2133376@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eOkLuQ4hxTF-n2HGTLchbnDtjh8FgwEa
X-Proofpoint-ORIG-GUID: eOkLuQ4hxTF-n2HGTLchbnDtjh8FgwEa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAyNCBTYWx0ZWRfX7xndLavMoH+X
 chTXjrFixHwXMl3w1BmkSBBSsFgm2dM8MKDplopolTMrjl483yZVlId3qU4+8Y+6K8WwoFPAgZr
 Tr/2WwV9lVPoiT732MrLfVLwOEf1lXw=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9f72b5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nP8d1w5hKBWq8GbY02kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAyNCBTYWx0ZWRfX9Gkyj/k3p7BA
 hc7Bb/YD1+6BQ21l7xuLELuWSDxMBy+VKKKTUmqGv8tkfvLEQEWCdriE0CBW2dFTlIUVSOXz9xJ
 D4hNr0XS7IKM0sO0LOVsiVJCpWgOWNg6Zoajr4s2Pq7hof6QSE4kPHvxnZEk81JTSBsV7DFeqQj
 svmIJUgGVTCT6WDeZUtxRJxKL/wePFVXxnZyeRFHYcfg7apBPZRjkGznMtwX8CfpMO1iY/RVQKa
 WayF7RCQoQEwB7rEtpBgnCMlezxyUf3Dg2w502LTdEgBnHauY6M/RKedm3j0vM1+h5KseqwWeoq
 lfAqw+8yOEcz1RsjU8Idz4TDzYLvwk76YBppbDK/EUthL6Sa3jmn3LV+2DRoCQzvKY0FMGK5v++
 4NVW4k0ep7iPKB2uDztBA3p9BVkkuC1Wfy3xqXJdmqktlb+IFGcEkJ2myO2Si8ABOQV89XSBqaH
 MosZPzgU+pMmUDZ65SA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080024



On 9/3/2026 11:30 PM, Lee Jones wrote:
>> Certain PWM channels on a PMIC (e.g. PM8350C PWM4) support a Frequency
>> Mode (FM) that can generate waveforms with more frequency points than
>> the standard LPG PWM mode. The trade-off is that the duty cycle can
>> only be fixed at 50%. Add the FM support. When the PWM channel is
>> requested to set a duty cycle to exactly 50%, use FM mode by default
>> as it provides a finer-grained frequency resolution in that case.
>>
>> Also, guard mutex lock at the top of lpg_pwm_get_state(), to make the
>> register read atomic against the register write in lpg_pwm_apply().

> Would it be better to split this submission into two separate patches? One to
> address the locking in 'lpg_pwm_get_state()' and another to introduce the new
> Frequency Mode support.
> 

Sure, thanks. I’ll split them out and submit them as a series.

Do you think if I need to combine below change in the same series, even
though they are not functionally dependent?

https://lore.kernel.org/linux-leds/20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com/

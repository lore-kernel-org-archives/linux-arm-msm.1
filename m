Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AB9463B98
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787054831; cv=none; b=A/Lc8O91KxKa10UswUxHpj2TbqWeBN4o6ybZCv+vrXebpOmYZj1/D2aGc4B+Bw8SAbKTyIukwV2qUZWPD3UbmkWAaJLpD3d+a7Hjz017PJN2EvBy+FGcMmlW3gyLqMLFjr2kUlvKW5VreUNaWLyQXjJr97nLP5MY444GdQqzD7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787054831; c=relaxed/simple;
	bh=LGO/+6Cezyup7KaOKLSsUxzn5CewZlWao1nmvpqLgoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJvkbP107HldyW+5IKsjxVOuTIic4W/yJMBos5OiYtKho6xFVLsYpPoBrm8mLaDe511fVN90rwnP6ta1oTlq1xd0Mf/FzVMOrkrabZSQ5UMl5QOl/bTlKUgxk32QCZZ4VyeA+EI3B6q+OO9AMgXKBjnS9PW3bwgoifroz73d9ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ijd3EcAV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBU27nkg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ijd3EcAV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBU27nkg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IBgMvA1196899
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LGO/+6Cezyup7KaOKLSsUxzn5CewZlWao1nmvpqLgoc=; b=ijd3EcAVH+unD7mG
	NlQzITd+wfwJ+YfQNenPH59K1wHo7zxJygCdITAsHp3T8dGpKUnXaMVQuKCcr15h
	mWcpP3hqiWSexP4UMiLCcokYDTGlzv/kmxOewYZ464CuDfakbVFNttI5A3cvtePp
	i2bsDam5QiN5ku/TjNSMIdAQE8s2WzH89dtud+bHIMiz2bp97Z2KUHoMZU99zf4z
	OABm4sRaIBYepSH3C/Ma/wPkJ7wRDDldBNfK1A9rE4GqTo86xpeSv5U+KiQ1FZSl
	tjdiAR/U2XCcDfFRkzZymxn/WSjIxwHp54mMXeYW6rxLXlvuzoBH74Y9f0LbR//5
	vm5eWw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4prn0364-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:07:03 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97bf8e81c55so6351241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787054823; x=1787659623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LGO/+6Cezyup7KaOKLSsUxzn5CewZlWao1nmvpqLgoc=;
        b=LBU27nkgzVyfloWNq/au4hS/rM/5AogKOYbM4pt25bPIJUD6HPACsF2eKquzrT8xN1
         mYizq+wRjKDZ825Vs7g92IMxkxI0N23nE0K5vxOOMEdAgrYjmV8VwPJaKUXvmwKTJkx2
         8leDMQkLe8RaOQufRcvrsTyyR55mmz/uC+Swn5CmMuxPO94Ov2Ou+cc1FTzYHyi6Lgfq
         9Xy9joRVMibUgVf1FMvrxXm+XwtF/Bxw91fc5RVPqNCsDRWo5OHgrkkOa5fcnadwJnln
         aSUzbZpwC7n+Cp3O0xKmhDN+zVziMYns22DUFYovWcz118JXL2HHMKbXgERZjVZPDv2m
         B+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787054823; x=1787659623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LGO/+6Cezyup7KaOKLSsUxzn5CewZlWao1nmvpqLgoc=;
        b=IyWKWrNFtHN7ToBqTyoXCjkM6IpAy9UB9Od4zf5J4wbInm/AIeyF/F5oPK+9kc3cL+
         ZFqRXD57bVKvKGFv0S207cx4JX2vN9ObVDu4mL+3pzsB5YqoibCmFPJ73LT2iXFJqvYs
         gevqPqxA+IDJSHLLhnrjGLvQdkmPgo6SqsOZ22aUOETvzGOwRVxJVYxeThYWw1Hb5Zcj
         S79EE2Ql9SbYYYcrT13mYzHM7wIdN7X+NELrqqzrRvxaWzTNkcWUKx/ZQF7piJmPnOiG
         1tsX5LVSbleTZPnXXDR3cjFUi9aKNrlMRfF6rv1iDZZAvmWNidCmWL9gag2/oyu6ySmc
         MPjA==
X-Forwarded-Encrypted: i=1; AHgh+RruNeURg9KAeFumS3VFz12uTLwHjilg3csWzaHY6Q1AQ0XvyDbMcE9Uk9G/KUBBS2/q9EW8t0sC//BYV6lu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+2Q6r7jCUyp45kwpPx5Jt3OAch9LlZcQEA/jinQ+/y9hJVgb5
	B3qq/6vjhLSX9E9iKsvu8MducjyTcqgHz4929h6LamN8sJjYVeFL0rLRW5b4KQ0g/UALkAx73AR
	ZE4VIH9vE/2INKEqpqobVPChwHjZf4PKGvG5u+SLLXmZeluevn5/nd4sK3t1cSkep6Bme
X-Gm-Gg: AR+sD11suqf6Y8DmcTjI0ekOvQL2brdAm42Otv/QLTf317uxqcUkKDfscy7nh1g3gy8
	32JiSoMWUNM/Md3tk0S4j2atLEaV7YIPidNyWUrX1Krp+vzaPmK00iNQOSRkL5TDJNBTB8JicRn
	8Xo0k4LN6+eqdUg14LbI6CUAMHQ2013T9aIkeYDIts7c0FPcG8CYpqFkhr4Bm0kcl/LxJJNQ8za
	J/qTHOMcyPwF3yQMmeWU2AkuZyPxS7/xMUenU/NaRXbvBmcbZ26yzNo1w2BNAhcMuzhM1SE3yDO
	RKHz4lJ3rvZtCErXS+WVedYOdOdcrECtm4BjNhuRnVJt+xtiWc0Ef2JEGlegspc/hp/FGl7AOdD
	rUBIuNuaZX+zr7drU0hPBkkYS
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr2350102137.2.1787054822838;
        Tue, 18 Aug 2026 05:07:02 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr2350089137.2.1787054822392;
        Tue, 18 Aug 2026 05:07:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b74059sm144679166b.38.2026.08.18.05.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:07:01 -0700 (PDT)
Message-ID: <18880390-0407-4efd-bd2e-1595193d78e0@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:06:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] i2c: qcom-cci: Add 19.2 MHz timings for the v2 CCI
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org
References: <20260801-cci-clk-fix-v4-0-e1d80da54e01@oss.qualcomm.com>
 <20260801-cci-clk-fix-v4-3-e1d80da54e01@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260801-cci-clk-fix-v4-3-e1d80da54e01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4OSBTYWx0ZWRfXy9qezfir0EPe
 Ee2KerDMxW627zZryLidZXEU3UI0fzVnQb5mW3ENM8lgTS1hoA245RAdrh4t6hWEZcGKXv1Xlol
 C9uJBZ05QXFm/YJN/8b24E0BhLdIWi0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4OSBTYWx0ZWRfX0yb6ZWIbHzVO
 972qBOx9nPPJWm13dtw8xuyQHHW6aj8IttYLM/7TNo5RZTsNrW6cl5wC9jZWVNO87CFl4Da+y5a
 LW0bW9BieYugDmnrFNVicUJCf71w0v7ylbi6Hc6qTlK7sAyYr4xjFcMoJzotC2YArFEhIkTjV3D
 SBEkfeZivMaCPef1YrnbXexxLE2LWt6RgfBfXm196UM1/Y80h7AMZwSSU+wMPIq+WaIx9fn2qlI
 2SAjOaYB3x2+2aniTIYDdNxgsgI9BZVSWP/EH9Q46nq68C4+ayxyKGDzAbVrc1dylKOk38NzNKC
 U3GAR8NQQdo5uGkGJcRpuposrBVgIu7WT5p9DmbTOu7MMX1mGwt93x1x8gCa3U90bv8La37iWnF
 EYm/lsfJYAvMllzpuEbnrhI6mnt/f2o+3I9M5Pz0pgtTXzYhhMHFkLT3iLaBqYv1EEPjKlzTgSs
 jAcMixRj/FcjU4I8p0w==
X-Proofpoint-ORIG-GUID: RzOb8lWuWZWmQg7PIW9IQjIjkZhhGESS
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=6a844ae7 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IUKAjBX749pkMcdBEW8A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: RzOb8lWuWZWmQg7PIW9IQjIjkZhhGESS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180089

On 8/1/26 10:10 PM, Loic Poulain wrote:
> The v2 CCI (msm8996/sdm630/msm8953/...) is normally clocked at 37.5 MHz,
> but its CCI clock can also be configured and run at 19.2 MHz. Add the
> Standard and Fast timing sets calibrated for 19.2 MHz so that a v2
> controller left at that rate still has valid timings for those modes
> (Fast+ requires 37.5 MHz).

The v2 naming is misleading btw - we have e.g.:

v1.0.7 on 8974
v1.1.0 on 8916
v1.4.0 on 8996
v1.6.0 on 8998
v1.6.3 on 630/660
v1.7.0 on 845-8550+hamoa

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

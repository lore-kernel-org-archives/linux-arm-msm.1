Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595371;
	b=cJW7A5lVrU38u0IQxMvWs5thu4ZzqP56dQ4vR8vmQcOLimYncNlblizz1tmbDmYVkAni
	 2dZns5Gi67BX+wwXr1L5zIVGFALN4XNJW6499SZbDhn3L08anNcPZC6yl9Cc/APU0kLqO
	 iz+nPaszYh8k3ddiwTCO6WoUSJWqGVIfMnrfhYqbNFJf9vQSXaGVEbnw3M+mRq4wIdYf3
	 3hpp5cuO9s0cp76kV0RpLGs/BymvNJspfwUqO62/XrltRxTI3k0Xcs4TGXS6hy2sIFMjH
	 yyC9EAsrdlD2QnVKfZc2KGErzKNUv74bbJFbpG/QvWolUjEY6YmjWt5iEVdWrKSivJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wtQv9fBBqzLZu4dFjeLGNnk+sYfH2oM5wagtmKDZJQM=;
	b=bicH06GPGTDggbbVAmqwxB6w22OjLIq35A7TzEFtFiOyrnvIZG0qnnBldAuHswBxvZoe
	 1nFKs4TB/Vsj6nK2o2sEucDgAJNgy4yZFNAYnIVh4dUTAUJplWh5DOjrJPsx3vqaL0PWc
	 9lT4+EObqEiPUYYlned5/AVk8ZqU+JVqfe9dBCNfMkJtj38ZfbRaRy0ZKgOtivXsrrk3S
	 Y51iO5b4l5rIVYVhcA4xaQHXdxa1ymtSQIUSXt6tuqk1O9DVNZ29FEETUajsygtdpnjvn
	 5COgH/HPvruyH3P46w+AycfNZhjy7lJs/45TevjopmL3FD6bUf3V1PqF5O1ljcxhktg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oTuBpkyG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFSJb+ad;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A869E606A669
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A869E606A669
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oTuBpkyG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFSJb+ad
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRc661012697
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wtQv9fBBqzLZu4dFjeLGNnk+sYfH2oM5wagtmKDZJQM=; b=oTuBpkyGyai6ayDd
	THPqtJfQxsHOeVWMJ0sV5Ce+zlRb8MVEhhSH/OV0tf30/MF7V94MyP5Af83c1+FS
	aa2QObsgCrPSzCbgNu87Im+/v/+vYSdV2BmC2UhjuDwgGxRQfd7LS9zj5KfaASLr
	z2L1GDM/86mecLZlq2vdx95ch4EQ26+vm3wKAtyvXzKP5pPkrs0nBWe4lAjtmbE0
	tS59IRGqOAraIPU+lRJ0v6vjuHPEsvptuve9ivAbDkE9fRXT4icB5rtEN2yMxwhN
	YbKlmj0OtL2DxeJAMe3jktToLzexdkmadYe947dLh8PXBeloaFGXGdzNBuFwxDAs
	qXj4MA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdmg06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:42:49 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso1414565c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595369; x=1795200169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtQv9fBBqzLZu4dFjeLGNnk+sYfH2oM5wagtmKDZJQM=;
        b=KFSJb+adaBJLJvzeG0seYunchIK+4lfE8ey78mCZ4etUdARkzmN6Q6Qod+2915lf1T
         3d4NQ/k8SlrXM9FFBV2oUNtbUNlTRy297p1SX5ZEjWfs3y2Q9/XWzZhTpoK5G6TM9MEF
         pNE8yxlF91g7luQ+3w5C0PPvoI7So4ZYay4sjQwh6OP4vvKTdIC3sCdCt2qrX7/XcR/z
         L8jP82Jy0qbXuV1MLqHw9ORtljoCzaVS4qzoZMhHR8Yed7/9EJe9MpqA1n/jygQHZkX+
         24B0Kht/B6R7An3+3rY7CF1B+8XPnP1MT36A90jBgwtu3yQZE0TVe9Tbbzkq0I4hUO/l
         rF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595369; x=1795200169;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtQv9fBBqzLZu4dFjeLGNnk+sYfH2oM5wagtmKDZJQM=;
        b=eL2nzxCnWTAl6SayHBlzJP+H8vMySbp6jNs77nTppfNc1RMNVnmUVR7/d2uJL9/p54
         sNWeI8YFYqMyBzMzydIppuk0FiZewcO2zZJUltMXqNjUR4+C/bdq4EQgDK5Y9Zq7Abu+
         pymGPdjy9gM985Ey7eGJ12WQEhmsUTzJWtqmtpM7A1EseVaOM1aIymJiPv3+0x9Wiqze
         4JwOUpSHT/JTegGSPwlOqNIobqMAiprcSF6yUSE+ITnDzDii/my4UvgBeO0FNFqiy8u/
         aJsalauHOPnFVNec+uy34ApsaAzNLbBUD+afLJNcSujpbNuEI5eun9Gonfc9NVjAIE37
         kw8w==
X-Forwarded-Encrypted: i=1; AL+hErGAD/l98T6iOJmIR27m0N6Dfh7xfMelI9/ZJSvTkIQmDzEDogd2IVsQ+JSB1CDXOXdCvBTZOmx3MS/96gA3@vger.kernel.org
X-Gm-Message-State: APuU4Z+7l/eRq6eSiK0zhy9f753wuELkLcSKzt2lUYkdUgSmrD812OIw
	0Wny5S0m4FIAGfdW/RoAWIoOzCZAKOxXZ++XkZ1cs7dfy9bVsfk5ph2QN5XC4pjLGlfcifDH8Eu
	mRtmmKcbEhb+iN7WmaG4WH9HLB42HzHTOqknJnljit0oG1GdnsFAGBOzcduA98nUI1e64
X-Gm-Gg: AYBFou2IW+HV1eSYNKFcARCUQfvQazHHS5U6FvrlPEg2X5xylPpWFz1n1OqU0S5TdaI
	dzMGyPpklRt/L/myMtBj519tpzXPVAqRD7wnVWE7W5NdVuacp8olZ9GT7nKzriRAPFYr4oJNLCc
	9b6qfXZJ9hYMKtfeov4g9Jgc2u/ZCZ1HuhvvjASu+FZB+DXKXrB5x1CNETAdZCiPfyaPvrpv3g0
	d0jQxtaNcYg7Y+AAr10tcGi6V3NVrqNg012EeyqNqvKGHPGak1GAXhuozLFS7bcT1byrFRXWkPs
	rYi8bRQij670NW/LaMfKYpKkH5hH0iHR0IBNHb05foRVRSbTMqn1dKBABP2vz+VINJ+DT20dbDp
	ct9kjmtmDFSb4PT60mblsq+QREkbC/4ddAp/siz+RlsyYBef8ff32t9EPhAXydt24jD2cB757dI
	9ylUTYI6RewrhTmd8+h4H6uQ4=
X-Received: by 2002:a05:7022:5e08:b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1b503115942mr2812411c88.27.1794595369057;
        Fri, 13 Nov 2026 10:42:49 -0800 (PST)
X-Received: by 2002:a05:7022:5e08:b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1b503115942mr2812394c88.27.1794595368577;
        Fri, 13 Nov 2026 10:42:48 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b505b5bf76sm6327679c88.10.2026.11.13.10.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:42:48 -0800 (PST)
Message-ID: <826c1746-137b-4a5a-968e-8e0449a25e78@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 11:42:46 -0700
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
Subject: Re: [PATCH] bus: mhi: host: Only expose controller sysfs attributes
 on the controller device
To: Slark Xiao <slark_xiao@163.com>, mani@kernel.org, bbhatt@codeaurora.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111115659.11943-1-slark_xiao@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261111115659.11943-1-slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfX2alhjLHb7CXr
 rsuWBaVGSgZOharnEExKyE4q4tSqQaJQYWJLGdJwXI8Qd38/IGZY+/oB7TkmK/IDNz1Kbe5ohYW
 muKB57z79K8rYMTZODkDqZTAM9M/Wio=
X-Proofpoint-ORIG-GUID: VjBpKC6IeP29tX-IK126BfT25HmJpRaB
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af75a29 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=48XoENhhM4yzJEw9bqUA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfXzzxhHKn4mo2i
 e3ap/UADbiJOOK3e+NA/RWDjiHn3tI2pjLIlfXJwx9Q5asEUcZU9ZPutG/cDBIk6fJ/PXBpdQx4
 kD59YkdOljIGI1kVCN5klshr2wfenXXjgUToJ3SbTPo+rkoHtOgLtWGQsJ1VVVEwmwTARXQSbZI
 zs4RvFeCokXYP/2B789E0a1fTwyzgGo1ddhcWxEWxKkJy2Am9Bl/+LwrxmT719sx6xZwfF5BSGa
 UQ8ASyswmuCd541K57VJs9TmiHFbV+mEtUPLCo73E6knt38QRqiFkMUkF2jzyuPykrhCr2rTqK3
 +j7aKX2/UXf2gnE4U9GvflbpeFQyPUr9vVSsOxrGR1hoJ9lMXdZ5RqQ2i+cQKTYB/Ea+jaADw/u
 qiXVJgozwlXoYqCIwtXcN07r17lseyvIaRxg/ulW/tjdWBJQSm4byoNMShUOpvpXvIIk+bMFWte
 SWas5SNJmYg1sEN3Arw==
X-Proofpoint-GUID: VjBpKC6IeP29tX-IK126BfT25HmJpRaB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130074

On 11/11/2026 4:56 AM, Slark Xiao wrote:
> The serial_number, oem_pk_hash and soc_reset attributes are registered
> through mhi_bus_type.dev_groups, so the driver core creates them for
> every device on the MHI bus.  MHI client devices (the per-channel
> devices such as mhi0_DUN or mhi0_MBIM) are also MHI bus devices, so
> each of them ends up with its own copies of these files even though
> they all operate on the same mhi_controller:
> 
>    $ ls /sys/bus/mhi/devices/mhi0_DUN/
>    driver  oem_pk_hash  power  serial_number  soc_reset  subsystem  uevent
> 
> This is wrong for several reasons:
> 
>    - The attributes describe the controller, not the channel.  Their
>      callbacks all dereference mhi_dev->mhi_cntrl and read BHI registers
>      or issue a controller-wide SoC reset, so writing soc_reset through
>      mhi0_DUN resets the whole device while looking like a per-channel
>      operation.
>    - oem_pk_hash reports failures with dev_err(dev, ...), so a single
>      failing controller produces one log line per registered channel
>      device instead of one.
>    - Userspace has no way to tell which copy is authoritative.
> 
> Move the attributes off the bus and attach them to the controller
> device only.  mhi_register_controller() now installs the group via
> mhi_dev->dev.groups before device_add(), while the channel devices
> created by mhi_create_devices() are left untouched.  No functional
> change for the controller device; the files stay at the paths listed
> in Documentation/ABI/stable/sysfs-bus-mhi.
> 
> Note that trigger_edl was already handled this way, through an explicit
> sysfs_create_file() on the controller kobject, which is why it never
> appeared on the channel devices.
I agree with the rationale, but this does appear to change uAPI. Are you 
sure no one is using these on the channel devices?

-Jeff

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741797;
	b=1u0RtW3o9Erlozb2Plx/31KqLCqy2dTTuQytm6fNjPHswS96YOmpqNP2QGvOc+FM1oPb
	 x3HehiYQcXuNYGYUHNbjDQoi7wBUXMX7qDZUzV/+In3tqhf+9TIyHQB5BDbq04wvhzNDp
	 nlkC1Lga6EnWRlc23XkZPnIo59FAqN0qNKvE1nUkiHXOrxy6vO4TmUAKMZvL6xARlPimZ
	 ip6V5DPCagChuntICanTwLuUzS9PtGTgpBaz01d1HOfrivr/GNytiCleDX/okVvBe16K1
	 1jtPu9+8zoas5bz5/vSEb23cM97Tuad8re0DkK6K9jynERQ4B0HqRiGRNAO2rBSyoOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XFN7ecA2fBCalBS7iY+U71alBxz5eiLl5pS+OOwE7ww=;
	b=CcXdDYkIrUqukDHYpnki8cTQG656D9snloVBSMzoogOvK7651ZFErMcSBRWM6LF4Uddg
	 BjWZn6vCpVr8Y6U3tj3ytbbwXTIwvKJrX9rdW8YImxBnwdVdKuzINgFVEphTAD+Zka41r
	 gsE10X0n7Fn+gX/1gVxvcaOMg8ta9ARRiS5YzYm14Un4Ym4QqVrmfPB7zgWWk3QsrxMOC
	 qtDAS6mQOEvucSc46R7RhPCnI3q+A2EJvmSs7P83Y1/6++9Kxl7NTgiC238jH130zxZFE
	 icyed7oh36scdRln9y09j3Xe/DSHZxnxH2BMvMSILHytBFF279GMK/Zy1xDWBZtrS8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SscPUgCs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZAbd4uTN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE482606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE482606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SscPUgCs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZAbd4uTN
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FPjQ1048714
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XFN7ecA2fBCalBS7iY+U71alBxz5eiLl5pS+OOwE7ww=; b=SscPUgCsPP34OPqM
	BQDn1U0rYJ3yEcjq2Vq6lItQpuK44XSMkEzthQl2duxnM0Hzeo2t56Ts6T5pkwkM
	W99VpNuN/NXjtpss/2QfcA9u35BJTgKKteJ8tf/2JFLJt/uxQ7+E0EI8/rC92d2P
	AbgLUjxlr25TRoIM7FHds5g+jLTMDWcgQn6gjK+VQFWXFHxl1ctV86AjqCjEMmh4
	8Z91wsBWB1bgKgglQe4+WB3qljyCTGZxpjPHoQLpQtXZIiFoUOOH/5LEjk49Ploj
	QPdaWKCBnM5m3yi0HFYtEemS9pWQh2DSGaWQThm17+lqkZfQkT2qCr8cUbVNh0Rw
	CDtpjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbjm2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:49:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso15459885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792741795; x=1793346595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFN7ecA2fBCalBS7iY+U71alBxz5eiLl5pS+OOwE7ww=;
        b=ZAbd4uTNOfFVf8fQOhRKbybv/Pu9dSoFSeZmUZCdH5OwuZS7aAUVxeXML8tLA/eMj2
         RFiNi5BsR3KF8xfyz/uVippaEPPW0gO0CWwFv6SUHe+xwnXHCoFwVQJn+qCsPc4TM5JZ
         HTDkcDijo7LT3Tb74dBeFZayaR5D1qNPF45Mk4P3BTKRyqVNicFBIKLM41fwVGh1jad6
         7U0PwtBlOd5QctLLnxwSoFkO0wGOi7KcSqpZT0hiXiEIINr7ABhokBic5iKei6IFh7+P
         mLLAmwcEVVA+BbhDa6R0C+uRHtWNbng/9YyTkQ9HNf90r6IiO0/qkhzVL2yuxmtB/e1D
         2vlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741795; x=1793346595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XFN7ecA2fBCalBS7iY+U71alBxz5eiLl5pS+OOwE7ww=;
        b=iII0tsXk33tX5J8nJtv3FqR5Ohxhw0tpxkQdmZEO+8VTXVwj5e6IUSJHsbJ6CBmbf7
         7FFVcyHBj2bxU33Ml1v3HW9lVKcXULxUgS2mFRlnp2PAAfl3UpLsk44IkU2jvYaGT3CU
         2+axmQtsuDQjPVS5EoAmBvUcEnTf+EWV3f78V37jpmxz9TBNCftK1pqTmdDQL6FtIGx4
         lbTrp0wqigLtsJl0wWPSDpfZB6C8nOJ7HcjSBs43zBSlJr0NkcQlXYfD4ugTh3iNaI3e
         qQztrUej+OcYwDQ05t9oCRPif925arXh3E8o7DJeeyCKyCiVbX4I7rL+k4+XMQjDhzc5
         VeZw==
X-Forwarded-Encrypted: i=1; AKwUvBy+t2MqiFNNGE5wYA2NYINYqpQlSqeLcv3NOBuoxr7yJldHFMUyg6RdswOJf0Jq7rvFmLjiq/91sNN4uMri@vger.kernel.org
X-Gm-Message-State: AFq9FYLXqLBpnNNSyqMPxvP0r7CN0cjqXL1YWn/WusUdYMqVi7Sx1RaS
	l27Nk7Vd3cy0wHlqotx2CyQUp1XmVJfxDm2ozFPHn0iutBlwC+uza6l8Fhg68JwWGdln3XsDBDj
	v2IgpZUsoZlE/RtExPi4uSMtwGqk2SaR101bU+McGxl9R1wtICwcB/0OejZLDvmxtzGBR
X-Gm-Gg: AYBFou1NkZeDLQWicstip7VNuqcvFxTFFav7I6FeL4yV7N6HycoNc+FrYjP+xXtRSsT
	+maFiZG++ynjgQSuz4tviiC+2EpbQU4S47Xm4PIHMfQE+LhC5deXdPN1NrZEvErM6hcZsq+kFMy
	jwvQXaLTGkJiMI31glTf5X3MO/Cz4UIBQe/Oly6JOSS7aOAiXRwr8oAq6ONDrH8lRNKVSERDgm8
	snPtirMAPg/JKxtSEYFdtmr6vx3tE4OiEDgyOqPK20jgLfLrHWFDsTxyiWaAlEzdqIlbdaEdNRP
	zlUy/GaX1QWVKiW+Q6/SKoNy9MG5/h/0rWa17BXAZkSNo3znfOy90BhlHBzUyUMHCyhKE5l5tUq
	zTDK6cmFwhMl53hnmtfYhIw==
X-Received: by 2002:a05:620a:a98a:20b0:93e:508b:7800 with SMTP id af79cd13be357-93f6f530a90mr283284085a.0.1792741794533;
        Fri, 23 Oct 2026 00:49:54 -0700 (PDT)
X-Received: by 2002:a05:620a:a98a:20b0:93e:508b:7800 with SMTP id af79cd13be357-93f6f530a90mr283282185a.0.1792741794106;
        Fri, 23 Oct 2026 00:49:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5caf64asm69939566b.56.2026.10.23.00.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 00:49:53 -0700 (PDT)
Message-ID: <777559d4-45d3-4ffe-895d-6786f60e4631@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 09:49:51 +0200
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
Subject: Re: HP OmniBook X 16 (X2 Elite, Mahua): DT bring-up report and
 questions
To: Jeff Roach <jeff.roach0@gmail.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
References: <CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com>
 <4e031de2-6564-4e63-9102-799a0b435689@oss.qualcomm.com>
 <CAAnD8RZtjvwOAfRWGyQzaVqPepozCWOkRiP9F-eiG2=E0QKXrA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAAnD8RZtjvwOAfRWGyQzaVqPepozCWOkRiP9F-eiG2=E0QKXrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfX6+QVMxi55D+O
 k2nfUzKP/IvdPn50Kg509J5pViuCTHD4Et0iSOgKplLo1anSo6uLf3nGGEd5X1oBoXVrToB4itE
 oZrPEUrRZggzKnhJr0542VV/MRX4mNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMSBTYWx0ZWRfXzDUNOICRTA2N
 pscJhbacBYz0qGdCloL7nbCTmuNUofFZqBQMKkEZoqT4tktADvpzdk6w4woYGq3EYZjqU9Ltxir
 W6Z44X7wDfDFMZmsVHzsGiVJI57sM1r5L4VUSNmLyisYUHLxyzoouExIRKiqlJYLopZC4jcYKO8
 EcmDAqvuh/F/wxy/n4kx1KEljYXEfZNzhuOIfRxuvLcCiVfldKmxlrpMqV10V+94bJ/Z0LqJxjf
 IzrML/1ifi9cF1DBmU8cx8hglkO3djEqSacHENIMnVGeCQK8+kxRi+Q5eMTA9/vN4dpoDeBRX3t
 Mx+sM+X+BqG2UXxJShUtiUPQ3HiqoHO7WEa5r1rS4gq/1aRJRn1EZ+gGJyavgZQXT+sexEl3eNt
 v2BcwGWLWKtdKFpgJLZVLi3SQrT8HAN69hyHBVcm0JjGlbMCgx939UULakQ3RTe/y0QM5xmYOrJ
 jdIPiiIXlDqGxy4IigQ==
X-Proofpoint-ORIG-GUID: KZbFO2BuUZWQhMMiaRGPbIKRNvpOUDAf
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb11a3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=1B70FcS-J1CPxdOntkEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KZbFO2BuUZWQhMMiaRGPbIKRNvpOUDAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230031

On 10/22/26 9:03 PM, Jeff Roach wrote:
> On Thu, Oct 22, 2026 at 3:17 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> https://lore.kernel.org/lkml/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/
>>
>> Please check this series for Mahua support, especially the DT patch.
>>
>> -Akhil.
> 
> 
> Thanks, that was it. I applied patch 3 (drm/msm/a8xx: Add Mahua GPU
> support) and patch 5 (arm64: dts: qcom: mahua: Support GPU and GMU) on
> top of the Ubuntu 7.3 kernel (msm.ko built out of tree), and the
> rendering corruption is gone.
> 
> Details:
> - The GPU binds, the GMU firmware loads, and there are no faults or
>   hangs in the kernel log.
> - MSM_PARAM_GMEM_SIZE now reports 0xfc0000 (15.75 MiB) instead of the
>   full Glymur size.
> - gnome-shell (freedreno GL), a GTK4 Vulkan app (turnip) and WebKitGTK
>   with GPU raster all render cleanly without the FD_MESA_DEBUG=sysmem /
>   TU_DEBUG=sysmem workaround. The WebKit case used to cause CCU write
>   translation faults and hangcheck recoveries; it doesn't anymore.
> - GMU firmware v5.2.38, Mesa 26.2.4.
> 
> One caveat: the newest released Mesa (26.2.x, 26.2.4 here) does not know
> chip id 0x44060030, so I added a local hack in MSM_PARAM_CHIP_ID that
> reports it as 0x44070031 (Glymur's 3-slice X2-85, which Mesa main treats
> as the same GPU). Is there a plan to get the new id into a Mesa stable
> release? Until then, users on released Mesa won't get a working GPU from
> these patches alone.
> 
> For patches 3 and 5, with the above caveat:
> 
> Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (X2
> Elite, Mahua)

Going forward, please only keep tags (such as tested-by) as replies to
the thread that they belong to. Please also reply to each specific patch
from a series instead of the cover letter (which is interpreted as
"tested everything" but it often doesn't make sense - e.g. Krzysztof will
tell you about how you couldn't have tested dt-bindings changes)

> Since this is outside the series thread, please feel free to carry
> the tag into v2 by hand.

The email address of the person who sends over the tag ought to match
the email in the tag itself

Konrad

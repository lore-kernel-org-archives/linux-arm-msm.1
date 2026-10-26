Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015949;
	b=KbGXZahxoZLt/O0zFURUsS1QSiqZH+cxXe83yajFBFkmSCAjdRNzfMmleShIwxIcdwof
	 EY5S+1GRug45f76r/QdNtNMTLztSikzlbpjNOL4tFiN4FLmkt2wOLqXTzBvSgZ92A/HRp
	 BsZ/ICxvyN4J4hcqL3ddhP5IvEKU7yG+yHZEL6ux8uEvuxv/IzD8DyO+cTEtgmHligwhO
	 +W2VogNcEm4FsX/NewxogFNXJJetFAGgEqxh/egDPfl1B//LMaoOF8i2kIt92cAFwUvxW
	 8kKUVQCcpIKYWsb+cTMIAkT0EdZBK/KFq7lsZVgHR280NmJnDilELdT5a3a3DUdRyZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IsV99hi88PjkYSWI90A+gZYiPZ8DnKRkCVaWs6NIztY=;
	b=TUpn92rAkxN+I8pQu6nJNVqtkx9DH3yL6HDRjI3cjdRM7OvD6AjS6u2962JTlNS1Y+9v
	 NhwIPfDBIEOBZZ51GwU2ZUD9UhQ3U0JZ8lZfmKjft7K4QNkKvwB+KpA/W4tR8hAS06Ubw
	 rv8gMTN23vk1Ots4lvIIIfbjwILyYqAB22HqX2XIvR2GVzcqIIw9rDZeZrZZRh2qKGs9x
	 7BF7ZtyyQYXiKad88qWX+XxIu3K1mrV07blJglhtAfC/1ytWgCOJ691pdg+Ne7CIADHfR
	 r1+zfQbuTJyE2yx8jcmERqo/N0fJtjDTBvGcAE8eY1zI5pET9j2sVAFdMi1rdn1NdDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLLvVPar;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f2UIo95c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D69E606A32A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D69E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLLvVPar;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f2UIo95c
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt12x3562295
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IsV99hi88PjkYSWI90A+gZYiPZ8DnKRkCVaWs6NIztY=; b=DLLvVParQf6/HTmo
	xMkJAaRYx/CNErg3qP5d373mfmkRMlG66TUm7dlT8HzFBnWBcTukab/whPunc1lA
	K0rVIjvllc85JiD1ZVo+TuCsCBUTtwtEdBM9GggqIJq0ujL2InfRQzN7LFO0qEa9
	8Ezy6s6QNxkgyn+hrW/ZH/jry7Qb/4fqMICpV8/EbF7XtpDMbbeEayFc6N3a6/PW
	e2A2nqFoTBOHdTW2cLXfE80Q8+SKh5pRhBkViLKswYyMKihZUhtwyqRirCnfIl7s
	voy8liL+X5m7hHXxY9k6lYNGdMGklZqe+9F+xpUL9B40C3+Ttwc1Vk3bebjBfuQe
	t5E1iw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s90e3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:59:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e58614290so35747185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 04:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015946; x=1793620746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsV99hi88PjkYSWI90A+gZYiPZ8DnKRkCVaWs6NIztY=;
        b=f2UIo95cr8WCBxV4Nxt1/O7LnBls+f7NXgETkmWDCjDlwoKgHGpeJO8vg9++u0L/0S
         VWbcxJxr5SxdxW5TWcwvJ93tnUL+pSaAj4CTvVnxKwvqETc9u4mZLZLLmpzY1TqVkStk
         ylIVUswJLCqe3m5xWgA4CH1aWVm9xX/3EJ4r9iYI5i/AnF7HqxvCaXO1Z5trwSX63mGy
         0F5K4gzDSpExgqyoUUaxO9yKs7fqcQ0GSDEoSwBF7d0HwCIn9ySPk7ohgd9ScLpbH9/o
         XgBB0esC0Fv4T4xev8v1GLAhXMRHwL02UVAnZkCLlKCO31iS3zQbnBluBpsohfV8StnC
         2WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015946; x=1793620746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsV99hi88PjkYSWI90A+gZYiPZ8DnKRkCVaWs6NIztY=;
        b=oGISQJEOX4tMm4pG9UBQEb4nzlpZB1MIGWB5qSIXHFTJmEi4kjRLdFVpb2qWmKg4Et
         BegjEYGyKnQm+hwHaUE7f612K4JfeGsuxG4yLsp0RPybLStsl62Ma+TVNshHHFI7dLGd
         8Kh8wqJrIZziIAt/zswWfusKJ+VPjk7oT595euYy4jXxiVFc18A5inK+C/s6jHJPI0QX
         +LGdeAL/z8UbDOGknnrhcbEEKRohdwfvJh0eVngCCkmjTp9TtRVjf/O/u2N/Mxz2s672
         AHdVVApanXkcF4O3+ZPgBORgG6Ttfe8RosbKveHrLMsiwmWVKQy9enGwTv8z17ydE9Es
         cbFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQtmD0PzKgdksIB3NQNA7EPQskvwJjK8rjAPVcZ1eJ8MxymtjPqCutZS7KUfPraclsIaGHNU+bqCNJcuuw@vger.kernel.org
X-Gm-Message-State: AFq9FYJj6gS5BtFBwSL3BJk7StCIXKhcWFrk5jJHxsWLq8siR1l/D3eA
	D1Y+XLvAYtC3T0ivSx8yqpHLL6CfubXpu/HUfFSh2Uaqs2MbNJqTycO7vYjG/2maiU6BqOziBrB
	Zh89C/T29LEeT8jtNH8aVFOBkJqbZ7U17ZdPZkRuQKr6nxduUrDPZen3+hvkMnZsOyCTZ
X-Gm-Gg: AYBFou2kej/g/i3TRbdma6bndQUW8hBDla/0XHu9BpJoUipQ3tLAWGX8dze20lHdXNu
	wHcq4gMWcdmFORElDur0aMaby3BqfhRIaa5SHzWz7xwMTe3Ncja6JZ+9e5Up/V3pxSyMSsWDyIy
	RVua7WLjtrVMheiLX0pI3i0qCiwQmoLBHlcMiqr+8eL5K4iLGGWtXU5f4f3WAkXWfhHfMdJ/XEd
	MzI9QuLIOfBUm2K3RdzfqKH2zpGsYgc9URL27gxhPLwgO0+5p6FRAo5okgr2WUxqSzIr050lxAZ
	a/Q1Qwc5tSDoCWV+vVq5Jgh5KE7O67B88Vt7wII5ygRh+wZXqugVoUwhD69wDELfqc7znjGepZA
	y07eM/kRdWpiL3Gq+0ZIDAA==
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-940ef951f4dmr1003735385a.6.1793015946284;
        Mon, 26 Oct 2026 04:59:06 -0700 (PDT)
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-940ef951f4dmr1003732885a.6.1793015945868;
        Mon, 26 Oct 2026 04:59:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b47sm310666466b.40.2026.10.26.04.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 04:59:04 -0700 (PDT)
Message-ID: <f0bd8179-f211-4d2e-bb0f-a419744de2ea@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:59:03 +0100
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
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: sc8280xp: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-4-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-4-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfX9JyO0wq/gsf1
 IvReg8vrR6uV5Vy3SLEuFDTj+qJfjITAFVeKL5d01wbpkV765PCY8mI+zq9wXAVfO4or4omRxL2
 iDohw7gNl8JW6q+BCdAj1iKSUdoBT50tS3G5x47MScPVxBEiv/q9HbECZpT+krHc2KtcBkQZRXF
 dC3fASvL9wWe4OaVarNonTpB8mdv6EKMmPwagNmeS8Vz6Cf57XvABVtgttcq3EsQuyBqQ6ezFpq
 I2d7pUy0wUSJ9pZ/ZqAWvniYzHJJgeCqU0twcCcXk0qus7+scwVVb9Qz0/2J5UIk99uip/e3lVa
 /i0TCIn42abQLrKf74D2X6upFImlbUyD/K7WbsAosmt2tcJjoduhXqLQTCuYv/VpSHIvZKH/Ps/
 iluxdgVTSUsVC35Hm3DYh001vdZmOGpwOlYRXCi1t7vz29SFc3IF5O/BGj/hK9cUlr9vXzJ1Vdi
 4rmPnt31NBZr7aXskwA==
X-Proofpoint-ORIG-GUID: MEL9u7hvIfjgN_XJZA95rP19PveOW3CG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfX5LVXX0ULV/a/
 CYWUAt/lrV6OLdKaq/tDxH5ynu+ypsU77hfYVIBf/iDCa+F6ukbjoQC7HVGmXxAG4PFpIqtSqDE
 Kz8LgKKxXgsGXOumPcFZ9snkfanWOEA=
X-Proofpoint-GUID: MEL9u7hvIfjgN_XJZA95rP19PveOW3CG
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf408b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=khcIRSTurGpjo1Y0ADwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260047

On 10/23/26 11:03 AM, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from sc8280xp device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

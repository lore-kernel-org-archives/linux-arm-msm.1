Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBDF364EB1
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 20:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786737891; cv=none; b=ApUVLBqvq4ibsGXjxpjmifNZdM2H2wP1EF+q2L1H/7aXHPzNAljtcJJijlGKhQhfrwFKfUUjCQQ2StYOZvT29zKevYD0OwLWx1w+iQJnQjTiv48dOQGHQl3oqyGtxOPUNb7QnEY9XZna9BvBexzV8RZa6TRjmTjqB0a9yCDm40U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786737891; c=relaxed/simple;
	bh=PqxbGeU3AlFbbuLO4Qx6KTlR3cHdsKgstwuszsbi9Lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jlmTcqPcORBmMgGVCBw9jRnqgFaXFzpVaNIcDTVqPJNDw4lEZqREqCB3VXlTFXxt/0+IKUxhKjAuXccG1Oy6TtgtNupRFDy7xNccZQDajF6AiozgOBGnKsV2n2MCJ3Lo1GemjUlf99YutKxO+BB/cKneEFVSkKxcHZ3XRkDD4Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxs8rgvD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OuaFt0mI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxs8rgvD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OuaFt0mI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EJgpSn3738904
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 20:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Fpve06qOwXKVqrVK9hpQZq9j0jlXptVgQg8F0HgyqI=; b=fxs8rgvD+8Kcn6uY
	XzVeo66PlA7orGXZMh99e3n+QdW3etGUNe/PEN2w6kv6HmBf4XMj/Km5lvXyzE/t
	Bj5k1aH9uJAMn2sRVHKYjIjofflTxSOcCpy5nUyHyQzgAZRoEXPSVxct+lcxO5Fc
	JJDsEz+pF8poeKM8/vD2WnWcB9gC6kRMo3wCG4udnFFMvSmkxKFcfO/ZfzN9ScHh
	527FKd6HwiO/97fEMhkNkIoEHA7Y2UOU4FnmtiUvw6ncFeZxf/sK8T6kzxdGyy6Y
	v8SKdBsjWsYvVrhmpyaql9jveu7T+bnYAPX3g4oqYO/P7hBZ7YGuK0irb8QeZUUY
	7FxAQg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20sj2je8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 20:04:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso1651868a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 13:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786737889; x=1787342689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Fpve06qOwXKVqrVK9hpQZq9j0jlXptVgQg8F0HgyqI=;
        b=OuaFt0mIEeOV7fwy0ZvKN8uSPHHLPMDFU18f1rRBmyGcqZ8hiGKgJJRwqx9OSUO1ez
         syOfIazZhJEmScOee27qJX09+NyaVUctt2ffJGCuiFxRwZrBftSTa4ZwcRLdbYKuTvgr
         5qplflkbBpd8/lIRDM2z+P7OQXrqDrxU/YLVBf+1wmDR0pvq0NkgZF7nKMc4LA1rFslO
         qBRqUV62xpZsIlYsqljKQ16ByOrnL+q6EK2VNhYFGBihaDN1x28MWi/yMmFdHSf8HNlm
         ZLOBUKy+SQJhZKkWa1FeZFai6j/EXbPuS/HZnlo/zH619hbEPDfQXjrJU4Mk4rPDSAdF
         qj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786737889; x=1787342689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Fpve06qOwXKVqrVK9hpQZq9j0jlXptVgQg8F0HgyqI=;
        b=jw384BW4dxlCL3DIYE38AvLuCELjA4XsKrTXcrDpi7nur++jfTzFEu5V9fiTZO62vx
         Jy/pzhYaj02978x3jF9K32ulW8wxGFtUJ9uFDZHe3I90UPmFqSQppqW2/FF2q384ykYJ
         kqgiQPM9BYmHBRcutbzzFTuk1KbYz3+tdFkOnQxg9RRjuVeryBfzy/+ozr0Pbkgl48Ye
         HGjGf23AWQs38f/nveyvCEb9EeGGTkKYUlm8zpviNDHBasjb3gn17hJMnJiCY85WfX5t
         eKZqTb3thTZ3Y3eiz8BfOCV/6b8xZZxA4qxAka05QiGvMD6+uCaE7yCOAi5+8kjfrp1p
         KhuQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwInMaF8E5BXFGzms8AOVaI0VREV+zzNTINKicm3a37pb/yO9Kz5+3rvaGN9DdtpZlOGACJE0meVilc2N4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw3WarRfIukqr0Xt3U1t4dWj0GtWqc5P6tCEg3DwSiKF8zYHB2
	Ed1hhW9EtWlNzuRIZZYrbiYisXhjYSjykG87GyCqxxHD8pxa1vu4i+gkQOlNvJwEo36wfEU7Gv+
	ak+YHLLk7nMWFTGEZt0MvOZFk+tOy/V4itMI2buBHVSEDvOEeRJWnO0mNxomOD1+dGIfr
X-Gm-Gg: AR+sD10I8dwjx/WVKDByxg2pEOZa6E1x3tnheRLilWbDhY9DLmic63Wb+1gF1oLjVKq
	on+SxPY400MpAtDocdBiE8ynnbyj7QgUET2vQvFx3Y+0e85yl1OKpyz17X8grbw208OZKOnuvvS
	Is2D/pH5UB93Bb42G3MY70IWi5LWoZul7TXGA1coyEcdqlb1pDggKHctg5nAG6HM/N7+AG68ZsP
	ViJnI2PEbYaeX7oTsbtZJ9CCYLANHiXI6LIAYbKp6EdpI8O7f4zxX9ENrzQojbwnZ38y9oyf+AH
	X1LMlJQC/U+Up04wxUEbCTDTf9Bi6VdtllYcoZkzSayllWmS8PYVpHaueUFi8gtJbn3ehVLpb9i
	0RfEY1IYfG+jMVQuKpFN1QDYKD7oooXNS+5vc+00xgaP5t+pyaL86bg==
X-Received: by 2002:a17:90b:3147:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3933b6f1c52mr8883186a91.1.1786737889197;
        Fri, 14 Aug 2026 13:04:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3147:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3933b6f1c52mr8883117a91.1.1786737888649;
        Fri, 14 Aug 2026 13:04:48 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bda546sm8071670eec.6.2026.08.14.13.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 13:04:48 -0700 (PDT)
Message-ID: <369f1fa7-1849-4164-8b72-c27b00329b06@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 14:04:46 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Fix runtime PM imbalance for
 no_m3 devices
To: Alexandra Lu <alexandra.lu@nokia.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260807143353.1932381-1-alexandra.lu@nokia.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260807143353.1932381-1-alexandra.lu@nokia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE1NCBTYWx0ZWRfXzji/toTxa+eK
 u8HIgSxMFbrgRwqiKaf0y5YCrV8ONEQqSI7OVQHUKQnEobfLtYm4FyZyWPn0yTfBQ6DzxnG+F87
 XNoTyQVUrym4Z/O6e3FveWhwGNXqyBCZ4uxHi783OxivaKM7bCv0XWeZ7oD/JZiZqnsBxYxPUp1
 OiLSDWH/iLmymWhCA2lTTfnFQMQZ0us45dh25hhc9bpwH9SpXXTUO76SFL1bLt8JKs1RTyaIwtM
 CglCuW1pgoD+qBHGuq8CF2RQfd8lJFnoUkuqUjTYazANXQs/VWxzqPTn+1q2hJJTSR/DXDq9Ztn
 XlkihydYt4hWJXICzcKEumwF0Ea9iHaHqsBXm9xhk6Eo2+kNzjA7BrcoZMtu8srh8MfeD0MeeTb
 PVMa74XsWoKgLbLaEJJ8VHlxkKgmIjilP7H5vcOZd9T9OcH/KAvmmR/E2iYPmziTXvJDdNgDku0
 GveB40L/5/D4TM027Dw==
X-Proofpoint-GUID: gLFHy9OKZ4y8MAZfa76_jHbAUFfqhciG
X-Proofpoint-ORIG-GUID: gLFHy9OKZ4y8MAZfa76_jHbAUFfqhciG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE1NCBTYWx0ZWRfX5Q0AMg+zOFXT
 uoXXri8wp7hVG8AyNPN681QrEe2wdNNgogZ3iDeyIRpJI87N720F9hU9KIt5Yo8AOAcUGp6cgzf
 WRTMF1k+dR/t5ZVnebNSl+CGIMjHdc8=
X-Authority-Analysis: v=2.4 cv=cMTQdFeN c=1 sm=1 tr=0 ts=6a7f74e1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=9qxNCY_qAAAA:8 a=EUspDBNiAAAA:8 a=y6RN0brJjB4wVIL3e4AA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140154

On 8/7/2026 8:33 AM, Alexandra Lu wrote:
> mhi_pci_probe() drops the runtime PM reference taken by local_pci_probe()
> only when the device supports both PME from D3hot and M3, but
> mhi_pci_remove() re-takes it based on PME capability alone, without
> checking no_m3.
> 
> For a device that is PME capable and has no_m3 set, probe therefore never
> drops the reference while remove takes an extra one, leaving the runtime
> PM usage count one higher after every bind/unbind cycle.  That is benign
> for the device being removed, since the PCI core resumes it to D0 on
> unbind regardless, but the struct device outlives the binding, so the
> count accumulates across repeated cycles and can end up preventing
> runtime suspend altogether.
> 
> Cache no_m3 in the driver's private data, as is already done for
> reset_on_remove, and gate the removal side on it as well.  Unlike
> reset_on_remove it is cached for virtual functions too, because the probe
> side gate tests info->no_m3 for physical and virtual functions alike.
> 
> QDU100 is currently the only device that sets no_m3.
> 
> Fixes: 0494cf9793b7 ("bus: mhi: host: pci_generic: Disable runtime PM for QDU100")
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Alexandra Lu <alexandra.lu@nokia.com>

Seems sane to me.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104751;
	b=Orc0QZ7eshsjYg1nnO031mVnJ2HOuSDkcijNnsaIo1JwPSps9xUqKDp145IXM6rKmfYk
	 jJ2qZVQ3fnsglqeLMLf+OAL83OwylHqZDIhUVVfhgPF12WkYcTRbclGEYPX4pQO4XfjLO
	 CN+yIMboNCgPoFTIe26HpWtd5uG8ugD2cOyw5E6kUKotYvTn7PgvO3d9uYKFpz38IyU2I
	 17YoTgYuTNXNoimgeIjpgdWg1tUJpY1NLM1S8HnmoetYLgsFP4jDbWS2gMKe6gvsA49gC
	 F8iEtafhvT0FWW9VkP2PHtu8fSmmox2DZ4C94JakX8NQfa4HZfnWgccZYBQVKjTxU+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104751;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pe8Sj0HJtyH6uzV+gQkDBmTM9okX+JshLBnFw66vHhM=;
	b=DKXlh94kQ/ITTxoEzr4wIJbJTHL27KFo3XnNWbYrK2Dpsubyzmd45weY4EiMvX1WUsGh
	 blEiMRuctOdfJhmrYBSPEUxnIStixH3i/U7v0RtY90fbmcBp0PU5ngZGy+uc1NlmJopxX
	 ohVN+6rItEEuWmM27STzOe1p0eT+WID+kcBg0zKobinWWwurWHC2+sVURpYMWHQPUQLX4
	 Zzsx3gaxzz3GjNecX5UjoLREGaKI/fgrKddxycnXbbreptGjgfvuUZUdZIkw71qUv0Nb4
	 ivHy4iVrdLGojFwDNwpR/V8T+vFqwLV06nR4FwTd7nW9OYof1QwWU+Gon0PbHw0JIPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pvjtCN0W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pe4Dxl0C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE0F606A337
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DE0F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pvjtCN0W;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pe4Dxl0C
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdsRn1973264
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pe8Sj0HJtyH6uzV+gQkDBmTM9okX+JshLBnFw66vHhM=; b=pvjtCN0Wqj2XrZ4e
	UIBV36XzWZKnwFhOsem/tlER2xVxXi+vo69aqus5wuFWUS3l/LEEoDJYO1TXnnbw
	tm1nPIJTrU8ZX6hIcggcXVOTRrDHfZcI/NEQPrv4s6O/hmxqhzo9ka0t2DAXPUcj
	aeb9Q5vSYIkUmFj2cYb4sIXzL1JDcFDXnxZX3cNDrI2/QLZpwPZtsc+H5PPYmqPC
	y3uybWlAQwuKFIKH05gI8z96UfDdrln6SHvcj7N+yI198I1GZnNPN+8F7GCWnl8C
	yZLrOWvyFJlCvBhlpylbO//huC6JJTfqw54eiwsbrObrESipRCHb2WAx5aqGuFr4
	dScenQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1gjj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:39:10 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so3273969c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793104750; x=1793709550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pe8Sj0HJtyH6uzV+gQkDBmTM9okX+JshLBnFw66vHhM=;
        b=Pe4Dxl0CYe8xc5+N88zDpxkzJFNkxh37wyQlTRvvXcK/A/8OhMlNf5muaRX+JITTGA
         +EEVvcqtcLeUvfREps0bmLfH9exRbeyUUB+pI0ZcGZLh8Qx269coeCiyyRbMb0fW1X2E
         IyJx6JjvLbubrioncE6wCqswrPJMRvpRcsCrYmGXbGaRxQ56U8uDxO1GbYCNQMOyPfiB
         PBRpbzO3JYUHIRHx1eThI1diV3KworGf7ObLMgEK4sqezE5RieEPD3KK5ZoZVkQWrWge
         2aFD1MOYezJMCJ1hbNuCR0A4T+dyvbz5f7VTLaqXmJXTXqtSBw+9SWE6JdeJ9dL3Pw8S
         PTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104750; x=1793709550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pe8Sj0HJtyH6uzV+gQkDBmTM9okX+JshLBnFw66vHhM=;
        b=e/HnzZiNwwlbTKBBdUDNmOyUP5cq2PhvZT1mnEuDPFk6NRp3LKvaC4q5RPnPqebxhy
         hqOK5x0Kz5JaHbdz6oTzYw2DV5G062+aiveA3J1CaU8erARqAKEoc1crWd9ZYZIeif+8
         7HBQvS17W2N1PZW9bORH9IZzjOy2qW9Zy2AwStHhrcdpAeB6Y5McYvGAd3xRqm2fJpCB
         bpi0kJlseqCzsKI6abDdeUNtdP805MkIAZE3FPXZ8+x+CBDwUgmxk/ZIx/Bbgnccsjax
         jpuF/y4J334Zz0jzPgmHtdC6GKx9eBXdcOveywLrgydPTyWsaFQ4LWuvpXyyKRSZBlOs
         8G/g==
X-Gm-Message-State: AFq9FYJhyQwutFzbqTzR+uZYHVCyTX1AbKf30BXHjOy8I1LyWEhauor7
	juUDTl1oopUMNiGxskm6bXOuB+thodmgE6QcNtcZ0TH6ZSMn62tPmMxL81GfZd/idihZUTt2eI8
	53vvH+VClgAhoSA8YuXAWs+SX5rdlCpf6zp1sEXZMtrjz324dd1gxmWOZWbR5nVXMsBMF
X-Gm-Gg: AYBFou3DNb9NnDxgm+5wpNQ7Pd1SdyU3c5p3uD5mg7VGOyJX1aNjsr0eOfKZpD5cOOl
	Bq+HXdZSxvbv7fuDBdAjEu3oFWrZnyllzIRedSELzterSQX5c1dRJwjT1Jcr3ZtaJ9y+r2c77dM
	GTdARtVz+AmUwlVUbvqjZYdpXykpD0er07B+zpMAMCc1+YU62RSHpLcH0Y5yQscvEJe4WZNnzeN
	lzg2IuQPd4j37Tmm2P0Be6mhhR7uS0PTuGPFy/PWKXhO+YwAH56lROKZNqNpU+dIrNHWa88Esqv
	Mb8B1LyOHVGD+yALDmINslc184Tu4oACIbPSNK119P+NKgOZKJJA1NwRJmJDMURwM44Ae3Vi5Hg
	ZFwahBL3vTbMu9HNv5JWDjCSm/Q==
X-Received: by 2002:a05:7022:29c:20b0:1a5:32b2:9053 with SMTP id a92af1059eb24-1a532b293a4mr1466960c88.37.1793104749650;
        Tue, 27 Oct 2026 05:39:09 -0700 (PDT)
X-Received: by 2002:a05:7022:29c:20b0:1a5:32b2:9053 with SMTP id a92af1059eb24-1a532b293a4mr1466931c88.37.1793104749144;
        Tue, 27 Oct 2026 05:39:09 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a21bc6cbsm32798498c88.16.2026.10.27.05.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:39:08 -0700 (PDT)
Message-ID: <3ad598f5-2e02-45ed-bc17-e4b6119ba2ec@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:09:01 +0530
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
Subject: Re: [PATCH v2 2/9] irqchip: irq-qcom-mpm: Register MPM with cpu_pm
 for RPM notification
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
 <be076bf7-52fa-4c93-9d0f-46a8d06ae920@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <be076bf7-52fa-4c93-9d0f-46a8d06ae920@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae09b6e cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ddxl3Jw30jVTiRF8AwAA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: __FiKzdGsyFzkubJmnV3Ebu_7lSqhwwF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX0JONRofu6ZV5
 NHFbRi390IjKDA0pLBHpOG/jiegf0ewTVRhBW4tAknWj9U7KwpBho4U4Gjmm20X7oZPUPlvfD8t
 ReD5mF4mW00sx8qko92Jbi5EwGMfhmA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfXwJwrvxcBxH2y
 KLqG0U2Cb6RP9axTV6eGSCZcGxhKPQzM4Hr3dU3ErLcpviu2GSspnVJtAPSOxemUatsH6wMKK2Z
 X5lRZ5rE15IVZdNv5YCBurgeRNiddatEj+AMxgC5b+UXQFdRGyCyTkzxp6mrkhO+QuV4pRM7A7N
 7RmJvZv+D2olgqBk/vRTmKVh7yiPLmkV6/9DYUEmaXHb1fumR0hNXF6YqdrXIKiWuVKuYrKtA2j
 2ckXmCla45Sj+7VCZJ19o+zkPo2iRfeCj37xobTGq8+znZyGadXT4Tmdngcwg4twOtyGsShnCHz
 ikKUWix7QNeRiiwhPZY31+Y9qrrgOgnrvDaxiDJqRaOAm4ThG2KTBNRnOmWhaoWivsax+xvHeDR
 yStWaf1pOQc2t8HlF2i5IrX9B1j4JjUyzEurN9qJP62fo/DyeQ4oqbcwZYGjWaZ4Xfw67gKm3RF
 yxANKGZq0wGNXA8q9Uw==
X-Proofpoint-GUID: __FiKzdGsyFzkubJmnV3Ebu_7lSqhwwF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270050



On 19-10-2026 16:40, Konrad Dybcio wrote:
> On 10/15/26 11:55 AM, Sneh Mankad wrote:
>> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
>> the latest wake up capable interrupts when the CPU cluster is entering the
>> deepest idle state. This is done by sending IPC interrupt to RPM and is
>> implemented as .power_off() callback by registering MPM as parent power
>> domain to CPU cluster.
> 
> GPT suggests to register the notifier later, so that if
> mbox_request_channel() probedefers we get a clean unwinding.
> 
> It also suggests to skip pm_genpd_remove() in the non-legacy
> case, but the API tolerates nullptrs (although it does return
> -EINVAL, but we ignore the value)

I will move the genPD/cpu_pm registration after mbox_request_channel() to fix this.
As for pm_genpd_remove(), as you mentioned it is harmless since it will return -EINVAL
without disturbing anything else.

Thanks,
Sneh


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793770594;
	b=07wttMPc4EYQrq4YXomX8kbQfR7D1SKr5b2GXjNBcBZJ87FqZtOz3cMe9dKADcZC/I8O
	 OH/n15IW7nSB0SkDYnPhPFaQgu9js5bcgOZ4i8NVGx+eKRO0EI+qGqKE946bOCpvtr6rj
	 na9nHop9Mc58x88BNfzfowJoPLF2UDpRF4Sd7j9VlbIhFJe5kItQj1qVNLdr8j1By/4gX
	 urqaldNBYlCOmbvTdiGixl3DHrWKYJ+j02zX8Peb/+cT+64ZAB7E82UjjXLPlpW46b9uc
	 nno49PM7nxvu1ED1PyV0yWxOh4/VLukw14UsqkBtVkoOJMpZFp/H4AKf/dJSLqAs7zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793770594;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IYtH/SnSy9AjEKHDiN2nuLd+EI4m1HjRC8v3W6Xw+00=;
	b=qj7sfeCNrmo4mPXJHTIZ14AUlBEum0KnO+A1BwXwee1p5V5a5ynnMT8AEWz3uIQHV27o
	 NuYgggGl2IHwSmP49ieXB4BbjlR1N1H75Qsz0xU9cy5G64InUFuNPMm9kr9KKiFRqA/Ja
	 Ssb8wpoWKkevAdNbfgtbHAU35FE8K3bUxvdCUuuoedbfCt55xncmObjGMw41hdw7KDJ/3
	 uW3WctkhasNzPyZt/T2mMuydGBTxD4TCEL/RCvdtwAICJp5F8x7dCQbBBA8zJp0beaZaC
	 7dbJZ0d28ZMoMU6Adr0MuGBERc6n4NicgOh/25iU8mDUWsqF23AE0mCoSzDGhL5+INg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UvGAnR2y;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MkZs77EH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208C2606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 05:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 208C2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UvGAnR2y;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MkZs77EH
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RwUI3868170
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 05:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IYtH/SnSy9AjEKHDiN2nuLd+EI4m1HjRC8v3W6Xw+00=; b=UvGAnR2yTFvuEiSw
	VK2U+znlfnOxWXNA/sPLMZ1NvNeoEYyZfLohFWf6402MrKOxpirR5l6qz+HQjSW6
	9Ir8+EbrRj/PPAoTK5sSP/4KZ83OTyt33oFzaAU7xvyFfcLG/AVmaIo7/vZgsKfp
	GzmYawkDAPPojLLGcmddmpG+YwbKCPMRUY0ghh99m5QJIthd+opu84sC675D1au7
	fbuFQlu5kF3NydIa7L7khV3B+J87nkBlcmEmRUvGLlUITodRGlXC4/bKqpP90bYX
	hmhhRJC/KUl/Y2+SZwplJsbbmw14xFaGdc6Eu9iy+fbmKqdiq6DOgEVPJ9JKY7Bl
	IUhj4Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y23ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 05:36:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so456108eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 21:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793770587; x=1794375387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYtH/SnSy9AjEKHDiN2nuLd+EI4m1HjRC8v3W6Xw+00=;
        b=MkZs77EHJP9hOg7R/kyrEOWa3SYMKLPGYpf5SPwH8i6G2OT462WG0xssw2CJi1AbtT
         vjU6wFJAu1415Amyx85p8lHmr9R9DqRkbQmwPxP51lz4Pq7NpNtvfnkKFq+YaUyUk5vY
         4mfHdHHdGUyUp2gccw869msOKLpACP+f4QAFeY1il8MPSHqeQGMFQF3puft7FIqXhPb2
         x6+oojj7z+7Ds2qpupa8hKU788YhV/Q09vYLVQmDlCCmlfgOWlof0q8mVQ57wxTCtRdm
         rtMw032Ww6ArH+al3zUlPhsprxS1eUcS2jY4wrkvJyiKS2ulCk4Z1wxULHy8546WMYAK
         ckEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793770587; x=1794375387;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYtH/SnSy9AjEKHDiN2nuLd+EI4m1HjRC8v3W6Xw+00=;
        b=1+kqx3QSRbZMNPgAzUJlJo0W54z5WxvgjFHA+Xwg3hwAJJaamA154PBJaUmdmctKmc
         1coI5+pdbzE1kCJ/wGnn83EHJPd4+DosMl10f3kaFPCL+wR84EOWV4f7d0NSBCezrM6M
         Ctl090V5202EcJHhTJIkCfC7l5BE34ib1HQIYxjfiNoaBvOxalStBhlXyxn9wkLt2f3C
         mj6UEYeGd9ZpCgdpXx9WVK7YabXjOrkp2B7Q0bqX8sUAY9BRnyRHsx4j2dy3zENN78r0
         XKxRYri7ust3c2P1q+11jQXnALs2A9+wFIFQ/BKywAU/q4lNcDZWw7LHt3Kcz0Eouuol
         Wp1Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+Oe+pu6aKb4zb+n1Z+pIrxX38SPbh6AmHNHyheC4UXDEyjUbDvzjoEfV2VEoH9uYbqED3W8rKL98n/iSQ@vger.kernel.org
X-Gm-Message-State: APuU4Z+DPpPygmOi6VlCk06LO20oFNgCiAVbKGZdGUpYFgJ49wnd/Pcy
	hH9BsGnW+0ddmbssrPZY/138d1jnAt772RfWkPhrufqL+6XJJIhBIYGCT3th8/KLb8Lv7BUo8G1
	vANPZdNPaABk+20ksDuV70uTFhcxOX8DGc+lHM5fn+b/sFw3rs5bGYREIZGiJ2b9srBUV
X-Gm-Gg: AYBFou3FJSxwBRIpSnCWBHXp3I6g8cjRNYvYEBQuihDQuPn4M6wfPw1IqdNiTsl3mAu
	MCS+buCnHXkQ3/S0AXautABdvF1op7TMN/r1ZXmz/57+WtQv/p0dS3BReeF90pPTteg/a1zvugH
	+pC8qYzeoQSpbIf4P+eS/6Hv454IuX9x7pCxIY7iFWoTvvRAv9vexT4M1tF1AmpPIJNZXEVYRxP
	AhnSNtHP4nphw6K05AADItlG25YdzPRuUjCO4k3glkBLYeDsTgint2Xlv4R2Sojn3XY0BCmT3zT
	6jhNWdqkKLXDSu2FYTUZpRhCmeZUYG20AX2RJLbyEs9hznkb0tpOVRwyRPmUKq0+rlt3GEgm4B9
	mtVp6YCL00HG02tQ8lJdhV5fE/fYTVWqyt5Qe5HqZYavsKoOWaB93i4raVPG3oaw+pwYY7wzMyk
	Vf5pfFjsGPImcLPLPwflkpvhjMtrXLaW0gi8u7BhvboHc47yGL8oNfxw/HpBe7+fXg1CyOhQiY9
	rc=
X-Received: by 2002:a05:693c:6407:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-36a7b3c4f8dmr6743608eec.24.1793770587358;
        Tue, 03 Nov 2026 21:36:27 -0800 (PST)
X-Received: by 2002:a05:693c:6407:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-36a7b3c4f8dmr6743551eec.24.1793770586560;
        Tue, 03 Nov 2026 21:36:26 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3966daasm4765452eec.23.2026.11.03.21.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 21:36:26 -0800 (PST)
Message-ID: <8bed7caf-2b15-4b8a-ae9e-78f34ed780cf@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 11:06:19 +0530
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
 <20261027-mahua-surface-laptop-v2-3-7dd903a12d22@oss.qualcomm.com>
 <e27e0fd4-c072-4d88-8e3d-107fa7a97923@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <e27e0fd4-c072-4d88-8e3d-107fa7a97923@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9x8sSfQR07avYtmjbx4T1ApZy6fJiGi_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMiBTYWx0ZWRfX8kbmGFwGbNla
 THFsRvfLzHkkNniegZNjJQBDXPcw5trf4CuKwRBh4MLn5uE2TMGMfENB1TtRWaY85iXnMORmsTB
 xuNL9jxo29KTL0NCWFtu+eXNrS1jBU7lPLwJQFvGdAYVvo4qcqXE7rUJVh4r6t++ySVkJKO3kwQ
 45TuqFD6AwW0PZCjzj1LMVLGPAUuKpYMt3CNgKeRLJXj7u3352NWdOZ+HdCzSXqOYSg38Tlptzl
 cF/anMLfmkbx41TJet9qShmzs3eAEbpIfT+ro97nkr16shl/r6uEvNG+PKOOGBqa8ZbOyYQlr2k
 /ny1bYcsWVq9iw0mLTC+7KWLNW0eHGWXZq0qLV2+sUDW8w8cAexUjWAj7wK+FqLcg070+sPWoIA
 c2NDfV/bGldMYJUbF+GvQNsFA69mY9I9ilgWBnoTwpVYVwb50uoQbNlmsJ9KLxBVI/ESMxqmKbE
 a7COrMfvSojMWAcFaMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMiBTYWx0ZWRfX3b2yPbi92ulv
 c8FCqikRYQJIBxTBKLb2jy2ZxkJdl/HCPzyWADCJU06xUfXNu6uVPQfjAPZSGHK6grZQGcAjH/W
 p2a1eijnQQ89i4ibWcNUYm2dQ85kBRY=
X-Proofpoint-ORIG-GUID: 9x8sSfQR07avYtmjbx4T1ApZy6fJiGi_
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aeac45c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=YwhHPVNpwWi31JhFHYMA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040022



On 11/2/2026 7:17 PM, Konrad Dybcio wrote:
> On 10/27/26 8:33 AM, Gopikrishna Garmidi wrote:
>> Add support for the Microsoft Surface Laptop 13.8" 8th Edition, which is
>> built on the Mahua SoC. Most of the board follows the Qualcomm reference
>> design. The keyboard, fan and platform profile sit behind the Surface
>> Aggregator Module on uart22, same as on the Surface Laptop 7.
> 
> [...]
> 
> 
>> +		serial0 = &uart22;
>> +		serial1 = &uart14;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
> 
> This sends console output straight into your EC, either enable the
> debug UART and point it there or remove this hunk
> 

Right, thanks. There is no accessible debug UART on this machine
(uart21 is not routed out), so I'll drop the chosen node in v3.

> [...]
> 
>> +	reserved-memory {
>> +		linux,cma {
>> +			compatible = "shared-dma-pool";
>> +			size = <0x0 0x8000000>;
>> +			reusable;
>> +			linux,cma-default;
>> +		};
>> +	};
> 
> This hunk should not be necessary, it was on Hamoa laptops because we
> didn't have control over the PCIe SMMU and needed a CMA space
> 

Ack, will drop it in v3.

Thanks,
Gopikrishna


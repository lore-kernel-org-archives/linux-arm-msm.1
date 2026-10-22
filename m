Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659994;
	b=D8c/FSY0I2X0w/czN9rIHgh8xJOdYBhsVr92PgyK1IKsNBQ8hrutjwcQ+7ERx0KObnw1
	 SjTOxtSi+sC9KxhCtXkCPzxBp0ulnNRIG8XJkQQykSNwFSyl+lihtvlLD42niKWBfenhn
	 TzSYAiS3aWmu3M0MT0HK7XHfy6cSVbhldoxmeLQqodABO+1uIav5G26/7oeH6ph6nbdh+
	 iKw/OIQG4HYI6s2+0E0WqBNd6iNlqlDvBgGUIMpQuR3sVKiDWA5c2wOADxXwAbmvpuj73
	 2gSSiHBC2yONJ7oBHmWb+W1hNRwcRtJG81HpG7UL7fqUAwvfCF3uB4xoLLSwX4RQRUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659994;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=npHEiXGMMSXSXF+CGuDidepu3HoUinr3fxrhvRGkkok=;
	b=dFGGB3sjEe/4VP2tYq20Wt9/nUVeU/hsulJF4VlxV9hfFkJEqa+KUtIkllkIjVO4XuXV
	 YxdjE6O0L7IsEzUBXA7xAoOayPZzh02D6Il9FrqXbt4hpvbP2LZSBFUz5OTDh7Gr1dN6v
	 DinfVE39Jvfh0taUwOmcWpPsRyfIYATB1MkdsU76DgihpiXkfVUR4QsXCTVgETcvy+t7k
	 s+ynfiSzRHUdpFZpXfBL9yzv9LVRiE4fGXPqEjJv3mplCi98YaucrosOjYJxKGE0gaJ0s
	 iAAAmxJU0GRpCXkuZ3gML4kZsCnXuuWBDaIZ6/XESEov0lnWu+rLOwtyUAsm2IASmiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HVzHEZqR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BV+Xi4PL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DC5606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99DC5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HVzHEZqR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BV+Xi4PL
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M704Ri1561294
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	npHEiXGMMSXSXF+CGuDidepu3HoUinr3fxrhvRGkkok=; b=HVzHEZqRXjuNxTUw
	Y6uNhSObfyF61bcnJkBnCdKjLh2B9gfCcEOYKFVF80ZP9qq5J9QyopCgrdBPa0nc
	kwNbh0mQHDcrih5EhIc3B8VIlpxPuv/GMh5UHAIQGgahTUfohjr3aXLxNfTVDbii
	sUoXr0b47H9f0/xixsACr/cjW5fq9e22EsUNry29sACOHOma32LkD9Ho4mFQnvIG
	E3aJeuxvAnHGjoKOfJg3lWAokAqpp5Nhg950biMkiFlmFBZwChwmFFCbC+jkzhnP
	J+aBNOBcneAZasrkKP7mqDC6h3YFbxtlEEmZ49yS2BVlRf9zb0TKeK8SGDQOzvps
	EVzd4A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahmq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:06:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd68b8579f2so712787a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659992; x=1793264792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=npHEiXGMMSXSXF+CGuDidepu3HoUinr3fxrhvRGkkok=;
        b=BV+Xi4PLji/ZeVGnXdtQQcZ0ZlhOAjJasxdTpZmFyjePgC/3NLnEkzHTrPe3y5ZkRW
         +5ZyScxx0H90Ua1stiFs4x7ixx0QK0645ZdqMFCzSTKM39DuCNcRUzqL/Q3VMalajjHS
         oTdYL6TWFPQpoTx2Hju4ypyj/PnidBEcs+skAOnm4Uv3a8RJ+QMiN1ybQtBNDfbhfoTt
         oX8NTEILsc33r8Q+po0yqLafJZsVXesCn3Zy+GQYgGHM1BePtZYJojNwVCt+RTjyyKEM
         +Y5Eg4emBmKWTYUR3qQWL3LqF/k+xhFysMOpKUSkYLqIa0O5QeB3C/frukNTna78tbWW
         BHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659992; x=1793264792;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npHEiXGMMSXSXF+CGuDidepu3HoUinr3fxrhvRGkkok=;
        b=CuOGKR0YFIzTi2vowcA4i7WpmapBAhyy1b0fV6eV5BtKW6sO6P5w75AEk8N34QBAw/
         rJzjfiEtj6KI/Q87evU5CQuQSFLszLWNypo++CtOPEmCcGHWmLH5MBoF5+fne8ounW31
         ih9nSKUVy93qWGeZB4YanjU0r9r7B64Nn4sqPKmiyZCL+hQqzVhw+3cnV40Rhu/d5GOf
         hy3eukAIfnprwP+MluI3FeoF39PZBTIDvr0qWVQQFnz7tbSaxT+SogaXECneo9riu2Id
         1Kc1xPFaiBJ8xtrkDFa+3t8FXotuj2ZcdfNJR78WKkKO6R6+bduawtmrvv1mJqXfrE/L
         lNgg==
X-Forwarded-Encrypted: i=1; AKwUvBz20t0AYPkjh30Ay6VsSjMKrJ5+JxZbIc0qubSSG/Vt1chyaH2D8EIIS6UUbLfF232vQc8toxX/cIhxpOOv@vger.kernel.org
X-Gm-Message-State: AFq9FYIf16BKxnqOyhDciOWHH76/TrfZiomJ21HfsNooTtQUKqzL5PyI
	zvXYwF8ZZVMOdIqURuq9cRklFvW+6+g2CkZ1rh1tuALH6Ov3YkM462n51ic8Tu+UNi0kkE6f9zf
	iNeGOkd2ovYA5iOsF6xrlDyhDMzBCJRtv4q7szmWT9C+nP8yOwlluhB81hLmV6YKowEuh
X-Gm-Gg: AYBFou0KYU8sCZXGMYg5+8B5sRKpVP2WmXa08Zeolu1zhH+Q22F1Cs9NslnsPYnwJ9C
	se/l01OmOlXRm7M/ONxU+yzYw6DYaIEUo111qudxHJqDsflMxdIxTRkLwDLzvGgcVmx7LqYvPsa
	C3kmu5gyxrETilOzP4pprUJhTGfLqOPDvA1CEbar69M9nkevpN7P1xRdXxWsDzybgGf9tG4bSom
	9qUG6JYAa6NqqQZqeANYh59Z4RinQA1CQgx27w5aMv9swkWv8otiD//VSu0q9Rapj7TEWVr6+GE
	O1maU+o7RGUyjwar8kqBLhfdN4FDOZcAkOSmukv/dvtKw32cFrb8ydoHK3vc4LJa4zKA0zPhjYg
	zHGB4Rsot+9JLJv03fODU0h8bL+JNXF2d
X-Received: by 2002:a17:90b:4d02:b0:3a5:133:ca5f with SMTP id 98e67ed59e1d1-3ad86d27ae5mr3754006a91.46.1792659991926;
        Thu, 22 Oct 2026 02:06:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4d02:b0:3a5:133:ca5f with SMTP id 98e67ed59e1d1-3ad86d27ae5mr3753983a91.46.1792659991396;
        Thu, 22 Oct 2026 02:06:31 -0700 (PDT)
Received: from [10.219.56.252] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad83482f35sm4051702a91.1.2026.10.22.02.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:06:30 -0700 (PDT)
Message-ID: <a97f097b-551d-403f-ac7d-726917e5b42c@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:36:25 +0530
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
Subject: Re: [PATCH v1] arm64: dts: qcom: Remove FastRPC compute CB9 entries
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20261016052042.3755352-1-abhinav.parihar@oss.qualcomm.com>
 <9043efbb-7883-43cd-a09e-28fc5304457b@oss.qualcomm.com>
Content-Language: en-US
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
In-Reply-To: <9043efbb-7883-43cd-a09e-28fc5304457b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXzwU78G8xqmTm
 iAJTRP+b7Oz7wcW+haEVxw6Vy0oZASiaqhf6WdgpIdsImFQH5K95TPlqyB16NyctfGnA8K0Zl16
 0udyphroXOGkIXzv66FX2edKGLINan9mFdkDVDFlbjKIlT89ItUaHvBTDHwZQNxm6alk/5Nf1Sb
 iaGTylg/UDwckMMnd1aStu9KgLQQlkrGTOjEh8SwkvpsauaPWby/ijQAmGUNJJ/UUHBgXmCALqg
 gyYfyVZEa9WcfDdWygtKnE2BudaxPYzW5jvmywYYwCrBrMA3ThAQVYGyO+6MZ0lk83m1GRf6lOe
 9HxowTHu9rNZ/uDY8wME6JERYC6sYauPGCbTLgso1GG5AQmH9oh75LnCQKBScz8Qzw0dH/r2URW
 XPFu5KH2oZHV5gHoNSSs/l4+UhjzxePh+i6b8Ul0WKf4gNPL2g9VCCMLtIHl4oJvSP67HssHxvS
 QJw1k/mlE54AcZ0HbyA==
X-Proofpoint-GUID: HWB1bJVgOB_y3n3LC455HNjBfxHOavm5
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9d218 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6-TbrlyARiIxoJeac-sA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: HWB1bJVgOB_y3n3LC455HNjBfxHOavm5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXzKLfoB3iHIrN
 DFp5GN+ec7l9drs88NQBpZ+JQrc3X45lmC6cjVtwOgMJHtpPulmI3zmkIbiX8aLYliTrDpmAJ4i
 aNwDdLI0gDof1mYZLep34TCclDWLHKo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036


On 10/16/2026 3:33 PM, Ekansh Gupta wrote:
> On 16-10-2026 10:50, Abhinav Parihar wrote:
>> Context bank 9 is reserved for secure use cases and must not be exposed
>> as a FastRPC compute context bank for non-secure offloading.
>>   
>> Remove the compute-cb@9 nodes from the Lemans and Monaco device trees to
>> prevent clients from selecting a secure context bank for normal FastRPC
>> workloads.
>>
>> Secure use case support is not currently implemented upstream.
>>
> can you add Fixes: tag as well?> Signed-off-by: Abhinav Parihar
> <abhinav.parihar@oss.qualcomm.com>
Ack
>> ---
>>   arch/arm64/boot/dts/qcom/lemans.dtsi | 16 ----------------
>>   arch/arm64/boot/dts/qcom/monaco.dtsi |  7 -------
> separate the patch both different platforms, also please include other
> applicable platforms in your next spin>  2 files changed, 23 deletions(-)
Ack
>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> index 695eae1b7256..5481dfb73454 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> @@ -7861,14 +7861,6 @@ compute-cb@8 {
>>   						dma-coherent;
>>   					};
>>   
>> -					compute-cb@9 {
>> -						compatible = "qcom,fastrpc-compute-cb";
>> -						reg = <9>;
>> -						iommus = <&apps_smmu 0x2149 0x04a0>,
>> -							 <&apps_smmu 0x2189 0x0400>;
>> -						dma-coherent;
>> -					};
>> -
>>   					compute-cb@11 {
>>   						compatible = "qcom,fastrpc-compute-cb";
>>   						reg = <11>;
>> @@ -8000,14 +7992,6 @@ compute-cb@8 {
>>   						dma-coherent;
>>   					};
>>   
>> -					compute-cb@9 {
>> -						compatible = "qcom,fastrpc-compute-cb";
>> -						reg = <9>;
>> -						iommus = <&apps_smmu 0x2949 0x04a0>,
>> -							 <&apps_smmu 0x2989 0x0400>;
>> -						dma-coherent;
>> -					};
>> -
>>   					compute-cb@10 {
>>   						compatible = "qcom,fastrpc-compute-cb";
>>   						reg = <10>;
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index cfe39f923224..e73a735f2f13 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -7822,13 +7822,6 @@ compute-cb@8 {
>>   						dma-coherent;
>>   					};
>>   
>> -					compute-cb@9 {
>> -						compatible = "qcom,fastrpc-compute-cb";
>> -						reg = <9>;
>> -						iommus = <&apps_smmu 0x19c9 0x0400>;
>> -						dma-coherent;
>> -					};
>> -
>>   					compute-cb@11 {
>>   						compatible = "qcom,fastrpc-compute-cb";
>>   						reg = <0xb>;

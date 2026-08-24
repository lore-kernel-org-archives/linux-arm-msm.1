Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E8A3EF0CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562683; cv=none; b=MvDunA4lagT9kXtYCityRYCjrj++y/z+8+Rc+ke0r5P756amyJoHpy8JDOF8OH6mGEVPxJuCSljoFrVNlh1pIgmEm89+/4YvUMIoTdkfpccSUSAXUFwfFA4GOXKcjt2xHbnO3XgN+XnQQIWi830PNTX4+H0ya78Uhnx21zZn1Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562683; c=relaxed/simple;
	bh=wiw7AGVlqu9Lcrp2CYxUG/Pe6/zjpMXeDjzPzSeUgQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9xzcvx9JGvS9XnMH4CGGkXgWT5DfxAhH0OYnS0gJT8cpete2fjyO/p2mRvlwnyaYEGs3BNfXzjigNWhQyLIplxRJmfc5asCcClre6QfQj8WhpHDfjxIKg7IzFzmFAn4KoRAYr51XIRFTwamjeUitWhLstSF4BSxJ+r4UNCELJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWBP/0UF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cBruojDF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWBP/0UF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cBruojDF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99GdB3575246
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sdj/IIFa1G8cJv22IS2RxBEe7lzI0ZkPGsBx8d4NcJg=; b=KWBP/0UFcRqBdNHL
	nSewzdviaQAaBr5RFnDQ2PcmlR4ok5ZoGj9eZQpYGTadeG060xdXtmn9U2v47sp+
	HE/AtOAFd/X7u3Xm7K9BZ/+aOIbMk/MaHtHv4rmNayPosdvKH8cDsvuSGY8jlyLf
	alfPcKeyIi+w1Iav2tZS7lEkgPW6wFH4guieqWGGSirsPH7hZOxdeJgu0r6sUK0/
	yJblmZWKscYwMtgcxxqgu7aiaSrEh43Yebf7pMqOX2VtBSUB3jZ3Ikr+h7b4yRmq
	4Ght9f9YNgE+VsVjv4xs3IA0h4V/bf6jt5LLqHIBYfw4HPlcdlNeZW0NtNBxYQdu
	5fbNPQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jphvsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:11:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38105cc58e1so900606a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 02:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562679; x=1788167479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdj/IIFa1G8cJv22IS2RxBEe7lzI0ZkPGsBx8d4NcJg=;
        b=cBruojDFm7X5FwVxFsGr7ml1zAtD5UKlFIfCmy+2r8P93C+w57dh20B2q94f0rB1dq
         8PX10O1/bdFkRh3btwrXgWYouhKmHEXGlsjI7W7+zcyBYMCQLGyw1OiamfkEFSEoaGMu
         KBSRqBt87N6kgEGOi9UaubZHwbhUqhQrrZoeTKlVXaFvk39vTL9/xLYRnl98BFWLXKbl
         BQfHjvvSkh1X8fF9BpHai29Kpc7UPr87YIxDOzEz98Br6+JXyNclF9r1EvKzGjAYsOvE
         uf210MGs78HbxjHe5ZypazhV4dbbMvrBYoYBLelrMq9UdloZU+k41BKi2Xd/Bx56RCrr
         bsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562679; x=1788167479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdj/IIFa1G8cJv22IS2RxBEe7lzI0ZkPGsBx8d4NcJg=;
        b=hvzRVThCfaqsWQOKkBLwGHX5gel0K2zIfxRh635kH5V1Rv/wI/EfM+eS1nJ84yAUFD
         butp8SeE70mRX92O4nbhhiVxntIrhjbldYZmZOKpKO/5D/wTerEAwWWP1G5AVu+OMEhG
         XAlzS5F5kwohV12hG928syqchaK8wUQ4553ZO66UXqpc4HELUwwDHkfJt1Vsn6mmUlHf
         yWwWkYRxBtkTHCd/o5jGGTcmMiAmhpH31NRt/ut/QI4yzZUj61tTsEeFlXztf8+5odBj
         s2/NgwaPghFrR9y208R0wkuP78Ys7sinPYgK1OVHP87rGklnF3oa01LIoRWCm8Hz2Mmn
         dTMQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqavXOkSA9MesGrts0ccUog1YEZQAcQWLlxJWvIS1NTwMVoh+6PTm19UHjHU01KVZwQR3nfJYXkoj8BAKg@vger.kernel.org
X-Gm-Message-State: AFuF++nT/xaQwM4Uz6pehtv5td1vce+SH/1FN3ETvm0/8w8YBuXqc90v
	6Uwluqi3I5JKAXH6g40+ctseJ5Z3P4HrfadTHJf7eoyNkau9Fkc4VMvhe2/cIfTOfp38HavBATc
	UvgYqDLnkKTrhZ4v9eJNxwuzI0q5T4PLFa5oNM6fg5m+0HI9tiyeJXbMBv+AZjAkZdAau
X-Gm-Gg: AR+sD12p80b/9y4D0F4dNUoTZessW7NvSexuD1XgCUMRFaF5H0AU3+N7c8lzMM776bN
	QFQNDheeDkQkny3iC3NShNHGb/dz/IW7vy1e3QYjhx3ZMffUK8SBtmvnR2c/53jO8WPrhSQMPR5
	HqTSr+taaVJAlWUWFNJp2jwgKa76RAGmYSHDN1vc6uLJpejO6DIJhhfMwNR+sMzI180QiCCGz19
	wjeHdqbKSQ24H00kUROFuYxuW8/azkwqmcm3B3q43X+orrhTF9DGKJ3ipZpaOPxSY8wcfPEN1C1
	33hj3zQ9J3iYYXQpApxZFvJjsZfQjAapaUGgKc3RR9Tzu6D0FpPipAEmeFHwvgh0i6G1SjzN662
	S0UhgZfWr7NPoF7LNh8pX5EeM5/c0CQ==
X-Received: by 2002:a17:90b:3b84:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-395c358b9bfmr18634964a91.2.1787562679002;
        Mon, 24 Aug 2026 02:11:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3b84:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-395c358b9bfmr18634920a91.2.1787562678524;
        Mon, 24 Aug 2026 02:11:18 -0700 (PDT)
Received: from [10.92.202.220] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4968618sm10951827a91.3.2026.08.24.02.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:11:18 -0700 (PDT)
Message-ID: <20e19a52-81d8-4751-99ae-c1297c2ca026@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:41:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: monaco: add RAS error source
 nodes
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
References: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
 <20260720081954.1858180-4-umang.chheda@oss.qualcomm.com>
 <am69fjQNTv2xJonT@baldur>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <am69fjQNTv2xJonT@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX4rIy5PlchAAz
 iDb8CUGH5a1k8PjGKK2ASwU4qmfWpB1pRoaikKeAXOMWlMQi05rwg3D5gorUOkS+QgaVaSyeX13
 tSicoeA2MYjz65e9fUdpXwWfpUCdtlbwZPGSP9ik57cqPrr0GPV/Q065evxElhufR05f3a73ddr
 IKgExT4U9KMuri8I8VbMCQOdAvKMN/EZntkkEkKaRY3FVWHTDIbrW+pEgZtMxUUEZeXsyMtPUV/
 K5+7eSOGsAt6i1WeLiYd0ANfK7oAO7iSUJgHt6nnrGVkZcWh3Ghz8OJ6fGGVvEM0fZjzKSPkoPk
 12mRwLf2bsnq0e4bGqsVHCMCnsTMsm6bvWCT6pVbJuyRGBTAnoboYnlEZ/XUM7SwNXefoVB0XgX
 z/B8Rw0ac6eprY7lgCuabU0W6UKwxWUOZFfi/o1IS6uMuWXAh5ryP4b8JPnzqR15f+L/S8XW/bn
 iIrHjLg7k/1Uii/jiog==
X-Proofpoint-GUID: 6Xi6fAUuTlbQlzRzPZEIxtmq_oOep_rW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX894bjWoVFBVY
 RZ7bIQHidxvvnKDd2C45Vh1fA5gvQ/0iKMfF0EZSg+4lQOflGVsPe5wQoYUGisgFliegO6Bek41
 bO7lWFIAU11/HnCFtTZ/yaJxCTru0qs=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c0ab7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pc6iunps6SSU6zhADHUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 6Xi6fAUuTlbQlzRzPZEIxtmq_oOep_rW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240079

Hello Bjorn,

On 8/2/2026 9:19 AM, Bjorn Andersson wrote:
> On Mon, Jul 20, 2026 at 01:49:53PM +0530, Umang Chheda wrote:
>> Add RAS error source nodes for the Monaco SoC.
> 
> Why is the subject "repeated" here?

Ack, will fix this in v3.

> 
>>
>> Two processor error sources are described: a per-PE node covering the
>> L1/L2 cache hierarchy using a PPI, and two shared L3 cache nodes for
>> the two CPU clusters using SPIs.
> 
> Please read
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> and don't assume the reader know what this is and why it might be
> useful.

Ack, got it- will update the commit text to reflect what it is and why
it is required.

> 
>>
>> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 30 ++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index 64fc0d592282..4fbd1dc9a147 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -724,6 +724,36 @@ system_pd: power-domain-system {
>>  		};
>>  	};
>>
>> +	ras-l1l2-0 {
> 
> Why is there a -0 suffix on this node?

Ack, -0 is not needed here - will fix this in v3 to use generic node name.

> 
> Regards,
> Bjorn
> 
>> +		compatible = "arm,ras-processor";
>> +		arm,num-records = <1>;
>> +		arm,record-impl = /bits/ 64 <0x1>;
>> +		arm,status-reporting = /bits/ 64 <0x1>;
>> +		cache = <&l2_0>;
>> +		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
>> +		interrupt-names = "fhi";
>> +	};
>> +
>> +	ras-l3-cluster0 {
>> +		compatible = "arm,ras-processor";
>> +		arm,num-records = <2>;
>> +		arm,record-impl = /bits/ 64 <0x2>;
>> +		arm,status-reporting = /bits/ 64 <0x2>;
>> +		cache = <&l3_0>;
>> +		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-names = "fhi";
>> +	};
>> +
>> +	ras-l3-cluster1 {
>> +		compatible = "arm,ras-processor";
>> +		arm,num-records = <2>;
>> +		arm,record-impl = /bits/ 64 <0x2>;
>> +		arm,status-reporting = /bits/ 64 <0x2>;
>> +		cache = <&l3_1>;
>> +		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-names = "fhi";
>> +	};
>> +
>>  	reserved-memory {
>>  		#address-cells = <2>;
>>  		#size-cells = <2>;
>> --
>> 2.34.1
>>

Thanks,
Umang


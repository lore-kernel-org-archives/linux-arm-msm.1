Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AED51624DF
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791940417; cv=none; b=fgKUqXxnbTPQ5XUrOh35HgAahT2zTXfZViyOwMn7aOGmunEujV16YTOS+45M1LIze/pQPbPc+IhKFy3FCSrBU1EAi87IPUc8xn6pbTEIh5x98uGQHwDHtBBzee1o0YSfT1h0idwU8e4vsxdd7i8jq3Ql/bzpuHtJTyQiAVat9yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791940417; c=relaxed/simple;
	bh=K1vpP8QuA8zQYdPUJk8kWTlFgWY1vvsRgG+hQYS2whU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oOrFKf/x6KDLuo3dfWUlB+lacqdeBLVU0yj+gqWJHpV0DXpVUOitbmV4YMM6s5n24chVS859MrkprovYlqP4WN/Z45QWuEZsV4Jwm2q+cb/uQ+1XQ7h+1PZdqvPLVxVoTwllikG2KWKo17wPEz3mfAxjtP2XlWsy5tlMC/+ucUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JA/Uq/8/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MxfVg9rh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JA/Uq/8/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MxfVg9rh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHNN7I2333084
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KN3ePCWW2QO6TlI+zRqgTvBAo+xanlhwC6Wc8W2bO00=; b=JA/Uq/8/yfQ1r62v
	tHvDVB+Ng3rQIKEiqUP9hpRnqvkJHADPkfK8evNW8oncajLSh/zANc6FcSYOOHHW
	CdgBk+T4fz8t4T8fDxTb9byvY2fIgmyw4axygnlvVj9NxE2IRKGEHJHy45RNoLU6
	hjUhwe0MQl5T+7QviCt1u1Wqnrnoq26d3iZr0mveHOPYkHNMhtN8bQuOgpXsGqtV
	O19SE78uE9siGghVOUDEoRlRIi/HLnPc7FchjPB/wCMzotim+cPd9TmSICZ6JpCC
	M5thgr4owQV29EQA+Wi6ahTQEKQ/1EPNZ9pX3X7LBHgN0KSTlU9P3TZdCcBKVMc/
	Bk1PYg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s0hhngd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:13:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so312913a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 18:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791940414; x=1792545214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KN3ePCWW2QO6TlI+zRqgTvBAo+xanlhwC6Wc8W2bO00=;
        b=MxfVg9rhk5e98bNKbiWjNXU394o0tom4fc8ZYS0R8qeU0mtTgJtkTiAWcSxitqZxWl
         X7NJ0ucgW93ibLWtUB3nf8R5bxeFoXQ6D39piTxPlAoI4B5N0wtLCVPuJuRxSd4m42Cy
         ivM7zhqFnkmrmQQLiI6k332BNMtTrMDKLENeg3V/0T5NW+eT5yIBLp5K0nR5BI4IuXy0
         qg/mK05asUsB5KSjrTDv9sr0xrpaVhxH9+AlgBgh9j+4F+kPzH2AGWiXxLP7uV41whV7
         /4cnjVEqzgHdIPEus2bvsIs+X6vpeBQ2V2/KaF3jhGERHycHkby8VFgpJJx7fIqs0/XN
         clgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791940414; x=1792545214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KN3ePCWW2QO6TlI+zRqgTvBAo+xanlhwC6Wc8W2bO00=;
        b=HDK9VXb1Zezh8RzeJ5UKzJi8MRSU/O3hruqRz9YLgTncaS6EWxdHgYzkUv0/W6qZTx
         ASN9KoayVO5+n22lmDiQJHZiZvW/FIWKzYP+6PKcCqjg9RMTm5fLwkz5wkN2q+U6szlH
         H8t+1ElC/dZTTwa52fvHZvDHhkEJb6bdYLQwLJ9LBcvjef3/aOhxsv4OM6XsdWF+jxKy
         0TRdBdM0zviQjkS1SiM/7+5jqokGKF1DVHY0U0ve9J1WTDnCyc90w0MX8KhHUUI7wmFl
         8ajUhF9avKuLYKaRT2Ez4PZY9onpf+6n1jwvGfdHn/NMAbXERFQJfJ6btmU6TmoSIAcH
         EBdA==
X-Gm-Message-State: AFq9FYLmG8TZcSUZ8/IyRhwVbu4shKMA5Adz/b7U+CTys1LWIiBQUBEg
	fmXOtGClVYbu+pER0AAPOf/CSpiKkzfO19uFIDUTGy2ArkZJGUmeCgYo+vBqbw98HKnF/7REj8x
	6zGPdbu+02vOwUOcNFENi7VMGnjB/UdL5uGlHPM2IzoQeaNKDqyF/DnZqKBlT8NRgANXy
X-Gm-Gg: AYBFou3b4rdLuTIYn9bX4pkzuMNMx6XDuhxljKl1fOrXPciCDYb9wX6g5FszD7f1gNJ
	KasVGuO8XY7plY9eGNX+6n+BZtMCFjjBweIWAxsbAlAXbu7He9q11927TiwSZAcvm6WTX/H5Mvh
	unGXB1av+KJ7ovK1nQa8gcTicbg5ACZzDugJnUBTZZqJz+Ev2vtjIbM/hYvkPp8TVDOaAwAEliD
	KUDMdQHNX89a4O2ChCRUOqzVMUvYGCS4gdvdS+2nJZ2p3x1ixssziC0espMi8nnKQijh2tT0aIu
	Y87abNYxfhSIGhE3a+MXQ9LCohMGB0dUiyhOlYBda0UQNFzHJYeB/FXckMXAAN7kUKYVQdOCKLb
	rMXRFh9CXlYqy0PB++osBSghHpJRcnNunG6BQb57BTDgweplDBTKkFxzW5UvYuLk=
X-Received: by 2002:a17:90b:17c2:b0:3a4:b3ac:904c with SMTP id 98e67ed59e1d1-3ac5c873a51mr1327905a91.51.1791940414180;
        Tue, 13 Oct 2026 18:13:34 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:3a4:b3ac:904c with SMTP id 98e67ed59e1d1-3ac5c873a51mr1327897a91.51.1791940413711;
        Tue, 13 Oct 2026 18:13:33 -0700 (PDT)
Received: from [10.133.33.80] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm2153127a91.7.2026.10.13.18.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 18:13:33 -0700 (PDT)
Message-ID: <68acff8e-2696-4ff9-9bfa-3b23e2b15fd1@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 09:13:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS
 debug block
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-1-c2a8c3225a2e@oss.qualcomm.com>
 <7fccb993-8605-4eb6-afd5-94edef1d487d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <7fccb993-8605-4eb6-afd5-94edef1d487d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GL+dgeNK c=1 sm=1 tr=0 ts=6aced73f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=i2zWceGxLG-rlMTYNyUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: P9YsbBlEMIg1mHqZpjgxp8Cjpw7J9Ij5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAwNCBTYWx0ZWRfX/mufVHftPIcH
 fpj5/7XebN9cCthHeZ6rlIjtOWcSkwKUn83Zuiu4Nn3rx1VdN/kQLsMaQEiv8pFoIrvvRwqchpQ
 4LskYCUH9fINbzXanpmrx513eeVGoao=
X-Proofpoint-GUID: P9YsbBlEMIg1mHqZpjgxp8Cjpw7J9Ij5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAwNCBTYWx0ZWRfXzlz+FnSmAKEg
 a8Vgej5s67egCB92ELqCZ6vyxzfJPzZRJsvVI9ecVN23ZFm2QhQyFFyA3U/CEua46hVfK9wqwqI
 z6Ur7TJkSZ1zFNmyZvC1FqCcduYL+WjfgMlWnXCEmx8uMcyXSCocKY3qXCFYBwpiSaaf+5kRtc+
 FOz52ltTx773G6fqntP6QvJzeX944emc0BgnDH8mv4KlAqptfa9s3OJej0BEu2MjYc1FEj7gJzT
 qul8xxDWEMv8WAAC5hxZXY5+oPowjL/78Fqi35VUJC4nPjUoza7Zw12OKUpum6FXcO7ZCKZ8Rpb
 jyfTHb7IDSXPasNhNwBoto/FIgjJ2fRA6EqNx1WLYCIpl+hWZh8sDg7H0KdvGLehpPVNQH5S+M/
 w+AlcIVvNOqeSverwR0QszeBzzI282D6Gc0QN2oI4pKbf0Ao+Me5hd/7UX41zsI6Y/h7N7tDlLf
 OQFaDrh4rkeTiPy9oyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140004



On 10/13/2026 8:46 PM, Konrad Dybcio wrote:
> On 9/22/26 12:35 PM, Jie Gan wrote:
>> The APSS debug block is built with CoreSight devices like ETM,
>> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
>> ETM trace.
>>
>> The replicator, funnel and TMC ETF nodes in this block are physically
>> powered by the CPU cluster power rail rather than by a dedicated always-on
>> rail. Add a power-domains property referencing the corresponding
>> cluster_pdN domain to each of these nodes, so their power state is
>> tied to the CPU cluster domain and the runtime PM core can power the
>> domain on before the devices are accessed and let it be powered off
>> otherwise.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		funnel@12080000 {
>> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>> +			reg = <0x0 0x12080000 0x0 0x1000>;
>> +
>> +			clocks = <&aoss_qmp>;
>> +			clock-names = "apb_pclk";
>> +
>> +			in-ports {
> 
> No need for power-domains here? (also same question for the other
> platforms)

The power-domain only adds to the devices within the cluster. This 
funnel device doesnt sit in the CPU clusters.

Thanks,
Jie

> 
> Konrad


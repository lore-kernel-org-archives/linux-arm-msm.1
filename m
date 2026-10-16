Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E75524336D
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 01:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113550; cv=none; b=ex5nEDMvsN5JpYCysngW65K4LuDdqUmeq0KwH1FF9joB6dF2wCwxw5xpWQYBT7Sb800Eole7EwFszR23N8NtLHQWLJ4XjeOhw2WVd0jICrffK2PWNYLBgGdClJ19VzRdOg36eLXgwf8Xk4wEdaz68cBByS9xatf6WvL8NOSDKyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113550; c=relaxed/simple;
	bh=xb5jl4XGZsuZVOQ/+x9BoePJWqpOPRJTjGcc5aZr84E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uE79zsTc6c49GzoEdQx7MgeXg076UZYSX8OX0SafQfrhnY8SbZVZparvb8JR2weqnuliO6mKjHs/Bhdy5duT33RMhEYrRBMs20sHuK0Ca03GTADwkcP7nPl2M1MigaeQGXu7R7ctF7jmE6Vh8Xdst/8MUQvgoMDVZ4J6AP4PALY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5h2D3+x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrOhqxn9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5h2D3+x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrOhqxn9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNCvpj558009
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 01:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNbdh1Cn+rHMPkzU/IBZz+cXpbpGoCqAOoiJ7+4f/Kg=; b=R5h2D3+xv80DyBRl
	iLpDTI2AVv5CWZVWpvcInkkAsZdxSEfWPMnQ7wIPQhcPHhAH2eoMWAQSBift7jCO
	OSek2R+0SEuDzNLHNN4Re0aHq8EE84wD499vSQGBxm7An07U6dTleFtTb9AhzT9F
	rqylxBV1qyK5gJnjHR5OAH8Rbg/yqpiqlDazGZwO8F7M/d9WOzA4JgVRDNpsm6mi
	zoOiFQUT4I1ZN/4ZU2/KLdRgCsuNOZ4ZgLv3yQnUEFhobML23EEoFZliPlywle27
	CAZw8nLmuKMjIRg1B3jQpKQbuf3DTDJjm4hJm6OV9aZFDd+/AVBAvj9gJKVaxMgR
	P5tq9g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a88apd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 01:19:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88d2d26a8d5so652401b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 18:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792113548; x=1792718348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNbdh1Cn+rHMPkzU/IBZz+cXpbpGoCqAOoiJ7+4f/Kg=;
        b=KrOhqxn9yV7b5/t+tUJ+wj96Vm2p6IlphZCgf38zlLUck6aJUg/3ZuqUWBqc7+RuIL
         CL7YFtU/LV65N4KakvfRSmQYXa0xBpmQWnfznN1NmalFXTOSp3ob7GtkyMhv5P+Y12jW
         L1e8xYmWdKyWYVFBP3V2GH80CavB5Evk8Q37JRxqfq473F7wAoGUv5i+y0wcdU40ZWs+
         9A325fv7/HYoVv0k83nOvHkZfV65MGUn+/ZmhIW/Wd/rFhnjLr9KJh4B9fPa6Qfag5G6
         HlVVr/ou4Ns/gQnfu1di8Cf7/FwlwNFFpX9m17RNP2vlnhhhMPUmRJNHtyciabysOKut
         PHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792113548; x=1792718348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNbdh1Cn+rHMPkzU/IBZz+cXpbpGoCqAOoiJ7+4f/Kg=;
        b=G8ze5TgBJRtkjRbB6J4g1XAEn+/318xhMCsckVcXA+qRAOdVV3IqXYsdvLYnWtNm2n
         F104gT/7qu9kpmQqlDpndB2R2B/LuOyDLTUNTVVeR+A6/odCS7pR+gtN8tT/M7tMyv89
         pEhxnig28kZsQgbXr5VTxSeuczC/ZARMYIyFK6VG9s/v7ptrpbVtyKasKLeycz2nhi81
         CnMYm6TqHhkUpM7KC/veMYhK9mr/bW22kPacwV4k67k55qPpIj3oreejHuZuMWu2fzoD
         2DhUF7JonZ0Y8rVLQDbL3iUYrXlT/0auJmoSar762whb5DjmJUpr2hfKdaBIf79LMMbs
         NLxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzibuKBj5RsQQyRpjxxX0wobOJVpggkyssOwHCLgfTV23xOYcf78u/jlKlfwacLmBlC+0e/yiPVFqKYtsgy@vger.kernel.org
X-Gm-Message-State: AFq9FYKGnzwdikekVhAZWuULpk0vuLdoZnCT8ARZ+xly6ooFWTOPkAHj
	rY2LKTLnDKrpSrfFVSMUzzpSTiUFmQk2w3tSJ3t3aA1rIT+vhUGdw5Axoi3k7dRltctxyietcUB
	xtLoCDnEmFNAey7xaG23otEQskU+/6QZzodDAA2mXsKhrhKzLmJ0IH4/ajqg1Z1L2J2Mk
X-Gm-Gg: AYBFou1gQh7DnJQEtjkRnJoWLl6Bt5MhPBaPv3Si7Gps0oYvxS4HiKFRNr1c4D48FOu
	9AUEQP2JLyhqB+YK0+8vGcDl50fdLQl+JQ0SP8GxOjXWYMQOWsBGSBmtERrQJX5NUacn6SkljnB
	uY1X3lnFClYivuzHhYS4wzs/um/FNFQJuzyyhw8QQEjhFhS4GJBEOwVC8bFePp+pgp8GzqB+3Ca
	Zhp8Ww0rOAYd383rVx6rCtF33SKpGvxQX5uxBmfrxclI3q8d13/Os6HpFGXiE17Dd9o5n6IpQg7
	OyCaAs7F+hvxaShxqPidAUe7NJsd/m50Iqso0FLXQtFTgh8iIixlngb4oGjBGLXLGx+Rx7/MWSR
	ynMG1Xe3Ak5z+bwZ69u8YxZPrAonx9tWHdtb3jwMn0gnKu+1enFLupxUwGOhzjtaa
X-Received: by 2002:a05:6a00:3d01:b0:886:4ca4:a3e8 with SMTP id d2e1a72fcca58-89f1e7ac519mr1088849b3a.5.1792113547936;
        Thu, 15 Oct 2026 18:19:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d01:b0:886:4ca4:a3e8 with SMTP id d2e1a72fcca58-89f1e7ac519mr1088831b3a.5.1792113547456;
        Thu, 15 Oct 2026 18:19:07 -0700 (PDT)
Received: from [10.133.33.148] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f580173efsm309841b3a.50.2026.10.15.18.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 18:19:04 -0700 (PDT)
Message-ID: <324a3513-11cd-4e22-9b51-0aaa46354d26@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 09:18:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: nord: add CoreSight debug nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
 <20260922100850.527109-3-shengchao.guo@oss.qualcomm.com>
 <25956f40-e7e1-4815-94a2-54ee8b1a50e7@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <25956f40-e7e1-4815-94a2-54ee8b1a50e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAwNCBTYWx0ZWRfX+76fGu12+hDT
 M5HVsuTq/UL1OOsbgMU21gFsPn1nk/umZ2e1AZOpmop9/DHKTLG7deR1WM453xWclU9sLBVrUxd
 1CcO8MsDaMwzzmM2Hh1n2wLDpMOk2/U=
X-Proofpoint-ORIG-GUID: gPRSdMsKZXKwna_EDrGxv0cEgz1dnQq0
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad17b8c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xuU9YvB76CLXlpF1iJ4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAwNCBTYWx0ZWRfX10lQWlpuXpQ7
 J+U12B+FLQYP3vmHbmA0qR8YhsDmnrYpHIYfEHbvC/Xsj6g+RgSkKyYGvbE9bNN74wrctavlwDh
 uWNkrCLEiCDcBnn57U7N7E1YYVIIChvGh4cXerCvsdIh5Pd6KjQTFDvxWKV/iQkPG69tJSbdN8w
 bj/M2lMX9vOaUx5nRDM2JeN2Z+dSGWYKFD+N8MP6cnsfm04hBLOq+uvAtkeGD5ybh4huWe7PIwp
 vPp8BW70k6PW/SF4zkF55HKFadn9m+UFcZIpVlTWVWAfyB4YWGVfub5BlgUMHhvNlkCQ4QCSFMn
 4AskiFMEX+hA7LCV1i9DOorHkQiyjPqhuy8UoghE2ECdj8FLANwhP/+DmoHnCFBK0cri9JzSeZ2
 wMQAKzuE4r/zVcVokp81DUkNxjX48YY5DziMV6Wkq6PeKX4NC63FYcOMDU7qHkjhx9Y344PzoF6
 555AZ8Mz4VBhubLH/8g==
X-Proofpoint-GUID: gPRSdMsKZXKwna_EDrGxv0cEgz1dnQq0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160004



On 10/15/2026 10:18 PM, Konrad Dybcio wrote:
> On 9/22/26 12:08 PM, Shawn Guo wrote:
>> From: Jie Gan <jie.gan@oss.qualcomm.com>
>>
>> Add the CoreSight trace topology for the Qualcomm Nord SoC: CTCU, STM,
>> TPDM/TPDA sources and aggregators, funnels, replicators, TMC ETR/ETF
>> sinks, TNoC/ITNoC nodes and per-subsystem CTIs. This wires up trace
>> sources for SOCCP, BCV/IMH/DPM, GCC, QM, DL_NOC, the CDSP NSP0-3
>> clusters, DLMM, EVA, MDSS0/1, LPASS and the AOSS SWAO priority TPDMs,
>> plus the DDR0-3 channel and LLCC TPDMs, all funneled through the
>> tn_ag aggregator into the main CoreSight funnel and out to the AOSS
>> sink.
> 
> [...]
> 
> 
>> +		tpdm@12410000 {
>> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
>> +			reg = <0x0 0x12410000 0x0 0x1000>;
>> +
>> +			clocks = <&aoss_qmp>;
>> +			clock-names = "apb_pclk";
>> +			label = "tpdm_ddr3_llcc_2";
>> +
>> +			qcom,cmb-element-bits = <32>;
>> +			qcom,cmb-msrs-num = <32>;
>> +
>> +			out-ports {
>> +				port {
>> +					ddr2_tpdm2_out: endpoint {
>> +						remote-endpoint = <&ddr2_tn_in9>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		tpdm@12411000 {
>> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
>> +			reg = <0x0 0x12411000 0x0 0x1000>;
>> +
>> +			clocks = <&aoss_qmp>;
>> +			clock-names = "apb_pclk";
>> +			label = "tpdm_ddr3_llcc_3";
> 
> GPT points out the labels should be ddr2_, not ddr3_ on these nodes

Confirmed should be ddr2_ .

Thanks,
Jie

> 
> Konrad


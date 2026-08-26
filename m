Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07CC2E737D
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763463; cv=none; b=eTQ6DQOeBTO6lNzwMPCHNFdLhzTU4349HqFEh6Or6/RvHmqF5ZQ61UrcQ8ya2CAZC2+y1Tw8jGLUF8r/EQT67sqTa7N1P2Na3AtpilTQDnn9+sPkr7FkFb3wvibGijjwtlUlgFmaAckgTmIbbB7srdeDJjqvFfxHuepDhDLx3J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763463; c=relaxed/simple;
	bh=o/WTJZFTAfWZdaCduIgbpqEvZzEWBdw4GO+6c2QbCiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VHpsxQYUpGIsnNzCRvJVlusYVRfZEpESOXuu/coP505pjuSeG5SvrLooZvbRXM3hRf7epkgN9FL6kQecrUCHXqR05C24kTel8ZWbJaQPS8WReuWpeY75HbE8E6xbDrnk9yYIVQ4WY3CSIF82bq5xNhOW5vlHvSqMxgux2ILTfKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEWxLKMW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vudsy091; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEWxLKMW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vudsy091"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGv0mD1310719
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 16:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0cb7ZiUGrGamcF+cwPGbrbICIq0gaMTM5a73Z1Jn114=; b=FEWxLKMW7bI8Erb+
	E5ZljH90U6N1kFDlpZMlUyif4wDg+jVDYrDMRG3ul5qcYulJdiWHVOsWBo9BMao+
	AVSSoTevjkSpZN7YgOsFrRS0kqE2UM4C4YXOxMQW/nA+g3wRhlx3q2Pd8xoOPtlb
	4Xy8FyMBgHWDp1Jcg75DAl/dFC/c1c3FNClQIijARnfGgqT1AuexYJSR3a/z35Ot
	qnw6Kj0CNh24f26C/ZhsMhSJxwpDOk8zuOfHAodEIGjRj8loFX73UJJfSYeUlgQn
	3t/OHaQwPCl0H0yQ0Mtp+N2Tyfr0QJBnimvcKwyKvaCSmbukQ/AORghUXm5JMFv0
	AU2FxQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03a94d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 16:57:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso1746799a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787763427; x=1788368227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cb7ZiUGrGamcF+cwPGbrbICIq0gaMTM5a73Z1Jn114=;
        b=Vudsy0911FO8wx37ZWrwiro8InCS7n250Aspq59SQzpob9Zlvy4KQloobVSBEd6p+R
         w5BUKkXaNGa3Y6dazaD1czBRu3/wn71tmbsGHi00K52fbnz208JI+Amko3OKA0F8Q7kk
         ukIhuieOuXXIWmNbsZFuU8FClh11yfV9YZ08EhTzbrNXVvmZG5ZiXzcgHQEdPSBKUscO
         kbHLGWeUnixXRjapul1pxiSiV4/lKqFAsLr7qV6vkNKEkgOaoWBYOCXvRe6D5fYqkWqt
         wB5z5lAnKBIVFvBQkKBdfWdBejU6tr+n/uXp5WpMG156JZr/XQLvWvQNA3YucE5EvvM2
         3rJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763427; x=1788368227;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cb7ZiUGrGamcF+cwPGbrbICIq0gaMTM5a73Z1Jn114=;
        b=GJYmnOPIOAikXCCc6C75JrmjUuT3B6KrSH14OsVwEsDA97Hv0yNdNJMohd4wGU5LYN
         TSPX5V0yFJ7V+fY3AYJ3Ttj7Q65zpNTHXZjLDWtWj8gJE+kJQftAZh/l10DzQxLMOIHJ
         J3ZXIXatoiL2gjTgEdEd1lO6abUOUsVjCljopl/vQcNvrzDJjfPuZ+4JiQeYRsf7saHQ
         lotvEPXRUr2LhPA48c7/RlAluzEuLpVJ1VatbgN9Yza0ViflF5FpPPlu4ikkkCyiJJiI
         WdJ4kv024krJkj2Ok0I9gmnt9711hA4ifap3s9GCWoZSJO9PFsHBBmhSPrdiE5IHwW1t
         KZzA==
X-Forwarded-Encrypted: i=1; AHgh+Rqjbbst3KDNCVFuESKgBt4d9hDSvEMi55LnUZXTeO6kGLkgT0kqf9k++KgKkso0JfxIda1g6ZjyagtNLINH@vger.kernel.org
X-Gm-Message-State: AFuF++nAsdduyiPzXvKearLqyWjBs5X7Y7zEGp16gwda975xDRBM55mx
	gNsecDfZRTz+Xf29sOzzTSSeFHNnsz0t7VzTNX53U/N5DnixusoNbfpiU7Y8zfQr0fMbyarp0H5
	HjGtk03Qlb4qz73tqA8iZ009CTF/G8ngzh23XqxnVzoCgcZ2GuzFE7HmnjbtFrGiFkqsF
X-Gm-Gg: AR+sD13nNr1KpwBYTgUNeH+ui155BFLw+/7eI7yZF9I73+hxthlzom1LfNNphX4AY/W
	OhjS6IdrT9UQoD+m+rBDdzmNOgyFHda6uqLTQ8vIl0T7bcFi0BhMc+CHFDOe7TLf/nfjIjKugfz
	h33TqGkWWrUnBO6wrqNvFaYSd78l7gI2b23NMi4OpL2LoEun+oIBBq4qYbw7KQUhx/bflA6GC2r
	1+V+P4OMO0Zh/TsmScX3sajnmrEhHkNy5QlkXdNLAifBzzMiblPqDoVqGrCiLJ7Y36vdn75yr4c
	vYkE3xGBRG/kTHpO4zVPIiwq4BU7rpf4tDE/bWgDswbs1iHFRXEWQBwpF6VOUkDbE0d5ETtWr/2
	LbcunDREq++97+s7qkzBeevKHj3LzvgY5xfgpXKzZzQSG
X-Received: by 2002:a17:90a:fc4b:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-3966d8ab823mr18478020a91.12.1787763427425;
        Wed, 26 Aug 2026 09:57:07 -0700 (PDT)
X-Received: by 2002:a17:90a:fc4b:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-3966d8ab823mr18477914a91.12.1787763426937;
        Wed, 26 Aug 2026 09:57:06 -0700 (PDT)
Received: from [192.168.1.9] ([122.164.80.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39667fe29absm4966375a91.0.2026.08.26.09.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 09:57:05 -0700 (PDT)
Message-ID: <6ec861d5-c31e-4b32-a59f-17da3017edee@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 22:27:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: qcom-geni: add I2C frequency table for 32 MHz
 firmware-based SEs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260812-ipq5424_i2c_scl_updates-v2-0-e09cd39d01d7@oss.qualcomm.com>
 <20260812-ipq5424_i2c_scl_updates-v2-2-e09cd39d01d7@oss.qualcomm.com>
 <30a04183-b8d5-4a6d-8092-6b888a240410@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <30a04183-b8d5-4a6d-8092-6b888a240410@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IgsEKjKciUzqs2gsiylsfWSK7qgQtHTN
X-Authority-Analysis: v=2.4 cv=VdLH+lp9 c=1 sm=1 tr=0 ts=6a8f1ae4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=hGlz9nroTSpjRt0Kr7HQew==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vCtHxe5HAd3mbei2lpsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: IgsEKjKciUzqs2gsiylsfWSK7qgQtHTN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX08QsawhiXvje
 rdaTswcNg75A6BrSGWpR52D0nBR+wChXkjtKmBQKmtKulfUM76CiKjMgKqbMxXG9ZKDnNx2ml8B
 zLbDHxf8tVdi7yepEoA/yX9iTNKPUGS04/XTUZUOssgSJphDPSKUGakoq6B0+wZYL4NVfcb8Xj6
 J+110qo4b+jPkTio6B6BEtS2zEacPFLvxOE0jj3O+Tv6oGBtcRj31Jz9KAKgabuzpYrbFkK0ZbW
 9UDcxp+qm7W6701tWaa73+XODfWpHGk2ifeuR8aPnHJDzmId5syE4tLD6qPSuI0NRqOv6cXY6d1
 qgLUjKJ++wTTOqRSYv9rzjsY2jDm0LvlmPbB8LiKoWzUasyqE42n3jCDjn77Ugkq0FReLauG2pw
 9StmlkNrPH/WnWJuy2B6JKxhIdo4llqGK6xVLQgD4lfZbgJlL6O9GBLmXzIAN5mkDa9VT1epyky
 CxWYtHnlOS6nDuJz4xw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX1griaRRZsjaX
 vdY219wgR0JA+J3xc/l3guINZhr1jQt1aDABMyYj9buZT7LXHSjGGB8uK0DOqzyInmVoWCqD7hR
 jXCFTeGbpIzcyBlbABkmheJkO2GUPZQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260141


On 8/24/2026 2:54 PM, Konrad Dybcio wrote:
> On 8/12/26 10:30 AM, Kathiravan Thirumoorthy wrote:
>> On IPQ5424, the I2C controller can operate on both RTL-hardened SEs
>> and firmware-based SEs. As documented in commit 506bb2ab0075
>> ("i2c: qcom-geni: Support systems with 32MHz serial engine clock"),
>> in IPQ5424 SEs use a 32 MHz source clock.
>>
>> The existing frequency table does not provide the required SCL timing
>> parameters for firmware-based SEs. Add a dedicated frequency table
>> using the SCL counter values recommended by the hardware design team
>> and select it for firmware-based SEs to achieve the target bus
>> frequencies.
>>
>> Move geni_i2c_clk_map_idx() from geni_i2c_resources_init() to
>> geni_i2c_init() to ensure SE_HW_PARAM_2 is accessed only after the
>> required clocks have been enabled.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 25 ++++++++++++++++++-------
>>   include/linux/soc/qcom/geni-se.h   |  1 +
>>   2 files changed, 19 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 00013b41a6f5..15835f10b062 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -187,19 +187,28 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
>>   };
>>   
>>   /* source_clock = 32 MHz */
>> -static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
>> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz_minicore[] = {
>>   	{ I2C_MAX_STANDARD_MODE_FREQ, 12, 9, 10, 26 },
>>   	{ I2C_MAX_FAST_MODE_FREQ, 4, 3, 9, 19 },
>>   	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
>>   	{}
>>   };
>>   
>> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz_fwcore[] = {
>> +	{ I2C_MAX_STANDARD_MODE_FREQ, 12, 9, 10, 25 },
>> +	{ I2C_MAX_FAST_MODE_FREQ, 4, 3, 9, 18 },
>> +	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 1, 6, 15, 29 },
>> +	{}
>> +};
> The fwcore one seems to be slightly "stricter" - wouldn't it work
> for both of them?

No, We are not able to achieve the desired frequency. So based on design 
team's feedback, we are using separate configurations.

>
> Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E96A511E70
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 16:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797685; cv=none; b=Exl4iLeSzSZN6Icxpmnjj3p7RsovQGRtzMFR1Te+4HLz8W4Qd9DY9f7EhJ4Psn3jiPp2Ygca2q20CzIgB2bX7kOg1jlhtspNSV9q6J5a6w/X4l+/P8X8kaEsGHKsr6Z60udolQ6yQtBjtR6u8Seqqwr5FTtjEpG5r/x6zKzBJMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797685; c=relaxed/simple;
	bh=R6zZ1GqdN8b2QI5b7GbD3I6ihYPn8pV1GBzdNaupzcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uEKtsDCEilOG1RtXT4Rd5YC9cA1jdmq5PZWJE77DA2++SZIThCgO7oYeraDTUfBCrVPxmdP3DHJL7D4dF2n+jOuPJ3rVzCGqVW1NesCkvuhYIpL5SYkQnFBMGJhVPlPHH2XU52HVvsCHqiEEZhwrxMUAo8j3/bVRFtR55Ga1hN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+H8o/WK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hgFmU5BH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+H8o/WK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hgFmU5BH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdN3Z3723719
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 16:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6uLcqK5uULEGQ4WGjSoAqBJ6fj93DmpH8MQ+/pNb2Rg=; b=S+H8o/WKI0ZDTrks
	uCwh5gCR8qKWvZy3K/SC7bqaDGgSFOzMw62kUahciVWtVnFbrrXOYp7SY8DQ0m/S
	xs/7c4VMM9aM03CGR81f3e/H3uL0eGooz6h5I6RBnmXDSIbdFoBGj22XAsiHldyl
	IBD1LCyeGGdqebthjCCidf86ZAzza6Rftr5nz/jRnn4LPx+oSK0zS4tSR3R0BI49
	BggvmhI17P73ErED+0U2uRWselHr9VYmYuxCNqtcWEQUyMthSKby8njN5smT5bEg
	IX5raYVSXzECSRePXK765fH6L6ClHauKrYIeTiNqPHHjc3evzovQOGP84Da+nbb2
	DyiJUg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx1jc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 16:14:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfc52ddc55so53724265ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 09:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788797683; x=1789402483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6uLcqK5uULEGQ4WGjSoAqBJ6fj93DmpH8MQ+/pNb2Rg=;
        b=hgFmU5BH+Ec9l1Q+Mzq3J71Pn8bBnrpZhUCyxg/t7NT3AeHyzHYsnaqDBF6/R86Mjo
         um5x6W005HVLD+iLm6BzPdGhWCXyfLv5alGRZxkKrfdH+AiQR2y23aQoYkjFNQqNl6o/
         tBrIV0z9Ibd70RFZLV29E3zWcyEjSiylmg+hs+DC9rOyvLcOe/5i5aRjHGwWyt12codk
         lC9SSjd62zuu5gQI4bujrcNTs98HRtkupNnHDw5UJBuI4m3oF1Ws37IYUnnndWWOtbyk
         J5EYWCA1IJ4WJ2dKiyi//nAuNENCRcNkaxD3grmV/emYC43ps1j/Ll80sNm+7as8OCQw
         /eNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788797683; x=1789402483;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uLcqK5uULEGQ4WGjSoAqBJ6fj93DmpH8MQ+/pNb2Rg=;
        b=OHhhEoP81SkAolU+iVwAew8WWfokBi8Hal9A4aWtclPa+MSVoWr5RQgNMFuCUkNAV2
         hnHwmt/u3s4f95ruxTnfF95z9nlDZ+w8JOrWsmgujfMsGySTltYCE24AfkjF2hbDhR1R
         yswrqlR3XroQIfGv/6cWxHDFv3zvQ+hAs+Fi7ZwHpJsKmFBt8WXB1fejQQ+d32W9LXED
         bIv77qpkINpeT69DegZWVthqTbiteNzHdGqIF7xA/7ME8e1s6N9UMX8pGvK9Vqlkt8FR
         25tsHln4q8lhbQiYIIhQuKMBpLQYkAUDjzYMh66OCbe/m6dHj1ciWg/PveQZVgFNEnXI
         nbgg==
X-Gm-Message-State: AFuF++nXw2LfR2xunEbIlfMCs1SB4zBw8StskPXcmryZvXB6gSX48+/Z
	4Jye2ooFDktuoBJoyX7rogwENFGQ+du+v9VkvbWl2as23RAlSLPNKHPgrSdEzMBBXPDs8Celr+F
	bZJe9mH0qQv82v8Oz8QdMmQc/w0erZiKxvk5df62uBeWkO3u7Fb4+lVMULQH01Ms48C/n
X-Gm-Gg: AYBFou0S+5cwH9FfxF7kDbHf9ZPtaZHY4WgWUecf2s7F3XZVI1IxMi0941KDp4R2kB5
	Sx+pfdoxscSnvGSZUKjdjX9KQJDjNACtfai1PlE7uKfiWasEJv8mykbZubbvGXqQF14rEqoBVSd
	fASNxEB2hJNaLMeC4N/kY4pTkqXzshManLsde6Undd2bKnMUoql/uAOLt2iKHjL1oFJMsv597hu
	Tuk5lArV8bXaHd8VeC7g74MAfhcBnYMiWHEzPl8vFF34p1+5zaZBDEbqtLNeNKIBJWRXTbuZm1Y
	x2S3fcZqoLGtCLy0yuJr4jm4Ie9SDwMFNxWedKtGZEIaouCiDoWvTr83iN9mX4ft6xATr2za6u2
	XLwT/nVn1LvurhZfuGIMGTWR78qR7Lzktaa0Fiy4YGrjC
X-Received: by 2002:a17:903:1a28:b0:2db:31d5:1448 with SMTP id d9443c01a7336-2db31d514ebmr203964395ad.22.1788797682648;
        Mon, 07 Sep 2026 09:14:42 -0700 (PDT)
X-Received: by 2002:a17:903:1a28:b0:2db:31d5:1448 with SMTP id d9443c01a7336-2db31d514ebmr203963655ad.22.1788797682186;
        Mon, 07 Sep 2026 09:14:42 -0700 (PDT)
Received: from [192.168.1.66] ([103.172.5.17])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm29345580eec.26.2026.09.07.09.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 09:14:41 -0700 (PDT)
Message-ID: <dd66d593-2601-4749-a21c-5347a8f1b6eb@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 21:44:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] i2c: Add I2C High-Speed mode support for qcom-geni
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260824-i2c-hs-v1-0-8dd94e5c6113@oss.qualcomm.com>
 <613960df-3d3d-445f-9533-57257eb5099b@oss.qualcomm.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <613960df-3d3d-445f-9533-57257eb5099b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9ee2f3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=tPI8lZtLbYv5uT6OEmdSlg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=PAEdTZexspgVwDamPmIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: eDjxe4BsDxRNVmh6fvADaaaHC-S-adid
X-Proofpoint-ORIG-GUID: eDjxe4BsDxRNVmh6fvADaaaHC-S-adid
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE4MCBTYWx0ZWRfX1bV3osgzHTOW
 AM8NESLNsE+pYvSELlolmQhu9NoHaOOguT+Mn+Y6FsUFWSycN4NZ0iFnfvCOrkqwUuodLh6XNQM
 7TA6ZEFGYR1OI5hF8F/HtHliD0Zg+0Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE4MCBTYWx0ZWRfX7pq3YX19qKvD
 BjrqiPPXcTrSavR0dZpQeI1KZj9YGPV9S8xgsAdfKBp+BFmRStby/C0yqUXLA3kbAqcPTj2XBW2
 urh+xlA1DSoZi8xKTqnZYirgpP/kxugLzb+/rAnDBf4PAA9boRwhdh97cCBSkTTPcxLLQ+oorv5
 9Xmd2TbyvnUgZBmr+J/+jWKeXAPt9yVqVSch0Scx6fcrEUrwFLx1kZ9ANFpn0edS+T90MTM5GQy
 2XOqdPVxRj0ka3lDv5vrHA2ymQaMDk8dBKwLyNz5o4thzZ4c+r4yBRy1dnDuXKVsE6EchuuRZWM
 RExTlhXxNV7ixeXdxuW+v61F6+i/BeLLj+eK4gsmp7+5AyKrEPdPe9gGDfV9dmVEJgCDCQtETGq
 DzmdLob+H2YOHK3q0ev/Oy6CtPeW8OHG3Bd8qHMa7gRoi1uoyJWqSyo4JByLpmKqHnsJqnmm272
 kcP5q2VFS1n/BLrwlCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070180



On 8/28/2026 12:56 AM, Mukesh Savaliya wrote:
> 
> 
> On 8/24/2026 4:55 PM, Jyothi Kumar Seerapu wrote:
>> Add I2C High-Speed (HS) mode support for the Qualcomm GENI I2C
>> controller, detecting HS mode requests based on a 3.4 MHz bus
>> frequency.
> 
> what's the detecting here ? HS mode itself is 3.4 MHz freq.
> may be you be you can start with current support freq modes and not 
> supported.>
>> I2C HS mode is supported by the underlying QUP hardware starting with
>> QUPv3 core version 4.3 (per the GENI/QUP Hardware Programming Guide).
>> This series adds the driver support to detect that capability and
> is this detect things repeating ?> enable HS-mode transfers on SoCs 
> whose QUP core version meets that
>> requirement, rather than tying HS mode to any specific peripheral.
>>
>> Patch 1 (dmaengine: qcom-gpi) is for GPI DMA transfers and adds
>> a CONFIG1 TRE to the GPI DMA engine to convey HS-specific timing
>> parameters (tcycle_cnt/tlow_cnt) to the hardware.
>>
> Patch 1 is to convey config parameters for HS mode in GPI DMA tranfser.
> 
>> Patch 2 (i2c: qcom-geni) handles FIFO/SE-DMA transfers; It configures
>> the GENI controller's source clock and timing accordingly, and adds
>> the HS-specific FIFO/SE-DMA opcodes and master-code preamble needed
>> to switch the bus from Fast Mode Plus to HS speed.
>>
> 
> Like above just say high level in short, individual patch will add more 
> details in its commit log.
>
  Okay, i will add the below commit description.

The GENI I2C driver currently supports Standard (100 KHz), Fast
(400 KHz), and Fast Mode Plus (1 MHz) speeds, but not High-Speed
(HS) mode (3.4 MHz).

The underlying QUP hardware supports I2C HS mode starting with QUPv3
core version 4.3, per the GENI/QUP Hardware Programming Guide. Add
driver support to enable HS-mode transfers based on that QUP core
version.

Patch 1 (dmaengine: qcom-gpi) adds a CONFIG1 TRE to convey HS-mode
timing parameters (tcycle_cnt/tlow_cnt) for GPI DMA transfers.

Patch 2 (i2c: qcom-geni) adds HS-mode support for FIFO/SE-DMA
transfers, including the required clock/timing configuration and
master-code preamble.

>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> ---
>> Jyothi Kumar Seerapu (2):
>>        dmaengine: qcom-gpi: Add I2C High-Speed mode configuration support
>>        i2c: qcom-geni: Add support for I2C High-Speed mode
>>
>>   drivers/dma/qcom/gpi.c             |  54 +++++++++++++--
>>   drivers/i2c/busses/i2c-qcom-geni.c | 133 +++++++++++++++++++++++++++ 
>> ++++++----
>>   include/linux/dma/qcom-gpi-dma.h   |  28 +++++++-
>>   3 files changed, 196 insertions(+), 19 deletions(-)
>> ---
>> base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
>> change-id: 20260821-i2c-hs-408768509865
>>
>> Best regards,
>> -- 
>> Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>
> 


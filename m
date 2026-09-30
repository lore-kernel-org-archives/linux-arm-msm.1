Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972495172E0
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790787953; cv=none; b=QaGOztSp/AtOogOyNet+hC5DdoZe6sdARDEqf2YPhl/hsaopieAswd4RtjmwMpA0MFSX2CpzzMJL5yamhH264IhITrSVCRd+P707kPjWZ89MWYMxeynxnmzbh2/rSqFkucyPiTonjaAq3c9rkeJcE3JgzHlRiR9vLUeR3mr8n1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790787953; c=relaxed/simple;
	bh=DDPvEyxBzH/fM8L4JWsd+cDxWemVYt1ogCt3WXGPQy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTQDgnDeaml78npcp57vl2gJuw9hpYOAKYujWf7e4zox0KrZAw6KjpQP5bFvFv4j7VYJxx5h5zdStBNuiHAZ1KRsFqIaT9ZELWYyUuTDPzaq+y7BbNcezsZ9YkvhXQX3Wfi9CvtOSgPm7HwZA3IiDFTEQ8jAdWDdk2lZAVVRRfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ud8ylrjn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXPojz+Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ud8ylrjn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FXPojz+Y"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UGjJ9f4035417
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 17:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DDPvEyxBzH/fM8L4JWsd+cDxWemVYt1ogCt3WXGPQy8=; b=Ud8ylrjn6gYb06bc
	iYxkVcqcJXH++8WPDYQ1lp6I5wzr2KAq8JLzHMjq6EH6c0riMlwl1jrabnrvA8RJ
	kWVx7VwNA6FOmYmOrwsFGje5qsROkvDYiMUHLIw+adwwmpuldekaaRySDhwk+zZf
	JmmVaCexOQcocxjUV//JWyWJKKp8agU04FuETL3bDc5f2dUI0OcUHHv0cgzsF13x
	6ble15madvXYl2/OEGf4gJg23K+ROL+ohrKwEXfA30KFq9rTto7kCPCt999pjK/M
	msfUeMdFUQsIXhChwURX734Ual6hFS6/xYAE8UWIUgAD0RjKV79hQ3GDGigSdEnA
	OWq3fg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pg46m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 17:05:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e2e0bc619fso8974715ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 10:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790787949; x=1791392749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDPvEyxBzH/fM8L4JWsd+cDxWemVYt1ogCt3WXGPQy8=;
        b=FXPojz+YNYS0cLT3m1n5Zg2D53ynUXfp9dH3JhStsCRkZ3WoHMvmdSjxYpZFNe7hUm
         FhH6foJ0bLKAKCMDT4HVnl5ZGjlYNhMyb/VvdTdUfYXSQeLTYuLAxBpHELpjvogXKcKz
         iv8gy7Arf2a1Lo65Tr6qOxTPLXRk+squTQrwmVXoSt/N29W3qSo5tny0cWqWmrJLRt72
         BIDj7aLhERMaCY90VUXY1npIZyP1qBZzq3gWJjEncFZ+QMEUu7uSvAcfb2AaGx0+rA7V
         3zQqlg0fF7ET7fAYjsEIYbjyxYysRvemMZ8c3xFT05/mR5neGvWoSwEbhrgRoCptg1na
         gs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790787949; x=1791392749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDPvEyxBzH/fM8L4JWsd+cDxWemVYt1ogCt3WXGPQy8=;
        b=rmrO4tgqx0wvyQ4VDHbYsoC7y+x8BbGD2wm7uQgU4XsD8aeIlZSAugHeHGakwZY3+r
         Hx/XoBMlaNXjL/2Af5jMvSoG+O3gcWVXw5c9bfM2gIAbELqKJokPF8x8XwEautSuo2RP
         h7X7vc/mznaFNvGfOnOxJIQ6xewbve0kYhSmwWr/pBuzWS4wwSWITa1/XXUwcyNtSRe/
         YbK7hUew5bEr87UubFrMx2xVBVd9/OITLEyFivd+a/qAbLxoUm2g4wLEpB/bxNRamxw3
         Zlr5IWiq68Z2E041Oo1TiDpzW4nRL+PHKX6OHluHxnZa+WjpCjt8a0DgwrQBQsYbfW1u
         layg==
X-Gm-Message-State: AFq9FYJSjVom/Lv+3RXpZG5nBrqrz79NJdz87HdZXwfxEFsLjQ+6x2gq
	7P+13jxYMJA++DgyMidE6GDfbDDDMDXtrvY1mgacESeRZpep/HJj63SwRIyLqdnGk7w6SSBYMJ4
	Rt8gR5w46uwQL7IJgCOPphyKS9teyD7ulPUrAYbPtmEdGkImmulSLMGceVcmXTf5Gh8BM
X-Gm-Gg: AYBFou21mysUapMsqH6wN/uutqgnaYAsVvmkuqX229aLAFI20Hww96IQWfDKviBC82H
	PyA9SjMoieJbjqH9FwPqIvataYeF9EhOd8WdFVOuAN/ChM5khHGmax6+mUAjIle6epCeJ2YeUsX
	F62tL6Ku7YrIZb28pqRRuw4Xmsq9pNM6XapeYD5O9chGFFex58N6TJcLqidZtyREWlfdhwMG7LF
	RtU0tvuFlqtXyBNpMggJjdkiF4Iq31nVOe1cuBUnpXEtJo3/ep8QiKDEY7copi3SQqIUd3GQvNf
	ERgJ7/RM5+HrXlOCIoqoP51XRq5tfXjj1+9Vk57oIdnvprmzfURgKZEfSh3mHjomMZQuSotEjuS
	+bhVCaIZCCFFZraE1glA53Gd32l0qLevhUpw=
X-Received: by 2002:a17:903:2b0c:b0:2e2:cb85:60d with SMTP id d9443c01a7336-2e2e4bb19fdmr16830655ad.53.1790787949311;
        Wed, 30 Sep 2026 10:05:49 -0700 (PDT)
X-Received: by 2002:a17:903:2b0c:b0:2e2:cb85:60d with SMTP id d9443c01a7336-2e2e4bb19fdmr16830275ad.53.1790787948702;
        Wed, 30 Sep 2026 10:05:48 -0700 (PDT)
Received: from [192.168.0.106] ([49.205.116.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b31e05sm572195ad.62.2026.09.30.10.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 10:05:48 -0700 (PDT)
Message-ID: <e25bedbe-8ccd-478d-882d-3707e176fb51@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 22:35:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/2] Add LPASS VA CSR HeartBeat pulse clock support
To: sarath.ganapathiraju@oss.qualcomm.com, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930-master-v10-0-105207bc5275@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260930-master-v10-0-105207bc5275@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QkZFRwDYf5d8VvsdKSLtei0A6kKzNJYr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX/e/VHoDhY7uj
 ONtv5lj7iJOz6ASE6dD/TiyFUmFb53vGKg4YCDD2t2powsvIAHxBnHNiBdAyzw4wWAE+YKdq/eJ
 X3B/JHQ8rnfB3IIXd1OLcCMLRwPMENA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX0Ct5V7J+B9xI
 e9BMdk8nHZ4n4pj+pMoku9e4d76RSxuz3CjjGKKMiMvAGxfV26fKYNsIwvX5GMlblN7as8/qnpd
 FmiXUw7P0ClN7oNUdkuxuWoneQnWAfX2mV+BCKFAY9Kx+JtQS9fSMZEHUe7K8bzZjatzVyLEzA1
 F7OBX6v2vXfFO3mvn9j0/GeG5A8nmjblr+Nomvz/kI8iLyP9USHfA8ggvAvp8HXcE8emlI6+mUE
 +2B6l24YVdExkaHw4hxG3wwffHmdn9gkogbYPLVxxaTPogSTbRxQ4eOqknZH2Ij0MrY7mq0bvX1
 P9gaa1iZJjjHbbV10pnhdUAFVO5Yc6s9c7dXcyKytWvbhYFfU80DPT2JnAbGM0yvskwUGV5jJHR
 7iqPQ4RQjxNCj80Gnmb2ieMkAkn06nqrFF/pWsP9ACxM0/BfqHvm/bzKlgJIH0IyktVUc0HKDnU
 CrA/MzWVfzHs4mCfgcA==
X-Proofpoint-GUID: QkZFRwDYf5d8VvsdKSLtei0A6kKzNJYr
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abd416e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=2ngnHYY/h7Qxskz9zhV0NA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=EGVZlqAv5GW_eZpGnoMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300068


On 9/30/2026 3:21 PM, Sarath Ganapathiraju via B4 Relay wrote:
> The LPASS VA CSR block contains rate generator hardware that produces
> a HeartBeat Pulse (also known as RateGen Pulse). This pulse
> synchronizes the start of the DMAs and Codec Interfaces for the audio
> usecases and can serve as a periodic wakeup source for the DSP.
>
> This series adds the DT binding and driver support to model this
> rate generator as a clock provider.
>
> Patch 1 adds the YAML binding for the new qcom,hawi-lpass-va-csr
> clock provider node under Documentation/devicetree/bindings/clock/.
>
> Patch 2 adds the lpass-va-csr driver under drivers/clk/qcom that
> registers the lpass_heartbeat_pulse clock and enables/disables the
> rate generator via regmap when the clock consumer requests it.
Tested on Hawi - WCD Headset Playback and Record working fine.

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Tested-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090171;
	b=sy18ISq66ZOeAC4N4pA9r41xIsCwakouClRBbU/Dkw3Mm9KaEVG1sYdAU3UI6k5vhvfB
	 yFmthN74lwKXC4fqU/sC27LwWIWyIXrc1l+H9KMPkT77VaKyPBRSi/2PXM/qfng1Uz062
	 qWlJcKyj1/pCSdX3upjclsdJ7X4PTn8GCm+wFtsbJRmF/S/jaQ3823IvP1slP3rbSM9Xi
	 rWQpYAnRD5B91hkAINl3nrpKLyRAT9P6nLS33R+KkthVCNEQM/vs1htAISVIxHRms93a8
	 7k0Lw9QaB1ytnDXQBDPvt/7uucmeqvb3JeiRvVHJKS8MQ2fEtdz9xbgSF0Q6SJ/J+zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090171;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ieIMc3BBz4pKSCnrMN5uWZ94uJp0IU9fkKJ/HuBkEow=;
	b=gT/6qE0/NsB5MlZuy/01T8Ndw9Li49XImQr2ApwW4q2K/GWf7Nc4+0dXAYXb/B3mkVNs
	 o79AJaaSoQK7L17h7J4Tanr13xJiY0UOYdfEJFHZcjZQRN/5lPBWo+Z/cyhfCn8OPxak/
	 iRp0EdYMN8oiAqjQJlKW76mp3GHtijEdaTy/Z0r8y+9OYTVUgkWf/PKyvDAshpjz9AjUJ
	 jWCjoHvEdGu/0VAU6Mg9Rl4uBWGI/HeQ0TZE9rUKVEaBbhfgksZ098Dzqtaek6VcImtGx
	 u69JEiMDzvnx9yJuLAchh+NF3JADtuBDu51XvSP1v0Ry6fzytzG7JxDDZZ6sEtUJuZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=na4O9oqi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8BiWFyf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CADA606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CADA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=na4O9oqi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S8BiWFyf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5YpJd2336711
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ieIMc3BBz4pKSCnrMN5uWZ94uJp0IU9fkKJ/HuBkEow=; b=na4O9oqil6AM0aDY
	/Mw+uqnKwn7ym6DYKoWHGzHWmgNB0ru5yBvL8GWbIt66i7Ve5wRyduSp88itIdyB
	g21P9BoPyLTtfrb3WGj0ZS3+huBWS45IUdZPse45WcZPDQRLVHYhCHb8xYbz1abc
	PcipgCFpKzAqvYlobdVgYUULUNAWF+0bGjRmlQ28kwTek37WnOTqLUok6XmqZ9Y4
	f6pD2mp5C1RV5gWJ+8aiP7qIl3/xZs8C2lFKvJrbd914mvs6kKUm+xv/3v5wY/oV
	1StqwHGC/vMn6TiSnKfJdbdslJmTcvEQa+Di9XlYk90bLz8wcS9+/VRi5hitVrmi
	bPu1BQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3da4hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:36:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943fffbc5dbso772885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090169; x=1793694969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieIMc3BBz4pKSCnrMN5uWZ94uJp0IU9fkKJ/HuBkEow=;
        b=S8BiWFyfisgWML7PD0jZd12NUky/jM2TYvfQNISYdzs4Y80VL3N8YH8s5lNW8nbRLo
         VK1A9BaW2LWaelD4kEyahK86wnTDDGdJeEjujYBVDJngdiObZZ5lciVB+RGtOD/h+gLF
         T3h1vmRxr/rBxNF/cn9dTwiVtlLgXfkEbd+Beb08qz4R8DGDvfMP+50Ht8Bo0waCNifC
         HHHiHd8jDkienXCIdQGsCKgYBkSvdAwaaFysnTOw8LiAD+oRksUHum2W9kIOxqnh/tVT
         NHREDU7uAkVQUtNFs806R5EpGS/0vWu+gN3Id1RqzbT2hcOmdPddFc6Whv5Tdmb6jkgg
         73Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090169; x=1793694969;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieIMc3BBz4pKSCnrMN5uWZ94uJp0IU9fkKJ/HuBkEow=;
        b=ZTeEZy2IxiBxfl/hqF5TaYnUHYAYLZuRpEmXxN99qDH+cFYxvEYAD8Je9/bUeG8nr0
         nfb+vZQtWEH5295Wn8MLDodyfkgIZp5fqf1etHZ4b45URJhZb5WhhtSoQ7K1JcGywWBU
         nTWneYVdeq64WwvbRdU+T9K0kISHCnJlPvxSQkcBhoE4QS0VKzQzsHUc0yLNmvvqkwm0
         KOGxw3wYglGpMi07tbZ2Wcwy4m2+BQoAU4wCI5dZlh2FTPUCe5MMbtxU4NwFjIzcwvX+
         te8jpind9rh8Wdo+ixIUiiiOVA/firmg6S8LVV+2HGFXyfPD8mgJitbBx542j7CjLJfD
         orqQ==
X-Gm-Message-State: AFq9FYIuViFcm/rJdqPnOFKQaYfQn4ynI79KMYYie2DiyO/P9OUqDx/w
	cexfmxDheqPz+ufyC0/6odF3cyJNC1y4Mpkrsc7qm+pKo1VjdhWllNARQQXLGvoZHFkrzZqvewK
	GuIzZngPcgVbLrq1UTL8YfHSwS6ZTFvQdbd5GxaQy/HS2plMOa3wFrdfBYsSOmp1ICPsz
X-Gm-Gg: AYBFou32qih2JR2ed3KvHSCDyhVelK7y0xT+8W6OmkG+fawmPm7sdVXuF2/7hx3Ed0j
	71GSFuKavo8jXowy617dK1gLnHaUkqoAG7Xy7srKBzbVXEEIX5Ra1A0MtXqR2FJDCjonyE6vgFM
	IWCpyh4Oas5O2LneVsMHuPA7AslreQEpcllDsMO6/TUnMDNeUATArvkuUSU48YHwvCJuIgEmGTD
	4JwNQgMo/zx6t1AFr2NjoI+ZPEPy4Bh5X1HukZJ3kQmWE3+heHdp+7bxiQO+c6w/gYkHS1OA74n
	64elOsD9LhwbLSZ44XE/XBHwxu00j8PF/mfsk7oqV9zLscPrgvazIVmFirgF8zFnHHfEYwgpAUA
	Re9ECEhgzbWUYH4NnhFesdl7rF+vm4brH1rxH2ta+hH4RjQqnRP60PIkemYppKOHyWTrSmLc=
X-Received: by 2002:a05:620a:8703:20b0:93f:a34:d9fa with SMTP id af79cd13be357-940ef7d5676mr1454627285a.1.1793090169372;
        Tue, 27 Oct 2026 01:36:09 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:20b0:93f:a34:d9fa with SMTP id af79cd13be357-940ef7d5676mr1454623985a.1.1793090168889;
        Tue, 27 Oct 2026 01:36:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e9995sm406415266b.15.2026.10.27.01.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:36:08 -0700 (PDT)
Message-ID: <732de9ce-7e8e-4506-86af-239bf84dd309@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 09:36:05 +0100
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
Subject: Re: [PATCH] soc: qcom: ubwc: Add SM7250 configuration
To: patches@brar.si, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027-ubwc-sm7250-v1-1-e766b1e264cf@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-ubwc-sm7250-v1-1-e766b1e264cf@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX2Ct5L2JQ2OFE
 EOKg4gyuzQCjjYhw5FcH5J29cM+CRdqNKGevyOnAbhbJPZ+Ne1CDbY0pOUMWP8ziHrSbJ9wDts4
 2E5T9+XIz6pxpgnmCMVb/DmcNXPQBb4=
X-Proofpoint-GUID: zQWC018iteGwVZwnNfV9uzfmetqcTjOn
X-Proofpoint-ORIG-GUID: zQWC018iteGwVZwnNfV9uzfmetqcTjOn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX3ffCVMhYCShF
 Y7YHKhwuDZsRsDykNIwgU1G3fHsjUbYKlTx4kqI9vk1FTCJcGOUGAIMZwfAJBcKKFI5X+QcSNUO
 ZILeXcmcV1lsTAi0pZYIC0SWAjGQ3zaVxWFwUzm/c5kMUMP1R0zz84iXeWtMcvy3ns282qCyytF
 IW3BS3OOOw2ljuZOAL2E58dWnvImKFxy3AZg4ioq5pwYXLjnyiUHFH+XYvQrLT5fH5lXIQNYxVv
 4kW+8PZZ0R8/R9MsHJoj+S0m399aFBuNoCFycZRaePNxVOfnZsmIOGABIqDhk68+nMHV/qqOC0l
 zk9rKHeXdHIXCKjsV4VQQxgogTwEou+CpyZuwc+1Xwd2UowzcDEjNTfs69eSLMRrBUJtGsspvlX
 0+5QhqLeCSfPeO0Y/lKFCO5jOTt9eNCnyBPBMtzCtPmuTFzmxUQ+PT5zWm6IwRNiQgiPrtsJ5il
 ySXdNR7iTpQPzbTySwg==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae0627a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GK7zBLNOynR7OwqPiSgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270034

On 10/27/26 7:19 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add the UBWC configuration of the Qualcomm SM7250 SoC (Snapdragon
> 765/765G/768G): UBWC encoder version 3.0 with highest bank bit 14.
> 
> The downstream GPU devicetree of the platform sets qcom,ubwc-mode to 3
> (UBWC 3.0) and a highest bank bit of 14, the downstream GPU driver does
> not enable the 8-channel macrotile mode of UBWC 3.1, and the downstream
> display devicetree also gives UBWC 3.0. No existing entry has UBWC 3.0
> with this bank bit, so add one.
> 
> Without an entry, the Adreno and DPU drivers fail to probe on SM7250,
> because qcom_ubwc_config_get_data() returns an error.

This paragraph could be omitted

> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

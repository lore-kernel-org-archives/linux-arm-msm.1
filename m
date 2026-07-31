Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8CE35200D
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478054; cv=none; b=PVNuAiL8VzMRbl8nh6M9/v8mVYvuJhBuWJLhQR5UUKeAgte9zLGcV9Xa3Peg7t5+1auU5Tn5zpkl8l+5JxjRX9yjV6cCR4pghFwWyLWHr0D8/rp4fa0A3moxWMpxlkpVxaMpDSJyVPrKSJc9Qy7+6Pt3HOwV0ZsdkghfHBm08dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478054; c=relaxed/simple;
	bh=NPgDZWp0zjQsX8p2iQgy6uXQRmUxzcpHU0jWoUp+/g0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=sw51z5aS429jvjpo8wD7fsuZ7EL3ZX1aWJd5EVHuCbbQtQ10T5tEUPENf3hYm4Aoe8N6cyovEPr2Ec7EJ49SY0kEcQ74I8SXEH1LBLchOdpT9XBXXE7aIKG+tw/FUFGyLYwFLmurPbtqqaE+1W9FclnOP6rlt0u2hSDz2vCJErA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYB90/10; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNBE3XOf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYB90/10";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNBE3XOf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V67EYG2960545
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cBTysN2GKJ41mcelD+ifbRYjVUJ9bYWfxCx14PKUL/k=; b=LYB90/10TZTG+T4V
	Fd+K++zNHWKDh5Z/vrrGwHZTyX9Rla/fjKT3HpVcpiGORdYD1XDM4+4DeXKlAjAV
	aJ4DfhFvGQaEaokDMeRJVNHQ/LwV63V8NHAfgd1sl2IXV5FRSryM+aJbqccCl7sf
	MC4pTbVBDPTH0Rs5BaftPnWXUWIjISCw4ZVokhkPmc0NG9epRJY3vMwUPVy6QzPS
	4WGE8XG24UGN3RyLdajAWRxRYnnDk7/TG70mh4phMRAQHFQwED1jF47XnYywk0lA
	16q7iKgVWSrZkK0ANWCl+HRZqvT7UJmotBWEEL/ih9HOTPDXs5nCHdMyU8EsIEFe
	sV7sZQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp5kg01n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:07:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfbf3e4a63so17502095ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478052; x=1786082852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBTysN2GKJ41mcelD+ifbRYjVUJ9bYWfxCx14PKUL/k=;
        b=TNBE3XOf3WWzQ7Z/ktwDnmUgyk6ZY4v4fYmWLG0Q2tsDZAJFRel/7xGbJ+JP75Q13d
         SY9JMH0rIGec4vKeQTMdK4779M5Sq9AxuWZMAnzbymYYRMc7XehJNzw8iWqMsnhQOT1t
         83QWk0Q2vO52NXSI1w4wK7fKJKtCNppV/1Ejj1eQHzjwh1GWtX2I2ZPSRqiuyees4b+J
         GgIZwEhA0JHY4tJUJcVdsB1KO3U3VzzcbthXOLEDpUjjkAjTDyIFlR2CTZ6htMg8ep/1
         tSYxupxLGbdJgbHFDO2QkWLQ4411XDjZna1uCwHQil3AkBUcHru7KZsJWKduYMds4oCU
         fjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478052; x=1786082852;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBTysN2GKJ41mcelD+ifbRYjVUJ9bYWfxCx14PKUL/k=;
        b=RBkOmPr70yzFfqvMFZjcRlQJ0d3ha8LEb99rOffooa9Lhu3nrUC743MvmwfIlFLZ+b
         R96UGJG3nbfRw2V2olmcPLQbZl4BB0esfE+KToda2gk0ACYIipYURNfVTLgs04T3jNzD
         RJLfvMADl28dtYmnaeXkB+2nuKHjp+iJg2345gef7FLHqLb0RsFk+7XwzH6ggFRPhZRN
         RyyzPgTnUoEuquQhznFMiwbULpth0fV5VstQ9/KfvHz2s3yRcGHxO4mMn7BLdGq2XTEH
         msx+fqW0mitsdCsfDhMMSXO+wvhhfqIXlHdwQHuHmnItTNbj72jC137aNsBnaxrWLjmR
         X1Mg==
X-Forwarded-Encrypted: i=1; AHgh+RoNtrmWr5BVuc9UU9UWaqGCQtrvD6UzgEJySG+wggdO13bye6Oa600CzSfmkdhghdHeDBDrExWx4fxfxrHS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9nG3Pr49LxpyXfcn474zTaH/XiZxbBXLOArxPKl/VXFw04wuZ
	oijK/B3tRszR7LqmjD4y5Ow6A62DTWqPjrH2smnFceLPrFs6jPpYwL50SkQa9fhKpAUdlVpfRur
	ROW0epS7JlJ3kTKLYFlTjg67DXTaoKQO7J/b7IP/so3838VoBPXLSUz8EfOYUVDEiOS6WjK/zux
	C5
X-Gm-Gg: AR+sD13+fRd0N/fQbnRF/H/LJr1u8RDNbB0ysRgq7RQYnEY2dy4Hp75vXCwwI8juO+L
	AirdBhkgZpKBIV11ly12OVRPuITIPnITOxBCp0lYikIv3MJezm2VLxqK0UEEvL2UbofGL1HA3FG
	7ZcatBHuqomogz9VTvBo9VP9ybTLMXOEupFNCamz6x/VQ4v18EvKbH7Y8pujvePaKHfBM6GTlWj
	CuNZX+SM+6ia21vnK3S1tBi6fLMLPMfLqi7mGUlGNBhlPfEHr9eV3G7VwFrYtb0ywhx03nPy9qc
	Log1wv19qdKGBeclF4GB2JAx0W4KYgtQdepQ9cFcxsnON0S7Byrsh+czNUSOZ5P+ltxTcubYedx
	/a5nPLKj/gxGKAgL13w3tdQCENIY=
X-Received: by 2002:a17:903:4b2b:b0:2c9:e9c4:82c1 with SMTP id d9443c01a7336-2d046eb5c00mr9237115ad.26.1785478051778;
        Thu, 30 Jul 2026 23:07:31 -0700 (PDT)
X-Received: by 2002:a17:903:4b2b:b0:2c9:e9c4:82c1 with SMTP id d9443c01a7336-2d046eb5c00mr9236785ad.26.1785478051255;
        Thu, 30 Jul 2026 23:07:31 -0700 (PDT)
Received: from [10.218.4.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0ea84asm681435ad.43.2026.07.30.23.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:07:30 -0700 (PDT)
Subject: Re: [PATCH v5 2/4] mmc: sdhci-msm: Reprogram crypto keys during host
 hardware initialization
To: Eric Biggers <ebiggers@kernel.org>
Cc: ulf.hansson@linaro.org, adrian.hunter@intel.com, quic_dmukhopa@quicinc.com,
        quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_gaurkash@quicinc.com, quic_sartgarg@quicinc.com,
        ram.gupta@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260730140822.1976635-1-neeraj.soni@oss.qualcomm.com>
 <20260730140822.1976635-3-neeraj.soni@oss.qualcomm.com>
 <20260730191823.GD3139@sol>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <93704c20-1bb4-854d-3f50-dc26815796b9@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:37:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260730191823.GD3139@sol>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX33zN5S3u5Mp9
 5Qq0zOHPKK0MLKHuNDWRGzOINYSudDPzr8QnNjacMQckOmlzaKLq+g9vmUPVh5OzteMxyPchYKd
 djeaTy4QvZAgBEA+EvCNO13FHu7jeKY=
X-Proofpoint-GUID: HULqWH5_8gM4EuFO2CknBcbIjcXay82M
X-Proofpoint-ORIG-GUID: HULqWH5_8gM4EuFO2CknBcbIjcXay82M
X-Authority-Analysis: v=2.4 cv=c/Obhx9l c=1 sm=1 tr=0 ts=6a6c3ba4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=j5mz3ktRbTo_uisptNEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfXw7/wKIN8rMFV
 Q1h24Qfa9DdXPUBl2twj55mh5LprKJNo1V8g2Zl7VRVnSGuJ3k0tPYJ20UgZMA2sy0y51TqZE3P
 eR8H0Oc9cw8AsMIz4+yJz8NGzGF8xqB3Au+/8tOHf6W3k8kUZAPvpmPgj3NEtdfbA54Wv7Z3Hag
 R7JISbOJSaXU7jeswoAyQo0DcayJ4825q3LNnsVIWiVKrIitXk42K/sE9ZEa7D8KchL/zCEKMrs
 NYssxodRqeOpUgzujs88/JbUc90zkWRxV4fgSkpqmz4ZB7BAYRcYzRj0F5fPhcnRwH6WAHuI1Lc
 me+fbVRVMp0Wv7jG/lM9H3fEshKX+L5cuBh+UaYzwDn3XJuIsQRK4gt9GN3wR6CfRvnmuNCvr7H
 82JNm4M/4coiUlod9TVKk7d1kxblZjaf1DLUrcIw/6kyRvh7TcEp2+zHTaHWyV808YT7zIejk2A
 YuCTKa3cOFE3xbsz0hQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310040



On 7/31/2026 12:48 AM, Eric Biggers wrote:
> On Thu, Jul 30, 2026 at 07:38:20PM +0530, Neeraj Soni wrote:
>> Host looses the Inline Crypto Engine (ICE) keys during hardware reset.
>> Re-program the keys while intializing ICE to ensure that ICE is available
>> in the same state as before the hardware reset.
>>
>> Also set MMC_CAP2_CRYPTO_NO_REPROG to indicate that re-program of ICE keys
>> is not needed during MMC runtime suspend/resume.
>>
>> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
>> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 4aff965f0e2e..7d71dc6f388d 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -1958,7 +1958,10 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>>  				cap.sdus_mask * 512;
>>  	}
>>  
>> +	blk_crypto_reprogram_all_keys(&mmc->crypto_profile);
>> +
> 
> This still does nothing.  The crypto profile was just initialized, so no
> keyslots are in-use and blk_crypto_reprogram_all_keys() does nothing.
> 
This is needed to address those scenarios where device is running in a
stable state and only the host hardware goes for a reset, for example,
to recover from an error state or stall.

>>  	mmc->caps2 |= MMC_CAP2_CRYPTO;
>> +	mmc->caps2 |= MMC_CAP2_CRYPTO_NO_REPROG;
> 
> This seems to be the actual point of the patch, so let's simplify it to
> just this.  However, this is also broken because this is ordered before
> patch 3 that introduces the actually functional key reprogramming.
> Please drop the no-op call to blk_crypto_reprogram_all_keys(), then
> merge patches 2 and 3 into a single one.
> 
The call to blk_crypto_reprogram_all_keys() is not a no-op as clarified
above. Hence the changes were split in two.

> - Eric
> 
Regards,
Neeraj

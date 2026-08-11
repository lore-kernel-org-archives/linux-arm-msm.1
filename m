Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4814F41F349
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 22:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786488846; cv=none; b=FVQX36jvCcR3e79RnX/ta+1AmZUQTKjQv5Br+8KSbQzy/wsyDdnorq7Nz6RJOCMbAQTA1cATxnewhOThaW0vhsOVma4EQ4TzS001SKuTJnInZYrBhOfyrn7Bv/lb8WV1Aaqr/kb+lgM2PCTI3AajQu2zwAvK0kROnsLxmRYZrzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786488846; c=relaxed/simple;
	bh=6xJzdVxEIBDxUnIUmQ+uTVaQoRYbXFaslTVZWRJDhLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uVpZVic/dQxXfh8NBFFkqGONFopKpWoOBhJZXWBgwAVYHOBqsHN+UD9XtWXlZqyNma9c8xAYyfggdPSpoyogwjjJ/RR/d2barugBIGanxDSLsdTRbmOsHP3FR+hiqgyJuB/splfHTvKWX6xd6G9g/6i1+4iJq3BM+vEIqcXhL2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lrGNHAHX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxW3R52a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lrGNHAHX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxW3R52a"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLc2wZ1852631
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 22:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bfr3XhR+7EnwRRmn8p/wCANhByzHY69nWMWlM+9FuMQ=; b=lrGNHAHX7ymx/shT
	ethSghEghCa4kHIKPrccaq7iIFyUsxlnA4M3YsUONXciNhDdACmtvroMsU3QqeGO
	DyFpVvbE/UeosPu6tzC2YuFeYD12/tO9RJ22/IyhdcTyoYdaL35JIE71ZbgO7sHs
	h6aPVr5hWDETIpgHTai+aZ8bN9sR89pTsJn2n4391WvTD7JQyDii90uYEL3cw8v2
	nkhWJa1mKE4pBID8JJmlJs9lWroSonc0Dg/a/vGHR7hKrusP9AYd+wbFeptbPEfJ
	fCLQdcSuhIYj+iMjqMqKA3YXEor6OcFsttG58kXmR8kScf9gmW+UaBDz1baFUmPv
	CcLsnQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q12ynq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 22:54:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbedc1899f7so210780a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786488841; x=1787093641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bfr3XhR+7EnwRRmn8p/wCANhByzHY69nWMWlM+9FuMQ=;
        b=hxW3R52aml4ex0malZ0hANVgsY2NnEGZOuWZujgkTx89mxSlmJz5rxfOziEBGa2bp7
         7chmmaIwh2vviWAs4h8GIqy46K7fqC3TF414UL8U9JkpS4LYffZewO+uMJy8cTmoATDt
         QV4NSkmsTXVZlums4bTllJHQQBvDxAqXFBYnTuX7k9Xy5JmbAydwwPJ3YwKNE65b5UjV
         mwLg7I8rqOUNHBteSK8x+xKixAzH0YNVz6aqbfVvUqaLsQQ6/84nxKjJn8/knUWSFr2f
         e0nj0BnUyeEMsg3ggPIZpVXT840VACsVLQRBAbAejqghSo9jJ53I1dfuAGx1d6sLQSdO
         FlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786488841; x=1787093641;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bfr3XhR+7EnwRRmn8p/wCANhByzHY69nWMWlM+9FuMQ=;
        b=BnpSOYWl3KCPhG7CfX4iN+9FytbSI1fAPSEtxOcSrn1n++vUhYUypjvrHlQ+E9Nwsr
         5BbhERrJhFqbu3DCUIAdeDIibs27EpFqHdKd2uOdeMKmsGPiVm+zmdrs9+fd2nbXjCNE
         J5Buwfqtm3JX+XmDVeBHRevlPoLLATc1Kooz00WljX5tO3r903xhkKxOlSHSVsUG45jF
         5e+viT2pBLwVz+W/mm00uOEl+tOlji96AQ/gOPieqUPS4XZhxtuJLqNhwXTn93zshdEb
         B24U8Hi0F/NCDKmvvX9d16tgocFiapEXiSSWAi1hP4KAj2QuRWAbB1Kr/LOYHemYdr6S
         FwcQ==
X-Forwarded-Encrypted: i=1; AHgh+RqcPbPuDSV5HFoqOkRoxl9TD+0WymQnXzrcfeBRD0r2mAKTrIayY/Udx5jR3ol+wkuk11L09ZHRBwam35uY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw61wh9uG6RlwqrblK/QIJKBlvqJRty4ulsftS+obk6lJex2Kkd
	g6qo6rdfxPi0dMIknV6aC9dEEsPID3Od5F7pSGSo0o+l1X3gf1wjjBHXssPzLp+ebk46Tcoiu1l
	UADzeA9gsGdLBKr+GauX80e+0tR+Nk/XMKRrpRHhffhOhGijx8s+X0RZYL56V2CmvQw/8
X-Gm-Gg: AR+sD12Ikm2Bgcxjhrw3LUJWvtnD91AJKZZ2decHtq59+soLO+fdG7Y4ngnVpZeOpdg
	MVWHMvku2o0b6Nri55CVI3HP+wFEYxDCo29Yw88Imsu8GJEB2dh4gb9zG75SPZpzwvoamUXAlrW
	beW0EAIoOsLlubwI3SCmAUvME8JcKoCk5foi0puAOsd4HfcGL1TwB9zSh7+BS9kgyX81i/kV6q0
	wh99rU32M4/b/BBYcWeocfyYrS6fQN5nJMix6nobikUlPHgreN571KNZIdroMH+0HoOIBAOxGTv
	COiokF1hlCR9XIgkmoF/6JVXhXuPyuxmlQILvaaIEupKLQhblp4ESUnplNf9Lj3XJVrdBMOMhJY
	QyGPbUvJA7OKqBjl6Q82UVyQ=
X-Received: by 2002:a05:6a21:6f87:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3cc3f53a5aemr385787637.3.1786488840888;
        Tue, 11 Aug 2026 15:54:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f87:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3cc3f53a5aemr385746637.3.1786488840438;
        Tue, 11 Aug 2026 15:54:00 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.233.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf40f9cfbsm3181641eec.13.2026.08.11.15.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 15:53:59 -0700 (PDT)
Message-ID: <471185ea-acb6-4e82-80a3-ac716a1cd8ad@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 04:23:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a8xx: Add support for Adreno 830 GPU
To: Aaron Kling <webgeek1234@gmail.com>
Cc: abhinav.kumar@linux.dev, David Airlie <airlied@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Jessica Zhang <jesszhan0024@gmail.com>, jie.zhang@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        marijn.suijten@somainline.org, Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh@kernel.org>, robin.clark@oss.qualcomm.com,
        sean@poorly.run, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <CALHNRZ-yffAy7xZbjVEZOfgVeqFGZ6h9jvNkbtTsNNXGQSgeCQ@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CALHNRZ-yffAy7xZbjVEZOfgVeqFGZ6h9jvNkbtTsNNXGQSgeCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xKaVposJTLGMuqzGnvLshpMbINQpU1Zo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE5MSBTYWx0ZWRfX1gIjD1WubjdY
 lIxgtByvkW4eA6+o1vPP4xWYMFacwRYJQHeiiYuSaiZ1lcQ/fcfIf989i28cXPMxzog8ajJM820
 abziv5XMV4AhBL+ljm135WbrQbA3peFGvj2WLVl/CINZeiOt0JEArDgWU6S4JtxtoZ1Im7toiEl
 Coe04VYJXY6Tj7YINNTwmlAmsKH/DzbkfJZh/EoxgZ3EqnuJkkxx1ipl6vsmDeaGaV2Zwcp3Sz/
 BdX88hkUZTMctzi+Q4Xmhrgmz3FpSCIgQyaMwxcEfGWoq+8gVsvFM6bwAvTABzORYfJlhUdXyR6
 7u6XG17GKjQohEdbFWxFQXU/dGHVbs6hsvtEmTpM6egL1Fkf29bqda3jk5S5S4OedpIaus7uDVv
 jUcxrgTYQGLxTtnwpBNhJvDQfFQv8uQ/KYWWmoUIxKR59eVd2yWS3TPHBU+RlaQ1sBIpfh0NxQl
 JViYS0tp6a+XryM57MQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE5MSBTYWx0ZWRfX+SvAFw8YKI8k
 yK4F8F7B2cwEnhHpEpoxmWiyO04mm24RWYTRvlI+ArdoUTgCICS7Wgxg453svsnmkeGhKHFcDWr
 xdBZui7oAoYKUg0ei4mkXRhXAj7fpk0=
X-Proofpoint-ORIG-GUID: xKaVposJTLGMuqzGnvLshpMbINQpU1Zo
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7ba809 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=izYkeDe9UoOdVOdgkCo6SQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kWzrzshOWzBPKgCoOEcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110191

On 8/11/2026 1:29 PM, Aaron Kling wrote:
>> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
>> Add support for the Adreno 830 GPU present in SM8750 SoC. Adreno 830 GPU
>> belongs to the A8x Gen 1 family and it is architecturally close Adreno 840.
>> Add a new catalog entry along with the register list to enable support
>> for this GPU.
>> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 334 ++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |   2 +-
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 +
>>  3 files changed, 340 insertions(+), 1 deletion(-)
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 90a0c7ffb3c8..418edde9104e 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1693,6 +1693,294 @@ static const struct adreno_info a7xx_gpus[] = {
>>  };
>>  DECLARE_ADRENO_GPULIST(a7xx);
>>
>> +static const struct adreno_reglist_pipe a830_nonctxt_regs[] = {
>> + { REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
>> + { REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BR) | BIT(PIPE_BV) },
>> + { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BR) | BIT(PIPE_BV) },
>> + { REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BR) | BIT(PIPE_BV) },
>> + { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PIPE_BR) | BIT(PIPE_BV) },
>> + { REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BR) | BIT(PIPE_BV) },
>> + { REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BR) | BIT(PIPE_BV) },
>> + { REG_A8XX_PC_CHICKEN_BITS_3, 0x00400000, BIT(PIPE_BR) | BIT(PIPE_BV) },
>> + { REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BR) | BIT(PIPE_BV) },
>> + /* Configure GBIF GX registers */
>> + { REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
>> + { REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) },
>> + /* Enable full concurrent resolve and unresolves */
>> + { REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
>> + /* Partially enable perf clear, Disable DINT to c/z be data forwarding */
>> + { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
>> + { REG_A8XX_RB_GC_GMEM_PROTECT, 0x0c000000, BIT(PIPE_BR) },
>> + /* Configure number of outstanding transactions to 32 */
>> + { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
>> + /* Configure UCHE request time out to 16 cycles for CCU/UCHE arbitration */
>> + { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
>> + { REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
>> + { REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
>> + { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE) },
>> + { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE) },
>> + { REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
>> + /* Enable contribution of all shader stages to SP perfcounters */
>> + { REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
>> + /*
>> + * BIT(26): Limit the number of wave-slots for Eviction buffer to 1 per ALU GRP
>> + * BIT(30): Disable LPAC auto-promotion
>> + */
>> + { REG_A7XX_SP_CHICKEN_BITS_1, BIT(26) | BIT(30), BIT(PIPE_NONE) },
>> + /*
>> + * BIT(22): Disable PS out of order retire
>> + * BIT(23): Enable half wave mode and MM instruction src&dst is half precision
>> + */
>> + { REG_A7XX_SP_CHICKEN_BITS_2, BIT(22) | BIT(23), BIT(PIPE_NONE) },
>> + { REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
>> + { REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080,  BIT(PIPE_NONE) },
>> + { REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
>> + /* Enable cubemap small miplevel optimization settings */
>> + /* BIT(26): Disable final clamp for bicubic filtering */
>> + { REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
>> + /* Disable tag bank id hashing */
>> + { REG_A6XX_UCHE_MODE_CNTL, 0x00080000, BIT(PIPE_NONE) },
>> + { REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
>> + /* Limit gmem number of ways for GMEM requests in each set */
>> + { REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE)},
>> + /* Disable write slow pointer in data phase queue */
>> + { REG_A8XX_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },
>> + /* Configure UCHE to CCU switchthreshold timeout cycles */
>> + { REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
>> + { REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BR) | BIT(PIPE_BV) },
>> + { REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BR) | BIT(PIPE_BV) },
>> + { REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BR) | BIT(PIPE_BV) },
>> + { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BR) | BIT(PIPE_BV) },
>> + { REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00100020, BIT(PIPE_BR) | BIT(PIPE_BV) },
>> + { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BR) | BIT(PIPE_BV) },
>> + /* Disable redundant tile data optimization */
>> + { REG_A8XX_VSC_KMD_DBG_ECO_CNTL, BIT(11), BIT(PIPE_NONE)},
>> + { },
>> +};
>> +
>> +static const u32 a830_protect_regs[] = {
>> + A6XX_PROTECT_RDONLY(0x00000, 0x03a3),
>> + A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
>> + A6XX_PROTECT_NORDWR(0x00440, 0x001f),
>> + A6XX_PROTECT_RDONLY(0x00580, 0x005f),
>> + A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
>> + A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
>> + A6XX_PROTECT_RDONLY(0x00759, 0x0026),
>> + A6XX_PROTECT_RDONLY(0x00789, 0x0000),
>> + A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
>> + A6XX_PROTECT_NORDWR(0x00800, 0x0029),
>> + A6XX_PROTECT_NORDWR(0x00837, 0x00af),
>> + A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
>> + A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
>> + A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
>> + A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
>> + A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
>> + A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
>> + A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
>> + A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
>> + A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
>> + A6XX_PROTECT_RDONLY(0x03cc6, 0x1fff),
>> + A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
>> + A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
>> + A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
>> + A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
>> + A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
>> + A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
>> + A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
>> + A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
>> + A6XX_PROTECT_NORDWR(0x0ae00, 0x0000),
>> + A6XX_PROTECT_NORDWR(0x0ae02, 0x0004),
>> + A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
>> + A6XX_PROTECT_NORDWR(0x0ae10, 0x036f),
>> + A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
>> + A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
>> + A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
>> + A6XX_PROTECT_NORDWR(0x18400, 0x003f),
>> + A6XX_PROTECT_RDONLY(0x18440, 0x013f),
>> + A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
>> + A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
>> + A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
>> + A6XX_PROTECT_RDONLY(0x1f878, 0x0787),
>> + A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
>> + A6XX_PROTECT_NORDWR(0x20000, 0x1fff),
>> + A6XX_PROTECT_NORDWR(0x27800, 0x007f),
>> + A6XX_PROTECT_RDONLY(0x27880, 0x0381),
>> + A6XX_PROTECT_NORDWR(0x27882, 0x0001),
>> + A6XX_PROTECT_NORDWR(0x27c02, 0x0000),
>> +};
>> +DECLARE_ADRENO_PROTECT(a830_protect, 64);
> 
> I have tested this on an AYN Odin 3, which has a CQ8725S SoC with
> A830. As-is, this change causes the device to fail to boot. Comparing
> to a different implementation of this support that I used previously,
> I found the operable difference is the count_max field here. Dropping
> that from 64 to 15 allows the device to boot and work as intended. I
> unfortunately don't have uart to see what the actual failure text is
> and provide any more information than this.

Maybe your stack is missing this patch:
https://lore.kernel.org/lkml/20260502-adreno-810-v5-5-bc9fd2bb788d@pm.me/

-Akhil

> 
> Aaron
> 

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24743FC5C5
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 19:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576337; cv=none; b=pXiBznQQZVSVkA6Ct926liEtdfMn1t2GOKtTb1eHOnmOcvPnShVIJVnVZiVSyG1ri1iu7ByNMDcdwe5fKvVTNT8hdEKOgdngx9rn855SvcFTLU28p1OcpVw7O/zwFYRKx4kASfe7jtNXcmTrgHlmHW0rKOnPABWIg3MP0UNoP1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576337; c=relaxed/simple;
	bh=AyKXTAo0L3AgEd8yRnire3MPxDQQci+jMIbCW78lIY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aMvZnfyZ2SBtrVhIRo4ZAkkBEMXbs88iM7lEolKZTHk8VFcOe8b0xijDHDSem0WGCZhGP5/dTX6OuckOGKmZl97boyVgTvKgBJTuaG1oKy56BzAic8b70Pzavqgced6F3bIW/Z3czUVbUc5AOwcvSWYMzCZz0lNQ8UwEQPO1Y9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FiMz28AI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQ7KF9sH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiMz28AI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQ7KF9sH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTbYG3637602
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 19:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31YNPLE5T4n7XF3/XKNPrjdGEt2VxwkaGrFa9vry+ck=; b=FiMz28AIuKDgVM+9
	TndKWGlWR+08hVeo2x/auHIohr497PdJApghmw8my+KAtiBW+5wJ5RmIR+UIKYXn
	HA4e1cyCNgMRVsVG6ELunkp+HPe+t6F7s4nR9IefEW5sTAtTmhp5xBB79rJr1U0a
	wOvqI8ZD+9Ley8GGYitOCR1CX2gXQSzNoHOhf7cvmAcRNsA1AVRzpK9znqCPVVAe
	IugRYVY/b+4Y3tHdF8l1vN3Iny2CRpqzkMmEimrO4TvAOx0FUgoZ3lKwzSBSWzcH
	RtrsJVAR4WnU8LZRIqwfLVw5UbwkwF+39l/uz3hjnrr+wbQI8zFddAM4eTEp0i01
	B8yyNg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhhgythyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 19:38:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb733fc5024so2341717a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 12:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784576333; x=1785181133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31YNPLE5T4n7XF3/XKNPrjdGEt2VxwkaGrFa9vry+ck=;
        b=VQ7KF9sHD+NV3L3ksdotSRpvXSbSBWPqCFzVT11MmGwklB+/S2myXN4hPQSkLf4WNG
         CZm3INfmSLDr4JF9sNEGj3QqFa9RBLQdA7lItgJn9eEpKowjN5KY6ewguo78kxp4kzeD
         kf+NG5UJArjiswYZXlUlosfjF3W5OGSBptw1zXkdVF4WkWOb/HHj5I4OwQoE42bLumeI
         phYJhsifHinpAmlIbdoOuXKYAB6kbYgC8NFqtEzzcE2fhqqGgOXjjJX5YJcbC4r+S6jB
         MC1TBmwAVb9e6CKNA3hZLry/3mR2Ec0Gsy6biRCazL0Z4bTPeASAEDjdGMlM7GUG1UeU
         KiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576333; x=1785181133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31YNPLE5T4n7XF3/XKNPrjdGEt2VxwkaGrFa9vry+ck=;
        b=VAJgzKmcoEVuDMHmzpScLwUiRhrPfr80xPBJoMhspsflSpx26/Ohy2i9EbazYEOL1F
         gXd6u1MRRtWSXXlFYkT5ng2sffUpmTkABdYGYds7TrOICRV8G42jEoyPn6D8P6djoTzk
         rjac6o38JVd8YY2UvG5kkSaW9ESwOq3skqVWIDz3g3bH1Cyvfo/fck5y7rRxxjghxTsG
         FV7G0gybWM/l6aD9pAHSJXycYrYm88L/lbkha53SFd7Dlgm6UhGcokVQeY1CMBDKBt/s
         T5RquHdy+3LxB3PXLQmQpLpru2m1Ln5M1aH2XSEmGygVK0pQu5KcCfOD3AVmQNcPHnNV
         MumQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7bk7TaEHipyxa1LaXM8DL7fmGXyrRtJ3xifVXxdw8RMQeOKjuNATK7gWLBNvxcplKY7WaPxu9xo9toHNX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9tXF1o6RIcLZZzfi5etHjJYkjqrqrk0q6tupVxVKNW2hYzhni
	svARlvVsfvjk79azemHqXGyIurN5nV8ZpaaWbwW+FfsW/zXqsRZHlH/jUvgmrGBodnl54xHge70
	7k5P7VlioOSgfOfEMop7E9KfCRYTRKM18im2ImvNgqxQRU75kfkxeE5kN2GtClhC9JH/o
X-Gm-Gg: AfdE7cm64H6lo1q6B1tBGfAtTSH2OiiEvi1MWp9V9SU38GN7IHNYprwrzrSB9Se6xvj
	Dv6xQL+P+MtbYnnj5r33+KPXph6SlG+CI6mOB7vvR3P0ld7CM+fnFQZJzhuTft+LFUmEwG3Q73e
	ONTUSrra5LJhTdNF2DItPfFJzzoTzxWCshZQ9qMN9mlhhPvArA+FIP+NEsOrtcyt3QOnpcfThUL
	c6BVgvv78u8mCNZfU9qGQZwl8qE6nfXtmmkhg5Ak79sx4Bp5AgGqr81abAtJD4ls6JnxndYhXxM
	L4yMYOvjUNXTxwHvvUVDmWE+KcWEOQowrAP9YPJa28DW8vyA/NzyVnpSn3Wf1NNyY9Ur8qQPM93
	7jBEPpa6OyhnnLWeIIAYhVDts8yBvLb8AJI42WI8AdBbmrme7OQTAicK+CQ==
X-Received: by 2002:a05:6a21:114c:b0:3c3:9ed1:2549 with SMTP id adf61e73a8af0-3c3ad95f80fmr16033144637.41.1784576333577;
        Mon, 20 Jul 2026 12:38:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:114c:b0:3c3:9ed1:2549 with SMTP id adf61e73a8af0-3c3ad95f80fmr16033117637.41.1784576333103;
        Mon, 20 Jul 2026 12:38:53 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb8a4sm42357412eec.14.2026.07.20.12.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 12:38:52 -0700 (PDT)
Message-ID: <530a9493-24c7-4812-8ada-591c7b63b651@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 12:38:51 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: qcom: camss: Program CSIPHY common control
 registers
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jigarkumar.zala@oss.qualcomm.com, gjorgji.rosikopulos@oss.qualcomm.com,
        hariramp@quicinc.com
References: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
 <20260717231331.1229693-2-anusha.nandi@oss.qualcomm.com>
 <CAFEp6-2epusvgnSthNRBvOq0vONk3hu7v6tq6SF-HjnSWgpstw@mail.gmail.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2epusvgnSthNRBvOq0vONk3hu7v6tq6SF-HjnSWgpstw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIxNCBTYWx0ZWRfXxROcpdbg9JkY
 R7ATSwRwPfzmhCOmr277sFq8K/UdPxrbxBGGJ9x/TiQzKosdRQzbenFIsedFhF0QH1ljIA/v/2f
 tD4AnfbeeCSES6bnrsC33xJPjEWCiL0=
X-Authority-Analysis: v=2.4 cv=LK9WhpW9 c=1 sm=1 tr=0 ts=6a5e794e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=iNitffFvSWnhGXsHWHEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: YkQFMz8DUUoSHQIdXFszH9gYe1KnkOVk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIxNCBTYWx0ZWRfX35t+DyTtifGa
 BEXjjnwZD6lwz+GDKMasCRnTUUeCZ0gD2NLOdQCr2uDKHO2vLjgoEdzX7KjkZa+7JVJk4ENj9HJ
 8Hvr7pQIVz228zLswI3tc37T9OxritJGA5TDdt9zL7Na6I6tgdUszCBtwERzod+wOcIVzSqxgDO
 HNpz/dN6vuL+iMdbV6/VuCk4t8SVkc/gsDBNm7WpNhDZ80hs+N2D4dPSmTrJ0jFEyit4aACO1Gl
 YfAw/xzE5fYXEijGs4V5fvITOvD7uiLv+z19oj9C6GLKvTuvcBOcbYn6ibGTDSGtjQ9ptTyqOT+
 h0CB4rFu+ER8kiNL1MACLwY+azfV5Zr49wCRvch4hH7GhEFWNt+IkvF9OevKB1wWE/50sjdkWTI
 /HpGE0CiffJp3w51xe+gdocT9mUVEDVT/rzW5HN+FszsxoBH9X6yFJAJloIHCmbOp1OEpbn4K5a
 f/isWtyLZa46I9kab4A==
X-Proofpoint-GUID: YkQFMz8DUUoSHQIdXFszH9gYe1KnkOVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200214

On 7/20/2026 12:56 AM, Loic Poulain wrote:
> On Sat, Jul 18, 2026 at 1:13 AM Anusha Arun Nandi
> <anusha.nandi@oss.qualcomm.com> wrote:
>>
>> From: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>>
>> Program the CSIPHY common-control registers during lane enable so
>> SA8775P uses the required 3-phase 1.5 Gsps reset-release values for
>> both C-PHY and D-PHY. Keep the existing reset-release value for the
>> other CAMSS variants.
>>
>> Co-developed-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>> ---
>>  .../qcom/camss/camss-csiphy-3ph-1-0.c         | 36 ++++++++++++++++---
>>  1 file changed, 31 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index 25a3554ef201..11b7a236e607 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -1031,8 +1031,6 @@ static void csiphy_reset(struct csiphy_device *csiphy)
>>         writel_relaxed(0x1, csiphy->base +
>>                       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>>         usleep_range(5000, 8000);
>> -       writel_relaxed(0x0, csiphy->base +
>> -                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>>  }
>>
>>  static irqreturn_t csiphy_isr(int irq, void *dev)
>> @@ -1343,9 +1341,37 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>>         writel_relaxed(val, csiphy->base +
>>                        CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
>>
>> -       val = 0x02;
>> -       writel_relaxed(val, csiphy->base +
>> -                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
>> +       switch (csiphy->camss->res->version) {
>> +       case CAMSS_8300:
>> +       case CAMSS_8775P:
>> +               if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
>> +                       val = 0x5A;
>> +                       writel_relaxed(val, csiphy->base +
>> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
>> +                       val = 0xE;
>> +                       writel_relaxed(val, csiphy->base +
>> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>> +               } else {
>> +                       val = 0x02;
>> +                       writel_relaxed(val, csiphy->base +
>> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
>> +                       writel_relaxed(val, csiphy->base +
>> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>> +               }
>> +               break;
>> +       case CAMSS_7280:
>> +       case CAMSS_8250:
>> +       case CAMSS_8280XP:
>> +       case CAMSS_845:
>> +       default:
>> +               val = 0x02;
>> +               writel_relaxed(val, csiphy->base +
>> +                              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
>> +               val = 0x0;
>> +               writel_relaxed(val, csiphy->base +
>> +                              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>> +               break;
>> +       }
> 
> I don't really like this big camss-version switch case with magic,
> which also introduces more magic values. Maybe we should have a
> different version of csiphy_lanes_enable, based on the phy compatible
> or revision.
> 
Thank you for the feedback! We agree with your suggestion and will
refactor this to use a version-specific implementation of
csiphy_lanes_enable, based on the PHY compatible or revision, in the
upcoming patchset.>>
>>         val = 0x00;
>>         writel_relaxed(val, csiphy->base +
>> --
>> 2.34.1
>>
>>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503487;
	b=fFKJx38uiRHlvZVGQNogghWKW1DPDEIvM979IDNrLbw50Acj0zoXax5TWZhkK0yvczVh
	 VVBaLhxWIUStYI2BfhT4bgDBmWFvYfoIQgWHgkC8/F3xCmT2gjvrmLYC1qhaRIxsMbsgG
	 KxylTtO6eHjiuIiN+3n/ehto50P9EOR//HuhYxr9SA3CT61ncg2XY7k8FabwQRnjODwf3
	 LTi1SAkiNjRVUdhA+n408Ht4ntaEemcSNtFLSqTbK8FT7plBiR9NwtjcTmoDaDsnaJlbM
	 NAF/2sIfaqghEjBQZHpSh8bfkxTL1rJCOE7mrVjKOJSsBABYY05UP6ElCu78+fupUXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6okjxmAoABig3FVx0l9wQb8oMylLxVQ65k4wFbZ5YOo=;
	b=HSFAi47FiYixoOO2pxGlyVAOgnZOsM6utPJDtiq83DEzeWHDYr9N18IbpaN/0Z7sWF3a
	 wPFQeK36FINMXp6V1D+Z51WliLZMW2iUIvg0XO0dPblhSvv+qAc7/RqKcQ1aZ5ppgVwN9
	 l+EEp6TKauncLz4tblCYCjj3Er/IuaCm7M5FI/0GSl19JG2oEThyt3IYHubu2FBidJSTE
	 AskhHkhVNy5byKUeCZi3drM37t0CZVmchE6cLLrrz1KTLIh3O04fih3t0xGToOir2K5MC
	 U9W6cxC21tic+nD4WpZu143JLlXAslkoAUpLVTyIYuU4qxrqoJX5P3O65Wfv6jb2tvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kmEmWX3C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tzk2k59D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28CA606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 17:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B28CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kmEmWX3C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tzk2k59D
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACGRPFK1768175
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 17:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6okjxmAoABig3FVx0l9wQb8oMylLxVQ65k4wFbZ5YOo=; b=kmEmWX3CTFSw4zXm
	pzDf2Px3M0dU1mFLa+zvrIF36MuvRx3f5o2EP1zTQHeoz7N3waemRZkZ2j3yLZFb
	Xctwo2Sy8Jt6+UBPNZHasctgJZ32BlK6g8KOPHQ0XrAMJO/3bJQnhgFLVkT23xjy
	u54Mm/EHv4toIxPADDc15bKjQZ01aAcNImdlYc3zite8xq6jn0KTPk0Rf6F5CnhC
	UEv2Hl9jEvqRu08/YZeOCC9lCnZY0er2hFSvOV/gHAp0ftpY9XbE1AZ0VYEUNnKo
	jU4fAPgFSM28pup/r2lyW5LPqqqWsuyofj+9smGeMN4xkkNiGPj2lsgohNXzL4RQ
	LHhOfQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0ag671-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 17:11:25 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so3390370c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794503485; x=1795108285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6okjxmAoABig3FVx0l9wQb8oMylLxVQ65k4wFbZ5YOo=;
        b=Tzk2k59DqKhRVscOdEf0rD0jDZaon9sDI3udeUAFVxd/0lUZJ3HDc/FcR44r70tjpy
         jKSw5R81frnbhoo/sTIPsID/GI1Alq7G1W66b2fsMjwdalGPn80Y8ny9pJ8RCv/JDN5C
         nTxCbf4zly1tEL/WMTuPjUrnwR0n6NEEzsCFGKA/I7aW6ox13NW9vbN6RmyDDRtmxOVj
         xPWnH9k5tiVt72leVObS2bBG8xWikj1nCBpiVOjX0TnS1wL1wGiEEFkzGOTUnLNL7IvH
         Rn9H0yTePTBmSEql9EqRH8c7R9xeyfaPYHrWSDWbg1u/OpUgCqGKfhI4ayWmUMcCqQNf
         SQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503485; x=1795108285;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6okjxmAoABig3FVx0l9wQb8oMylLxVQ65k4wFbZ5YOo=;
        b=ILurQtx5btHpYQi/Yo1PH/o2lsiD94BgQql/kk0X1xgv9CLBJZtA0Awnr03sV8/7EY
         k7Ww753upx0AcpY0rZXWOhp7ACSt2UdnDc7T8uESJffK41jv5xAAjlWiqfbQcw0731J/
         /2fQgfVEg5XHVWZ9xp0ojyXON1WupVtPK2DQDg3I5+vhkJP+oSXbAz1ZeZSCgPaVwcnc
         /73u1DQ/KBqNsdr+WKvHf/8f4ktTs48BIyWkRrtcMHqTKWVKnxxtXQ6YuPWAr6OUSXXT
         XTsQdqdJ0LV68zhhqWv520JoyrhFz8GD0E+h/t1aHpCrIOozw8gXZX6olvi305A9gdDw
         3MIA==
X-Gm-Message-State: APuU4Z8rZpBTNy25U+abq7tYYkzQf0gj7xmEcioe7GUaJZn7fLRiCzp4
	fDGxI7SOl4hbbbSVfziFivifw2jAmYmztdgLEbhzE4eoIUJN4Qe2c4P8JrOxPCAq4m3PfG+1wWK
	TOwTT/xb2bpXELWc6h9D482uK7sY+I/US+O/OhJREue/osrGUCFlISdoguyzORLBLjl5R
X-Gm-Gg: AYBFou0dyBnGCtpB0eQy66Sc6C4sMpIs45KLErI9Ffy/589aTNegIgNt2eD6Oo4K1Py
	CoeNbgIVqgc8tW7CFCCdnLTEmVJcNrOWuprtzavpNwF0MM3UJ0d4sSvYAYB5d8ifXcErWZgyrUK
	mALtQFx6FkYPodkhLXo+GS4zFn3KosQvNxHWWWEC5pKZfhhEFt304pmeU9V5Q/89afzN3OuZOF4
	99LS0I/sLlG7Lq5NQ2mB1Hoa/n6snSxLaeL6X4/7o/wdc7pueMk7FKOPmbMSy3O/nK8dcboYp7L
	io1sjlt0FyAZrq20baAi+7NS39b1tczZ3plV02Us6s8lhbaqgT0hfVd5zb+MKhKUMIf9Vm9CFbD
	ldV7UOLbiTpeZG/GC/3KsEktFdOLMxNyjBKSPHSxyaxzvnwuYJSgTcEG2ScHnT7hJMyD6e/E=
X-Received: by 2002:a05:701b:2802:b0:1a7:78a3:bda8 with SMTP id a92af1059eb24-1b50318d7abmr138531c88.27.1794503484467;
        Thu, 12 Nov 2026 09:11:24 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1a7:78a3:bda8 with SMTP id a92af1059eb24-1b50318d7abmr138502c88.27.1794503483708;
        Thu, 12 Nov 2026 09:11:23 -0800 (PST)
Received: from [192.168.1.9] ([106.222.229.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm456200c88.5.2026.11.12.09.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:11:23 -0800 (PST)
Message-ID: <4f5ad34a-7e4f-474f-ac82-08098895b884@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 22:41:17 +0530
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
Subject: Re: [PATCH] drm/msm/a8xx: Fixup hw_err_irq messages
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261112160706.387641-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261112160706.387641-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2OCBTYWx0ZWRfX2parzox1ns2u
 +lr7QdaKYIDQXYnysj/aDCvnwXUL8UOXO972VqEYmgXnQPq+5E68vjXTaXbZxS01Pz+PiMHxayF
 gkVYZDRqQtVLlMWMxdof2KAEpjgfAYg=
X-Proofpoint-GUID: YDr8Jx5B_NIjot9LpWRCoKiTxYSvt7n9
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af5f33d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=LKvw4eQ66EqDTtCUdPbf+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ARhVbqjvJwDEIoiJcc8A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2OCBTYWx0ZWRfX2PBYV6FWJEq9
 NpJ3lNtABQ7i9IXOJZ1l/JYbykpFgL0ni2NsbJIFiMJyJZ8EfXVgjtnDcw0f2LW3kYteErzW6HS
 yCMJb/KN2XqoV6tVDioSSzpNmwaXvJOMwyDwb+mt8uGfOczgKC16FtPfoVGIfjmrazyvwYA0uZP
 +Jb9BTYFhKuyWHt7jBw/Jp8M/7gHfZ+/qpq7LV1Cjvw+1BSWdLHZB64L5oI0r8e8VxId9KsVGEG
 vgG7IHQsr2C1rVkvgWmgIeH52W7FuBpJVGl1JEPk64DGhpUA3AcyLCtAyMCQIYp8z7BjUPJPyOP
 3l+5Z4doV5EfGzOXrc1I5IjusJr9fQT0nnAW0fUMOOpOyfgXePKVgc/YuOACGeJViAlrloCN+nP
 5VSLuwkwhrsNP4WGG/gr89pDmzGvUmXxITQmqPWEN5zYY74luH1K+s21Qh89+o7iXC+3uBtJHVt
 HkEQvInbv3jT+QQbwow==
X-Proofpoint-ORIG-GUID: YDr8Jx5B_NIjot9LpWRCoKiTxYSvt7n9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120068



On 11/12/2026 9:37 PM, Rob Clark wrote:
> Handle all the pipes, and don't clobber 'status'.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 58 ++++++++++++++++++---------
>  1 file changed, 38 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index bbf5ca4fb6fc..a1747990e10e 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -1048,24 +1048,37 @@ int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
>  
>  static void a8xx_cp_hw_err_irq(struct msm_gpu *gpu)
>  {
> -	u32 status = gpu_read(gpu, REG_A8XX_CP_INTERRUPT_STATUS_GLOBAL);
> -	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> -	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -	u32 slice = a8xx_get_first_slice(a6xx_gpu);
> -	u32 hw_fault_mask = GENMASK(6, 0);
> -	u32 sw_fault_mask = GENMASK(22, 16);
> +	const u32 status = gpu_read(gpu, REG_A8XX_CP_INTERRUPT_STATUS_GLOBAL);
> +	const u32 slice = a8xx_get_first_slice(to_a6xx_gpu(to_adreno_gpu(gpu)));
> +	const u32 hw_fault_mask = GENMASK(6, 0);
> +	const u32 sw_fault_mask = GENMASK(22, 16);
>  	u32 pipe = 0;
>  
>  	dev_err_ratelimited(&gpu->pdev->dev, "CP Fault Global INT status: 0x%x\n", status);
>  
> -	if (status & (A8XX_CP_GLOBAL_INT_MASK_HWFAULTBR |
> -		      A8XX_CP_GLOBAL_INT_MASK_SWFAULTBR))
> +#define FAULT_MASK(_pipe) (A8XX_CP_GLOBAL_INT_MASK_HWFAULT ## _pipe | A8XX_CP_GLOBAL_INT_MASK_SWFAULT ## _pipe)
> +	if (status & FAULT_MASK(BR))
>  		pipe |= BIT(PIPE_BR);
>  
> -	if (status & (A8XX_CP_GLOBAL_INT_MASK_HWFAULTBV |
> -		      A8XX_CP_GLOBAL_INT_MASK_SWFAULTBV))
> +	if (status & FAULT_MASK(BV))
>  		pipe |= BIT(PIPE_BV);
>  
> +	if (status & FAULT_MASK(LPAC))
> +		pipe |= BIT(PIPE_LPAC);
> +
> +	if (status & FAULT_MASK(AQE0))
> +		pipe |= BIT(PIPE_AQE0);
> +
> +	if (status & FAULT_MASK(AQE1))
> +		pipe |= BIT(PIPE_AQE1);
> +
> +	if (status & FAULT_MASK(DDEBR))
> +		pipe |= BIT(PIPE_DDE_BR);
> +
> +	if (status & FAULT_MASK(DDEBV))
> +		pipe |= BIT(PIPE_DDE_BV);
> +#undef FAULT_MASK
> +
>  	if (!pipe) {
>  		dev_err_ratelimited(&gpu->pdev->dev, "CP Fault Unknown pipe\n");
>  		goto out;
> @@ -1076,31 +1089,36 @@ static void a8xx_cp_hw_err_irq(struct msm_gpu *gpu)
>  			continue;
>  
>  		if (hw_fault_mask & status) {
> -			status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
> +			u32 hw_status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
>  					REG_A8XX_CP_HW_FAULT_STATUS_PIPE);
>  			dev_err_ratelimited(&gpu->pdev->dev,
> -					"CP HW FAULT pipe: %u status: 0x%x\n", pipe_id, status);
> +					"CP HW FAULT pipe: %u status: 0x%x\n", pipe_id, hw_status);
>  		}
>  
>  		if (sw_fault_mask & status) {
> -			status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
> +			u32 sw_status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
>  					REG_A8XX_CP_INTERRUPT_STATUS_PIPE);
>  			dev_err_ratelimited(&gpu->pdev->dev,
> -					"CP SW FAULT pipe: %u status: 0x%x\n", pipe_id, status);
> +					"CP SW FAULT pipe: %u status: 0x%x\n", pipe_id, sw_status);
>  
> -			if (status & BIT(8)) {
> +			if (sw_status & A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_OPCODEERROR) {
>  				a8xx_write_pipe(gpu, pipe_id, REG_A8XX_CP_SQE_STAT_ADDR_PIPE, 1);
> -				status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
> +				u32 opcode = a8xx_read_pipe_slice(gpu, pipe_id, slice,
>  						REG_A8XX_CP_SQE_STAT_DATA_PIPE);
>  				dev_err_ratelimited(&gpu->pdev->dev,
> -						"CP Opcode error, opcode=0x%x\n", status);
> +						"CP Opcode error, opcode=0x%x\n", opcode);
>  			}
>  
> -			if (status & BIT(10)) {
> -				status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
> +			if (sw_status & A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_REGISTERPROTECTIONERROR) {
> +				u32 prot = a8xx_read_pipe_slice(gpu, pipe_id, slice,
>  						REG_A8XX_CP_PROTECT_STATUS_PIPE);
> +				u32 addr = FIELD(prot, A8XX_CP_PROTECT_STATUS_PIPE_ADDR);
> +				const char *mode = (prot & A8XX_CP_PROTECT_STATUS_PIPE_READ) ?
> +					"read" : "write";
> +
>  				dev_err_ratelimited(&gpu->pdev->dev,
> -						"CP REG PROTECT error, status=0x%x\n", status);
> +						"CP REG PROTECT error, %s addr=0x%05x, status=0x%x\n",
> +						mode, addr, prot);
>  			}
>  		}
>  	}


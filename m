Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102717;
	b=TZhet9anZMqau4OR7+ZnA2IT68wNaVNs7lSQvFacyjVALhCfXq1tw1xClPZi1x3NAFo5
	 H/C4kEqL5k4CQ5sbmVNYI0C/7nf4GIOTA4d6f+wttS1Dksx4szyZNTxYiJk4sJgcSyol9
	 L7PJ9usBfncjWmpW5L467c4QBU9lbymu5I2jLe0WrdFXd1KsIpzYEHpK3el5yTkJKNaKG
	 B7PdBEI3Zy+dPKdDfhL/bJi6mHzD3KG8R6rgWBa0LEWkCPahv8kix29fgcA57HWjB7EFB
	 4ytHqpznhhbtJjh2SOr3oqWS7ZAHU8IdJ/0PLTg0HXkNkOhEusokGnIsG6y85Dl6CbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102717;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/nGrw5+P3Y0pEQR3QfmVNANaa580jD8MzWmdSsoabTc=;
	b=M2e3K2KAy9c6xyFVFLoXOceH+47gSxEYsx3SFdFn/A1gZQDN8ZaHUGB72sTmtDUfzSpE
	 CPnQbv4osT5X0nMpKap8fNt3xGue95ioP+1ba0vKqcgz5KGeg6D911zqwtQSxI6xlZk2Z
	 Fc+v8YWM4Or7ACH3CebevsfKxxNATWALLqN23fd0SBctb9+ZfJ5v5A2AUVuD4ClTFQ0r+
	 /0q3E+xNvlzjgKcyYn/tDk9cgiS2hlHNYtTGFT3mYssueywn3H8JZ9zpWsX3vZe5qaQ1z
	 k4ZP3d709ujgVNBgbRaKMoKWjQ2rpGKQBqyWsMsxh6sZBBgEqitHYMF2F4EGt6YMZCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dNk+1EAY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ISzfUwdn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBA4606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DBA4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dNk+1EAY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ISzfUwdn
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeBWO1061450
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/nGrw5+P3Y0pEQR3QfmVNANaa580jD8MzWmdSsoabTc=; b=dNk+1EAYHKu1SkT5
	NZaJqZrSsebaw/pG8/B8UGFtpN04c7sFTDsnVYp8VJeNtOAFONCavKky3Jw49gyZ
	HgiALa8r0pqhmWwL45lfha85g7MsIGCUCbSFjxZeCp+Bf/N+nnBY8TAy7eKl60om
	TA7lSbQt5wScaYf01w6pRO4jth1T1b+/rBPyGUwBzErUIhoFQVzjHViiLdJ6hNLN
	xE9B83B8TojrqLhC50iJvii9sJ3v3bd9NnasTdvctEL3eR+GyIlEi6rtyex92rs5
	fmjhwM082dn9r20UfvaQEvC4yKiaGn4M2aF8JO4Pl7UOhLMkw/6q+JtnLxw5zI5I
	YCr/GQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t9d8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:05:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso3710566a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102715; x=1793707515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/nGrw5+P3Y0pEQR3QfmVNANaa580jD8MzWmdSsoabTc=;
        b=ISzfUwdniHXo22vGXYz2Qu+ItSDxGTHnKxPUmJlORFI82kHcgadQM3PZT1euYdBEIH
         YeVxH/ehtdCWM8xQbi0qoEltQuyNzqkw8FLq2esDtlFGGZU9GCPJ9F+yjDITgjjaw+kP
         wFUt8jrJzmR+2Ife5sOrgwzJAv35z4IbtV9XwVMC/4ZGVZf6PjCuuvwhNWiEj24qfdAl
         FtR0N+Drqf8PWVHQsGEY0can1dfsZLyTbzd+rb1XxLjAowyjNYRkQQHoUN/cP1M7wUnt
         d1FadP9vCAOIIybjW7uRO/rJAVKurHsSjSU20G4dCEqaGNRXy8rK4e3PwusseEpOGe0H
         gHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102715; x=1793707515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nGrw5+P3Y0pEQR3QfmVNANaa580jD8MzWmdSsoabTc=;
        b=uhN6gEujPGKNV2BizlCJnUD12VO9Kovf+6j2a6DP2dSY3v5BzHOF6M/9/YHA+feW3o
         wGnQA5e1gcNnMx04c+T7rposDo8YfYvt+687cbU62BVEaAeQ0K9Cs7jcPiwAqry3l2hK
         Pa0eJtCMg0eOi+C2p0NQVFLlDqo+Jb+dCKm5XP+7L58CfYe4wYBYrVUt2Rbck5QNmD59
         2Pc28Eii7ntu3eaxoEKUBDgzMFH21sZPO1Ai5Athttqh5/p6m7oVTkp7UP3DC4i5Cm7l
         2ZMUMFz8xRnIhxul/fO5Acc689cuxbAWv32roTQ746+DADVWcvDv0o9RzYuw+q50377Y
         AI5w==
X-Gm-Message-State: AFq9FYIz0IAyDk2uaN0ee+eGRApSrcv2d51mNTy1O/el6CJRxxptjrYh
	/mmJbH0oLWGAv3hL+PJH4r5+szxCfE448DRNWVe9ztFy/YpHZbtYU15iPGkUgdwt+moNfdPzIl+
	hhuio3Lr9s8pocUOZNDFFlFNXLRBdT+/wH7KJR9bNYqWbv1q2Q3WoHIpwo1iSEQyvWwLH
X-Gm-Gg: AYBFou0enltrJYBPq4R4yZh/c6wBGXQqKQ6PkQcJjnDkt9LKBabPjx7LRYqdYWvtQrJ
	VYO59a0aqlDiMdHRIPuk4AQ+EthCJDehjJo3Vdo2RPUBWtKUc83N/sQpf/4Bwr3p83swAfJt8KH
	rVIS8sd5qERRxpUAzGFw/5SMXI063Xrv9bNW8X3XeArJyS77PHzTyxrI7mOy1p28VOhec12y62o
	RstTZTBm9L7dXfhkQHKZFmnlqVDDL6wLstmO0O6TnrjhoHaE3zJtwCl4/JnGWFuBu8BilsmG+Zk
	oBoaA5Ta3uR+5earMifa7gpm790mXVtfpUPakFJkmpdPhi4xkJDW78171sR/xw4V26Dqvlq1MC4
	xc02ivaA8FxHyNd8v3oU8Otqq+++Ndr4=
X-Received: by 2002:a17:90b:57e3:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3adeb0fc65emr8055403a91.52.1793102714694;
        Tue, 27 Oct 2026 05:05:14 -0700 (PDT)
X-Received: by 2002:a17:90b:57e3:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3adeb0fc65emr8055353a91.52.1793102714216;
        Tue, 27 Oct 2026 05:05:14 -0700 (PDT)
Received: from [10.204.101.238] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404746b3sm3697041a91.17.2026.10.27.05.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:05:13 -0700 (PDT)
Message-ID: <1c24fbfd-bc88-41d9-8632-76c5dad9f2c8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:34:57 +0530
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
Subject: Re: [PATCH v10] media: qcom: Pass proper PAS ID to set_remote_state
 API
To: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, bod@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        mchehab@kernel.org, elder@kernel.org, andrew+netdev@lunn.ch,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Eric Dumazet <edumazet@kernel.org>,
        Sumit Garg
 <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261027-pas-id-media-v10-1-8a5312d3050e@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20261027-pas-id-media-v10-1-8a5312d3050e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae0937b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rTiepDLV5_WpOwre6ukA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: kQj7ggY-fZThL8soemKXoAti_wkYB1eO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfXyeevlNddDRiO
 sy86RyhtTjrUJ/7JdUeYpxtSjaUrqrm3znXosXTVtN0s4y1CKk9Z9qsfCdQa2kTOGe+0m+p1++x
 ZHU9l/9PRsYnS+i4IVALa8yHZ6v6QiU=
X-Proofpoint-ORIG-GUID: kQj7ggY-fZThL8soemKXoAti_wkYB1eO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfXz7QAqDHdTrU1
 f6baqLlaIPjLRilwkzR2RbFf/3s6BVXIcUIX3XQ3iLahzAtq5EvMAEJIz//ZtP4ce5Ojr/0qPdv
 67FX0/ItIKfD4+hFl4YxGaZwvbwScagNbtgMt4kNXd1tNPctTJR0KgINZ9EmVU17Llb7dJ+uodk
 pFcJGEj954+6iVz3evRzjqk+79Q9IzmTGqjsGH15i4ik6Kym2HxR/GADmkoqBIaxifWHYk93Gc0
 QRz8y5J3s0JS2ZcE7GEM1zWFSB1UIIbpisu6EF8xIrV/TF1wbQf2CJc1OpJj5wlBXPXyDHQkx8b
 xKFfEfAdJKc9IM5FFLC8RR5lb44Cl5dAMDIlFbuEvB2WArpVUPO7X4C/UHwN2lXxTNP2+j99e80
 IQs2qO/KGyNRQNdl0CuRgiyGZB3nFrYBE6oI98Huryp7P9U5yAaRNDD+nl/M3CZESg6YATpk17H
 Q/peew5iYeFc8jGLaUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270048



On 10/27/2026 5:32 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> As per testing the SCM backend just ignores it while OP-TEE makes
> use of it to for proper book keeping purpose.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
> Changes in v10:
> - Resent standalone, as all the earlier patches of the series are merged.
> - Link to v9: https://lore.kernel.org/all/20260702115835.167602-11-sumit.garg@kernel.org/
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
>  drivers/media/platform/qcom/venus/firmware.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 21f57d37da18..ed2bd0e83797 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -262,5 +262,5 @@ int iris_fw_unload(struct iris_core *core)
>  
>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
> -	return qcom_pas_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
>  }
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 3a38ff985822..3c0727ea137d 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -59,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>  	int ret;
>  
>  	if (core->use_tz) {
> -		ret = qcom_pas_set_remote_state(resume, 0);
> +		ret = qcom_pas_set_remote_state(resume, VENUS_PAS_ID);
>  		if (resume && ret == -EINVAL)
>  			ret = 0;
>  		return ret;
> 
> ---
> base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
> change-id: 20261027-pas-id-media-7cc70fc5716f
> 
> Best regards,

Reviewed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>

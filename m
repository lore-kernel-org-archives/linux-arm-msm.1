Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854858;
	b=fXmpug/KUdTZTaaFnYLULFzYElZvFckJG88mSvZSVvkj5OmzCnWNXrQpvZNiSOPeNvVk
	 uiJVgWinj2TAcLEwkwRKVCb03iVQDVqsN5w5N3y+g6vhMaYym7bWvJiaEgSFqDJTkbc2e
	 6n8eSagTUi7+8WPf7rl9vPviUBvJiJD6eHzI4i6JBga+6k7lK67mHigbdmUOwdTizlaI0
	 HNqoXc9IqipJEf+PKJdmrb2YOmhgNvhHYZdt8gZflvJ5Q0sHzRlvBiX2B6wObE/pITi6z
	 NB0gl6G1QbbVF9eNUV75Npnb4bLQPZUq6SUsTqr+MzAzHbGnWx/1Vlyzl05WS6nvwoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wJnv0bUBCxxkF+5/me8K4UOGEYnfBL17cIYCxZ8KEYI=;
	b=GFnW5vhdOteWBPmGI2up5ig5B839Z77cpz4nK2PrMtEbVgOHXrb3iUxLp0LIU+BwA3wL
	 QHhrsL7Jlrk6jsAo5hZ+Y8G7hJ8igPAhIwyzqIeCJCFpLFevlATWOoiX3KkbdwqNXccv3
	 XWEY7MhQ861eFw8Hit64ryMPUR3kMon65Lb/QI/nca0BOZ7LBNkhVZLevYAQV6Kq6+BBe
	 GRL82frRiX1YF2Z2RNW6BVInYZhSZ6vuFHfrZA/8LN4luwtNBDQy02JUdYWDgu63MlioB
	 b8JLxkigStLbZGclJvDdQh1h7di/QvxyUOoJoglI3hnacBSEM01Mr8ySxpbXANusIKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QxEl4S5O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgfD96A7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254C8606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 18:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 254C8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QxEl4S5O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NgfD96A7
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGKBTJ3693057
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 18:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wJnv0bUBCxxkF+5/me8K4UOG
	EYnfBL17cIYCxZ8KEYI=; b=QxEl4S5OwYMBpJm14GkNo3mBViG3j7eEQ/LGc+WE
	ytCLEnQDJL4woYbp6IQMvawY0wRDPCaG8f1OwZwJCTOe0/RhhFzYcF/cozvxBk5O
	X/mr2nuazmHjLDSofV1kyyz+sPD3UQQAbhcRjo3ecxCf5eMi8+9VZ2FCQZC9sj6E
	DHt7v5sa+p9xm85raphrjgxy+XPWab7ZL6IUkYq9IZ6lBWWoUycI1ZVtbXqEICsm
	8lEBbum1Pax0R0OZUDqX4oCepPmiqvrjpmuakI4gPbC8wN9LdIlAjn6zOz3b0cd2
	4pWbKf5SCmIReL6zYQI/MdCRQ2u/WxN8FSEn6dtrOV4J3w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f81kd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 18:47:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37158b53d06so72775eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 10:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794854856; x=1795459656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJnv0bUBCxxkF+5/me8K4UOGEYnfBL17cIYCxZ8KEYI=;
        b=NgfD96A7ObdMBQKuZrOuw3vLEcq52bi/tzatQAI/9IFNeipRgePfCpEEn3U40xgi7B
         2hfaZnbpsnnYl2vKEC7FCpdoQgGrUVnshKmUNwJkNQaCXN7294YsUzMk56ceVUE2+bm3
         S/QJcCiXUNJ/bw9wF1+JfxBGhLCbtCyOfg7nr+TkR15qOzUZ/5crBf/eWto3YBkqUGzc
         f6pjsRMB+8Sj0KYpDb1YOY/D3TM3WNNZfa60GbMAMI4Vl0QQjSFRGUA8g7RdviwUNp0R
         7G5ty+M5/9X1cPEBCf9BR792I1oYhp2IvaWqnam+PlFDxesJPPaP0YCGwRmwQzUfUv1e
         xP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854856; x=1795459656;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJnv0bUBCxxkF+5/me8K4UOGEYnfBL17cIYCxZ8KEYI=;
        b=SS9U8BCF1jFcUpyk3La+nO+eB3/vfU3dvN5ql+NCVYksrfCGUK0eOZmz2BZ+Sl+clr
         69b9XaLjk2YpBpOHZHshAcchazLIAwhqFaPeyRoL5fW7Pea2aI53UtR2FXFNU0fk2+6n
         1GFqCjRP4Yjnvb8FFGcSgtJ+acGwh808YQvjDN+Kx8x/tPGjwjEScZ4pfNjraVCAoZiW
         IT+LefZj6VY9GqQgmAXmzijFtX9gOuz1kuwVlpR2FJCloIRsbg9aML1ZybLZWNeTjZ0x
         /l+e0JhseW4kzr182JgG0nbCh5hrB3T60fAIaIBsEDBshp+N3v5L0jjwfdPbO7z20Hem
         KclQ==
X-Forwarded-Encrypted: i=1; AL+hErHNdF9Kd1MSmmLPF4eqKPjZWhiKZLBQQGwnAtw0RkTmHPFz6C4uhPw2+vmc+gg+Wd48TkFJefNxjPsBN1n/@vger.kernel.org
X-Gm-Message-State: APuU4Z/VWYnbGcy5MnT1JtNPBnE3+b1vjwvc8Ve6vJR97cAbr6xSmVrt
	1laLH6wEYQ6RFegQvuBVnwmBraXqyQwNGh3DLnT8iPQeVtQ4doqtJXQSGC0FB45eVAqJ0ncOUHj
	8X8VjlyF/IRWzy4tmb75ywCpGOwtwdhX+dkG8+iJoaZSgMHSDqjVZIddEZFlyXBgUeqgz
X-Gm-Gg: AZFdTZdkMi//6RZEpaTqFL4bi1TnNbbXj4iJ1FwwXFpZ1d5OrOtHSX4kfw+4FPGhn71
	qb34jDXwEgpIC8dV7LLrjr+uN84F/ogtKJV1lE2LDY96b8YZzuIx+qj3JGI+k3ui6h0U9MlsepH
	OFyPYJ3WIrRoehiclNL/TAFyTOllZ1p+WGxeohrON36DEriz+VlyBlhyrE8fpTmTr79HaoJK0uP
	1C/etgylYE6wsjFHmiLIT/FGohztJGE+ArXNdBsmbLPDijmeHeSjpHmRvYUT1IRLTLFkGc0YBla
	7ufyGlRjT/4DDBktPq3i7smF5kK45+L/AKJdRZYp/P/M/oU3QQp3sKftpcJMk+qhqagfH/kaIne
	HXRyXxv2pdibW+hYoKh1M54JXLiRYBK43bRVNeF3YGl+AFUbsWDxCaQVL6ZRcq5+2tU12rkSR6g
	mT
X-Received: by 2002:a05:7300:e922:b0:381:120a:c7e6 with SMTP id 5a478bee46e88-381121a0e13mr291426eec.26.1794854855561;
        Mon, 16 Nov 2026 10:47:35 -0800 (PST)
X-Received: by 2002:a05:7300:e922:b0:381:120a:c7e6 with SMTP id 5a478bee46e88-381121a0e13mr291406eec.26.1794854854961;
        Mon, 16 Nov 2026 10:47:34 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm34761572eec.22.2026.11.16.10.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:47:34 -0800 (PST)
Date: Tue, 17 Nov 2026 00:17:27 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
Message-ID: <20261116184727.oscwnaurivcxrg5b@hu-mojha-hyd.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-4-715435f52dd7@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-oob-support-glymur-v2-4-715435f52dd7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA3NCBTYWx0ZWRfXwOYDip1yCOEB
 ebWUd4a1eRAvqNZknWXBXemnIbP8QdolJjFwsUHzxYFOdMHnghA8wmzZ85+zdNWRitAjs+tWAfI
 fzhFR009fLW6HlZeN9OUhSD28rMazjRLQ9utvuyFCSFmh6HR6PLPDFTasjAhOAog7fix6rZM3Oq
 hUcUMwlQIn0ESbg8JgVxgizX/nvXDcbXWsB9ZLkc2gB1YioK7FWrad4BxvzqcVK50WMERheaiNL
 aMavO9nVWQfoJgaOT2Y9WqQvbJcfH87VCKUJAZkSq2rWnAZaxownktWm1pMC1id0r3mcNljkDKb
 JC9j4/IMve3uK2PnCzdkKw6LrCjKsYrCY+Ayhh1bBataJXoqa/iZLDMJmyPGo1rtfhE6+u1QWjk
 RnA9cyEktgXUpSLZSw4JH6bMXkKrKM3kFD9gC6QJGisbJLzlSYfB53e11EpMdl9g6bGCdsOR5jb
 xiRyPgRNp21Xd+DemvA==
X-Proofpoint-GUID: COvS1lQFe28CsXGBBNpiYirIE1Kg673I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA3NCBTYWx0ZWRfXx6EMNekQD/Ii
 VsrtnFp763diKy5MIqi008CcGWat2LGZjLX3emJfBThnetdGV7aQVYUFdpCbETIhLiwr5pZ1gOa
 E3GklDb9NjT/RF53//uidVh1fJODcrM=
X-Proofpoint-ORIG-GUID: COvS1lQFe28CsXGBBNpiYirIE1Kg673I
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb4fc8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HDZkkxcUch80iLduT3YA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160074

On Thu, Oct 15, 2026 at 11:25:52AM +0530, Anvesh Jain P wrote:
> The OOBMSS consists of separate OOB-TEE and OOB-NS Zephyr subsystems,
> each with its own firmware, DTB, and dedicated PAS ID. Add support for
> the OOBMSS PAS loader on Glymur platforms.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 374cafd04b62..ecefc6a72fd2 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -2080,6 +2080,30 @@ static const struct qcom_pas_data glymur_soccp_resource = {
>  	.needs_tzmem = true,
>  };
>  
> +static const struct qcom_pas_data glymur_oobmss_resource = {
> +	.crash_reason_smem = 669,
> +	.firmware_name = "oobmss_tee.mbn",
> +	.dtb_firmware_name = "oobmss_qc_dtb.mbn",
> +	.secondary_firmware_name = "oobmss_ns.mbn",
> +	.secondary_dtb_firmware_name = "oobmss_oem_dtb.mbn",
> +	.pas_id = 0x42,
> +	.dtb_pas_id = 0x43,
> +	.secondary_pas_id = 0x44,
> +	.secondary_dtb_pas_id = 0x45,
> +	.proxy_pd_names = (char *[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name = "oobmss",
> +	.sysmon_name = "oobmss",
> +	.ssctl_id = 0x21,
> +	.auto_boot = true,
> +	.early_boot = true,
> +	.needs_tzmem = true,
> +	.decrypt_shutdown = true,
> +};

You can move this alphatically before glymur soccp .

With that change

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

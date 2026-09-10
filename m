Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06CF47CA63
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041581; cv=none; b=EDg48GSPIDEDbNgJ8Pu9WAHzmZ7JsLdX0o89zDMS5pT7bgZgnTvFMgQxRDDNW+e8w9WufNvGzmVmIw3Hw3I1+WNUT30zN0/sBz9uSi5Tthcg7JUh+QrA6Koy9OlhxyKlSUF3xV54vNe/GHcynTD3kK5pFn1oYonoxoydHKlrXuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041581; c=relaxed/simple;
	bh=GJ6BpM1uCHBMBrapIEX/iqtBhqYUuga43iBpGG2eGdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2ZG+q8PSHqOQqLH5oCslFb7cBnv75dWZTUZ/0RwJtMYWojiLWBcA6JjQB59nHNrzFpMcQAa3nQ/gMPvsOQXjWM88BY1Fg16xZQJja5olsokvO5f6I+xAtaZnPG9aU7P1xbIhFBTS5Uw2356C47ou++RB+ZTvBpC1Gg1rFKyhGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9/HO16S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ObiPoXtN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9/HO16S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ObiPoXtN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8q9OB643939
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 11:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CLH7qz0NWdvoLgl92qGsLU+S
	1iK5EIOdQRdtGSN4UZU=; b=n9/HO16SKv1rNrD0EOturQxMY2N3dpECxgmFWkhB
	LXSDtsXHN0K51TYYvi958EY1NGRpr5r+w6/WP5HcUQYdgZCOM+2UiCRKCPC21Km1
	4eenrRN3TRfflC8Owd6IHCv1OTDP7M+GAPFxFFXxPmlxjdl3lLQV7Z2IxxawXflk
	vANxWEnOCN3SHNX9p435dAAD4X7+JR2MxJy36UThfActzGXgevDicol6sLW/SH0Z
	ExfjVugFYukJBVjPLRtw/kUQacJUf2hNUqfEB3XNnhM99wfD0IbK0EbK4RJF5SgJ
	+8rqKd8rsgBjmVPMMPUzEnnvkLSJWmivxdWDEFZwZ54ghA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg3rs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 11:59:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db8c152622so25367035ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 04:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789041577; x=1789646377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CLH7qz0NWdvoLgl92qGsLU+S1iK5EIOdQRdtGSN4UZU=;
        b=ObiPoXtNFXAC2zaOKcAmpwVGJh2ztaHRsc1G0j/foecILYN3zLum+wFTJORW0NtNtT
         ONp2IYibCv0/eqFEqcOnT8iJEGcbk7IG09oGUeokDZzof0Qh5IDcjxemi5CLB55y9OL9
         JkNA2Qt6CTvmfZvjugOsi0sX7cIwzROGEAHQ+hVY4Se1pd9E9O5VMBNWLk9ybB41HXMx
         1zZbPRHp7dAQTRDRPg+NcJ0eWVU1GseQynpGDhB09sSnpPCQe0naKCNHvOHgY0cW4G8f
         gWIS8KCf/NnRT/0ICdLXiyy0PGGBpkYTm/XqJmZENrhxEeiUOrw9wyXuiqnofv54QFln
         jwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041577; x=1789646377;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLH7qz0NWdvoLgl92qGsLU+S1iK5EIOdQRdtGSN4UZU=;
        b=dsBF0VQ8HgQQpYjTsmg0HbMfZn5rssZMFWO/+qL7Gk1/kVBLOX1wUI+SI6fPMBnmPV
         SWofr8V36DYP0cSxSWtBIVwKMHne42BwXfb9eujncZxbO0qUVqFfgjGQ1qfn6d3Vs55W
         v5umTxNIm74hFjY1AvdkJztILEGZj+3Hqpg2pu0lMXZUJxCYoo7EOJZEilbmhafQg/2U
         wo1tEcm5yCNKzsd7tnLXQBnVv1Abmlz1e5coZ0Y6mVnFn7ZPE0fbZd2JETXnNRqXekPQ
         /QVtSgIJvFkRoG9DOY2DrVhvZDP5Jy4e5ru3AMha9dmRDS0t+6SXL37tdFNtN3GukCXN
         p/sw==
X-Forwarded-Encrypted: i=1; AKwUvBxWUXx2YuMagtMBnDGmhinJQpAmc4mWziVDOL5IUfcS1xAYIPPdI8O2JrkgbVuDnq9jmOOClAQztAMUHobZ@vger.kernel.org
X-Gm-Message-State: AFuF++lCC00DTRGhiAil+982OxU0VJ8YDQ6s2+Fsvb3FTl4oTNgBrYNH
	gqkHt3suyuifX1msHpDy43jM0Th7oijAcuTToDKfWhP2UaMEyMY614CzCaC3bKp3r4eWJgKrDGU
	9u+DA4EWf5NXNn1rBgjnn/IQbvmJtSebc3f/CZ3eC8FmnZsr/K/iuxua6LR3F3q8Ps/Fq
X-Gm-Gg: AYBFou3P8epXpy8XtXrr4qjBtbeah+e4t8aMtngLA09CV0weaGxld+Z8xIwb4aOvjK/
	1txgaHwfq8or1gTUxPTN34+JFuL+sYjk6HVzPyIJk3CSOG3zYkdApC1tMlOIAyaBOG7rsDhMUXK
	IoyyCs0m1/TiEWVW3Ox/EzeG/FrqotBX7pLqmI+Z6vyw0ogaTphPawUTHRAoir8vAXsIPQHdVoO
	j1z27pI9K+SZpEpoLk84brCJRoMw2hUaKTcb0iMGIrPBz5c7eWHiz21wCibuEjAdOmi58J9FRER
	A/PQdo0xPQyjNTUGgRGRNpWrs0mhxXVGCFbOdDOGOF4IsUxyhWAKsD/FYwG2YJf7dKiajSktgvk
	7XgDld4/M6421XXQb+UbtQEPNYlQ=
X-Received: by 2002:a17:903:289:b0:2da:e67a:87d4 with SMTP id d9443c01a7336-2db1268128dmr603110075ad.19.1789041577467;
        Thu, 10 Sep 2026 04:59:37 -0700 (PDT)
X-Received: by 2002:a17:903:289:b0:2da:e67a:87d4 with SMTP id d9443c01a7336-2db1268128dmr603109085ad.19.1789041576804;
        Thu, 10 Sep 2026 04:59:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-336c2571039sm30667653eec.25.2026.09.10.04.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:59:35 -0700 (PDT)
Date: Thu, 10 Sep 2026 17:29:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes
 for read request
Message-ID: <20260910115929.jh7qxhqegwcbeaeg@hu-mojha-hyd.qualcomm.com>
References: <20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com>
 <20260910-rsc_read-v1-1-c9b7fa3cdde2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-rsc_read-v1-1-c9b7fa3cdde2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa29baa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rQV1GGw-0HjdQLsJXHkA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: FyDSQhpXgAD0Sf0-zPQUpzNL5DPKAyNu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE0MSBTYWx0ZWRfX4JxM/3NMqb5X
 M9z5Cjl4cS6AjDLezCH83KSgsQooP8Yje3YsHja8JMM6TcZI1tHim/0+lLJEpAiMuBtIHs5RvuZ
 mscUyXWBRYalaXQ6bcJYl5Xi6mSMo7FN5DfY3L7jDlEbXZP1TkSGoIdzZnm5xeYgvN0FnNzkec2
 VBj15x+Ah7puWPwEx75KLSWW1XsEzckFSFpPziDVmvM04glyErpSJhNeG8wlGAi7dPoYWytCceb
 nX7nXLtUqX41ZV+Uc3VGWRyWaQEvaQSW5Ph5lHG6RHxCURjuNT5uZ5ZBoMAL2rjAaZxZogqNotl
 SlltL3fT9z8YlfIQHp5b0TMrjKueDe9esQ30JJ/GLkr1NEIKLFM9qTs3BXeQLBnPxrD2ctfZ6w+
 IN3ANtq77oVSbtZPruwTwnPzxNmm+c9/vnLScCWicLFChK1GJCfCjp/AnjQnW+w9mwdlYO+whEJ
 I54IOcI7Ossh85Q7n8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE0MSBTYWx0ZWRfX6VGx4TdET5pv
 0jUJsCoaU3vVfWWWqTLPfiZMjv+VpXsnmdhOf5L/MOaAaZ+wqw7sWiuAw5QnbObV/ipw8B2RNn3
 UQb0omhipjO8H5hOWF0D+vj9ecVjTHY=
X-Proofpoint-ORIG-GUID: FyDSQhpXgAD0Sf0-zPQUpzNL5DPKAyNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100141

On Thu, Sep 10, 2026 at 02:23:01PM +0530, Maulik Shah wrote:
> Newer SoC like hawi with RSC version v4.5 support 4 byte message read
> request instead of default 8 byte on older SoCs. The write request
> continues to be 8 bytes.
> 
> Update the read request message accordingly on RSC v4.5 and higher.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index c4542318eac4..f84a399fa5dc 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -86,6 +86,7 @@ enum {
>  #define TCS_AMC_MODE_TRIGGER		BIT(24)
>  
>  /* TCS CMD register bit mask */
> +#define CMD_MSGID_LEN_READ_v4_5		4
>  #define CMD_MSGID_LEN			8
>  #define CMD_MSGID_RESP_REQ		BIT(8)
>  #define CMD_MSGID_WRITE			BIT(16)
> @@ -499,15 +500,21 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>  			       const struct tcs_request *msg)
>  {
>  	u32 msgid;
> -	u32 cmd_msgid = CMD_MSGID_LEN;
> +	u32 cmd_msgid = 0;
>  	u32 cmd_enable = 0;
>  	struct tcs_cmd *cmd;
>  	int i, j;
>  
>  	/* Convert all commands to RR when the request has wait_for_compl set */
>  	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
> -	if (!msg->is_read)
> -		cmd_msgid |= CMD_MSGID_WRITE;
> +	if (!msg->is_read) {
> +		cmd_msgid = CMD_MSGID_LEN | CMD_MSGID_WRITE;
> +	} else {
> +		if (drv->ver.major >= 4 && drv->ver.minor >= 5)
> +			cmd_msgid = CMD_MSGID_LEN_READ_v4_5;
> +		else
> +			cmd_msgid = CMD_MSGID_LEN;
> +	}
>  
>  	for (i = 0, j = cmd_id; i < msg->num_cmds; i++, j++) {
>  		cmd = &msg->cmds[i];

Tested this patch on Hawi, it works; without the  patch boot up was stuck.

Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> #Hawi

-- 
-Mukesh Ojha

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D475F378D64
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 17:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784310443; cv=none; b=SzAasyF/tFUb0IxYhjcgYS0bk9JyAf8nNC3Rx++0lASjU6EHFAVInkP9zya/Qk75IT9TeehiUuUKnFr4nbr9DYyTQxrJEZ2mEitg92LLfm9SlGf+14M1rzukamNjTLz7LpxFoidHGqRX8FpYYA46IOdVGWWMFqILAXwLSTz/JDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784310443; c=relaxed/simple;
	bh=9fDNi321gnm/Jz66e0SwqwnMPShiJMxM+EJ+fu2jcdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9KIQxp0K4/FKaCyuPI+HwVnEjCmzjT7JtKOIevkYzGaqrl59AB4GZwJ3FG+3B0xJ9ncvGtNl8I8cS1ZHg8Q4et2Ui9MMd5kUW5l3TING687xucSJNfiFpXONqPN1OFrJ+RLp2xkJuS4xlUlZ4ECXqMdnlXFEki/HNoyAqxbPT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOXC9GZ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BzZFOxQF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOXC9GZ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BzZFOxQF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HHPqwf2574989
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 17:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JtE1HsMYaRVG8p5gg6MbfUUNnR432eFHnGQhNGrt0zQ=; b=JOXC9GZ95qCWLiZj
	ScWWdfhVnXgWyrZdDLkAOlMAX5u7N26u305dmd1CcFanzu8brYJiGyzb/0elFRuU
	SzBrcgwaPWdi1Jy2oMCXiu6ELLLOrCHnttVSelcR892Lcnz4AHKRZWnHKYfIrxZK
	AyqkBHUGeahWBotgpjVIKA4B/b0h0dQSq3VaGCjUbMslmiI459CIUVqvhr1gDhQP
	bdxM2U9XVABD2wx2nx4JRuop6/R3E1U2dr91UWptT+LuVDJvQlqZwUhrV/6SM3/r
	1nEJKE78vjDNTitA7xPB1Ew4WmbF9ViS4m2XSMinse0m7DXLbHK3X+Q/Wwt4UIbN
	aBSccA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrsq832a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 17:47:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38d7fcd1f66so11993692a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 10:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784310439; x=1784915239; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JtE1HsMYaRVG8p5gg6MbfUUNnR432eFHnGQhNGrt0zQ=;
        b=BzZFOxQFI+JKGQj3vpMxT7LDaUr/xnJ3SbDonJfdUKtXu47HtVeefLYBbJ3TzbvFWS
         ktXeHB2AtjuvNDl+RXdkbbNGPAva1eLXA7CtIIyyvd8fnBejlH4WKzaexSbYYT1Mj26r
         SDUWRW+Vmz1m1JiujF3am/wZPYYmPjUSgogRqx9LFTniD0M1US9G52cfn1fLrWFGSYLK
         i/WYUCJCpFVDY1eDWbxHBV15witM0gqnHCHx8mI9QEXhnTrpEFrg5Qf/nQGbg7ZfHYfF
         7/qarHbXrRFDwtSiidXhzUxlk5Qd7+YQmO5jtLzxz0fRLJkdrQef1TIPhi8hMR26x7aM
         h05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784310439; x=1784915239;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JtE1HsMYaRVG8p5gg6MbfUUNnR432eFHnGQhNGrt0zQ=;
        b=U7BYdt3BC2VV6QGY4BkzAGp4ec1jJebMbTiTRA72bi2CI5F9fpubmF2maNUJNI7xpr
         rT3J5jJwcQDdOvNUojtA9njPYejV3rg2LQh8f5wNSkteUNzUvKn/yeTeMKJIzzlHkhdq
         T5pVnEZOPxVj2MYKjZd8eUrp0TQ2U/JoMQl63GRpbGfnlRhSHY1OGElTXryWxVQ47m1J
         56L7g7Mew+m7jqLGpF1xV4E7RWaOXyuPG0jipUAXfPoqqBzOyCrg8mWkkMG2DMlNy++e
         jkBZ49eMjFFYd4QqkVYm/Lv3PmhZaFgwPAnx/GtbD9/qX9HlfU2Ihf3lJqG8eP6W6okZ
         HHJQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZql4C1kBi8y1G/EhVYxUdVZwyxvS3AN9J1ZdJ0C7/CKgxwf5BRPdXrcY6X3aaSigIEiC+iqUvR6T/LKjJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwExuZK9bom+ser/Ro/8oUrTGEJT8Pmx4Hr+zgH9iV0Hp/i+u6M
	ukUD42niUUFD2tOuysMESCpwQYMExtG4+qeI98GObXTt90jj0l6+2GeUcgURfKZ3+bogc1X8q/7
	I3x1+hQ3XZR6Sc1PFjxpn4eY5mGk8zQUSk2duBQhFPTOOe7JKEC9YPBow003b3uiqWIAO
X-Gm-Gg: AfdE7cnDgY2Ck1+VB8dT0985iinfzrfwK0+DgMzp1x1cxkTU9X2by6RFgdtiTEzFUnK
	GinwhVmlQRVrI21eiJmfq3Sx/045MM800WnpAnnGr8YIuMlM0HzKw2I/eyJGO0CbFJBMBE2/hWc
	l6UbJqvmlnULLBzPNRMlUZGlz8NDPmSbNtwuS7NoMJ9qlpgcnn8SDYjHlZJFnM7LlYxK8xaaLWG
	wiJnIeWp5J+ohlmw3lmO5H21OLLwWqe1f+98Kc6FVA6uTRBezMROu9A5/+47gFP1/tGSveisc39
	kXsCNg1Zn6gms9gJl0/ajpH0jf5RWVYZk4o7LEFUvWtHiNUEXwFn6yvajKVEa5Pis0bWuBGe2UE
	6zmJlDxC4rfNTAg7KBocZu6+6d6I=
X-Received: by 2002:a17:90b:3890:b0:37f:9ce1:736a with SMTP id 98e67ed59e1d1-38e4b56bc90mr3558163a91.32.1784310439454;
        Fri, 17 Jul 2026 10:47:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3890:b0:37f:9ce1:736a with SMTP id 98e67ed59e1d1-38e4b56bc90mr3558120a91.32.1784310438795;
        Fri, 17 Jul 2026 10:47:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bb62sm8718501eec.2.2026.07.17.10.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 10:47:18 -0700 (PDT)
Date: Fri, 17 Jul 2026 23:17:12 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: Re: [PATCH v2] EDAC/qcom: Skip ECC interrupt setup on Shikra,
 pre-configured by DSF
Message-ID: <20260717174712.m5ssuy7hu3va3rv3@hu-mojha-hyd.qualcomm.com>
References: <20260713-shikra-edac-v2-1-22fcb3ca9fb9@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260713-shikra-edac-v2-1-22fcb3ca9fb9@qti.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE4MSBTYWx0ZWRfX2yW+izllaarI
 kq6/LXcT1nx1qSOmd0WLAPZDULIj/02BA7d6bYBUfAP2Evc4mTX34447iU47j7YGstGnerTleyO
 cb4L6cDg+2ciy/XOkSSPYAbbKfnv8yY=
X-Proofpoint-ORIG-GUID: nrRqBR_wdFo6JIP8H8cIxD8xm0gf7bD-
X-Proofpoint-GUID: nrRqBR_wdFo6JIP8H8cIxD8xm0gf7bD-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE4MSBTYWx0ZWRfXxe1S7WgjfSnC
 h6FyXACd/Jlg6jwOmS5et8hcFd9Y1jLYF8FHV24iQ5WltFviCCS0B0cqTDOeeFXE5Ni9kJ0WfCp
 OAhLKWFH9NY0c/4gw1Gv0eQoBo0tTaFxDYuaOVkehG+Ey5J+U4fovjxzJXYgBC5zRhl2ew/KBCk
 xRePSyhCY8dpUkOibh4DC9lvasvCwUfgPQ7ctjE6lNXg0ZwwvsLgUbxrHCf1aMvlbOISXdaJ8xi
 bXbEgrQNQYDLykfYJUj/cLPyHlRQNxIzFcVpNzO5J8Y0yBGs1szHM9YCCRCGdp99na9Qqy6wW/L
 Aa56nH7bdzPr3tTywrXeidz8CsDVNvaWBLE3Z+LSEwIAQMm08neaPibWeYP6+kVpGbFief0cYrC
 us/Bdyv3MpLSjHmiUd7IsmqDvJo613BYl7YoddxYlH6aRut+Pg8x4hePC6029W8eFKSpcdlxbGo
 toM2gKe6pCNF31IC84Q==
X-Authority-Analysis: v=2.4 cv=OJIXGyaB c=1 sm=1 tr=0 ts=6a5a6aa8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5p5EtIVmtANYLvZTpjYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170181

On Mon, Jul 13, 2026 at 03:28:52PM +0530, Faiyaz Mohammed wrote:
> On Shikra, the DDR System Firmware (DSF) configures ECC interrupt
> routing before the kernel driver probes — it enables Tag/Data RAM
> interrupts and programs error thresholds in the LLCC interrupt-enable
> registers.
> 
> Set irq_configured in shikra_cfg so that qcom_llcc_edac_probe() skips
> calling qcom_llcc_core_setup(), which would otherwise overwrite the
> firmware-managed register state with redundant writes.
> 
> Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
> ---
> Changes in v2:
> - Dropped [1/2] "soc: qcom: llcc: Add configuration data for Shikra SoC"
>   which was already merged via drivers-for-7.3.
> - Resend as standalone single-patch series.
> 
> Link: https://lore.kernel.org/all/20260630-shikra-edac-v1-0-287b3233241a@oss.qualcomm.com/
> ---
>  drivers/soc/qcom/llcc-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 22c8099cf6bb..733999867bbf 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -4595,6 +4595,7 @@ static const struct qcom_llcc_config shikra_cfg[] = {
>  		.size		= ARRAY_SIZE(shikra_data),
>  		.reg_offset	= llcc_v2_1_reg_offset,
>  		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
> +		.irq_configured = true,

Not related to the change but somehow it feels like the name could be more meaningful 
something like irq_fw_configured, anyways..

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
-- 
-Mukesh Ojha

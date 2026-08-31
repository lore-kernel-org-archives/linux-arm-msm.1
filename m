Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DFD397925
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 04:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788150507; cv=none; b=sXkc7po6XkjckMEEqKDZi1Vqmm9WdYe8BqIFC9e+VLc9lXkHqLs3hdq17FSBmKg3I2ZJG3eQ1gEKr1bEhMbRirpFoTCGMBSCfKm2JVIt5+c/iXjfF52ILeow1gCNEQD/3Zo2ayxg0yLyvKx6g1j7T8JbbEdEcPozys3GGQE8gqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788150507; c=relaxed/simple;
	bh=FlZB59klIYDnjaSJnk+EYr9rEY0chamvUbXVZXBcflo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTY3KMuMatuaDHq/uj+hb1pcj4AtokAehrKu/is69IaDisfqr8JiMdKTySHVmWkCe8IF7IvFDVSUlXJHCJ68XQayf1fuGlh9nhCaL8Kt0eXewJA5nRDOqgVKqsJ45iBb4ARZ/Lpbbq8dXnOXAixR+em2ZvQEkOkzgjGQkaREXpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5hUaKOG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YMzMI88N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5hUaKOG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YMzMI88N"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bgTk2587077
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 04:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gYzNMIBWRqtQwH2Hk7BQW8aPvOX1OBjWUE2LBm+X20M=; b=N5hUaKOG6K8y0UZu
	+b1ari2nlDguQ9vpC3+V5E2vMaKj8eOc9hbU4GsR18nJE27bDsN8z1eoeCRsQS+T
	cX3AOJaxuqTeuQODNULHJgNzly91ZV8C9rJOAhG8dKyI11jIP9djyvZruiz8P2Fv
	6/XLuJ7RSWQH3+q7eZZgL54jzct+6jEwZfThxiRmaNC8vn0mwTkWxhvWTCXv/V7A
	GyuHIimkc5c0u7B+jlwvA2lONIwGGIIy3CyqkqxTQeYkTT1FgIhtyP8KfyC6Dt6Q
	PLqhLcqjqG88bJhRIzOz5D7FBiXRxzVGwtA7wzD6yo1XlqVheMCXtUQfGUnvtQkc
	MxnCsw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdvmh55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 04:28:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1c057f480so3430057a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 21:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788150504; x=1788755304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gYzNMIBWRqtQwH2Hk7BQW8aPvOX1OBjWUE2LBm+X20M=;
        b=YMzMI88NoEnLtEK9uh9ozJAuP7GpJnq5UUfcgG0dukp9oTOlr+HhDZYbjPLWjVod6U
         uBH+2fW5TocT+f8oYpdy72FePLDRlQXdbtsJMu4abFLpsPCoMlMuYkFDusLy7yWWFcJZ
         p6pb3Tnt47d/FAoxzFdMqklg6q2Gd+KvZHDF8pLQtMo2OWk8Pxd1136337K23kJzLWXI
         wgJ660I9gEs6M63Cphk9H0s7r/WDu7PMCK1gyN02MSJZENDfyiE8j1pJPepHYVvd11+2
         q9fVB0XFXc0/orlHTJSUQifNnN9qLvdukW860pcOYbVe54mVTXeVKPEP/0Cw6AdBXa4f
         IZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788150504; x=1788755304;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gYzNMIBWRqtQwH2Hk7BQW8aPvOX1OBjWUE2LBm+X20M=;
        b=M4vbBNfJgGSdg3tj4czsHNYgAD0INN5E2pmxgWI2edojHkHZ4jk6D42uoLS40GY72O
         4NBEkHgM0gpNt5iQQAXU7KbIaIQ1DSmp8ypsPth1R2LZtLgU2fTvcgwB2SF9ezb2POn0
         BnyMYFzS48sugypIrgaRd3UWrkZCEQ9JMvjbSjusklCA6eux2h6ZdxGCZ0NaSmXKqx60
         ZmR0XTExTrvSyK0o0Qms7YfJXP6WfDFAIe6b2IJSvjIWnVoD9gkRS3FlwSzA9d2OLpEI
         6p0pbkpN3AyXn1H5eC7DMTtIOnvdrf8Xg39xikqU1PVUmhxxjL8OHAfWY21kR87k6FOr
         /ecw==
X-Gm-Message-State: AFuF++l8wpmH/R9muTZesjy0ES+j4e5SlfhO4tdQqsOKOMNROKYTrX2O
	vyL6UX+Ngj/RxWAxqjxCUDh+gtTbA2UDWNoM6G6kXtPbbZm1Hq6DZBISLVHsKjn/7yq8ioFjsdM
	zck7eQP3jQBD/eB+E1wMY43WJzfP9St+dMJrCvSvQTGqinGEndTXo9FbUuVQjSJ2/pQPB
X-Gm-Gg: AR+sD114f/KVuavwxyVY92nd1dvPUWUHF9RK4vD/GdwYiWI4boAox/9zvBDSkS6sWYk
	gPM6owmblGHk5VKzWkYcV7TO2fs+ceyCTWDjIXZLwIMVjicL+Q+n3FzybPc/d8dNqms3MaHXQaf
	0q2huzk7vWeorBTefn1iilMlt7Op7nyBQoZkt4g+3l8IAkFqIYYV/7WCYMkco107uy83VaSvbA6
	9HgXga2pMhlG4YS6tmhtlFGPmE2sIaw5ssbqw882xBEDzT7UpqQJHzIC2KxuYYoqasynh1rKhXn
	QFYhjdPnpagCzp81ajbnpT9pMmsCA1uhfPmgt1JAVNDC9n7eochkRYDAuf5M3cBjHBMWmZinjCk
	c+kxSCUOIiuqTCL4lxXAZbAWXob75
X-Received: by 2002:a05:6a20:a11f:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3d269a4d3ecmr35810309637.17.1788150503858;
        Sun, 30 Aug 2026 21:28:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11f:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3d269a4d3ecmr35810254637.17.1788150503413;
        Sun, 30 Aug 2026 21:28:23 -0700 (PDT)
Received: from [10.217.217.192] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm26402121eec.28.2026.08.30.21.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 21:28:23 -0700 (PDT)
Message-ID: <30eaab00-2794-41ef-a449-a72645560b96@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:58:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: common: Tune clock controller dependency
 on runtime PM framework
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
References: <20260826112021.1455707-1-vladimir.zapolskiy@linaro.org>
 <20260826112021.1455707-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260826112021.1455707-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fVrEH7wnCgjGrONmJdtAC2uwg3e8V4cf
X-Authority-Analysis: v=2.4 cv=P6EKQCAu c=1 sm=1 tr=0 ts=6a9502e9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=SEW-X66Ac-w0rihTK0QA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAzNiBTYWx0ZWRfXx7BpyXQ2EnRL
 BckynzeBfbTLJIoiAXTRUGUkYo2TokAv5Jx2Lxdl8Zz+cgrHTS+D1kgJj4n9ViikhzbzWAHvsZM
 vW2ynVUhwmH0xZkT6FJFObl+VfPwpGqNqF/v5hEYYNW2V6ZCh1PirFiV6XLx6x9cfx3Pqnoz7yy
 PIRtB0ADUFGVZKGyKRMpReZaUmDFSQAtXCE8AfUYvdqEP2cgssVnSLK8apdLGgC9/aIvaSDxEsj
 qLy5xgx1DyktyraQmVulrrCbcIUPdmrRL/jaiitduU3BkVB6OpADBTka1mSenTno6XW6y9uEYM6
 LkgcaVsmkfgvhDLq2cwPWHYOqQS4JkQRKW9ptGk49aoVCXwdzbkAoe2byrVc4KWhBSo20axw1ag
 O95k/4tU+rqI/Qph992zjwHajfwrK58b5Rw82y/gYUcDx1uzDt7PKfnqTC4TGA0amupx/7lgCoO
 WcNKeKG7cpOMjpruiPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAzNiBTYWx0ZWRfX41FpsOXD2muf
 0ddRgobYYvTdntDD6c4708WqGERQgxujEpofxAfUU+r2KTDqnc0vPpe3pxgIFWAPaZtOw1u9xAL
 CzidRbWLBxARWiWvzn4cZlT0TSuJ47o=
X-Proofpoint-ORIG-GUID: fVrEH7wnCgjGrONmJdtAC2uwg3e8V4cf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310036



On 8/26/2026 4:50 PM, Vladimir Zapolskiy wrote:
> A clock controller driver is expected to be embedded into runtime
> PM framework iff there are specified power domains to supply the clock
> controller. If there is no power domain, then it's a noop to add
> the driver into the runtime PM framework, and if there is a power domain,
> the dependency can be considered using this fact rather than relying on
> a probably stale data from a particular clock controller device driver.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

My opinion is to keep the handling from the drivers of clock controller
and do not make it a default configuration.

>  drivers/clk/qcom/common.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index eec369d2173b..bf21a314e6cc 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -332,6 +332,7 @@ int qcom_cc_really_probe(struct device *dev,
>  	struct clk_regmap **rclks = desc->clks;
>  	size_t num_clk_hws = desc->num_clk_hws;
>  	struct clk_hw **clk_hws = desc->clk_hws;
> +	bool use_rpm = false;
>  
>  	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
>  	if (!cc)
> @@ -341,7 +342,9 @@ int qcom_cc_really_probe(struct device *dev,
>  	if (ret < 0 && ret != -EEXIST)
>  		return ret;
>  
> -	if (desc->use_rpm) {
> +	if (ret > 0) {
> +		use_rpm = true;
> +
>  		ret = devm_pm_runtime_enable(dev);
>  		if (ret)
>  			return ret;
> @@ -427,7 +430,7 @@ int qcom_cc_really_probe(struct device *dev,
>  	ret = qcom_cc_icc_register(dev, desc);
>  
>  put_rpm:
> -	if (desc->use_rpm)
> +	if (use_rpm)
>  		pm_runtime_put(dev);
>  
>  	return ret;

-- 
Thanks,
Taniya Das


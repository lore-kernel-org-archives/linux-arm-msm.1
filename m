Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4FD3D9DB0
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230887; cv=none; b=Dmnqx8C9yuvBD8nKabvOCZMAsmCKKUtb4xcEuwEkve3J++itGxktR0clCgcJurKnKrrJKiGROad4ff/PHyYp6m8WnFx2BofECHR56/kfT72d1iOv42Fqz3e1uDrEPvadmxW0bBLxjiJ/tRZUMWzFqPijGc68WlLirNgHjE1PriQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230887; c=relaxed/simple;
	bh=Ufayah+839xePQQim+11KdQ1lWiecRJCBG/yuLA6++4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ztd/6biKR/YAIa3osi/8YSVSZkpPtvsHETSkxHvnEgmy51ACdNrDfqq427zGbjx5bRn9iX7DZtHb+k7TWuX+gv8bSZSFTbj/QBg+mArNGzufvRs4uoPjiuhZyqSNbfhIQU/nKDlvSaIMp+9RZlm91ycOJi2/9U8g2O9HGrch3bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WjJMVWsv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OSswfsMj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WjJMVWsv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OSswfsMj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82THw2027078
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RaYf7JYvoS4vTD7+DFFqd3kQ
	/GbKhD/AOOr96EqZe58=; b=WjJMVWsvqaCr1q/LLn69b3czf4PQEfoc9DEcNLnq
	tHWkEZe5Gh8Hfa0QM2kxwImRUrohrAypIOua9zkHdNyXf+07ELb8SKVZwTiuOLHu
	Wu2kXOdes8nzhv6WfFfPBPCPfAdNSNfEUlENZiwbPVlq9QYuKtizI1lcA/GY9Bne
	1IgR98SLuJVtL6Szwi+lkHIsSfIkbhF0QafYPXDjWGtVQiBak899ZddhTfAyKm1h
	8tcthuwqqYMlgpu334jskN+61UYpez+EsUzFA+e8fh7IgyDIP6DSi546kog4Rh2W
	CrJ2v2dcq7wLa5VQ6K5WMV55dS3DOG7KHw7p4g9Im6Rn4w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpq9hgpew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:27:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a3514f912so6472956b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785230877; x=1785835677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RaYf7JYvoS4vTD7+DFFqd3kQ/GbKhD/AOOr96EqZe58=;
        b=OSswfsMj+eEA5Jop+0C9ntEDJUoXV0VE/aWwVYR6x9Z2INGGPhDQJbvST5TclEHdZq
         NPRLwdTZusdXjvYPokUSy7W/3KqQqZkopVxIA1Ev92WzNfb15T1dkMK30mMaWOWMf9aj
         AC7fnQDbjZCtQhgPdDj+78lGQfV4Ub6m7hcKiUSKk1bwWRtefNfXnDVsdB7bN3Kw7EHb
         jrs/d3SeniVrfMO/4rqt67I2O9uGFdn+3CjxPLCBmkAY4WHtFlsSHHtPYIIrmlBzsFYK
         Uwic17agkaj9VWBMxxOEsTAfs8fAB5u05OgGuXXdZifA0FZm0I/M5TQgXTSK6J6ZPg8Q
         cFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230877; x=1785835677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RaYf7JYvoS4vTD7+DFFqd3kQ/GbKhD/AOOr96EqZe58=;
        b=Y0wn0wCfxuP7yN9WmgZtxjgkIHWx0F/b4PSt37FqEH1IIgBikZjPl6tIMkvFlAFjcK
         CudIM0L+dKD38X4MQtaiW8Ad785gKE7pDYlAjPpeR5FKZnwNGw9k4M7U+q3whjYXRebC
         K34jSkoklKlwtWIKydz3ri/Wk3Xd+b13IquKkgIwMi/MsFCxdNzWAH8ls14M4iL2hC4I
         7L6+UGczPBl6VGCn84TsHuzRlYh4cwrjCGS0b2MvjqvJFVAHMq4LO4L+yu4PW9Nkgv9a
         UYzgiGWqHF8X3twDr6Gl7x1Z2myXIPzyGX/cp7RKUQwh1QYaCEyKqGpotr1rscoetw+8
         9J1g==
X-Forwarded-Encrypted: i=1; AHgh+Rp3CrbSsKR1llaM7xv1YoZLZP8yiE3r9kZUrhHbvK1yoTM9L8iYoQ+4+n38oZgwMRoZ1eJtlDU2q1ZfMB/u@vger.kernel.org
X-Gm-Message-State: AOJu0YwRh7LI59QWpVd58BS8PaY2Ip9RcpwnQyX8V8+BJRUN/en7oFa+
	34qO5qIDLMjEiOLJOsLrxp1nEZSOWm+Doov9U9uRUAwj9B94ZQL8zNGtEghmn6UqpjMNoW8pGTR
	xP98BxlEvMEBf70jtu7Q1Ef36U88TTeAEcJRCkQdFrYVnauSSd/J0+4j3T4AmPgTGerjd
X-Gm-Gg: AR+sD115wc5BcDwOp/kdIWCIFrrKTIkwZEXtfGnXcj/PpVimJxPpH+mWX4f+6kPICy/
	Sws7E3f8rmvt87XymlLEBKY1jpUnDriFfrkQ2tDwYsQGvNN6bQM7jol557IH70bhP+hIoKIHweK
	WSlb2lzoG8/G6UOpM29lmqE1eQWXFnkNSgL7U5yZZE+KcfV0bqKVYaekyXqXhe/YsefIcLaCFzN
	i4qqnHMcw2TP1U7uZ0ipICN/4XQqtGhSRnqUUCvNnpFNqJiTPVas7lA/Itf34NvWP+zb1d917TX
	bl5vjHdRQlBO2Ps6Y5bD+/xUJt83RNBaQJifku6bU0VAwl7g838EQ4xIi3cpw5CcjHdwwUvyhuH
	lXEcjUAU73PSKH1ukiABumOBOaX4=
X-Received: by 2002:a05:6a21:6d9d:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3c8aaf7b161mr2417047637.13.1785230877171;
        Tue, 28 Jul 2026 02:27:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d9d:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3c8aaf7b161mr2417004637.13.1785230876690;
        Tue, 28 Jul 2026 02:27:56 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc4164ddsm41032511eec.9.2026.07.28.02.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:27:56 -0700 (PDT)
Date: Tue, 28 Jul 2026 14:57:49 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP
 support
Message-ID: <20260728092749.bb32hwpaokxxw32s@hu-mojha-hyd.qualcomm.com>
References: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
 <20260728084012.685036-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728084012.685036-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX9Q541BcmgaEv
 H/7nrzQKIqLlnMb6Wve85pfswUk1BBPGeRtfodB2BXgc+AWYTCr1OeAaLM/pugzPlCW7C/izY0x
 e9VWsNyfi6ijp6K7OcYNF+XYJ/GdFSw=
X-Proofpoint-GUID: QikhQjpzlSQAbQlxWk1BtrStGTaLkWS3
X-Proofpoint-ORIG-GUID: QikhQjpzlSQAbQlxWk1BtrStGTaLkWS3
X-Authority-Analysis: v=2.4 cv=Aa6B2XXG c=1 sm=1 tr=0 ts=6a68761e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FualEsMv_dKSpJs2lg8A:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfXy+OWUmAUsPdY
 cJV3YDd/cj0xgm2e9o2xVblVCZDaVtmOfD4lpi79sMusgPtA+P691mmFHKvLcZfx0klymLfCiF2
 M5sVjfBsin57fsRmjvTjm6aywTolVJFD1AkVQ+PYAREHsjCVOy0EfRMO3t6Nowm60ydsmywSTUd
 2r0qLPLziq0AxSLTpy7ZN3V54MSuS+l+t6icL7CoHqkepJqNNHYXPvnHXkppYaJZWfeXvqrWxZJ
 pBard2IiAIFyomcSgdPPyeu9n7t1TDE9vp8Bbc1yth0KycHGK2wqRdjCvvnW4UJJ0mQQsKVvvQl
 VuZkjv9x427qHcmOmq+OvxkC9mZFzBBE+U9xItjyPapdnjWxGAwsXrxYMYh4zpz7ZPOjEIOlE90
 9GwQLCObDYmqDhfqqt4oFxeM8A4kKVz+NgTEnnEpF6LekRskL8UeupqhHuMn7gaYaCtoO9J76X8
 sI0Vo3ZBJf5bP5cWmcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280082

On Tue, Jul 28, 2026 at 04:40:12PM +0800, Shawn Guo wrote:
> Add support for ADSP (HPASS DSP) and 4 CDSPs found on Nord SoC. The ADSP
> is pre-booted by XBL before Linux starts, so set early_boot flag for
> attach path rather than a cold boot sequence.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 110 +++++++++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 25599d728208..63a26c6ced8c 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1434,6 +1434,111 @@ static const struct qcom_pas_data milos_cdsp_resource = {
>  	.smem_host_id = 5,
>  };
>  
> +static const struct qcom_pas_data nord_adsp_resource = {
> +	.crash_reason_smem = 423,
> +	.firmware_name = "adsp.mdt",
> +	.dtb_firmware_name = "adsp_dtb.mbn",
> +	.pas_id = 1,
> +	.dtb_pas_id = 36,
> +	.minidump_id = 5,
> +	.auto_boot = true,
> +	.early_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.load_state = "adsp",
> +	.ssr_name = "lpass",
> +	.sysmon_name = "adsp",
> +	.ssctl_id = 0x14,
> +	.smem_host_id = 2,
> +};
> +
> +static const struct qcom_pas_data nord_cdsp0_resource = {
> +	.crash_reason_smem = 601,
> +	.firmware_name = "cdsp.mdt",
> +	.dtb_firmware_name = "cdsp_dtb.mbn",
> +	.pas_id = 18,
> +	.dtb_pas_id = 37,
> +	.minidump_id = 7,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		"nsp",
> +		NULL
> +	},
> +	.load_state = "cdsp",

is this a miss or a known thing to not use cdsp0 here but use X it at other
cdspX instances ?

> +	.ssr_name = "cdsp0",
> +	.sysmon_name = "cdsp0",
> +	.ssctl_id = 0x17,
> +	.smem_host_id = 5,
> +};
> +
> +static const struct qcom_pas_data nord_cdsp1_resource = {
> +	.crash_reason_smem = 633,
> +	.firmware_name = "cdsp1.mdt",
> +	.dtb_firmware_name = "cdsp1_dtb.mbn",
> +	.pas_id = 30,
> +	.dtb_pas_id = 59,
> +	.minidump_id = 20,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		"nsp",
> +		NULL
> +	},
> +	.load_state = "cdsp1",
> +	.ssr_name = "cdsp1",
> +	.sysmon_name = "cdsp1",
> +	.ssctl_id = 0x20,
> +	.smem_host_id = 69,
> +};
> +
> +static const struct qcom_pas_data nord_cdsp2_resource = {
> +	.crash_reason_smem = 665,
> +	.firmware_name = "cdsp2.mdt",
> +	.dtb_firmware_name = "cdsp2_dtb.mbn",
> +	.pas_id = 57,
> +	.dtb_pas_id = 60,
> +	.minidump_id = 29,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		"nsp",
> +		NULL
> +	},
> +	.load_state = "cdsp2",
> +	.ssr_name = "cdsp2",
> +	.sysmon_name = "cdsp2",
> +	.ssctl_id = 0x1f,
> +	.smem_host_id = 133,
> +};
> +
> +static const struct qcom_pas_data nord_cdsp3_resource = {
> +	.crash_reason_smem = 666,
> +	.firmware_name = "cdsp3.mdt",
> +	.dtb_firmware_name = "cdsp3_dtb.mbn",
> +	.pas_id = 58,
> +	.dtb_pas_id = 61,
> +	.minidump_id = 30,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		"nsp",
> +		NULL
> +	},
> +	.load_state = "cdsp3",
> +	.ssr_name = "cdsp3",
> +	.sysmon_name = "cdsp3",
> +	.ssctl_id = 0x1a,
> +	.smem_host_id = 197,
> +};
> +
>  static const struct qcom_pas_data sm8450_mpss_resource = {
>  	.crash_reason_smem = 421,
>  	.firmware_name = "modem.mdt",
> @@ -1702,6 +1807,11 @@ static const struct of_device_id qcom_pas_of_match[] = {
>  	{ .compatible = "qcom,msm8996-slpi-pil", .data = &msm8996_slpi_resource_init },
>  	{ .compatible = "qcom,msm8998-adsp-pas", .data = &msm8996_adsp_resource },
>  	{ .compatible = "qcom,msm8998-slpi-pas", .data = &msm8996_slpi_resource_init },
> +	{ .compatible = "qcom,nord-adsp-pas", .data = &nord_adsp_resource },
> +	{ .compatible = "qcom,nord-cdsp0-pas", .data = &nord_cdsp0_resource },
> +	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
> +	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
> +	{ .compatible = "qcom,nord-cdsp3-pas", .data = &nord_cdsp3_resource },
>  	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
>  	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
>  	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
> -- 
> 2.43.0
> 

-- 
-Mukesh Ojha

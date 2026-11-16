Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854681;
	b=HIe/RDgsqVDftrg/jqQSgm4f+2ileswyhpNv/yb2UWN2QwCF8dJpl6pjddg8Js/j0Saq
	 JTqEkOEI5abDIbJi2gsdQPovXKOVt+mWdsV5+LBFyBWSbax9XqlLx9nepi4XFgGMF7T7E
	 QbGq50Vo7RZPjDn5jqPitXivTp5evDhqja0OMyXqSOOfXo6BUxnDjypUgs45BYjJwp7E0
	 kkWTPpQdIs2hYhIiEY/i6KS/dBklPfmWiYH+IcjG8XcCRrt4TpGyciIPzKxGWxqI4RrL2
	 8H0RIQiefFogKTF0GolSTQkDAwFkV4FESOpOVYSkLCoLb6eLxCNt9DHCEsfdal4pBCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yrfB8pacE0WMmdyFELCVXCHBqrLMACzxqc0EkB836sk=;
	b=3B2uwuJ7gN77sdfKmygP4sn703uh9+ll5L42m5hcvwOWiV+yOqiabLSPGYtILY1efUmR
	 Frpe1dfHcbZX9lgM9tcm5qHWSkmSXTN6XgDSYeB6SAluKGLSETrOkf+D4YaPwHvB2ZxtH
	 kdD/UNuVJ88F8+FFeCkgqW/YUAKNR4Y8jCLGcdaHnS0fYiDC7n198VOYfFuSPSI4n8VJq
	 vKwCE8HyMuISCuV6ApH1QrVVc92uNwvRxTxu6ly6tnb/6htVTPN0YjXyJeyzUxey923vg
	 zLYw8csqr3eOGrVODb6pIB7EPUOaLCLVqOvlD/BUIb5I5+XF4wF8uZbWTh0FTEsXd6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JxHhfxUy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ifkh2lcV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50022606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 18:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50022606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JxHhfxUy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ifkh2lcV
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGICAJ1110310
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 18:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yrfB8pacE0WMmdyFELCVXCHB
	qrLMACzxqc0EkB836sk=; b=JxHhfxUyOZksAjrDUWu2Re9NCOeurJKbzaIVXkF9
	pTH2HbXgXHgCmkHwLNQmY1Webn/F4g8kRY4Zqti4eSHBnO5TuXQXdeTyccwj7cME
	pZTTQO4C0ntnUn9ROEgcHRhxBQ4xdOfo/tuSu+EEKbHSH2MchLUL0QAvpkfoDJIF
	6PogqhVJuhgy2qS5XYjycQlcUWDmnC7pZBz+01b8aqlHhswCRTT4LWyaGm2afm31
	8CEi/5rvXEImPFwKkV5j38VnvI64DOFUvWDjf/bIuCe8KZpYLuGJOH1etjwywc/E
	CE93DLwc2gBrEN4PeUBO8EV+5H5bEt/kbAYm1W9S7MeVvQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqgj1un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 18:44:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37549877380so5103340eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 10:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794854679; x=1795459479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yrfB8pacE0WMmdyFELCVXCHBqrLMACzxqc0EkB836sk=;
        b=Ifkh2lcVW6nSQxNS3XrLvkAfXBVaQs+uWiHMjSN9q+0YBSIGGrQEmu4Wx/SX85/3kG
         0GTyH4y55ACfgv6PFbQQIscwN4EG0r6Zxky7aRlWtAbQoTC4De4yoDuZvIcRev2g7bl3
         Rn4sEAPo+eQJwWsA2yfsMPBJkruQjHRw7ETqlMGzxmWKrIP5xcvtHQuMPvGM/fiofuTi
         Ufg5dq6kLZTZJfFd9D9Sqa4ZIDrKcg0ro7dr2RRbd3uZwtW/Khx6kcGQHXL/5AbZIoeO
         GrMGdW21N8PdBnyJL3XSAh5L4z/m0z2hFb8KyRKJjSkKfHCsQ/oQpKYTm6iiQVYbbjuh
         ocYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854679; x=1795459479;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yrfB8pacE0WMmdyFELCVXCHBqrLMACzxqc0EkB836sk=;
        b=EfYBEl2E+0Qdy0VaFKD6BPRaEt1paDGJg0gbkq0+7SjZ63q49q/W/2KGQaZ+b2Ddk0
         PnMbJNEMjKlndJljnbs88dQ+r9+3ovFX+LqbytcCfP2A5hhMzmK+j+aNgyNZqVm5v/pH
         cvUgLMhJrvJFVUeZ6lmHz7pzGCmM0E74Ge0yk9DR3VJO0eYKBVyxm5MgvfMKXTg+ytbk
         yR+1jBl3PRX3BhDc4hJG61ZZ4iSoUIkvtHZ8FTKJMC4bQvoPNWbBMtufkhTISjS7mCFQ
         CLHuIJfKsOsWdo9DG5QAJt+nRNNNo1yt0ucLtNMsF2m9xz9KJi2mrXJk1r26WVsKKK2k
         7MnQ==
X-Forwarded-Encrypted: i=1; AL+hErHkVlC8VwK+aSp8SvhCYwz5wYRpPCU7DTJfHgEuuIAyI4718nZPe54PO1Fd8v8fknvZ4KBEe/+y3/IBkqcv@vger.kernel.org
X-Gm-Message-State: APuU4Z9RTBQAYgmDuxj1OACwqBZgd7BhPNR1mwyfuRGbBNPjp1j3+/b9
	+PQq+OhYCtgmQRBcWDzi87dzL6wW8jd55bzqGVRl2w6Nk3ETGrTloIBnTc+C5FH/+1O9wvYlN5L
	j/svKtCyE80KueowsNcd1BN0LGYNwiNTNN0ukHKFTsh/D/0PbdGmLz5zIYi1LCWubkf/L
X-Gm-Gg: AZFdTZebSVHJPMb+o1DyNdZzNQQLWis3iDyfNqOMOy0qp1HtCKY1SjcGhHew1TO/2ra
	vlI+Ku//XLw5pRTmC0E3oN8byQgW32Z5B4SUcZEUxOfAv2G5ZHYZ64cBVpOa73g8wxrUQv7SxFW
	JSuq3SKJVo1hbi3qSOdu6z7XbdaOt5Ro71HrFJe/qPj1cBoiSZPN9Lu950hSubdK90dvhCi8Nxf
	qYoQzH2jUjKGk11tVxDEhO7PqoPdu8P0oXBIAU5oeRHqXdZrefrFT7qwg+r3DKZSnfrU1u9hXk9
	hUEggg+hgXYWIPWjeudQ+hegqLpYo/goF46aqTj6T4lDhFWL3oDjJJW7YZKS0c1/z9K+w8OZpxJ
	JJqH69PdmfJdT/W698tWPh1ONp8OxxS0DU7atGOq+BivUdvhZHhuYUuzrHe6MU4dvUWq+FZTATm
	+X
X-Received: by 2002:a05:693c:8206:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-37966e3ab88mr12566514eec.7.1794854678690;
        Mon, 16 Nov 2026 10:44:38 -0800 (PST)
X-Received: by 2002:a05:693c:8206:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-37966e3ab88mr12566450eec.7.1794854677637;
        Mon, 16 Nov 2026 10:44:37 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm35527717eec.26.2026.11.16.10.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:44:37 -0800 (PST)
Date: Tue, 17 Nov 2026 00:14:30 +0530
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
Subject: Re: [PATCH v2 2/4] remoteproc: qcom: pas: Support secondary images
Message-ID: <20261116184430.iw5or2qzet2s2s42@hu-mojha-hyd.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-2-715435f52dd7@oss.qualcomm.com>
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
In-Reply-To: <20261015-oob-support-glymur-v2-2-715435f52dd7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA3NCBTYWx0ZWRfX7/AsTb7Hfkj4
 CmrVAzu3Yxk16Ohfkwok50+UDKeJgfKykp/clrHG7Wqq/KvUGHe6/417Ylu5zcbB4ivs86u7nYN
 /6aByIFYCQu5Bl+xYpfrCgNy1ZGGFSg=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afb4f17 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-HrzXbHVmEB48Nm53wIA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: UfwAobt3VdQ4PEONQqw2W8Wytiv__F9t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA3NCBTYWx0ZWRfX+UtjvIHSrvl/
 a13OCOYnVg4sz9jMcsT8/Bp7+nsdTQcCLgU39WGSFF3HcpM5620/Jbdv/rVqHDFp8Hwp7EpDkNq
 ztHMsLCUqKExSdVlUjZusdTGKAGqgiugloyd+R/e2mwjofP5UNwfN6xCiwxESNcoLOSNaygq81Y
 LWJUqmx7fQh37XGrf2Sb/Jv4VXlLiZfAq5BQ1cDKrDGPJ5mV/THnWI6xvqA1plQ5n2/MOgrF04Z
 FCnZYsUL8Z+3RRqjt2sHkSwUyLn4ynV/oFxQQergb/zEUKU66W+gMoCPlyMKlw35toc3Q5zATNK
 ljcVd5X/uMYhkQuZwfUCH6G8cQZaslQHs1yyUDMYBNlEI8MOyW0aBalFEjYyHjEhVznzIzOAR5X
 QeCNhfMZyH2gJWOw2Nr3LdYK2AIBBfJTkDAP5VnP2In4FS6J8lNgX8jeDUM2GMniOeHnfMU/9pL
 kJTebb0TnK0hG2VzcKQ==
X-Proofpoint-GUID: UfwAobt3VdQ4PEONQqw2W8Wytiv__F9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160074

On Thu, Oct 15, 2026 at 11:25:50AM +0530, Anvesh Jain P wrote:
> The Out-of-Band Management Subsystem (OOBMSS) is managed by a common
> remote processor and consists of two Zephyr subsystems:
> 
> +----------------------------------------------------------+
> |                         OOBMSS                           |
> |                                                          |
> |  +------------------------+  +------------------------+  |
> |  | OOB-TEE                |  | OOB-Non-Secure         |  |
> |  | Primary processor      |  | Auxiliary processor    |  |
> |  | Primary image and DTB  |  | Secondary image and DTB|  |
> |  +------------------------+  +------------------------+  |
> +----------------------------------------------------------+
> 
> The primary processor is the Out-of-Band Trusted Execution Environment
> (OOB-TEE) processor. The OOB-Non-Secure processor is an auxiliary processor
> that depends on the primary processor and cannot function independently.
> 
> The PAS remoteproc driver currently supports one primary image and its
> optional DTB. OOBMSS additionally requires the secondary image and DTB
> to be loaded, authenticated, mapped, shut down, and released through
> their own PAS identifiers and carveouts.
> 
> Add generic PAS support for loading, authenticating, and mapping a
> secondary image and its DTB, then shutting down and releasing both while
> keeping the existing primary-image lifecycle unchanged.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 240 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 222 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index ca8e61254c44..0bce2f0d5b4a 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -42,8 +42,12 @@ struct qcom_pas_data {
>  	int crash_reason_smem;
>  	const char *firmware_name;
>  	const char *dtb_firmware_name;
> +	const char *secondary_firmware_name;
> +	const char *secondary_dtb_firmware_name;
>  	int pas_id;
>  	int dtb_pas_id;
> +	int secondary_pas_id;
> +	int secondary_dtb_pas_id;
>  	int lite_pas_id;
>  	int lite_dtb_pas_id;
>  	unsigned int minidump_id;
> @@ -83,8 +87,12 @@ struct qcom_pas {
>  	int proxy_pd_count;
>  
>  	const char *dtb_firmware_name;
> +	const char *secondary_firmware_name;
> +	const char *secondary_dtb_firmware_name;
>  	int pas_id;
>  	int dtb_pas_id;
> +	int secondary_pas_id;
> +	int secondary_dtb_pas_id;
>  	int lite_pas_id;
>  	int lite_dtb_pas_id;
>  	unsigned int minidump_id;
> @@ -95,17 +103,25 @@ struct qcom_pas {
>  
>  	const struct firmware *firmware;
>  	const struct firmware *dtb_firmware;
> +	const struct firmware *secondary_firmware;
> +	const struct firmware *secondary_dtb_firmware;
>  
>  	phys_addr_t mem_phys;
>  	phys_addr_t dtb_mem_phys;
> +	phys_addr_t secondary_mem_phys;
> +	phys_addr_t secondary_dtb_mem_phys;
>  	phys_addr_t mem_reloc;
>  	phys_addr_t dtb_mem_reloc;
> +	phys_addr_t secondary_mem_reloc;
> +	phys_addr_t secondary_dtb_mem_reloc;
>  	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
>  
>  	void __iomem *mem_region;
>  
>  	size_t mem_size;
>  	size_t dtb_mem_size;
> +	size_t secondary_mem_size;
> +	size_t secondary_dtb_mem_size;
>  	size_t region_assign_size[MAX_ASSIGN_COUNT];
>  
>  	int region_assign_idx;
> @@ -123,6 +139,8 @@ struct qcom_pas {
>  
>  	struct qcom_pas_context *pas_ctx;
>  	struct qcom_pas_context *dtb_pas_ctx;
> +	struct qcom_pas_context *secondary_pas_ctx;
> +	struct qcom_pas_context *secondary_dtb_pas_ctx;
>  };
>  
>  static void qcom_pas_segment_dump(struct rproc *rproc,
> @@ -198,19 +216,37 @@ static void qcom_pas_pds_disable(struct qcom_pas *pas, struct device **pds,
>  	}
>  }
>  
> -static int qcom_pas_shutdown_poll_decrypt(struct qcom_pas *pas)
> +static int qcom_pas_shutdown_poll_decrypt(int pas_id)
>  {
>  	unsigned int retry_num = 50;
>  	int ret;
>  
>  	do {
>  		msleep(QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS);
> -		ret = qcom_pas_shutdown(pas->pas_id);
> +		ret = qcom_pas_shutdown(pas_id);
>  	} while (ret == -EINVAL && --retry_num);
>  
>  	return ret;
>  }
>  
> +static void qcom_pas_release_firmware(struct qcom_pas *pas)
> +{
> +	if (pas->dtb_firmware) {
> +		release_firmware(pas->dtb_firmware);
> +		pas->dtb_firmware = NULL;
> +	}
> +
> +	if (pas->secondary_firmware) {
> +		release_firmware(pas->secondary_firmware);
> +		pas->secondary_firmware = NULL;
> +	}
> +
> +	if (pas->secondary_dtb_firmware) {
> +		release_firmware(pas->secondary_dtb_firmware);
> +		pas->secondary_dtb_firmware = NULL;
> +	}
> +}
> +
>  static int qcom_pas_unprepare(struct rproc *rproc)
>  {
>  	struct qcom_pas *pas = rproc->priv;
> @@ -224,6 +260,10 @@ static int qcom_pas_unprepare(struct rproc *rproc)
>  	qcom_pas_metadata_release(pas->pas_ctx);
>  	if (pas->dtb_pas_id)
>  		qcom_pas_metadata_release(pas->dtb_pas_ctx);
> +	if (pas->secondary_pas_id)
> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
> +	if (pas->secondary_dtb_pas_id)
> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
>  
>  	return 0;
>  }
> @@ -241,19 +281,29 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>  	if (pas->lite_dtb_pas_id)
>  		qcom_pas_shutdown(pas->lite_dtb_pas_id);
>  
> -	if (pas->dtb_pas_id) {
> -		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
> +	if (pas->secondary_dtb_pas_id) {
> +		ret = request_firmware(&pas->secondary_dtb_firmware,
> +				       pas->secondary_dtb_firmware_name, pas->dev);
> +		if (ret) {
> +			qcom_pas_release_firmware(pas);
> +			return ret;
> +		}
> +	}
> +
> +	if (pas->secondary_pas_id) {
> +		ret = request_firmware(&pas->secondary_firmware,
> +				       pas->secondary_firmware_name, pas->dev);
>  		if (ret) {
> -			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
> -				pas->dtb_firmware_name, ret);
> +			qcom_pas_release_firmware(pas);
>  			return ret;
>  		}
> +	}
>  
> -		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
> -					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
> +	if (pas->dtb_pas_id) {
> +		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name,
> +				       pas->dev);
>  		if (ret) {
> -			qcom_pas_metadata_release(pas->dtb_pas_ctx);
> -			release_firmware(pas->dtb_firmware);
> +			qcom_pas_release_firmware(pas);
>  			return ret;
>  		}
>  	}
> @@ -310,10 +360,51 @@ static int qcom_pas_start(struct rproc *rproc)
>  			goto disable_cx_supply;
>  	}
>  
> +	if (pas->secondary_dtb_pas_id) {
> +		ret = qcom_mdt_pas_load(pas->secondary_dtb_pas_ctx,
> +					pas->secondary_dtb_firmware,
> +					pas->secondary_dtb_firmware_name,
> +					&pas->secondary_dtb_mem_reloc);
> +		if (ret)
> +			goto release_secondary_dtb_metadata;
> +
> +		ret = qcom_pas_map_carveout(rproc, pas->secondary_dtb_mem_phys,
> +					    pas->secondary_dtb_mem_size);
> +		if (ret)
> +			goto release_secondary_dtb_metadata;
> +
> +		ret = qcom_pas_prepare_and_auth_reset(pas->secondary_dtb_pas_ctx);
> +		if (ret)
> +			goto unmap_secondary_dtb_carveout;
> +	}
> +
> +	if (pas->secondary_pas_id) {
> +		ret = qcom_mdt_pas_load(pas->secondary_pas_ctx,
> +					pas->secondary_firmware,
> +					pas->secondary_firmware_name,
> +					&pas->secondary_mem_reloc);
> +		if (ret)
> +			goto release_secondary_metadata;
> +
> +		ret = qcom_pas_map_carveout(rproc, pas->secondary_mem_phys,
> +					    pas->secondary_mem_size);
> +		if (ret)
> +			goto release_secondary_metadata;
> +
> +		ret = qcom_pas_prepare_and_auth_reset(pas->secondary_pas_ctx);
> +		if (ret)
> +			goto unmap_secondary_carveout;
> +	}
> +
>  	if (pas->dtb_pas_id) {
> +		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
> +					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
> +		if (ret)
> +			goto release_dtb_metadata;
> +
>  		ret = qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
>  		if (ret)
> -			goto disable_px_supply;
> +			goto release_dtb_metadata;
>  
>  		ret = qcom_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
>  		if (ret) {
> @@ -344,13 +435,16 @@ static int qcom_pas_start(struct rproc *rproc)
>  	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
>  	if (ret == -ETIMEDOUT) {
>  		dev_err(pas->dev, "start timed out\n");
> -		qcom_pas_shutdown(pas->pas_id);
>  		goto unmap_carveout;
>  	}
>  
>  	qcom_pas_metadata_release(pas->pas_ctx);
>  	if (pas->dtb_pas_id)
>  		qcom_pas_metadata_release(pas->dtb_pas_ctx);
> +	if (pas->secondary_pas_id)
> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
> +	if (pas->secondary_dtb_pas_id)
> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
>  
>  	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>  	pas->firmware = NULL;
> @@ -358,16 +452,37 @@ static int qcom_pas_start(struct rproc *rproc)
>  	return 0;
>  
>  unmap_carveout:
> +	qcom_pas_shutdown(pas->pas_id);
>  	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>  release_pas_metadata:
>  	qcom_pas_metadata_release(pas->pas_ctx);
> -	if (pas->dtb_pas_id)
> -		qcom_pas_metadata_release(pas->dtb_pas_ctx);
> -
>  unmap_dtb_carveout:
> +	if (pas->dtb_pas_id) {
> +		qcom_pas_shutdown(pas->dtb_pas_id);
> +		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys,
> +					pas->dtb_mem_size);
> +	}
> +release_dtb_metadata:
>  	if (pas->dtb_pas_id)
> -		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
> -disable_px_supply:
> +		qcom_pas_metadata_release(pas->dtb_pas_ctx);
> +unmap_secondary_carveout:
> +	if (pas->secondary_pas_id) {
> +		qcom_pas_shutdown(pas->secondary_pas_id);
> +		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
> +					pas->secondary_mem_size);
> +	}
> +release_secondary_metadata:
> +	if (pas->secondary_pas_id)
> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
> +unmap_secondary_dtb_carveout:
> +	if (pas->secondary_dtb_pas_id) {
> +		qcom_pas_shutdown(pas->secondary_dtb_pas_id);
> +		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
> +					pas->secondary_dtb_mem_size);
> +	}
> +release_secondary_dtb_metadata:
> +	if (pas->secondary_dtb_pas_id)
> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
>  	if (pas->px_supply)
>  		regulator_disable(pas->px_supply);
>  disable_cx_supply:
> @@ -413,7 +528,7 @@ static int qcom_pas_stop(struct rproc *rproc)
>  
>  	ret = qcom_pas_shutdown(pas->pas_id);
>  	if (ret && pas->decrypt_shutdown)
> -		ret = qcom_pas_shutdown_poll_decrypt(pas);
> +		ret = qcom_pas_shutdown_poll_decrypt(pas->pas_id);
>  
>  	if (ret)
>  		dev_err(pas->dev, "failed to shutdown: %d\n", ret);
> @@ -426,6 +541,27 @@ static int qcom_pas_stop(struct rproc *rproc)
>  		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
>  	}
>  
> +	if (pas->secondary_pas_id) {
> +		ret = qcom_pas_shutdown(pas->secondary_pas_id);
> +		if (ret && pas->decrypt_shutdown)
> +			ret = qcom_pas_shutdown_poll_decrypt(pas->secondary_pas_id);
> +		if (ret)
> +			dev_err(pas->dev, "failed to shutdown secondary: %d\n", ret);
> +
> +		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
> +					pas->secondary_mem_size);
> +	}
> +
> +	if (pas->secondary_dtb_pas_id) {
> +		ret = qcom_pas_shutdown(pas->secondary_dtb_pas_id);
> +		if (ret)
> +			dev_err(pas->dev,
> +				"failed to shutdown secondary dtb: %d\n", ret);
> +
> +		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
> +					pas->secondary_dtb_mem_size);
> +	}

Nit: It does not matter, but moving this before the primary one would be
ideal. You can do it if you send a revision to the series.

> +
>  	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>  
>  	handover = qcom_q6v5_unprepare(&pas->q6v5);
> @@ -740,6 +876,42 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>  	if (IS_ERR(pas->dtb_pas_ctx))
>  		return PTR_ERR(pas->dtb_pas_ctx);
>  
> +	if (!pas->secondary_pas_id)
> +		return 0;
> +
> +	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 2, &res);
> +	if (ret)
> +		return ret;
> +
> +	pas->secondary_mem_phys = res.start;
> +	pas->secondary_mem_reloc = res.start;
> +	pas->secondary_mem_size = resource_size(&res);
> +
> +	pas->secondary_pas_ctx =
> +		devm_qcom_pas_context_alloc(pas->dev, pas->secondary_pas_id,
> +					    pas->secondary_mem_phys,
> +					    pas->secondary_mem_size);
> +	if (IS_ERR(pas->secondary_pas_ctx))
> +		return PTR_ERR(pas->secondary_pas_ctx);
> +
> +	if (!pas->secondary_dtb_pas_id)
> +		return 0;
> +
> +	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 3, &res);
> +	if (ret)
> +		return ret;
> +
> +	pas->secondary_dtb_mem_phys = res.start;
> +	pas->secondary_dtb_mem_reloc = res.start;
> +	pas->secondary_dtb_mem_size = resource_size(&res);
> +
> +	pas->secondary_dtb_pas_ctx =
> +		devm_qcom_pas_context_alloc(pas->dev, pas->secondary_dtb_pas_id,
> +					    pas->secondary_dtb_mem_phys,
> +					    pas->secondary_dtb_mem_size);
> +	if (IS_ERR(pas->secondary_dtb_pas_ctx))
> +		return PTR_ERR(pas->secondary_dtb_pas_ctx);
> +
>  	return 0;
>  }
>  
> @@ -823,6 +995,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	struct rproc *rproc;
>  	struct device_node *node;
>  	const char *fw_name, *dtb_fw_name = NULL;
> +	const char *secondary_fw_name = NULL;
> +	const char *secondary_dtb_fw_name = NULL;
>  	const struct rproc_ops *ops = &qcom_pas_ops;
>  	int ret;
>  
> @@ -847,6 +1021,24 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  			return ret;
>  	}
>  
> +	if (desc->secondary_firmware_name) {
> +		secondary_fw_name = desc->secondary_firmware_name;
> +		ret = of_property_read_string_index(pdev->dev.of_node,
> +						    "firmware-name", 2,
> +						    &secondary_fw_name);
> +		if (ret < 0 && ret != -EINVAL)
> +			return ret;
> +	}
> +
> +	if (desc->secondary_dtb_firmware_name) {
> +		secondary_dtb_fw_name = desc->secondary_dtb_firmware_name;
> +		ret = of_property_read_string_index(pdev->dev.of_node,
> +						    "firmware-name", 3,
> +						    &secondary_dtb_fw_name);
> +		if (ret < 0 && ret != -EINVAL)
> +			return ret;
> +	}
> +
>  	if (desc->minidump_id)
>  		ops = &qcom_pas_minidump_ops;
>  
> @@ -879,6 +1071,14 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  		pas->dtb_firmware_name = dtb_fw_name;
>  		pas->dtb_pas_id = desc->dtb_pas_id;
>  	}
> +	if (secondary_fw_name) {
> +		pas->secondary_firmware_name = secondary_fw_name;
> +		pas->secondary_pas_id = desc->secondary_pas_id;
> +	}
> +	if (secondary_dtb_fw_name) {
> +		pas->secondary_dtb_firmware_name = secondary_dtb_fw_name;
> +		pas->secondary_dtb_pas_id = desc->secondary_dtb_pas_id;
> +	}
>  	platform_set_drvdata(pdev, pas);
>  
>  	ret = device_init_wakeup(pas->dev, true);
> @@ -925,6 +1125,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	pas->pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>  	if (pas->dtb_pas_id)
>  		pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
> +	if (pas->secondary_pas_id)
> +		pas->secondary_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
> +	if (pas->secondary_dtb_pas_id)
> +		pas->secondary_dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>  
>  	if (desc->early_boot)
>  		pas->rproc->state = RPROC_DETACHED;
> 
> -- 
> 2.34.1
> 

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

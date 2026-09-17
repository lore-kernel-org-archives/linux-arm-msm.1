Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4473B43E4BE
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 19:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672872; cv=none; b=bjrZwDFCC2iDpDAesLf3Dv1FFE2kraFCddFuqMA/UBr6bB178FIvB8DUIHA5sVk208fpVAyf6MAxKaVb8gzwUlT/tJn258cvmujMjVt6v6QPoQvj2gW2Ge/8yGtPMZs9gygYX2tVQrKV9Pq5XRQTg0RuqZbHLciIc3T+ASOy6mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672872; c=relaxed/simple;
	bh=9/PLeGutW/K6U+nlg7g/u26bEQRwEQjLvyZeFh0yc2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eoVmy/MOxM6yz7ji77766S7QfnK/+YZ8Pf2xzF5R9Yz2IFA1LoXavd098km0lve7qQOI2xQFJkt+2+5iuFO+ZKogRmINYBTsSFZWGAKNYA/w6VIUT3AzoNcgv9N/Ypi7+9v6KqlZy4t7Akpu6XgZbycMmuhxcW5p3OpI6jNWP5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c1TpSbMN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TE83NdIL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c1TpSbMN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TE83NdIL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5tRV1639710
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 19:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IPnDJDcRj/tiJwf3z35D8zbS6cr4m6dIivt4rL4VpY0=; b=c1TpSbMNfYLoL91R
	rkplFg7+k/kqsFY1R8EsaEG27EjLIfi+UySfoIBfc592AAxIr40cyxd0WhtEH9Oc
	ES7pBZ94/eKOHA5nkKd/4ve8hvFN/Hg+fZm0RwzKToEkfAnyjamRj8meaRkTT+JA
	Y9cpCoEbRqYSKUol7wzryh33QOFEfzAn8Lxa2j+5GUPjw9vWgGwMKWSjjcdCD3ZL
	B3jBsZvR9+ACHQEFI8wE3eTNYZ+pl81FULg3W1g1sKI+q1nCDymogKKvHpLeSFW7
	2LoWW/y3My0hGalw71a8wWi97NsmqKE9+HwZhp61fTVYgHj9wP5qXFmEfhOjnqL9
	AnnYbQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0u3my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 19:21:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86a7bb1dd95so1509747b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789672867; x=1790277667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPnDJDcRj/tiJwf3z35D8zbS6cr4m6dIivt4rL4VpY0=;
        b=TE83NdILO1B8jw1MM9eEJiDMQoIUoCljQqyV4IVvODviA4NlA3ZSE8/e+8j6untKRJ
         6SjoiLUIiNbeZIYcFmARPIwmpRPYC4/bxBT0vBA4GgKc/4hs9WDJuIkFT3ZtNppeBJXV
         oWrRlPe8lQQzRZW51hoIPRaPRfTCgNJCN/1wxUBjRdr0OAjYuKKTjmIH6LpcCSFWw0ws
         Sq4P6jsdSY8utKuwXZvRaEl4qn+Q6J6601ooMbHI/6Vqe8Abg1F1ybdDMxzQ5wINd/Me
         duD05hqGcr46z9zf6p/jBRbpatKXZut37qKFSO9j5SYRtGJXKlKxxrsmt3FqkvqPYB06
         GDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672867; x=1790277667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IPnDJDcRj/tiJwf3z35D8zbS6cr4m6dIivt4rL4VpY0=;
        b=orCEaHjratykYSpTIOFzK/B7U85TRtqi7jjOxJTA9CMQ++j7vJC56WwYwZEIDMojoK
         zNMvJj3Wvnwd7P7HCQe4nQFBa1CjmEU555a7uXzGOHU6sDY1JIdb9q2n2QVsPToDq90x
         60ESKo9bTC7uwKVrz4WuyvG9tYVNFwsEmVf/Z9DvBf4VNvpuDxsgWKRYzfOTo+bBCylr
         u0AzHuZh72GQSXVumdh5JP20NtCunzrfAK2bq2+h6gwf9P8PD4Ht0b6D5cnHIaScwQE6
         GQgdvVm80tSGA9VXH75XC/GATq7mC/GB76kCL6O9Jag2f1/V19WP6bHL/F/EXfveFS0y
         In+Q==
X-Gm-Message-State: AFuF++lKxWjfhBPeWSd8nVv5yt3dCJHl0TTmW5jpZ369oCOJ6GNuexey
	7BxtSPJ9RwHj+bwiS4UxRPIoobzCu+b20CfirkKRtT5t39MNQO2k/c31zK2GioLe2ns/eMVP8t9
	zQA/zzqrn5Ve/4Ali/VUboak8HyxL7cP4AfLWp1F7mPbvPkZGW0L7wIirKXwJ81NoswcJVOhqAU
	of
X-Gm-Gg: AYBFou3AWf5T9jkrQmqIiXPRnLKE3CFolpMVoUy83i7iEI2nMgXr1lvAbkbZ5plN3jL
	dpR8iZuj3dsdqP1UgkefzeoD0m4GQnT3Err6paSFTxRGGSuFeORJz71Gg/FaFia6kHiyJ2ORZdx
	g56B88SP5+nDAJiwf356J4XGIzkgWInFiVkqD/ogLTh1oN6sxF+YdkeHs2UIrJ5y1Wv9rYzOIPl
	wAW3AD27MzBkHl+JrY+mN+nzNWSY1IHvP3arkqxRl1KTF3pZhDYyA3QMV7Pp6Faw+QRyLtBaful
	qZ7GNhIoThcFZ5z0jt3SVgjLk24jY2woakRaHEY452Yn0c+DGOGw69ji+GeYPgn7A3NHBIO9xg4
	EdaMPLckLgk1yaw7ulS60FuBZyW5T1XVJlDQ=
X-Received: by 2002:a05:6a00:4b51:b0:867:bb96:52b2 with SMTP id d2e1a72fcca58-874d2c8b9c6mr122142b3a.5.1789672867379;
        Thu, 17 Sep 2026 12:21:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b51:b0:867:bb96:52b2 with SMTP id d2e1a72fcca58-874d2c8b9c6mr122127b3a.5.1789672866613;
        Thu, 17 Sep 2026 12:21:06 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.102])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8720173842csm3307185b3a.41.2026.09.17.12.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 12:21:05 -0700 (PDT)
Message-ID: <84d2f245-1493-40e1-8b20-e5b88170c564@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 00:50:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dmaengine: qcom-gpi: Add I2C High-Speed mode
 configuration support
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260912-i2c-hs-v2-0-b0901791e244@oss.qualcomm.com>
 <20260912-i2c-hs-v2-1-b0901791e244@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260912-i2c-hs-v2-1-b0901791e244@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aExWkL-FTFCUW6yJOAGuJvP-3aU5XEyP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI3NyBTYWx0ZWRfX8XvJWaIQZFGS
 6ke98GmE6wjipmvR+Uhv9Tum4+tgMy0OLh4p9JzxgnKSwybhEJXYdScF8UOQn7++mWx17YXDcpS
 eCQ2nonFE9DpOTLIeSQ6qbz6njzMrdo=
X-Proofpoint-GUID: aExWkL-FTFCUW6yJOAGuJvP-3aU5XEyP
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aac3da4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=/ba+GChBmZZUisokHISCpA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pOrFmiSUyACN_rSOyqsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI3NyBTYWx0ZWRfX7HDlVJwfyvh5
 Dq8rvXjZbZDRNjdIbe22x771ULVoWcGlsnAiiVkkMQD/j/Qi6coN/wwp7U5g33jHxEqbLJH7glL
 Oc3biOF5SvCZ86I6L15e3deFO/bOhDiZZtHXlqa8ybd3f1GUThur/uh9jq0Eb+xprlMc11m9AVQ
 YxsJhhmMDDvQfzLQuPv2cChO1+9Vt9DVswuoWYK6pzzlM90ZK62dijHuP/7edarNifGSjY0qmoj
 1HNyrPMfIdgWmIjXgViYIleAf8XrXdXnMwUxQXc0h264kb9KYcQqho9jp2FQWZjDITglhqSl/9v
 UajJa/73/uji/5ju7GROaPU0eHipyAmU8rQ18fXVRrNRYNg6vV7Ubg9s7Lf48kSVm0j6KqPEagf
 VdiHj7B/kl8HIrm2up+hhW8otvEWY2tkhIz8/AByVofeMq6clvanpiThCNeqbchdMERZKtnCSb+
 KGk/1iTeaR0cWCn1pMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170277



On 9/12/2026 6:34 PM, Jyothi Kumar Seerapu wrote:
> Add support in the Qualcomm GPI (Generic Packet Interface) DMA engine
> for I2C High-Speed (HS) mode transfers
> 
> Introduce support for CONFIG1 Transfer Ring Element (TRE) to convey
> HS-specific timing parameters to the Qualcomm GPI DMA engine.
> 
> Define a new gpi_i2c_config1 structure containing tcycle_cnt and
> tlow_cnt fields, with default values of 28 and 38 respectively,
> as required for 3.4 MHz HS mode operation.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> ---
>   drivers/dma/qcom/gpi.c           | 56 +++++++++++++++++++++++++++++++++++-----
>   include/linux/dma/qcom-gpi-dma.h | 28 +++++++++++++++++++-
>   2 files changed, 76 insertions(+), 8 deletions(-)

[...]

>   struct gpi_desc {
>   	struct virt_dma_desc vd;
> @@ -1631,7 +1637,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>   	struct gpi_tre *tre;
>   	unsigned int i;
>   
> -	/* first create config tre if applicable */
> +	/* first create config0 tre if applicable */
But the variable name is still set_config, not set_config0 ?>   	if 
(i2c->set_config) {
>   		tre = &desc->tre[tre_idx];
>   		tre_idx++;
> @@ -1645,20 +1651,48 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>   		tre->dword[1] = 0;
>   
>   		tre->dword[2] = u32_encode_bits(i2c->clk_div, TRE_C0_CLK_DIV);
> +		tre->dword[2] |= u32_encode_bits(i2c->clk_src, TRE_C0_CLK_SRC);
>   
>   		tre->dword[3] = u32_encode_bits(TRE_TYPE_CONFIG0, TRE_FLAGS_TYPE);
>   		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
>   	}
>   
> -	/* create the GO tre for Tx */
> -	if (i2c->op == I2C_WRITE) {
> +	/* Create CONFIG1 TRE if requested */
same style as set_config, write in lower case.> +	if (i2c->set_config1) {
>   		tre = &desc->tre[tre_idx];
>   		tre_idx++;
>   
> +		/* CONFIG1 TRE with timing parameters */
Lower or upper letters ?> +		tre->dword[0] = 
u32_encode_bits(i2c->config1.tlow_cnt, TRE_I2C_C1_TLOW);
> +		tre->dword[0] |= u32_encode_bits(i2c->config1.tcycle_cnt, TRE_I2C_C1_TCYCLE);
> +		tre->dword[1] = 0;
> +		tre->dword[2] = 0;
> +		tre->dword[3] = u32_encode_bits(TRE_TYPE_CONFIG1, TRE_FLAGS_TYPE);
> +		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
> +	}
> +
> +	/* create the GO tre for Tx */
tre/TRE ? keep it uniform way across.> +	if (i2c->op == I2C_WRITE || 
i2c->op == I2C_HS_WRITE) {
> +		u8 master_code = 0;
> +		u32 cmd_opcode;
> +		bool is_hs_mode = false;
> +
> +		tre = &desc->tre[tre_idx];
> +		tre_idx++;
> +
> +		is_hs_mode = (i2c->op == I2C_HS_WRITE || i2c->op == I2C_HS_READ);
> +
> +		/* Select HS-mode or standard I2C opcode */
Should you move this inside and just above selection cmd_opcode ? I 
think the comment is covering multi_msg condition.>   		if (i2c->multi_msg)
> -			tre->dword[0] = u32_encode_bits(I2C_READ, TRE_I2C_GO_CMD);
> +			cmd_opcode = is_hs_mode ? I2C_HS_READ : I2C_READ;
>   		else
> -			tre->dword[0] = u32_encode_bits(i2c->op, TRE_I2C_GO_CMD);
> +			/* I2C HS write vs Regular I2C write */
> +			cmd_opcode = is_hs_mode ? I2C_HS_WRITE : i2c->op;
> +
> +		tre->dword[0] = u32_encode_bits(cmd_opcode, TRE_I2C_GO_CMD);
> +
> +		if (is_hs_mode)
> +			tre->dword[0] |= u32_encode_bits(master_code, TRE_I2C_GO_MASTER_CODE);
>   
>   		tre->dword[0] |= u32_encode_bits(i2c->addr, TRE_I2C_GO_ADDR);
>   		tre->dword[0] |= u32_encode_bits(i2c->stretch, TRE_I2C_GO_STRETCH);
> @@ -1674,7 +1708,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>   			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
>   	}

[...]

>   /**
> @@ -62,15 +82,19 @@ enum i2c_op {
>    * @high_count: high period of clock
>    * @low_count: low period of clock
>    * @clk_div: source clock divider
> + * @clk_src: source clock
>    * @addr: i2c bus address
>    * @stretch: stretch the clock at eot
> - * @set_config: set peripheral config
> + * @set_config: set peripheral config (CONFIG0)
set_config0 now ?> + * @set_config1: set peripheral config1 (CONFIG1)
purpose or usage not clear, looks mostly similar to variable name.> + * 
@config1: I2C HS mode timing configuration (CONFIG1 TRE parameters)
>    * @rx_len: receive length for buffer
>    * @op: i2c cmd
>    * @multi_msg: is part of multi i2c r-w msgs
>    */
>   struct gpi_i2c_config {
>   	u8 set_config;
> +	u8 set_config1;
>   	u8 pack_enable;
>   	u8 cycle_count;
>   	u8 high_count;
> @@ -78,6 +102,8 @@ struct gpi_i2c_config {
>   	u8 addr;
>   	u8 stretch;
>   	u16 clk_div;
> +	u32 clk_src;
> +	struct gpi_i2c_config1 config1;
>   	u32 rx_len;
>   	enum i2c_op op;
>   	bool multi_msg;
> 


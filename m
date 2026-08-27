Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1303F104B
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 19:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787859737; cv=none; b=KCCvcR9Y7YqNQHxXIeW9MqsRmrhOiSRwH++7/OIoRzekPLKLCkBfMmDx8fRe78ybUVxKwmPtLqWrMYpvW4DTeAPGh8HVGUR4r6M3z3phSng4fAU0i6g2EMm21t3oAZ0l59silrGoim8y5+vKVHWVyqVwrI6VwaHt0yzgsR1wex0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787859737; c=relaxed/simple;
	bh=/RD7s0HP74MSxB0XGImpZdqLBzxNE7Q/TPyFvx008yI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qy4DMn+nYjagaaalSYC/TyPfeboD88afJkVn+MKG2NhleD98V/PP+Nq+T6jA/ysqvaX6F8s2NV+XBiLzffrw+fBgJExxZXDGsmmwC/aVMqHMbYgYpUGN4fE9C8ewFouyFrtlBR+lA48EddXVl64rV9P1H6S7KLHGzwxeLzCRe08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RM5Y54Sf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bz3k6reL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RM5Y54Sf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bz3k6reL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RJLf8w235758
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 19:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+R/SL7wX8GJfrMTKpho4NWFlwsMHBuhvYbcRCvSGYUQ=; b=RM5Y54Sfbo66fC/m
	Yu64X5yV314sJWBQRMtCWjVuR5p34Rf0qg0DmPIT3WHqk7sTizSClC5UfZno4BpA
	CpfCyrU+khp39d8LAPraVIrnpFUw0s+/candM0+Wn5036osd3gp6xJSPeQv206EF
	Cd13VbnVa+nxppNvqm+8xRFjwElAWpL7d5jdDYwc5QExEwX5U1bO76FfzCldMLCd
	Pk4B/WECkfuw3VW7mfgvj1bh0R/zvkImWPh4+AdA/j10NHfzgDpajBu3wh7RjZ0E
	zukB6jnAVzMPBxyvYdtuIUSlT4t3oPMPLjB6VSIdUVjvc1581VPYPDMcUwCsUPw3
	0MLxPw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gatkjga37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 19:42:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so387475ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 12:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787859734; x=1788464534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+R/SL7wX8GJfrMTKpho4NWFlwsMHBuhvYbcRCvSGYUQ=;
        b=Bz3k6reLALWsCmTYyruJIPeaebmApKpdHnOa33OlwYdp+ljSqsnZ1JWxevlwOq7zX3
         ddFsRMk9xDEdACXJWESRN+5dBQY6KKjlAecweys1uVruuQCpPGYLRBoYOlEZwYKyU8ot
         bkR8cCuxRLqcrl0ObHrFVa5b12UaBniyv9pFQkKcBLR3ZuLOvvD+7BV04bLZ+wVu1oub
         15SyeMfsUrxS0qL++uQVQKa3a8OaRGSC61X8uRe/B5kq7IBB8sJ0UImwCjbhUXCVnB0H
         XxyEAxij1CkZHrhYXdxpQvUowD9CXLZu0y3HZNv6999mInXUbWHclwIDW5KcjD3BY7Qp
         UCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787859734; x=1788464534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+R/SL7wX8GJfrMTKpho4NWFlwsMHBuhvYbcRCvSGYUQ=;
        b=PH43OJ6xKrPEyQcnxMumcV0wlCArocdJzkSwCYMF+7dMEMu/oGWdN5CYY3XK33LsPK
         ElhKi03n6WK/97ObC4Py7tqq/1rHZqRCLuoAIXuj5jajnlMF5VteugexOAxqpbH/SwTZ
         Vdhw6YBto4PRuxTpArZuA8dXOAUCWB0bZThaGRq38zFfdjGoabaZIAlLUDqGNwgZ6NNt
         AycHkatY1BZX/rrkVV5iAP9OUHHIOzfmxpQcLYP5gha8ppHw1WaF+0AG+xmB+iTEkOor
         nt9wa7JNYhTqBxIqplMGYuaW/CehV4KyUNczCuFE6YpWwT5Bk+dJ5IFTo54e0x7gjN9Z
         mv6Q==
X-Gm-Message-State: AFuF++lzJxRInE/rYND1IipDbE/90/cmuz+Jb+mOoz5loXabr3Xmu4gM
	e+E4jAFNHdodpDWypmljdiXdoLcTI0O+hMK7wmSea08ZenXGwP9WJGhBYIKmapVMu0k32pGuJ1l
	DfUmOjmtIvbQfrZHtgljpNC2TrZoOPX6zDnfsA2pD3iB/auAtBZzrnsA8Scj2ynDXVn/a
X-Gm-Gg: AR+sD11YCv4XKkB6DDLRzIElequ24aCUBhm7ujzJa9pl8f3PW5r6ZuUjK2HgdkPJejb
	W+IyfQtRp7G2ZYFqs++/8+fOSHU5b5jT5B0anYUm7TE6Z2RhZO+ZZVU1rfYbPzcPoFNYamz8A6p
	zjVu2S/IZ7TfTMaPjevND1+nzvXWULguOFrgrlDtyTiztt5JDq3zGYyb6LHCNbOFMcqpMxfYcyV
	+pIdsmTfX2j2/7y16gCR6B7U+djTVxa80oeXPHG7KR7x6tGbC20QaViaa0aoYJvQcee90oWtuc6
	LYphMMLc2X6YcerH9dNxa8MM+cTJRWo7Q1s1ksgpbuqTd9ta8q5FkJ0+EgG208YTELQYnqX0MEq
	xssXdDTBXGJF/MzfE/JS0xMVdZg4W4TQJBw==
X-Received: by 2002:a17:903:1ac7:b0:2c6:90ec:f601 with SMTP id d9443c01a7336-2d74dc7a37bmr24178635ad.8.1787859734386;
        Thu, 27 Aug 2026 12:42:14 -0700 (PDT)
X-Received: by 2002:a17:903:1ac7:b0:2c6:90ec:f601 with SMTP id d9443c01a7336-2d74dc7a37bmr24177815ad.8.1787859733912;
        Thu, 27 Aug 2026 12:42:13 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.229.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d63bb23sm22605816eec.7.2026.08.27.12.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 12:42:13 -0700 (PDT)
Message-ID: <419902d5-cbb6-4d8f-acb6-d9640adb56d9@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 01:12:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: qcom-geni: Add support for I2C High-Speed mode
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260824-i2c-hs-v1-0-8dd94e5c6113@oss.qualcomm.com>
 <20260824-i2c-hs-v1-2-8dd94e5c6113@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260824-i2c-hs-v1-2-8dd94e5c6113@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P5EAilpVAmPCxMDC3CLXhIUsxO4SzMLA
X-Proofpoint-ORIG-GUID: P5EAilpVAmPCxMDC3CLXhIUsxO4SzMLA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE2NiBTYWx0ZWRfX2RIGgQZjsb+u
 3YyXgdONe6W/USZ2gZW9GE/KVgJczslHCiTnrcKpOXDJdmy3LPQZjCHADCB5GA0HNanY1BoM8bi
 HVLr5qtbAtiP2XROR+HPB+scqvFxnz+8vwf272tEvhpkkqEEvxmHnNZy0l5gMVeo6ZyQSWeEB4g
 15kxyI/XGzmYGHqXPDVvZUUMusyiuYqGG8p/jzKUf0h+djvzncP9xP24jLYv37pZPeugiu5N/dd
 P9SXLvYYiBvKRDw5X7hFoNNxbpMVhJHbjtv28hKolLdj2ZcmBRw9aoSRghVP/b1at1cpHqmLllh
 jswckE6L6ZiWxwHl4YKhWzf7IY3Ic1iNJfAM2sabFH0eKddMjfGjYiA8AHxMB+U7j2kVLJnS0Je
 bULjsuqP9S5MNolcrHeukINaz53r6JA8OytAEtHp0HiiErwfO0TlahO9FFPJ3ztsTLgkj5+IlcU
 mF6uidWCHWbDGVIb0RQ==
X-Authority-Analysis: v=2.4 cv=Rsn16imK c=1 sm=1 tr=0 ts=6a909317 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=n+669z1BX7WhZ/F6bI95gA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c9vcjAL7SRaUaix72DIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE2NiBTYWx0ZWRfX7skmxxnBomdJ
 PLd243LlUrq5p8xb3Zuhv7mwE4JJ7KHBxMawlXQSpjyeatIgRqwPpe8l2I85d4w1269NOwep1H0
 Sd0Zo7zmui0L3Uk5V51Q0uMCakFNW+o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_08,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270166



On 8/24/2026 4:55 PM, Jyothi Kumar Seerapu wrote:
[...]>   struct geni_i2c_err_log {
> @@ -162,9 +180,14 @@ static const struct geni_i2c_err_log gi2c_log[] = {
>   struct geni_i2c_clk_fld {
>   	u32	clk_freq_out;
>   	u8	clk_div;
> -	u8	t_high_cnt;
> -	u8	t_low_cnt;
> -	u8	t_cycle_cnt;
> +	/*
> +	 * In normal mode, these counter values fit within 8 bits.
> +	 * In High-Speed mode, HS_TLOW_COUNT and HS_TCYCLE_COUNT are
> +	 * 10-bit fields, so u16 is required.
> +	 */
Now, normal mode doesn't matter once switched to 16 bit.
May be comment also doesn't matter once change is merged, you can add 
some information in commit log though. Will be taken as default size.> + 
u16	t_high_cnt;
> +	u16	t_low_cnt;
> +	u16	t_cycle_cnt;
>   };
>   
>   /*
> @@ -194,10 +217,30 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
>   	{}
>   };
>   
> +/* source_clock = 100 MHz */
> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_100mhz[] = {
> +	{ I2C_MAX_STANDARD_MODE_FREQ, 1, 449, 548, 998 },
> +	{ I2C_MAX_FAST_MODE_FREQ, 1, 76, 167, 248 },
> +	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 1, 23, 59, 98 },
> +	{}
> +};
> +
>   static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>   {
>   	const struct geni_i2c_clk_fld *itr;
>   
> +	/* Check if HS mode is requested */
> +	if (gi2c->clk_freq_out == I2C_HS_MODE_FREQ) {
> +		gi2c->is_hs_mode = true;
> +		/* For HS mode, source clock should be 100 MHz */
> +		itr = geni_i2c_clk_map_100mhz;
> +		/* For HS mode, start with 1MHz for master code */
> +		gi2c->clk_fld = &itr[2];
> +		return 0;
> +	}
> +
else part ?> +	gi2c->is_hs_mode = false;
> +
>   	if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
>   		itr = geni_i2c_clk_map_32mhz;
>   	else
> @@ -219,7 +262,12 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>   	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>   	u32 val;
>   
> -	writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
> +	if (gi2c->is_hs_mode) {
> +		writel_relaxed(I2C_HS_TCYCLE_CNT, gi2c->se.base + SE_I2C_HS_TCYCLE_REG);
> +		writel_relaxed(I2C_HS_TLOW_CNT, gi2c->se.base + SE_I2C_HS_TLOW_REG);
> +	}
> +
> +	writel_relaxed(gi2c->dfs_index, gi2c->se.base + SE_GENI_CLK_SEL);
>   
>   	val = (itr->clk_div << CLK_DIV_SHFT) | SER_CLK_EN;
>   	writel_relaxed(val, gi2c->se.base + GENI_SER_M_CLK_CFG);
> @@ -500,7 +548,11 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   		geni_se_select_mode(se, GENI_SE_FIFO);
>   
>   	writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
> -	geni_se_setup_m_cmd(se, I2C_READ, m_param);
> +
> +	if (gi2c->is_hs_mode) 
gi2c->is_hs_mode ? i2c->op = I2C_HS_READ : I2C_READ;
geni_se_setup_m_cmd(se, i2c->op, m_param);> +		geni_se_setup_m_cmd(se, 
I2C_HS_READ, m_param);
> +	else
> +		geni_se_setup_m_cmd(se, I2C_READ, m_param);
>   
>   	if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
>   		geni_se_select_mode(se, GENI_SE_FIFO);
> @@ -539,7 +591,11 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   		geni_se_select_mode(se, GENI_SE_FIFO);
>   
>   	writel_relaxed(len, se->base + SE_I2C_TX_TRANS_LEN);
> -	geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
> +
> +	if (gi2c->is_hs_mode)
> +		geni_se_setup_m_cmd(se, I2C_HS_WRITE, m_param);
> +	else
> +		geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
same as above>
>   	if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &tx_dma)) {
>   		geni_se_select_mode(se, GENI_SE_FIFO);
> @@ -700,7 +756,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>   		goto out;
>   	}
>   

[...]

> @@ -1046,6 +1122,39 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>   		return ret;
>   	}
>   
> +	/*
> +	 * For I2C High-Speed mode, first verify QUP HW version supports it
> +	 * (requires QUPv3 core >= 4.3 per HPG), then configure 100 MHz source clock.
> +	 */
/* HS mode requires QUPv3 version >= 4.3 and source clock=100 MHz */
> +	if (gi2c->is_hs_mode) {
> +		u32 hw_ver = geni_se_get_qup_hw_version(&gi2c->se);
> +		u32 major = GENI_SE_VERSION_MAJOR(hw_ver);
> +		u32 minor = GENI_SE_VERSION_MINOR(hw_ver);
> +
> +		if (major < QUP_I2C_HS_MIN_MAJOR ||
> +		    (major == QUP_I2C_HS_MIN_MAJOR && minor < QUP_I2C_HS_MIN_MINOR)) {
> +			dev_err(gi2c->se.dev,
> +				"QUP HW v%u.%u does not support I2C HS mode (requires >= %u.%u)\n",
> +				major, minor,
> +				QUP_I2C_HS_MIN_MAJOR, QUP_I2C_HS_MIN_MINOR);
then why it entered into is_hs_mode condition ? > +			ret = -EOPNOTSUPP;
> +			goto err;
> +		}
> +
> +		ret = geni_se_clk_freq_match(&gi2c->se, I2C_HS_SRC_CLK_FREQ,
> +					     &gi2c->dfs_index, &freq_out, false);
> +		if (ret) {
> +			dev_err(gi2c->se.dev, "Failed to get DFS index for HS mode: %d\n", ret);
> +			goto err;
> +		}
> +
> +		ret = clk_set_rate(gi2c->se.clk, freq_out);
> +		if (ret) {
> +			dev_err(gi2c->se.dev, "Failed to set HS mode clock rate: %d\n", ret);
> +			goto err;
> +		}
> +	}
> +
>   	proto = geni_se_read_proto(&gi2c->se);
>   	if (proto == GENI_SE_INVALID_PROTO) {
>   		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
> 


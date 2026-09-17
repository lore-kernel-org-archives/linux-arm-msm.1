Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC7D4E0B7D
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 19:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672896; cv=none; b=LkRZLJWjiW533JbwMwVennvbANowThwwSAM2CPXggbLczveEADhMsTjZFh3asf0i2J3QiR5lwvDixONpnoPV+mNylaRxwvk0uX//DUH9N9H/98fiSUO/2SVTh3p1Zg90tOp3FFZQNv0kH4D2KiXL7jNwz2Rr9SgPo75/oslEkSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672896; c=relaxed/simple;
	bh=/rPZmwXCrcOeH8Le5aXgmYbzSOgrrCcjBpW7zNJII4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kfj6o6YyUe9bvUb61wmatbSrhfCNwsFQYWQEHEdfCwBTNLFIDjEcjVQ7Sn5mIQuK4J5EOkEKCAtq0z/YM4l+/EW42ax7DNwaa7nalutTJVLX8DBTNhoP592kcwf+O6yZSmtg/+fcaOuytekciaNqb28lhjkCLrMZ8Ke1ztkGBR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bjYZGbyo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AASMKXlX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bjYZGbyo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AASMKXlX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5P5v2282016
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 19:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LE6GawEmp+QYZ/dzIcsSal2zY7Oz2bE0cZ0j83mXjUw=; b=bjYZGbyo0ADmeDSF
	ajNeZNsK+OBesh+93HSIMTi7kaQAw2PBsrONL0xq7gFy1NDuQqYpBcOBVJi1D0Qk
	0IXPnFUqx608WMHYjjGDjkWW3cSVtVcituUWpqlGdfJFtIXKgKbl7wUTVAoptKHS
	w/0IoQ7ll4+Vfv4vZBvMxDYtPvE2cm3Co2q4IcJurHOdSKTST+B1HofQxJO6LuqI
	iOMcPrvAHR50PBagMcLle4lbAA2/yXeaAivKrUwG+EBhllR04Er3Him4ULFna7UI
	MonYEXri1nWeP643wN7IB3LlmsVX6VOps3p7nu+Fe4Ak80CaBZFKy5XDHM6INf1S
	OPa2yw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjkt16c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 19:21:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso1538145a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789672892; x=1790277692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LE6GawEmp+QYZ/dzIcsSal2zY7Oz2bE0cZ0j83mXjUw=;
        b=AASMKXlXMnYliItXqN7uHXVLkvDkAi/tli5EcdossxwmKMkiglvPbOn2xHoz+5BqYC
         eQtsFANw11cF91xdYUOEBXGpalb9In+AhjQM+B7aLym+8TmjqkurnXqi94jkNvKPOus+
         06hnouw84oFFBJI2ktzyhY6OWJdJSMx4LxBjkci+f5fnv7Lo4V5AIdGyqVNQpHI7fZBw
         z3C91fTMAp8cDWkG4Y7tFrVf5j3AoBdALIBYsYSCpJ0zorIn6eHNAeKPg9sQdU2yNvlT
         C0Df5glbdVxbhuAILRrbxjrya8Yq/ZQM9VpLVCs7Itk0vq4At+6HARmPZLkeXIEJKLEq
         U7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672892; x=1790277692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LE6GawEmp+QYZ/dzIcsSal2zY7Oz2bE0cZ0j83mXjUw=;
        b=1a5qdE3FTPCUI5jIR6zJ2rLy+IcuzrsrmjV6WLnYrdGj2j3KMr/4wbb08ln56EK17X
         sRMAPERgXb3d5oByWbbuWfSu9VG73KUYkPvLhiciwsGsMH7X0aUuJgTdym97jcoz/V1y
         U0hx0tzNcbPuQyDsu2hoOvZXClVCUzW1B8/gqYG5XkjXom6EpsBbmcf7vJ10RRvkW3kZ
         ubRmuiZx0KktUjx+zUB6Y+pJocPnPg4PGhH3pm+CQmvce26MVKJXwlHex1ZQusuk0U9z
         JIM1OX6vz2plk3zNncliwBdDhvx+n92nGli7sLsgYaVd/nXomAK8Q+zSK96BM4cYP5CD
         r9XQ==
X-Gm-Message-State: AFuF++mNc35p96gmiDPm8ArTQscg8BqJpSZe45JNtutRnz1/oaYdmVwg
	lzaEknkVIQGvFGE5yeotUXrfC9OE+YFQywOX/letfyQ+4ukcezM4+QzN0vzR5gHxuWpiXJICy+R
	to8METfRJjU4R1tL8dJtdJfzPhN1Mss6pRzxq4NuWCGU2ggF+Jj7l7gRMzdJzhW48Zb7m
X-Gm-Gg: AYBFou3EXTM+WXg1Ew+L+U00Kg6Sr2S2rPmZBFqlnRf0Tp4ND7aIZoDi179yerwJdwu
	5vzf0v3KOmwbGrFEJg2NXLaJ4fF1klXE/aZRkcM5RoArNQcO2+08didfL2ZivRmEYL/waFIUVWY
	4t1fqZQBEvTht9CO2xCg1uDOkLGcs/V4VETzWtbonl31peID76Hmd7hDpxSNEho77C82N8oWJlO
	UtAW2hUeZViIA4ro4ILB5w0HgbOl25NpKL5OMjX37UdXzY0B+dF2zDfdGM0gvYOT7fI8xOyMguz
	yPqxWqKpiSzO/FsNr+e2F7veSFP3E03zJqYRWLM/Lt8DDpFZHjKiNExkW5kHJn4N59OZc4deoxU
	b4Yc6UpiYGPFrhPfKdhmutAo0USdBAga+hLM=
X-Received: by 2002:a05:6a21:700a:b0:3cc:faf3:331a with SMTP id adf61e73a8af0-3dd8c337f78mr30061637.10.1789672891617;
        Thu, 17 Sep 2026 12:21:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:700a:b0:3cc:faf3:331a with SMTP id adf61e73a8af0-3dd8c337f78mr29981637.10.1789672891018;
        Thu, 17 Sep 2026 12:21:31 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aee8b0sm34608769eec.23.2026.09.17.12.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 12:21:30 -0700 (PDT)
Message-ID: <2e298351-4b00-4871-8ce7-fe6f11e7b03a@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 00:51:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: qcom-geni: Add support for I2C High-Speed
 mode
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260912-i2c-hs-v2-0-b0901791e244@oss.qualcomm.com>
 <20260912-i2c-hs-v2-2-b0901791e244@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260912-i2c-hs-v2-2-b0901791e244@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI3NyBTYWx0ZWRfX77QZk5zxa/sd
 W8krjH18SuAzqSwXGewZw9UTi0MZFe+SoTDZ5X//IXSUJRPTUvdt6mBtTHpjFiw8OgdUeJomxRZ
 4xkYVrIy03MXYoODU3GOGi664GWN2Dcadh8CMHVVSynOuN762XivcqeBDQ/WSJ5bdBaW71C5Yod
 4kFKBqfp4+BXDiKjdVYrlZ7OPjkftvLqb7xvQs9072SaBOY7kNnMCk8nm1uKfTKKw6BkX83d1iC
 DfjQjKGXWLMw26sZrtzsXX7HWsEehjARvNz1MVuhE8B0Jbsbl4KGxLPOhT1LIfhzXo7qJQD0G4i
 cAv1VtNm6K33RI9/cqF1XTXI6N5OprtZLd2azwdXGCJ2DlNMNyNHVGlXweU0OJ8VAVvL3BP9lCP
 VBsjR1e19di2V0yTt58yxg3FtP2OX8nRxOwhAPA/PcY9zdgq48l0SziiNr3ieDO1QoJzCAx5MTR
 IDREZ0PN3cGEwubhePQ==
X-Proofpoint-GUID: jIcHJN9nYx_4UR-lLNOirx6LNn4Y7Afw
X-Proofpoint-ORIG-GUID: jIcHJN9nYx_4UR-lLNOirx6LNn4Y7Afw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI3NyBTYWx0ZWRfX12pqT8qSQPPA
 ayoql8INTa7cwQ7nTK2C5YT0N98z1QERZ9XqPXFfWMhwzKrx8iP8vZF4DAas4tMB/m+RFvBkLK3
 W7Rw6QDA+QCmLnJeeAaIYQxfYTiBQPw=
X-Authority-Analysis: v=2.4 cv=Y/VtIReN c=1 sm=1 tr=0 ts=6aac3dbc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=/ba+GChBmZZUisokHISCpA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=c9vcjAL7SRaUaix72DIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170277



On 9/12/2026 6:34 PM, Jyothi Kumar Seerapu wrote:
> Implement I2C High-Speed (HS) mode for the Qualcomm GENI I2C controller.
> Detect HS mode requests based on 3.4 MHz frequency and configure the
> hardware accordingly. When HS mode is active, set the source clock to
> 100 MHz and program timing parameters (TCYCLE=28, TLOW=38).
> 
> For FIFO/SE-DMA transfers, use HS-specific opcodes I2C_HS_WRITE (0xa)
> and I2C_HS_READ (0xb). Transmit the master code at Fast Mode Plus
> timing (1 MHz) before switching to 3.4 MHz for data transfer.
> 
> For GPI DMA, extend the configuration with a CONFIG1 TRE to pass HS
> timing parameters to the DMA engine. Add gpi_i2c_config1 with
> tcycle_cnt and tlow_cnt fields (defaults: 28 and 38).
> Use the set_config1 flag in gpi_i2c_config to send CONFIG1 TRE before
> the GO TRE in HS mode.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 127 +++++++++++++++++++++++++++++++++----
>   1 file changed, 113 insertions(+), 14 deletions(-)

[...]

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
why ? can you mention reason too ?
And also instead of 2, can we use the macro now for each speed ?> +	 
gi2c->clk_fld = &itr[2];
> +		return 0;
> +	}
> +
> +	gi2c->is_hs_mode = false;
> +
>   	if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
>   		itr = geni_i2c_clk_map_32mhz;
>   	else
> @@ -219,7 +257,12 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)

[...]

> @@ -836,6 +886,13 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>   
>   	gi2c->num_msgs = num;
>   	gi2c->is_tx_multi_desc_xfer = false;
> +	gi2c->config1_sent = false;
> +
> +	/* Initialize config1 TRE settings for HS mode */
> +	if (gi2c->is_hs_mode) {
> +		peripheral.config1.tcycle_cnt = I2C_HS_TCYCLE_CNT;
> +		peripheral.config1.tlow_cnt = I2C_HS_TLOW_CNT;
> +	}
>   
>   	tx_multi_xfer = &gi2c->i2c_multi_desc_config;
>   	memset(tx_multi_xfer, 0, sizeof(struct geni_i2c_gpi_multi_desc_xfer));
> @@ -883,14 +940,25 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>   		if (i > 0 && (!(msgs[i].flags & I2C_M_RD)))
>   			peripheral.multi_msg = false;
>   
> -		ret =  geni_i2c_gpi(gi2c, msgs, &config,
> -				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
> +		/* Set config1 TRE only for HS mode */
> +		if (gi2c->is_hs_mode && !gi2c->config1_sent) {
> +			peripheral.set_config1 = 1;
> +			gi2c->config1_sent = true;
> +		} else {
> +			peripheral.set_config1 = 0;
I guess default should be already 0, isn't it ?> +		}
> +
> +		ret =  geni_i2c_gpi(gi2c, msgs, &config, &tx_addr, &tx_buf,
> +				    gi2c->is_hs_mode ? I2C_HS_WRITE : I2C_WRITE, gi2c->tx_c);
>   		if (ret)
>   			goto err;
>   
> +		/* CONFIG1 TRE is only for the TX channel; clear before RX call */
> +		peripheral.set_config1 = 0;
> +
>   		if (msgs[i].flags & I2C_M_RD) {
> -			ret =  geni_i2c_gpi(gi2c, msgs, &config,
> -					    &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
> +			ret =  geni_i2c_gpi(gi2c, msgs, &config, &rx_addr, &rx_buf,
> +					    gi2c->is_hs_mode ? I2C_HS_READ : I2C_READ, gi2c->rx_c);
>   			if (ret)
>   				goto err;
>   
> @@ -1037,6 +1105,7 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
>   static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>   {
>   	u32 proto, tx_depth;
> +	unsigned long freq_out;
>   	bool fifo_disable;
>   	int ret;
>   
> @@ -1046,6 +1115,36 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>   		return ret;
>   	}
>   
> +	/* HS mode requires QUPv3 version >= 4.3 and source clock=100 MHz */
Supported for Version >= 4.3 (instead of requires)> +	if 
(gi2c->is_hs_mode) {
> +		u32 hw_ver = geni_se_get_qup_hw_version(&gi2c->se);
> +		u32 major = GENI_SE_VERSION_MAJOR(hw_ver);
> +		u32 minor = GENI_SE_VERSION_MINOR(hw_ver);
> +
> +		if (major < QUP_I2C_HS_MIN_MAJOR ||
> +		    (major == QUP_I2C_HS_MIN_MAJOR && minor < QUP_I2C_HS_MIN_MINOR)) {
> +			dev_err(gi2c->se.dev,
> +				"QUP HW v%u.%u does not support I2C HS mode (requires >= %u.%u)\n",
I don't think we need to say required version, just reporting supported 
or not, should be good enough IMO.> +				major, minor,
> +				QUP_I2C_HS_MIN_MAJOR, QUP_I2C_HS_MIN_MINOR);
> +			ret = -EOPNOTSUPP;
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111509;
	b=vTEQmCQrxLh8KZfIt30HAh8Hcv2scTmTiWa2ub/HpxuyOrnh7tyQUmYmPgOprqcrx1PS
	 3xv16G7vhCW55+rA5hIoCQPc2ENYCt8mHO6glhiGLY7WTTMJuZ9hfQHsf7uLXb/5Pky7N
	 d8k2/fZMYIsBC8Tkw/O8XvknPQYnYUdgQuRsCL4DuAUQn1ga78XWTeWCGxSyP067bhMlm
	 DKytTZyqws3Tahc/xtwBzMcRXo847YmbFMWV7xvfO1MZtx5FKmnkjdsRLw/1RK94oggKx
	 nSx495lNHe3NrojccdxcVcqcpXpeNbXCGP1JDcc6JxM9mAl829bLmIJl8tRbJOnhM/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111509;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YlwVcIUY8gMD3eqih4RJVxsvUcuNodLGMkC2yTuphK8=;
	b=p5iajhQlgjVK4aymFD1kfKFSR7M3dCZmSbOD3ZodE+NJAYj3KC6OuTCW5HUst0U7QMSy
	 /C4fqqFsSp5ZGq6XCKtWojh0uXHAqQIsv5FYUIxTlQ2VqYY+tXkEpSAAe958kvoryhFG/
	 OznEIMwNBTc2o8whPfSgogAizUWNUmqWJaUPmS8FCFZf4HTbPd+hj4+cgAMWyXpEmhHY0
	 lxfxbw+9l1dX0TKdeuWJT4Ix/JqxMa39nj511x4D9v2o410q5id1IsZWH4TK/SlbKET0F
	 eWTc9Nk1S9wx/yVWHZIk+DZXy4U42k+dQ/PJvbaiVsjfYKx6EWO0td54eLXXrK5w5gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i+rtoxO0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDFQzwcs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64FD606A334
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B64FD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i+rtoxO0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDFQzwcs
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDo5Ov2881647
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YlwVcIUY8gMD3eqih4RJVxsvUcuNodLGMkC2yTuphK8=; b=i+rtoxO0Noy20qKm
	uYJ5YCbW+8Se7Z5KqAT+4MTHNH7Tk5vnE+7P6LhYkSFvvWTwpU2OMlZhuyekZWkM
	MdePTZiVPh0iXmOWlx3tfH6tCdqcZCr45Y5I6vNFMQkFdHMucSNsjajaCSXDe5uA
	0BLEd9gHtBOWQH8CsEpx8uzBl21U2QcSAg8NqTqbrtjND5KjrzTWnyQtIJbQvwpb
	tt52HCsZd5gqChQeQLy6RIvtWiNvooN0NhzvA+RvOZlVgZiLh1+EMwcjlw4zz7a+
	EnAJJVZpPtJcFKKkeDGujrHGXSVVO6cZjiRLxo8liKqrd5HUH/G6vqw55CNKZG5D
	8qXoSg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtarx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:31:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9501034c4so75217415ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793111506; x=1793716306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YlwVcIUY8gMD3eqih4RJVxsvUcuNodLGMkC2yTuphK8=;
        b=FDFQzwcsVN+VQyVMwEc0zOwbZJJmVWYg0F7b2ToVFIY4g0BPtv7kdNxAjtiStWJMV+
         Y3ZQsG0Vg3FKcICRWK3D3qCxZWjUAI5hhI/BGIYTM4Pf4xz/o3x5LiZLoEBY9NDn08Tr
         WBdQwvJwTIi/qmBHG6FZRWK/W7B89d0IM28Z+DZhb15BCrzKaDQtOVxaKmZdaPZCg9Xj
         fVVISTWl28PEocWpF1EqGbNNSHLMawIqgHdBkD3KUT8AAkU8Jmu3AHOtkIJj9/NF4KVy
         YJLogtJPJ3R/ypf+GIzycEc9uoWTB/jhgsvTuCT7xwsaxD6y7R2eeIAwUIOR9KUuorfl
         nH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793111506; x=1793716306;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlwVcIUY8gMD3eqih4RJVxsvUcuNodLGMkC2yTuphK8=;
        b=WFu6FovqEadnQZgdGQLPyd8luW724w5OMpyJfhtVabW49DjAXt0XO2opTpw9mFNvR7
         VPw7HvrJXDo45z4zxaeV5usQNsAm+ZePaMWl5EczzkcSr57cvfwA6Y2/osZIoaml7+GA
         fcDDtbVrfWapKz1R1hfC1zWMurI/lwlg7CaoOnqT1zgQ61oZ5qOc3PqaqKdLnvIIkQZ6
         VYi9kwMBTfHsBgS2/Jrz0DzNDMdNimfXE3qKN1sJ1OX1CCc3GoKg4aXkvzjH+NcLoJ4s
         VVf8O9944XDXUhEIZDiQFv6RLKWGBxH0GGi3IKT6t5gbgGULFZJqWCV3XoerFbzW6G8j
         TAmw==
X-Forwarded-Encrypted: i=1; AKwUvBzaa2aYoQeG1EhPzxBEOpgzZK2wRviw6HGp4ts4Czuawki6ampKLfcNpk4DqFAQ/DOk0fQOsgUxG75WOzgI@vger.kernel.org
X-Gm-Message-State: AFq9FYLcQD+nYDp4R2AGikRXfiM84FvgE5VPF2ozK+DK6cHVe284Q80W
	tT3r8UxVfeeO6kaVPvVVB9yLx9SSPpG84BApfD84WmlqlzEZgHnJ0Dzeamy2QmFa2R5Sk7TUZcA
	UhYyLln/ZNW+iFionxWuin+hMtjuK+EvdSWeMkZU3+JXzOanVFi27Ly0GiMIGScxhIXfN
X-Gm-Gg: AYBFou0NuvdJsaSID0Nwix3Y5HM1nthSEG/ALufN9cxb1H13Cpe7nu0hs1KBdXNo+8k
	u42PpkxRGwlGrP9dVcTtICa/Gxjs6/GJUrZPR7oizHFnV4ewae84vV0MKjp98ED8/gMjg4DEiyl
	tED6KjAQ5V3q4eQ3BG4lEyVKp4GGZcU4a3mKjx/ZkQkLORCiK1zbHytydteHqMJrUyQKve8460N
	b8vRbWMWSSOJ9PF2nv46fM+/26kbllOX8K8TBc/cQidwIP780A9xOTacggtiGI7hNrYGh6iA71m
	jaLsQPzSJbhcmAS2+BiYzFQiUxt3n1C5As7pjD4oh/6jGbTwpTUhSsCUbXqd4DkNdPWbKALO6SI
	qnQpyMLOjiOLywyBOEMopgGQa3tMqF8uk
X-Received: by 2002:a17:902:ea12:b0:2e9:64b9:a332 with SMTP id d9443c01a7336-2ea9c68c8b1mr90167185ad.15.1793111506179;
        Tue, 27 Oct 2026 07:31:46 -0700 (PDT)
X-Received: by 2002:a17:902:ea12:b0:2e9:64b9:a332 with SMTP id d9443c01a7336-2ea9c68c8b1mr90166425ad.15.1793111504651;
        Tue, 27 Oct 2026 07:31:44 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6454a29sm10749995ad.9.2026.10.27.07.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:31:44 -0700 (PDT)
Message-ID: <b88efeae-6041-4189-a559-a16be07450bc@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 20:01:39 +0530
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
Subject: Re: [PATCH v3 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com>
 <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-3-7f2a6e572de9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261027-20260826_aniket_randive_oss_qualcomm_com-v3-3-7f2a6e572de9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NyBTYWx0ZWRfX5DOrXfZRLNtu
 jTDPCwlOfR+a5e8+Dj/q8n5KzvcNwCQxfdkEqdXWtGW/PPxS5TF8PKFNlxBkzHPZIDanyHTY/SM
 U5MhyHIisgX0w15m6AU/Kdl7o7/YXAk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NyBTYWx0ZWRfX8Ih3PP3817QE
 a+0SbrXNafZvEfg4OeZ5myqyhoVeK2luf4aF7qYGqk1d9xJUJ8Neg5sh9EgGn/in+LVW2tL8f2Z
 w9kVIcKtyxnKBCs3WlrXaowHq/LFxpYENjcjHQJU0epwYICwAJvBVzEmMWmYLPyc83/Jf3fK9oH
 LJkYeq+nXyC1WYpic3TRww1gqwEf4NpZMy5TkE0zdeEdsKGCEhUQchL3sKt3OUu4JQcV1ETZCiv
 38Fidn/+mo7hv+OYK+ZhSwp7xaJh3nPRkjCLeBh9gS9bsCcHaz/QO8tQGPQd8iU2EkjmeBT4PO5
 lJmzKczadN5y1l3jRZ6DA4STRCIyvu20+lw216IuWJqCIoNxoaBNsQBKXI8GFaeOi6PwE287Rmh
 YXpUgeRyFNvl+3TwaaadfXmjQNyEYj71Fq6I68zl3yWhSFb2BjwTuO3LIjWPFGsuybP4c3Nh3w5
 EN1g+XuS39wRmCPibwA==
X-Proofpoint-ORIG-GUID: K6tB2x40hw0USnYrgTmWx4xVX3I_L-gL
X-Proofpoint-GUID: K6tB2x40hw0USnYrgTmWx4xVX3I_L-gL
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0b5d3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ee05V1XPiC3bpTzN_coA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270057



On 10/27/2026 10:43 AM, Aniket Randive wrote:
[...]

> +static int geni_i2c_gpi_bus_cmd(struct geni_i2c_dev *gi2c, enum i2c_op cmd)
> +{
> +	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
> +	struct dma_async_tx_descriptor *desc;
> +	struct gpi_i2c_config peripheral = {};
> +	struct dma_slave_config config = {};
> +	unsigned long time_left;
> +	unsigned long flags;
> +	dma_cookie_t cookie;
> +	int ret;
> +
> +	config.peripheral_config = &peripheral;
> +	config.peripheral_size = sizeof(peripheral);
> +
> +	peripheral.set_config  = 1;
> +	peripheral.pack_enable = I2C_PACK_TX | I2C_PACK_RX;
> +	peripheral.cycle_count = itr->t_cycle_cnt;
> +	peripheral.high_count  = itr->t_high_cnt;
> +	peripheral.low_count   = itr->t_low_cnt;
> +	peripheral.clk_div     = itr->clk_div;
> +	peripheral.op          = cmd;
> +
> +	ret = dmaengine_slave_config(gi2c->tx_c, &config);
> +	if (ret) {
> +		dev_err(gi2c->se.dev, "dma config error %d for bus cmd %u\n", ret, cmd);
> +		return ret;
> +	}
> +
> +	desc = dmaengine_prep_slave_single(gi2c->tx_c, 0, 0, DMA_MEM_TO_DEV,
> +					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
> +	if (!desc)
> +		return -EIO;
> +
> +	desc->callback_result = i2c_gpi_cb_result;
> +	desc->callback_param = gi2c;
> +
> +	cookie = dmaengine_submit(desc);
> +	if (dma_submit_error(cookie))
> +		return -EIO;

Rather capture ret and return it if it's an error ?

> +
> +	/*
> +	 * cur and err are shared with geni_i2c_irq() and the GPI callback
> +	 * i2c_gpi_cb_result(); both write err (the IRQ handler under
> +	 * gi2c->lock). Reset them under the lock before issuing the transfer.
> +	 */
> +	spin_lock_irqsave(&gi2c->lock, flags);
> +	gi2c->cur = NULL;
> +	gi2c->err = 0;
> +	spin_unlock_irqrestore(&gi2c->lock, flags);
> +	reinit_completion(&gi2c->done);
Safe to init before dmaengine_submit().> + 
dma_async_issue_pending(gi2c->tx_c);
> +
> +	time_left = wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeout);
> +	if (!time_left) {
> +		dev_err(gi2c->se.dev, "timeout waiting for GPI bus cmd %u\n", cmd);
> +		ret = dmaengine_terminate_sync(gi2c->tx_c);
> +		if (ret)
> +			dev_err(gi2c->se.dev, "DMA termination failed for bus cmd %u: %d\n",
> +				cmd, ret);
> +		return -ETIMEDOUT;
> +	}
> +
> +	return gi2c->err;
> +}
> +[...]

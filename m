Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580474;
	b=h5myPKWp7krtCYzGJm1AF/I+espy8k42VBE1/edUyoOQrC0u7BjR/NK6aLnyHtctRiID
	 ftEo4sv087h/KYr0u171ov0cLpitPIBZnpLhiQ8rSuS5jXIpMoL36wGyBAT7veTLYSD7W
	 HY3xJFdvaPHHzG2Y1EUQcCB7BlafDkYj8SWlObnRGHqI/W49Geu/eab7c0lNNCzN6wHwk
	 QuugXbgKZElB8rxuuWL9mF7OyxL2Eirl6HqhmfNRkpj2sHNTVzN9UMNanKISUwocBSwsn
	 Cw6eTfh0Iqu+U+7s8m5hB4UZZc9oEMjQ7/u3Lz4RGBcFRhYGqpNpwZyiJKihOMlfAxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580474;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ieHFy23q8nzXaZ195Z0A67B/EMZuqN8/BFlEEwpO4ek=;
	b=e2Bl6HSOvuy2FAsr4I+KP0JwQgGcomJvKTEJyvZ47eUHN84Qd62UioIU5Wh0YZLmCa6T
	 A/T7eOwag5SU0O85DoCPiHF8/r8GQDWYntzSTmyGAZXE3H9X2oHJ8VW+lsBFgzNHBil1Q
	 4QutP3f4FOEkJRW0s762k5BzO6TF0bP+dEAB+28PgxKmu+HSKs++mtgJa9o3Gi7056Bye
	 ZaGcLxO2siTJ+eiBNMrKS2K+nmeMZY1fDCVF/31FJS125YK2lJNH5AZL2/fvGrIQAeLS2
	 AR6y4ik6aElsZ9kEzJg7YfhuPUC3jpduzZFK3+R7XAZdiOS6/GsJta98dzR8wJIUDNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MBhgXHq8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eBM2B50P;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF89606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EF89606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MBhgXHq8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eBM2B50P
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5YKX335076
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ieHFy23q8nzXaZ195Z0A67B/EMZuqN8/BFlEEwpO4ek=; b=MBhgXHq83hx5GCDn
	HWm/hqW7klNivdA3DkC75vnc7ODYHVPpIzCBPR//FxMDvtE1VO5nFQGB53GlcDtl
	s+ekgbYqcSvnZKF2rHhdp9JJ5Kcgtm3I+0pi6ljMBL8aAPDhQALTAWV3P5Q9wUGx
	qW9DskDF2rzKgr9BKqyZ6zbpLCfmqOieAduixM3Zxqjo8oEwiptAtBuDmybUajnw
	rbLXmEQmfdriUHKkDWhaNb29mZxwocQBjxWOpZdaPe8MXJabsXqq5vxMIFLVDFIC
	XweuuU6SP1wGYCN7ZeJaM594PK2pl1C2AhBmMD6ayWf37jwj+Ejv9h3SNQ7NYcLV
	lY9+Vw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj48cnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:01:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91795e52969so1946296d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792580471; x=1793185271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieHFy23q8nzXaZ195Z0A67B/EMZuqN8/BFlEEwpO4ek=;
        b=eBM2B50P/giQiuDncRDVjUSMeCu1JA89HGBAFL6L944rkksBwfKr0hGMCpP65aHKV+
         MEQ1sCu9kXiQz7W4rpwmRA+UGCwailiqsYY+ici6AnBQqhC9WuJay4se81L1zEGq4s0c
         Tveg0NkjGMV9wt6VctI/2GBjdnmDQjAbiB/mTsq0sxKjuKd5t+2gDdUh0iXjraNcvAke
         97bO3iLtwVvfKQjpdE29brD67UIZnXWau9cGXM8aajBxK4V/WK8hoUxhZ5BGhIwOmqgi
         uXuPCwCbItCUHIPt4U4TjPe1EvkVygk4QZpFO/bgOJBbDOcFwZM/XLbxifhXQkQfTVUb
         //yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580471; x=1793185271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieHFy23q8nzXaZ195Z0A67B/EMZuqN8/BFlEEwpO4ek=;
        b=jw4T47OWSGVO7u9jYMfnI3fxE50xY75sVljCPdQ2VEVrUhOgMpuTxk2P3RjL+2wKuW
         FE10qImOS2GahfC+UK5L5s08o6B8vkPYMaBOeVlps8RfHih55pnoG9SRhIsPn9w3UEOs
         osnAIk4wkBYrpeQ6ftxCQWJZd3bqFMpDI3ne43InSlAZCX2d+do3IIEz8Udbc4eHXyKW
         BKq9wFbn/x8FAlL3S8BNS8eyuD+YcT4ngwg+Rhz3EhkpLv+WYDHgmy9sgF50Xf4stP5d
         gRyTphF6yNDwXu1f2hAjcU7m1ryoMJGQDGME9AdKCT362pSTDLiYj8u/xPSGXNZv0Kf7
         MEjQ==
X-Forwarded-Encrypted: i=1; AKwUvBytLyaTBa/191/ZmRGhmYoh/TyOyGizpHsPnJK1gjPoYnFcndq9CkYK9beYBsQzyWUGzV8tdtTe+iXJd2Uj@vger.kernel.org
X-Gm-Message-State: AFq9FYLA3P6AVbw75tZ2BepQN3KqKDoeWZ0Q9nO/dd82dGjSK6irQLGq
	h0XjP5oG+f7t3oT8CTbxOonfhvTmJVkY8QlWDp2LIHP/6a7kGzzfD9X/+4qWOPdi5GF7ckpXY/l
	43CuzU2OAfkexJFJvQflgxoC6QnZvo+y8E/69Eu0Nr+x3XLPddOp/wzQbwMiA9+6Nd9Iy
X-Gm-Gg: AYBFou0x8hVkTJoF9tzYHqboa8Ll1XZsUOyCBlx/UD12aGcZgOSGQC76DI/8oFGECaN
	TcdZK/85Sd9Yw9vg8hPf2f0Yh+UwYSEtDgS50d1Eg/2jaQ5jwgzcPylBcuWcKNKKnd7+n/wzz2n
	+zA0+QEaXBKc1mX8+jTf0UxL7lpnpskZPZOZQmOGvTDYriaYkPUPvak7yOBMDfHMpMhXC7X0Vov
	1KBcWrwzR+kcRgqfjuEGKKWa+yI570CRmjAaYqm3eZZSYGzRPJy0+2j8TGxWlR8+AeXDyEzMslU
	Ryu28WxURJYVHWRrLgXkPZph9PP9l9uQMeXn6pVebODmoO4GAhy6qqizgK1ZpfZBxQjA3KL2w11
	/aa6GVuMVGdPCTe9WuDk2pg==
X-Received: by 2002:a05:622a:1aa5:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5369b5536dfmr28197731cf.2.1792580471107;
        Wed, 21 Oct 2026 04:01:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5369b5536dfmr28197021cf.2.1792580470613;
        Wed, 21 Oct 2026 04:01:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678e5b763sm66072366b.2.2026.10.21.04.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:01:09 -0700 (PDT)
Message-ID: <59888512-9938-4982-9869-5f1d0e3770be@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 13:01:07 +0200
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
Subject: Re: [PATCH v3 6/7] i2c: qcom-cci: Add burst read support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
 <20261016-cci-imp-v3-6-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-6-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: siZW9kD2yyka_nJBzdBfJnDC7mrz6Z6L
X-Proofpoint-GUID: siZW9kD2yyka_nJBzdBfJnDC7mrz6Z6L
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad89b78 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=EWxcpF3ALA2S2w6I5qsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MyBTYWx0ZWRfX6sgO7kp38VVb
 wnVk4SEq9NgGvGbqXIxB3oVE0QrVpDKGOO1tLSIfTqHJPWnOOjmnNOnLnwRR55ND0t+wvYoQJ8V
 W8YMYGMQ2AwWOopNrn4LQJ08Nj0yTPMtagsrYqA79Q4EoDakS5tSdkaPcc2w0kthBqVP7/M+Wyi
 EUZqQI6KeruPoCaJ55U9eb9tmTdJ/pKUhAciVgdbds0MYbzis6Ec+1hf+ss8/XAy5kLfZXJlJqI
 vg0ad6W3J8VvavhkC3099OVTXKs0ptAiyG3vAW9+pBOFVQMHclb1Wqj2gO+qZp7A/QsrApUUX8D
 uEyp2ZhOEzvZL0QUkfRvHgmrBQRr62YaA/7Z55hTYgt8J1p2qwEK+hEIAjjdQg7FXqhGaPKLoxy
 dokFaCsFkw69RPic0o+MovNn5r8HkZInARnWY2g29ytwg8/pCn3oUgTZNbCLcxP1DRX09O1p2go
 SwdY++ME8T6UfvVP3BA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MyBTYWx0ZWRfXwFo/IybgmSbe
 H1HHVdBrN11nIKUqyzU9CxE2Tq0U0Pp4QcILXaBWrVSwacmFCXKAXPgrmPeEADfKUVGHQFj/oP7
 5H3uas8aL/P/daXuyBfDrSmUFaGOKtg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210043

On 10/16/26 10:00 AM, Loic Poulain wrote:
> CCI_I2C_READ transfers are currently limited by max_read_len to the
> amount of data that fits in the read FIFO, as the driver only drains
> the FIFO once after receiving RD_DONE. On current hardware this limits
> reads to at most 254 bytes.
> 
> CCI v1.7 and later support reads larger than the FIFO depth by
> generating RD_THRESHOLD interrupts as the FIFO fills, allowing software
> to drain data while the transfer is still in progress. When the FIFO
> becomes full, the hardware can also apply backpressure by stretching
> SCL and reports this condition through RD_PAUSE_IRQ.
> 
> Program CCI_I2C_Mm_RD_THRESHOLD to half the FIFO depth on hardware that
> supports RD_THRESHOLD and update the read path to drain the FIFO on
> each threshold interrupt until the final RD_DONE event is received.
> 
> Older hardware revisions do not support RD_THRESHOLD, keep their read
> size limited to the FIFO depth and continue relying solely on RD_DONE
> for completion.
> 
> Also emit a warning when RD_PAUSE_IRQ is observed, as FIFO backpressure
> is unexpected under normal conditions and may indicate that software is
> not draining the FIFO quickly enough.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]

> +#define CCI_IRQ_MASK_1				0xc10

This exists all the way back to 8974, nice

[...]

> -	ret = cci_run_queue(cci, master, queue);
> -	if (ret < 0)
> -		return ret;
> +	val = readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queue));
> +	writel(val, cci->base + CCI_I2C_Mm_Qn_EXEC_WORD_CNT(master, queue));
>  
> -	words_read = readl(cci->base + CCI_I2C_Mm_READ_BUF_LEVEL(master));
> -	words_exp = len / 4 + 1;

GPT says: can we keep this check for the legacy case?

> -	if (words_read != words_exp) {
> -		dev_err(cci->dev, "words read = %d, words expected = %d\n",
> -			words_read, words_exp);
> -		return -EIO;
> -	}
> +	reinit_completion(&cci->master[master].irq_complete);
> +
> +	cci_set_rd_threshold_irq(cci, master, true);
> +
> +	val = BIT(master * 2 + queue);
> +	writel(val, cci->base + CCI_QUEUE_START);
> +
> +	/*
> +	 * Hardware supporting RD_THRESHOLD can handle reads larger than the FIFO size.
> +	 * The FIFO is drained each time an RD_THRESHOLD interrupt is received, until
> +	 * the final RD_DONE interrupt completes the transfer.
> +	 * On hardware lacking RD_THRESHOLD support, reads are limited to the FIFO
> +	 * size and only one completion (RD_DONE interrupt) is expected.
> +	 */
> +	while (index < len) {

GPT says: the last transfer isn't waiting for RD_DONE

> +		if (!wait_for_completion_timeout(&cci->master[master].irq_complete,
> +						 CCI_TIMEOUT)) {
> +			dev_err(cci->dev, "master %d queue %d read timeout\n",
> +				master, queue);
> +			cci_reset(cci);
> +			return -ETIMEDOUT;

GPT says: disable the threshold irq here?

Konrad

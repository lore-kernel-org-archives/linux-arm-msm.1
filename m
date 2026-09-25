Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A6A423EBA
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 14:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345459; cv=none; b=WOoySvLsZjxkh4j4x9iZdeerM9Z2K16BaE4CaohCHoxahxWYlhJUPm3LGz83+09KA9FYVb3eRFF+Aq29fqDlWzADUpLvByI2jQeAh/MXVsAICZ7X4+wxI7+jHyVnXAq1nZmkbVt5DSbBqGGg4QiZF5M/BxVfEAJpNUd59ged09A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345459; c=relaxed/simple;
	bh=itBJES60RMp9qTnVjDVU6fwJJ9IUAne92eVMwTA1po8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHaUIbHSdEwq49a8RuKdkcpKHr6Dyay5G66WZV8puDxW9ewXlgam1cQxysV6I3sEiXmWHc+8t/hMr+r7mew+gIxvRNH3Mk/ONZEKmvyznnSHuZC/X1cX6LuLFndP1yMIPMi/ZJspf/y5dN9ST6PWrjLtXgV/o8/vZlTvs1yn1GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QUvINafy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTMzigI5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QUvINafy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTMzigI5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBLdQv900282
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 14:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgVIs0/RJKVOv08WQ9oErS5WnuLl2yv8yGRz8Gn+/YU=; b=QUvINafySfh61Y8i
	7iSJlG09r1YiPJh5vYN0UW6hlCgKoi6OY2OjlG1hljwqWZGG4GWBwjAeYN3DPy5s
	lHARp35SoiNH7N2hO9iHKmbjsD0dfkJNKoDoOFKirtrFqfvT314PGcpyPRNqDgc1
	nqA7f5Onz9nnZN5jxIV0hTtAeECKy7Jv7IXOOuBuqNsIYi+iq2HgO2OfWb+DljyK
	Z6KsFRzsGMEZgsZXWvsK05Pcc065ZQn7BLEiO0jQsEAZwu5HxcHm+344HUtenst2
	ycl4WYd1MM4lI6YjaBtJmIFlwX5ZxXbF3nUIEC0MSduGhfwLyOWCJw0bOEqMW5pa
	oPI9pA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr100geg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 14:10:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so1942520a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 07:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790345456; x=1790950256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgVIs0/RJKVOv08WQ9oErS5WnuLl2yv8yGRz8Gn+/YU=;
        b=VTMzigI5iw8HkhXxPnt18ZKn/TKjnW/wL6y6yLLybqrNyl9Rh8Q9wIFMR6UtdXtQQj
         BSdZbubjO5/MhXtfgKah8w0Wp/5Z/wXGiwor7QAAcCPPMrcYhPp9y4SaahCF+TghYoNp
         CGKH1GfrjoRCWsWENlRImL9tHfjv+jL7zmovX1yVp2hXiwnbK9lsd3BBGqVh9E8ZecAu
         kciel0Zyqiau7ji09f91tWqdFXOGJzFuGjAfBNMy6KhJL6J93ssGdHOuFoLs7tXFc8nL
         2blIAVqhM1lldCGXxxLzQGPqIg8eu+WQryRzGqoAwGQ61nvQuJKdrPxqjlhTivza34nT
         w9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345456; x=1790950256;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgVIs0/RJKVOv08WQ9oErS5WnuLl2yv8yGRz8Gn+/YU=;
        b=cEbxhQBTJJlBLHkTgqVKUxnHkAtSYlj+Cj6yhmtgFnyNbOX8BaiIlnYhqpy09cXAnU
         T6Pjm2lVPWvRJLCJzmegf4063E4BOoJzofaIuIKIXn+j8s/kGq7ohH2Pgh+tNbKuzGCa
         C2f5qPD8Yt4uSatAjhBuSD+UIEbLOP1qXe2VQiJv5e+Pw+pslEOun6Hla928CUauLLFG
         q/JabG0BZWpCsgXFqUvZ48smxQCOmJbR78C1m+gHq7PcUZTpiJpHezEQpmmqdkAfCfwE
         ZTcGLyJGgdpJcd44xFx5yvhboswI44lhg5UXXhDeQRHUzMAs+L0RuJd9n1WgoITK8Pq7
         wIKA==
X-Forwarded-Encrypted: i=1; AKwUvBw9DCtc84Nbm0X/nklBxVtIHqkevJhRqx9ySsy0+8RKLlwkd5ZgocaAFNGZMVbKoUhNwk6p3J6EKYFJ78f1@vger.kernel.org
X-Gm-Message-State: AFuF++lqKtC4wDFjqRe1Jwi1nGxUAFgeiQ4AcudTZLs2TQUI/uLfil4A
	FkGTgOgXL2IRCq6pwB2g6DKy00N9nfDPX5vNCxzGfQKhUAMELji/97aCsk4WzlwcnHLB9GEsdHk
	bCbVpNzib1Bh51N3iE5hCJUI4buXXNffAQcsz+ZtwgHivpBV0xMEuiGkwH/cMOQwtq+Cn
X-Gm-Gg: AYBFou0Za2YMwiAcEbdXi0cfh5Qq58/oqbOAdxaV5p7ax94snZOloYdlK0W9MVjSEZb
	2VSZBWvpGI6Z7Gx6E7FLqroenXDnWBB/1Ak6wY0b76H6ESCb5SJ+8NzZmxacu8U+hcAX4TMthjP
	CEDhXlBbiyQiTYhf80npNzKjQQRWmkkEjXfD/qUJLZ/nH1CHvzM3yqv5cIlvWXDlTadUwPtZmPK
	PV4VF3md3W4kI9C3/UQ9PUVxQMHB6vKO3GHfUzWzpenREOl+qH1LxA23u54vDySrPvXf94Meh/x
	QqfpK1ec39eWI1BLsAaUQnJu4i4rGRH5C6amN71itvJPJ1ytZFy6gKSELAJMNoUp2UZUQd0fx6S
	NwMPGHEuPScuMHGarhBahGhAJxDj1mYo=
X-Received: by 2002:a17:90a:d40b:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-3a0bb573f4amr2062390a91.15.1790345453384;
        Fri, 25 Sep 2026 07:10:53 -0700 (PDT)
X-Received: by 2002:a17:90a:d40b:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-3a0bb573f4amr2062342a91.15.1790345452588;
        Fri, 25 Sep 2026 07:10:52 -0700 (PDT)
Received: from [192.168.0.3] ([49.204.107.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91461d38sm11277345ad.76.2026.09.25.07.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 07:10:51 -0700 (PDT)
Message-ID: <b2befdae-09b6-4ffe-aa67-05d6172f4823@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 19:40:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dmaengine: qcom: gpi: Convert dev_dbg() calls to
 tracepoints
To: Frank Li <Frank.li@oss.nxp.com>
Cc: konrad.dybcio@oss.qualcomm.com, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        chandana.chiluveru@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org
References: <20260909-add-trace-support-gpio-v2-0-01f81739bb88@oss.qualcomm.com>
 <20260909-add-trace-support-gpio-v2-3-01f81739bb88@oss.qualcomm.com>
 <aqHIiBMVmuBKx6lM@SMW015318>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <aqHIiBMVmuBKx6lM@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1NiBTYWx0ZWRfX/Jgh69Fh8iHm
 iZ3u5XvwSu8sgTuhSREW4P+aOaps+z85xexhMomUK8vQeqbTiLF3oqsIkmm3qa0iBQ9W3cGu+oM
 kGRnTyjK7WXvyjhrRxavYMB5sjtDvJBJiAwrs2S1ut1d/fgAfwpCDlv1Pv0Vb18OOaRX7Vecoo1
 YPBie3/PRTl/VJ/SsS2xyK7U7O2fcrS13NYrHzneHQ4lH7ttZDzj1Uqg5B6lEs+lFKYROCSK7Eo
 V68unFpcabERMW8mEcLeSm1f9Mbc9WpmxzwWUTllXbUgNTs66qAKBEuOlcskm7GOhLPtJuh/mrH
 tY/HCx/2k8w9PKfzTpCBNQK2llm4xWJ+610ns1cnWit1FZ8lXzMEkGLA4V0Q5+6FAuEYbq/vkiq
 SiyQ56DlQnsXHKHnBoAUt6wemtD9wJZSlD0E4+7JTtdlG2xq5P+WOFOTWbu9kmizQYcswylfq3P
 ckFMSJoSUZUtzqbbRbg==
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6ab680f1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=LbQqD9KVPf5lhnc1gAYl9w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=d3xK7mIYCK7McAmqHKAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: M4vZA8BWWh-_jcTq7rfmFMuz9cUj70Hz
X-Proofpoint-GUID: M4vZA8BWWh-_jcTq7rfmFMuz9cUj70Hz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1NiBTYWx0ZWRfXzkK03CTP4ZBT
 LE1ZzZKRkfQwfDbIrlo0Bn3TWMQsW+VneoEPyMOuSUnyRcS1/h6Hh0fd7wBoJs4KsXYjK+Mo/71
 xhR4oSlqQeeSQjHXT2dpOYUAS8yii38=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250056

Hi

On 10-09-2026 02:28, Frank Li wrote:
> On Wed, Sep 09, 2026 at 10:39:43AM +0530, Praveen Talari wrote:
>> Replace the remaining dev_dbg() based debug logging in the GPI DMA
>> driver with the qcom_gpi tracepoints, providing structured runtime
>> visibility into GPI DMA behavior without requiring invasive debug
>> patches. dev_err() calls are left untouched.
>>
>> Tracepoints are added at the same points as the dev_dbg() calls they
>> replace: channel/event command dispatch in gpi_send_cmd(), error and
>> top-level interrupt status in gpi_process_gen_err_irq() and
>> gpi_handle_irq(), event/channel control state transitions in the IRQ
>> handler and gpi_process_ch_ctrl_irq(), completion event handling
>> (including the no-pending-descriptor and transfer result paths) in
>> gpi_process_imed_data_event(), gpi_process_xfer_compl_event() and
>> gpi_process_events(), ring allocation details in gpi_alloc_ring(),
>> already-in-state checks in gpi_pause()/gpi_resume(), TRE contents in
>> gpi_create_i2c_tre()/gpi_create_spi_tre(), and TRE queuing in
>> gpi_issue_pending().
> needn't this paragraph. The first paragraph is clear enough.

Sure, will update in next patch.

Thanks,

Praveen

>
> Frank
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/dma/qcom/gpi.c | 58 ++++++++++++++------------------------------------
>>   1 file changed, 16 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>> index b09354a73b46..8e7d25a46147 100644
>> --- a/drivers/dma/qcom/gpi.c
>> +++ b/drivers/dma/qcom/gpi.c
>> @@ -684,8 +684,6 @@ static int gpi_send_cmd(struct gpii *gpii, struct gchan *gchan,
>>   	if (IS_CHAN_CMD(gpi_cmd))
>>   		chid = gchan->chid;
>>
>> -	dev_dbg(gpii->gpi_dev->dev,
>> -		"sending cmd: %s:%u\n", TO_GPI_CMD_STR(gpi_cmd), chid);
>>   	trace_gpi_send_cmd(gpii->gpi_dev->dev, chid, gpi_cmd, TO_GPI_CMD_STR(gpi_cmd));
>>
>>   	/* send opcode and wait for completion */
>> @@ -797,7 +795,7 @@ static void gpi_process_gen_err_irq(struct gpii *gpii)
>>   	u32 irq_stts = gpi_read_reg(gpii, gpii->regs + offset);
>>
>>   	/* clear the status */
>> -	dev_dbg(gpii->gpi_dev->dev, "irq_stts:0x%x\n", irq_stts);
>> +	trace_gpi_gen_err_irq(gpii->gpi_dev->dev, gpii_id, irq_stts);
>>
>>   	/* Clear the register */
>>   	offset = GPII_n_CNTXT_GPII_IRQ_CLR_OFFS(gpii_id);
>> @@ -866,8 +864,6 @@ static irqreturn_t gpi_handle_irq(int irq, void *data)
>>   			u32 ev_state;
>>   			u32 ev_ch_irq;
>>
>> -			dev_dbg(gpii->gpi_dev->dev,
>> -				"processing EV CTRL interrupt\n");
>>   			offset = GPII_n_CNTXT_SRC_EV_CH_IRQ_OFFS(gpii_id);
>>   			ev_ch_irq = gpi_read_reg(gpii, gpii->regs + offset);
>>
>> @@ -887,15 +883,14 @@ static irqreturn_t gpi_handle_irq(int irq, void *data)
>>   				ev_state = DEFAULT_EV_CH_STATE;
>>
>>   			gpii->ev_state = ev_state;
>> -			dev_dbg(gpii->gpi_dev->dev, "setting EV state to %s\n",
>> -				TO_GPI_EV_STATE_STR(gpii->ev_state));
>> +			trace_gpi_ev_ctrl_irq(gpii->gpi_dev->dev, gpii_id, ev_ch_irq,
>> +					      gpii->ev_state);
>>   			complete_all(&gpii->cmd_completion);
>>   			type &= ~(GPII_n_CNTXT_TYPE_IRQ_MSK_EV_CTRL);
>>   		}
>>
>>   		/* channel control irq */
>>   		if (type & GPII_n_CNTXT_TYPE_IRQ_MSK_CH_CTRL) {
>> -			dev_dbg(gpii->gpi_dev->dev, "process CH CTRL interrupts\n");
>>   			gpi_process_ch_ctrl_irq(gpii);
>>   			type &= ~(GPII_n_CNTXT_TYPE_IRQ_MSK_CH_CTRL);
>>   		}
>> @@ -945,17 +940,10 @@ static void gpi_process_imed_data_event(struct gchan *gchan,
>>   		struct gpi_tre *gpi_tre;
>>
>>   		spin_unlock_irqrestore(&gchan->vc.lock, flags);
>> -		dev_dbg(gpii->gpi_dev->dev, "event without a pending descriptor!\n");
>>   		gpi_ere = (struct gpi_ere *)imed_event;
>> -		dev_dbg(gpii->gpi_dev->dev,
>> -			"Event: %08x %08x %08x %08x\n",
>> -			gpi_ere->dword[0], gpi_ere->dword[1],
>> -			gpi_ere->dword[2], gpi_ere->dword[3]);
>>   		gpi_tre = tre;
>> -		dev_dbg(gpii->gpi_dev->dev,
>> -			"Pending TRE: %08x %08x %08x %08x\n",
>> -			gpi_tre->dword[0], gpi_tre->dword[1],
>> -			gpi_tre->dword[2], gpi_tre->dword[3]);
>> +		trace_gpi_ev_no_desc(gpii->gpi_dev->dev, imed_event->chid,
>> +				     gpi_ere->dword, gpi_tre->dword);
>>   		return;
>>   	}
>>   	gpi_desc = to_gpi_desc(vd);
>> @@ -1064,11 +1052,10 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
>>   		dev_err(gpii->gpi_dev->dev, "Error in Transaction\n");
>>   		result.result = DMA_TRANS_ABORTED;
>>   	} else {
>> -		dev_dbg(gpii->gpi_dev->dev, "Transaction Success\n");
>>   		result.result = DMA_TRANS_NOERROR;
>>   	}
>>   	result.residue = gpi_desc->len - compl_event->length;
>> -	dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
>> +	trace_gpi_xfer_result(gpii->gpi_dev->dev, chid, result.result, result.residue);
>>
>>   	dma_cookie_complete(&vd->tx);
>>   	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
>> @@ -1100,11 +1087,8 @@ static void gpi_process_events(struct gpii *gpii)
>>   			chid = gpi_event->xfer_compl_event.chid;
>>   			type = gpi_event->xfer_compl_event.type;
>>
>> -			dev_dbg(gpii->gpi_dev->dev,
>> -				"Event: CHID:%u, type:%x %08x %08x %08x %08x\n",
>> -				chid, type, gpi_event->gpi_ere.dword[0],
>> -				gpi_event->gpi_ere.dword[1], gpi_event->gpi_ere.dword[2],
>> -				gpi_event->gpi_ere.dword[3]);
>> +			trace_gpi_process_event(gpii->gpi_dev->dev, chid, type,
>> +						gpi_event->gpi_ere.dword);
>>
>>   			switch (type) {
>>   			case XFER_COMPLETE_EV_TYPE:
>> @@ -1113,7 +1097,6 @@ static void gpi_process_events(struct gpii *gpii)
>>   							     &gpi_event->xfer_compl_event);
>>   				break;
>>   			case STALE_EV_TYPE:
>> -				dev_dbg(gpii->gpi_dev->dev, "stale event, not processing\n");
>>   				break;
>>   			case IMMEDIATE_DATA_EV_TYPE:
>>   				gchan = &gpii->gchan[chid];
>> @@ -1121,11 +1104,8 @@ static void gpi_process_events(struct gpii *gpii)
>>   							    &gpi_event->immediate_data_event);
>>   				break;
>>   			case QUP_NOTIF_EV_TYPE:
>> -				dev_dbg(gpii->gpi_dev->dev, "QUP_NOTIF_EV_TYPE\n");
>>   				break;
>>   			default:
>> -				dev_dbg(gpii->gpi_dev->dev,
>> -					"not supported event type:0x%x\n", type);
>>   			}
>>   			gpi_ring_recycle_ev_element(ev_ring);
>>   		}
>> @@ -1409,10 +1389,8 @@ static int gpi_alloc_ring(struct gpi_ring *ring, u32 elements,
>>   		bit++;
>>   	len = 1 << bit;
>>   	ring->alloc_size = (len + (len - 1));
>> -	dev_dbg(gpii->gpi_dev->dev,
>> -		"#el:%u el_size:%u len:%u actual_len:%llu alloc_size:%zu\n",
>> -		  elements, el_size, (elements * el_size), len,
>> -		  ring->alloc_size);
>> +	trace_gpi_alloc_ring(gpii->gpi_dev->dev, elements, el_size,
>> +			     (elements * el_size), len, ring->alloc_size);
>>
>>   	ring->pre_aligned = dma_alloc_coherent(gpii->gpi_dev->dev,
>>   					       ring->alloc_size,
>> @@ -1437,10 +1415,8 @@ static int gpi_alloc_ring(struct gpi_ring *ring, u32 elements,
>>   	/* update to other cores */
>>   	smp_wmb();
>>
>> -	dev_dbg(gpii->gpi_dev->dev,
>> -		"phy_pre:%pad phy_alig:%pa len:%u el_size:%u elements:%u\n",
>> -		&ring->dma_handle, &ring->phys_addr, ring->len,
>> -		ring->el_size, ring->elements);
>> +	trace_gpi_ring_info(gpii->gpi_dev->dev, ring->dma_handle, ring->phys_addr,
>> +			    ring->len, ring->el_size, ring->elements);
>>
>>   	return 0;
>>   }
>> @@ -1542,7 +1518,7 @@ static int gpi_pause(struct dma_chan *chan)
>>   	 * client needs to call pause only once
>>   	 */
>>   	if (gpii->pm_state == PAUSE_STATE) {
>> -		dev_dbg(gpii->gpi_dev->dev, "channel is already paused\n");
>> +		trace_gpi_already_state(gpii->gpi_dev->dev, gpii->gpii_id, gpii->pm_state);
>>   		mutex_unlock(&gpii->ctrl_lock);
>>   		return 0;
>>   	}
>> @@ -1578,7 +1554,7 @@ static int gpi_resume(struct dma_chan *chan)
>>
>>   	mutex_lock(&gpii->ctrl_lock);
>>   	if (gpii->pm_state == ACTIVE_STATE) {
>> -		dev_dbg(gpii->gpi_dev->dev, "channel is already active\n");
>> +		trace_gpi_already_state(gpii->gpi_dev->dev, gpii->gpii_id, gpii->pm_state);
>>   		mutex_unlock(&gpii->ctrl_lock);
>>   		return 0;
>>   	}
>> @@ -1703,8 +1679,7 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>>   	}
>>
>>   	for (i = 0; i < tre_idx; i++)
>> -		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
>> -			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
>> +		trace_gpi_tre(dev, chan->chid, i, desc->tre[i].dword);
>>
>>   	return tre_idx;
>>   }
>> @@ -1797,8 +1772,7 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
>>   					 TRE_FLAGS_IEOT);
>>
>>   	for (i = 0; i < tre_idx; i++)
>> -		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
>> -			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
>> +		trace_gpi_tre(dev, chan->chid, i, desc->tre[i].dword);
>>
>>   	return tre_idx;
>>   }
>>
>> --
>> 2.34.1
>>

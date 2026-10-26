Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792998410;
	b=XrIa/yYCXoJl57gRAS9H2JiquZEjAwJImvQ7fjdCyoNNu6lUX7RWU1bCCbLUpLrkRWJS
	 AMlPhQno/xTDjMS1ZGDqCPXKFCLlVuMRUg3l2xHZkuCo/ooaIAVcsGsSovu0odZjnQlP2
	 R5nxSCsk/RPZP3k37JrDlhGugc0rhNQqwm7Yz0wctYH4ZyT2Bbgj5pifp6rA1T/+FST0I
	 S55bpkRdMwnBy+s+QdSTbKFls+/zS9xwyzqn/wG/ZwQiqv5dsYuUtyDUrkvUEdDhgAT80
	 Olu8cDQl/jV3tNJHyif07cgSjMV8x7o86DUpK66UdLZi+M/hyVgHOLK9id8BHh7EzPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792998410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LACHu7oKfmE41jF5sp+MfYyJU/SxFmiy1at/NlNWtfU=;
	b=XLb7fsh5lVs3oSKmjvhXnxLbMu9+y/r/Vi4fLm+I74cYymb4Ys5158X3cA1Do3X2AwFA
	 pnvnWQ0JvBSCtkzwxIRHNHMDny4dR2UtCGFQn7/gIhI6DqdTMRXPwAKCf8bi8EPsFgRJ9
	 DQVvrhKuV3+r/3IYXOjVG9rndoGaEaemAh2RTuJtc+vVszCAEw0l1JZVzY2yLwuGI+jX4
	 o0mNxTRWgit3eHfC1rEcURSr6fEcNGsBbVyzcJMQ4hVinCZvihOtL80Cg9OlLbU7A8/77
	 tehB7FbWynZm9W2hhoVTiZSl4vntPh92PFxtKu1GLhkO59dx4a4K+DHBDnfffifs0sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPUVN+oy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FZVJGxMo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67372606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 07:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67372606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPUVN+oy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FZVJGxMo
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4ar6q3303599
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 07:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LACHu7oKfmE41jF5sp+MfYyJU/SxFmiy1at/NlNWtfU=; b=LPUVN+oypp41UgYo
	YKB5MUPrcJn4wIXAteNamG2ccCJykFAFgLk79bcBlPFU20WT9AKuKq06fI3FQH8n
	yudGHlKf+G2TrEoGRU1RFXb9IWFJaxd19Wg0uIgytNgKq2Ui5bnFwiF5e+t9pwHi
	OftpA82p68kRtbADY3FzUu4nTpXXq339prUwoUZOTJfLkDhbCZ83+mvsjJdDJymi
	wtjkiL+Xv28eq+dHFgZhX2OwLmJl8tdWrtuENsMHWCR0pBtH8Mforp+o0LEe/XMc
	8JtUKlebd56U/R9ztCMKcFHPwk1JcA//iyFkC2GtiCXVxkRLb/oefHf6DNhoHFBL
	LHzkjw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkmsd9qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 07:06:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so2452837a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 00:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792998407; x=1793603207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LACHu7oKfmE41jF5sp+MfYyJU/SxFmiy1at/NlNWtfU=;
        b=FZVJGxMo9la8WYPubjksKYk3S7fJ9KkEW3gAeRRLRxINlXC/Twhfr8wulzBxFbpLsB
         y3F0lv+gXhZsjtJgCEHukXz/lGO9w5WuazGUQyG0YpJzAl/S3vQUV9FcXJgb5SOJzSpz
         G/+RmMcExo6Nw0w0lg830j7Pvu8Qpaz33f5fevo4JgSb9FG9FbuN3/RxLvdLOer6C+WY
         mYVuCYyorLOiOnLgwQE5TZIVN7SJCFFiHVmmDutiB1DcJ1rlH2DVGjrJY1jfsgSYbeX0
         gPbsWvorQ9xNL1w35cudgkJIuijv/6070/RT4LBYp/4ocMvBVDLHj6DuDJPA+lnNtiIy
         9d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792998407; x=1793603207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LACHu7oKfmE41jF5sp+MfYyJU/SxFmiy1at/NlNWtfU=;
        b=BJEya2bRydguGuGzw4nJ1XKOxTsYl8VMcTPWB1Qh1JZ+oESHaQWCYVAaMDM8ThfaVN
         pKSrCeSnp39hvrm0Ir5cS+ZiuMo7nfCIAxM7SqpdyGIKuzzd2Xg2GeB7mO22bXPqURQl
         kaKPqVjvrW569ceNXQueH0fCZymapV/poO4nCVwBhJDdskqUtk4wTd5NlBEMeTP+YnZK
         Q4x6YR2S9epR4JeldipBj1q9OrmEnP4kS6oWO49lQd4M1+su4gqEfwbZ7uCWxBmLYYpA
         dVMLrmD6LsPq+9ouPTK+f6Zeswhcf4OxUgkgnAjpnSu+fpRWabGZ4TjfI+sxYw4R/YpC
         mXvA==
X-Forwarded-Encrypted: i=1; AKwUvByFcoYKwN4Fkk+YvCV6mr8WMK0Fl7Txo8BuZmoxrK6E4lTXT4gMC8t06NMf/Ua5Cp229RT9hMr/qUgQP8W3@vger.kernel.org
X-Gm-Message-State: AFq9FYIdl+bpTDauQg7CKoylTUM6XtEcFbPvaq4ZNkyUMAd1sfIX97a0
	L5amu49h0PG8LNjwECAfeVx5C4ag7xI91+3d4eKmJK8JoMZvYglWign1ZNY2CfS6MuUq/Fv1mpd
	VOg1bS5H/Q3PC+uLn1wLm/OwLGE6dGTsd3la0gst1N27E01NA5kWWjrxCf12HHylxolfm
X-Gm-Gg: AYBFou3gIRZW5K0q3ettHt7+CZ3/HghR8giLaEJUYTfTAmhA1gWqzU4dykz8ykGs3jA
	GDh5E8zbJ+IAPdCBE6iRtkSR3CtZpOsTdUyvo4ahWaZoUoItaR18KwjHQHagRUOUr0uaHvycYZ+
	5Iprs/JnitGIkwBI5GFWLxbpbMKIe/L733R0O4OqwC9qz78lqh1nuUlJuDvp0FdmkBVyWWZsggE
	Y/PhuPqm2tb22is0l8tvPJY7YdA231dLhHS43IYtHZRqm6lYIJ/y5LviXt5MHOEYIaVBCiUls/7
	Nk/bC7CQcNnNBdV+CaMls7bYAQofUhGcrkuoNNC+DmlyNRr7dJpY331rFw/ASrc5wQjt2ZecXP7
	HJO3CmIsTn2+ZYrIuoHcIVkYTAG+fwQ==
X-Received: by 2002:a17:90a:e7c8:b0:3ad:77fd:c3d8 with SMTP id 98e67ed59e1d1-3ade9a3644dmr5600088a91.1.1792998407072;
        Mon, 26 Oct 2026 00:06:47 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c8:b0:3ad:77fd:c3d8 with SMTP id 98e67ed59e1d1-3ade9a3644dmr5600067a91.1.1792998406269;
        Mon, 26 Oct 2026 00:06:46 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb0718esm6949365a91.11.2026.10.26.00.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 00:06:45 -0700 (PDT)
Message-ID: <57158d21-44ca-4776-8fcf-313d583b340a@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:36:41 +0530
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
Subject: Re: [PATCH] serial: qcom-geni: Add tracepoints for SE reg dump
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20261019-add-tracepoints-for-se-reg-dump-uart-v1-1-1fb47b1605b9@oss.qualcomm.com>
 <2876c850-e2d0-4ee4-9d8f-50710c371a49@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <2876c850-e2d0-4ee4-9d8f-50710c371a49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MjIGbOFEzz7QFtgTkt0QgIQKHVnzlE2x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyOCBTYWx0ZWRfX/a/lVhRFtWBF
 PrDhrQXrJLWFO1NyjbSs45ow1jq5cF2RHuiSL8C8b78uJTDpiw4VO5TxbqmmwZ0G2IjfPazLdNc
 3p0WIeiWC79x4w0RyYw3qC0Ps5hTsmibA1VMCVZJ6JC6zU9mivWzvymdbY3P5eH2BfhW1G8U15R
 5x0OqleFpBW9YaQwmOinyjV/ZMeOJEpdiYUlBZ7OWHVo6qW3SukXjIerqIsb7UVd7KFtRFJ7bLw
 O9mLoX59feEzCNzVPbT5JHmWx5qtnNb5Wt5/SVok1aAkuw/fX0nJQU0Fv0JqLwZABTOgrkvUuuT
 E8bVouE92ZKl9wVvpE5B8roRkB0Ts8Uk4UcLyAivPqyDbjbKZ6L/djk36YululmFHWnzr6ojGBJ
 E83NukbK/eTtH2r+7UAgu0cs/lJqBfDS6TPWHC2roOGnh/C/AA1vleJAZx+aYii83jir3WIiHlz
 K9Ktm97yELtXkwvhBeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyOCBTYWx0ZWRfXwjhT71Z8O5Ys
 EqrN7cq86AeUUHE8kZDXV3jWiYELfABFjvtOVzFLCQTmUQZZpuTpFdcF1d2pvdW0y0kJrVgLWD6
 cLffm6vPX0CWVcLmYvrxoH1HXQ/Pma4=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6adefc07 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zCML_R-7N-o1qndpGR8A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: MjIGbOFEzz7QFtgTkt0QgIQKHVnzlE2x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260028

Hi Konrad,

On 23-10-2026 17:32, Konrad Dybcio wrote:
> On 10/19/26 5:32 AM, Praveen Talari wrote:
>> The GENI serial driver reports various transfer failures such as
>> M_CMD abort/cancel timeouts, DMA TX/RX FSM reset timeouts, RX FIFO
>> write errors, illegal command interrupts, and DMA parity errors.
>> However, diagnosing the root cause of these failures is difficult as
>> the hardware state is not captured when the error occurs.
>>
>> Add trace_geni_se_regs() calls at critical serial error handling paths
>> to automatically capture GENI serial engine debug registers when
>> failures are detected. This includes:
>>
>> - M_CMD abort/cancel timeout
>> - DMA TX/RX FSM reset timeout
>> - Unexpected zero-byte RX DMA completion
>> - RX FIFO write error and illegal command interrupt status
>> - RX DMA parity error
>>
>> Dumping the SE debug registers at the time of failure provides
>> additional hardware context and significantly improves post-mortem
>> analysis of serial transfer issues without affecting normal
>> operation.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> The commit message should mention the additional logging changes
> too
Sure, will update in next patch.
>
> [...]
>
>> -	if (WARN_ON(m_irq_status & M_ILLEGAL_CMD_EN))
>> +	if (m_irq_status & M_ILLEGAL_CMD_EN) {
> if (WARN_ON(m_irq...))
Sure, will update in next patch.
>
> Konrad
>
>> +		trace_geni_se_regs(&port->se);
>> +		WARN_ON(1);
>>   		goto handle_rx;
>> +	}
>>   
>>   	if (dma) {
>>   		if (dma_tx_status & TX_DMA_DONE) {
>> @@ -1270,6 +1285,7 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
>>   			if (dma_rx_status & RX_DMA_PARITY_ERR) {
>>   				uport->icount.parity++;
>>   				drop_rx = true;
>> +				trace_geni_se_regs(&port->se);
>>   			}
>>   
>>   			if (dma_rx_status & RX_DMA_BREAK)
>>
>> ---
>> base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
>> change-id: 20260927-add-tracepoints-for-se-reg-dump-uart-30d93639447a
>>
>> Best regards,
>> --
>> Praveen Talari <praveen.talari@oss.qualcomm.com>

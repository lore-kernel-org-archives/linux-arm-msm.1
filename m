Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E2B3DA5D9
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 09:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306158; cv=none; b=T3UK7zQn19EC1bYnwo3Evqf0ldDVsycnlXG1eIpBLBjFQeNfzZ9VIkFtDAXVzlQMXzlo5GtycGCprPalgLnl++iHtA7EIFrehNnDxoVBv2IHjt7NfSJCZf0Srd9YEVMig8XQBy37iM3mQGIO9NH5cMYe3Xhs3+MjTP9IPAQxqLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306158; c=relaxed/simple;
	bh=h07MlbR4zpwjxk1OAWIHqfGIVg0JNyAMUwKv5muQyC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3xjeVPk8AqdhM+97yNEV+nbI2jynmxzOgj3GXHMoBE4m1fsFp+VtjHb1y1MEPrRULnZ+6DQHWiYiKD5bz6ZCK0mkLU1oJ8ylFPU5oLri94w0VwJvee4plk5VBZQNggILF3HG3hIG7P81QMsqSQI/FeeBksQH2lrfjNgS1FIaYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HuwVBfZ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfIFkBV8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HuwVBfZ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfIFkBV8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9Lq861025265
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 09:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VClMmOILbaRk+It2Uje1g6EoFtr+YGAAo4jOnTeOag8=; b=HuwVBfZ1duPyEjjt
	dPngyi0yTgWEG8Y729IwKskVbWUs5XdoAVXjCKqw2QpTRwmJc5uKMT1IBJ/0djD+
	HxSANLg3PUwV3iXyp1/NomBIn0s3R9/Yf0ky9BOrWeOCCbZscnEzF8FYf14JY4Rn
	chkUS0Sz2rh9BRFplc7sTVqZBhlFe5dOoB48FQrpJ3AfA99z3tAihTFkWKIxH3j9
	/h24T24r0fe2It0mf6Q5gkBX/+9hqNfTUUiq+6ZbXrevS/dF3OsnJjpwQQD2yPYi
	ARJNIL6UhVpmRHIqk1dfhXOVRbrRcc3SLjpc2aqpxMj9tFmgqqvmcEuCi/wzTRry
	kQ7Vsw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gde8xub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 09:55:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso1149612a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 02:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787306147; x=1787910947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VClMmOILbaRk+It2Uje1g6EoFtr+YGAAo4jOnTeOag8=;
        b=KfIFkBV8Ra5HngmuiqLt6Kdp3hupoTJo/w+Rdnee4wwpv1F0QAVBGLBFljolixuNuC
         2rX6soqNEeLCChc0lBGCmcaJBfj8k4QOywuWd7wpvKThweLhxC+NeW51c29hKK0dFJai
         oDWkC8pzhiTvrOdi9pvn8S1AGnHHi5vdIbqNiBFfD9smH4j4hbTGC/vpugpbniPo0FNf
         GI5S/K8nVDesHLC+rmicfiw07fX7C7F51sfSEYSNh/LZIyUo9We9wu/3Z0Q1fRpcAqWD
         gWOnIV3b11MTmPASFD/Sk3fRVquI/cZrDLvPVNr0A/hKxKzBQxRx47ohbKaMpdP7Wmyh
         /QiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787306147; x=1787910947;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VClMmOILbaRk+It2Uje1g6EoFtr+YGAAo4jOnTeOag8=;
        b=HvsgxY4sdHjwLDSA8Kdx5IVJqLx2V+gqw4ZG3Xbb8H39hpAdBixh2/rTbLdy347X0P
         Ul17qne4RYVRbRjv+biNqoPof/hHDHUbyByV8K5qO2ovJKexwS05GvAzTUQuaYgUvUNk
         PLG8xKlGUZqEVQWsJFVQHlsic/OtFiKYzXXx74q60PpkKMxzmHTJMAmCJ00z2pHcd82B
         Sa6pC7AjUkEkb0YVBYmQMOhJo/25BaZw1Ox4Zr5i4nU9y200tiWjrjyFJIdwoN074WEO
         DCR+YBT7L1hZIP8KiDedfsDviBj9gOJQrexQEtcgI+EWXtT+qiv+RHLhJgA8UmfAWisa
         d1Dw==
X-Gm-Message-State: AFuF++kl8ygd+TFegsmxI8pENCtkyPKe52x49UzUgfT19cKJ1LTHabU5
	GRi84HBjF66HA/AE6Rszlsu41oN5bmjFTyCQLge6J2NXSoZqUSuGmZrcXxq/YdIzzaiF4uLHEZC
	fGDfvN2N4NhEHI+wWJWJ63HtZavURS+k4ti774fieoAz5l8Mm5gWgw+G7Qx0dIfCWgLk5qvJPQu
	09
X-Gm-Gg: AR+sD126nVVl2T2z8jqHDFJabPaB7MR+hDrKzf3b+RvJ4YLQgHRddHYScP1fr16T0OV
	EglgTKrreW+yW/ez3OsY4/H17nY6Z0DtvqJnDx0Jc3cSCzyIkHwTw2qSvTXQOQaOfr5nVQ4GBxD
	2HNPOJph139g9HmsHZEOeuql2FXPwfJL85/ym7y+Mplrs5PXf1DKO+rsgrexyzb/MCN8221WfKX
	OI8TGQAgcABDD89fYt7cdmy/SP6ODjigUhiMvuMO5WgbBu+vUey9w2AvePyTEkycGwXWkak/jMi
	oP81LWk3lFTyNktZs3xaFSCD5lXJfGYL1WIGkkRM9LQbwB54Qi6Oq4XRdySbxdCTXzY9uwDFErP
	3jid4jslq+q4NMUIvP+E/E5EFuR/bjBo=
X-Received: by 2002:a17:90b:528f:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-395c35636acmr10037767a91.7.1787306147444;
        Fri, 21 Aug 2026 02:55:47 -0700 (PDT)
X-Received: by 2002:a17:90b:528f:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-395c35636acmr10037590a91.7.1787306146553;
        Fri, 21 Aug 2026 02:55:46 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4be47d7sm2437968a91.9.2026.08.21.02.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 02:55:45 -0700 (PDT)
Message-ID: <b117d9ad-7fa3-4130-80cf-d7cfbee20fba@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 15:25:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] spi: qcom-geni: Add panic notifier to cancel and
 reset DMA during panic
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, chandana.chiluveru@oss.qualcomm.com
References: <20260818-add-shutdown-and-panic-notifier-for-spi-v3-0-8b62c4bc2d21@oss.qualcomm.com>
 <20260818-add-shutdown-and-panic-notifier-for-spi-v3-2-8b62c4bc2d21@oss.qualcomm.com>
 <54e4fa7b-9a95-4871-94f9-65ac55688f7b@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <54e4fa7b-9a95-4871-94f9-65ac55688f7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BcroFLt2 c=1 sm=1 tr=0 ts=6a8820a4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=01GmVmAJTjHGYBpbkKwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: QuRBxLJxGv3MHRJcUP-lf0LwI11_Owdy
X-Proofpoint-ORIG-GUID: QuRBxLJxGv3MHRJcUP-lf0LwI11_Owdy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3MyBTYWx0ZWRfXzTD+h+2Bb5/n
 kRvzKsGBbvWsJxcnmZYkZ6yiGcduDNoaAGgvKM9GgB1KLKK/2xlf48tS1qd7ZDKiBNZUs6kQ2H8
 BZwQadP86jB9h3ao3hnjYohCjfEFfm4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3MyBTYWx0ZWRfX8on43VVq/ZI5
 sWYbdeWuK/ZRkUEbuVRiAbh7c+snSvlNrx9lJ7OCOjMrghDCw0pLEWQ+oBbthlGDUYKQupFRvQN
 HEUGD7QKu0yISx2Ov3It32VHRrz4VzeRahFlnMF+Zpr72Nl+uqPgBesE7omcgLukxGsOT6cwmMJ
 yD2Tag+IBT8k+yZ0Lt7q47McLONjJSAyA9LLXQcotj9dj0pKFO2K3UeWFCVLHXitxLFj3ABF8Oq
 Iq6lv9J8VCo9WS3gSyYz+Gt3gru5gxTuSlasgn5JWqmoKA4UTYmkm7fsMZjyksHN7XII6lzMUkh
 Gap7c0GTrkMEt1NZ7K4DopxH0nsp87Ik0rlVnF18AOQUrWc290gPU4w8tl7kMc9zHVuRhbUFWna
 C7XcWpEUCZ2t8RqnJnqBvmdzJIe1yMuGGTDlUlYKYUBNsFoUsKR0YvdVr5D3IGPfZEJuBKKm1gy
 eX1oqDOdsELhP3UB+iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210073

Hi Mukesh

On 20-08-2026 01:02, Mukesh Savaliya wrote:
>
>
> On 8/18/2026 6:58 PM, Praveen Talari wrote:
> [...]
>
>> +static int spi_geni_panic_notifier(struct notifier_block *nb,
>> +                   unsigned long action, void *data)
>> +{
>> +    struct spi_geni_master *mas = container_of(nb, struct 
>> spi_geni_master, panic_nb);
>> +    struct spi_controller *spi = dev_get_drvdata(mas->dev);
>> +    struct geni_se *se = &mas->se;
>> +    u32 val;
>> +
>> +    if (!pm_runtime_active(mas->dev))
>
> Not completely sure, but why not NOTIFY_DONE ? we haven't handled 
> anything here.
My intention was to treat this as a successful no-op since no action is 
required when the device is runtime suspended.
>
>> +        return NOTIFY_OK;
>> +
>> +    if (mas->cur_xfer_mode == GENI_GPI_DMA) {
>> +        dmaengine_terminate_async(mas->tx);
>> +        dmaengine_terminate_async(mas->rx);
>> +        return NOTIFY_OK;
>> +    }
>> +
>> +    if (!(readl_relaxed(se->base + SE_GENI_STATUS) & 
>> M_GENI_CMD_ACTIVE))
> Shouldn't this be under FIFO mode check  ? As i can see SE DMA mode 
> and GPI mode conditions present but not for FIFO.
This code path is shared between FIFO and SE_DMA modes. The DMA reset 
sequence below is only required when the transfer is operating in DMA mode.
>
>> +        return NOTIFY_OK;
>> +
>> +    if (!spi->target) {
>> +        geni_se_cancel_m_cmd(se);
>> +        if (!readl_poll_timeout_atomic(se->base + 
>> SE_GENI_M_IRQ_STATUS, val,
>> +                           val & M_CMD_CANCEL_EN, 10, 50000)) {
>> +            writel_relaxed(M_CMD_CANCEL_EN, se->base + 
>> SE_GENI_M_IRQ_CLEAR);
>> +            return NOTIFY_OK;
>> +        }
>> +    }
>> +
>> +    geni_se_abort_m_cmd(se);
>
> why abort is done directly for target device and not for master ?
> shouldn't be combined with cancel failure ?

The target doesn't support cancel.

>> +    if (!readl_poll_timeout_atomic(se->base + SE_GENI_M_IRQ_STATUS, 
>> val,
>> +                       val & M_CMD_ABORT_EN, 10, 50000))
>> +        writel_relaxed(M_CMD_ABORT_EN, se->base + SE_GENI_M_IRQ_CLEAR);
>> +
>> +    if (mas->cur_xfer_mode == GENI_SE_DMA) {
>> +        writel_relaxed(1, se->base + SE_DMA_TX_FSM_RST);
>> +        readl_poll_timeout_atomic(se->base + SE_DMA_TX_IRQ_STAT, val,
>> +                      val & TX_RESET_DONE, 10, 50000);
>> +        writel_relaxed(val, se->base + SE_DMA_TX_IRQ_CLR);
>> +
>> +        writel_relaxed(1, se->base + SE_DMA_RX_FSM_RST);
>> +        readl_poll_timeout_atomic(se->base + SE_DMA_RX_IRQ_STAT, val,
>> +                      val & RX_RESET_DONE, 10, 50000);
> May be good to declar macro for 10usec and 50msec ? Multiple places 
> it's being used.> +        writel_relaxed(val, se->base + 
> SE_DMA_RX_IRQ_CLR);

Let me review and update.


Thanks,

Praveen Talari

>> +    }
>> +
>> +    return NOTIFY_OK;
>> +}
>> +[...]

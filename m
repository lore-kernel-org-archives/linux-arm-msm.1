Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52CE4D17A2
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 11:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545379; cv=none; b=c9QVntTToOOQU3OiMefKxGEz2BV4Q+ES2VBbY+kptWYydPxBUBcTkbQ0vM2VkX5r62VsXTXTBe7yXdoi2NEiZ70z0bh8UHt7q16Wbzdzr41NbZvhl7kAK4gbNKMyoBYSE+k/nZzgJct1j7Pks1SPbm6Kt/AT+DnA7Jlk2UB0D7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545379; c=relaxed/simple;
	bh=EdixUANFHy2W/LiaSAuiS/Tx+42OwOUTMhGj/CqPQx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HJC8RyWzOfMB6RivuRnlJElDPDM9kvh0uPGJxpw8emboLo+VOBlnffgD4WY/LFHblK0QcOoahHW/rgSGPcwr2Ko7mZgJWKkikzmjtQpToNOTiXFeSP9EQSjZt/IlhmXUvqIwT+Zqm8QOdTjzZVGcn1lQe1L2d+wTdEG373eg0T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUSg7DTW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=irZlwIX+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUSg7DTW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="irZlwIX+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KOeH3977823
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 11:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	haBBSODWucHm3mmfANsuSegkfg8lAA0orynM/G8N+1k=; b=SUSg7DTWdbMS5wrU
	TY0KL30fXocj8trQ5oSlOSkx3Sze/QVQEUmFZG0yzUFKJ8H7nlJmGFHjEwoY0g02
	X7BD3wjAMya4H202Xa09mDai+GN4NSJOcSZ1BKtQlvCjCmQT6gZC4vxQsA9uTcNv
	j3kuu2kKW9Dc8YSGcMqLPm44Ye2hElOV5gu/uk1tdW+3WSvylWUI2bIOvnGPnbFY
	LXs48Mr4Pq/yriK8w9dVrk5IH4TJFe6qbgCnp26TT1q0+LMWPN7WV7J86N1VU+uT
	ueMZEAHmj09DQoEd8Z2XWfxkqNZEyYO/y9dULU+2DuyvLL+Ia36DwETh6vM7Kn3Z
	zmSkLQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev5bk0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 11:29:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so12273881eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 04:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791545362; x=1792150162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=haBBSODWucHm3mmfANsuSegkfg8lAA0orynM/G8N+1k=;
        b=irZlwIX+VSPOrfDOu5BRox8EMuZ6tpfa8eF1nOt1qy/ymZ1oMXBMeabnUWBgbU5ftB
         8NAYWED/HTkU4d3aJ0KemgmsvyOyZ5Lr1A5eMw4S5RRkzz18kpBB5HutU3IHy5fwCMs9
         mPpuapg5w5TqJP755THlKnRoeq4KfZjK2UqfVD7G8zuupiqKSSG8/WCCToz8Oq0Ymhiz
         GzqoPWLRkMH9JHK00cHhW68TXTzfQ3a55FLws683/nelVo5ucM0l5U7HNo8MytSGtsty
         qxoQdEfvop0H0w0HHpGHewXuh+0B27yKuGmG+bwyLedPJ3SobAh9qWlTc0DoLL8d5Ji4
         pAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545362; x=1792150162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=haBBSODWucHm3mmfANsuSegkfg8lAA0orynM/G8N+1k=;
        b=fN59wde/Mny8Ren9s7ALIHk+U6Bek9GJKAB607cxnPfJmIB6bgO9Ok/kuqk0n7PxCN
         I7VF/R5BfMbKvGeOas64CpJVKLz5jQ3lPgAcaB6q8V/jXXbNK6z9V/1mYJrmKTbKxWYB
         NhxjcowJFx7g9DlfJjlUYW+WQDFQgxdy7VD2ikuZrP8UJqarIfgrC4KXLYM7VeSPd87B
         Vm2K9pc5RvTUwNg+iIapwoN/MExBHIb16IishSJt+dNpbbVtY0ox7EFObzRNhUcwlNst
         Tqg4RydYOP+b4qWVTAeDfEcOVpVdvMI0YebHGtQTG47qrS1WbEcEMtvRtgAEBpe8GJsc
         QvGQ==
X-Gm-Message-State: AFq9FYJEH5MIIWm/ZFfAE8OLnRVN8hfWgryP8ADZoKj+BiEckhC3NtJS
	29MC3e5oegdOxvq4KSLjyIJPQHNbEZIMNPPU559byEpHC5GRByCyMuLGWvVQHcog2/ecNpLT4KG
	OkisOOnxS1jD9zLUiNX7YMvLW81+Qvm65Hjv/O3BPu4KoJ8SEPbAs8Ag9zXpB15Tbn43e
X-Gm-Gg: AYBFou1e69nMtrOjLIYm4RFJdVW6jykOj6Ha0XUma6ze90q34Rd3+3q79afTYKJJPqE
	t21LXBJUUlkoAB4xWW9+ovxxqctopLPY10ije4muPYFkC6jhA+VyD2R4QTPQFvHkLdiEP9nJuuR
	z7Yn4iGj8VbOdb2MLk8VHASVqtBwisgLFyj+jIH21Xn8KN3MTJqWXPsdscjjVK7gri5iCiMMS3O
	ecfPnFU5XwfcRaNqj47ayHH3SUXBoACsG2s1C9IrEGX4sGLUJUcmvMH6JsSjCCb7vTkXcshNeTh
	8rdPJeTF+CsbYb/r9IeGKn2B862GSDxHvf1QPd8jRJ1nW9x78/Jsx2lcPNiOCkQAFW6k0cBFIaU
	WCGE1BgO+JJx12YOx0DA/TH3g5sb9O7Ye
X-Received: by 2002:a05:7301:db14:b0:351:757d:71bd with SMTP id 5a478bee46e88-3537e05b78dmr2342397eec.24.1791545362016;
        Fri, 09 Oct 2026 04:29:22 -0700 (PDT)
X-Received: by 2002:a05:7301:db14:b0:351:757d:71bd with SMTP id 5a478bee46e88-3537e05b78dmr2342354eec.24.1791545361310;
        Fri, 09 Oct 2026 04:29:21 -0700 (PDT)
Received: from [10.217.218.111] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1cc25sm8169040eec.8.2026.10.09.04.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 04:29:20 -0700 (PDT)
Message-ID: <c8d61771-1eb5-435f-a4df-9b585e4ef620@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:59:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com>
 <20260826-i2c_bus_recovery-v1-3-203f0ec76f84@oss.qualcomm.com>
 <7cc05c51-811f-4949-9fe6-10580ff90eea@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <7cc05c51-811f-4949-9fe6-10580ff90eea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0NSBTYWx0ZWRfX2AvkepQHjdV5
 +37/ISpMQKvLEHbL2P2rj1vwrtDzhSZ7qOk38dNvJD/KOZsVspED02A4QU4MGU4jcmG5qwGgzZT
 sX3F93VBYWG/Tqsywi0EtgO5rrg9COo=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac8d012 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RhFRd_MFMwiQnDz1XkEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: gqyBTckJCxUqoFCeKepzvxwIlL1HrDRf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0NSBTYWx0ZWRfX0QmR0UMeqthH
 vUi5ow3/LpvEGvOr/pVP2zIXK3cVr6itKaEWtv4t7yu7TwraNpJBImffxutWxeCZkQ9T4OcyHYc
 ZNRYuImFfkDZnjI5G7Pcfe2WIpnrEb7dTg87zsBw9rQJiJFOo6Ugr37mSs2tiL+MlmLTOxqIhDD
 /3S5MKtthH1E6OUqZs/vcXEtgbO0IWSyEBpeEq1u0LJyZ0qpZrH7BOCSvMb3TSaeVTeIwneGdsU
 lBQpMYMbHAWcbQY2UaiGpc1VQh4gxplOvDdT5OcwIW64tsuJJCNfpApyOMaR5/C52/uGD8sUfJU
 e/dfo1vAqtCA46wQnbO38CimPOS47qUjASWJKuB5Qu+LkXKUC9yjuAskyTAAlxILBx8Vsh995vI
 P4zBhCsLvWaMyExzKL57Plt54Lj6BJB5oK8kKCkqCnubOXh9yvaaaz30vNOh66Y1ceX9ram42o+
 CCsybSpoEowXwLw4p8Q==
X-Proofpoint-ORIG-GUID: gqyBTckJCxUqoFCeKepzvxwIlL1HrDRf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090045



On 9/3/2026 9:44 PM, Jyothi Kumar Seerapu wrote:
> 
> 
> On 8/26/2026 3:21 PM, Aniket Randive wrote:
>> I2C transfers in GPI DMA mode can fail with -EIO when a target holds
>> SDA low, leaving the bus stuck and preventing subsequent transactions.
>> The GPI completion callback reports a NACK and a genuine bus error
>> alike as -EIO, and the existing recovery path switches the SE to FIFO
>> mode which is not valid in GPI DMA mode.
>>
>> Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
>> opcodes issued via the GPI TX DMA channel. Guard the -EIO recovery
>> trigger with a SE_GENI_IOS RX_DATA_IN check to skip recovery when SDA
>> is already released. Extend the recovery callback to dispatch through
>> the GPI DMA path when gi2c->gpi_mode is set.
>>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 104 +++++++++++++++++++++++++++ 
>> ++++------
>>   1 file changed, 88 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>> i2c-qcom-geni.c
>> index 9fa1a8ac400c..85cb1367958c 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -34,8 +34,6 @@
>>   #define I2C_READ        0x2
>>   #define I2C_WRITE_READ        0x3
>>   #define I2C_ADDR_ONLY        0x4
>> -#define I2C_BUS_CLEAR        0x6
>> -#define I2C_STOP_ON_BUS        0x7
>>   /* M_CMD params for I2C */
>>   #define PRE_CMD_DELAY        BIT(0)
>>   #define TIMESTAMP_BEFORE    BIT(1)
>> @@ -1003,6 +1001,70 @@ static int geni_i2c_fifo_bus_cmd(struct 
>> geni_i2c_dev *gi2c, u32 cmd)
>>       return gi2c->err;
>>   }
>> +static int geni_i2c_gpi_bus_cmd(struct geni_i2c_dev *gi2c, enum 
>> i2c_op cmd)
>> +{
>> +    const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>> +    struct dma_async_tx_descriptor *desc;
>> +    struct gpi_i2c_config peripheral = {};
>> +    struct dma_slave_config config = {};
>> +    unsigned long time_left;
>> +    unsigned long flags;
>> +    dma_cookie_t cookie;
>> +
>> +    config.peripheral_config = &peripheral;
>> +    config.peripheral_size = sizeof(peripheral);
>> +
>> +    peripheral.set_config  = 1;
>> +    peripheral.pack_enable = I2C_PACK_TX | I2C_PACK_RX;
>> +    peripheral.cycle_count = itr->t_cycle_cnt;
>> +    peripheral.high_count  = itr->t_high_cnt;
>> +    peripheral.low_count   = itr->t_low_cnt;
>> +    peripheral.clk_div     = itr->clk_div;
>> +    peripheral.op          = cmd;
>> +
>> +    if (dmaengine_slave_config(gi2c->tx_c, &config)) {
>> +        dev_err(gi2c->se.dev, "dma config error for bus cmd %u\n", cmd);
>> +        return -EIO;
>> +    }
>> +
>> +    desc = dmaengine_prep_slave_single(gi2c->tx_c, 0, 0, DMA_MEM_TO_DEV,
>> +                       DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>> +    if (!desc)
>> +        return -EIO;
>> +
>> +    desc->callback_result = i2c_gpi_cb_result;
>> +    desc->callback_param = gi2c;
>> +
>> +    cookie = dmaengine_submit(desc);
>> +    if (dma_submit_error(cookie))
>> +        return -EIO;
>> +
>> +    /*
>> +     * cur and err are shared with geni_i2c_irq() and the GPI callback
>> +     * i2c_gpi_cb_result(); both write err (the IRQ handler under
>> +     * gi2c->lock). Reset them under the lock before issuing the 
>> transfer.
>> +     */
>> +    spin_lock_irqsave(&gi2c->lock, flags);
>> +    gi2c->cur = NULL;
>> +    gi2c->err = 0;
>> +    spin_unlock_irqrestore(&gi2c->lock, flags);
>> +    reinit_completion(&gi2c->done);
>> +    dma_async_issue_pending(gi2c->tx_c);
>> +
>> +    time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>> +    if (!time_left) {
>> +        dev_err(gi2c->se.dev, "timeout waiting for GPI bus cmd %u\n", 
>> cmd);
>> +        dmaengine_terminate_sync(gi2c->tx_c);
>> +        return -ETIMEDOUT;
>> +    }
>> +
>> +    /* ARB_LOST and BUS_PROTO may be expected during recovery; treat 
>> as success */
>> +    if (gi2c->err == -EAGAIN || gi2c->err == -EPROTO)
>> +        return 0;
>> +
>> +    return gi2c->err;
>> +}
>> +
>>   static int geni_i2c_recover_bus(struct i2c_adapter *adap)
>>   {
>>       struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
>> @@ -1021,15 +1083,23 @@ static int geni_i2c_recover_bus(struct 
>> i2c_adapter *adap)
>>           return 0;
>>       }
>> -    ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
>> -    if (!ret)
>> -        ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
>> +    if (gi2c->gpi_mode) {
>> +        ret = geni_i2c_gpi_bus_cmd(gi2c, I2C_BUS_CLEAR);
>> +        if (ret)
>> +            dev_dbg(gi2c->se.dev, "GPI bus clear returned %d, issuing 
>> stop anyway\n",
>> +                ret);
>> +
>> +        ret = geni_i2c_gpi_bus_cmd(gi2c, I2C_STOP_ON_BUS);
>> +    } else {
>> +        ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
>> +        if (!ret)
>> +            ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
>> +    }
>>       /*
>> -     * Recovery succeeds only once the slave releases SDA, so the bus
>> -     * state is the authority: RX_DATA_IN high means the bus is free,
>> -     * while a clean opcode status with SDA still low is a failed
>> -     * recovery.
>> +     * Recovery succeeds when SDA is released. RX_DATA_IN high means the
>> +     * bus is free; trust this over the opcode return path, which cannot
>> +     * flag a benign recovery event in GPI mode.
>>        */
>>       if (readl_relaxed(gi2c->se.base + SE_GENI_IOS) & RX_DATA_IN)
>>           ret = 0;
>> @@ -1066,14 +1136,18 @@ static int geni_i2c_xfer(struct i2c_adapter 
>> *adap,
>>       else
>>           ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>> -    if (!gi2c->gpi_mode &&
>> -        (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN)) {
>> +    if (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN ||
>> +        (gi2c->gpi_mode && ret == -EIO)) {
>>           /*
>>            * Only attempt recovery if SDA is stuck low. -EPROTO and
>>            * -ETIMEDOUT indicate bus errors where the target may be
>>            * holding SDA low. ARB_LOST (-EAGAIN) on a single-controller
>>            * bus indicates a stuck target, not a real arbitration loss.
>> -         * GPI DMA mode extends this trigger separately.
>> +         * In GPI DMA mode the completion callback reports NACK,
>> +         * BUS_PROTO and ARB_LOST alike as -EIO, so the SE_GENI_IOS
>> +         * RX_DATA_IN check below is what distinguishes a genuinely
>> +         * stuck bus from a benign NACK: a NACK leaves SDA released
>> +         * (high) after the STOP, so recovery is skipped.
>>            */
>>           if (!(readl_relaxed(gi2c->se.base + SE_GENI_IOS) & 
>> RX_DATA_IN)) {
>>               int recovery_ret = i2c_recover_bus(adap);
> This does not appear to handle scenarios such as an I2C multi-message 
> transfer where the stretch bit is set during the first message, but an 
> error occurs while preparing the second message (for example, during 
> memory allocation or DMA descriptor preparation). In such cases, the SCL 
> line may remain asserted low and impact subsequent transfers.
>   > @@ -1292,10 +1366,8 @@ static int geni_i2c_probe(struct 
> platform_device *pdev)

Thank you for pointing this out.
The GPI completion callback reports transfer failures as -EIO, but 
failures while preparing a later descriptor may return other errors such 
as -ENOMEM or -EINVAL. If a preceding stretched transfer has left SCL 
low, this requires separate consideration.
However, the bus-clear sequence is only applicable when SCL is high and 
SDA is held low, since it recovers the bus by generating SCL pulses. It 
cannot recover a bus where SCL itself is held low. The recovery callback 
therefore detects SCL-low and returns -EBUSY without issuing 
I2C_BUS_CLEAR or I2C_STOP_ON_BUS.
The GPI error path already calls dmaengine_terminate_sync() for both 
channels. I will verify whether this releases a controller-owned stretch 
before extending the recovery trigger to descriptor-preparation 
failures. If termination does not release SCL, the appropriate fix is a 
GPI/GENI abort or reset path, rather than invoking bus-clear.

- Aniket

>>       if (ret < 0)
>>           return ret;
>> -    if (!gi2c->gpi_mode) {
>> -        gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
>> -        gi2c->adap.bus_recovery_info = &gi2c->rinfo;
>> -    }
>> +    gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
>> +    gi2c->adap.bus_recovery_info = &gi2c->rinfo;
>>       ret = i2c_add_adapter(&gi2c->adap);
>>       if (ret)
>>
> 


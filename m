Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE0A4E8DFB
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 16:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452258; cv=none; b=ixXtRkwg2ackTGjBzugexXFlMjGJEDg7+F8cuaVTiVW5n6nUNY97H3oCmlJyqeAl04TuMdUPxAyQpeSNQuK5KxlGMcUD1P8HiuXUzZBpvlUhMdUtEfDzd88YlpHSQhkrhgxu2Zz4+zSDVbb0STIwWsLB4XgAZlPi93nZRqSV7l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452258; c=relaxed/simple;
	bh=Haa8A6En87hF77TC/wrpbU2XUUdgWL0nxVdf9yZPJNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQg4qdIJfiCxsMkaJ7ek8+ZTEeqzYlZm5GN4CaGxgKlwgA4xGPVlaVNJjmhTA2i1ToDUx4YOpA9vIOuUXxT3RgFvxejvxFnOp3n5yNjHSFjBmir+i7u4X8QFd2iOHc/gBidpFXC1cn6yab0vFvvaKnxYynutZSo0ENzZw1z2ITs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owEMKQwb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HDWnoHqe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owEMKQwb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HDWnoHqe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3e6S1209691
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 16:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AKgy+YyPBLjA34y5uDngTiOz8D/3Yy+FxwH6+30z6V8=; b=owEMKQwbhDYhMiJS
	N0dFNdr2upliT9mANjkwnTB1TK0EmNYP4zLIJh9/MrcvuO45xGxTNExEm6REErCk
	8F7fKiDdkZ6jGCjU049+/LJ5wHPnPNKOjq1ENtr5+40a/oHuDLXi+bkKMuskIq6a
	R2PhT1lycTo4rwzBularXMoZ3z8wDE81rNwEinIzYctW8vhxG1aJjMiopJoIVjHr
	gQtSAtKqdcqdl9MlznUQ3rfk40aD0gymo+bU6w2CoZUeDyJ2FR+HoBiukop/HMUe
	Gp/QmBiLA3U4Hp/FSXqyR8X1kipZ6vllD9+S0MTiyGsODpp/I5EWpzNcDih36IUf
	6vPytw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p71qfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 16:17:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso3117441a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 09:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788452254; x=1789057054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKgy+YyPBLjA34y5uDngTiOz8D/3Yy+FxwH6+30z6V8=;
        b=HDWnoHqeU8xIIWjMTfGOMkaE97S07jtymIVI+ayJs/7aQbtw1x1xsSTBwsR74jjF+5
         Pvv2EX52tVRHoh7cUtvzHdZH0G5jeYt+nen1c9gh++RwnStHxiPiYn6usrbg3Xe46muA
         Z2pAJRIXA23MgjKnZffEr+Wgiv7qAVjE9wpBxWcrPcBAaWqWQmjXZ+BoXiOOOo9vofa1
         zbOaSdt2l+pcePHNIDWQ5kbgjtwa7BivFXDwyUlkMJaECY9w2KVXQDDHS5Gk6fPNwKxX
         T1hJpxUUjSZESNnTWLl9UZZ00frix6x1VTYRuaQgYwpJ2HT/vuPuZquZ30kFZHjUIhOG
         Xeyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788452254; x=1789057054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKgy+YyPBLjA34y5uDngTiOz8D/3Yy+FxwH6+30z6V8=;
        b=iNdvORBA80RsQpt0xuSmX7bAgxExT/nmx5gKUgvgrlH4diH6wFCpZpvNrRhQiNkzXx
         u1FhCvHO6TcirzHQFyhGSyBpPH8KwgNZSlZyueB3AurPeAPDSkuQ3SvmUsFSmq+5sK6u
         tKv2A6CZAQmQFvHpJP1t1J4pzCSxEyuq7osKzgA4X9WqHQfVOd4pvCh0LIPPX4pTrRYG
         i6p5TT9Uu/dIBza/juZYaNKwWQavFBAmpZEJ06UkdoOJWN7k8WDUiDoTkxybxeTnP+tP
         3C12K4oMhkwh33nwqpk8fZCXpjBU7sYPbVOpntd4Kes95aO0QeVxFSR+BKILJQA0Lq4V
         y1gw==
X-Gm-Message-State: AFuF++lrdwX6arVbaT2R/ZeVGEOixgRAXbFfP63e8x5ChKNc4QojSY8m
	WO3Im7MRjjK3pPzZnu3VKnfVLNffgQ197cdrHOhnuHwvOZXKKuusrlTuE3uYjbMc3LdnpMlTOel
	Qxe+S3KSpgObnJIjB7gdB3pVvy8D0Wn1m28Jyutgsk6jAzldBM3cj6e4ZtucMRPim4Z80
X-Gm-Gg: AYBFou36eJ/rmmhyx31GBCqOMce43gmLl/pgNp7EfrCTt90h3YbuqLRuCs6/BlIWW8a
	RJ7lYO0UIiNc9ODjExGF+QH88Upl9H/BHi/u85xugjAXpu5/3h4CSVGCQZGp2rEcVlMIIz/AkiM
	7uVxCQgGliQ47SBEc4xFcwcjk9vw5O/EK7XrJqOEuUvB0YzYVLSQp9M8/HjuZXr0bsYAZwoc3yN
	oQ9cwB8ZzQSFlU8OY5Ftoqmr2H0MkqjFDCD8auxNtfv/uN5CvK0uLohuYErZFaHkJCo2LQtMjf9
	Fspsirg8rtDajGDxPxHI4x3R2xNuCrEuIzMTinCS2ODPZCSnNUMmxmkHuZ38amFfudEGllzL00u
	ymcu8UDKpV8R1ZXpZA/rU4frz0ACvH2C3nvI8zZhz2kNQ
X-Received: by 2002:a17:90b:264e:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39aee0c16cdmr22086138a91.17.1788452253531;
        Thu, 03 Sep 2026 09:17:33 -0700 (PDT)
X-Received: by 2002:a17:90b:264e:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39aee0c16cdmr22086033a91.17.1788452252895;
        Thu, 03 Sep 2026 09:17:32 -0700 (PDT)
Received: from [192.168.1.66] ([103.172.4.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8ccdecdsm3275395a91.2.2026.09.03.09.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 09:17:32 -0700 (PDT)
Message-ID: <990a4ab8-bd03-415c-ae95-008cee7740df@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 21:47:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] i2c: qcom-geni: Add bus recovery support for FIFO
 mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com>
 <20260826-i2c_bus_recovery-v1-2-203f0ec76f84@oss.qualcomm.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20260826-i2c_bus_recovery-v1-2-203f0ec76f84@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wMtdIKOMKAYAStsD8h5ddsJD-IDj78QC
X-Proofpoint-ORIG-GUID: wMtdIKOMKAYAStsD8h5ddsJD-IDj78QC
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a999d9e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=EcXJGs5vVKLEW0aY/poVLA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sHvlGgFilqykHc6SfV8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE0MiBTYWx0ZWRfX03dSy+J30mvT
 2nBE3IQv7HRl+9A1O0ljCslvl86OLLWzBbx2D5NJFfZhUSUF/OQgtmjwmxdHC9msWnq5Ziv+zsG
 qlF3rvJrtk1pMyIXRO25YATx9RkT8BI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE0MiBTYWx0ZWRfX2saMtxIsYVWj
 TSI/aQ/M2qyoSor4LlWHFpqQFIaJYW/Z4HXoIju/E2RU/ggta6bhnkrol4+CKsUrb2dZDz2CEbT
 xAO1ewmjA6U75JbduItlzsCKIg7TP++Y+o6gpKbWkiTZEH+y1U3TOJVKYzcvw36pGgO13hxXJ+E
 qN8SKgEGHUyJkc+Nn1nFA9LgKrUONNXWpvNGKVt/oAsXObLUjzLftBDD647JegTGokv1126+gAz
 mVQIG8lkBLPDeMlcmlzinysSTKYDZ05P+4dsHRIpoIQpFRsDlFRBylWfJoaTZ+7rvPKzzfGaGqI
 O51BmOdmzA3fyWGPPaZWCB+tJ9BBLTmiCvR9JQ56de62Jj4d7dGMihO7ce2hIhYBvpDOIzms1k+
 /KcaWeDAqjozoDXjqyAF7cMLFMc37zuJdJR3l6Jy0IkykUJXrVMWj4URfy3heIGKBfQGwjKZknt
 +WzU7yIu5NfbJY72bnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030142



On 8/26/2026 3:21 PM, Aniket Randive wrote:
> I2C transfers in FIFO mode can fail with -EPROTO, -ETIMEDOUT or
> -EAGAIN when a target holds SDA low, leaving the bus stuck and
> preventing subsequent transactions.
> 
> Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
> hardware opcodes to restore the bus to an idle state. Check the SDA
> line state through SE_GENI_IOS.RX_DATA_IN and skip recovery when the
> bus is already free. Trigger recovery automatically from
> geni_i2c_xfer() on -EPROTO, -ETIMEDOUT and -EAGAIN (arbitration-lost)
> errors, and register the recovery callback through i2c_bus_recovery_info
> to allow recovery via i2c_recover_bus().
> 
> This adds bus recovery support for FIFO mode only.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 109 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 109 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 658636c1ee0e..9fa1a8ac400c 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -138,6 +138,7 @@ struct geni_i2c_dev {
>   	u32 num_msgs;
>   	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
>   	const struct geni_i2c_desc *dev_data;
> +	struct i2c_bus_recovery_info rinfo;
>   };
>   
>   struct geni_i2c_err_log {
> @@ -956,6 +957,90 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
>   	return num;
>   }
>   
> +static int geni_i2c_fifo_bus_cmd(struct geni_i2c_dev *gi2c, u32 cmd)
> +{
> +	unsigned long time_left;
> +	unsigned long flags;
> +
> +	/*
> +	 * Clear cur so the IRQ handler does not attempt FIFO watermark
> +	 * filling or draining while the recovery opcode is in flight.
> +	 * cur and err are shared with geni_i2c_irq(), which reads cur and
> +	 * writes err under gi2c->lock, so take the lock around this reset.
> +	 */
> +	spin_lock_irqsave(&gi2c->lock, flags);
> +	gi2c->cur = NULL;
> +	gi2c->err = 0;
> +	spin_unlock_irqrestore(&gi2c->lock, flags);
> +	geni_se_select_mode(&gi2c->se, GENI_SE_FIFO);
> +	reinit_completion(&gi2c->done);
> +
> +	geni_se_setup_m_cmd(&gi2c->se, cmd, 0);
> +	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> +	if (!time_left) {
> +		dev_err(gi2c->se.dev, "timeout waiting for bus cmd %u\n", cmd);
> +		gi2c->abort_done = false;
> +		geni_se_abort_m_cmd(&gi2c->se);
> +		time_left = ABORT_TIMEOUT;
> +		do {
> +			time_left = wait_for_completion_timeout(&gi2c->done, time_left);
> +		} while (!gi2c->abort_done && time_left);
> +
> +		if (!time_left)
> +			dev_err(gi2c->se.dev, "abort timed out for bus cmd %u\n", cmd);
> +
> +		return -ETIMEDOUT;
> +	}
> +
> +	/*
> +	 * ARB_LOST and BUS_PROTO interrupts may be reported while the bus
> +	 * transitions from stuck to idle during the recovery sequence.
> +	 * The opcode completed successfully so treat these as success.
> +	 */
> +	if (gi2c->err == -EAGAIN || gi2c->err == -EPROTO)
> +		return 0;
> +
> +	return gi2c->err;
> +}
> +
> +static int geni_i2c_recover_bus(struct i2c_adapter *adap)
> +{
> +	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(gi2c->se.dev);
> +	if (ret < 0) {
> +		dev_err(gi2c->se.dev, "bus recovery failed, error turning SE resources:%d\n", ret);
> +		pm_runtime_put_noidle(gi2c->se.dev);
> +		return ret;
> +	}
> +
> +	/* SDA is high means bus is free */
What about SCL line ?> +	if (readl_relaxed(gi2c->se.base + SE_GENI_IOS) 
& RX_DATA_IN) {
> +		pm_runtime_put_autosuspend(gi2c->se.dev);
> +		return 0;
> +	}
> +
> +	ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_BUS_CLEAR);
> +	if (!ret)
> +		ret = geni_i2c_fifo_bus_cmd(gi2c, I2C_STOP_ON_BUS);
> +
> +	/*
> +	 * Recovery succeeds only once the slave releases SDA, so the bus
> +	 * state is the authority: RX_DATA_IN high means the bus is free,
> +	 * while a clean opcode status with SDA still low is a failed
> +	 * recovery.
> +	 */
> +	if (readl_relaxed(gi2c->se.base + SE_GENI_IOS) & RX_DATA_IN)
> +		ret = 0;
> +	else if (!ret)
> +		ret = -EBUSY;
> +
> +	pm_runtime_put_autosuspend(gi2c->se.dev);
> +
> +	return ret;
> +}
> +
>   static int geni_i2c_xfer(struct i2c_adapter *adap,
>   			 struct i2c_msg msgs[],
>   			 int num)
> @@ -981,6 +1066,25 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>   	else
>   		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
>   
> +	if (!gi2c->gpi_mode &&
> +	    (ret == -EPROTO || ret == -ETIMEDOUT || ret == -EAGAIN)) {
> +		/*
> +		 * Only attempt recovery if SDA is stuck low. -EPROTO and
> +		 * -ETIMEDOUT indicate bus errors where the target may be
> +		 * holding SDA low. ARB_LOST (-EAGAIN) on a single-controller
> +		 * bus indicates a stuck target, not a real arbitration loss.
> +		 * GPI DMA mode extends this trigger separately.
> +		 */
> +		if (!(readl_relaxed(gi2c->se.base + SE_GENI_IOS) & RX_DATA_IN)) {
> +			int recovery_ret = i2c_recover_bus(adap);
> +
> +			if (recovery_ret)
> +				dev_err(gi2c->se.dev,
> +					"bus recovery failed: %d (xfer error: %d)\n",
> +					recovery_ret, ret);
> +		}
Can we move this to a helper function like "geni_i2c_need_bus_recovery" 
?> +	}
> +
>   	pm_runtime_put_autosuspend(gi2c->se.dev);
>   	gi2c->cur = NULL;
>   	gi2c->err = 0;
> @@ -1188,6 +1292,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		return ret;
>   
> +	if (!gi2c->gpi_mode) {
> +		gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
> +		gi2c->adap.bus_recovery_info = &gi2c->rinfo;
> +	}
In geni_i2c_xfer(), geni_i2c_recover_bus() is invoked directly, then why 
do we need this ?> +
>   	ret = i2c_add_adapter(&gi2c->adap);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Error adding i2c adapter\n");
> 


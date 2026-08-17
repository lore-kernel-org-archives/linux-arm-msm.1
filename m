Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFE840FDB9
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976920; cv=none; b=pNKH8VeCCFkksd6jPKMzf3X+2qkdi7jWAQtQI3GYJ5rnuhm5fRZZsy5OoN3qUVhEqt5KsRACYedEoQPYya+saZAOGRjelF/VJotPR7ryQdb9c515YdMbUXM34GDGecv5ZkZqXnB1eXPxf9s2PmoSFVPfnySbjMb23aDzwvSeiM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976920; c=relaxed/simple;
	bh=lW29cJnTuKEyNNpLjqCpqrDs2QH+wKuNOpzoasGDgYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IWtlxtvu8uT9U8cCWoe5O+1y4qft4rgTVU+Bc05w3lclRm0k9GWcpcDj18ITyJsUpBSNkf7uzflxpEZCbXQBcfTBTUdF2MZvqqwpBlteUqZZ7grWbIH9+k1Vbx2G/eDzBJTk8Fc77RGYg5NLIqY8DY7h+o6c7bmo43HGnK+WJtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1LCh2c7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eo3z4yOQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1LCh2c7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eo3z4yOQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6MJ02937279
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MmAHkTLsRn7KVxOAfmPWk8I34Jvce7irwqDr0u/5/Pw=; b=I1LCh2c7l9eIoSPx
	J2ghJFyP70Rhkpo3zVz5kmOgpQ9LJekCcOf7rCnOt3GEmH0eEGwVrMGJI22SVgeX
	bnWRWYU0qBS3h7UV36Kou5lrbiiSxLyCNtqbVNJQsZ3LyQGsUdkUGvFYHNezbYhc
	bO7Ji7Vte/49Ee0rjk1Oe5vUbdCbr11oUPG8zdOUR5YpAjupNRZz/CCuxjp91Ao5
	edwme3QGU5iVcKHHdg+S1Bc6UNNp/L4wBk/P8jUVX4ti45k2FxFbL3nUFrisN2UN
	LzKlg5DZBObT92Yh83OcJb9PynO/AEw/BEVJmWhcBW/mA2nFlwWMMRJrzsNwEOGh
	dVR3ag==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wm7smw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:28:38 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c2af3df365so48861e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786976917; x=1787581717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MmAHkTLsRn7KVxOAfmPWk8I34Jvce7irwqDr0u/5/Pw=;
        b=Eo3z4yOQ9V3rsW/ARewkWVr24rIVHRUnaEUSMnlbSAomyI7OtqEw90GIuQBiR/K4F9
         /Jeui2Lm9qgG/Io7E+/AZRoRGOk+6VX5n5t0ulucc9KgFKAmuknXw3y0WJLv2a6Clew6
         SCIjk0XDRmVP2f2jW97QNnLd2t90VSTpjklKLrpT7r2yMF8EoltxOWVX1PslC04AMTzv
         yahx8XhpTWClI0z8iuOrWbAgOYYsU9zht2/BnLBGwCpCANSI+8FlijUMqJyyaoF/snO2
         K10efGjnLgq7dV92rHVswPRw+J0iMZTG+grCYm5O3k/t4X2S0MCvDwZgQy6MYYQMFOy1
         MQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786976917; x=1787581717;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MmAHkTLsRn7KVxOAfmPWk8I34Jvce7irwqDr0u/5/Pw=;
        b=HPwhnpOY7xovTOEnLDT1LlryRHEL2/rW5gVMyjAxdE/yMDKotIvhmJQfEzKHmx5DjH
         gVK2MkG73KnZaUSvl301zPkUggw9qgdbE6CcIfbpPPEGlXatOJD6piHs8lGov5IdSwLu
         R8zPJpvLDVEnt2vfhX8c1Q/EcFkTX/5Zf0b2p0uuK9XODdGKXPfm1Ipp0N6ZHjnwFyZl
         5cfxYNaexbxqeLxX1oZUn0q1SZWACu8n4L0jz8Lxnu5gOADjpwfGsJeVo/hNzAHGy25L
         mV+LBqeJtfPU3+AibZPvy1hNkF7j/acdXJ2JoNjnoWfxwl1DGEq03F0rQfCt/ynSftvO
         mvgA==
X-Gm-Message-State: AOJu0Yy7ey+vg8/UEhfHY0WWLAHTUM0j26rjDUxbYebGAPKW2u8nIzyO
	IxQyMIGOZQnSq2hDNFjgx3U1gSNejgqcWAC9oqdUhwwSQ03rL8U/siQfonxFS0tC86kjceMtAB2
	lCThOAI59a4Y+o8Ng3yV6ytuTM0NDnoWpDjZVNwAmoprFIJbCXDdMVCSSoJpbRJbUbFB8
X-Gm-Gg: AR+sD13mFpR78g86dgbDQrBwhSkMbsF1iftEM2NBRzzYLGYYGbn5r7s1y5A0tJVeZgc
	Q8LxWyBGVvUWqdzCBRiKZiYWSjlRkL7W07SQwwHknKXjzqmirSiWeOtkD5qt/8cBHOhAAprU0W8
	A26h8VUhp+FeZw1FN1HbRVCNwPFZzHi/0o/vDDJBaEAMvSiMeRwf1yfI5BEivarGsy8o3MczX2E
	zQdZ4tV8N3SuvgVfErUA1GQVCyzk0NzD0RPWDL/lM/nxsrlsLaGX6jK76PiUH5GdEcng5UWRrbQ
	FNk3c3k4x5Neo6ZJ6RldGJPpCHY4QMB0FbbaGbjph+RZq/kdCA2ROieyrw7i72b7W5UsxClJ4P1
	V+2hHdfXMODIO8DzBMuvqzD7h
X-Received: by 2002:a05:6102:5091:b0:74d:ce65:3e8b with SMTP id ada2fe7eead31-76f2c643703mr1636837137.2.1786976916984;
        Mon, 17 Aug 2026 07:28:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:74d:ce65:3e8b with SMTP id ada2fe7eead31-76f2c643703mr1636826137.2.1786976916457;
        Mon, 17 Aug 2026 07:28:36 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b732a4sm36959166b.30.2026.08.17.07.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 07:28:35 -0700 (PDT)
Message-ID: <e9288bd8-20e8-4cc7-9f51-be64c2b60e16@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:28:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] soc: qcom: rpmh-rsc: Output debug information from
 RSC
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>
References: <20260812-rpmh-timeout-debug-v1-v3-0-68c0a40dce23@oss.qualcomm.com>
 <20260812-rpmh-timeout-debug-v1-v3-3-68c0a40dce23@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-rpmh-timeout-debug-v1-v3-3-68c0a40dce23@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -UD-BTrpsbPjOe_EkdlGDpWy_4XsDxMW
X-Proofpoint-ORIG-GUID: -UD-BTrpsbPjOe_EkdlGDpWy_4XsDxMW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExMSBTYWx0ZWRfXx6AxYjjV7htl
 xYOEDgB/toxoOLwYz4thP0FLCBX9EYeqSprksIQ6/HF+BG5dWNeGRHtz93nVdFo02YjX3oX6BB5
 6odRX8FjUFxnXDQnqJJs7FDqHRQo6ky785qdEZXVe3qIb32HwVjr2mX7L0k1a5mgGxQaqJBLdT5
 YiXmGnLsT8ccAp7HapCJl+M8U1032Ha7Ms/wsfjCR89zToJtvhTMKK1amCmPeCxs5BJOjdaSlY8
 Sj7iRf3Q5rffQffkr2c0ch518GOuLjwKSOkGfHHs7QNT0BFNze/AwxvDOdohl0JlszyAleF9JTP
 Wn+/fEIY6mhXwUz2+7br9yLwxm49xpnMBWCnFLXHJP4gzxG7kMNBCshQdzUgs6u7uhWM0n0f7TV
 OKTiHeS/zaAjbrUPpcvBvMmubACqV9ioAWN5IStnKEr/cFlqmgOZWSg3Wvl4kf1CJm4selZn20E
 yHsupu/teM4v70+1VPw==
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a831a96 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=LpQP-O61AAAA:8 a=IDCv8sMOEfYmDO7wiisA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExMSBTYWx0ZWRfX7gfYcMmZl8aH
 QSKrW9q9YX6rU2oHg/+semdmom5f3p92nr9l1Ft35ZW62W96TTIK9BH09knevAE2lEJ8Zh3M/0H
 gR6xut3LJfGraAnCzaVYeKueLV/N55c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170111

On 8/12/26 8:12 AM, Maulik Shah wrote:
> From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
> 
> When an RPMh transfer times out there is no visibility into which
> TCS was stuck, what commands it was carrying, or whether the
> completion IRQ was pending at the GIC. Add rpmh_rsc_debug() to
> capture this state at timeout:

[...]

Looking good overall, some minor comments

> +static void print_tcs_info(struct rsc_drv *drv, int tcs_id,
> +			   bool *aoss_irq_sts)
> +{
> +	const struct tcs_request *req = get_req_from_tcs(drv, tcs_id);
> +	unsigned long cmds_enabled;
> +	char rname[CMD_DB_ID_SIZE + 1];
> +	u32 addr, data, msgid, sts, irq_sts;
> +	bool in_use = test_bit(tcs_id, drv->tcs_in_use);
> +	int i;
> +
> +	sts = read_tcs_reg(drv, drv->regs[RSC_DRV_STATUS], tcs_id);
> +	cmds_enabled = read_tcs_reg(drv, drv->regs[RSC_DRV_CMD_ENABLE], tcs_id);
> +	if (!cmds_enabled)
> +		return;
> +
> +	if (!req)
> +		goto print_tcs_data;
> +
> +	data = read_tcs_reg(drv, drv->regs[RSC_DRV_CONTROL], tcs_id);
> +	irq_sts = readl_relaxed(drv->tcs_base + drv->regs[RSC_DRV_IRQ_STATUS]);
> +	pr_warn("Request: tcs-in-use:%s state=%d wait_for_compl=%u\n",

Let's use dev_foo() everywhere instead of pr_foo, you have a struct dev* in
drv->dev
> +		in_use ? "YES" : "NO",

Please use str_yes_no() here, or AI contributors will rush to "fix" it..

[...]

> +/**
> + * rpmh_rsc_debug() - Dump debug information on a transfer timeout.
> + * @drv:   The RSC controller.
> + * @compl: The completion object that timed out.
> + *
> + * Dumps TCS state for all in-use TCSes and reports which accelerators
> + * did not respond, to aid in diagnosing RPMH timeout failures.
> + */
> +void rpmh_rsc_debug(struct rsc_drv *drv, struct completion *compl)
> +{
> +	struct irq_data *rsc_irq_data = irq_get_irq_data(drv->irq);
> +	bool gic_irq_sts, aoss_irq_sts = false;
> +	int i, busy = 0;
> +
> +	pr_err("RSC:%s\n", drv->name);

Let's perhaps touch this up to sth like "Timeout on RSC %s\n"

Konrad

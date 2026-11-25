Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604019;
	b=UDJ1BRfWQ78G37DP5bcz0gqaJ9JbLVav0DN5sfamrZYZJ1YCQHUik/dL4Ypx/HE/QM8Y
	 H46iIm74QOhAmGGzZ42CJ93eXlaR0zGYkLAR75AoWm63b4KPYoDjzv9ABT+6N/6fgOEqP
	 cbxKkthKRTmFsVo44LFAc2IyZxFj9Y1WLnM1wkAFAwlY5NYJoAGRQxJcE04o/Xw1L+A+7
	 ClruR4kDmihOwGIa4g4/Ttfh4q+kzQg06CHbOdf4S2zFGcZGjdvfkOmNWvux/4hp+1yB8
	 sPjYNlOVilblfTnm3KPxjRhZ8h8hdc0fgcv78VDis8ggC5V/qA4j+xXwHuKJjHOSZfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604019;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=tWsJdisCnNUTJmEHgS/h0WoUaEKuAhcAElbM1LpemB4=;
	b=YGWxfey4BMxjratGYTn65HPDSanvf5fFA5/WnkZ/o+MPX33Q9ylhsQOhY6i02VKiwsfw
	 Als9IBJfqNiPObKeE13HYxGDW8feD1P0TXnqlHipkVaLl+K2C/EtFWQ2CmxFk60NLWNbt
	 X0/cJOh+wvrlvOyHJt6s6AWjT/bU3quMeu87/EdGemklxI32ZeWswzsJRFV/p76upeqpC
	 u4SZaKLVFxLcLIpJhuU8SB/s6HSq/8j4K9rAWnSAWYJmO20kdz0+HAt2BaUC7Hj9b57It
	 1r8W9P3zE7+4AtgIKrxUdG71fJn4K5MsHQjdM1vgHG2ciHwFPax0lK5jIKGfk4mOssA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=PsX7C6IN;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C78606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C78606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=PsX7C6IN
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261125105329euoutp01e6cbe27873547e9dfd20749dae044f1f~rRFU58xfy3158631586euoutp01h
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:53:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261125105329euoutp01e6cbe27873547e9dfd20749dae044f1f~rRFU58xfy3158631586euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795604009;
	bh=tWsJdisCnNUTJmEHgS/h0WoUaEKuAhcAElbM1LpemB4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=PsX7C6INOyWU4uuDG73v92fRc2SubDa3of/cmL5XL0D+qJ1asJZ6ANKUG4VUbyqPF
	 b4CxQnlAFa/vv60WVDhCKsGzpNQ9zjshiMoF6TvD90Ua6Q5Yln3zqnmnCwey0qdd5c
	 b+HGgl7O+oHluQiPMBONVljN6l2LsEbv18+sxGlQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261125105329eucas1p2d715a0441207737ec107c34452539dea~rRFUpzE1D2395023950eucas1p2R;
	Wed, 25 Nov 2026 10:53:29 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261125105328eusmtip2ff03c8fe75050c8ba766a658a48b487b~rRFT-6FMT2375323753eusmtip2r;
	Wed, 25 Nov 2026 10:53:28 +0000 (GMT)
Message-ID: <c5dc8e9c-7fcf-44cd-8ed1-65c70d8c8bdd@samsung.com>
Date: Wed, 25 Nov 2026 11:53:27 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 1/4] soundwire: qcom: always set master port_params.num
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Vinod Koul
	<vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Srinivas Kandagatla <srini@kernel.org>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261125103825.936939-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261125105329eucas1p2d715a0441207737ec107c34452539dea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261125103844eucas1p19032e975aa03f8926e30212a5c3184a0
X-EPHeader: CA
X-CMS-RootMailID: 20261125103844eucas1p19032e975aa03f8926e30212a5c3184a0
References: <20261125103825.936939-1-srinivas.kandagatla@oss.qualcomm.com>
	<CGME20261125103844eucas1p19032e975aa03f8926e30212a5c3184a0@eucas1p1.samsung.com>
	<20261125103825.936939-2-srinivas.kandagatla@oss.qualcomm.com>

On 25.11.2026 11:38, Srinivas Kandagatla wrote:
> qcom_swrm_compute_params() populates p_rt->port_params only when the
> DT entry for that master port carries a valid word-length. If the DT
> marks word-length as SWR_INVALID_PARAM, port_params is left
> zero-initialised and the subsequent dpn_set_port_params() callback
> sees port_num == 0, tripping the port_target() sanity check on the
> capture path. The callback then also writes bps - 1 = 0xffffffff to
> DPn_BLOCK_CTRL_1(offset, 0), which is outside the DPn register range.
>
> Split the per-port assignment: always set num/flow_mode/data_mode so
> that the callback receives a semantically correct port identifier,
> and only derive bps from the DT when a word length is given. Guard
> the callback so no register write is issued when bps is unset, and
> bound-check p_rt->num against ctrl->nports before indexing
> ctrl->pconfig[].
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/20261125091150.2145177-1-m.szyprowski@samsung.com/
> Fixes: 128eaf937adb ("soundwire: qcom: add support to missing transport params")
> Cc: stable@vger.kernel.org
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This fixes the issue I've observed.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
>  drivers/soundwire/qcom.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 65add9a74ffd..95444eee4c0b 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1209,6 +1209,9 @@ static int qcom_swrm_port_params(struct sdw_bus *bus,
>  	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
>  	u32 offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL_1];
>  
> +	if (!p_params->bps)
> +		return 0;
> +
>  	return qcom_swrm_port_reg_write(ctrl, p_params->num,
>  					SWRM_DPn_BLOCK_CTRL_1(offset, p_params->num),
>  					p_params->bps - 1);
> @@ -1341,15 +1344,17 @@ static int qcom_swrm_compute_params(struct sdw_bus *bus, struct sdw_stream_runti
>  
>  	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
>  		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
> +			if (p_rt->num == 0 || p_rt->num > ctrl->nports) {
> +				dev_err(ctrl->dev, "master port %d out of range\n", p_rt->num);
> +				return -EINVAL;
> +			}
>  			pcfg = &ctrl->pconfig[p_rt->num];
>  			p_rt->transport_params.port_num = p_rt->num;
> -			if (pcfg->word_length != SWR_INVALID_PARAM) {
> -				sdw_fill_port_params(&p_rt->port_params,
> -					     p_rt->num,  pcfg->word_length + 1,
> -					     SDW_PORT_FLOW_MODE_ISOCH,
> -					     SDW_PORT_DATA_MODE_NORMAL);
> -			}
> -
> +			p_rt->port_params.num = p_rt->num;
> +			p_rt->port_params.flow_mode = SDW_PORT_FLOW_MODE_ISOCH;
> +			p_rt->port_params.data_mode = SDW_PORT_DATA_MODE_NORMAL;
> +			if (pcfg->word_length != SWR_INVALID_PARAM)
> +				p_rt->port_params.bps = pcfg->word_length + 1;
>  		}
>  
>  		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


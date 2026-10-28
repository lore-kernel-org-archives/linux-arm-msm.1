Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793149848;
	b=KFkd4Y/OZdrIuhhDXgGmbgBHJ+YPrueZ1zHZ69uEDuc1KmjcB8G7Cl5NGqilfDpUyJ7/
	 DeELfH4X+XFC2JZizgO/W8JxEYvxlEh806SNkXl465NsCHEjtX3f3YJ4asPMKdJ/ZU72k
	 rt52U60caAOlY/Rh1gV+xcBxoSrvjksaOZzv9oT3FBAzKJPtK0l+9WpYOseEA8lcrKTSR
	 b1alF9mjuVCOdMl1gQUlzbPDJKiCHzmt8VfLgXjOfzhMNHc4hn9ilsebbgw7HRqYihU4C
	 odFg28CqyXgapXyyET/QUsOxBF1ZBB5g/IO8brLDi9gu6c+pKcS4JdJhYIMcK6loeGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793149848;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RJPAJwTyk99Ed4rKr5mXpNq6/k97CEUnT+YCoSZgg30=;
	b=3EF33t1DcXarfxRnaQvie8wUkz62enU6YngWZuAhjiyeDg2VVEtgsD7WviJxO1q5gWC7
	 MiJuqJ6vtnxsYpLqZ5To4PNsZUMiTZNWszkAAaEbj2KV9Ly8ZT4cYBz+zBfMgxtgMN5yL
	 H6zIkS6a9jEOO5sv4uiLZv449nDh/d3yLXfq4SfSYwKKjl03MCIvJHDzoMh/xOJXzO52d
	 UjbV2mggBGYlLF3MDfqE9BsTt6XD3/ponnxf9Jt/pm/gGoomOgvbnY1FirtEOZhH8RXSt
	 5BOpkCkKU7c5vmrOeY39kxuUWwpE/FIcHOjlfr5yyfajatiEFwR0JjPlqE6ZHL94dkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hZDWih+e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i7TM+tJa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869EE606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 01:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 869EE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hZDWih+e;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i7TM+tJa
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S0jECp2277256
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 01:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJPAJwTyk99Ed4rKr5mXpNq6/k97CEUnT+YCoSZgg30=; b=hZDWih+en3WP1X/t
	eMjn++8sX3oLIoaOoa2bJDDkhbzruXNPzWmN4FrhHjZkAXSiQqORHY5b1gu+/0G0
	ZbTkooi2Nmgj82v+9u9yMWmxmWjXwjkrOqPa0EZj+KWTKJs63Fxtn7dHFqJ4SgGx
	jXu4vpU4BHcYVc6eoy9/wOqQZJCiRhHMdFI6Jb4uhLyoejB8LjTdR0P5sXo3zCDK
	CNE7JgdJJv+nFzxQJfesBNmWw3TPqyxQJ0PZU75zbrH00m2MACfdmRGtedSN9xQj
	5cbDgz0+A3yHQSs4Ktamf4BLb7OdU+MNJwZ94CAEkqFzNZqdUwuWfzm1wnxjAOzp
	pj6KTQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy711v3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 01:10:46 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so449786c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 18:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793149846; x=1793754646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJPAJwTyk99Ed4rKr5mXpNq6/k97CEUnT+YCoSZgg30=;
        b=i7TM+tJahUzuLudZwfJbYuZ7N1JL0k2G5viug9r6E6BMisnfyH2Mlt/+M+ZkGS0Fg9
         bt11GNYV/X5c9E1BYS65Uwmt2sKEfS/Gl3vxLnphFRfRLUBHoCq5uHFXJNo3RrBXpRIC
         CHNWfNf88eAH9dTxNSs2s7lxVLFUZHtPQ7+7Mj/G2htVPskPgOpomLAwe0TZwyAMRdg4
         up8Sei1GBQn+v2jTBdkZFGS6C9aGDHLfTAjajTj1kUI7X2SPRp3JjpDP/HGLAKWE0Xhz
         X98tSsMysLiBGg6mNJ3DhFeoO2uYm+baq+JPRf5yqNJUvEr1LZpdODHRXMWrtlxioPQv
         MXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793149846; x=1793754646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJPAJwTyk99Ed4rKr5mXpNq6/k97CEUnT+YCoSZgg30=;
        b=dqe2jNRC42NQl9uwn4slcDHKyEzOFEgt3oP7ax8xYh0U+xblYwRvz5nRu+JF7iXk5e
         UPl6Q7EImnWsnHVHAOGarqOQGdG2M4Oe667LuDsWjKTMJxsyh6stXnbI0658sIiIHu50
         Xm3VWUjIZGuVTT+w+4dR0yeupu5xsCIoqQC7dPfLwwH49R5I6fbTzHskIq9vWg8B2wVf
         Z4u8VvY5t/z4OMOKebVcK8q886+lnbw8jC1nfUah8/USvEU9m9uSq+0c8ISiFocT4aQl
         qqnyWmqpXpNiurH7ASyKJQEA+VhQNfFMfjcnmK2gOon2stK01O2yKNQ0fdT8n3wudMnt
         KqEA==
X-Forwarded-Encrypted: i=1; AKwUvBzV2dxdMTVryby6M796AXOpmUa6XMtFKn/2kmJhJBfH5JmxcCD7Ish2RKC0wcRsyh/HN+6qiWPOliYqhOoX@vger.kernel.org
X-Gm-Message-State: AFq9FYKn3MqyP9fm9+xT3WWMvQA2PDGtF7Kt/56NLEX8CPQBPgEzRsMy
	WsybMaHg+7E+PCzMBh1MTVNhZIZNNotYJo1yYQd0xmkhCmQ4lcBniYx6SjvBlNbCHZlveqCPy4U
	wWsjl6MYyeo8ggbDAxpX51rYEjysms/n7Al/1eSwqlJsWyEIxf4rxQ4i9AHoxzj06wO5d
X-Gm-Gg: AYBFou38c1caiPnO7JiJLmq4S84iO3Qee95SyguJZMjN9YX97gA46t5PbfxbStk2KNy
	UJXoY9ARY+QUc6yRG8X8FLaqYvV6q4Mr4cvKbWunhJviojjvJhrSCzVkLjawG++EWphpqzQaOqB
	4NoP0uD6RKG1OIjcdrMIsade0xXv5E0QyQ96l3mvihgFKiqVNTRa/yXKE/b7sWZ9FNiICxF0fAD
	br4sWpVtpGBIbq/+KiGoZI8O67b2PMuyK0U0bx0fSSY9dPM7L56jqkOw9cQ2JFmbS9jzSMCFKoU
	Vp83EBV4zPhtDeKhHQytOgAdxAy1nnms6vgCHrd5IUPzZIAIvU7J1BWAemB11SgDcMfE54da6PV
	fR0RaetCRPJitkV6L6Vxi+pzeX9mCVtAUhtdKE3dlYIC+DTPEXuTQA6kwBElHukFwdfwnS7agZp
	aHsA8RLtL23ZPf
X-Received: by 2002:a05:7022:110c:b0:18a:3911:ec1 with SMTP id a92af1059eb24-1a6ce2ff7f6mr1084998c88.39.1793149845526;
        Tue, 27 Oct 2026 18:10:45 -0700 (PDT)
X-Received: by 2002:a05:7022:110c:b0:18a:3911:ec1 with SMTP id a92af1059eb24-1a6ce2ff7f6mr1084949c88.39.1793149844674;
        Tue, 27 Oct 2026 18:10:44 -0700 (PDT)
Received: from [192.168.1.199] ([68.248.129.193])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f51bdebsm675047c88.17.2026.10.27.18.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 18:10:44 -0700 (PDT)
Message-ID: <32fc0379-0c45-4011-a7ce-795c44594b89@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:10:43 -0700
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
Subject: Re: [PATCH net-next v4] net: stmmac: dwxgmac2: enable L2 split header
 support
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        lorenzo.bianconi@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com,
        abhishek.chauhan@oss.qualcomm.com, sarosh.hasan@oss.qualcomm.com
References: <20261015221215.1714047-1-sagar.cheluvegowda@oss.qualcomm.com>
 <179244898962.3135.12890405028818098249@kernel.org>
Content-Language: en-US
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
In-Reply-To: <179244898962.3135.12890405028818098249@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAwNCBTYWx0ZWRfX3KUoH1QT6RMT
 hZ/gPYDSyL+V0+4EXrEfxr/+3j2Yuy63duw7t60ENLj6Z69iZEpj8aE4dmRUqpfgZX1WSgxxXgl
 teSv8EEudMifLJ7SOO0O8O+6OMJCMfBjWL5s70EwOaTMb0sB0ftsIFBmfji2WkMLqTU6azcBZYs
 a9X2WmlaW0SibVQZHskaInft12ZJLtawNMYrgmtPVTI3+gHkVEQ/PUm9NEM5KkOE0puCeGgijFo
 Yxpks8Su1knUIha32tC6gLOjIlE3XaYFpwCFOJRnvTr5sEDNRYqBf8V3l8pD4v7xLdTKPbDNBMu
 rD/Trkxk5VUMNMk78tjFrRCIuEFOZ13LXNsUY/X8Eifgl6Y7IHBpKcW9uc7dsq7VTIt0FETOHow
 IjDYRJdCu2NeYB0neiDe9eiPccjhsj82O4YoXrzirzOGMdCZMIzvu7HvkIMhwIilEcXmFm8OgTI
 QdFiUlwRIXBt7lQ9NDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAwNCBTYWx0ZWRfXzKCSI0+0uXgp
 7P+hxpTMtZ9wY/3EV31hd2ZSD1jigusmpb3eJyVq8c8b7PeWYbN3Z1bmoS2w0/pzLXeGYz7kEyS
 ngloDv77w1y4Z1IdR6lbTUffTFob2d4=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae14b96 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=djYDpCgIitZxdph7ACYjJA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=WVQ7OhcWbFtDb6XmBhIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: fYkUoDnK-qE7e7objO9kJxptM_yDGmw2
X-Proofpoint-ORIG-GUID: fYkUoDnK-qE7e7objO9kJxptM_yDGmw2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280004


On 10/19/2026 3:29 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 · High: 1 · Medium: 1 (1) · Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [High] On XLGMAC cores, dwxgmac2_enable_sph() now corrupts the RX queue
>   enable register.

Agreed. DWXLGMAC_CORE_2_00 shares dwxgmac210_dma_ops, and on XLGMAC
offset 0x140 is XLGMAC_RXQ_ENABLE_CTRL0, so clearing BIT(8) would
disable RX queue 4. In v5 I will move the EXT_CFG0/EXT_CFG1 L2 split
programming into a MAC-level callback implemented only for XGMAC, so
XLGMAC is no longer touched.

> - [Medium] dwxgmac2_enable_sph() programs MAC-global split and preamble
>   settings regardless of `en`.

Agreed. In v5 the MAC-global configuration will be done once rather
than per RX channel. SPLM/SAVE_EN will be set and the variable preamble
disabled only when split header is enabled, and reverted when it is
disabled (e.g. when RXCSUM is turned off via ethtool). The commit
message will be updated to match.

> - [Low] The patch includes a fix for an existing XGMAC split-header bug
>   inside a feature patch, with no Fixes: tag.

Agreed. I will send the FD/LD handling in dwxgmac2_get_rx_header_len()
as a separate patch to net with:

Fixes: 96147375d49f ("net: stmmac: xgmac: Only get SPH header len if available")

and rebase the L2 split header support on top of it for net-next.

> - [Low] dwxgmac2_enable_sph() sets the 2-bit SPLM field
>   (XGMAC_CONFIG1_SPLM_MASK = GENMASK(9,8)) with `value |=…

Will clear XGMAC_CONFIG1_SPLM_MASK before setting the mode in v5.

> Pre-existing issues:
> - [Medium] This problem wasn't introduced by this patch, but the stmmac
>   RX path has no dma_rmb() between seeing RDES3.OWN cleared and reading…

This is not introduced by this patch, and the new FD/LD logic does not
depend on it. It affects the common stmmac RX path rather than just
XGMAC, so I will look into it separately from this series.

I will also fix the checkpatch line length warning reported by the
netdev CI in v5.

pw-bot: cr

Regards,
Sagar


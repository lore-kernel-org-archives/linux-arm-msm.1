Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793665589;
	b=EWHE8c0DjWdOvdlZvsXT/siqLL2tliGtjJOzWokS3KaEe2QcUJG2f9Xd+HnIl+z74b4V
	 GVGoGaOFylOjMh1Cl626+5aTUVdkNNkrrfbKo6MJr0+pju6s9fzK8rOVsz3YCcS7FxAN+
	 4ls3r5dAgVveGM+jUfir7Pm1m+/fvrzGqbVuWaBKVR3YXj2bvHIfqekd8ey3w15fqNJAh
	 X6WcCHFJ/OHFh0HjDuMP3JRNflf8AZzuH7vdulVdHE9fBsPV/9fU2Ir+GmNvSqiOYo8Y8
	 0ElbdWqtvn1pnP5yx7T354bhKYA/CnMOYL95zlmitZeLvJs5coH0nZbAhm2oZn6faAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793665589;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KVUV1+mwK52vEYaTF69wDnDvl4/N5dnXbFTWcMNoPzY=;
	b=aAkR6bXSJmgHxGNrX89dBNAmjTMqxtjowQRgD485ZOdJMAgD94PPtERv26OpCNO4O0yC
	 /MnCXre4wJ89AKCrG6gHD9/7YTUeHFP2tiiHLonXwduShBMVwsJissa4EcBO8UsjzSRFD
	 5wKGdprmmPx45Jpbt5/lKeckDNLJoEn0S2qR3UkrO3rVpEWPHnF6O3f0fE5OA6PcdAMnX
	 9I9Wt/vdxphlto9rLzZHAgtdr0TrPwF4KUv6T1JKSSm+krae/ouYSt/JXjRjVIP5WC5BO
	 0p5abvjvGbtdkO+s3/B4XH9KN2rMqi9C1d1zhUpIFYMmwDysx5GL8QNi5cjNrQsiPEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BVB/PWvl";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwWQcrJd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35941606A326
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 00:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35941606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BVB/PWvl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwWQcrJd
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K5rEN3955545
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 00:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KVUV1+mwK52vEYaTF69wDnDvl4/N5dnXbFTWcMNoPzY=; b=BVB/PWvlG/fhji5T
	hTvL6LCPWNEYZsd9WtKha4mpxtj94caZ4gP/S2Qtl6Q0Zl9G3c21pmsOQYM550x7
	kjWciHXExx/IhVbEolWq6y27AoDR7tVYIxt+jqjlNJgLzum4e0PTiCSszZR2b8d+
	vbgvDnrY/qbcwuuTXMSrHGTF+M7kridZ+X82vEg5Oi7brLtoqwxyMPjdo9H2NORe
	nlHH5xPyUXAv5NpXYNRIAnfXmevDAZNo9fRDna3EF0azswSUH+srBTsLkZx7CBvi
	sFk7bGlN0XMSjFfEL6FnhE/LEVVFXpSvHnks0b9E0FxTfIzHckGdf55mIfv39h6S
	CriEZQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081s3yn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 00:26:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso8082420eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 16:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793665587; x=1794270387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KVUV1+mwK52vEYaTF69wDnDvl4/N5dnXbFTWcMNoPzY=;
        b=QwWQcrJdDp/aPx4HzCUSdGXyGE8AF5Smz0SN3qyOyKIsdrKBfi489HbQqM+WqRNTMK
         MZvhlMQm/ihOkmUSGV31jGTIMDg+gmOvrXU2A94a9MOKNzRjnCoXm6kXAnqO8utRO2ks
         WzYRrp+78V+FCIeu0/9OMg8e/nmr+86h9vU8lzqXsQtsvZjt0MbO18S/jiuI1DHjOtWs
         EmaeFWMUneEikT3d6siduPtXOPP8fYtlrF31xwDtybPJE3Do1bL3Dt5m/rEBbLaw50CE
         I5U6Zks7x9gd9A7SWIJVBm+NBuySroWPLGYw7/xsP7ndu4uj46Grp+zh+uT5ezJakEML
         +fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793665587; x=1794270387;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVUV1+mwK52vEYaTF69wDnDvl4/N5dnXbFTWcMNoPzY=;
        b=Fs3zBiMmtBaSfn4zDDoEbBxC03zVcfcry7pCHtGaAozxrskeVAkIjetJ11Unwowk4N
         cagsbQTeoxQwnwXZQWQf0Am85ib44y+tvnAe5XhnO20bjgRybLcJFstc1C94OBIGHHDb
         Usbfm8iUNH6fz8teUvPWKOKX0H6HwnYzJQ0JyhJRJ5z+84tZsnbTWZ8uijnu+ijLmqvv
         FJ3IkQJrDms5e1D0t7OnZ3sn9luAYoqw5FCDMYfibQRE9ncG2dd85I9672V4K+XsNC61
         hxpxZmybM5AvU0ci3PExtHAwo94uKzvzoUnnQAEAQ67zfkf+In02q8Rn9CAIq0plptti
         QQDw==
X-Forwarded-Encrypted: i=1; AKwUvByiXmP8DURLA/jtX7qEpGqA9y03jVt+t+3qdOVwfbCUmL9KD0ynW4Ak8YbSNiLq489j2395k58VZVejXJfG@vger.kernel.org
X-Gm-Message-State: APuU4Z+aEfu8Hilct3DnrFeCIbgP9m+nZIw2F/OMrTzOHlqtKV26zhSG
	F23yspe+8YnAgO0NmaJHSvKWLYqWUNEC9qzgRp/TCbHoz10NEoqKkIhSoDvFpqv6RCJMdEXVJpj
	ScvtnGJmn3ChsXIFwKCjtC6pdQfhm75WtjbX39tuO/fllaYByPBRX1wpHVtWYCsD7mRvh
X-Gm-Gg: AYBFou0OdHe5+3edM3HS1O2WTXx9qzsjZBMSXEYhOWqwpozNCmnaw9zGmtYGU79TaUD
	/sSUnHM84aMLgnTIIMvMae2rNnL+N2pILxDcsAV5vs1q0ne0cTHwdYV92C5pzO2J9gyTn4tCkl7
	JESzMMVDJzEJgffmDAXv0/PTOSgjOYLegJdHaum5Fphv8Ee8tVQtppunmF6eBDMl+DanvTLALoe
	9UAQHe7HSbd38hQzvmkOO129MH4Ok3UxE1SXJV+U8EYOI4zQpZhoU490cmbGZ4DzvURKfnWGj+L
	rZzpNZMUPBkwAATAegO70M2+D5vqoptaeCZPfpIZ1P+dB1EYWHkwDGsDe2lCLh6Q+DLSCM0aL0/
	MxxegDT4j/COSv195ha6RFbvej0acTB3PbDTSH0Pn6UWMENtbMrHp0HEB2DjT7e7Nxl4ioUUPob
	I6lMsWrMLzI6M=
X-Received: by 2002:a05:7301:6183:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a423c8988mr16360467eec.15.1793665587233;
        Mon, 02 Nov 2026 16:26:27 -0800 (PST)
X-Received: by 2002:a05:7301:6183:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a423c8988mr16360432eec.15.1793665586499;
        Mon, 02 Nov 2026 16:26:26 -0800 (PST)
Received: from [192.168.1.148] ([68.248.129.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm39285518eec.19.2026.11.02.16.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 16:26:26 -0800 (PST)
Message-ID: <374c9df9-eb58-48eb-8447-b6340df37719@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:26:25 -0800
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
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
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
 <32fc0379-0c45-4011-a7ce-795c44594b89@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <32fc0379-0c45-4011-a7ce-795c44594b89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAwMSBTYWx0ZWRfXzSanK415o6ta
 c+zFxtNpfCoyCYf+fu38KdXlAlocUOmReys11dD1GTcY3UcwlHhrSNfShbBXgR/9WpYHOjO2DHu
 oQHhCmrkIjCU6TQF/xLk/S7/X9JrcbQ=
X-Proofpoint-ORIG-GUID: rN6a5pfXVh8fIy8CKpemng-9qrnrkm4W
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae92a34 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=djYDpCgIitZxdph7ACYjJA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ZIJvd-A7hXLYn3_D4tAA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: rN6a5pfXVh8fIy8CKpemng-9qrnrkm4W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAwMSBTYWx0ZWRfX0RzjE9vbNvp9
 y+H+uqiXyeeo1QU8W+3NEA9q8GavMYh0Sckhu7NU+YNZlxv4523eiH5+Q06HbiupzYFKRb/QHWn
 ckokZ1ZyWsUheqpDoT5Irw/V+JhiUPtx28CJl9F7RE+tM5+X0h4gAfLh1gE6JFMtmV2214SENvd
 gnhmmnh507A6o9pSVPf6+Ykvvt9XtgWGk2iRWom96Zts1GoOUoTRB33wswpjT5XQpYrbcjK0Zz0
 +Hv2YIjBpfLdTg+WlsjSsC7MefbBc9Qyq3HJcfAKedEffh63aN0Ap6+/Q1LfJpRB2ugTotrrPI9
 9hx3pxzZVFxD8dnmGOEeCxWGwwcjLgWf4AnHwS6rAUCKlaqaWpJcmEpr0hqkbY8C0haLthooF6G
 2ZutqHdaWQ30eps5lh0XX1Mg9+HeKZgPJ+7KncLPYBXI5ieMP4q7sa5wNcDcH/uIbYkTRFCHMLt
 Dyz2NnNltjPtWNDHi6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030001

> Agreed. I will send the FD/LD handling in dwxgmac2_get_rx_header_len()
> as a separate patch to net with:
>
> Fixes: 96147375d49f ("net: stmmac: xgmac: Only get SPH header len if available")
>
> and rebase the L2 split header support on top of it for net-next.

Correction on this point: there is no user-visible bug in the current
code, so I won't be sending a net fix. On XGMAC the RX buffers are
sized so that a frame always fits in a single descriptor, so the
FD=1/LD=0 case where L34T is not valid is not hit today.
I will keep the FD/LD handling in v5 to follow the databook's "Header
Length Availability in RDES2" table, without describing it as a fix.


Regards,
Sagar


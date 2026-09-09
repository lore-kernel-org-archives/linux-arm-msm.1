Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15D649AA28
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 10:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951247; cv=none; b=WQ93AiE0nCQkG9goYAHlz+b8O3rBPFgrNqQZ0V6ekLZcXtI3N7hcsfk5Khs9f0TljDWxKcaw7Y1Gv4GxoQ2M5rNSkXuUj0VUZOzphCQbG3zXX9rdQyehM1Bbmk3bauY6E+m1DEGEAyg7GeIwrpIVVD9NZjHIhd2SQDu3H57O/PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951247; c=relaxed/simple;
	bh=sTYzyAIDtgmXo2D7GCEW0eRrv4kFNmqIcx6jjkjaACg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gbo6+KIo4gGXKqI+Nuyyj+kMvGzufW7AS8OpogWkbFQMngp7jpbf9XELcJi2YpE7cblOpHoEoa9knOqyQU+swNdM8DX88D8/bLs0uiYcx624Y3gK25D7tN+teLughlkPZ2AwHybyHIvLNt1Wu03n90//k8NYKN7M+XJh0YPqvs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e33GuiGf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HezYGGos; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e33GuiGf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HezYGGos"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689Aq2Ws1639938
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 10:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OW49y6dhUZOEpXtuT4CdNjzqSRvqOiqzgGso9ynbL9Q=; b=e33GuiGffVPuUgLp
	WSlanOyHspbYfh+r4I3dY+0va3xghkGCO6ddcQ5XHv813ymwvWtVCzNJfjGYcqo2
	ZrRWPGRrl6xIecuuGGX3Q2QQT8Vkcbbww1BKBqR4aeox4LfjHvpJbNxYseBRPJUI
	0ZMUyXWG+MSYB7Ok8+iHkBSHCeyaKQbbigkV4TSd2tDjzad7Tkj3L8dvcLJceMr8
	y4+QMXfVStrhak2yA0sgqhVz8wfkWN4c8/utg1juULW8l+F92r+87kvNFu6zdYSm
	dQxj5v4g+NKD0ctJLbHEvgYm1r/BszvIATGVQLgJlel95JrFUdV3JdiM0Eg3CmN5
	Y0aEmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnr62p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 10:53:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93495488976so71527285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 03:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788951238; x=1789556038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OW49y6dhUZOEpXtuT4CdNjzqSRvqOiqzgGso9ynbL9Q=;
        b=HezYGGosnfeNnUHn3d/go95Sijj6pLo3DH28xefRpb8FlJPN3d6E3Js35HfXT6zeG9
         3ktGd35z1eXypwO9keSGLVbNlmjAwwWU7CjJVmal6RgDbrfNfDuK/hYq5fGv3Nby79tL
         5uRaSHPc1MpnYLy7IL8CfrGPBKV2LjnQqxN/f01i/xU7dWFHCvTJ1dHAwUEnSWB6dkCI
         Lv8c7vxNfJmTJmDaTxpEcZKspDXwVY0DIQJievzRmjAC6bbVlVzmO7XPaaUrUivSvGmw
         RNHZq4NyS7RcysdgKVq00jYaeI6z05YWWU+gqHjUXzFjsrprU2EtjUfcVImYWw2qS5rA
         1Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951238; x=1789556038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OW49y6dhUZOEpXtuT4CdNjzqSRvqOiqzgGso9ynbL9Q=;
        b=BwjDJGZoRM4K4FS63JMPgpwtNRJKOM8iV9qgro+8B+6Bm+htJzSDe4oZlQcu8f0URc
         aTPxSRZOLFayPO/rmuLKIAwy25ZAAJVawgJXd3WxSRsmfPumywKyl9B7tUmCcRr69rFo
         rf12mD2XtcPlu0TXkWqzX2aEDkXNRoJ8/r0lHf9QO8dLw6+GIUQzYzlQhF49qmZbTYz+
         WQ2kl2kBBiWTshOtaU+mlSFhLpT5+XcsIKNeReeTR21xOaSBNP3Pzynt6L/CeZK+DPMy
         +rkUm8sCEWpPzprnFyPvJ+M/mQ84pHT6aLu2GctWX2fMWnVe/dgtkPigiclwp7zPJEEF
         oRPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaccHEpSUFKHXhZJOOJnE6EokXEV1SDKQQkzsmHXtoF+grT1jmJ0lLyibff8MRtyBqlG+d/3jyOR8IHAeb@vger.kernel.org
X-Gm-Message-State: AFuF++m7LZcLXdworTsAdlL5zyZMc+9nbSXr/u2cGFEtd0YDl2PvqY7S
	wDQfDA/au/u2XY62kO5/yf5JubR86RnCOb0bZh9hG+D1JSQjvz2C9SBoFAvgRJK7xtS+trU7HAR
	OE+V5BeJYLNDs3/R8l26GbumSPymdwvDMkeaLZ+FPcRhuM1bNJp070L/iNUMMWwHs9U9M
X-Gm-Gg: AYBFou0uRRUXKW+BX00Zzv/MfVIpY/ou9JeWfxElI6ItLahJh6Xbb5MbkYuLS8gkCL8
	tPDqvo2z8uAhtJbBP8fxPdj2g+TrG0EkGxbvISqAIBqydrAU11LP7UGg55vOzcY8H02B4qrV6Kj
	4q0l8V8P0ea0+8K4A56zlvIwS3xy8gfsq1lJvDOrIeYFkGd0fdsvENxgitSPkVZJ+pLRN1hbqWa
	JH6FFVz0UrF/meyyHQXCBy0tTy1aYgus68uTg4VuLS21SLgcemWkdgTGzkrTp1CaIkqZ0EAzmdy
	dLyW64Lzv9t9K8CMHZnLceR/FR5oed6JsrbbCGwIv1g5ZqkN5DTxfbDLEM/aoNSCVqpQArVyWi6
	PPvrr17WnuuHlhZ9EMfTzcw==
X-Received: by 2002:a05:620a:2844:b0:92e:6485:f640 with SMTP id af79cd13be357-93991865bbbmr2289484485a.4.1788951232809;
        Wed, 09 Sep 2026 03:53:52 -0700 (PDT)
X-Received: by 2002:a05:620a:2844:b0:92e:6485:f640 with SMTP id af79cd13be357-93991865bbbmr2289480785a.4.1788951232253;
        Wed, 09 Sep 2026 03:53:52 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5497cbsm753213166b.34.2026.09.09.03.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 03:53:51 -0700 (PDT)
Message-ID: <cbe90e91-96de-4d05-bb15-9b9a9774cfc1@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 12:53:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] PCI: dwc: Force L2 link entry on shutdown/reboot
 without D3cold check
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260905-shutdown-v5-0-f0c6bafa1d4f@oss.qualcomm.com>
 <20260905-shutdown-v5-2-f0c6bafa1d4f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-shutdown-v5-2-f0c6bafa1d4f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3p7yOPqgQn-zy-Si5hbpi01CV2EXKiHB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyMSBTYWx0ZWRfXyY00s3vzmZ+1
 OE0wVIVQ0AyH9SZhaVHtOdzQa3UG2HbFxH6/DOt2asH0vhpWQ/yjjglcPTPgb+5DgIcBZIm1u+5
 WKvHnIwbN9+GTUhOHyQ+aWra4+y2/tg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyMSBTYWx0ZWRfX+iKURuFBSX/h
 YdF48oDxcW0uSI+q08Rlf4ijwLVkg+de/UuJDKychUi1Ra1HBOtgkhJdcvR5q9qUPPFElMbE2wu
 nSgvBIc5IMxn8MwWU+68N4Ndke8Z8JyyGCRTXdbNG/1yXf6IU3WYo3o9k0Gj/JYAqT5NO1Qi34N
 aE0/JKp9Bqoqt5zmkXvkgjHykCwF6cGNyU9rMczbv0RAF9eybe4BW0ONGhXC/uuYojy8OIx0mqC
 yvPcuKypAF1qaWJVogROoAkxs2b1Y1ZAeNqgy/5Jk4RSr3Cs1w7L0E0eSQboLrINJ836ldp40P5
 iZJVyvrBTfp4H6JjkxqEKCT3N71KCFbLaNg68cd49ZzZgflYvvE+4Ei6Zqi/zIrZIc/YAHE6EUK
 M1Uy/yksBjNXvU6azm7cmcEAPbrRs3eEEmF4ab15P3I0oIPON2Wk68ZZjPVfZcDhh05cl3Nd2ow
 Wa290yW2YEoIJahn0vw==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa13ac6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iI2QsGKwy_EL_xBlssYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 3p7yOPqgQn-zy-Si5hbpi01CV2EXKiHB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090121

On 9/5/26 2:48 AM, Krishna Chaitanya Chundru wrote:
> dw_pcie_suspend_noirq() normally calls pci_host_common_d3cold_possible()
> to check whether every downstream endpoint can be put into D3cold before
> bothering to move the link to L2. If no endpoint supports it, the
> function returns early and leaves the link up.
> 
> Querying D3cold support during shutdown is actively harmful, not just
> slow: pci_host_common_d3cold_possible() requires every active endpoint
> to already be in PCI_D3hot, and returns false otherwise. If any endpoint
> is still in D0 -- which is common, since endpoint drivers aren't
> guaranteed to have suspended by the time the host's shutdown path runs
> the check fails and dw_pcie_suspend_noirq() returns early without ever
> moving the link to L2, leaving it up right up to the point where the
> system cuts power/clocks to the controller.
> 
> Add a "force_d3cold" flag to struct dw_pcie_rp that callers set
> explicitly to force this behavior, rather than having
> dw_pcie_suspend_noirq() infer the shutdown/reboot case itself from
> system_state. Still call pci_host_common_d3cold_possible()
> unconditionally, since it's also how "pme_capable" gets set, but ignore
> its return value when force_d3cold is set and force L2 entry regardless.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 5 +++--
>  drivers/pci/controller/dwc/pcie-designware.h      | 1 +
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index f5a38e6fd8d7..a8a3861c2956 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1224,14 +1224,15 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
>  
>  int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  {
> -	bool pme_capable = false;
> +	bool d3cold, pme_capable = false;

"d3cold_possible" or "_allowed" (although "_possible" follows the
helper name so perhaps it's better) would be more descriptive here

Konrad

>  	int ret = 0;
>  	u32 val;
>  
>  	if (!dw_pcie_link_up(pci))
>  		goto stop_link;
>  
> -	if (!pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable))
> +	d3cold = pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable);
> +	if (!d3cold && !pci->pp.force_d3cold)
>  		return 0;
>  
>  	if (pci->pp.ops->pme_turn_off) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index a53ac27cd244..8becf4e62703 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -471,6 +471,7 @@ struct dw_pcie_rp {
>  	bool			native_ecam;
>  	bool                    skip_l23_ready;
>  	bool			skip_pwrctrl_off;
> +	bool			force_d3cold;
>  };
>  
>  struct dw_pcie_ep_ops {
> 

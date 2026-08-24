Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D345C3E3C53
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553746; cv=none; b=rH58pNN5QbELcIEYDcFURH+MAyVd42feQ78YlRHGGcvdr1WEUYjJwepZ8GAEBKCorJmi3wD4Rt2oDwjf3FhddCWw2tr7+SY3wuLsh59F7SIMvsX9xLQh755ZqmsuAhHHqRDp2Ueh/O6Wl7LwJ1L3zPp401i/NEeO7bHTqoUnOmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553746; c=relaxed/simple;
	bh=iyGx5iqkUqrnQf0Cha7vOUhdCMb9g1KWmhPIEUursEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gAs0+QCPF9hY0uk1zW+K73q30Kgev0iduneLGqkZSZORLpYAaspRxhlkCcFVFO5sN/mIKw4dqn9v2cOHWm7vxreDRr0PIu4jipZt8y9rLHbNFgSyPTbShiubuEwzoiq094tK/B1PUlsttvY+5pC82xTxzY+xmFpPkZDa4D14zpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJKeJKHA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BnFo+bx4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJKeJKHA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BnFo+bx4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R5FW1477748
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5fo6910DlPmwxrxU1cDr+Dl9e9d1HFUUwPl2O1iwbZY=; b=QJKeJKHAI7Y9YXZA
	eC4yLgKHFSLB0eI0v7QuVPns4FHeDceNvs2OkZdrOoOq1uuROs97VJAFqEgbi6Ji
	mbsjyuxFQDBoouqpD+V+Ac/+c9/+MSexVejSis2zHXaTEU5MKdXJRJWIMWWTo8xd
	6COae5I9oKg7w9mI7MioSYzauFKFlLNxkoniperWzHzRup/rnRD6R45xYYp3XH8X
	44Ykxk6Hc6J+UI/Uk7hK79jmf1we473+u9rCqEJKyf4L9CtX16eSTpG9o8fQ+xia
	kK4AhQxGvnAH6bQ+/UJ7uWzejKmrNuhoOTUr37PP87z3R92AEM8R+geiDfL++fqn
	lYOm9w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7528ngjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:42:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ddb567146so6546181cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553743; x=1788158543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fo6910DlPmwxrxU1cDr+Dl9e9d1HFUUwPl2O1iwbZY=;
        b=BnFo+bx4Sy8wntJe0MXe5Oc5RUwzCUiYUuxLsHUo7aSQ+aZjy9En00wpy7sJ8+enRB
         Wgul6pCfYdE9REiCjlpAnAbcGZWFVNQu6ujhRqsuwRCD8E83GdotrCPJ4JhCZsxl9C9D
         Zt/xfTXzKH4P0lmtpM3ZLJlPX8E8E+BFgD4nF44W1biqAC9DXBSlmMyNd4Muuvdivv4z
         mIbmvbadN7JWvJpC5mO2w52AyxX96SfexAyLpPD3wegCZU46+e/0J2ffmRYWqfRhURMy
         vKsws5DSYYciRKNTQ/G2ymMuj+F1VfZ30jEuFK9bV/l2U59G8Dgks3F5wfiSf9kwZMZj
         XmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553743; x=1788158543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fo6910DlPmwxrxU1cDr+Dl9e9d1HFUUwPl2O1iwbZY=;
        b=GfS3mH/DQYw8eXMKWQrqsGdNMTvYWNx8xOUJofKoERIlkVzTFJ34wNCf/lE4e7wR7L
         LktPxxqhos6H4zinaP/nB2ZC99JuK21IQuQSFsMLSINEKCbG3XtjCZkLk1H8Ge21IKUo
         PHaW6wSMrWIoc+TisTezlkbr3ZV8OjUkix5Kpao5GiVPSjiWA2bvqwzQHW1kF0SNlmQv
         CJx3WrTY+fkHTG4W7Ls3GH7EJusuzAtxm7BdPC9PF8GYJlhstu169rBunnszSTpa83n7
         A/ucm97SWDhuauvpw1dJt/IT3Y/faIVaNEjbK0qnpQjwGmk7LFuSLGRhN7gJriZepuuv
         Ig9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq0dDWIH32JPXVnAs9T766zkKF8AAZfuUjKCW6Mw23XIW8rMIidRax2neOgjrf3GKptuPv5+3w0DuwVoqQe@vger.kernel.org
X-Gm-Message-State: AFuF++kqgKO5pTmjZpOT/m7kGTT/xKjKqlhZNI2ogh9tx7PU3gdUQtB7
	4LggRHijJX700FFBouMROVFoGI6rW3bIcZ4sRLACyf4frCA6snBUBVC5TSZHlGcdWWqty7Xkhto
	CfkievzjhMGAE5DlbZzCvd7mMEp26Nfhu/JC8pH8HXn5Uf3mOPRa3dGM00O49eayij/9y
X-Gm-Gg: AR+sD10kEbTmOLUUhdDIYeUQx7q7KqYcUJ8Xab0oN01KwcMYWzhrc92I710P2gOcfBn
	xbnVVrCd1eaDKzTFOjPha/zR9jZZNJf1dK8CT7RcqsL2U4lZoQCJDI3lLvOKv68i9T+RxJYe7LQ
	c7Q89sAKR/mqw5TkOvfmbQIGnU8euQRDb3fHV3DKtEOoe0YQfsssOkKtCT33UaAh1KeS5nPD1lc
	48qupVi0eUcMl8oNC4uDDz1oF1wzGLXk3dalYXmh6O8zPbu5DFvmNr/Q+ovi3EZPZNxN1ycyXw6
	OFZnuK+sZvfbrcayQ5QvOQ8RKwHc4IT6n1IlWYuznm8bbkDUjLcq/Vn/yCC0sYnV3J0e7HH9p6b
	AM4dOe0XDDX+PXmRcv7ckKCk+
X-Received: by 2002:ac8:5fc9:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52df56ad290mr179247391cf.2.1787553743017;
        Sun, 23 Aug 2026 23:42:23 -0700 (PDT)
X-Received: by 2002:ac8:5fc9:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52df56ad290mr179247201cf.2.1787553742553;
        Sun, 23 Aug 2026 23:42:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b161sm1206303266b.11.2026.08.23.23.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:42:21 -0700 (PDT)
Message-ID: <93b5e7fd-855a-4049-94a2-dfa3014bc15d@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:42:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] PCI: dwc: Force L2 link entry on shutdown/reboot
 without D3cold check
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260824-shutdown-v3-0-81c14bb7a1af@oss.qualcomm.com>
 <20260824-shutdown-v3-1-81c14bb7a1af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-shutdown-v3-1-81c14bb7a1af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DsJmPm/+ c=1 sm=1 tr=0 ts=6a8be7cf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=TsqnGGOKZ8Fqlm3Fd8sA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: _pa0YO4NCcWnYURQUx13Z6OAZ0xdpY1G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX2Gvhv2vQYOvn
 JFvN04fHF0t+EoGfW/rgU6uqAWr23ek/RqlOMtwOIJM+uwAbFMXmVEd7eyIhQqdenY21lizmBJg
 PgRsn3invXJPKSlh0BZroTwEWGTbvueyik7CrpO1SnnUGuXjWIM2MT0lEHxh8dgjg5J5u5g3Ik/
 lLFotY7FDWkSZS5ybBJijG/UubHt+hTFgcqkr+H3jUGDI9HJy1v4k8mJZyGYrOXIAXxfi7eXsrx
 VmnFmElkWu2JQgt+N328OWCnPdb3D4D1csBqsthuhRX58Y0kp6Nqx79FuAPoISuBR1uATY7ER8C
 GAETyuhnVLOBdCCrnyVkR3IeG0GZUR96Wbap04W6OPBNSKwAP1ucrwXSOMh4aF4f5opn6GLHYXk
 k8zba0YJbUHZ8na6KL/4PFFIgmVcKlIkA4LSzKbqYT7CkafvRlbzglYRx+UtaEE/tF5xqyXFto1
 fjuUMlVcv4ji/N06WPA==
X-Proofpoint-ORIG-GUID: _pa0YO4NCcWnYURQUx13Z6OAZ0xdpY1G
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX4CNBuZB0tp+d
 EVEbpz/IoTvvIN7tu3B9H2gb5LvXBK1MwysE/tT6lxKMekMRlJ7prum6IORywxb6WVHypOycDLS
 O1M5uOjgjd5F/SDNMd4kbV0mgCgoS20=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240057

On 8/24/26 7:34 AM, Krishna Chaitanya Chundru wrote:
> dw_pcie_suspend_noirq() normally calls pci_host_common_d3cold_possible()
> to check whether every downstream endpoint can be put into D3cold before
> bothering to move the link to L2. If no endpoint supports it, the
> function returns early and leaves the link up.

[...]

>  int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  {
> -	bool pme_capable = false;
> +	bool shutdown = system_state == SYSTEM_HALT ||
> +			system_state == SYSTEM_POWER_OFF ||
> +			system_state == SYSTEM_RESTART;
> +	bool d3cold, pme_capable = false;
>  	int ret = 0;
>  	u32 val;
>  
>  	if (!dw_pcie_link_up(pci))
>  		goto stop_link;
>  
> -	if (!pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable))
> +	/*
> +	 * During reboot/halt/poweroff the link is going away regardless, so
> +	 * force L2 entry without checking whether endpoints have transitioned
> +	 * to D3hot -- there's no point walking the bus to find out.
> +	 */
> +	if (shutdown)
> +		goto d3cold;
> +
> +	d3cold = pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable);
> +	if (!d3cold)
>  		return 0;
>  
> +d3cold:

I don't really see why we need a goto here, and I especially don't like
that the label is named the same as a nearby local variable.

Can the check above be simply changed to "if (!d3cold && !shutdown)"?

Konrad

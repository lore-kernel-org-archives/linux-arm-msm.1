Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30ED41F5ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 11:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785238485; cv=none; b=EtQodxSdyC3aw1L9ZwdapwCu0l+h4jDOLlw/TQcd3MI0w6z4nhMUIP96wqLtrVIQ+onxqgQoayL0I1JeRrq8WhRZYUN4giZ5wZjyNzKghhYlf35xxPvdBRdzi8ClkVT+fRVLnmL4X6NFM3YLLT3DYUHrtmzy+oMauoD18ETfBOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785238485; c=relaxed/simple;
	bh=6sB90ShbfkUg+i7d6BM/f+tRM4OKgYiuHbS+si00ZpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3g948vuJ/8wRRyiaf62CoTW3ilMNVBF7aXHVjer5tabc/5tXwETNU6Qtr9Rn35mLDTeN2NA8uA9Jnq9L22bCWG7IGLLGI4ensJpkQchoNn+zOiDuxZCvkQCW9T+rAZZLoUpUyPO9F2rZwer3n0jL/wnTLugdN/edRzqh4x7zRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TpNp3W2O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IonQLDky; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TpNp3W2O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IonQLDky"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBH8Hi2121150
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 11:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gbo+tER6P2agi65+IoK11DMG
	JudcKhnoP053vnEPwzE=; b=TpNp3W2Oolckm9QwP32Ki0zrr3+eXlkVSRJxgTpc
	dOvS4kJVGPq8EpW3KdYCXMC6GL21HF1+SUxsIUEY+50un8chx1Q20NBl0s/w2lpb
	tdMvRzHZuuYefLKBTi/YahSW9JEBDT3i9Fn4e/bqTnn13ikgHOnw2oCky9nfjykS
	iOgcNvdevzotQWJXvlG9qz7WUQTpv/Y51/bss4rCCAW45ipiUdj2eBeybrv7qr5t
	AWbKT+X+x++79ZHApw0NKIP/IK0MjrDEbruHOHP5Ew7tmrTiuUiG5YyOntpDHsKu
	sO+oYyE+1kH+pPVHC9jns2tXo5A3YU2Ky2cNf7TtxYzvgg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fppttsb4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 11:34:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c19493ac2so55059781cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 04:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785238482; x=1785843282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gbo+tER6P2agi65+IoK11DMGJudcKhnoP053vnEPwzE=;
        b=IonQLDkyaJ0RzKr8jLzy52AU5U/kA7Vw9OaA1LyrUiv3LeosJHyLbxmvKOG69Ye0Pu
         6zjgEurUsLAYzvGI5oIbW9t0/kJTOJ756o4Xo8DuaKfyytOB5L6rlIoc+lZxQK5WTuha
         /9eNV8XzuqArdD7auegeRO9kuCuxtuVEc37dRZdeOmPIn52FOj2wtjF6muO0sigoAPvy
         Gclw9r5D7AztiDwfBhtLFUD4ZfqVgLS3yai7h9IsHrkAVH/vqegnj1FN8/Ip9OigRhhN
         fnw9T9wSF/G765WBEdBu5VPJDyGmlkCPLq7OCz5L4TTZd2mZeKHguc553sCidzo2i/+L
         AGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785238482; x=1785843282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gbo+tER6P2agi65+IoK11DMGJudcKhnoP053vnEPwzE=;
        b=ce2vSPbKWedxred8rA3O2HiM4Oyruqep7zeDkLEVe09Dpc8cOI7kj0yUqXm4okIk+3
         8w0+y3TYFoYQZudKaxdQVo4E9qkAQOMdDymx0G7j1MIPdXDOsog//JP5QFUBp+kudNpB
         mAdmFE2nEwKmikwg+O+jWSn+HERmj/UkaEHOKjV+IthbIaNU2/4MHRFWrlbtM7vQUKQk
         xVmjsaeKG29g1H1QxAD7FQeReU1FH27piESWcREpjDbHpphLxlQ57MhVCQ5y+T6xoOs5
         wIP/XsSxFsmEATnp1zb4zqxvPSPKtWE38LrYi1CF204XbIve6tcYTntXCHfjHC7AB0MS
         R1XA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4nMEZnDZ70Rihprq6YpwrK2+R3V2ShHgRWYD+/AgcI45wtEQPrGqBqmzJfoi8VSkn+GvWVTTOe10hzrlG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4DJezNqmMHMvr/wnyQYd6wqCKeBT8UUT5XL3qomaNpTcsDHH7
	z+ztTFhDWdEeFv0tEfc2CF2Nuf1ZBhZoJSiaraNbYZ+bwe1j4QKwBlxbziJ3Us1v8odt1PaZpIl
	UzKbmIYePql2JSECKdIK8F/kv+SMMXyassjPU6GRGH6kecL7j/Z4Nz3ZPlwmLIm/SzdSP
X-Gm-Gg: AR+sD10zvg6r5Ey89LMopGiZedWazY9gMDDvsf0szGFf6Xb+6rg0U623XtA6JApsMfK
	9DUbFu7c7bJPSydorpNZY6y9eAZSsXGv6HB0VJ3JpSuTIgN6sEwrwuBEakwIWedLsijnIKhxA/0
	YxHiCqCJ/yWSeKRKWOXQYKdcbP3c8aq16ELAaIdc0B9hNncysIuhHfhrw/PmUl1RMLeGeBWczwH
	o5GMrL1aC/Hc8CErzeO7Kj0+FXqQBkUTBflRgyOHRxg2PDXLYiyr+eAzbPY5UecQRYBExHwvtYz
	Yzn5zfgkd5XHyw82//H8aMquHOBODGiD6UbimQAnvrxyosfT9jaZw8IMmEErFtcbh6TzxdD00qG
	2yNB3er1OoPhTLPGTn34LhtC9u5BlhifbTE5OkKMJPt/Ql2aqyAoO0QZ7cDEVlj7o2m1I9vL9w+
	DjukMRJtFoej97pg==
X-Received: by 2002:a05:622a:138e:b0:528:320b:305e with SMTP id d75a77b69052e-529d6feab04mr15912551cf.35.1785238481984;
        Tue, 28 Jul 2026 04:34:41 -0700 (PDT)
X-Received: by 2002:a05:622a:138e:b0:528:320b:305e with SMTP id d75a77b69052e-529d6feab04mr15912161cf.35.1785238481464;
        Tue, 28 Jul 2026 04:34:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be090b6asm1974708e87.36.2026.07.28.04.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:34:40 -0700 (PDT)
Date: Tue, 28 Jul 2026 14:34:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v16 3/3] of: Respect #{iommu,msi}-cells in maps
Message-ID: <fuqnxdknkajqotzmmlknwnthqpku7as5kpvmgogexl5bi7x6y4@tthbasf5lqvc>
References: <20260603-parse_iommu_cells-v16-0-dc509dacb19a@oss.qualcomm.com>
 <20260603-parse_iommu_cells-v16-3-dc509dacb19a@oss.qualcomm.com>
 <3f5c974f-425d-47a5-9fda-e05de1f39d79@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f5c974f-425d-47a5-9fda-e05de1f39d79@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwMiBTYWx0ZWRfX6G2cpAHTkyxs
 M/gtNGlRUYq/M1uaUW8hx97pQ6FPgSBlk1E2DTogDZMUDkjS2xQGxJzQnEi/3UET6aHYykRA3lZ
 bgyC4JnbzLl7lF9xwdAf0QUuGI1bb6E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwMiBTYWx0ZWRfX9m1C217Bo2C6
 6P7/HggXG1gIs4CDoMIrJ8bjc/oFOIH0RTTwWZWnvGuR8wvHitZjNj4NQY65XytL+M8Il3SHLq7
 o6Y+XQ6xIabf+WE6tFFeyAyAxRxqeC9Z5mFrUSp+dNRUd8PslepQ8esNHMDxCtzKaLWoBJ2ZIQe
 ZUgAwHm+MkACrmVTHYIHBPK0/EzlspNErCE2eAqQqGFdsXspoLtPmKpIAobecX4vb5nqQtYLnK4
 Ka9Jm7lXFMx6An4xZoR2xCx2zFLQnJME4AoZGLHvsvlpZcqniyS/GZgOYugtE9+2iOmGqJEXLga
 5uCBgjAPFJgVNiQE512uHzGFOm9cQuIIv98SyZ7tp+nICmcpAi0NV0AVZX7FCTYuZmD2tECLQtm
 oFECESsCEV5fq2SukA5/1ADBkI/Zz4QXPYq1ZxfXsCoknPJKYHz2IZ4pifIhCixbUlnzq1YgGSm
 BqnGeFggZWSj7SH4l8w==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a6893d3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=wdqIz0_Y7svv89iKmCwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: a8bBglPO0yZD4i9d3OWeE_-hWbNpS8xE
X-Proofpoint-ORIG-GUID: a8bBglPO0yZD4i9d3OWeE_-hWbNpS8xE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280102

On Thu, Jul 23, 2026 at 03:17:24PM +0200, Neil Armstrong wrote:
> Hi,
> 
> On 6/3/26 09:13, Vijayanand Jitta wrote:
> > From: Robin Murphy <robin.murphy@arm.com>
> > 
> > So far our parsing of {iommu,msi}-map properties has always blindly
> > assumed that the output specifiers will always have exactly 1 cell.
> > This typically does happen to be the case, but is not actually enforced
> > (and the PCI msi-map binding even explicitly states support for 0 or 1
> > cells) - as a result we've now ended up with dodgy DTs out in the field
> > which depend on this behaviour to map a 1-cell specifier for a 2-cell
> > provider, despite that being bogus per the bindings themselves.
> > 
> > Since there is some potential use in being able to map at least single
> > input IDs to multi-cell output specifiers (and properly support 0-cell
> > outputs as well), add support for properly parsing and using the target
> > nodes' #cells values, albeit with the unfortunate complication of still
> > having to work around expectations of the old behaviour too.
> > 
> > Since there are multi-cell output specifiers, the callers of of_map_id()
> > may need to get the exact cell output value for further processing.
> > Update of_map_id() to set args_count in the output to reflect the actual
> > number of output specifier cells.
> > 
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> > ---
> >   drivers/of/base.c  | 168 +++++++++++++++++++++++++++++++++++++++++------------
> >   include/linux/of.h |   6 +-
> >   2 files changed, 135 insertions(+), 39 deletions(-)
> > 
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index d658c2620135..ac7961cbab94 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -2116,19 +2116,49 @@ int of_find_last_cache_level(unsigned int cpu)
> >   	return cache_level;
> >   }
> > +/*
> > + * Some DTs have an iommu-map targeting a 2-cell IOMMU node while
> > + * specifying only 1 cell. Fortunately they all consist of value '1'
> > + * as the 2nd cell entry with the same target, so check for that pattern.
> > + *
> > + * Example:
> > + *	IOMMU node:
> > + *		#iommu-cells = <2>;
> > + *
> > + *	Device node:
> > + *		iommu-map = <0x0000 &smmu 0x0000 0x1>,
> > + *			    <0x0100 &smmu 0x0100 0x1>;
> 
> So the sm8650 PCIe controllers has:
> 
> pcie@1c08000:
> 			iommu-map = <0     &apps_smmu 0x1480 0x1>,
> 				    <0x100 &apps_smmu 0x1481 0x1>;

To silence the warning, update the iommu maps to:

			iommu-map = <0     &apps_smmu 0x1480 0x0 0x1>,
				    <0x100 &apps_smmu 0x1481 0x0 0x1>;


-- 
With best wishes
Dmitry

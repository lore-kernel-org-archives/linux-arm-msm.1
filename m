Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992542;
	b=A9yPpCo1Hpq1p75k+n/aN2fsxsHroy5F+hoLcoS+2Frq6tbWlHxNhXMbPT4FllW46qj7
	 vJTgZ8yoCQTt3AdiWznLNbIA44q3NXz0+JzT7EBAvzZ7u8N5tsYxGKNSaR7sdpsex8ujl
	 t/7RQoA0MbIrLqE3gNAPvGlQxDc7tfVe82aNWluiyssNDxUN/RSCnO1no0xB2J/8eJtIh
	 700y+WjlGyl9asWg5i4rje4Y5rOB6MB6WBWueaBSiCKNBo7gZdqmJsFu71jkwfxxkReLN
	 lhf/NA7WuaMpEl30RIZQUIVgP1gbJzEGepOoz3VFJYO3Ic/5ggB0CfsRxlxTZ3L1kMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yyZLaNLsFBfc0JqArcrGxcWEFwZyPv7YYEvEtfwd+rk=;
	b=QEKOMsbzh88KCaoo4z9WtWSU1SNtEhfcvnlkGfcoUzy1QeI3P+3Ieh2bTA3D7wV2/XrY
	 53B93u9GIZwWIiTt25SHqORTihdUWArVRpIpXfRrGoIRWWGC2Ff9WzGDdCFNvp1ZsJmUc
	 plkttHVeOJgBOwZ1kJVETEbdymKVG+HOelCaOe/Lb/VsaEE4Fytwq5wPkIrfySI2KyT/Z
	 tHDDC0Wyi+IWxaT9lpwfGhj+Vf7ddA/Ggm5tRfsaIaQiHrK48BGOPp+dNDOdiwT1d49lz
	 kR+9y4D9RQg6c4PZu2NiynH/Pc2yruW00SPjRCTIP4WgqE7tmsR/wgab+S1+q63ApxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Fa/9Iryi";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QpcbNdbX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71BA606A32F
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A71BA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fa/9Iryi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QpcbNdbX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8BRJ82602449
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yyZLaNLsFBfc0JqArcrGxcWE
	FwZyPv7YYEvEtfwd+rk=; b=Fa/9IryizRttAHlUczN/6wai6NYxknNzBYBuBmRe
	NDt4VFh45iJ7hI+MPeJ4R2GM9riVStt4nxDR4y7MF60N1Ilg1hozREdZGUO/fea6
	FRVcg/9sS6c4ubwFp60b1dTvcV7OO09I89EJoCIRlrBZ0+ZFgUyV9SbuDmcZSYYo
	rzmubtC6D0DlMC9+7Ql+yf8bUi8vhMzgK4fl0sJ+nkqlv4xYprIv+z6ZrM0V9DBK
	mP4Pr19Ez5j2LwV4H58BGr/7PMfNz48w1KDCre8iWrNi1C0KtSXiJOvjs05senUV
	px8XfQEY9nsOAUQGfpxynRuWxEeFTTKo2d33wfGYtWyGxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv727x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:02:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so214285285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 01:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794992539; x=1795597339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yyZLaNLsFBfc0JqArcrGxcWEFwZyPv7YYEvEtfwd+rk=;
        b=QpcbNdbXVAbvQf6A9ENt/h49FPzl5txSRygm7X9prgCe4XjomdrNC3kn2bDybgUCN4
         Db8+28s+VaNdkzB21+qwfZ4L4VvjJ7g6H1f23gRPTuMBEQ7ZN8jaIo/uF8Koe3yHy7kb
         0ZF2pDovxkD2mg+yyAKvmS03KsEh0nGrZkWahT6IjQlr1uCUfPuJ2FVriUL8Wap9Prqu
         bgnN0MHUhQeaHCtkGfKtKDLR3pQVAENWpxo5oCJ51m6rXtsPYMDd5kW5xTTvi4fbtPTX
         eVXUqrf1+/KC+b9XmSwEtD7cPZShnyXu7RcoNbszYhrKwH9M2axOTZqlH0NUQmZCsoJW
         IXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992539; x=1795597339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yyZLaNLsFBfc0JqArcrGxcWEFwZyPv7YYEvEtfwd+rk=;
        b=0r/BjLH9UakO0LvOsv3RaU0Rh66asPQRAmQhDZAPP0bCVape9vcJwaWVVvb9BmASMK
         J6gKz9K51tYnu9/dYogv7krV8To9jGxefwK3eCyeijgYd2NgUR0VZn3UBMnTKYeuRL1i
         B+A0MhybUbLjYbUSCfoUM8PsVuIEujKL8nOm9qnKfAk/O7sE75Vj0OZtitfxH9CGiOmH
         youAGwD5l2KtSY6N7jOeABjLTD05eDQ5mHIbpgdr3pjJvG/lAhtnGvr+xXVWB7J2wNVm
         cNEpPK+EvkLl31H9y80v2V20dORaYRW560tZpldW0xwmVk+0R9hkOp7m8rzgmBq1EkVy
         kbDA==
X-Forwarded-Encrypted: i=1; AL+hErHo2RUXp+/4DPl6TMDDPT0YJ1IFUQkl3864OsCWUmvolJJJDNIPE6fuj4T89+J/AD1lOdjV0jEceqSv54uI@vger.kernel.org
X-Gm-Message-State: APuU4Z8eaAT+Oi8LibK8aqhJ0HK0bwaLuGShHyh16vOEydZ4MNexX1ff
	lqCeb+47nHArNjtLLgw8ES4LdDhHjwgK2DMFu0oWGNL+IeQUiHQjefvF4qqDnLggBWlavVi0hnw
	FhRYfUUCOmgZ3X0eeOjeib6/dPlQvJpoVsnuZNqTFmnefrNq5oOCFRkVUQflVrPdh6I2c
X-Gm-Gg: AYBFou2w7o1yLZ2GDMtdKDLOSdO0MkjyDlZx0KK8zStskUtwTpbM8PuhQri4By8snyQ
	swP6UvwddIeDQRxoDcOHgjT4QABEUid/P7Rvi1c1rrLX2IAedRVsbJE4kiUETTI6OMzeW0Oq4LN
	aBYrNoXOyqOxd9UcTr0t92uGp9o3gHep2EFiEas8Z2fZrAR52jPslAaA/c+qECLOD8xN55ejUXb
	DQ/aaG7moEza9joaGisXK9SP7V9NAftHdCeLTHHlZgvLxjE62AoME+KiN+DhFH/IlyI7l463Xz7
	W2tS1nNjJ09Louch2zrzgFl3WwOEcpjIOx2BpuMkAivLxvB1V/UxRXroI4zxt3kMMcu4R8qVziQ
	WSxKSMCH4KUR/lfvfQoxo/080wWatOlZmqEfa2kbkGKReXYIzdtOeILlv2ANy8qFrMMOez95VMv
	OBvUAuh1yhWaWRtWLkjDxairjYTdYPqdf3idFDY6f+NdizciiBJkjc60cwVqLOFw==
X-Received: by 2002:a05:620a:628b:b0:93f:2c95:658c with SMTP id af79cd13be357-9499957e6famr377682885a.14.1794992539369;
        Wed, 18 Nov 2026 01:02:19 -0800 (PST)
X-Received: by 2002:a05:620a:628b:b0:93f:2c95:658c with SMTP id af79cd13be357-9499957e6famr377675585a.14.1794992538630;
        Wed, 18 Nov 2026 01:02:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae67b429d7sm4551491fa.36.2026.11.18.01.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:02:16 -0800 (PST)
Date: Wed, 18 Nov 2026 11:02:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/5] iommu/of: Make OF_IOMMU depend on OF_ADDRESS
Message-ID: <vwg74npvbwdhepp4uownnzlj2ybpiknfktfvrpy6462rdw7snd@tj4vgnn3dtml>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
 <yvkcq3zirv5tz2amfbk52a7smbsqs7jrzdisq3qxzw6xkoxklu@rplx3gvxhcoz>
 <dd62aee3-4f23-4904-827c-7f776c4be60a@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd62aee3-4f23-4904-827c-7f776c4be60a@oss.qualcomm.com>
X-Proofpoint-GUID: 6ji81yMGoIUTkgWUPcg5VUoaa7jHTtmc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfX4iUIfZw/uJn9
 XRreNnbyE0zpbY92Jsvqwnl6Mk22YBpbY8BnUpG10dEKWMNRQYwcp4qwiUZ1dwpx/HYA1fXGmQ6
 FQO/8cPmAqLIjZwIIMVLM9f6F51Iap7fHijS7kjLDw7FjNXXfjKo2psPr0wg6uPd7KFB89Io99r
 7Mr39rNblmExJjzryJ+GTD+K29E/BLdUIUEGqzuKYWMBcMwhSZsI5Xcw3XvB5KnvEzuJEDLYVrU
 bGFX2xjcqQv4qRdqFMo0mgf8bHOJEJctXObmYnO/NdgkQfeBIMvaQ+eO0Wr1HqMODRiiaWyqwmb
 fA+d/1Km7iFWopc+ms2abM192JtDEgsxtG3gwZGjdHYCtEAC518vDg5OwKfyaAawJi7M3EvYHVz
 4oVyEmb8N2lYEXNtfY8w0BExi/kxJwo80HvEkCNEOowWpgW0KzhWan+PNcDhgIoFU9B/WG7oLG2
 snzrERDDV3rHU9W9H8g==
X-Proofpoint-ORIG-GUID: 6ji81yMGoIUTkgWUPcg5VUoaa7jHTtmc
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd699c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ypECYpogRKzTefqxK8cA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfX3q5nOCNGUGMw
 af2lKLWWCAca5PHT4U9yckmCClrCxPeoQURD6CMYVQFmRdh4BxdixMx4TrGvi7wKyzL6sZzzX3J
 SKLFiSn7zLXZHjvQFMzkU3m7AHwsoZE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180035

On Thu, Nov 12, 2026 at 07:10:38PM +0530, Vikash Garodia wrote:
> 
> On 11/11/2026 6:33 PM, Dmitry Baryshkov wrote:
> > On Fri, Nov 06, 2026 at 10:44:26PM +0530, Vikash Garodia wrote:
> > > The OF_IOMMU code relies on OF address parsing helpers, but the
> > > dependency on OF_ADDRESS is not expressed in Kconfig. As a result,
> > > of_iommu.c contains CONFIG_OF_ADDRESS guards and a __maybe_unused
> > > annotation to handle configurations where OF_ADDRESS is disabled.
> > > 
> > > Make OF_IOMMU depend on OF_ADDRESS and remove the now unnecessary
> > > preprocessor guards and __maybe_unused annotation.
> > 
> > Why? What's the problem that you are solving? Why is the current code
> > bad?
> > 
> 
> The commit describes the problem as "The OF_IOMMU code relies on OF address
> parsing helpers, but the dependency on OF_ADDRESS is not expressed in
> Kconfig"...and instead the code had checks for config or __maybe_unused for
> cases like sparc.

What is wrong with this approach? What is the problem? There is one, but
please state it in the commit message. Something is wrong, otherwise you
wouldn't be fixing it.

> 
> It was discussed in prior rev
> https://lore.kernel.org/all/20261104160346.GD3951195-robh@kernel.org/

That's fine, but the reason must be capturedd

> 
> Regards,
> Vikash
> > > 
> > > The only architecture supporting OF without OF_ADDRESS is SPARC, which
> > > does not use OF_IOMMU, so no functional change is intended.
> > > 
> > > Suggested-by: Rob Herring <robh@kernel.org>
> > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   drivers/iommu/Kconfig    | 2 +-
> > >   drivers/iommu/of_iommu.c | 4 +---
> > >   2 files changed, 2 insertions(+), 4 deletions(-)
> > > 
> > 
> 

-- 
With best wishes
Dmitry

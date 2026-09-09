Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78F047C0E5
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954465; cv=none; b=lfMHS+4X6zTmYTPGqa5jSTaWhclUk2S86/sy1y7HvmxPxLKNdyuPZ0wnK+VIyyZSHhY9op690npyakzVXJL+RuhJz0Uzn8qnd7wqPisP4w9Ktf+IP+HjSinGBZpgq/wL0NWR3x9bnW0k9qCIAGa8P6XYH9tjfSkn/yhNT2h5Eg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954465; c=relaxed/simple;
	bh=bE7gFNvJpgqAb1CCf/LUtrOOgo9UiCo9vR8xhbQKK7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lFai15zSl2rj2z4qzIYLDaQzuJ0s8JGkEH1jVjVfpmI3GIokfq6ii+eRYerQ1cPFbrjSyeuNQnPHKgsfcoZIA5L+OxI2e5y6fdPYj7FmxCiEitjXn7sX/mFkCEQQv0NCQxVk6z3xnbmFlhcRXdRXn11z0HXKYeegjcJxXilxsdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hc0SLmX0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SfTp9v+M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hc0SLmX0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SfTp9v+M"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU4eb1183704
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5LtEQ/D0fxKgSOw/wwJk623IFAnhoZEdLxvz4TnSVR0=; b=Hc0SLmX0LuMgPx2/
	s7usEhsEMGxv40BYRumnoi1d+ragd1vSsOAlOEIYhmukDhMvpNUEW3ShpMNJ7tgf
	N9dGlxVMk+Cni5hkkoLFsyJRsM5lbSyIU+UAY5c3lFGguFMmX+MehFOtIjTvaEvo
	+BFXKJUG0nj19kr0RTN5wktKr/l3FWfF2dvpEHIhJJZa0OedoGskYHrkOrsPSGa9
	xTKLsiXsl7iaK4pqL8ZZDTZO2nlzdpipBVvssR4QZtRMQ3KUKUwNcxEsDNs6yIxp
	3NAFWmkjHiV25v+XHSiF9m1+YpC1SbIRwE1alcPsOCYpUPml0yX8nCME/CNEHAdn
	34w1KQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559re39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:47:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6823efcso59124965ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954461; x=1789559261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LtEQ/D0fxKgSOw/wwJk623IFAnhoZEdLxvz4TnSVR0=;
        b=SfTp9v+MoAN855dcFDV4GOpBAoeSnkO7HFmgdJzwW3nUWhM/++vzKV525gqAzQ+kTv
         5uIJ62oxzM6XNYQF1+6T9TMqOWurlrxavPEaYgR57+9UabW0cl/y08styhzj3ipt0SHj
         j/6fO3kiq+ZzhtBYLW1/27eSghFIjBuSQJF77z9OzRu0Gqs9CHA8g6JystdfeyuMzNDc
         +h+vt1qvVhD5izBR2KIKPVX6xFPvVrL7UX+9ARhGyAmW/12y/DMmkzcs2bym9BtQKVQE
         tyUFslBN+9fv/PAVg8ofX/Ant52WoI870kYsJsPWG5brKfca8uvtSQwhO2xfBCQfrqrK
         Z5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954461; x=1789559261;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LtEQ/D0fxKgSOw/wwJk623IFAnhoZEdLxvz4TnSVR0=;
        b=sr97Zj2QeXStVN/2BYnWF964qExDpDhTSeBwr+oXSzd9RhhWf8NVFVpQQKFSOKf3lC
         rSIr09d5B3Oz93QbP5j1TsTyRDBudCd5lIyO0vU2r8aV4/DBNvchxo6gPprcEj8oIij0
         nqFRnyu8L1h8o8aI2H7FwuFvXMPEzUCjx4vriOOfLRya6QneThwGnUSzkmkoSR5ZFLxk
         gk32pobQFsB7O4mdvae348iS2mP9fIZKb6l9fIYv8qWz5yhQ6bDaLm3zgGa6kyTHc2Kc
         Ru2vYuTtBBBbrPB5M3rh32607R/8jmR/vNLTSFBNTb4mGD9PHQCVTymLDSFHSnnbKXMt
         QuwA==
X-Forwarded-Encrypted: i=1; AKwUvBwZvW7MMlnViO7aEmD5a3ut7U3Wa8MI17SjcyDMBjtJMC6Nb5UAEFVUYAu17bzLajq7hjG9GrVjDQYxx1HN@vger.kernel.org
X-Gm-Message-State: AFuF++nn0DemWlzExBlzQJxXjL/0m1XATeSXDOOApXc4QfKaO9PZUoEq
	YPO5Du6lspkIQTDmd4bWsOqY1ZUNp6r46qUOsh4z+oDZDQXP7v1ysik2a5Dw5+dQKzIhgjWv7Sy
	FKxvnxOKGqsGkWD2o8biY8WA6WUpbya483xIW1W/q3HthoqNcpTxrcJGE4ShpkMfqA/jm
X-Gm-Gg: AYBFou0Q6w4qe6EnRBQe+1zxs05ITVPHlDC20ehwuDaeHcyzmFqDX//EO7DcljsyX/b
	a9gvtYwXwK9iWQSu92UnWDNfo2XyHZLsHCP220SGF7V4tfsfOQNtjaU2W++OMDIHFKy62VcKxeC
	VfruXHdn9PXwscuk3ak4k3wQv7cyq9TgYOznDV78Xr5wjyJ1vFln2rn9NELb1YwC3LkbSgdLMR6
	BKJcTrz8n0iQWJXskyfJ6cZr2dXI3iOSfBMST/4mFh/XMKTXeZ2BTaSiAaVggfThcZ3a4dpQsKq
	kSC60OII9hjP6H1DP9+SeYcfaZbkG2+qtSFg3PBUzqfRg/GMhzD3oJADzFCwo3JxORG2Z1/n+yu
	FWSvFr2Tl6R5aIBTCneU2O/CctE4OvzGM
X-Received: by 2002:a17:903:1aec:b0:2d9:6db:9fcb with SMTP id d9443c01a7336-2db125ca3bbmr502542075ad.11.1788954458801;
        Wed, 09 Sep 2026 04:47:38 -0700 (PDT)
X-Received: by 2002:a17:903:1aec:b0:2d9:6db:9fcb with SMTP id d9443c01a7336-2db125ca3bbmr502541325ad.11.1788954458215;
        Wed, 09 Sep 2026 04:47:38 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33825669695sm20505746eec.3.2026.09.09.04.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:47:37 -0700 (PDT)
Message-ID: <86e53b35-b096-41d9-b15e-e029ac59d84c@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 17:17:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] PCI: dwc: Force L2 link entry on shutdown/reboot
 without D3cold check
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260905-shutdown-v5-0-f0c6bafa1d4f@oss.qualcomm.com>
 <20260905-shutdown-v5-2-f0c6bafa1d4f@oss.qualcomm.com>
 <tkcout2ymlzvcx6my2hal5hgh4fxcpppxl2t5s4wogz3hjykp6@k72ig7seb7m2>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <tkcout2ymlzvcx6my2hal5hgh4fxcpppxl2t5s4wogz3hjykp6@k72ig7seb7m2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa1475d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Q-PrnzyzFlRskm0mrpIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: o541hiZXyzMtjAR5me-57yaTc50Zw4n6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX4N5nMwS6E9m9
 EIk+C/fHcxw8d8F0nNAfUUSKOjYySVw+OiKEO5G/CkC4qebdUSVXrb9hjVQzb/tueQQ+V9f2uZA
 NqhAigtOQNotWcWzri0ouHO8B0FlnHc=
X-Proofpoint-GUID: o541hiZXyzMtjAR5me-57yaTc50Zw4n6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX56Gy3h087nj9
 TYUfi5aEO6II4zx00M+SzIv1HmcyvLLMcB+oUpTmk/JJJca+SK6ZbmCxT/WlOcuFpkyTipLPm6J
 Dcyfdiwkk0syqhMNFfLin5R7Ap3qF5AnTyQLmYTh7t3a7l7N69d7Tu0fkQ6udHbKbmDU82MJvx7
 NNpEuwuNC+jcEz2M6slKCPEkxngw8ejD67JxorIZtKnvCzVfraFikN/4SJ3HtH7eutLKOK+iadv
 qYKGEpb49dQvwMWABzfV9ojaovS5A8D3Oz681qMW6ol+JJVWkq3eOEvKxHv6nLxmE/nDKGo8bRp
 fA7bUOj2dQnexL0UWSQgP5PFBc4ki8hAs0tZNsCRzyiTAvMc4Bzkqb5nSlTI/MaTe54Tpovf/60
 wufH66f52D6ORdUoCRMEP5xSfhf2A2WSB5xXa+9Of2cBMosI+cGXwLkHYUTjgLL5UzFBt8lO7fc
 w2MrW2XEXxmqHiakMfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131



On 9/9/2026 4:30 PM, Manivannan Sadhasivam wrote:
> On Sat, Sep 05, 2026 at 06:18:49AM +0530, Krishna Chaitanya Chundru wrote:
>> dw_pcie_suspend_noirq() normally calls pci_host_common_d3cold_possible()
>> to check whether every downstream endpoint can be put into D3cold before
>> bothering to move the link to L2. If no endpoint supports it, the
>> function returns early and leaves the link up.
>>
>> Querying D3cold support during shutdown is actively harmful, not just
>> slow: pci_host_common_d3cold_possible() requires every active endpoint
>> to already be in PCI_D3hot, and returns false otherwise. If any endpoint
>> is still in D0 -- which is common, since endpoint drivers aren't
>> guaranteed to have suspended by the time the host's shutdown path runs
>> the check fails and dw_pcie_suspend_noirq() returns early without ever
>> moving the link to L2, leaving it up right up to the point where the
>> system cuts power/clocks to the controller.
>>
>> Add a "force_d3cold" flag to struct dw_pcie_rp that callers set
>> explicitly to force this behavior, rather than having
>> dw_pcie_suspend_noirq() infer the shutdown/reboot case itself from
>> system_state. Still call pci_host_common_d3cold_possible()
>> unconditionally, since it's also how "pme_capable" gets set, but ignore
>> its return value when force_d3cold is set and force L2 entry regardless.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/pci/controller/dwc/pcie-designware-host.c | 5 +++--
>>  drivers/pci/controller/dwc/pcie-designware.h      | 1 +
>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
>> index f5a38e6fd8d7..a8a3861c2956 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
>> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
>> @@ -1224,14 +1224,15 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
>>  
>>  int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>>  {
>> -	bool pme_capable = false;
>> +	bool d3cold, pme_capable = false;
>>  	int ret = 0;
>>  	u32 val;
>>  
>>  	if (!dw_pcie_link_up(pci))
>>  		goto stop_link;
>>  
>> -	if (!pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable))
>> +	d3cold = pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable);
>> +	if (!d3cold && !pci->pp.force_d3cold)
> I asked for a parameter in dw_pcie_suspend_noirq().
I misinterpreted your comment,  I will do it next series.

- Krishna Chaitanya.
>
> - Mani
>


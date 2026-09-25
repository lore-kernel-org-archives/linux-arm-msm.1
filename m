Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51163DAAAF
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 05:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790312408; cv=none; b=MbZHLzXoEubpmgjFi/amAfKRgFEWjSSAP3UQF69PnE9Fj21BOx7gAz5zLc9gNz6vy+SuRdf7PSDKvA/K/1TOlDx83N7XvM1jrv6+UhKLHgn6DY6a/7GQWrYc3GN3mwDgPjH5c957UtZLdJnzzYHsvlDhvR6CQZoGzZnVk8cFmIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790312408; c=relaxed/simple;
	bh=RtE2yICuWC2Xzmr/th2q8pMy+78oOgXrdrBPWEWIxno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSMzxfE0U6XKS4MH2+tDYdBWUz09QELyZxQBc0+DTjD0ce9RfePf6aYFJ75PNGcfVmZoyUg2gHROW6twvaVsPTojz1sIRXQg/S1tjg9mh1zha8Pbdia/uYaXuJqaPQ4fgwMjN+/tNpcnkBZ0wu4CX4LR40bknD4I/GCr6CTuYgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyRXfnyJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SR/gM+mm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyRXfnyJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SR/gM+mm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YX663535360
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 05:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3t+oYdWH+6ysPGxcESScSMlb82KWXBBZjf5aTFSETg=; b=KyRXfnyJwC9C8keW
	KIBTBCfJ7RL+uh01GnrQL5XFTO4vSGMYisiWGmaMSKJe5JifYI6JjUJ+iTlSukkU
	INaE35sHExeXSa8N2ndPWNBBtq+58njlHklZPOT8wRj9JGS6h4FI9Mv6GFyRKYev
	8ULMuqSuPlJ6FXUxLNMazWIdVqMwDOFSRiDP6zRWwCMNfbAVnz/nyo3ndvhAuo6B
	kIdyPV9a9ynHZEb624rQ/rYwbwVf+gDoho3FPEoXDVqmTCFtPhxiIeKDxKjnF2vR
	+CvAFXzxKe1Vwawe8GNCzSjLotz5ePTG5dUheU3uBZghzaoKxyBQy3v/diIi6faI
	mkn1vQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7uvxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 05:00:03 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34111ac07c3so624353eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 22:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790312403; x=1790917203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3t+oYdWH+6ysPGxcESScSMlb82KWXBBZjf5aTFSETg=;
        b=SR/gM+mmxtLZwkCX1scxYLrWWYGI88dj94ZS92G5WXG/vxEk+TXqhUiFRcPfdkROlH
         ral64c8dPufrJB5+dQcYzkO+9PgCLPu9hWl2XAUo3Dc1siFuzacZR7snaDpGLM5rt2DB
         1G050k7dsYgu/xpFJQMQgtOPERU76wILLqwFdk+peferg3TKBHI4AZH/wlwCu5/r5bac
         XvZOLLNlOeWLDPoYQ2j2LnEuKz2H37CLw45atORJnRV4gYUBc/IdHwWokL86Fvh/V1u2
         K9iDa+l7nzofsmWTpJu+BxwNGLwT0mahAeHA1T/lYjdMRbJPOr5GXkb8qV6jd96SieJh
         1fvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790312403; x=1790917203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3t+oYdWH+6ysPGxcESScSMlb82KWXBBZjf5aTFSETg=;
        b=2YW//C65nnefZDPw5Tn7yOZlrSQaUojKmZ7JW7k90ziWp2ab+83cTY6T/26coviOdH
         a0FlFFO0QnIUHxVIPiYJnTEE9umRGS7alP4/TTSLFCmsf/w/PCPLcoAndLL0kEhnE/4m
         tifQe36r6rr6+dDsBSPeh36H5N8HivsCYJ12J9JAWFUbg8z2yFuDLM8DSiyrOH4T8B21
         fNlZL5hVW+O7NqhHVVCYrTH3T8B0TUDXKO2N+1CYvszUp/Q7kLCy+GcLQkQ4NJ6zJw0c
         tV4ioOrtzUgjkGZv0EiEUp8k3mlInqcq4TmIZbrtsjfbmjaSFfOHvthuQlrFWLyf2Zwb
         X1Xg==
X-Forwarded-Encrypted: i=1; AKwUvBw7sBmD5muLVjIqLEM11QA/kTDwKPDagwQbQN3FRAHeb4kNOhf5NuVXW1huXcga8HY3pIsuqejzBaBi+EZB@vger.kernel.org
X-Gm-Message-State: AFuF++nSRcHG6bQThbk1U2ACYmvpwMzpj3LtWedqI7wvJdTIZSYe/I1I
	dka32XBQn+xG0dJBvGXXhQ1p9wFF8GcxE5bRdIXNhTfkkPm4LvFNqd0WhYzoUMyg3Ky1pclEnBh
	3wNr+kJDHUFGMEAxilII1PWa51DGM2IVNFFILMaV8i0lIGdbxBDRkdM7AAbhsWQNp243n
X-Gm-Gg: AYBFou2C3cCFpdAFMbzreC2gA5uesTKiT+xLQM69bqdCbUYT12EubR0hmi1geNzWJU/
	0+0PYnHmN5yTvY5GFQYQoDUL+IZ0uYbLQoHtDqkkEae+gu6tdSaqquf8BzZwMe60RFlvgSdurET
	H+0ra1NMZxTMDABxUcMFf+18OIsQC52jycYoddfNv1nuSU+aVz9uZ+sxJw95QKzH0/g6tdFxLbV
	I8RHPVdGpIETWTjRg8yRxWvPC9RCir2QEaIPh3nMGsqD7UJbfy6DDcaBkk88nXmkiL9z70GLLKN
	CW5N59a4/RkL0PGN1qw6JI1PrL/MfiLPGtPr7URRaJsNXNgGbkBcIbDlKpiP6yAKUlvGvJcXAj8
	tuXCeSt+PR06/wrQ4fw+e6Z1JIyh4CfH2CtmAFwAR
X-Received: by 2002:a05:693c:87d5:20b0:33c:34b4:85d4 with SMTP id 5a478bee46e88-3400449d085mr3558578eec.10.1790312402354;
        Thu, 24 Sep 2026 22:00:02 -0700 (PDT)
X-Received: by 2002:a05:693c:87d5:20b0:33c:34b4:85d4 with SMTP id 5a478bee46e88-3400449d085mr3558551eec.10.1790312401716;
        Thu, 24 Sep 2026 22:00:01 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414407d18fsm2941091eec.10.2026.09.24.21.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 22:00:01 -0700 (PDT)
Message-ID: <fd578600-d9a7-44a5-9131-8771262f82dc@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 10:29:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Prevent GDSC power down on suspend
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260128-genpd_fix-v1-1-cd45a249d12f@oss.qualcomm.com>
 <zfs6krk2whthgdjl2s2w4o5pjwimzw37afoiyrqllykrk6jugt@4ijk5iqplohr>
 <6osboej6luxekrw4okhlbf3irednx7gduhmqbzqkkgd3ldm2cn@esalet4ruwcb>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <6osboej6luxekrw4okhlbf3irednx7gduhmqbzqkkgd3ldm2cn@esalet4ruwcb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1Ksd_DLRC52Vghikm7WY0jE8wVYJhNG6
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab5ffd3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gd26oBflmgMxjqPpG_sA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAxOSBTYWx0ZWRfX0kN0qUHytdzB
 ajX66kOOPhu2+yvz5LhWhRFOc3R6Xh4OWn1IFrVqkC1FUX5tzQWSns3A8pBqvqr6dzuIzaqn1KJ
 yvwoNr62TmR8wmW5Zo9ea1q4ETUEODGo4ImmIh3V35zvv8IThsgsASz8Pq9DMh1HXX0vryUMUW9
 Oecg+1KK4lQb626TLcUeZdGU0T9GNZ/aa8QAF7uwVtZQQJkuegH0HA2WKY5pYEDr9iGoBhWVbr0
 a2uTSUEsSReNniGm4CKmdshi2mhVfyL5Je36W5RXFMYBRQo6pPJlBSdFetV4LaAhsojRhTsshYE
 Il8S1W7TPaB66xQvspT3/yEsK+0IUxd4fgX/7VGEpCHt2s1PD1VANEruA6bSeuHWsiG3zVytUEP
 5MK4loXrvznopkXDElWZm74VBpi1OUMYZ3kbDCocMwsNNa4K18JXITLmX4J37h8JneI9VqH2RZT
 LZuee+jor9bTwPW0vWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAxOSBTYWx0ZWRfX9kBBoZZhoYlL
 yYdavTtgCDK6Rlhq15x9EZKnP4aRvxg8aa1Zs5pz/buxoB5Bfpu2yBO3ZavtqLVbynlYXnTp8xg
 YqI6A87CsaojQTxBFgS1sA/FrVIUYgk=
X-Proofpoint-ORIG-GUID: 1Ksd_DLRC52Vghikm7WY0jE8wVYJhNG6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250019



On 2/18/2026 6:03 PM, Manivannan Sadhasivam wrote:
> On Wed, Jan 28, 2026 at 08:13:48AM -0600, Bjorn Andersson wrote:
>> On Wed, Jan 28, 2026 at 05:52:42PM +0530, Krishna Chaitanya Chundru wrote:
>>> Currently, the driver expects the devices to remain in D0 across system
>>> suspend, but the genpd framework may still power down the associated
>>> GDSC during suspend. When that happens, the PCIe link goes down and
>>> cannot be recovered on resume.
>>>
>>
>> The GDSC is a child of CX, so by keeping it always-on, you effectively
>> put an always-on vote on CX, forever preventing CXPC.
>>
>> In fact, this is one of the reasons why the PCIe GDSCs on most targets
>> is marked PWRSTS_RET_ON (in the clock driver) so that the "off state"
>> doesn't actually turn off the GDSC, but it relinquishes the inherited
>> vote on CX.
>>
> 

Hi Bjorn,

USB host-mode and PCIe non-D3cold use cases require their respective GDSCs
to remain enabled during system suspend. This requirement exists on multiple
targets and is expected to apply to additional targets as well.

The affected GDSCs currently use PWRSTS_RET_ON flag. However, this prevents
the GDSC driver from disabling the GDSC hardware after the first enable, even
when all consumers have become inactive. As a result, the GDSC remains powered
ON unnecessarily.

We propose using the GenPD synced_poweroff flag instead. When synced_poweroff
is set, the GDSC can be disabled during suspend. When it is not set, the GDSC
remains enabled to support consumers that require it across suspend. Consumer
drivers can set this flag using dev_pm_genpd_synced_poweroff() based on their
usecase.

For the affected USB and PCIe GDSCs, this could be implemented using a poweroff
callback as below in gdsc driver:

int gdsc_synced_poweroff_disable(struct generic_pm_domain *domain)
 {
         struct gdsc *sc = domain_to_gdsc(domain);

         /* Disable GDSC when synced_poweroff is set */
         if (domain->synced_poweroff)
                 return gdsc_toggle_logic(sc, GDSC_OFF, false);

         /* Dont disable GDSC in HW when synced_poweroff is not set */
         if (sc->rsupply)
                 return regulator_disable(sc->rsupply);

         return 0;
 }

This would allow the GDSC to remain enabled only when required, while permitting
it to be powered down for other use cases.

Please let us know your comments and suggestions on this approach.

Thanks,
Jagadeesh

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF09055D866
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 12:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957765; cv=none; b=p3jsFIFonHZINaBdQE+SvdeDOj2qk69GQCBovZz5jM1avysybqq8UCJat6KtgY/doxV4BgGnXd4RDOywOWzY08B+db8GmzX/g7YvBWK/0f7sIPj8vC+L2H5e5fsiC/IcAo+/cs8km9AMQe4yfk1C6KOA19Gd+xvTwT9TH61QeG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957765; c=relaxed/simple;
	bh=0hWrdz4q7rb7I/HCxd1hEn9K+roy/g583HdMM5Nqfwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbtF8/zEJgpdtn7PEaV+U4bZ7/LaiHz97z0eqMcOAlGhtOrREEuAcidTdbqe2LFBleO1IPNZYD6S8C+wmCEFCZyX95X86nOwvW7FcwEJNuDBGDzRtqjBXSmMM3SBb0xj1pNHyjRRzVtulQj9qyW4RXtz3NuBYj1FcpMv3ibsTd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V86TYKj4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwhlHyQh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V86TYKj4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JwhlHyQh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUF611183852
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 12:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqDBfWmpsbVcFz4ktvchUUk0YUbACLYsKQhJUiknkwc=; b=V86TYKj4QA7r5O+E
	eFBqgvx4oO+e680cr6J9GvM6DOoTjxM8P033ihrA8i0ZJey4nNFepfWdwAq3olyC
	kXzPWwyhGMmmRBPSTKizUEOyTteHtYTjZItSLy+dyPszLP2icApNnxvfHRFQjhCY
	VwDVZCjyBPqNy88IjyB+XL38TAsVEkIIsLi55dEnMosQcAViHMqBvy5WNcQI5ghh
	XLgG10687Y3r7UtHlTcq7kU+LZyjE1vk06jXZgOlD+46t7diSqAe7EVOWo6cSW9l
	yFp7dBCpmNAU3i+XVWLPLeOdR05EsUFEtExWP3LQCceIEkuFoKNXxx3hSdvCwxj+
	ZTLsYw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559rmb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 12:42:40 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7ee59eeb8c1so4017870a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 05:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957760; x=1789562560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IqDBfWmpsbVcFz4ktvchUUk0YUbACLYsKQhJUiknkwc=;
        b=JwhlHyQhO6GBsbQC1bteQnnpKM/2K1vIVAwY+U89T9729bvJJGjY5fLeygdRSKsmxN
         AydiXVSy3+UDjpjMbleyxJ62BImYh7aQIotTdMoknQxJMjpOhtZv786SK44UtlvXvzcM
         JOm2b0OjNMR28Ep7hnhg5E2xoBxbYT34ANlvSfjbDsRQ0G635QYNFaWTvZPIVoY/0NC6
         gwwHtWLY1SEP7FrTs8J2UFZqktUL9FWdCN/UZJL+FxzZXvMTXr0UlFBVBNJ/nMhg8a6Y
         GvMcjCvZVUOsMinYZQMsjfmbb6YTyr9PfGFAyzsE/e6+3JIRXKOxSGJ6KZElz5T79MmK
         Dwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957760; x=1789562560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IqDBfWmpsbVcFz4ktvchUUk0YUbACLYsKQhJUiknkwc=;
        b=DledUNE4QqLVtcylheaGjx+CcjPoDfB9sjamo+sQrVwRDQnS0REi+9Z9hpO0VGcvks
         MNc2m/W93yixv9ZWOf+kWVcCL+oBI86AAr0xOby9pVor/94oTN/iFqSL24vZSt8bjDHz
         IGSx24nvzKuzqd/GwWIUT7Vk8Od257kcehdVmolsb29SSFWk7RggTHTm4Jb7+v6dltQ/
         HanHhbzE0pODATRT5Ph2Hz+6Wv20LnpQ9sB66gOJw1T+R9ccPGxJyTzvgpxewDkF2aRr
         5fWb7C17Q2h35lpBqdAl00YdAyo5SzbJXrBWifvo1BfQ/Xm3CwkjmOpdY42E7+vmG9sP
         /7Cw==
X-Forwarded-Encrypted: i=1; AKwUvByfsyD7Ry3Hf0CMcGKoDeuaMdyPQk1rjp1+jzFb3Gw8OhcZFdNFenQghvfqLj5wCPQJFOUFVWsIscc30XtH@vger.kernel.org
X-Gm-Message-State: AFuF++mw+B8gF3FwhKSJnXA3Y+aHVqPmqFk5oXVAZJ1PmAlb2iTI2Fvl
	r1BaNf9RAjZRCWQh7iTKrHb7O5jxiVWAhpFaGH+jHaLgOkchpS8nNsAKFUcD37cv95aik9H8Icv
	hrjE02og6sw5FQz4x0I/n8PyDPT2mQ4oI77uvRgyG9f8fq3dQKs2Ges6+LYbnZ998SNC6AJnFTE
	4D
X-Gm-Gg: AYBFou0+LYISywAc0LVRx6wXhhf1zLIyHkAfKctWBGd9pOXLBsxIq3wfBU6jMUo3hsW
	yNKMbY1L0uI37grHnwZ9A2x3oJajkyhi5c1/FUWyTrVgRszfIKjvTe6OAdRxeY1eI6PG47QsXgr
	7Btio/S/lhKhyr0iBGrHghfEzhnP3OM/eqxeftNciWovFzpT0II4htUvBSboVc4C1rCHTZm4aqN
	urdIh9lpbPqO+Ac73CoUEx/da5296c3T26rg/gK+9CI0r2FS64zBuqR7MRf1PYRmPauyLz4WoHh
	awkCdIo4cqf/VrJpwpAZoyuDzgkZt4WtAgNumSexHXeM+uM2aSkQcl3AoXuJWduaXwH07CXbX/A
	OrpmmfgPkG+0fkd4Cuog5xuoGKF6WFeTE
X-Received: by 2002:a05:6830:3592:b0:7dc:4947:36a1 with SMTP id 46e09a7af769-7fa1ff60101mr23258959a34.12.1788957760021;
        Wed, 09 Sep 2026 05:42:40 -0700 (PDT)
X-Received: by 2002:a05:6830:3592:b0:7dc:4947:36a1 with SMTP id 46e09a7af769-7fa1ff60101mr23258934a34.12.1788957759647;
        Wed, 09 Sep 2026 05:42:39 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fa642bc562sm17603801a34.16.2026.09.09.05.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:42:39 -0700 (PDT)
Message-ID: <b4dbb384-9169-4892-8be7-5f5ef62be5ff@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 18:12:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] PCI: qcom: Implement shutdown() to avoid SMMU/NoC
 errors on reboot
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com>
 <85ea66bd-65f0-4e05-9928-3cc2e23f02ff@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <85ea66bd-65f0-4e05-9928-3cc2e23f02ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa15440 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FOk9bOecH7u50CPTZhUA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: FnVa3RRKN8oD1zMVKdB6xOFM9JUO51V0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfXwe3lTV0TfUmP
 LvXrmmjxpNGY6xCAepJo45nTjYRMto5dWnV6daDsdvB15OYStynV4dbRA8NLHFqWSuC5Y5fdh2q
 YwnRf4eHQKcYE1YQVKSycqq4e9UiG+M=
X-Proofpoint-GUID: FnVa3RRKN8oD1zMVKdB6xOFM9JUO51V0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfX/ur5043G98nh
 T0gpfLv6hpRi6IFYXoCSDnzoDocTUAJvGxcAkqkUlC1t0+gwcE3y4RiyKzRK/93sSc92WE6xV+f
 WZK/qN5nu/SAuxBBzGvwB75kPFC5E4ylDUPOcSLZ4g6MDX2B2WgKk1V1mwZ7xsfiI+IuoMzHR3s
 9o5amBDcUJz8MNjeMURffODj1gMs2fvhM7fnlUJDAhl2LP0pLPh12gS5W0sfL1P6ySWxMRSPRwo
 J7jo8+ct/iVMYnOqKkFRr34vj+qBGskolCqWFgcx/rC50mqZHF77yGfNgajH7kim2PEG0NVB9X3
 2mXST8zQ1Jo3WJTIVEzoxqDU9nxV/styzY6TGNkoBZc+UqIEJeDhjE6VRS5y+0M9/Lb8o+3xqr4
 sq1JMo0QfG+PhtEMPaBtxsr7t3Xt7wUxhB3Zz5tXNwp2U7tSgvwXAgcHyANThzL3v+KgmTLq3CJ
 z/DWgJgU8KSnEIladxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090142



On 9/9/2026 6:08 PM, Konrad Dybcio wrote:
> On 9/9/26 2:24 PM, Krishna Chaitanya Chundru wrote:
>> During system shutdown/reboot, power/clocks to the PCIe controller get
>> removed regardless of link state. If the link is still up when that
>> happens, it can trigger SMMU or NoC errors.
>>
>> This series adds a shutdown() callback to the Qualcomm PCIe host driver
>> that forces the link into L2/D3cold before shutdown proceeds, reusing
>> the existing suspend_noirq() path.
>>
>> Patch 1 fixes pci_host_common_d3cold_possible()'s underlying bus walk,
>> which aborts as soon as it finds a device outside D3hot and can
>> therefore miss a later PME-capable device -- something that becomes
>> common once patch 3 starts forcing D3cold entry during shutdown while
>> endpoints may still be in D0.
>>
>> Patch 2 adds a force parameter to  dw_pcie_suspend_noirq() so that callers can
>> set to make dw_pcie_suspend_noirq() force L2 entry during shutdown/
>> reboot, skipping the D3cold capability check that can otherwise leave
>> the link up if any endpoint hasn't suspended yet.
>>
>> Patch 3 adds qcom_pcie_shutdown() and wires it up as .shutdown.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>> Changes in v6:
>> - remove return 0 in d3cold_possible() (konrad)
> I re-read it once again and I'm not sure my comment was right..
If we return directly without checking the pme capability we might disable
power to the endpoint and wake up may be broken.
I taught you pointed that mistake only. we need to check pme capability even
when device is not in d3hot.

- Krishna Chaitanya.
>
> Konrad


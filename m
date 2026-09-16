Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398A65013A3
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 16:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575220; cv=none; b=aog997qEAensOn4G/CMOlOV2MpZf8B+bQ8T9SluRJ3zvHNMVGjpNYGm/LMkqZB3ZI5nnOwPU3xY8uu/I+V4T1N1L5CcpFg2cdw7kuIUIw0yjfU0bgUgS1sGSMZo+cbXtjt9bTkoDsyCcDQbJ1QIs+aOpKEHJe4EtBLjX/Lwf2cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575220; c=relaxed/simple;
	bh=bvzruHOER+tqBVKqHVqUWmL8gkxbGAQ2vbFxKDXxPC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qT1ODGyiLsG8w7RHkF04QKMpyqxc5Xl3Mt+B7wL9Jr886+x9OcnYtS7OJqIRWSEVHLFbbeqBcdygnZlTMhVdLarLjk4yE4EL+YbiGoCEoLFjjWH1gxE/Y0kqvy5QeVOBnxGpU3lpWISy72EW72/nCrlrVqFlCD/H3Jqc3UQUMMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DHv39bTn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XX0y1Bi1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DHv39bTn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XX0y1Bi1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeP0o1855013
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 16:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7D4/ywcwxqoIaD2knicVl0ONbCnWnKh8GAaiP1pjZEw=; b=DHv39bTnzaHvBHmd
	ShUgZGfYOYR9RcSKsUy5DG0vfhX3rIv7tn8p+Wp0CQtTZMPofacDOghO0xmw9WH3
	XMF5pghRjTbOXG2TuClcGj7Gwce8bsqX8vZ2yT3kVkePGGIbxM8hTpMlNJHUnO47
	O161PPoDd//+rcxVg9mUWcIfKNLyQHYTzWoF1A2DuBeM+OSYXgzbSlBgwsJWegeR
	KhRorZ1KV+F4MHkeMX7VHnGU6NsvqlJXVZKC9SSO0Ap4W4cnXnTOaWD6/alxLI66
	uQtkLns62xgSuIAajS1pOhpd+B6IPNHLTK4sk4rocYdyJkqINTBaVrBR1CPMBL31
	6FpqGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3swn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 16:13:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930a312222dso80215685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789575215; x=1790180015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7D4/ywcwxqoIaD2knicVl0ONbCnWnKh8GAaiP1pjZEw=;
        b=XX0y1Bi1m0T9UAbOKXu6dJadeUEZfAA5qxn30bW2/PHNBXKDnUV23qsG3GZIIqs9zy
         uS6m+cfYVWsG9xZv50tPcoL4d/QhfV4ataS7qJxkB+p8BThPXBFyi9awkmBPC1d1DT2X
         bZGU0f4mej4CCjUjsM+gvrP878prI+7/Hl0VSm/Z9CdHjeOyleI9Fhqa0Wtj93pSIhS4
         DX7Bg+Mh/nUgMah3Wk9dQ2+9nsRjh2x9eLdyUJ1OetmRJiHCup4nE7Ereu+oLUQFy4TZ
         VWsYXmZ92Kkvc4LX0V79R+Nm698dNqbb+GJwkpTIoUdPMchjjh8WP1p3dIgfJYGbjkFo
         2dlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575215; x=1790180015;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7D4/ywcwxqoIaD2knicVl0ONbCnWnKh8GAaiP1pjZEw=;
        b=JHLDJyLGJjhWXZItyPokhaNnSAxEzSdITMvbtNFsIK+Fa9dP7h3669yt+c8akLVHUH
         WWLxSKFI1B2VSBcLj/44Hyz3I5KgJpqxWJYSXlhejoa3SF7dXX1njV4YwLVsqWniIcNM
         d8GuyiI0i6QSdTddVa3EeKRqdBJIswzdmxok4WeDYKMb55iY3sYy19TBMCeK4Mb0/fH8
         U9lyxy2j/Tsabcc0Qkoh7EMwJ6QjFrQ0SE1ZWGOJS0VBmkuTfaEoje4DpUl30j50phSC
         qt00PWeURY1RooxvpqoD8WhIr9emkp2h8ZrZ65T+WsN3Xdy7g/UuDj5DVf9kOsPKlatC
         Jl/w==
X-Forwarded-Encrypted: i=1; AKwUvByhXIyilr3j/vaGeQsvY4EGOVelbtLHp1sl7c5+9F4/lonqzinG5WwHsxvUG6S/PrCc4FdflGDUCrUDnz+6@vger.kernel.org
X-Gm-Message-State: AFuF++nFxxomZjIYSg3Nd4h4cdIim1cVHx3t5jmFfK4s1RChGF1IWy1Y
	s48PwuSOygPAb5a7SlpxfLmXfuBOIAd/Do6EHtfTBCPyvPq/LdYfISMiY8JSG7ArY2kuACq44ls
	kD+zkKWK4tfoBl6TjLW1Q/3Gowonc4TCOob38KetC2uHNn4qnAwnfZtTde+mXhAl7Q9bu
X-Gm-Gg: AYBFou3UtRRuAcLeJ0aKwOIEaSDe+PRHOrdILhOcYIY6IFb9aEw0RWbjSDWuWpbDL3h
	31GiYV5AXeiONWybdt5kxtlUsE053kqXPrOJyqX6rpTbTrBeliBXOmGK72kAB4/3JGiRcWn7goQ
	RmwmJS4sUqT80lKRzdfRHKU3lnFQyQ7/B30Qd5WZEqpU8S9mEQESPGsemERKmsPJIKdS4fjQbAL
	FxLZ5Y19vreoZqXtyqTw/3J1dlwKHbgOnVXUwrPWhOBfr9OYDo2P8kG3EFemne3ekKKZRnmPFMT
	COI52K2/LV3doFjCJgULSFV1KDzYqPhCUxnFoEIaJlJVCuUNpV4dPDGadulHfWr+EMcI0okFUMi
	j6e21wD8pHgDs12RV7llSYg==
X-Received: by 2002:a05:620a:19a0:b0:939:c8b8:4639 with SMTP id af79cd13be357-93bb7963962mr456734185a.4.1789575215378;
        Wed, 16 Sep 2026 09:13:35 -0700 (PDT)
X-Received: by 2002:a05:620a:19a0:b0:939:c8b8:4639 with SMTP id af79cd13be357-93bb7963962mr456729485a.4.1789575214958;
        Wed, 16 Sep 2026 09:13:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c3600sm1021028e87.24.2026.09.16.09.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 09:13:32 -0700 (PDT)
Message-ID: <a4436f33-db21-489b-80b2-bf4793925cb5@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 18:13:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Ignore -ENODEV after Root Port reset
To: Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260916-topic-pcie_portrec_enodev-v1-1-5dc7bde39552@oss.qualcomm.com>
 <aqq7j9L76coy65lC@ryzen>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aqq7j9L76coy65lC@ryzen>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIyMCBTYWx0ZWRfXxQthdgX3DUGi
 6uYAwp0glsY0+mq3fchtuNAgqOagRsQbIQgeeB7MJIn/RRugMJqgSg9XJGCC2FQJPOQ51Pgj1v8
 AprcIfGoJ9BrhwkwDlXlQPSPvET4B59IACvlE1FZgxNUwV45FPXA2utXQYb1nwoRFKfjhsnmfRv
 NcGnBwNF7404BDGYYHmFBtHjDt6NbGHx1IkoqbmjAbu7pyX/1Dep4jOPLTETwFt2v/JB9oSzbAE
 sRPRp6FEnM4lWa5+bzoCCqTBDq4965R77Q+tQIQ7R+lexKdxlBN7PyLayhLkBmLZSenMK5Ko7s+
 NQki2s9uhPENyx4oQXlI34pncSvzZV+QzieXBx8t/2DWBgzO9POCxN8HlhN/Kio3gVHWN35GdJo
 Zq/zjLCkiZM+nlha7J5RoxDb6aTJHwh9biPHvXC5Vt3MvE7rHHhsQlxP+jy0VwAWHc0yorrao/D
 Frw2FReyKcXWCnphoCQ==
X-Proofpoint-GUID: YDvYhN1K0lPB6OufGBxsrlcvq8Yq24ah
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIyMCBTYWx0ZWRfX46fYFWXyvI/j
 QBs7SJrtt7bVI8rXgmo9KQu3JKs4o5vrZfthqEMSnbXWdJHI5m/zGDNhT24L6JMlv7R5+c0Nnlx
 zxkv4rt8yZd4K66iTOkRSPCmP5wylcE=
X-Proofpoint-ORIG-GUID: YDvYhN1K0lPB6OufGBxsrlcvq8Yq24ah
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaac030 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rHa_6ZUMNKMLsCsp4AwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160220

On 9/16/26 5:53 PM, Niklas Cassel wrote:
> Hello Konrad,
> 
> On Wed, Sep 16, 2026 at 02:37:49PM +0200, Konrad Dybcio wrote:
>> Root Port recovery may race with a device hot-unplug. In that case,
>> dw_pcie_wait_for_link() returns -ENODEV because no device is detected
>> after the controller has been successfully reset.
>>
>> This is a valid outcome and should not cause Root Port recovery to
>> fail. Ignore -ENODEV while continuing to propagate other link-training
>> errors.
>>
>> Assisted-by: LLM
>> Fixes: 4d88cb82a6d9 ("PCI: qcom: Implement .reset_root_port() and use for link down")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/pci/controller/dwc/pcie-qcom.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index ee63a6ec99de4d07c16b8d6cb68df0d92f822cd8..3d3be9bf798b7c247d69969d6570385b8648123f 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -1880,6 +1880,9 @@ static int qcom_pcie_reset_root_port(struct pci_host_bridge *bridge,
>>  	qcom_pcie_start_link(pci);
>>  
>>  	ret = dw_pcie_wait_for_link(pci);
>> +	/* This linkdown might have been a hot-unplug */
>> +	if (ret == -ENODEV)
>> +		ret = 0;
>>  	if (ret)
>>  		return ret;
> 
> 
> I did not know that pcie-qcom supported hotplug.
> 
> Last when I was discussing this with Mani, I'm quite sure that he said that
> it doesn't, see:
> https://lore.kernel.org/all/20251222064207.3246632-8-cassel@kernel.org/

I don't know if native ports still don't, but the ones used for USB4
tunneling certainly do

see e.g.:
65ccb2203ef8 ("PCI: qcom: Clear Attention Button Present in Slot Capabilities")

Konrad

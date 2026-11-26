Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698448;
	b=C+4m6onDZvaq+V0btsH5ggGywGzT4mAKgmJsDhzEV8mmMxY/a3TNXakPkOPA/A04No3Z
	 ADD/PJpT+V0ifk/g8YL9slz8m7r+G6naku/fQK9oowPS3C3aB5jcwR1OOKq8OB+lBW1oi
	 ayLy0io0KIieWA3hRZEFY3OEeYDqo4q9lf5D25QCOSamNo3I67MSah3jwX5eoMt3gdpil
	 rDd7UJ52MqX/0OBGieS52LkUKdS8tcpxuugb+qPyjQBTJhAXCpW+24cHJZ/ByjSD9Mgrd
	 VdZjHOGPR78A7bqsKlrt4LwDvBbYMNiEtEdpPq8QJv5N1HMboxbva5Eqdc7yLuKVTDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698448;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m/r7tY+1cY+d5JvPnaKis6TXcnMWfsaA3A63jNKdj0k=;
	b=kWlkVxoZxKTF1KrjBhpNNlpCotvmsh6YUmfbkUqHZ8p67Uf44tbOqMh/JkJaLoxuKskw
	 elf4VFkERihzarlbeJ4eM0VIHojdqxV3ONNuKs9fa5SNqRyYlzhtfG44hT7vRCBEt//KF
	 MZ3hYNTO22fFuePv5vEMQXFHeOMDaJRGjvB8PwG1RFpr3yePUefHdOSUO+4J+qMICT+K7
	 6H40IJfZ1wBX8D1nVkc1Gf/1cZaHOtybs2K63T+G2MFC5DFTl5Dlh5qDHAqocqiFnwTF2
	 706Wo5vGl4+YaDVevzm2RHk45GnccUqo0ub5vwBB4XFdToFtV/Gd1o/BegNAiZDj3Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nPx75k5X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cX5Le6vD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB43606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FB43606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nPx75k5X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cX5Le6vD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVU4d4128748
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/r7tY+1cY+d5JvPnaKis6TXcnMWfsaA3A63jNKdj0k=; b=nPx75k5XdhHwI+L0
	l/r2eqJbKaVVDnx2nTTCCltg1LKiPpNOzgpta07hJ/bm+KUR+Y+4SPGfTz3BxCW5
	gCAJwzmwL1kZ+HqTQEZQVeSD050byW6vCtTtluuh9tu6uCy3hsRUQmTh7dSOJTsZ
	0Qs+unUZ1f/2DuthFfMKhOpUQaoqqOIbTL9WoiYOuYK0RMuWg0wATmQ+mZ1yWsPz
	dJGbDZppPbDsFD1Vla99Fpy3C/+FJQt2srhptHUKuFBS77Lu91NzwJUTcuhsEum2
	585k04oDxQD7Z7Re5ttPWlsBi577Vb3c+TH4RoVP8U6R1J/zKHsRgruoZSVR+0Kp
	VPQfFw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vav1jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:07:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9460411fce4so39111385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795698446; x=1796303246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/r7tY+1cY+d5JvPnaKis6TXcnMWfsaA3A63jNKdj0k=;
        b=cX5Le6vDhMfWVUNl2bNqqPkAXCbqN+DiLLUZwWEZp/+WzMJkVF7HhFlpZyvNOcGsTj
         hCCdhwse+WnkswWFnNe3nOAHI9rioVL8TWmi71E+n7USc+1g67uOoaYqxAYFHQrEzpsd
         K8jgqSFEdAo0bBObvKZrdkYkjFub/gILbQWyQgtqGpLBTRLWLqsAYhiwCua4RICGdIjq
         KzrcWTjCFJRidYJx4Y79V5tmrJ0i5ewv48cj4hqK9wz9v31CvV52ob1KM3NOjbD4h6H8
         32FaNk/CkAav3keVSeMifJLjXdizCdLdUBX+IAFcZTN4uurpuZv3lgqAmhMxBHyWMGBJ
         jnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698446; x=1796303246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/r7tY+1cY+d5JvPnaKis6TXcnMWfsaA3A63jNKdj0k=;
        b=Ui0mjC8trF7KFonMtDiS6r2mESvmxUtptINpBryZjPY5Lg72oOm+N8Evj25tmWbP1X
         JdODS22AT8pxmxzW/vBjRyMM2zEOrQhcWgo9q90CAslf103ZXgCqiwFNGVfKx86H+E1t
         s396IJiwfVI6OaIaF2MiVzXdMudxakQJ9Agq0dWZXGD0oc2cXK5AOCNs0MjnGwiLz1z0
         kLpud8zxS8A6iUEfFBcrJF/2X7HHv5fGP/d91y/d4fR2Uv3995v4wkX0zSaeZlgFDVYG
         yvNxAKLc41qZEsLpzBF9s1Uvx+ghbEym4pE532RzypKtXw04I7FXIMiXYWpRGuPSWv74
         5cDw==
X-Gm-Message-State: APuU4Z8NUlUf+PpHq9mK2HrIuZ+lTF0EuFFsRb3RML0NYMqWrQF+SL3d
	aOqn4PQRCXVuGp2LQGKA6IgL9YRSNsdzawbIMfss/F/as8sG0Pn8HH8NeNP22vSNZRsCo6g/41a
	XH0ks930uXX8VpW9TyjzsSK40xCL7SeNwvBcxizc3grF2twKtuZZoVVKQi0TUt4whHlmjYGJyzB
	8B
X-Gm-Gg: AZFdTZc+GJhen2Z1YyIk1Tm8XHdRcGZMioKyMZoezaVoTMyIh8s1/yY6ApRz9A9rKlt
	ssBQIvNhWwgOI3mvwZlRKPMIj8ysz/H3jaJykHa+sC2nWJshYxT88qABtSbMPHjbUpVN4GIc9ZS
	3UEO6Jk1WDFtZB6WoWDa9pDnQooCw7tdPG3T7DSo7SQS8+7ypOnblWTWobn1OWtyw8V4QaJQRS0
	OUuo7fXAJKhKewCb48ESHAHOC7NtXmXilsr/V7R3MMnS7ex4w8EDES7f3bBSZfczFKQ47kPqZkA
	hk1PkuASilIvMsLn9HawoYesHPbKOaGskUiuZbelMXOkAft3Tmo0IHk2uFvwGvTVj+Kk1dGIfXq
	ur8N6YDKltSMe3MnEPXBfTdtL/pG0iKY2p8aRs3n0hudgu3PUca8snPRDz6++iTO2LHC9Xuk=
X-Received: by 2002:a05:620a:72b5:b0:949:ee76:cfe3 with SMTP id af79cd13be357-949ee76d22fmr1906390785a.0.1795698446384;
        Thu, 26 Nov 2026 05:07:26 -0800 (PST)
X-Received: by 2002:a05:620a:72b5:b0:949:ee76:cfe3 with SMTP id af79cd13be357-949ee76d22fmr1906385785a.0.1795698445931;
        Thu, 26 Nov 2026 05:07:25 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm9687245a12.9.2026.11.26.05.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:07:25 -0800 (PST)
Message-ID: <b4aa73a1-ccdb-4ea7-a800-3c4ef20024dd@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:07:22 +0100
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
Subject: Re: [PATCH] PCI: qcom: Skip ASPM enablement walk on resume
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261126-qcom-aspm-resume-v1-1-a34625656e92@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-qcom-aspm-resume-v1-1-a34625656e92@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MSBTYWx0ZWRfX7KLZfPvp5sd9
 dNDWmkwf+d1ipFPQbJXcTYgHwnjbLEozjMyOYwUvoXdh8vxkyEjfFH4KeYMj/ED5gm3xu7DM0Ct
 Ns05+hrqhufVwBJk6WfaL04Ia0vVRms=
X-Proofpoint-ORIG-GUID: riSluJu5DfdlrOpKT94mw2qSSi3EeBBR
X-Proofpoint-GUID: riSluJu5DfdlrOpKT94mw2qSSi3EeBBR
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b082f0f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=M-jGJTmE-ygQmRKCDXMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MSBTYWx0ZWRfX6j4wxdb3fjs2
 w839C/U0vXO4983yICXtTaTtPloqff7xeOiqC0MuinGuk4zlii2z8VVqZou1m+OlX6B52O1OWiZ
 gA8yMT482KFJUT1Y2+bHJcpaZsm9v1qJdnks6JRgILzVN4O430isax386tUj0xx8dMIqc/JHRPJ
 YpKhIGXHeHq9lndy051R/wqrZ6kHdh0u0qOWvWzXaU3tOzVwUBNBHrjJeg8rTlp6qIpdho3zLgs
 01mVsml2VVYSB4XZmGf5VwzQX5rfs8zb8JT5rimdlOSOsxoU2WyQ/zquRQFYzHUZs7d0V9hvBab
 6X3SZCfXQtOUQPlY+vGUlaWN68brXpaPbHWqerJ7Yrm5+p7iZw6sksDtsKUOQ9t8jLTb5Wb94WS
 zqukKcwCT4vnRMUBcN1VbwLlWI2SWKvidhM99CY1Vb1fusABIe0HXTyveGXo6e9WGeZ4g21PFgx
 syb67QvOZ9v/XjqEyaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260051

On 11/26/26 6:44 AM, Krishna Chaitanya Chundru wrote:
> qcom_pcie_host_post_init_2_7_0() walks the bus and calls
> pci_set_power_state(D0) and pci_enable_link_state() on every downstream
> device. It runs from pp->ops->post_init(), which dw_pcie_resume_noirq()
> invokes on the resume path in addition to the initial host init.
> 
> On resume, the PCI core has not yet restored the downstream devices
> saved config space, so the config accesses performed by the walk fail.
> With a PCIe switch in the topology this is easily hit, producing errors
> such as:
> 
> pcieport 0000:02:01.0: Unable to change power state from D3hot to D0, device inaccessible
> ath12k_wifi7_pci 0000:03:00.0: Unable to change power state from D3hot to D0, device inaccessible
> pcieport 0000:02:02.0: Unable to change power state from D3hot to D0, device inaccessible
> pci 0000:05:00.0: Unable to change power state from unknown to D0, device inaccessible
> 
> The walk is also redundant on resume: the ASPM link state is restored by
> the PCI core as part of the config space save/restore. Skip the walk when
> the controller is resuming, which is the case while pci->suspended is
> still set at post_init() time.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index a6a0e3ecd921..bd1ffbf5c21a 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1174,6 +1174,9 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
>  {
>  	struct dw_pcie_rp *pp = &pcie->pci->pp;
>  
> +	if (pcie->pci->suspended)
> +		return;

Is this going to regress hotplugged devices?

Or do we need this bus walk anyway now that we have 

eacf92a29af9 ("PCI/ASPM: Mask ASPM states based on Devicetree properties")

?

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3DA559CB4
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 12:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957500; cv=none; b=BL3JFh7ZFWetRHz35JdAiv7rtumyRI5O/nHdRalQcfF8y1ksWcRFevtFzZOfKdiBHxkmQzoqWTcgv3YiLahCcQsaBNb2axQ7ek4drGSwjcnPpxLPpkB3QeA0jgFXh9xxqte9CLINc8qciYPN9fKENxzshQcQjgH2Xp3iG/A1yq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957500; c=relaxed/simple;
	bh=BKzogTZn+EJ5XpNLtcpAdHyL4/z3Wux8oU3vlZWahI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JsAn/nvoyjjZcDxkVjk+1E9KTgNN532SFlsSrVeCDRFBmYR9hSCnaYUpPnZfAlxyRxuN28aIfxFi6kwUZTUD/TWCfjYcHvpzOog8DHcee12KcMvf5SfGG6xzF/8r24RJkkk4nR3RvE13pDvYRPd0f6t4Lw0cjTFMMdLqOIioIrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXoTg1Rz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWqE+hS6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXoTg1Rz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWqE+hS6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CDDlb3054146
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 12:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7whHKW8iAgsbvfjm2Z5LvT4KF4Z64VMEUZ/xaZ93QCM=; b=LXoTg1RzaUTu3qXs
	f1hHeZ9G4NEQQUs8BC63NZSEkOZT6ayPzxcEs2GeD0ZjBDhf0QhodNxp6Y+gnetD
	o21nIrGYJZOoDfD5LUCIhe7SOnkJWylgWoYFPEI6erpq/RI14LEuNRXkgoNnj7Su
	zRrzFQgBqOEZwAXPNY98G9crsYlgkpyCAgS7jsk9hPLPptZt6xFnxzYcqBjDrGva
	/CxJ5Q1pSzmKqIdSPVmjR0ynehrqZnNOC1v4la+kIdp27JKVJXJldspC2s0S8G3v
	5kY3N0AHLlPFvBd7CXr4fmlVRXktofvrbkBFVUUjmiJ+nySGU/VIw2iJbw7FzJ64
	OrKvxg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk79202y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 12:38:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78a1ec363beso88111137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 05:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957497; x=1789562297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7whHKW8iAgsbvfjm2Z5LvT4KF4Z64VMEUZ/xaZ93QCM=;
        b=IWqE+hS6cCV0guJnsxNl2O+ze/gOkGSwfpf5u3yFAnfOU/j5KaOKHuX/bpeiT+KE5J
         c0zg6njjrHEzZOr2uLB9vV6gUmenHm4BRodddnXVNb0KborGDu61pIxdk0vClY509DYV
         J9vAqHBse3zgVCxLi7E5M61JwIoqt/3AlSPZa7EddS4JLTkjWh2fNNQeHqyKDpe11BK2
         R6yq3jF+onbdsi53rVzNIVUbuxtd6CZm8d4BAXchvq7Vtb87dGnLjkLz2Ehmav+R2GaF
         pbMSKq0PbJ0AFSV9fQqlya2oRnZnaHbpaO9L1nWfpt4RkDqPAbBshezAgf7rM8EqJpVD
         jtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957497; x=1789562297;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7whHKW8iAgsbvfjm2Z5LvT4KF4Z64VMEUZ/xaZ93QCM=;
        b=ORmI0IvzVLLtqzw92SXfybpTaQDjcmMENoHuUd0LH0RFQebUV0YDLkT+RjR7cwq53u
         k7Hbd8DU5rLdlBqzEGn7KJc+UbL2vfqVFXKp/xGuyF68eA80fyzkVPMtd5KxodLLWaCR
         bsC3zACdXof8Emj9uxQ5jj2RmfpdgP8SNZS+xFU81lQtW0r2DND9kv7eG/mCyCV+Pmlk
         qc1CcMnm0hiLjzbCismLDUDjrxsmToNwWkMSpP5mXVlHiQsD9fg/jGCV737v103MynrS
         3zldAX7vClrHKyN9lZVhzmdWJm32GfIHmglk7gWJpgzahT+zYVic0Z0opvpHSNbC8BoF
         PtJg==
X-Forwarded-Encrypted: i=1; AKwUvBzwh4VATnqoAeglZR/UgfJlFds9gkY0Ufj6DhfLzt5PQb7yyDlExr9HaFka9zZzs/YWPh6tUD3rOBe0JSBg@vger.kernel.org
X-Gm-Message-State: AFuF++nsQI2gb5l1b3HTQqI/ofocHoKKiJa3QLiwZPweNDg7lEm0wduP
	2O7EhOtCNxmEOcJEIQg+TWLqcyy8BKDrKVCdxhaoEOzVKiS1td0A3xXNeK8Ek7JL/xFBc/9lTyT
	tuiTykMlpM2JW8AjCBAu/db7dsCVYzEFdWqI02R61wGpeBS7iUAIIkC24ga8YWKWgqxS+
X-Gm-Gg: AYBFou1jNzwLrf9DyWkUDC3fACL5htxqg+gvISwHssuCnGCACNq89Fkdz68tPZsu92i
	HM1A+sZt8/Y0wfMDEZqTHy+lswkUa7Rneffamf1to9RO+qRwhe0ajfbI05+ZbSxktkcvnxf+oCQ
	J+8ILmw+P5TjqkK8dSX+78/ICRjzCpvHB6NryghZRkU+1ZvRjS/emoXSKLPDuO+09xSsKFa+R/X
	IIOfDJcCiTl7tbzNsTupvsWJf4ZEZrxedsjkkKSWYJCULdi6sujX8kvtc+Eyc8NNl11EcFBvm76
	XSzZHqvjLhcDw2Bc+qt0FrlxG9jZVWPjylpQ0o3cG41IC3LfSGTDc3eSdaoopWfo26YPCqfH4ot
	Smg377l0qk/RDl3pxPh3kBg==
X-Received: by 2002:a05:6102:91b:b0:786:c254:b7f6 with SMTP id ada2fe7eead31-78a6082a131mr3898530137.0.1788957496696;
        Wed, 09 Sep 2026 05:38:16 -0700 (PDT)
X-Received: by 2002:a05:6102:91b:b0:786:c254:b7f6 with SMTP id ada2fe7eead31-78a6082a131mr3898514137.0.1788957496296;
        Wed, 09 Sep 2026 05:38:16 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a98641f38csm1237305a12.13.2026.09.09.05.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:38:15 -0700 (PDT)
Message-ID: <85ea66bd-65f0-4e05-9928-3cc2e23f02ff@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:38:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] PCI: qcom: Implement shutdown() to avoid SMMU/NoC
 errors on reboot
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bd1bluPB c=1 sm=1 tr=0 ts=6aa15339 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SpA6wshyjLPcRYPzmHsA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfX2FaEDC2Z80gu
 w7kDEH6pHociQBWvtEFIEaQ5ufr4RjpaTKn3ysp2ktLM5SDKh6Mw+OT2CTrZBypkgq917jClHLX
 UGNfbtW1uhwLmWeALFm5Aui8GCdzwGSWMi1h5scMbzmLRl8yLFyjevUfi50dtonaQ3gzuDyhWuk
 2Dds81pAdxWV+Ynk714KIq8rGI6dJLXfecJJnScwJn2js6wE+Qv4xTENv1a5+PRZeLaoE4MplSo
 IFy64KdFK2xd7geLVaNphmm2ZPgDGO+hMrcOx2HxWgvKa3b++sbATd9mUzDP8UAcQNX3nB3p1OY
 boz6/CoYQJl/QmYAwnevNuja1i9aOLxr6M8VrDmKNj3VuDsLY/nomsfpqOu6G6kzdOmppv4rh2m
 XPxLI7BTBem78h50a51qbeQ6aKOa/vnKom1iopfY1q5WPNqav9noAmMhOmpyi/QigpK6eenQwTx
 KIieOevthoTC4QobAcQ==
X-Proofpoint-ORIG-GUID: 3qBXiPr8kA6nNvpCAbIW1geuH1JRCUmO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfX3D5peqBaDJ9k
 eZXS2asdskyAC5yXitd4FzgH6H2cHIFyVscYdvTuz7RzQDov1t8RJ3w1moVnIbcFpJptdpxD93e
 43+Tjxy3YRCgS/pLo5ayWII62An/Tvc=
X-Proofpoint-GUID: 3qBXiPr8kA6nNvpCAbIW1geuH1JRCUmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090141

On 9/9/26 2:24 PM, Krishna Chaitanya Chundru wrote:
> During system shutdown/reboot, power/clocks to the PCIe controller get
> removed regardless of link state. If the link is still up when that
> happens, it can trigger SMMU or NoC errors.
> 
> This series adds a shutdown() callback to the Qualcomm PCIe host driver
> that forces the link into L2/D3cold before shutdown proceeds, reusing
> the existing suspend_noirq() path.
> 
> Patch 1 fixes pci_host_common_d3cold_possible()'s underlying bus walk,
> which aborts as soon as it finds a device outside D3hot and can
> therefore miss a later PME-capable device -- something that becomes
> common once patch 3 starts forcing D3cold entry during shutdown while
> endpoints may still be in D0.
> 
> Patch 2 adds a force parameter to  dw_pcie_suspend_noirq() so that callers can
> set to make dw_pcie_suspend_noirq() force L2 entry during shutdown/
> reboot, skipping the D3cold capability check that can otherwise leave
> the link up if any endpoint hasn't suspended yet.
> 
> Patch 3 adds qcom_pcie_shutdown() and wires it up as .shutdown.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Changes in v6:
> - remove return 0 in d3cold_possible() (konrad)

I re-read it once again and I'm not sure my comment was right..

Konrad

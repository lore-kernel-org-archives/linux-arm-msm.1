Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4DE3A8749
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790570; cv=none; b=qZgRF/sM+PWoA8GtDdJ0GgI9RKq4CmYdOD/42fVwd6X3C5bQ9X89bJKzeNL7TDKQdOb32Hl3uHaknO0crhPF79NHl28itx25vJL9dIkaK5KnGLi0W91b7kBushliF1PE+Ici2RlcSjO9+1TzFPw+MK5SbLxda9RcoPgV3wv71n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790570; c=relaxed/simple;
	bh=TXcyWi9MxUFrhuCWMhk46kWiqU8K1lwQ74c2cZ1O1Ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iaofT+o/qw1LU10dfUT2uR/rjpGV2b6sDcAUhXI8ya3LQc1RbQF4osHUsJGXZaQSSCExsAPk4CqzlkOw5hLgSX9KgirESIaVFSrNPIPlzV6bMTATgZ9RfiL4ubsXIleVKHunYei7qjuSWOFm4N6MuWJjQHgjgHGa3viuVjRHlYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGaHHMNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HRb12P5p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGaHHMNv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HRb12P5p"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55vIZ4068725
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+O4WBLRQXLDXDWNTb17081RKE4oqj0deMnQ8d0nHMAw=; b=kGaHHMNvFy7zG7ND
	hkv6J/PkR9eHfknH4408wWxAqh6M3u2FeAdPpq1PGVFcMAX957XeTYqywP1ZnR15
	7xC4nSy+N954FNy8inOvHPQy3uXMi8X1xBMGj1YBLsX5Q6uEhh4MRVMl6KkCICp9
	WvBOQZKUvWugQDl/ZJwKfKU6h/RTnHhott6RGwmodj3Uzj+l4sxnUtH1TZdqIJi0
	fKtByN7nlyY1OPTlmYZwnPNyg4wERwh1TRo+wr4sEhF1XvJmGIYNouR5d6StIq7K
	+QcUmSMJUw+aa5PtalbCFFstgZbwGTZ3uDfp8KyiEZo9WZo2VphVIcn4qOnBi8A3
	3fs4DQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjnd39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:36:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90520763ceaso8902856d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 00:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791790568; x=1792395368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+O4WBLRQXLDXDWNTb17081RKE4oqj0deMnQ8d0nHMAw=;
        b=HRb12P5pCKgY7JnBqdPWRzYS7/RyQjB8gPrDGQQTqaOPCkVhua6M87sbhk0yTkGmQq
         8O+wlMF8DUoqZICL8Y62yCek8m3aSseJdg5PNr/nAUTz0I03EZKSV1fJ2t371uCiUK+3
         4TKP0fXLyY1w3BPjmLDcLKlEXeFaQRiA3TSDQeZeuskKYuKo8u6XGUekHgrfkmCtpVGt
         zq0ayH/Hntx/r6A3tqZe1/I0vIFfq+uLZtmAiNm8qMZxhxsYqpBabN6U9UuKZVXyCoQd
         ZEMdYuHYu3Du2rlQc78roIHDlqZfFQaRwGOztR/k6WzOUEXOdSTGXpmOgmpTUS/AerK0
         oOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790568; x=1792395368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+O4WBLRQXLDXDWNTb17081RKE4oqj0deMnQ8d0nHMAw=;
        b=Vdy0Rd35OxXP/OOotnypIEDdJVXJbo75lDFG0grzj/28HPxJI02TH0rjqignDZjN/Q
         rKwP6m+GhSYQYkiAIESEgDwBTZuEM+RioPTbIDN59xPNkiVguUFYllIq0mdwGUBZlT/4
         F8UXlMauOxiqzGv0eaM50C12vl+IevxQtOos3yZQzKCI78988RlWZ0qLfxZWw/Cl3+8K
         +w4NBakGbUtygJd+F/hm1sI9D1WWDlyhty2qvqWWb3QH07FY3smvDD/DCPpqTgf3ez8A
         4csyPg6JP5WvycbFvxiT1UnwmJItCdHRaOhX5Xb9PPvMLby1MxvfCl32Oc8SJhg9FQMl
         KUVQ==
X-Forwarded-Encrypted: i=1; AKwUvByr5QGfJDYSeItK/6L1k1zEo+5GpfvtjA/Fsk7NwJlzLVm8HNAPsOday/4BiOC3UcDQdKtR/8yTKrpTcZB3@vger.kernel.org
X-Gm-Message-State: AFq9FYISrruRbczmQ8YXs1Ja0OEonaIm03MZXGZmoIEN2hPW8bqWrBWQ
	ehB+QcOLTyk4B7HlKPwX+hTO8oqmc4EAXx3dRMmISb1qBqNEDJHmjVcJelZ4bgslHw3xP643NMa
	7w80yIkwXmg6jv+N7Sy/kVTuqbhy4YnM4o37/0pZIpdSJI27kL6Q9hy4FvdKkmXNNmwAA
X-Gm-Gg: AYBFou2EnHPwCsZj2DsPmVcp9acS5WTSTS+BnOU4cMH69pjRVoLrVh5tJV7zLo4Moyc
	/mOerPIeRRKIhOpdbrf7KYBgRaKZ/ZYJfc+2rCyYrusyASqQY2Qc+TdTjAp1ER9XK21WPP+vjWt
	MQ9jZwsQoj4xXvXE1umDPvuT1KC2o4lzyFVAzR8Wpp5I7wO36wW7QfXgieOg5UaB1l9NqssDJ/7
	kh4gmLxX7tQBq0+O4gYI8fEd8HBAahnNLq06KjPTiloX7jqK9isY1cHH41SlvLxtzwC7+SYP4p0
	x1IZqy/NQmK8HlzvAgrGA8emXWlzIAefbb2NfFCrMOgfZAoJ//C8i23ECByL2BCgMCmvXqBOHTh
	jjLo/jAFSsIOfckWIAzKnZA==
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr174331061cf.0.1791790567750;
        Mon, 12 Oct 2026 00:36:07 -0700 (PDT)
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr174330821cf.0.1791790567263;
        Mon, 12 Oct 2026 00:36:07 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac969dsm426611366b.73.2026.10.12.00.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:36:06 -0700 (PDT)
Message-ID: <22703d47-496d-475e-a09d-871c891ec51e@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:36:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Disable halting feature
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261009-halt-v1-1-4a2d7899d91f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-halt-v1-1-4a2d7899d91f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMCBTYWx0ZWRfX882ySxZtM1Rr
 yZsjdiSxdDIJGeREW5r8d1mw6qiXxMEQA+iiJa5D0S6d/Z9h+GCvX/r36/AxAzeb/lXBOVeRQ/i
 N9tH89TE8EAzLNQRQuUSTJbn7m4q87M2tTLS1ZeBldjdDBmEjMUDGvNOYnMnKqxeaXpLTridkf0
 mo/QlZ3n1tA1MmRKZapz5pk5OR8sZv6ibQ1WzD0FR+h69bKBAu7RhS1QqTxwowaoi0Sm9vcOzr0
 0Q2ufWyMRbXVSfnym+QS29WP/fh3ajncFJzcvu0Nz5Hb/Vt+s8ysROWtSBx/D1OVN0EpgKPBhcK
 UecG0O9CTUQ8gfiILGIi6gkKBYZyWgavw/8CaYzx6fDtXtOsf6zB6UcVNVg3d0rWpivsd9ZIvIp
 Q7Ppaq97PR9A65+F3USlMtM4T2KdK2rYb0rmXTrhqMmUTqYoIuuGvobNX6AQSxqzmDdV2ljaWtk
 YYmRNZnePRS3yEfQRaQ==
X-Proofpoint-ORIG-GUID: 2na7H9LmWctT5aamnIf-3OxHb94VC7VB
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acc8de8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=mFIT96Bc5s7vh8gnFTIA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 2na7H9LmWctT5aamnIf-3OxHb94VC7VB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMCBTYWx0ZWRfXwjqKgnL+5qYN
 lywg0ELCYqaIwiDCKzZVSr8MtB3cWP/TbugfKI8+LkJ4W+PnDczY9QlfexqIWDyVCJL6/QHgull
 MDCovduq8bcIciinth13tMtaNsLUFOU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120030

On 10/9/26 2:55 PM, Krishna Chaitanya Chundru wrote:
> The PARF write, read and BDF halt features make the controller wait
> for earlier AXI transactions to complete before issuing new ones. This
> is needed on SoCs whose NoC cannot preserve the ordering of inbound
> transactions from the controller.
> 
> On newer SoCs, the NoC preserves this ordering on its own. Halting at
> the controller adds no correctness benefit and reduces inbound DMA
> bandwidth.

Please explain what makes a SoC go into the "newer" category in this
context

Konrad

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778751;
	b=uO61CxKJQsICnpxF/Iqi3uwtAp7y43FV05lyVe0Fc+nw97pHkOP939a2Sg2LHyN1Df/f
	 o8cr/4UWrkvZVPdKKDYYcmd4c/cmGsyAL52Wl7ghS9NIYHwAz80x9d+aUkDEZTAstfbxv
	 kK5KAvJPNyf9YH73ByFio6COl9Zjwva65pV+z5dEnHVybN+2Mdh+QrqRCdA6DSl2hRu3m
	 4FMGGTfB9qAPIUVZX2r+M6RsfNJiFfwN1E3LxEbuDgSx7KHMKMY9mk2gUxu2ILCbKfAMY
	 i//CqWafev4vnUkWF4hORg97hT1OH3axzsaHIBU/WhCYFNoRGxaUsPuM0RtYwj5otIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778751;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RXY4cOaqM/RVzlWVJzF9UQ04tcS5/A3KbbkTgbKzqmU=;
	b=mEn1UNkFE5QtXWUp+N18brq6Fv0+SADwJniF50bcKWqsRXzKGlM3pP2o/DWp5dnZ6B/x
	 aIrVdco+qUMl5KwWl+4fKpccYZDHWbC+oa4D+H4pGgDQs9CPfsgW5c6tZAeUhEEPkX6l3
	 gR2Ixalk19PdyWnBJCr1aOG5o8vGryk09xX2jURdhODbg+MK5OyXdn88LMwlg5N7cFs2b
	 cd4zR4B8xI7o2s0T5yFw9N86SNP/tHRpL2U5+h+yrUSr0XUjnDFwp/YyiH0NqaIc0TxB1
	 C7RXASQScMNDR+8Of95wkKjoRw8AfPcHc1/VWeOYB6ca/Ryh1X4ToWPEvfkYNefen9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YXuGIaRp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMY7+JQG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB68606A6A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AB68606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YXuGIaRp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMY7+JQG
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApXBS052762
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXY4cOaqM/RVzlWVJzF9UQ04tcS5/A3KbbkTgbKzqmU=; b=YXuGIaRpgSfdu0xz
	9+JVNIL45ylbv1CknDEgFcLP4zf2eLutncMF6U4/ntGdQqpzd1jq3MnmtOWxtfRK
	jsKY+Yv+yrZuYBQYDvXcLRz2s84Ag2QgDM8BAzuqQvudXjKd1ElBrTG9iyr6JV5y
	47KmhHe+GEutkid/7J2s706Dm+eN8PHC3euyBhfNqbExTujvPdQO7wcj2ljD57tq
	ps91UeR88hayTKlDGJt+6ezEjbF/Zd7RlfcLrW4zX2NSxVuUkRQzAnsNGCARI7YT
	ohKXEBWHR9F7i66HpOgIQPiN1OeLpetZd1D7qoz0fXT8KRyBQLL+GdzhAeMG6o/M
	HjaMIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6s5yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:25:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495f7e03b9so77635485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795778749; x=1796383549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXY4cOaqM/RVzlWVJzF9UQ04tcS5/A3KbbkTgbKzqmU=;
        b=TMY7+JQGLIEhywUUxguQNyu2GNCX2Zf8oUsLPvKoI5/HcCKsTBq4843e9OJPaSxKfo
         mLUqrB0xTiqq+iUKu5PU9UpSXm/aRR1g1Sqd8Q7Se+Tc3Sk+bUweqd8heZm3xi9J7cy1
         alUb2AxjuksUoVWnCfCX1OQJwz4TovhVeOcHSdQ+zoW6NsQ0g9ypfgsogjC2xfKkdxj9
         3oE9WHMlMuIAegQvz6o92ptUs39hqExEa0HPor+VGmTsYNea7VtDBIxGFoXap4+fXgP0
         tkxUyiy6rDFQSw9jv9NtERTH5nrfJRq51s6esasS50f56Pro047qTknBKi70g0FQbvlR
         M6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778749; x=1796383549;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXY4cOaqM/RVzlWVJzF9UQ04tcS5/A3KbbkTgbKzqmU=;
        b=ue9xHhi4T08RU+QMYXd/8l6ez+W2aYzvT5gbuEGWsxmh3laby4MtgaZfdC1VVCGvqd
         vKTbIUrXFgtwM4dHdd7hhhLHuxbyoz/kLVRfi8ut9lQ2PXHmf7pVCjeyHigB6pXx0LP1
         yi3TbEL4pqCx52ycMyf7AoW98jBzBR6S04u3fVmgkSxhePAw5Bm5gJoE4SKUJpRT5Wvi
         nKaOpK8rXmR3GAYG6y3AJKx6xlZGCs0j4sUd0nxAhFHvMkeKCGCHeOkvu1YGmCLR33cr
         021vmzgkJyIrC1jUmLc9P1eS+tPywgqR7R7WxJUDLBopm7lICom1ab6kZkYL8+KtI8ed
         QAhg==
X-Forwarded-Encrypted: i=1; AL+hErEC9P853cC7z+94efycnzc4kkq2C1GzcnYaZkAhStulbXt+nFakJuKxtDm8zEBqH4jFZK3Jo+LO5jswsfSV@vger.kernel.org
X-Gm-Message-State: APuU4Z9ML11mRZC0XTxrP251VcHGPlyVcLOmeepT1lQkpaCNfAM3BkeR
	bb92f1SxfBRcKxkDUFxsu5Zmbhca/ycietM+nx3tTqRG1OMD2LR1SLwdecEwdso+0EmrSF4gMWX
	UurvRrhMS7cvLGJQNbJkD3eHSb3yFrt7PPLDnBQFLphPd4PccshoIr0xnWLuzrdXI7OEh
X-Gm-Gg: AZFdTZdXIKN8iqLiTL2MgKyVukFoxRnKHIEUkwmYw/E7myGbCdWwedE0eimCN7zlKm+
	1gLKoyHckUd+/0p5sJmV0CRMdTulLNpP+t0WZU4ZkI0tbnW706nSPGXPdFP+5aDbwkD1l0d+kcT
	AFFkzlflqs6TmM6mtyGNRAxV4ZxSep9B/VqXYwUSt4fGsTNLDm2DiK/FZ+OdrDknE150U0d4ekO
	SbwdvRu5tRhGosBS11d27yil2TzOMkEsBtuEWnyXLKp8kDZufico1TEA7/Rx57EcqwDdEOtTu7w
	bt9e9L1uEQj5+ymQ4Yxte92ZaRNRsaIy35qzjr/pNdq7dTG+yzxrWdPMV0hs0ItfNEQBHDkOjcH
	u8u6+eZKr6CuhWZrMztf/AJkf4Cfap2ywHRud8AB/63ZW8XT7FnFu3WrcFXXIDo4pbSWNGjM=
X-Received: by 2002:a05:620a:a801:b0:949:a385:d30e with SMTP id af79cd13be357-949baa12795mr4351118585a.4.1795778749284;
        Fri, 27 Nov 2026 03:25:49 -0800 (PST)
X-Received: by 2002:a05:620a:a801:b0:949:a385:d30e with SMTP id af79cd13be357-949baa12795mr4351111885a.4.1795778748592;
        Fri, 27 Nov 2026 03:25:48 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2d97sm847396866b.59.2026.11.27.03.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:25:47 -0800 (PST)
Message-ID: <d06c0143-2630-442f-9e6b-89580266e5fe@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:25:45 +0100
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
Subject: Re: [PATCH v10 1/4] PCI: host-common: Fix early bus-walk exit in
 d3cold_possible()
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261126-shutdown-v10-0-fed60d9687f2@oss.qualcomm.com>
 <20261126-shutdown-v10-1-fed60d9687f2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-shutdown-v10-1-fed60d9687f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9TPASxtRinMybZ_v-NgKeCvmCM1BChDI
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b0968be cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1dD4SeorvVlWizVoyX0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX56gx18jlrgod
 PbvG86Rz6x2S/R7XNNCtyQrrmooocdKi3b0mfIsNfrQ5mHG3eqcZSedB+HYKLUWUAfqXLPAzXvX
 09L+EOVeP73SdoiUPTeqSlyFLIQuOM8=
X-Proofpoint-GUID: 9TPASxtRinMybZ_v-NgKeCvmCM1BChDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX5Yzadui0+r9w
 DVV4riSX/3gW6vujECvbdbo7cmpMknVyyiDkJEKGVU2UHj74H/KKf+P9HHv05oaxUaB3ZjUu1Lx
 AT6dzcHBn4cmDKwfnQBpxtIGT5ecE9KNTmrosaMGyzkbPjSEWqnTwgb6af9AE9BK1F7ZOHzCzlg
 zg1dF9DOZiuIJbASemWSqaxplFkCu+Gydcs2o5gxpW91+yo6bpqlXcr2DFqPu6zowZLFZLUmfUq
 mE7fAAKUobLvJLYPgqOkdiRuNDWtPT6sP4LIq3eXQV+mtbP5fGD9IcB8viqHTHFT8B9jbKzJAH4
 WO2Ngqej5NovvBrmEtROm2mXaAHCYFzzDDpMRJ3eQECKxguNxvlDkpFGcWsJ67G9O84KCmDBoj3
 lequuRloFSwBA9V+WHURyeiUf5EcatNDxwjItJHERlpNJm3gqQ+dAmcP7lCy1gKP4iqM5B3+NPo
 uFk0KSsVw9msWaetaTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270045

On 11/26/26 6:16 AM, Krishna Chaitanya Chundru wrote:
> __pci_host_common_d3cold_possible() returns -EOPNOTSUPP for the first
> downstream device it finds outside PCI_D3hot, and pci_walk_bus() aborts
> the walk as soon as its callback returns nonzero. Any device enumerated
> after the disqualifying one -- including a wakeup-enabled, PME-from-D3cold
> capable endpoint -- is then never visited, so pme_capable can come back
> false even though such a device exists on the bus.
> 
> Since pci_host_common_d3cold_possible() already returns false whenever
> any device disqualifies D3cold, aborting the walk buys nothing for the
> plain suspend path: the overall bool result is unaffected. But it
> silently drops pme_capable detection for any device ordered after the
> disqualifying one.
> 
> This matters for the upcoming shutdown path in particular: unlike plain
> suspend, shutdown forces the link into L2/D3cold regardless of whether
> pci_host_common_d3cold_possible() itself allows it (see the following
> "force_d3cold" changes), so at shutdown time it's common for an
> endpoint to still be in D0 and disqualify D3cold while a later,
> PME-capable device is never visited. dw_pcie_suspend_noirq() still
> uses "pme_capable" to set pci->pp.skip_pwrctrl_off, so an inaccurate
> result here can cause Vaux/wakeup support to be dropped for a device
> that actually supports PME from D3cold.
> 
> Fixes: 1d2a29ccd3a1 ("PCI: host-common: Add pci_host_common_d3cold_possible() helper")
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

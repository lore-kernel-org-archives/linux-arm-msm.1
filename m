Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629647;
	b=aSi7heElCmVFTtYBiTYKlnpJBdUuzqHvUxbHmny9ijA2wuHDyMtTsGlI0QFPgzRyB+Qc
	 YFShIWplo9JH8nUv00ls+tTUDzylzTAUe6TWLW9KNFq3Tz1Bkf7kAEk53n2SNFJb0Sl4E
	 WxHE/smojzL5HEI7rkEJWQOWet5XhLwhIM6EInpMEqhXeuS8H/c+k3Mf9D0xpmZTgiKCz
	 4OJascQiUlUvSffKCWcsu0hOvh9Z9CGcQDkGkFPjbsCVYD2wdPyz3+oI3AD9pU2OMQqx0
	 VBgWbWYFprTe7U+RokTVJ4qraZPJhpMVdE4jlM3I6LFdBCpRbr3GZ5nZrG8cw4q6cbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629647;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sJIKUA27TouNgOY6Bz1h90nZcilG5A1+OjspnFYoXZs=;
	b=MJ2CCS/0E498lCGOv1Nn/M70nXFFAvIfnysiftB9vda/i6CWpvcOGTj2dvz+V6/N14ll
	 ZG1Uk6HW+fbP6vezTDVNglSB5Gzi+ywftf32LrMFoF/BIDJaoBzg0dOFXw+zK6HNQGKol
	 vuh81SexN7noBewyOLHvE77mZ9m9XyIFqG/NynYFOYDxGTav91U2g2R6szrFWr5S1mzjW
	 ooeFI5Tt5yPM43V305HPz/7NaMK5A9YbRdvqMgsUpDunOzCSsIaWE4mKhTyQxsDHukjfC
	 cHiTjJXietTGxrActDLg/naRLDZoiYWSw2THmxDy1BxMdIaQ5rHO1bsA5i3YR2G0aKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wq5Hqjbc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDAGpBWX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929CA607BDE4
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 14:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 929CA607BDE4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wq5Hqjbc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDAGpBWX
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DppJK3716250
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 14:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sJIKUA27TouNgOY6Bz1h90nZcilG5A1+OjspnFYoXZs=; b=Wq5HqjbcSdreyUoI
	mPDDIwtGu1jpKnptdHHNPnkCOzRR1uZ+INo9GAn/VDOLTMrvQCZVZ/0jOcOUlwOc
	QdWwulBxyHm91jO7VyjaG355CmpdDTBWHq1Y0vm/yZITo4ldmaAyATAFov9oAnuy
	Bs0+X8Lx25IzyAZbLNDJk9yF1dTRV3paNg9jC+rXmU4KUYHf7Snzn3raFeGOeUUx
	qKQpenn+181puX2m0/Bh3WAoJ7HsRpJjhjR5Ue5ksI9ENfTv7fJgFyezW9SjP7M+
	+8kR4QyVzWUzF3PuYYlh4sv5XauLgpZlLFroyM03DOlhmKPtBfcSol3Ce6NkexMI
	Ne0HTg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka627em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:27:25 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ec78f43e7fso68643e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629645; x=1794234445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJIKUA27TouNgOY6Bz1h90nZcilG5A1+OjspnFYoXZs=;
        b=hDAGpBWX+0BGLdwjvVYYONNWlFcHl9Nnb8MBoyyWqrjBg336MTpLL6klXHzgNc5kMN
         A+757y0KKpgl4G4rE8fgVlEMSid/YKkzrJyayUFJvyJ5cKrLgpV6kND4pacopf4N+Xzk
         S9Ad0QmLqWVWk83gtUaWeG+cg9l6kiAUEy44FQbEYLbmHhJL1deKgRN/zcKGwTQ2Xj1j
         pkCgGlgFTeQQVQrdFm92UPH1JZhITbAVQQVOSxw143eqwfsOTEHswupAmGG9vD/VZIvy
         2IiVCd4gz9XIXbpa38Z7xSwu3l7gKtxppsOYhS8TbQuBufK3AXRLJWX1jWUzRTrs2zzb
         dWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629645; x=1794234445;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJIKUA27TouNgOY6Bz1h90nZcilG5A1+OjspnFYoXZs=;
        b=BWxFQ50VLh+ByEr2ggcT9/ABiYMW7dYFcaAfoOrZgN39gSW3ORQUgCQ0YpvKl9Lx0N
         MgHnj5km/cbfLD1meu+ZpXJq81gvq6NO9AEAcyGSQBbIHExJGhuCj1UJ1lORIUsW+kUa
         /2eFRqEwaYCc+f/nUSAFnpfk+VgzLk1hChp6BhiSNq6k6lSM/u8L8wO/2CADmPUVwx3R
         2RjTvlctJuc2ij8oD9xdkBvPlGNFy1dsX9dIBTDDeUin432GenQ+O6YuwgxUbDxVkA3e
         cDt47qoTbiihwD0jba5Id2i8GycsHXAxQt6zTyxM7x9LZAg9AXWErUVjvkyRMoCUBPkm
         qouA==
X-Forwarded-Encrypted: i=1; AKwUvBylP3cxDwJz9+VWnlBaWoDtVsRGrGlPWd9otiRIphdW8xVWZ3HzPDlzFIif+QotKzYCL5JLYAynYXlixtQS@vger.kernel.org
X-Gm-Message-State: APuU4Z/HA07ZVMhx8Fk+3IS4FHmuAlV/xPNJrKQJtXFTHj6EW/jhp2Zm
	QEcxOq0fgdfkDWSttnzEfRu3JouGeg0xumc+c2d4Z7/s8L7gU9LO2Q3X+mji6MeDQQXF0QTtqXS
	xZEg56hOFCg7kOcAJnC25tNoewmdfEww6f+3uXeGbhIL28yoPScEAgnaxhaboLLEvbU/6
X-Gm-Gg: AYBFou0MbP3CDpfLuoMbGPcolOs0o1sd1jNku3F5ANsq+hPm/zWHoydebASD0LmDXCR
	+eB2ShoFB3M9AIBpFTOWLJE+dJ7IONGTsraSKx5v8icwGSKG1Ml3R+FYG9wQsAOWphKHpOjUy3b
	kBrtR53h4+34/EbRq+auF5Bg5SGIP9s+AjF/v++2m0LLswBWM6eHF9A1EWBKCCn+631b89NsaHS
	1KmCgTfwhQxVuTmxdt6KXA/EASKr5Es3bxmQnaFe8/qOg3Lsej3GWhQNHeZ4SnAW7w9M0tgh0/3
	xngSG51nLriUraAQaPry8/D77uSCJhqWu3UFhR57lbI+LOqUjjt1c7bQLxE/49d14Rlh/URHZpU
	lnTD5iL4itJ/N7jYoccy3jh7OnmmLAa0HHKOKm9r2ix7z5g7QMLq64LaVPw16eqelNGEe4IeXHB
	hsphZvco2WTSZywd17pyP61+5eCSYcaw==
X-Received: by 2002:a05:6122:6310:b0:5ea:c984:5ad5 with SMTP id 71dfb90a1353d-5ec6883359amr4193627e0c.3.1793629644681;
        Mon, 02 Nov 2026 06:27:24 -0800 (PST)
X-Received: by 2002:a05:6122:6310:b0:5ea:c984:5ad5 with SMTP id 71dfb90a1353d-5ec6883359amr4193582e0c.3.1793629644026;
        Mon, 02 Nov 2026 06:27:24 -0800 (PST)
Received: from ?IPV6:2a00:f44:e0:8d11:8079:3a24:c57d:745c? ([2a00:f44:e0:8d11:8079:3a24:c57d:745c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd260sm394744766b.22.2026.11.02.06.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:27:23 -0800 (PST)
Message-ID: <5fc68a91-720e-4c65-be31-8909bdfe6135@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:27:21 +0100
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
Subject: Re: [PATCH v2 1/3] soc: qcom: smp2p: Fix use-after-free of irq domain
 on removal
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Chris Lew <chris.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261102133531.173434-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102133531.173434-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g7Jl0_Ptu9HtvV76aRxS1i8BKui_KGGH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfXxKPTYeNfJCg3
 T88R4x70Yjoe6DFbrfYZlf58/f569xruTlZD4i90ls8V1PbE9hgcsySXPUvnDZPuyVhqy623Sbw
 ljfzDFbpxZ5pe0HtaOXPMhpPHCZJJ/0=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae89dcd cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JYKc2Lh7GAscUsD6JlwA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfXy/qPh/T0KXfe
 ueXdlUKoM74jtbfZGGZ1fDKuVfbX+rKZNXbRz2U+9V8NKpMxcst8ExZtgXWv/T1zAjRztOav8O6
 PftBiP0FHIHDwuSOIYH1u+GFxce8JIfFSXKBvKQAkaD85XHwQQZ9Cxpdc3qVywKDkXayviTm2lG
 o3J/VSxYMoM6ZX7Qhpqg0jVhdlxlOiKUN/tumNQOlrSDgA6/4fXqcCFk43WC/9aRNVy9I2nbYTu
 JMM2Qq6pIWHo4AhEaf3Ecfqz5GynmuCC/yu0PZjzSL0kkQcURHeOJsmnD6Uwpk1nidx+fSu2fKs
 ojKU/GmszF48KSOEEh7c3qirKGEZOpcNlqG3sRbaq1kMvKtNXAbQShfBurjeL4h6z67VRyzbLPm
 ibEbWjVkixs02z+KB/M6/MX1xMR17sSLlLyHaO7qNNLlwfW5r3j62Lg/S0QiGaxL5ugiulxP2e4
 z9DgcqfTG9B3Z8xcbuQ==
X-Proofpoint-GUID: g7Jl0_Ptu9HtvV76aRxS1i8BKui_KGGH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020057

On 11/2/26 2:35 PM, Krzysztof Kozlowski wrote:
> The SMP2P interrupt is requested with devm_request_threaded_irq(), so it
> is freed only after qcom_smp2p_remove() returns or, in the probe error
> path, after probe returns.   Both paths, however, explicitly remove the
> inbound irq domains, unregister outbound SMEM states and free the
> mailbox channel before that.
> 
> If the interrupt is triggered in this window, the interrupt handler
> would use previously freed data.  Mixing manual probe() cleanup
> and resource-managed devm leads to such races, thus just convert
> as much as possible to devm to fix the issue and make code simpler.
> 
> Note that for_each_available_child_of_node_scoped() loop, before
> registering qcom_smp2p_unwind_interfaces_action() cleanup action, still
> uses manual unwind, because it allocates the "entry" memory which is
> used by the action itself.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-02cea59a-8c4a-460c-aeed-69002ab3e72d
> Fixes: 50e99641413e ("soc: qcom: smp2p: Qualcomm Shared Memory Point to Point")
> Cc: stable@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

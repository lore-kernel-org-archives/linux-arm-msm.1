Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F87E3DC4CE
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276720; cv=none; b=NCa5ncZiQmeaS3zpORpUxdXRuBc8Ldff3ECeZ07RQxlcxNcU4q5qILMXEfPxhME/SUzQfAIFX2RPiD3x0c1w7ZDhSODvrpFRuRfY5mSRua4ERnKcLJylXhNnweGTWvoQ2XblVVTiMMoQf6HChenU/hwVQnKqQ+s/FYfEw+cNxtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276720; c=relaxed/simple;
	bh=azHLhJtH+gKPcyQOaCBEJ52eHfs2DznE7laiDir28ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J5gvzEAcQbkq8+8oY7J/bCUXFWLp68q7BAQnrPMbtYwmFhZkryczx/fMDHD0VcJwPNZAdJUuZeOPlTEbH+qQZiwREDpQO3AVZlg7AUkPzMsWVHSg8+FoJsgaYRKxMeYx5Ql3VahCsamL2BPJlp+056PgIOVhb0IyjoPEprpbW0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okIhx4nh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+c81XQ+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okIhx4nh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+c81XQ+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cRrw794310
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WRRuqhKriupZftPV05dQfwXLz1TIHpMOSWZQOjYy63g=; b=okIhx4nhW53LL7Be
	3ixmndzVFMuYGJNWIgecL9igo6YdHmAEQbYj7OTU5xDY4e0VmtbHGKIn3N/x9e/r
	Dm3W25+iITzwWUEg4s0O2iN3f2gIo8JlRDddefSe/Z0UJ0nykcqReCSse/w7+qkI
	17Jpb4ktB99zJR8jdwhMAi7IW3RsKZXR7d0zsYTvqB68k5bPo9vHKzQGjCZAxtCH
	MArG/6TMrvBw20AOlD3zhc0ETcBSme8rP0A05j8bZy5zsBkDJ8hgF701whREyJmU
	bHM58kvvgDzL+7TAVqEx9/lp8ZZ/nZJXitXOTeh/RM+hqrBI51rdn9znxFZ50krO
	8nYvnQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8jtr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:25:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e21552dso113121885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 01:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784276718; x=1784881518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRRuqhKriupZftPV05dQfwXLz1TIHpMOSWZQOjYy63g=;
        b=O+c81XQ+8JXw+mI4jgsWXeTxkoWe1YxhKD/begDszMoNCe5pF0m+GnF1U2cc1MBeIl
         DLVLxurGdIC2dveOhY4MgY29ouDgGY2Btoi5u1qBru4d/6EVPPLYi0l+gfxBkLsNMw/K
         a8NmrQ/Trv54YJuzQw75Pz8iaRP6q/YLjiQUbV1UV7XZsm9wyrAGPxNMVdTLNHXvt/Ci
         ZLRRByieTWTzf2bNYMU5r8g1ePCtPBLDy7AMjGcL07N4TEAFlJU2N2W2BYV6ikvFJxYe
         1/713WrLaBc6/sUW77pZHCV0cJUfPkDTRmxhssyng+5u2Lxmc40JrJegZJKm1buzQl/r
         9fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784276718; x=1784881518;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WRRuqhKriupZftPV05dQfwXLz1TIHpMOSWZQOjYy63g=;
        b=U+bOF1G9pM/EGZeqiRMNsTMEG5mOjnp2J0hAVN2flbMAicSwy+XT8+Hz2alkthbgvU
         AvyLDur6emwIFjiHX4LAf5VoRKzZkSnOESVqLVZgb0Yy8VD8CAZh2Dm+P8xBRjWk8LLW
         c6pAC4nZWleIuSZe1s4fkPzSk93y96jK8XYJIShSbSf3n2Tq+IeAufURAU+1FLxpoQsE
         S0OfBfSaMCpc+bW8xyqp7YeMEoT3iTHpbaquFOeM7gySeoAMGGASeJJlVGIpQ48H544U
         VrZ1vm1i82v2A69fEz3ijYWWGLwnyGZ+vApppb8pRKZUuyndDe6/NP4+DtacwAt/ae8n
         NUZg==
X-Gm-Message-State: AOJu0YwyTTCQ4yTP5JkThQE0EzBSRTqyJnuXJwD+QgnG1DU2A/67P61w
	AgZcHBBsH1/KCjhNXcxCUDB/VNepR6kkN+AXmqKg/JbI03WYOYuWABoqMRbXu0jroHqBq3AiRTn
	atK9lNz7zbsxfozR4p4zgStE+1TR5JaW5onT84SuRPJMel7XFNKFpep74Xt7KoIOXKqry
X-Gm-Gg: AfdE7cl+9xOwEwoXYF36ykCsA+a1kNLCk+cjWdLze/dU1xdyLdBoZ290v0hIClTd05B
	UnPeMcr2dY3Qrsvb9qQrE/nc86b4tpoii4oU0tuOdufj6ZQ9yiGWUVr1MtelrCy1xzn00y5zBG3
	xGuDNI1yNP43M9FtF2durVZ71mM08hnUSld9ZJXj/lQ1STgt+BVXMGwrJ3J9vvG9udQ6LyM/qa6
	mwKI9rrHBtL4ij0wNm5peU1RoCPG9d/FSG/KEDR/YHAQjuwoAlmANxLZetveU4nuTeNvYRdWUr0
	dPncQM9eB9lql5C2SRYwdJtHetUHdGs466ImZ/7pzZJiGNQDfGzMFnWid1uid/UnjNJM4dSajVf
	N0+kUoCHvRnCgQsbGy/pz6OQ2
X-Received: by 2002:a05:620a:4396:b0:92a:228:1bfc with SMTP id af79cd13be357-930b3e2e4famr151550085a.2.1784276717877;
        Fri, 17 Jul 2026 01:25:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4396:b0:92a:228:1bfc with SMTP id af79cd13be357-930b3e2e4famr151547985a.2.1784276717501;
        Fri, 17 Jul 2026 01:25:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009ae040sm40429166b.12.2026.07.17.01.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 01:25:16 -0700 (PDT)
Message-ID: <bfb17a62-4997-4ef5-a005-788533b86ff9@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:25:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: eliza: Add LPASS macro and
 SoundWire support
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260713121816.2728888-1-ravi.hothi@oss.qualcomm.com>
 <20260713121816.2728888-2-ravi.hothi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713121816.2728888-2-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8Bp5XhS7r0EjpkFos7qKCXOMay851w_5
X-Proofpoint-ORIG-GUID: 8Bp5XhS7r0EjpkFos7qKCXOMay851w_5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4MyBTYWx0ZWRfX3Z/yhZAaNZn+
 3EVQhwuWUeK2ciTYIETCo033Bow58nTkmM5mYOMMC4O0hkvNr2yVvdig99iP5vnefd81rRD+hH2
 lAyngsL0P6NzdKZSkSQpmftXjyX6ric=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4MyBTYWx0ZWRfX3FVRn8yH+TSQ
 a4Pl0CfFWs9WScfvT7RMzi3ugGFTo3Alr88IZhCF6UipGPKooiQi69T3rge3Z8XyrynaC5aLmPy
 Gu7d+RRZnlNAI3Ymc1GVTp3kPyvincHYNW/YHVwGf0EEFGp6nK1gKhz4GG/2bwUNld7CDdkgVxo
 OhkO6krTxLC2xKaSdpvbWWwoccIaPdqqnSMFJooggXC1gNAqc0sQoQn7OGFeCLkZY3fWfj7+fF0
 jYSPJELsGWfPbSw0+ZLVIEkhF2XMJrs68zwD8Vn28zEcifB0lPJdJ4hapjbsUdcDz+4co8CKHd3
 64mhpum/HgmGKEv8DwEQ9h+OlNN9evLJTFxMR9zQiyO/81hYRM5U2oAcklHqNDap5+wshxyLzCX
 qSHAHOCs/OaE2bQq+j6SzmaUC4T4JEHEIZ7hcnCqu0U2rJUMTT64CzdWtJays2lI/eFbaz5LchS
 CeO/Pt0JfSJ7iD62tyg==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a59e6ee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gVUA0RD28Dv-B6GTH-YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170083

On 7/13/26 2:18 PM, Ravi Hothi wrote:
> Add SoC-level LPASS WSA macro, VA macro, SoundWire controller and LPASS
> LPI pin controller nodes. DMIC and WSA SoundWire pinctrl states are
> defined inside the LPASS LPI pin controller node. The hardware is similar
> to the SM8750 platform.
> 
> The WSA macro, VA macro and SoundWire controller are kept disabled so
> board DTS files can selectively enable and configure them.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---

[...]

> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +			#sound-dai-cells = <1>;
> +
> +			status = "disabled";
> +		};
>  		lpass_lpiaon_noc: interconnect@7400000 {

Missing \n above

Konrad

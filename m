Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586676;
	b=x7H9CGelI1xTLjMdOZI3NKvlrHTYOlaHyGRHwhyslY4G6EqkM2RgrpBUGKQqPEjt9S+G
	 8dtxRVxYwkJQujwBF1I3k/BCHeQbQ2PKwqz6wSw8iEj7VhP4GL8m4+LoBy/H0zKaz8i4M
	 ej/qTHoFeNoLP7fiXvNKnzWezPGuwdlSxZErcc9GTlMy/zmGhK4WNBbMnc3bKjY4rT/2s
	 oyOuNhvDZZe2I2JSlDcucjnhtmBSMBYv8cdqcrowuTEeJhQc32woOJyCOsnvWJTkaLV1W
	 GmK/jlELkPbqfBRLeqOplT75uPZk6j3KFauhR9wklrcvjnFXF/IfOOwZj0tp4wNYXRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9v6oR379dNMSxnj6f20WyQOZxHY2i1bJNgj0/16ZZec=;
	b=qBPud35zbf9XE2vTFuoonzN/BKQdXPz0Tv/2Cqybutp+JzYUnIpoMk9SWpEqtCs3zgfN
	 JDoOU65npJ0bAHzYm3YCxyABaL+p9TTYGlxYe8alUP7XkMvitVQRGS8uzFFIUlmUo/WLJ
	 6onmpzfZPVosXkeoYWQ+UP4QiKpDNCl1VCMrnCoE7eBnEzbHIRSHJvv3x1HxexyGU/Bhb
	 JIzTbmhnp1N4NG3SZjnwQcUou5uB3U4Z8XXzLLKtoypU4BfNWO4rzVVNGmsoRy1UdaNHa
	 t9m4SjZfkhUNRsk1uNRpWSyO3W7elDvzPQm0B21weo691IDJNMPgGd1N6tN9EXQjMbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvFTPjd+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bzTqa85I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6768C606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6768C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvFTPjd+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bzTqa85I
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg1X6544009
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9v6oR379dNMSxnj6f20WyQOZxHY2i1bJNgj0/16ZZec=; b=HvFTPjd+5tzhkrlG
	7tXsJCR2/O3mAWZ7h2hp6jn+zv0W6eCR3Vu16YG5UzuVCo/JRDpLLRIKQh0YaEMf
	XnsRkcglg9E3595WkeW3fm4sqG58CHHn3Ocq86Th+SalS0XWHTov8xxxYqDupQBO
	Z37QIg840FeaH1GbhlKM67zscIkfuc+8q0gOxCha91031OHGXcpcdCD1su6oiPn2
	80Bi7guepb7MDwMxrqU78fLUhDsbqn6w3kXrYF2OhFApvfmPtKSiV2KFIiCobVWo
	RwOxobMGx1bXOHN7v3TuB3USZGqgKfUCF3oMRNgD8hTbcbggp2zGoeTVlc4FEMTR
	BzV7TQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj48qnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:44:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so19926685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792586669; x=1793191469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9v6oR379dNMSxnj6f20WyQOZxHY2i1bJNgj0/16ZZec=;
        b=bzTqa85IVoO2wio+sWS6v/bQ9I7MsqyGxpIDdpWXpgkfzzgA5fAh++81ELSrL1GcuX
         14c7EQMGfHlYKUdr2dpLr3PQeHZjja9OM1XdfL2nn1M22GLYQrQQ1QfIyXigaZVAx36z
         sgjBwK9EHXN+Eh9PGsu/Lb6yny3326jSm7pAI5o2dX8CizrewWUIZGkR2p1qEz2MK1gi
         DPA7MgFQhvF10Xh6sAUqJh6E6SV9KfCQ7IApvs8Rc+k2CWQucx92N+AGHB96o5Vl7F6A
         uSTjmNMxNxmfj2iXYanuI87+3USg2akwBiVKVxZQ+U+6P9V2SEqVGmCH+8L/PSftZXbN
         qRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586669; x=1793191469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v6oR379dNMSxnj6f20WyQOZxHY2i1bJNgj0/16ZZec=;
        b=cqIHMczw5VjSt5laku+iDKfhy9nHrsfl8fjRg+vUtEHzgqH1pIj5DLt/7CpAtsOJvE
         +c3ZDdsUOcK29UIGj+bcWPMHcO3yi/uVOAUwC//FO2gTxoxIVehInQglM8kjaxpiPvNv
         Abw9qrQ53yuR8Mbwh3n8Q4RKcQ8QH2OnYe2y7tQ7yYiQwlokWPMYHsAzIru/0geJ+B08
         ebR2MxD5CE7liJ8LDA4k0tNrbt+na4c8hVUQE9b6wMxPjdrzIg/kj+fwWnGjvDp8ubQe
         4FQF0ZP7rMy2OTWXb6EbvT+RIve4JkEaPfsbcKSvSY2S57GvsXfQ0e8BqRy77WiOBeut
         KHyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzw2Pi9L+YgEMliUcvYR6JiX4II52JVmU39jToXZFY7SGWTBODNaPQUVGbdMpycEHw/vR2vWuVAjV+MhkeH@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1ucXzcq6R0AhZYdqqvUvhMpj4ct991067RceRbT83Kdu0pfUh
	P2S75/Hmyn9GeRpq8VW9fjIRU4SAsoHqqoSFbc1fUmGJatgiYeGiq47BOCeKvVa7ymR0PIgnpKK
	mu+3xQkEFjrjR06uE/HgfMt+qG6tQSLXAr9V4fdu3AyFQMlBlmiQ4HFmhGSPihSJYVlh8
X-Gm-Gg: AYBFou3RQeQfPPHDHI+2ZpQQGXZkvZ3Guk5pYDPzkZ6xjic1dpio7y4kfAjeXcR9bu6
	ZhJcTUNcQLwykwfJBEBTAs1b4z8TMESruCEF5XZuREVxKiI6lwgxhc7Sw3VcmQ/yeoD7NMXKN28
	7D2vLwejJAxgKZGfEYG7P+6OkyGuh5fGc29MBi+1HrJ/6+Jra0Lnaq7CJV1OKLLFLWygxcgJBZL
	sC186oX5xPSQ8Q2YC4EeuEMHtYtYrv1clVynq1aFBfQmFHFsd+kGkeKfgtCUAUB2Jgt3JnVXcdS
	THJW0hqH4SqSZSmyBSCFpRlPLT/S1v6zY+/ewVCKS8aJOdInFM0xspdCqtgPHQu6yZ5tVZsOXQz
	L84H4Y3WBVQGRD1K8SsFEqQ==
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr466830485a.2.1792586669549;
        Wed, 21 Oct 2026 05:44:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr466824785a.2.1792586668992;
        Wed, 21 Oct 2026 05:44:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f78660sm72328066b.17.2026.10.21.05.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:44:27 -0700 (PDT)
Message-ID: <bd062ae7-74c2-486e-9413-15ca8c943055@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:44:25 +0200
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6
 Enterprise
To: Andrei-Alexandru Bleortu <me@andrei-z.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
References: <cover.1791110510.git.me@andrei-z.com>
 <ddbc631bb95ae5fcc6498e083b280ba2b736181f.1791110510.git.me@andrei-z.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ddbc631bb95ae5fcc6498e083b280ba2b736181f.1791110510.git.me@andrei-z.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: r_keyKKpC9cJ6iWVi9u6z1ZqwlI-Lqgw
X-Proofpoint-GUID: r_keyKKpC9cJ6iWVi9u6z1ZqwlI-Lqgw
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8b3ae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=TO4f5atleJ8-af2fB8MA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MCBTYWx0ZWRfX/UBjzxyEvViz
 rudQ/B2vZFd5wPJuZiYmRdU4+qxXPcJbSmElUBl3lg2DmHh4ZEV+yFg/lcY28OlHIIhInbZlXPH
 Tog2VZMDtWgzzkL3lGUW84cPq7r7+FNt2xb6RzMOczb3DWp/Xv9PDDtPEWNsTPaUfoeJ1jtjJl1
 xRy8eUUlPOdmU8mk4qe/mL2cebpIXyWfjeFVEhur7tSGE3XCJ28Pj4+poadQooJLfA6G6n8Xg5d
 8sK0SPrXNA+x6eAIDIHTkelNgGSNS/4NJeRRrdcVAcbAQhO/sftvxRsSUtOBUmEMudj0V0qhwYc
 C5bKpAyLkcuypu8IBno/3B1uTEfk/jW0tUhjJPBXvgiT5K1Gp5nCPgaDUqgbq/q6mhXAt1GPKoj
 xtZPnWqdSv/93iaJacH5EtM4u5okfULrvpfTRaU3dPgj4tOprCA6TPxpM5/xCi1LumMpJ/L5Q+8
 qDvK8gmkMFO33Or4YaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MCBTYWx0ZWRfX37SZm5yhV8Fq
 WjXSVLBr0MEwSs9F7R5KvCajh78BGwLbjN+WCYiMTiB2Z8wdCktCaoxxUzEyhyqWfA1YP+cgkkW
 zxDll3SXlW9QcGr4GIuzJnIOgXp3mbk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210050

On 10/4/26 1:10 PM, Andrei-Alexandru Bleortu wrote:
> The Ubiquiti UniFi U6 Enterprise is a ceiling-mount Wi-Fi 6E access point:

[...]

> +	keys {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&button_pins>;
> +		pinctrl-names = "default";
> +
> +		button-reset {
> +			label = "reset";

Normally we do sentence case here, i.e. "Reset"

> +			gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_RESTART>;
> +		};
> +	};
> +};
> +
> +&blsp1_i2c3 {
> +	pinctrl-0 = <&i2c_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";

Please keep a \n before 'status', file-wide for consistency

[...]

> +&pcie0_port0 {
> +	reset-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;

No wake-gpios?


> +
> +	wifi@0,0 {
> +		compatible = "pci17cb,1104";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +		qcom,calibration-variant = "Ubiquiti-U6-Enterprise-5G";

Does the same calibration work for both radios?

[...]

> +&prng {
> +	status = "okay";
> +};

Please add a preceding patch to enable it in the SoC DTSI, this should
never really need to be disabled

Konrad

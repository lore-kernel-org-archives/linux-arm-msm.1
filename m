Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204338;
	b=3QpYTFYF2eeE28DhpBcx1N79VwkwagABaYzxAqGB4W/WpU2Z18nWWxdERIXHD8pzxF9u
	 ncW5qwQwZ6/MNPYX+H4zeCWFx744diqzMZ+DmctoqDL4IPlMixo19NPSI1O2uTPPrnuFE
	 nNyVaniIbMcvmAWfg/fZ0QJpE+NZRZVHTFy/3uXolNDu4utv5ToImSLjZ4xPYdhP+BLSv
	 4sFa7ctMDnmtSukWgoaO1hFkqjCqxr46XYD/CbEh5O8vDzO0xgZXJhNDLmDVQC1fGAtr4
	 uKAFnmygxfVOyurz3y9J1yG2937YfWS5BolOosHGGpZjM5DIpXk9KL0rCudLh7uThLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204338;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sFw54XMm1ori2CEdTotFB5r/3eWSVETSteMxiL7oSek=;
	b=bx4Oh3QX9cTSx9wOFpg1Tw+BTTIro6VQz27HyAPqtEgDWXNY8hVj5CefvzYRjuVmKedS
	 X01CWdha13y5AgoLl1TgXzj1lYgiBjfmOwn/Isubzd4kQQ3nO6rKfEk4aaBZLIDm83Bwm
	 EM16AX1JEv+i7ExoQdQWH+H/qv72YROQCTKdmDYaVlwF8Cv69sLLAwIwUDJaHUSTWplpf
	 bFJPV9jkfGdioqZmnBXoOblO0N11cVxbZEWMWnly29bnaXQEnRBGRwUx8AWF/Mh0B501n
	 Nb3SVMhRu4Qu1AR417X5SABMhZe6Bwr2VhDCUipi+CntybkbKfyPIx/xtSC6MKYBOLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="I/BElP9g";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TlZlr6ka;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C351C606A321
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 06:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C351C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I/BElP9g;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TlZlr6ka
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93KaK73900667
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 06:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sFw54XMm1ori2CEdTotFB5r/3eWSVETSteMxiL7oSek=; b=I/BElP9gIq7VJCxU
	7eiC36NsIwEdpPI21E+0RjlT0c2KJVUMIfvB8gadfxCrHi4XGO8x4OGqOz178dQB
	dZoRaKX3+ShDm3cqVD1WciNXbVSLwLUwflEa3urcaQIp6ee85dcXTH7YvhdzOkHL
	pZrtdId59YgeBlbY+8/siqsmOqCAk9b+F9CMhnzVj1mZTrMu95KnKq1KqYYbhCrt
	eL3I8TTXBpW75fMtC/zEKgaTuphMFNX0IpfdA+Ll028zp7gqUu9BHwBKS7TiG/WN
	La7AUo22SCxNQKFGkrZZYpjgsEP9VWVG4TYg0MDRyLS5MT7a0dBVXm0Zgi5Seb8Q
	wob8HA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxd1qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:05:36 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a71dd190b0so2332122c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 22:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794204336; x=1794809136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sFw54XMm1ori2CEdTotFB5r/3eWSVETSteMxiL7oSek=;
        b=TlZlr6kaAtQiHlnbtPWdrCYB2xkZV4aiaLzsYtfMay1J/FEj/SqTvNykCvUoYCP+/F
         eGGOZEg0UBW4qhHwskKEKgkLguiJWmf/bCXUM72y/b5agX5ZHycAYW0vNC8X81XO3ned
         md8GVk4gr8cVWETk2K7yLHgYKz8Ha4H+ZJTMRF3PUfgCHLDyT3cht366w+Fklq1yophc
         Xbirk03X05CERIsGIo7ZAnGfaMygDSIzyXi9HzhoHYGWfthGTqBQkrY4QvzK99toKprM
         JAPXeVeclK6/obIMWlsMRIKQ0ZocGV7wspqR+Bg3ETim73i+3riZcxxc2c7IUvsUL6ZE
         51Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204336; x=1794809136;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFw54XMm1ori2CEdTotFB5r/3eWSVETSteMxiL7oSek=;
        b=LYsSwbIkTCQJm/MQaEuS7pgrsWdymxHh8zZQbwCwlLYLQefXKi2/dCdg3M6ZmpjOUV
         TfraXslqzcfbAf2ZcbZnlpWnJtNFlw6ChE+Lx97t1bbyLlFmZO2FogPS9Illaz2yeRzv
         ARtMaPZICFD94XyIE8WSKlxOurscuihOr8GKegpuUQoop8n0uktUFVt/Q3GrkjsxpCJe
         5WZTk+6ZYlY1fC7dbLj31JJdL+Bcbr2Z17vSbSHOtxXiW6vFzFTFoODtJWb1d3SQaz/s
         a4+vSpgu52e3LC2qej7JaFiuQBLFCWFHFhKJ92kZVmMu0t9+F8iTRGKshyIMdrWCgbQg
         XX/g==
X-Forwarded-Encrypted: i=1; AL+hErGw0YQvcjiIYDYz4vC0yIW5bTbrMPViQoErT+e+ozRQO8YspUbb+4K0OX7f9POVQGWXgoqOYBrlInWOGax7@vger.kernel.org
X-Gm-Message-State: APuU4Z+zn8Qeqi5H92hLZqVCA8xpgfa3juY3YlHhvhr+y/PJHk+nvSQu
	fWkkPeX0Nj+FFoSexjq3y4LEIF1eq/WNdGdESyakDjh9lvhJxd8Q9dcX6sCgKMr6FDNOAgSsbql
	zE3/76Ndl23mOjl5xpewkdcgPLwNd1RcSrSBBwT4Sls1gD7Ph0XqrjhbXMslVmE9c+bbu
X-Gm-Gg: AYBFou0RqCSTxx1SQyBELCXiSZ9Rho6AV7hWhsxBMu9djU10bcLJ6yr06PgHUtdWIrT
	U19hFzZkH25FzWV3QRJXAFpO8S275t52i4BV3vxJ6Ue/A4PeENVjsFMJVPpf55YuLPkr7J1kDg5
	IJ2RouPB8VDrvaAp9rCiewZxBD6sLs4Sj0WHch0F7NQg1GieDOJT5oIarGmXYk/iU63BkZvxclT
	LYzh0lc//L0+q1cf7Z1CQbk351sgBx+BPrr9mgD4TB5e6k8sw27xX2eO9tzsOECvTusxHl2Q0GV
	H4rIu1Pen1uwJ7LmVPW85jpo/0slLEzEgY1qSalrf813Ay0JWT8t70QHv25Hsa2ZvesuMtZ11WF
	LkOxxDmlQuKLduWInXhk5JL5dlEeA+7IDmqXUyKi5FdnrWn6YoknFWgbSaNpFyDh0H8vGvyYzpf
	c=
X-Received: by 2002:a05:701b:2412:b0:1b2:48db:23dd with SMTP id a92af1059eb24-1b39fe87c0emr4454202c88.16.1794204335342;
        Sun, 08 Nov 2026 22:05:35 -0800 (PST)
X-Received: by 2002:a05:701b:2412:b0:1b2:48db:23dd with SMTP id a92af1059eb24-1b39fe87c0emr4454167c88.16.1794204334743;
        Sun, 08 Nov 2026 22:05:34 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm12513090c88.6.2026.11.08.22.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 22:05:34 -0800 (PST)
Message-ID: <5e0f4424-7194-413a-af7c-f6e74d07392b@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 11:35:27 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
 <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
 <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
 <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
 <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
 <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
 <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org>
 <qKk3s6LA2dFNbAVvrsOlf17dn6zizSiyVMf1rJNQOvkvLGxswT_81cDlITq0atMX71Sw0VZu6u9WHK0fS1bzIQ==@protonmail.internalid>
 <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com>
 <3df59469-e665-4901-b4b4-512604194ddd@kernel.org>
 <CAFEp6-0keBgVWbBPCghkxMQAQeLeOHW8By7sQrqhjSGtJaZmEw@mail.gmail.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0keBgVWbBPCghkxMQAQeLeOHW8By7sQrqhjSGtJaZmEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: K2J4137HyQ8lrlZgjWtyKpdHuhRn_xgP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyNCBTYWx0ZWRfXyJmceCZ3TvO6
 Xc30uHPHvn9ich9E6mYtL9SllxoPICuDap1zTzwRc/Z2HyHR2m7V4fyIHw0ZG0IlPwxtAT9QvDb
 6TnAR42G62NZV2dQUrgPudoIwgN3nUcu+0nT6ha7wJFYiExjNh93YueOXSnIHLaQuEY8foSzXUD
 v8+pmqg7vOdCWrsbu1ZkmNuDYWsswafy1CPZIXK5c+cq4H9LynyyUwMVfTdvZONo7TzZhL50iaf
 wgbuie0FZ8gwIArd9VgF06Z+VUr0A4hsuU/WaFedYNFTdlCL5vx4hWIdHs5A0Ydu5CiwUGk7LB2
 2paMO+fvZHarBrpas4fIMyjB/Muqj0+A4HoFsS6pnfYJj/Aglj1b5Ldh/7P33z7pczCXK4X/hLV
 CvfCIYknhAqq/e/ADMYCzypsJDyGkhF3TmzGEWWkfFM8Wb2IDphTRcASw6ALiUYzNPQio8RKVfX
 vYsaHvGPkdTNj8prpRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyNCBTYWx0ZWRfX5OPePTiczaH/
 KlzQ7gVj7030T26SklxDF4XpvVcwDi8W+EK/3R4LRZnXyilurRYFiYkhU1S+RMAOPd6JQ0GTl8x
 aZeE1I6faz+xuNsbiguxzWjufSH2bkY=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af162b0 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=CJrH0-i5KYxoBsuygRMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: K2J4137HyQ8lrlZgjWtyKpdHuhRn_xgP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090024



On 05-11-2026 21:48, Loic Poulain wrote:
>>> Alternatively, exposing logical port IDs such as { 0, 1, 2 } also
>>> makes sense. In that case, the driver would simply maintain an
>>> internal mapping table, for example mapping DT/logical ports { 0, 1, 2
>>> } to PHY indices { 0, 1, 4 }.
>> The media-graph informs which PHY connects to which CSID. The
>> port-number in the DT really only identifies the fact a PHY input exists
>> - it should be considered a mux in front of the set of CSIDs with the
>> media-graph being the route.
>>
>> Since the route is runtime selectable, the media-graph is the boss, not DT.
>>
>> You can try this on any CAMSS device right now, PHYs connect
>> independently to CSI decoders.
>>
>> PHY_NUM_SEL is derived in the driver, not taken directly from the port
>> number: the port indexes csiphy_res[] and csiphy_res[port].csiphy.id is
>> the hardware PHY index, e.g. port@3 on x1e is CSIPHY4.
>>
>> More work should be done to represent the fact-of-life - the mux. This
>> was discussed extensively in the standalone PHY series.
>>
>> The ports being numbered with the PHYs was a consequence of the PHYs
>> living inside the CAMSS node - which we have the opportunity now to
>> break with and should.
>>
>> Port number in DT should just be a linear 0-X for the number of PHY
>> inputs. Which CSI decoder that port routes to is still a runtime selection.
> I think we're all aligned on that. Point was not about describing the
> runtime muxing or routing to the CSID, but rather about describing the
> CAMSS PHY input ID/link, which corresponds to the input of the CAMSS
> block (MUX input).
> 
> So yes, we could argue that the port ID itself has no inherent
> meaning, but it acquires meaning through the convention we define,
> since we still need a way to map DT ports to CAMSS input IDs. What is
> really changing here is the convention used to describe that mapping.
> So, for Hamoa, ports { 0, 1, 2, 3 } would map to CAMSS PHY inputs { 0,
> 1, 2, 4 }, while for Glymur, ports { 0, 1, 2 } would map to CAMSS PHY
> inputs { 0, 1, 4 }.
> 

Thanks Loic, Bryan, Krzysztof and Vladimir for the discussion.

Krzysztof, understood on the DT binding concern. I should have got clear DT
maintainer agreement before proposing a binding semantic change, and I will
keep that in mind for future changes.

Based on the discussion, I agree that for standalone PHY CAMSS DT input ports
should be logical and linear. For Glymur, that means using ports@0-2 { 0, 1, 2 },
and keep the mapping to hardware PHY indices { 0, 1, 4 } inside the driver.

Krzysztof, does this direction sound aligned to you? If yes, I will respin
accordingly and make sure the commit message documents the logical-port to
hardware-PHY mapping clearly.

> If you look at the mdss_mdp ports in glymur.dtsi, you'll notice that
> the ports are associated with their corresponding INTF numbers, and
> interfaces that are not present are simply omitted. As a result, the
> port numbering contains holes, for example {0, 4, 5, 6}.
> 
>> Honestly I don’t see much value in continuing to treat port numbers as
>> hardware mappings in DT now that standalone PHYs have landed.
> As long as it is clearly documented in the binding, that should be
> fine. We will need to introduce a mapping table for platforms that do
> not expose the legacy PHY numbering, or otherwise derive the
> corresponding information from 'somewhere'.

-- 
Regards,
Nihal Kumar Gupta


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191903;
	b=NUWZ9qTnCvAhzpR1jcwQbVUPUmG1dtGQTqBCnOz8G1KOxnK/XBnOPRfSvrHx/PPMLYE9
	 kJ09u/TPQP97XMqPsUz0nEGgrT5PmeHtRkJ1LQRIATp96TdSxoybg0wy92dVt2NaP14SA
	 bc3tX8N3aEHHUHPTrMZFlxhSiIluALn5HnDEAGacMCow7X8HA2PTC7MdcIyF4LVX7MwCS
	 cyonGAOE7pVZC/D638CPxID8ksCwhs9r8SSmgM1jgPXWc1buZs0z2o36LaVdzI9YMp9hz
	 ERsSSnHe/xZJTJc4HoxUfUrCtF/sIaIDtQaurPk6i5IZhRH5pDqab5odl3uHCJntgCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191903;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EgIAfahGgFUgahc8hjQZncsgzkuThHDbRDjCxsznGZA=;
	b=NS2RlVO2S6bI+Is8wawTAv0UdenQa7Zspb1XGHS5wZK7At6to05H8WDv6YhCt7qj0sFj
	 xkrYu9CpvdF6/+qZsFL/jg+YFUVqFun1qxDW7SaNlj1i1FHpSNLq+08+E8YnYrwAFKvQS
	 kTFCLaXteul5JNdiF4db3zOt5OpLZnOwcyc/8LbGmC6Rq3IADz5iFHd+8w8nWplnAXfL3
	 aVlhEtSS2c2hlSmBjYChujNLF92GpVgxbFXsVfV6tO3JqAyFS5UkH6luQLkSnQ4VxJTs6
	 Unjbs7NTti/hWtcipE/OnGTNJw1Tt2RlyTTtYDRcdkRD3iW25NxrVwt1Qd2uXZyIIXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EhO6gJ0b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="iJop/YcJ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E628360A3802
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E628360A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EhO6gJ0b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJop/YcJ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2f51011928
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EgIAfahGgFUgahc8hjQZncsgzkuThHDbRDjCxsznGZA=; b=EhO6gJ0b7Fu/03c7
	QiFvEyoo6+Db22HwYPHzd2kwr9wPbpDhZAKU/8MCPc1jj2bpbeuMXLLXY0AdN9mF
	BwGtOHDebmwUpLBkXi9BgS1bBkKuiDAdfJjQ6idY6o0/P1tbpLnsJsz7o+RzPt4M
	955j5OpYz/cyjUvh235ZXR6G3U2ycbjtt2V+zphuqp0F9HCdTx/uosTXDHiB4G9b
	iL4BpaXwInr24motMXM31/m9wIE8J4ahWPzjdYmN0h/2sQgwjyVt4qCIGHn6B2bD
	IvHvSsqH0tj76vvQ066MtkYsQARmhmngV0zmlLPXBxCn9PIi9juCC8pCkSezU/qQ
	FLTUew==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehgfhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:51:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso2445268eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793191901; x=1793796701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgIAfahGgFUgahc8hjQZncsgzkuThHDbRDjCxsznGZA=;
        b=iJop/YcJgNYAcvki8Sy4PngnQ6VcBdDoihddMzawOZ1J/zYXGnsVKC36ds4SKUmUiW
         jzxCziARLiyhlW6jxcPHvD+aS9JC2cOHQWDOHK2lHqOOKX64r3luwqwl0EgzUeLedeJ5
         wcsVRn4Vs5kACqj41Vp/AMJQ9EuspNDHnPNxdgVWN4j/ME5KEJj7qMJiVvX74BPpYFaG
         h+i2z91UcRCFEeiyUNhFtkkJQ2Y5ab61CbxTKILu8ZyKOa6dJ894TLp/dXkIba5ZqZhz
         PIG5A0BIsd55JVS5ntWL8VrS2eRhVa+qS32fVA/r6TbfjnA7LrreKLnMzxYJqOlF4EeO
         9xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191901; x=1793796701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgIAfahGgFUgahc8hjQZncsgzkuThHDbRDjCxsznGZA=;
        b=tTr4ilhV8Rhd8KqabF0+7OlnsVBuxSkUWXI6uo9zmYjH3UjTTWRryx0CkNDiEGdiYT
         lJrPm0U6vFDfFf756+/FfPsgkN8ADVDL5YZNKiGqIdBW8CekC/FNPQGH0WBT++bxoYx9
         CJLDbwv7ujerCYZ05WyVzRIS6dKvKPpCp5znqDqR94QFVlpU2hx16uUlVCoFECiiAWz1
         6RDs/aXTHIrZO/3vVv85qmgSn40EFyZyIN2N2Coi6m8qYvXCl0YRVDwLYP7Vt27LySDT
         /de8RBJqVxOP4AGF7B7QVArXE7RD8TLJUjYZlIPBSZ3aIFcGYommHY17GP5allyVC11P
         8jMw==
X-Gm-Message-State: AFq9FYIpp1Q4S74LMXdikhR6GkcrWCqOezp51xvP+/tCKI7G03+yp0fz
	Xm59IRLJSgqRJzckxDtC7KaJ8l8V/fxsojc+9ZQm50OP7mEQV8Kjf6YqsZRBnE5btd+ewAZNFzl
	zMIf4tqTvsNX6f6iD/Zb6ajwDrezzG9jg7ur0RbUkJPODVaM87DckUj3OIR+RfVB+9XmI
X-Gm-Gg: AYBFou2Vxj82LgAIQ2aDl4uKBYFizuB24wWeCdEdsD4VlMHrpP4+FxpD6ZaFarpHszF
	uQfmgqgBfj/Bsz4hZY8GTtbeqJYfKLOKCt1DZtc2Czu3LFfVVx56qiKyP73DTiaB8o7lr99VXaU
	UuJM0WvWP2DLddE98Z1fLkZBxax/5PC8V1vBkygrNFe0OdylN/va+bzhWCkurjMhQekywTtuXNE
	JpO1WL8uUsz+kKvAjSnJxal9jP6khOxbSbOuvksUWa/7TofzIlauh5jIs3/JD+5UoE+lnF4sjI8
	lua1usn6a4YBRiFP1AJKRpmJiD8rF0il5ucLjjhodvJA7lb5ByyPbILsxGwWnLwAp0NoXe/S03q
	IIGnREbVYLgpuT/biZgNIoKlFiSEB83yeEMpNHRRvM5L5NaIIDrcLHkKt2COtLlj3ivFuy0TRPS
	84O+JxhRwh
X-Received: by 2002:a05:693c:415a:20b0:369:e8a8:b9cf with SMTP id 5a478bee46e88-36a0f81976cmr8179303eec.11.1793191900723;
        Wed, 28 Oct 2026 05:51:40 -0700 (PDT)
X-Received: by 2002:a05:693c:415a:20b0:369:e8a8:b9cf with SMTP id 5a478bee46e88-36a0f81976cmr8179258eec.11.1793191900087;
        Wed, 28 Oct 2026 05:51:40 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2392ecfdsm7277318eec.17.2026.10.28.05.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:51:39 -0700 (PDT)
Message-ID: <57aef084-4328-4e4d-8ace-f0fc288e478d@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:21:33 +0530
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
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: qcom,sm8250: add Shikra sound
 card compatibles
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-1-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-1-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX5BqeKCoLDoNY
 Jepq0zuz4a12T3d8rocM1NrO7RclekDCtmwjtsetRHIX+QpFWTUn70x5rz5G15qvFHnbMjy6J8v
 OP0rwjhlclKFFzEYizyEk4GOQ9P/R7x/iBod+vNSkLY+bNIiEwYtH2R7IdT1lalwiOHdSLn7Psb
 Te0WzJN344uZKe9zj+EdS8AkgH7BzEt+HtaaTOAHHKrZzMligAA7Uvszunmn345VC3OhDg7B0pL
 2rXB+w6R/DlxnVq0REHdUHtjyqqF6RZmAlQy1LJjdU1tnOsavOETTaQRb9J1TJnlBiNW510xzxL
 cg4UxoBsufLmbfTrROgRZLGhAOeEQ/EBsdG58fpzReM8IwQegaw7Lw3M980wrA8Q1cmnu6xEbiy
 vrK4YXazNlWgzAH1pbpgSQxQ5JxeI8w+hKLJ0X3fZ4dyhlTKPHzIbZXOklD/SMzw5jx4dLzxP/E
 pxh+SG20T2m3Mz2wx+w==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae1efdd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iuzv4ofnY9mMQXrTmB8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: kbTNdKb_Asl0MQUawNHwrrEvj1auVWOQ
X-Proofpoint-GUID: kbTNdKb_Asl0MQUawNHwrrEvj1auVWOQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX7ts1sfnkjLdp
 +YtSuhsdTxDyGPvEt5fskrWZvgKddgIGhTBB5STdnK0LQURSJrNX+sdAYDW8PNgRJ/6fjJDJf12
 rBHB6mT1WjPFD5VKjw1xLLoosysGVFM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280051


On 9/10/2026 8:32 PM, Ajay Kumar Nandam wrote:
> Add Shikra sound-card compatible strings to the Qualcomm sound card
> binding so DT can describe board-specific audio topologies:
>
> - qcom,shikra-cqm-sndcard
> - qcom,shikra-cqs-sndcard
> - qcom,shikra-iqs-sndcard
>
> Shikra EVK variants use different codec/interface combinations and DSP
> processing paths. Describing these variants explicitly in DT allows the
> machine driver to select the correct DAPM routes, controls, and clocking
> behavior for each board.
>
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---


Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad


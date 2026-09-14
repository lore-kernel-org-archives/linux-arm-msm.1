Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4CD41A54B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378249; cv=none; b=c6pzIWYbi1CapBD3BVRX01bXU3u1iikjC8+ZVrNf1/Wav7/xvAelz4wkZmD8qIxSowBAcIkiVzO0Dn48LaYe8FkV/P7RWFd5d5evD83PCMiKuV8aDavDPMmkIhFeh+j7ujgcDJu1XxoK/w5vzxYEUSYs6StntKXP2kKuO494xAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378249; c=relaxed/simple;
	bh=LaWXu73lrgxnM+WOLeLQIIpfXYsTiC4ZzLiUEwSFXJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSLqpqQBq/J1TVP+gheTu8qfV9eTyivxqhMZzdc3NJJdC1lt8TMKn1yaywsZUPwBujG/i6PLetNioByUh4CT1SN6fpyUaIMtnzwMrSjsMNjQ89SyGhJg7Wsb5fH/+PaYoaKLVLc4Ul8S8kuex4/GP6vM8mUSHmCLwTrJkvgiR2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaxEYh0A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzTYUJhM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JaxEYh0A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzTYUJhM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jEH23842307
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QwC6/Am/Axhts9IelVPAe4AEzQV5uQbp1jHkK1vCAXs=; b=JaxEYh0AgFuASaKu
	libuXqFtXFTaPSkzhi/TZSqE/gMgE3Kb5DiXYnnO6C/lKjVoTG8Z3/iEDGoqZlpY
	MdSHWPMqmEzhmVjY0IjxWAVv6la9fSa2lqPgYVstXCEoxwosnzIbCyKbEwHGCukC
	of6ehNzI13uGONMHKCG7OcAM6k9HnXXSeU29/4BWE1x8BQJG9TSUNug+niSMA08/
	JUBE/ORKYw5lisXX3RMUPHKN7+g1o7eHm1TRTgH+ZtSNTe6FNLzjakK7shCMnr0j
	julbwe4DnRPkHv+9ViHp7g1e88xbyktL1c+KX0bXZwybjYzzJ1yJH1sDBPo7UNs2
	sHDSeA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5xvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:30:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso545768485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378246; x=1789983046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QwC6/Am/Axhts9IelVPAe4AEzQV5uQbp1jHkK1vCAXs=;
        b=TzTYUJhMQR7/HoxIedZvnV+3vLlPwtmyDrzAEg4ReMzaelBjTD2kI8RRQQLtoJLRXS
         GIUZ1VnqM7nl+C7mQRrTVCN+GTCNQlU9uSqelUudqeN0dunwthV5vL8VvXqboLU643jL
         7sUs+6Ps/1LR7hJUSw08e9qNzzLQBg//WL9BAvyNsYWGhiC4Vkdqv6dhMfJFTyAU+3BB
         WbSCqB+PA1dFRTjlJ6aakvQX5lIFwgrUZVSUjiw2Dj1lQj+dm6N5ymUSEvHvAw42R4TP
         RgZcA9z2R3XSYOXcoXopnw15L2/LPMlKaUeWho0N0uaC/3wWmToycNjMDI8XC0+Pn9TB
         XB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378246; x=1789983046;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QwC6/Am/Axhts9IelVPAe4AEzQV5uQbp1jHkK1vCAXs=;
        b=EIUADBg9u2+5JgRvvxGPbfkEMKdC0Guff3LYXB72eU4h1ZqmtY9WgHEEHwss73lKFP
         KqABfgFOlrxcKrObj8M0Ag6OqD4C11nsFC6aV8S6Nt1M1kvfasoMdkDUYnQO4y66VMgs
         MOSuuT9gZQMO88JVUg50PPMuBL8O69phL/X8t+X/2jxv+aFWwpZxzL1IsxfPXChS9HHi
         bRrcXgm0obZAcbPhX9qSl5Cfm24BvTlVsGr95rakXwMuLzQYvSj1tFeZ/OhF6fHIWLAi
         kKXDNldJ8S3Zx56dkpL7YNV3kJPHQ7ob1ivRhjAg2uMmV4Ty3EuwtloehHE0wTqy5v8Q
         qPgw==
X-Forwarded-Encrypted: i=1; AKwUvBwG3CkjQFuVFWoREvUALO5T7Fhpk/Agq0NgbnCFfkHYj4FLJ2/uqS3axXk/buM9c/0VlnY9nTNPUwbd+IDN@vger.kernel.org
X-Gm-Message-State: AFuF++mOhkWaBHdVqrJ0xly57gDrP53IIw7BVJH5KyJY+nGAG6nrPnau
	36wvHHKXz+CB7nitR9RwDuAxGvOfWZHCRxLIOCMjk8qipeKCKDYjirsL+m5WoICEF8h6+R0QqsO
	lqAZoLAAPtKj+a/73XxgN6+GyEpXrbJ4veLlghd9RbRlPDYtKuUgpd57EQozvrrLeHyyd
X-Gm-Gg: AYBFou3DRkYWqhs3N0nv6Hs6/ntNxS1sWL7858gHUZm0AG06FE7DSH0qbArqJwns6l4
	72jdo5h4L5vT2LwGHiu8qm5lz24zfcxmD23e733jyuVA/WaRyN2RdksYivkQBtXggAVxfmrlThH
	1WfUCXchFRJmHqPbLrRg6VLf9PrmGlvMIi+e7wqNv2oocT7zdtZLiIL4EH0i7hejnX8AdrL8iKL
	De9KDOzDWf8hFzxx6MGnjQ4fsBVaFSSF+128iY3e+zG/tve5HMZKAU6Y02NSHdEHODmfRX76oZ5
	e8a0QZ3DaU3Uyko/oFH2Tvfm6r6Y7d77WId8lw2j2wh1T97WVzuj4DeBcK3ZDeV9L/iXJf0ktyk
	y+9zkM/lnZ5kvHJ1TKajZsajLwpKf
X-Received: by 2002:a05:620a:1d0c:b0:939:f9b6:47f1 with SMTP id af79cd13be357-93a29a3955bmr222698985a.46.1789378246609;
        Mon, 14 Sep 2026 02:30:46 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0c:b0:939:f9b6:47f1 with SMTP id af79cd13be357-93a29a3955bmr222688285a.46.1789378246009;
        Mon, 14 Sep 2026 02:30:46 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5968cf3sm3895022a12.31.2026.09.14.02.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:30:45 -0700 (PDT)
Message-ID: <ad4b454e-0774-4870-b743-fd0d82d0311a@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:30:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: Use consistent indentation in the
 example
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Khanh Le <khanh.le.xr@renesas.com>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        patches@opensource.cirrus.com,
        David Rau <David.Rau.opensource@dm.renesas.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Yingkun Meng <mengyingkun@loongson.cn>,
        Trevor Wu <trevor.wu@mediatek.com>,
        Julien Massot <jmassot@collabora.com>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>,
        Shane Chien <shane.chien@mediatek.com>,
        Daniel Beer <daniel.beer@igorinstitute.com>,
        Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20260913123234.99988-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aqe4U6EJ0cGnV+Al@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqe4U6EJ0cGnV+Al@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PuPui65D4TYS4u8AbYBPyr38hcwPjSOA
X-Proofpoint-GUID: PuPui65D4TYS4u8AbYBPyr38hcwPjSOA
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7bec7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=chZs0_0Ys9iI7aL1xjgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNSBTYWx0ZWRfX7Ut3WiTHbmbr
 WGKn9SpgM9ytHCBXpzcB6Dj2VyDIbjj5G9ZkZy5DBCAjNLur1tZFRaJj0aw5kCXDy5BHFfcFLi6
 pcTQbj20s9hSSDzNN3VYqEu19jG0t6rVs1PeDKDcIz4Mgq0ZTfTUtDrajJFK890C0I3ZFtj64HG
 5XrtU+s9hi2abjs4yrMMEqazJD/QCSucROygCSFbKhzbYsUXqaaWsNTj1tuO3TAKEWt7JaYAA6R
 hiy4uJ8giQ9ezNpo79Pq8anhkY2jpPTUxZz5D/hg5A+7fztWXKIIxPtV4ykUSfUwdq9/ZOsRvBM
 XIKixJESoN/7z6JxB0o4YyrXrcBTSZXQOMNIT/SAI//2vOEKx0ClxqdSQr0Fn91JcLpoUU/EP+n
 QVU+r+jIz6IvXoFBbDA8Vj5H1y64T7gYl+IFGaGUblHlpChBN3byR47nxRu14ncTXcMT/Jv/64Y
 AWn91s1j2J9Yky/+ttw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNSBTYWx0ZWRfX8EdPlz4rMnhb
 Yt/tSZdPJjrYzQk8U2LpYMz8LvnR2gda0BNrLDtzJ3hqlwLbYCblj2pkMS4YgIsWPdToo2xRi2i
 ZguywcHFGGae1h5HykokjbTi/mnGK9c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140135

On 14/09/2026 11:03, Charles Keepax wrote:
> On Sun, Sep 13, 2026 at 02:32:35PM +0200, Krzysztof Kozlowski wrote:
>> Correct indentation in the examples to consistent 2- or 4-spaces
>> indentation to fix dt-check-style warnings ("example 0
>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
>> re-indenting entire example just for that is too much churn.
>>
>> While changing the lines, correct also node name to be generic in
>> dialog,da7219.yaml.
> 
> And cs42l42 which you also fixup, would make sense to fixup
> cs35l45 which also has a non-generic name and isn't fixed up.


Yes, I'll do a v2.


Best regards,
Krzysztof

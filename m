Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236953;
	b=eneljff7YYIMB4UNTB3hAIUwxPtiAhqPSEFBHjUzjR+rsGO0dCs5TqaRjAdoBSK4Z6pW
	 1JJCa1cqwJ6J4JUgyqdfOt/Bm6hg/+j1ab5TkrA048A0wcUKKAABEzXgwOSbFdUmgKee7
	 j2611xzETfcF7ooPfxbMrwcCKMoA3teKJEhVQPmMGcyPB7jLWR32e1twK3MZmGE1iKY4E
	 sUUtlErOVRxtkQiMKduTMWLrd/t+GbsBmv/Qj6tHCN5m6m3O8EWGP00C8rO91+ZAeXF3N
	 0PjyQIGPh/lbVJjkx7QXlUkM/rOdUgvUUiU0ZXz+M2CwRPTeUdYGa9wU7D4waeUxkoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/c2MG+QoqzfRVVPRzuXT5lQ6R8pNRM092UJK6seiUoc=;
	b=I1WpfSbu6y2/TJFKT7KuclYaiDyL3ZL7LloPLIbcGR5rXez82BInXbi18dz3i8Rce7Sb
	 tZFCN627EvcFpAVwGYikTHEL7a3O+BrYVqHomvE6KtgdZvxRvBfCrEw/HAeoTk0TUDJ6L
	 TrkfGSdBja5xnQGRbY10y6Mm6e2vpZz8J2KrS1tJmCxmwpLnJFxPDQmYN+jjEK7ptA5lY
	 x5jnJa6HatuVYTqC/UYTJj3Poz742XMrs2MCXfFrYsVijyfn4NA9ugE1bY0NnbQ0PUzuk
	 g8g7+NThYvum6XsK5x/9W7GA1VDf/5i0/diTC9Ah0OGU3qOmVs1hqpIp4BZrwpM28nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FJpS75Tc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clWp1fF+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9A4606EE88
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 15:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F9A4606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FJpS75Tc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clWp1fF+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF8b11323361
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 15:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/c2MG+QoqzfRVVPRzuXT5lQ6R8pNRM092UJK6seiUoc=; b=FJpS75TcbFrT2OXs
	WOQoCz4KVYH4VtPyWb3XgVtnnZYhuH/xQyvuynyDgW8DRbEydPCIrrU3PeYCGqyQ
	DxZND5wwIWScDrn7IuLdpY5+F8SW9xsjrMq7bBJNhKkuWzmhtFusqx3FuwSZCj3m
	iAqm/lPA1m8zsIZb1llxHAJdqafx5MNhenBoeuupWzA65/tTJLfuF4JtU3/LTv6k
	22p8k8NTBFjNh8nIYlhXwO92H0kqaKoERw4FwJ8pqTVxgt+FyrUfVcEOfpduGX3s
	BY2F346kz78huXeLEPmo8hSek5dueqtxxkrxnXe8FnDeusm2bifiMOUZD4XFvykX
	5BJJtQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qrk2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 15:09:11 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5cc87885c6eso23853e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 07:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794236951; x=1794841751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/c2MG+QoqzfRVVPRzuXT5lQ6R8pNRM092UJK6seiUoc=;
        b=clWp1fF+ZhrbDzREMjnU17D2ftR5MNABk/FSmdeNvgMWdwjEvt5VR1k3WVBiB5m9Bd
         AFVRfCvbmoEQXwASMfI07fp8SdHYwOjYKMQOfttSkGf/YXQ9rBw6dAjy/cii7JMwnzaM
         QPxc7p5mCIvDiFaGvNmZQR6HwOciV2zikHT4SX/nVzcF85zlJcZgJo/K9Lymwc1vzgX0
         k1/tbL9NJlCAPLXELYEr8dtLoY3LdcQ0AL1GdMKl4bmh0as419PufnhE7LkE5akngFRs
         MZ6r7Eir9bGX9sijbOc/venRp7kpaDlH3LRag4vK17vNGfSXhyt2TnkH8Pl9PUXejpBW
         RcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236951; x=1794841751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/c2MG+QoqzfRVVPRzuXT5lQ6R8pNRM092UJK6seiUoc=;
        b=n4UBQ998rXvUO+rmJ+qS0wpqrLo2d3ubBVJzMdCODYyxuppBKZfObX/p6VbGanz2IB
         ttxiOj7PhWt/t+Aw2v/aiw/UJVzZPCLEAeKxLv6O4h4NyOWkdlr2BRv4K4RoZPzXfbLy
         ReGgzKlmz/Pa4kIy/yPgMcLQOyOHBNPeCWbrSENuzktW3d2OWklUFXT0o19w4ZTE3tVb
         a2KrKXJODGpQCz0jOii3KkkIbkkGh9qnM4rZsyrXZsbsDcpW0/1SzEHDzLEf6oFJbYDY
         zyiI8zenMO2wT4ccv8DBXIMNPWmTQSa+U8vaA51kLBc9UnZz5MA+5PE1xgGAvE6vKP8i
         d6GA==
X-Forwarded-Encrypted: i=1; AL+hErHD7TTgLN2pMaIwqocHYmfPm81ImUni2mIzMtB7Hpomn4yzB8L/LLLubTgkWdKJSPyNYn6HShjglIy9DffV@vger.kernel.org
X-Gm-Message-State: APuU4Z8zdlfWGjWr26yRuW/DYDYe/bHKFBeEaBxcCV6iUXFLWjYVu70V
	vxyvL27LSWm5cGeRX4iD2jnOcnxRccnYlw7+6d1fmDjaNFqToMEw29wooKs9hwoZzluUQLIXSPC
	E9v6kB/M/PRrchvtKrOBnhXh9lCAZ4foz9n/R6kg0Gvf1pVa+A6jgLPFg9zDX9XXkf9qn
X-Gm-Gg: AYBFou3HZ37TNf++FZwz/f+HD8xWGp3P/Hm9n5dtpFhTnlaXpP6FjJ2rFcIfcPWQpNp
	9gAPZ1xjgxDcZaXDwgHLub9mTE/iS8LfJgeYvSjFWnrXQI/lmCvX/1WqUCksm+J9to/VuYRy0wH
	X/6cAaTVyEUeVdGd5giiztUxOOE7xWaX1ShKABOaRR9B3LZK8XDO2MLtYZfZwluqNoWBjiIcBL5
	aIFXttklWvOMZp1yAzcIU4r4y+sghKzLqOcxMbnD8wd5Bu7M1sDTYvh3MpDtmf9VDIuqC7cEgS7
	EirHhx3ESinxXzIEoLQBTu8rahg/mbrxjbOFEPSPsTalHDOYE94y2wG5ekDD2PSVUIRyddRRGWF
	uZBX0ODbPyLyU774cQ2/RdYOJ7BdDnu+wwRFSZpTVZLeLS2VptQuAS7xmixZtmkop1kgpTg==
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr1087429e0c.1.1794236950769;
        Mon, 09 Nov 2026 07:09:10 -0800 (PST)
X-Received: by 2002:ac5:c928:0:b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ece71453c0mr1087380e0c.1.1794236950143;
        Mon, 09 Nov 2026 07:09:10 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a474e5esm185561166b.33.2026.11.09.07.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:09:09 -0800 (PST)
Message-ID: <f84e83fe-2a81-4efa-b5cf-c458531e3677@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:09:07 +0100
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
Subject: Re: [PATCH v2 2/4] clk: qcom: clk-alpha-pll: Add Lucid 5LPE PLL type
To: Vladimir Zapolskiy <vz@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261107173621.3538964-1-vz@kernel.org>
 <20261107173621.3538964-3-vz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107173621.3538964-3-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX02faneoozXG6
 cYCn2SXzSJ0lge/amUGnUWFHFjLRxQdWcVqfaJw4SOkw4qE+MLItdmkOoKD09yFNkqY/a7bcL4/
 kTyWrhI3FUV1VMpXJuQc8lnLb+GYGL2AqfhyvinVz/Vf/Zp9yVArT2JIM4Kpp3VRC3dIN6937e7
 9F4kP5iH0v0I9KfRfkB8OxG+xRZ8EQG1ESlfBVBZly2NMs0ippD2Dkuwt+trRk2N6kr3yy48fOf
 8MgE/dkRDspiDJHYI3/Os7IkiTDVB9mEkQEsIKR5PJk+bbbRv0nYN4gKNRcSLvSGK8LBVCim53f
 jvX9DL0ETf6QNFS5NyJND/TuinpEAwasduL+vJa+s9NIZplV2xtmF8oIv9ObWy4WYThXiQ2xuMg
 79tN21/8/JPJ+MPq8/2cMDC/NTyJzHefbLwXBYtGMWrR7a+T34TT8KKWgzf/umt97BYsdoXeweA
 DnZAqLvsBnmkpSJQ0aQ==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af1e217 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=amEjgA4fUcSruvVDRsIA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: h8VnVQnPJnuQnKDZYHEgZh76gJXNT5JK
X-Proofpoint-ORIG-GUID: h8VnVQnPJnuQnKDZYHEgZh76gJXNT5JK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX2NI5CjkuqDE5
 vKDlcnkSyqXTxT8zVNIdS5DjmuAysp9W8RMGdZbkRGipoYadO70h+IGwSyHwljNZQm9NoNPI3CE
 YtzIrFgPfvo/0+JXK3VMHmlZ05LDof4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090060

On 11/7/26 6:36 PM, Vladimir Zapolskiy wrote:
> Lucid 5LPE PLLs have the same register layout as Trion and Lucid PLLs,
> but the bitfields are not identical, for instance PLL_UPDATE_BYPASS bit
> is not present, and the PLL configuration should be done by calling its
> own separate clk_lucid_5lpe_pll_configure() function.

Oh.. very interesting.. seems like these are used on SM8350 and
SC8280XP across the board, including in GCC.. funny how that
never surfaced for N years

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

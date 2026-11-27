Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811580;
	b=CgtRtnO9mT/iYys4iV/hLAGQjSxB2Waiu+7Ler3CRqN+++uaYm2KXcoIMY1fbB7EOvC/
	 I5yr3osf3IJs06sa3q0tI69usSx3DSh51jt6zcNAPO0eO4o82pXUfiZvOpe46Q5ZYaqG1
	 EwLjYP/r/ASGU4P0SasvVF/XpyWb9y1U+0TT/ohUwAoXOJq//mB1vWcU7ILD7SdaJrl6b
	 q6DpoNKyscKNWAgKVufRXfBIUYuyEdlHLLyotSsCyb77YkHpzc99phBB6OngA8gCmzI4T
	 C8VG2JOb8chxM9VzXidzRgX3hfay0mcXntz5Q2VMdJTd7yYqsuQ5PoK25WnbsWRvEWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RdbGxG6smopZOWzLypq/6hlFg6tVOfBxaUqDNkzkyXk=;
	b=yoxxHmwplCcrnhDUAiUafgK3/vabfk7OUsjnKP7CDbhPaKp+76Q1TIRiYFx9gRCRLc2d
	 ++cgJw7KInywM1mLror6qQDD7vucdyVE5lMgxts/BdvpPYrX0lxg0y0rijQYT9Y3HoQoq
	 HKNQDUkVJsAGHSZ4MW4P2LYxM4K7E1mIUPifdpX9jjo3cfQbLAeiYv4xHlvOz54SFtcJH
	 xMz0SChC02EllrUVaiDy4ybgmbqRG7YmKUTnyM6isOhES8UWqNJbym53OOSIXC3k3hoVN
	 olhahadrxRoKj9nleOEPWNXnohGhhspsF8rTBI8JBM5iD+A1asbkeexqsVRX47z/bsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=opzmeyBk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g48J9c+Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CC6606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8CC6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=opzmeyBk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g48J9c+Y
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJCFL53984365
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RdbGxG6smopZOWzLypq/6hlFg6tVOfBxaUqDNkzkyXk=; b=opzmeyBkNRaTl6Ip
	vhb8AXh7xDbxZjFujumTPew5ZdjDSgWczgXMZ6P/fkbwsBRocrkAhbRbLFw93LWc
	ZQc6dtb2704fOdLQM1IlRnNk6FQhg2OY6y1UP3hA1iKTvAQ6UCd3kbhBAbBcqoHJ
	Oke2YxFTSXrc2zlgBFk1kB8FDPnY1V3aWxF0soS6meoxuEO8sVVqDq2nhoW/Xwkw
	q30c6AuR7CHjzt7YG28ioP3EKAL8zbNsjN7iYVj1BRU8Rm5RXQFkCfWSA758f3Uu
	Zrn18arN+XsUwkTjKn5bFU2BoZIknSL4PFql3w3IecpHTa7NCG5nv4mbjzuw4JFf
	pQzFQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7f6d892e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:32:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso1408884885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811578; x=1796416378; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RdbGxG6smopZOWzLypq/6hlFg6tVOfBxaUqDNkzkyXk=;
        b=g48J9c+YPaNCituTlhvAkTROtSCEsbUmU3xgh5hsBHy0DncpUX+l3cfbBmIvIVCps6
         iZZHceaBKmAwuCWS5UPyPtBF9sE4ZpiC9HDM1JXl8frU/x3yKLub1d+NF8nV8cXm/XkD
         eskW/Fx4FmCzBBts7EvK1aaB34vxGeaJphnnTsKTRGWi5fvHjixt7WVL6cNEwD7m3BMP
         vPQLlOkfYaNiF6SdLR8MdDMlzGTR2fKajx2+t1qRpS0g6vAxPL8n6PhaXbbheqHqxO47
         kWzuo5RTasexOzju1hoz8rIWZRe1j0PCfNHtMgkkRwwnvihljHNNvb7k5yS71FRi12FZ
         w7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811578; x=1796416378;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdbGxG6smopZOWzLypq/6hlFg6tVOfBxaUqDNkzkyXk=;
        b=l0yM1LikA4rdkW7eImo4NNivIVbmgAFNRPKEbSkAk3LC7N7ceB9qORWSyzmj+idhz1
         BUYunI3boKdDzuIb8XfPCyBAP8id7aZsVuaG2iPHs7DZbUOVGJVZAOMZZZian3xUKueR
         ZZVSJGIltsXyFkUJeBqqNtlR58l9N7xxicQ3ekPwRmA2W5vmxwQORZdwSZH2JSVftTIF
         ehklqjjp4OAwhHS0rOfkldr8HX6Q8Iic4I0eqeNKBtBcbkF5VsZBJguyVMDMbFUBOJ4g
         ww0rARBkJ8NLJZdJDbDsxUXNWeNQDTaBuLN/So7SdqJ1liYYG5bs0PEqoNgLUiTxvYB4
         gSPg==
X-Forwarded-Encrypted: i=1; AL+hErFrOcGYScNEsBaA7ipBeWh6saP2l/pcSz6/Za7FsJQYFBkhL3GVgbiXdAlPD42FvPfZVJreE3/4vZLAUKvs@vger.kernel.org
X-Gm-Message-State: APuU4Z97P6by+HJTPR7AZE6w8WeP5MUggA7Lz1k35l64L2t7HM5UHtmi
	M8mBmxNG4J7GO/OiLzr9Z6cFPYKTLWOkJI4o2ZbHY2Egd9l7Mot+girHCAUTDHWYz2tC4UIFhcr
	WagkeN0DsxSWJQgdP4f6kNcXH8KLWVsRUxChyl27tzQF/HxeHSzeAPZ6FsMB41mxAh2YL
X-Gm-Gg: AZFdTZfUUrmlStNgb6Eb0wWYSkX7l5BUUCZmRcYxtHKLRhZR8btON7qQhR6ioa2e0sz
	DsrmLarHP77JohUVbfODewVXgh0s7Oj8+VLSQTQiDFhI0iE3MIUbbk1zuLxExq1CopXsBLTimmw
	2jUzvPL0Ot6qvE28IJ4wxgFHGq+fN1x6IuYITCZBI7D0+DKpgMvTuZyO3OTkdSCfk4iJH4t+yEP
	tMkcaY0F6xX0eU3JQFjUL9smtbc4Bmf667oyo0BZDGL9TvD30i9Xltk2McbbSeRqX4AbpJ2osXz
	u/1ythbgD6pTpfp2jviUwkI4wTsaECv+j4cy3ud8/ZAYMMO1+vPb87ISdP8+KXo0EROv6YULN1L
	WEHCispVuqwG4oelt8cQAY6W1T6MjxKxPCpTrQscXMv9olHeCSdnTw8LWZynpxw==
X-Received: by 2002:a05:620a:28d5:b0:949:6d4d:2396 with SMTP id af79cd13be357-949ba9c6ac4mr4407925785a.27.1795811577917;
        Fri, 27 Nov 2026 12:32:57 -0800 (PST)
X-Received: by 2002:a05:620a:28d5:b0:949:6d4d:2396 with SMTP id af79cd13be357-949ba9c6ac4mr4407922285a.27.1795811577441;
        Fri, 27 Nov 2026 12:32:57 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm709585635e9.8.2026.11.27.12.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:32:56 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 0/4] arm64: dts: qcom: Add support for Radxa Dragon
 Q8B
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniele Briguglio <hello@superkali.me>
In-Reply-To: <20261029-q8b-dts-v4-0-e8e7438f5545@radxa.com>
References: <20261029-q8b-dts-v4-0-e8e7438f5545@radxa.com>
Date: Fri, 27 Nov 2026 20:32:48 +0000
Message-Id: <179581156894.3905807.8399699622838832226.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=364;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=uTOlrKK3r5wHlu4GNa7hytHvMz4ce38/J/1xbEGeX68=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBrCejzTK0vY8gwlDXzGRSZrdDk2sadJ0Wm183Rv
 cxZQ1XiJSuJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCawno8wAKCRBjTcTwaHBG
 +AxYD/9UsZNT7/FLc955HpspGxAIsT9gvOm/npB6eyd1uICYgQQa5CMdp03G7hw6lorCfcHe5BM
 A3gtWHV+8rfD+AVTMvNdEimJwVR+bQ6Jv5+SoXxZRbw6Dhjvuk5JeDjQCYPSJx8OkQlwe4j3g9O
 4JgPJeSThp0kFksAAjHOVrbxWmekg0WR45tsFX5+fzemIlOxNguBPxtLDzoRFV5jV9+uhlGjUs7
 PU4G/f9h2+t5PZIBoJ89CvaCzh1mRl0eXDXz0q77PYyPYoIlHMXeDADxgvFMCgN0+GXR2g+IBLf
 supvMhGyrT4ItRqqRU9nl3Pu/xMLNMdegq4kKRNCPRRYvDC+jci4KSBTAHx93tA1pJKT8byI3aq
 0KBC/IHH+xt03QLOOxCMsaRI/ZX/NcTYo+1AgVnaD3m/3DY1hYC1QLMlQgja3Va7F5Egnwky5Uy
 4LLp80n4YpNrpMiKMoiJK1ubZwRlhso0hN7j6gUXjJFCmF4FWpj7oydhXyMrsSS55NdiPwjurj/
 zXHmsq8moGAE98cGq7IxHI/Q0Tw632ztNsQVEH93jo1EVNIkZw4ZvHMmGxf5lzo9Viu9xf7Kf7z
 J9Nbuj9ILpohAHYi1FVAI8gQDGZ1eFDGJEviLW6Oe/jCbGtp1KvfD/VR9gcRP7PKO3YtKkMyMcC
 pLsFwktxzCIc4VQ==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-ORIG-GUID: CxjYHtgZaupk9u84jf9_aUYe3hPr8pac
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX5rfWwl2V2FtB
 FrvECP65QInBFBolVMAsxofTI9YSiDpxA8EKH2AUVc3DjhFJDTmBpZyow+G5ZvwBn1vPTYBQZH9
 uVR5frhRjsy8Ql7dtcTR+Cn7eSfnTH0=
X-Authority-Analysis: v=2.4 cv=IKqXmQvG c=1 sm=1 tr=0 ts=6b09e8fa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=bUWDG7REKp_wvTPU5MMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: CxjYHtgZaupk9u84jf9_aUYe3hPr8pac
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX5u5QE2HRWlvi
 fPisfDcsgaXCDFIWyD3WL6/lovE6HTEHl0xejCdWjEZ+kYMP/AWfoHqyjV9jlpeq6gz3LqH0Iyx
 ppES6XzFu4/rlvtFqsZ+6ryblU0Hi6tp9RzJsCXA4ACBeAQq8vMACF6D+yBuWVJx7rqTlo7Buhl
 x83p0RMtAK20EBWQvGcxLlJCuxcKf2kb4/tBeoB4bFHVmuF8kC3fxSnlCi90qo79vYdrPj/tSC8
 6HxjO+r9591m1nvsC8mDVxVyjpTioQfp6Wzs0Kei5BKDJOeBQSC/tnVGdWjSlEgT0XBeXyHymlP
 IbZJsIz3u5jsIjpN5uVe8QMFYZyVnMYF8LyHjSt4Ekq8WxZ1Ch3HtDnHvCUY6IxyBkVoQhfB6nJ
 bR5AAO1qW5DVC04xfp7d+kQ6dIPoVy4czIEgkElcl7sy7xR3Lo2SayR6lFe4qewqfdOJyxvvYtw
 Sq1fhK7JAQQ0rEc1i4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

On Thu, 29 Oct 2026 18:13:34 +0800, Xilin Wu <sophon@radxa.com> wrote:
> arm64: dts: qcom: Add support for Radxa Dragon Q8B
> 
> Hi,
> 
> The Radxa Dragon Q8B is a single-board computer based on the Qualcomm
> Snapdragon 8cx Gen 3 (SC8280XP) platform.
> 
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard


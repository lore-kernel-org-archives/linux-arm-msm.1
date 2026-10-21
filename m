Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575884;
	b=DGuLWso4PRE/mtbIHb3boEQymigiSearDln7T8yEzAWzi/heObYRmPLb3ARpExJdNfvo
	 VsyCD0p+0FHrgTt6SZkOfweMhAl7B6LfWRlsWKbzF0+x85OR9/kRbP5jjnIrK8rl67oTA
	 WAiOB2i4ijWM7Rc+v4C5dx4r8fS9mNXEIKA1B8l8CG06M0+rQyhjLi7Nvv51ensOqkQ4w
	 83zPcfqozx0Yg360sch/+1Wk5ggNJJcOP/c5nE2gkwhTss2bsWnhRqnbAoO4CR1L3l4rS
	 J79U1FETJpw+2xhNr3B228GnpgAjksfJ5vEQGvXnhGdqWpe2eJguvwFEAnEealhOEoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575884;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZICGnoDUzzWlAQIxspOsX/uJiYZvuNvYB+Jhm0X2C4U=;
	b=k+hzUkZeSNcoPKwrp+FNXyPKVE7trZRTsow1ESFXbJdWubI5uJkOiyxoc8ygD9SBq5NT
	 8Eitsl/4PzZfqV9i9YLMWj8DI8NSfTy4DoTl+ecfJsR3CjwhXx3Gh0ULTZoMpLw2ukJu8
	 bjOALubZsssVCKZaoH5dd/K3f6ClQnLM0K/UULaAduAoeEsD0ovJbztldyQoE+H/TjVM3
	 N7snKssOMlg6NxDRbr/eUvo2Pc6+G1jS9EYKA9ltA5x8OzDuI8rRg5ezUt9CTgp9JScmV
	 jPLQrAE/V+RC5W4L9MSU/gosP1sHMcfO+N3wL8VGy4KMkyyeOG1h6L3Y8q5/emIGRGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ahXk7078;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QMDnZmh/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E318D606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E318D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ahXk7078;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QMDnZmh/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L9Kt1V179323
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZICGnoDUzzWlAQIxspOsX/uJiYZvuNvYB+Jhm0X2C4U=; b=ahXk7078Eg6/b5Ya
	BEW6RV60mcxyAc3S+r/XwNQA8a5FhN9ioUdntl5Hh2qEPJaAB6KJuZlvz+rwprEr
	g9xvPfooth56P+Qs5KIVFP2xPsqNgZwEUq5snCTWrGa5e0dF2G6yPPYDAGQItnKg
	81trmTb8mz34C1Dmny8QhvNV3lb85iZ+kxmKXeA2I2S6OZ3yk9DIxFvB+qojIotU
	Z48gmHMqxhI7tsRmT7aDo5PSGmiAvuftosIIImUw7c6r+js6IcXjgqXE20fKdRBV
	4WH7b66ZvGpz36jOQ+09QSNZX1NusCJY5yu+W3FdP3QLkRHhpjiCi4AfJHXpISgh
	DhIygQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r2dg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:44:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so8497885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575881; x=1793180681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZICGnoDUzzWlAQIxspOsX/uJiYZvuNvYB+Jhm0X2C4U=;
        b=QMDnZmh/BlpB+flHk3zCVlP1xVHUFrptYQzujy62rFPewCZbtgwK9sjQL3nrWabJBX
         c9PdcqqwLbL7kO7LHmFfoM0UByxEc/YrNCgmihNbnCfrcbebOCPZN5rb43xEk0K5VSm5
         8W9of9XxRhJ7x/ZL4VBy2EjYu60GDyxk2+3A4LmfOiS/0EoUyDZpjAFcTKc+AnpgD4Z6
         62MVfDPG6AFvgAJ2j2pUCuf27XE1k6kqem2Ug9P5fe1lDChcz2NuHkxlkPv5znsjZ1QK
         WsSSf53JmdswkS9z6lSRG86hahKhvEz19793CecG40paIFxGCwHHcHU1279mUXmNXZlR
         NiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575881; x=1793180681;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZICGnoDUzzWlAQIxspOsX/uJiYZvuNvYB+Jhm0X2C4U=;
        b=0dX/gzsw7fFxt0Hs6UMQ5CUtssRXVRk8UoKzk6dnOcz013u0BGIn119zWwDTnlyKA7
         LXeeJZc03NjaSoCAYN5gOb3VNZjcFu1K+rpsrhCW+oom6piEN6N/kzv6d+wi0Vv9KwXV
         K79ZfOJRard+Q3PyNonANQV6AzIJL+QpCYtCueP1QZsAFcaFWjYNHgZNjQ8IV2HAbGoO
         eqBF5sLsVmIf0DTZVN8SA7lonfogo0Zs0l0pLYFd58GUEyoXXgPccY5nm9U8bFksWOma
         meeI7HCu72wcp48S6VLO8mWw/pXoyRWUpMcb3xzw7aVGMZ0rU3ac6davZ/0X0k9mN8g2
         0XCA==
X-Forwarded-Encrypted: i=1; AKwUvBwiEfXJiZ++BIQ+nqNVl/61Z0+VkSQvfMmw2xrPPQnFKmA7pZUSwZ4UgvU0WeXI4yxrCj8IfLXWH9VwMpBA@vger.kernel.org
X-Gm-Message-State: AFq9FYKZQTyKStG6k1UaEPBVe/c1NCd0zHxSI90Infx69niPLcJTEUic
	MPhtWPJHBpz9zSLtkEnVhPyU0huiKwHqwsXp4kgZxluZqmeRQijOsmBrUpGRunzjCemZshB3jvy
	e1XU54g835KVvXUa0Gdu6YS8eF+CkmFn83lry+CBUvVA0HHfcB5hOUeq77kFkyLPLurxH
X-Gm-Gg: AYBFou2kj6u9yhAZYw03JspsqrSrXKwZjUu2+hEkViag7xBM8ngVczbAAMQX8UAF7NN
	3jGH2Z+pQIGuAwM2z6HNy7+SGwu9ORk9wp1aqgkQctmQgXeBw3TO6DtNP8NJg0RryDmVToRssFA
	yh4bT0W/yvr9QqVSgy08lEqa7PaNx6iB8pfHkg0cxR0xVD7frPBqqVhcHFW6sg3T0cNUKQ8NfHg
	qVSUrIZyLENSreDv9Pp8LCxK5ZS72DdF6Sb0uYuY3IafY2TZ6NF9TnspWb/mYtq/TyD3CUo/iZJ
	f/jMUu3AssVsGNDW02F9UdCcabZHSwEOP7Cl+WxnQPozTWXpVVyIww+serr42eBYdtN+afU3quh
	paESHHmLdivK7YNuz9nQnpQ==
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr367394185a.3.1792575880914;
        Wed, 21 Oct 2026 02:44:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr367390585a.3.1792575880494;
        Wed, 21 Oct 2026 02:44:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f7cc2csm59794166b.24.2026.10.21.02.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:44:39 -0700 (PDT)
Message-ID: <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:44:31 +0200
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
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port
 numbering
To: Chen-Yu Tsai <wenst@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai
 <billy_tsai@aspeedtech.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Peter Griffin
 <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        Minda Chen <minda.chen@starfivetech.com>,
        Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Wei Yang <yangwei1@eswincomputing.com>,
        Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
        Hang Cao <caohang@eswincomputing.com>, Li Jun <jun.li@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>,
        Yang Xiwen <forbidden405@foxmail.com>,
        Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stanley Chang <stanley_chang@realtek.com>,
        Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
        imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        Mathias Nyman <mathias.nyman@intel.com>
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
 <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
 <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
 <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org>
 <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad88989 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=iuaGvn3fa_lUOTDqeYoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: V8LsMG0i4SW3YPOE5FKNJKB5IP9boppp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOCBTYWx0ZWRfX5vdpaBblsZtL
 XAVuWQhQKHjkw0q5gaupioGNc8nuGccP20/xBB0VUBE/FRYvPMI/8GQ8AbMFa0f4+LckDfoftyc
 d2kNnuVwq76zWFkcmFPSYaoyPuZs/yvtqycOAJg4lDNVe6elMJBkszu7SV1J02jYb6pOQb0ZXb3
 KnE2kvtlBZrh56PIlvCLRCQWAx4LWLiawGq7iIFPewYTlh1HgmXl41FkmRzLNO7xe2Q4/4w89O2
 erw5VuNtOIj7XNGjWf09GZwCig5Kfg/vTTGLmrWpwG1X8/F91n8hKUMGOW2B+0xGrvMTSf0DLtA
 sRXbbiijX9jDT3RrPn9XuMpt1uIG+8NZxJXX1E5BJ6m5bAgCa4W8rSS/5xeE8u3QdczhqDrqz8k
 IUgWw8kw8sDxwfmxQgXlei9tsIyxW/I1HVW8DGDLKoS2zZOoE5PiKVxrWUSVunsQ+YO8mmRXjAk
 YsMLTuSpXqVj2RJl+kw==
X-Proofpoint-GUID: V8LsMG0i4SW3YPOE5FKNJKB5IP9boppp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOCBTYWx0ZWRfX1Jyrpt0buQ8u
 EsbRbAZoxHU1StautpsSHtPcvavIOOrm73rQ7I1hiyYuacK7k95agDnPJJQcbdC4KPfJ4uF/EHz
 OVKC1v+ya5/joaEh3qc/gBGf8g8tbb4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210038

On 10/15/26 11:00 AM, Chen-Yu Tsai wrote:
> (Cc-ed Mathias, the xHCI driver maintainer in case I misunderstood xHCI.)
> 
> On Thu, Oct 15, 2026 at 4:44 PM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> On 10/14/26 18:36, Konrad Dybcio wrote:
>>> On 10/14/26 11:44 AM, Neil Armstrong wrote:
>>>> On 10/14/26 11:29, Chen-Yu Tsai wrote:
>>>>> On Wed, Oct 14, 2026 at 5:28 PM Neil Armstrong
>>>>> <neil.armstrong@linaro.org> wrote:

[...]


>> How about the USB4, does it use the USB3.0 port ?
> 
> I'm not familiar with USB4. A quick search says that it can tunnel
> USB 3.x, DP, and PCIe, and it doesn't have its own USB HCI defined.
> 
> So I'm thinking the USB4 controller would be more like a nexus node
> or multiplexing node, or perhaps like a USB C connector. It has input
> ports for all the protocols it can tunnel, connected to their respective
> controllers (XHCI, DP, PCIe). The binding probably would be very messy
> if one controller supported multiple outgoing ports, as each downstream
> port has a 3-to-1 relationship with its respective upstream protocol
> interfaces.

Yeah that is more or less it.

There needs to be a connection between the USB4 router and the native
(USB3 *port*, not hub | PCIe *port*, not RC | DPTX) protocol adapter
where the tunneled packets end up at to create a PM devlink between it
and the USB4 router.

ACPI does that by adding a `usb4-host-interface = &reference_to_router`
property, for DT that's still undecided:

https://github.com/devicetree-org/dt-schema/pull/196

As far as the Qualcomm implementation goes, I was hoping we could
go forward with base1 numbering as the DWC3 is an XHCI controller:

https://lore.kernel.org/linux-usb/20260929-topic-dwc3_tunneling_state-v4-0-63e296346d57@oss.qualcomm.com/

Konrad

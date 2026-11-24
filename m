Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524998;
	b=VNoUyzzUD5HqBW26BUwBQGXyFIWiUOJgLf6wCEQ05kurMmOVgdCMFeG40AmmkYDawbvY
	 syuoQ5QcJNR8jTYNePzg28mHwBK50oHqIlEPTLK4SxaH+BW/005AOS4elhypL09LCWd7o
	 RZU5n2n3Kt+57qwLTouHI13rhn3Bp3BdxKNeo26bv+IxvUThBbhZ/5uyhL+3KwhcQlUUF
	 6UXCmviooDxJuUePqmHLKgMqKbk6sngB6m8STJhp/EJuTBKJy2PMNYnYllarNNp20y8+W
	 i1WYzNx9iQcnuADPilKtG1qKvpIJv7HRrKgxSMncqzad25Y0K3R/lRXaZ1sGCu72qOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524998;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9oES+zTBCcykoKXXZVrUciLOTnpuEmEfvSoDUlTPuAk=;
	b=bN76yLaePc0V/2zisMxZuSBBwFXfbbj4a4VfUyxLgxFERW0SLMbH1o2cz/sxC4eVySea
	 MzNIi0TEU87Ahvq4W1wr7WZ97QGxt4MZYRc72de/dja5vRcFAEtsbRrnpm808MWrMJlC/
	 OkecXuFue1qDmG2mVOMwsVCWe6H71P1SKiCOla/i9xgtRJMvgSZ+yY4o2Dgmhm0jK5hbg
	 0Ui9mAqoGyUwaO70l5LM+nnlOxfNmSHimbptaQyFHkU2ZLMkm35Yi+W/pZBOZkRXmYHTV
	 r8bvuRK2dOrmB8RTAL8TCS45SEFiTsCfAZZnh8gb9GuzuuaYZJJ3/knmgVuyjGZL6EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DF9l6fBh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U6sVP8mx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46565606A330
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46565606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DF9l6fBh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U6sVP8mx
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAvELr750814
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9oES+zTBCcykoKXXZVrUciLOTnpuEmEfvSoDUlTPuAk=; b=DF9l6fBhukovloIC
	lPAH3FWFLecA/J39y/gmIcTRUZ4Lq6KdDnf7flVguXLxS98olplmggiZUXMdOIB1
	+JlpZBE+CaOqvVWntozlbjrGn6AftMMOpc8LyhzNuhibzbGLIz0/Zt9nW3v8RW5q
	w/F/ZoQAYlFQNrSu/yZ8aeWv5iZjgv2EJPhYqJCjy00T79DfpxAfSxSM/SNeXj4M
	rQcE5pKEZCYXh9LTd81L8LsMXbMw0XKfa5vyEiCfqs64YvY18Y82JnqGBgB2n4Iv
	GiiS60bcEkckNkgC3aYBeqNE2JmW8vKrZuL4Bv2vZ3Wrm5hTNG1EJJRis2JmeqdY
	NcTLZA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb2ss6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:56:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8c5408e418bso3218744b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 04:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795524996; x=1796129796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oES+zTBCcykoKXXZVrUciLOTnpuEmEfvSoDUlTPuAk=;
        b=U6sVP8mxSKlvEm/EudUn3ZAej40wOKduQD5NpBGJqkNLRX9WC0UvxxQ2E1Xjep/O2x
         Idkq77kpvilQ+6Loj8UnNwkOSwR9qp0RmjsPDZgNzXmzvC76q/Tlqt/inVbcIQMFOgNe
         Eq1beSkFD+isz/6vWfBm5YYBBh8KZsRBvCxSzE+sFXWQJQLuyfedCmfjEyVy1Gteb2Nj
         K1q9JNsitszecM573L/j4MG2cCjUTDMDid5Ct/LOyS7tIf8eUTVl/RbsoL/w5kMLHTRi
         CQAGsXsAeEG8xgv1NGvVQ+MJS/4TknMKpwh2p2JPhqqXyaUWKk2Qa3ofPCW/JChA8KnE
         DYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795524996; x=1796129796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oES+zTBCcykoKXXZVrUciLOTnpuEmEfvSoDUlTPuAk=;
        b=iJ2VeewM7F/SXvkwftVhtjo1clVXsQVtwC1iwxmhl07tP/Tt9n+ATCNBr+CUAEffN8
         32q/Vq82U03dTUaUq++snOUV54Yat7yCA8PYngJS6QKCK01GUFSxLqTnDGQhVnarEGVb
         VeiWwvBXD7ay1Kgl2JwNxtoLAU2S2CHBBJCthxEA7g0kF5lGjTQJd0VioWuoyHhWxpi5
         MzQjBn0rUPV4acR852+fwDwNVmmCEzSF3l3j+0SuPVcxS3oYLEmJclexa5YejJ7hIRmK
         S6mJPiz5FEqAASDRTo0rB+Imok6zG1uHf1QXl/+eAxXrOM5q02NJr9ZoUDiIcSCHyqoL
         dqhQ==
X-Forwarded-Encrypted: i=1; AL+hErEG2WabIQhU+SxtEDdVPfHhfhjjvpDfnts5/vKdsZ4BiUrVaa2gizDRJmFj2nUGYkxH4kyqDtqDtNH+Zlh7@vger.kernel.org
X-Gm-Message-State: APuU4Z/3jI49eRsghlkYYYUHafBzd1h6ZdPToL+DvjhuXj5sDZFYgt+W
	HB3eNE6uM2VPnqudaRzIHIfyKs+laSO8b0r3oQ/B8vu8TnWYl+lyZWwWdft15mK2bP/VCR6YgL2
	n34ppAqRo8HHSeW8MiFzfcsMTo8oyO/Su+3pgCpI7hNQSiZAi4SLyWr+J9Plg12K8m167
X-Gm-Gg: AZFdTZeAvepBYUSeEKsFXaP/o03g4bTuP4fFHoMkNa86z7XO/g/VHKcDPGE41NysNr6
	ITQRYQmuHH73dXjhbSKXedXMN4P9uoDp4GGipkP19gVyj0bFdpvzc+uVmU3tog6MEQGkQhcSyyS
	r5kYRarUaunBL0GWp+tWh2fDPwNhUDB1jltB3p6+fNig62v7ufFCO2vg4JV0Fat2wq+VXwFAobX
	GqwkR/Q1kN6tGb+ymoQrWs7JmBC/bWy1kUMgLhVVeIV4PVDUNUly7019nICL67uFyTs5lgg1G6P
	Dz+bAWSWheRtPLhnWLEk2VlpS0zInsiY2yj6JojybcEHDjVmzy7LdZtx+j1W3zUAhJ3YSo6EMux
	pe0D5e9ekG3Md5VefBN50x+YAiWbYKSD7wc9zJ1do9gQSulxnGJ/77G7Lkt6TlV4L2inIANiuuJ
	BtEg==
X-Received: by 2002:a05:6a00:4c19:b0:8b5:f313:9f54 with SMTP id d2e1a72fcca58-8c87d32b35cmr12156936b3a.56.1795524996074;
        Tue, 24 Nov 2026 04:56:36 -0800 (PST)
X-Received: by 2002:a05:6a00:4c19:b0:8b5:f313:9f54 with SMTP id d2e1a72fcca58-8c87d32b35cmr12156914b3a.56.1795524995577;
        Tue, 24 Nov 2026 04:56:35 -0800 (PST)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c263sm7146216b3a.11.2026.11.24.04.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 04:56:34 -0800 (PST)
Message-ID: <0747efbf-c712-4185-b08a-82c82a49b4a2@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:26:27 +0530
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
Subject: Re: [PATCH v2 0/4] Add Parade PS195 bridge support to enable HDMI on
 Glymur/Mahua/Kalambo CRDs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
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
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
 <357f0fcb-792b-4b40-84d2-cdfd05ca05eb@kernel.org>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <357f0fcb-792b-4b40-84d2-cdfd05ca05eb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b058985 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p1ES9sUSU55KWy82zVEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: lA8msMcjYgdNA2LlkGqhhs87IuZOg34a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MCBTYWx0ZWRfX1NEwkVwVI1ZC
 J+3Bk5OiSaja2ZRzqjcRzGnhbSYGBeti+ladTA524M5cltDlTtlBnPghyrbGG0qSWEPIZWwp0FV
 hZme0kjm4M8k+SoacusF1+/W65Yenls=
X-Proofpoint-GUID: lA8msMcjYgdNA2LlkGqhhs87IuZOg34a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MCBTYWx0ZWRfX0SNhWy/cz2VY
 gdZHh1824dwq4APUI62dyySnojYQ/EorKCmLrWUCRzzTnAtHizC1RmssuctaHD5VY3DhUTWfNvx
 DhhwbbWFu0mZfmLkQQyBByYMfxA5hpYq8ofMr45eQst+5JTul/aEgAnJM6THaurxa2Ffzuf6ju6
 t5k45ueBYuU7vGmtuhZh+ZuaSv1bBYr+Rz8DrPGRY7JJSLQSDTi8dpXhFuFUj5kxo4RV5fb2cpm
 JhuFedUlJ1T5rI6/TR6GNIS1Vh7R+4TJt5IpnsAuTvLofUI03tUyt2dp9LyGvnbWisjjQxXkh5i
 HbzGkFXbPZon0x6lK3ny1xabYFbqDjbbMprSlPS2LCHq/U6nMaWTr/8etaASIbLjt55pyLIJmng
 8OIY4Or3EQEOpGIJYrryqeA5frPsuyM0M7D99ccmzy1V9w0+bodtBonreURIWDzEaLnqDkHHEsG
 uZFtdnY95oNcgdq9mNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240050


On 11/17/2026 3:54 PM, Krzysztof Kozlowski wrote:
> On 16/11/2026 12:34, Nabige Aala wrote:
>> This series adds initial Linux support for the Parade PS195 DP-to-HDMI
>> bridge and uses it to enable HDMI on the Qualcomm Glymur CRD family
>> (Glymur CoB/SiP, Mahua, and Kalambo).
>>
>> The PS195 operates autonomously using firmware loaded from external
>> SPI flash — it handles link training, EDID access, and hotplug detection
>> without host register intervention at runtime, so no existing bridge
>> driver fits its power-sequencing and reset model.
>>
>> It introduces:
>>
>> - a DT binding for PS195 (supplies, optional reset GPIO, and port graph),
>> - a DRM bridge driver that implements PS195 power sequencing and PM handling, and
>> - arm64 integration (defconfig + shared glymur-crd.dtsi wiring) so all three
>>    variants can route DP over USB2 QMP combo PHY to HDMI through PS195.
>>
>> Deps:
>> PHY PLL change: https://lore.kernel.org/all/20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com/
>> Glymur commonize change for regulator: https://lore.kernel.org/all/20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com/
> So this cannot be merged. DTS cannot depend on drivers patchset. We
> talked about this multiple times already, please do not couple
> unnecessary dependencies.
Ack, I'll remove the PHY driver dependency in the next revision.

Thanks,
Nabige
> Best regards,
> Krzysztof

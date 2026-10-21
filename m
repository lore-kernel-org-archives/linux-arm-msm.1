Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591674;
	b=qGoq/4PXS/xC4GG/bqq6iHezWApbaVh/ge3M/AdTIMvfnzbtgyk9LLxqerP+jL0gpiHs
	 2IJry4BLdVOk9Jmle/aKRtdJ0xTQf2/cNeAe+jIM6Morm0MUgMTRC8J7ohdWka61ah2Vq
	 m/BotjCFnyKJea6BVAoUAt6nsF6hg5Bp/jVijN/WKMCVvlgXxaQ/dURJzjRzwsKt7XhRP
	 lSJHuhe4rRalPPMv9yuSX79YecBYvtyEcEOFLo1M/iJ/27a39fGdGktGkU4TVHitczy9v
	 LKdB6qXzYpjfi4Qu6ivy6gtWywtSsg4e9OuxRbkfYUobI09zsiIXUeFi4xyI3QJBmxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7eSvqShp/yz9VzClej405uB9Oat4UGxkK/6AP//FH+E=;
	b=KgXkdR9qrP5OJkfneCEri+F26jMSbI7N+27b5H1JWezseIJSIxunJe70u1Si37y+93wo
	 CvlngC6a690a3+2/fW5JdO9PkjzUf6pJBd2dSh+VLvOGlnux5Sb4T63R8RxPwFyG5P32D
	 woCNdn29oHsI7QA7bLqEzHXyfNuQvztBVZeX7bmM9MV+yfwzIQqP6k5wS0QmZHupRWD8+
	 kTLVIX7v3nsq2oECGzvNQhCaPGBWXlJamG07+fCLdJaaK5n7cdN5enBgMe6nRxe/DSqIL
	 qVsNLOwumIrIj/jgBn6oqEuLyRj0A7E0JrgEgORbchoF7zph+DJzFpgfidV1WBs3a6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJ+S6J1h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XTM/7x07";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B67606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4B67606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJ+S6J1h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XTM/7x07
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg5xp325104
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7eSvqShp/yz9VzClej405uB9Oat4UGxkK/6AP//FH+E=; b=JJ+S6J1hBjjE1k8D
	9PIiLcB08/81RGUIepCqC1EimYOLpRX/THQSTUYyJR2gU760cjwXeYxqUKvI4fvt
	eq/YrDBtYkWhRhBrvw4UmFRdkekPGvmkEvQ2SINM9RBSra0xAvxuh3w7s2Pl39bq
	Ykfh/GIyfLvvPnoFcxNq3/3GhdVe6Z3b2QmrHmMAV3ih9c0w9Ea8A992IiuTPNj0
	VCO4/BbRlMArJodXmBef/TjiyK0nVf1ziQIGwHvj6mAemfdTxOJLpLMVy5EERe2F
	+LhAbP4ol/2N4NVR22zIjNaNkyRriFKjzaQLiDQPy9+mmsEYHkRlCo29cYdSUEtM
	+F8EgQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v4arf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:07:52 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c97957d83bso28692e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591670; x=1793196470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7eSvqShp/yz9VzClej405uB9Oat4UGxkK/6AP//FH+E=;
        b=XTM/7x07i5O7YXRh/glNLFgYvG+aZs3/73kMcVTrNfSxlrkiRGc66chPjoSD/ZnTx/
         S/eTefiKoF5IpwwsgTSEblvr+/zkxHkW8r8RX+QtUfEgY82BDdrQ8WMnaHJSkRtA/ZhL
         4B0hxfUmQpl4jw9GXqAE6griexZJ3jhXF4nONxT8bzfc0yGjlIeY8fBlFUZK8NNz2Kej
         DlURNKD+dTEp14hsZNRVL/whjw60Ha8CfbP+UaXsPvZJHFuXWZ6puUHFIGsKT4AZzWdQ
         uKiAf9WUkCJy3NifBDHneptBwgu3ZQpA5RTWSmx+TDFQ4rYk5ntrx8HmalH8lIsevYM4
         VrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591670; x=1793196470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eSvqShp/yz9VzClej405uB9Oat4UGxkK/6AP//FH+E=;
        b=FQtfM/qxZWWERhRmLsMsi828yYxOYB81/RsgQN+MutQQVJHacRmIphI8MbvkEgm55o
         DEr/5ddPE/TM2XzCmpXRvJ/LWeMcWaB6fXPGgSCslBee4xVOOvGV7q8vu3XsbGRwMoy9
         FCKQe4lhPpnlQMSwpcNlYl9U66EmZG7aJ+YYlMz2CU8w1xj+2SVwlla8qh36Y6bjDOu2
         aI+nBM130Iid7WdAP35m/KE6WB3F/I12fQAyXQwm/oQ1nRIyUq6SrIiZsB0JskNV6E4d
         BhV0/OblXLdW1bvGb9dFTiYkvON7YMo/gX9jXJQENNNwloTZbvfmCwmHz4UYJRc0SARW
         AYsw==
X-Gm-Message-State: AFq9FYIJKiHXe7P1kKw/rmU05ExJes3AKrbPGQc7foLuDjBlcxTFJK7x
	kEsUR37v5H6/plLAJl7lrVbUrsE7i3VbFw+v0BWQAvusjjZCZI6OEKTnEbA3arDmLbXztH8Gz5T
	nRBzGOGu2v448FEkerFm+rkcUlUdbCl+i9AL5dpUvt8OTB6mApddc9iNNPtbnT010ltSc
X-Gm-Gg: AYBFou3vnefMDRDkDrp/IoRzmcH7cbBHSlMgerSMyehO0b+Z8T6W/A7/2gYOqwc9OV2
	SOjMxRUUkKniTzEunfJbSt+p707lFif2ZgU84CynA1szpcd+QHhjh5gaGrRotTfYk5Mx0YxXYjJ
	xQGCwkbyxoHTgb7sfr5HFc+BwNuVSOuzpAkWQNDr+Yix34GHrAovUrGZdMgFLBMDJhTRGmLwAg8
	pDWJuH6jByvwj+vOKYS+/vPa+eqaJKBpfR0HkmBsnuM3UEC/wIwrVSau6rVppOjLXwC/YTYj4Qo
	UTplS2W5R04jQcpTZP43aBs/9uNnd3Zn+nmK8fQLHVPZ4QInTWRFfvMY5IqCMDHBIc9FIsqT9HC
	GxLo1B0dJKSUqZ0B/4ERb/Q==
X-Received: by 2002:a05:6102:1626:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc92623e94mr698633137.3.1792591669687;
        Wed, 21 Oct 2026 07:07:49 -0700 (PDT)
X-Received: by 2002:a05:6102:1626:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc92623e94mr698606137.3.1792591669237;
        Wed, 21 Oct 2026 07:07:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5625cesm6971266b.39.2026.10.21.07.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:07:47 -0700 (PDT)
Message-ID: <ab7c536f-f57e-4560-8d1f-6ecbf2aa4b07@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:07:45 +0200
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
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
To: Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
 <20261015-shikra-work-v5-1-5e075222b60a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-shikra-work-v5-1-5e075222b60a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfXxLEORD9qgsYW
 LUvxPtLvz65SCR9vjQEMldNoLCS6s/RI5OukCAG3/UnXHGOnpWywkNFDiSg4TXHYwjM4RV36u1S
 CydxXpIuS3AQRFyka8X/vrCz5BskWbM=
X-Proofpoint-ORIG-GUID: JyCNxlGgSGXfFL_KQ61qAVVbL3DY2JkH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfX5ZkHpF6r6MP+
 ErhZrJOsu2FdvOq3SCbe05d2X6MBtKPsNOi6fxjdoVUjWZ5elvrP6LCj9FqJg3LTelBKl3gmFv1
 yPCZBAX5t/orA0Wf5gi6mvq0+dXU4wDo48oKYMPPlJIrvjNFVWDjLjd4oJIkBJebXCE064oN/HG
 +MvqCB3qYuSS3nSU/iK80Ih857bM6BDalkqpW/RYoPfuQMbDB4nY66g5q0jPeKvrW87EgFycRdW
 lko/EsMPeuWmhRqFfMbj0twb6DQLD0IPMvkLxAlhF2eJwMd4lUCUtgTeKxXH/SIXW3W64/pWFuL
 +lCRiq3KXddLONXREXXT58xoWTeGFMKfZ+jlvZfTx5Iq2448JHOQ5lI/xEBY5BqF2d6dQoaSEtO
 Do2/jAitRiLSShYfcIplJ8LKVsMQ5RfprIaqc0H2tQ08VfCqQvhpNh7OCG+PXWLVvRxRX4OvvUl
 /ysxF4mLynTRdL/bwqg==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8c738 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=evxpD-9nWyVjaAOWT8gA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: JyCNxlGgSGXfFL_KQ61qAVVbL3DY2JkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210056

On 10/15/26 11:15 AM, Mohit Dsor wrote:
> Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
> EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.
> 
> The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
> a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
> rail. Reset is on GPIO76 and interrupt on GPIO85.
> 
> The bridge receives DSI output from MDSS and drives an HDMI-A
> connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.
> 
> Regulator and pinctrl labels use generic board-level names
> (vreg_disp_3p3, bridge_irq_pin, bridge_rst_pin) to decouple them
> from the bridge chip.
> 
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

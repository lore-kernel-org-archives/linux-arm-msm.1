Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422804;
	b=kbmQstI7moVNYVWQfLvnz5Zajj7KyF+wky5qI9q2wyIrbV68zw4oXAcnTST+FUDBwIta
	 PRsH3uiMVITIkoDYQ3dkI3wZd27YcDV+/Xtr0yO03sWiWVOcKbK/pnL9yO1GW0QmaL7u5
	 5suC/B5yPIP94jD5M9pKOaa9BUhHN6+UHPTGKrqLWqRDlPcLMWjaFAzf8J0oLGeHqFz2f
	 amfh9abAAUK0Cf+ZRIuzH93+ZqI7DQm93B9SYjm5BUhkynSFN8yzW499xs/iGpdxXcLzh
	 IN/ksY2js9WjqpLdI4Ze8HffuWc9M+h5vlS/wp9qBfOjxH9yQ1JbmDVwIe8iQ3Latgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MHpOPQMnBsXdD4rxYXwjWTXKlMKBvycegMK8DhfOcg8=;
	b=oMFSbw6jE04YYsVcp6t18ONT4CK/GcquixTIn0TfOWI/jG8ckws3zhwz6L5MNk1PsmEL
	 FH/6LCZ/xZoWN+4drfwXISIV3KKn6Cn0IJHK46vJRxmNIi76IbxIMjxVuLvkol3fq+m3H
	 sxBDMqDOw+IA0/ZyEv/1k2YWmycsodKnJpYxaxbbxkFsnfOKiVkafOvKNMVX8Zl16lQTZ
	 O2Pe+YUxKVKnCHuy76SdNQJqc/ah+ay4+A6S4p3NDVFUBE6qbKVjlRWURFFMuWBxK2VC0
	 rpoDhfmB9wnpKhRV06sfS3zfFj3hCc6OKikxkExAA8eaGqhKC86RYrvpwZvejgGm01Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="G/wgCCmm";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dipNO6ON;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E745A606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E745A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G/wgCCmm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dipNO6ON
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABIgFj83785478
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHpOPQMnBsXdD4rxYXwjWTXKlMKBvycegMK8DhfOcg8=; b=G/wgCCmm3FHTOOQG
	e9/ng4bKh+OeU4l+jXQGRNS+CTxI5qvXs21sgkKyo4LH/y2+69ujEedssfuFYtDZ
	qrJiLmB3C55OzIT800Ia70b5MBla65L1pv8voXplP5uHxWxLkIS8PTRHDRNtdSVW
	Vg8ydmYis9+Xa54r9ps9Kovpp0FKv3RQNion6bMWVAiLzuND2hK/mEJMgJJhKEHT
	gBW7QmvP/kHO6K1XyJJrhfGXFQmT16qM8BXYnE5tIPV8GxHjLjw8aO3sMf6RBOVB
	oyOo4fn8oEQ+X55OhGFGV0YA+0dhh/T11OF5TBfThZ8Y32lpNirMgrB1MS5tktfj
	vgbVHg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt151711-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:46:42 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d32175c486so461731137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 10:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794422802; x=1795027602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MHpOPQMnBsXdD4rxYXwjWTXKlMKBvycegMK8DhfOcg8=;
        b=dipNO6ONct+dJbZtn3WLFsOkD3JElX1yoWdF6CKCZjrcThhvR372TU8EenGsC1tupV
         VhLaqB3e9tnq4D9j9BeyKbnp6c3WFFuofHrtcwE/b8Ao00Kw1rJywdSnGVpLDG9G5MKp
         oZw5tezZPXZtmcfXLh/WgycyLc6kA3e4ebkxSDfH3K4gRegMQ5MsomePe4ollnu1LZdV
         wJ6jnEAC/YeEizSu2wW5aqPSxLxg05WpUrW/aJawIrlHdbYv8PJ8n7livsmX+EbBlrHk
         wDtzn0oYBbpAEcR0ucWIN2lIABLr4d9WJScMEpgh/gVf2+f82X0wRjBN7exNOH8nFwwB
         OF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422802; x=1795027602;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHpOPQMnBsXdD4rxYXwjWTXKlMKBvycegMK8DhfOcg8=;
        b=U8lBrqs+MOYJW48ZS6Gd7QTa91vLftJPeTyGNZRh8QOIZzX8iuff3IM/K9Vx/ryZpg
         G1PGQZnFa5aofKS75oAAVSAibjRBpCVGx+YwBZGvtTCr57pjZBsCjjT5RLWv1yfJwGb9
         niEPUYyFF9mD7KQ7SeNaA9k2uWlavObv0O1uym5/ic1YyuKGE8oY28qlW5KWyNuZC0NG
         9KdVqs370hw9E4hv0Wr0xINC5o4LNoNifUxuYTFQN6GB3akAm1lvArkFUv++znMN7uYp
         jZv1hOlF0u811/OvGMe1vqjhN5avNwjPBnsavj+6yVJgQqpB6J5HFVbzeMkDZHG+zoRH
         WVOg==
X-Forwarded-Encrypted: i=1; AL+hErG0sp4uI5FekfLt8sg0gl8YnbvCaacmodBZ3ZcgTliiHYDonhKEGzQ5l9/mg7LvevX9n6co0HUJqPMJMs7Z@vger.kernel.org
X-Gm-Message-State: APuU4Z/qL6SSs7m2Sz05iIK/y1RxlLPRAvs5kPP5GPCqZCVfXuiz/JNB
	S90vvxhQliAJp77unqNS+3I3x8g5sk3b1rHeazyJMDtvgEryeV0XFyQ9qn0IBEwi/uu6lmtP47O
	/dYr6eotVbKTkzvFlfmR0UiDKDlnMVzaWiOvDUZgclckMaxSKgCSmR27Gty+3nxMp86cY
X-Gm-Gg: AYBFou2N02EWmGteHSZiyb/P4WUHBlXlBKIyZ7hePeezTDPCGQ8WXopesi9olwVs6S7
	0Qn5wWL4hQ5ntD76oFeeiMVSR7TjraTn6hhRiM2l7SrWI7tA7vJ71BRDS4jojd6UBYx3l1lFxlN
	W6yBDIfWR9qFec6jsrawflYpJiW/u2H/JxsWZwKuLDar/dQf7TlrXutHJzseg2WMj57TxpoRcQV
	cEcwtwjL3F34Ngx++yElQcVSkvr4i+SVCCAfAkQ9HW6OQctc+GE761hnV+hBhMBuNVGfS+ZqHzB
	NAW6W2WE3nZxF27lNj/taiRjTsxkivg0DJqu0okKbG1yVYD0scldkKuzvM9ERWqspc+2Am8RvGl
	Ju0Wv4g6PoulYOfYNKZ/hlpFmurRu2MYarRGMYf4g6f0XuXj8epEVus6Bii+n2GTDAUDXEfLlaX
	o=
X-Received: by 2002:a05:6102:605c:b0:7d2:9cb2:88 with SMTP id ada2fe7eead31-7d5061dee63mr964734137.32.1794422802115;
        Wed, 11 Nov 2026 10:46:42 -0800 (PST)
X-Received: by 2002:a05:6102:605c:b0:7d2:9cb2:88 with SMTP id ada2fe7eead31-7d5061dee63mr964715137.32.1794422801221;
        Wed, 11 Nov 2026 10:46:41 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc9asm11539016f8f.29.2026.11.11.10.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:46:39 -0800 (PST)
Message-ID: <88380d74-ab37-4903-8f8c-4e6652dd5ded@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 19:46:35 +0100
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan
 <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-2-fdf8fd97f49d@oss.qualcomm.com>
 <7gqjjq7v5krgibjxqelyjwmrfygfnbsvyfubgbpkshkvgdftxr@dwm3rdpoqbnb>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7gqjjq7v5krgibjxqelyjwmrfygfnbsvyfubgbpkshkvgdftxr@dwm3rdpoqbnb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfX8tzd6uqxi3uN
 lxvK1ENz0yQkTT+4q9E26c9yvneBIa+3asrcxQZWvMJRV3/ixks9A/zhD+aAKwecf5Xew3/zpUr
 xNd7XQtS9tPIoXrJf0FGUU3yDls5x24=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af4b812 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NUy6FM0n4CcUAni1w6YA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: kk496or4gczWak8chS08PkkLP1emk-8n
X-Proofpoint-ORIG-GUID: kk496or4gczWak8chS08PkkLP1emk-8n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfX41HRyczmVu2x
 NDQ7nSDFdpc/BysRmqgQ5aDgV5SwREBVrbNV78J5TngTregBW8t1b64S6FqkAbyazDLxdQ1N78Y
 pUZ9uwx1mxumW6GDmiL3uslXU1m1FTUtE0we2IAWZgLmUfr/qJ9ZZBWcG/xPNChXvBME8ijU9pz
 /yHWHyZMTN5pKGKkoghduZ/J+wM/RwmKNfwE4RaWXTQZiu1YIuqkTB9UDUaml37wkovVh963SE1
 QEYpDomFwyMWhZOPJuAWP70R3OogG2qgIfsHzaghhY9eLGa+sxK7a+kRcoXIdL1MeFm2Q6j9cxJ
 3snuuYS36+OXcDOOE2R+6mJzqy4Bv7/9oomy46IczRH2CptRREgvtrAJmMc7yZ6zeazpBxp2ugL
 OlX2NtfkjyGm4N/Jf1IjC8F0/kOKfOmZ13H0slSSVGT5AqHYkc3FJbYf2a6FFzCZyha9xshnOGe
 sed1y1ICmToPmMBOK/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110074

On 11/11/2026 19:16, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 06:45:01PM +0100, Krzysztof Kozlowski wrote:
>> MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
>> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
>> drivers will also fail the probe.
> 
> I don't think they will fail the probe. Nothing will be registered, no
> bridge will be attached to the DSI host, which means that the component
> device will not be constructed / bound.
> 

Indeed, I'll rephrase.

Best regards,
Krzysztof

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625924;
	b=V5/H+4+/OHqAHoehrLLt9i0sSXMgfGcnjqWDwIvF61rNH4U0DQrXdfNyuveeTbmX/f7x
	 D9RR9DQ2mpd1j22egNgvS2aZDRJcWh20rEjdX0ueZq8q0E8QaMu3deR4hJM95ngPz1NQH
	 jMTdTYwK2vehChB/BJSUCtahzoxMwyiHUKOD2cP7Ajm5vvAIokLf29SNF92Zdv2YytW3Q
	 XoVQQn8MNZXHxHFE55RdWRjco9T3WTLgENX9pV4Q77IncMTxN4CyFlAnvZiSUqWhY6FGp
	 zmmNkcuJMSz/6ls14TtFpMp2p0dxqYSHI9IWupc/VLFjbMqOwFG+QmfJuAWF2TOssHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uUWEEnkgVVcM9gdESx6pqeOBCncyqZLXNSTJSCB8J1o=;
	b=3R/WfMg3R82hV0+DTrOcj0mdxT9nNBT9rBnj/L8hFc9Fe5Z/c5rn5eNvPg2Sbg9KVeSf
	 1ShX1ExZsbb6HEkvFmcthltoWohmDuYgmJ4LX469Rxp0aK25jonGSxpMcyzAuy++XdMV2
	 PDgTZTZvlgs3gUKHVkiF92M0FlNyUyhsph3Vc43G9D9hc8Mjgnr6QkZ7NbHA7D+PbUjpE
	 M0GhmHkzjp8eQn06U4qp9NodXLKlX3qNF5MtihAIh4TDd8BF1upnbBxGGkWJsWU6MDvOv
	 Q58ouW2GKtHAaf7STFGuVlapnB/wrtGBIHVqC4rFTaT8vrD3Ea2pDu8lT0ZaLar4GCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+NBmADy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lzr6Ka4K;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E3D606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30E3D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+NBmADy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lzr6Ka4K
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAgG63014716
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uUWEEnkgVVcM9gdESx6pqeOB
	CncyqZLXNSTJSCB8J1o=; b=n+NBmADy4liAn3FPBtfPpY2OxGEG7NI2qjoZpxvO
	8fBM1ROB1ZyVs6b583ZnuZQcPWUEo2WoA2uJUYiSdNa14TXWgfnPRTIiuXuW3pv7
	yP9M7KiQf0bw618boZCwFRuHXCiz9oDdX2ihhJ1QzW8t5uj3gpYqUJ9oDzPcwz+1
	BwJlcEniAw5dyXwKizuL+Vn9tp/MhBOnkbv/or0tZoa5pu8K/qmTmkQIoi9LYUcL
	VQQAWV595SMxn+BQZWxGwSDFqbMgNAs5H4nlk87dEOeWfEaIu67pmvwkbiAVFDs/
	MXy3mOrHtPfOON4Ca6uPPJpgdyFGQ3IkmLHSk9zCqa6H4Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rj06f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:25:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c84eef313so59892256d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625922; x=1794230722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uUWEEnkgVVcM9gdESx6pqeOBCncyqZLXNSTJSCB8J1o=;
        b=Lzr6Ka4KqeLZ41urYrsYGPgVHEYk3Y51Nl6lTb+gWI67E2zS1dxM3myqo2sV8c6aIL
         HgxbwXKhh0H3qGLqbTKxBbtYyGdSQD9HE8+lkBe2RXO9wHIKscGCTOH4ZCjQKyaR7AF5
         77Tq+rItfMzZ/Qa2qfgzkzXnEmbR+k2y+tDhYjzGiFSHa9B53NiU9WFmlCmyQmC7Do+h
         F8LgyNkvD5acNbrPcAroI9AWylOKXEsfvNZ6Zr9cJ9jgtMS0zT1v354AlnXmcwsVA4Ec
         hv+fZpz+TbeqPTaeVMtXXIjdk4kKsJbvT+tVPF4YsGcxe5YlQtZslyCCB3vi75g3+f3J
         aMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625922; x=1794230722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUWEEnkgVVcM9gdESx6pqeOBCncyqZLXNSTJSCB8J1o=;
        b=UH1HnUOefEYVFLmsvHVumfSK5bQajVte6Og6CSd/vhgMFGBTC1SrKxh/YLAJZ/7yNZ
         vt+SBW5NIw4a2Y5TM73tKVQOu0Z4NePVXBqNlIVOm7AJSq5rSJQRaO0h4LpFzvsEFT4R
         AZtDkOgOPUTui1vp4LCbYYRzJuYLMxf2OgERhmuUSuKKKls8sUSMSAuV4xKHSQZayfy5
         nZLm6Z4/pmiDC7aETDKnxcHewG3D66+SzaN0kASdjxv7YDzeB9JULqrjiS+Bd7lyzZ6s
         LMQCZquOkdmbXoKiaT859MeaNqqLG58GhZDkfsWkqOVvREQl4IloaElzkJCOnZcJ45tR
         26GA==
X-Forwarded-Encrypted: i=1; AKwUvByy7gQ0bFhIjC3EHbQUEKK023qH4wmV3eNDOrlNoAjYmJO6KQ1lzX1xxdkc3TSW3cxtKKyzBckrwE+bD7LQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJaLnhJWVkwrxvnYQ4q0490tk4GbNO6v1CD28qupgy9UmFWPWvr
	capMCN8sV3MJu2jgZsqN4Ocv5RUCJyEXoqtY8nxwYar3UIPVHfMEf+7CnN8j5tE6d69ryWx4T5b
	Abnkfh6kq1jga9Ev5ZqVfeUCY8hGqwGfHAPHByD3A0VmdfECy59gA9tHr8UouhEpRRCD3
X-Gm-Gg: AYBFou1JzFXXIQHnJgTqePZNRL6MLfSkf1DiLbgmFZemviF2YKRpQwlnfxwBZFMMxxf
	LQ62CE4o0W1wd/yPnzRvagRiyOts4QZ+pSg6YOOkfneV+JnPRCvyd+7peDRxeZKV6UAjYs2NgLG
	qWz9UvwuyktYj+iB5LK4zgWDgVL3sJaUlcwsJ9t7jtshSWm2Hn6dMuaCckEQOO5YUlJtmbWsIVG
	Jx9nNlWzn4ms4IRH/6RkQeBlhYGvXNpZo4y3yitxEtU90wStZUu2T5xD0/2ANP5ltv7XfpsYR5a
	Ml3tQ+/D4Qmtapx/chtGwUhE5Fe13Eri6hxzLXON0yXB/T/Ho//Xg6ZPuEPxI+jYPm3VQjND6oV
	JI3IP8IAoph8AR4ZYvaszwcsNxKONOha4byYJbu2WRV0IMvnFq+iQOJFt0T7pfVE=
X-Received: by 2002:a05:620a:84c4:b0:940:7e5c:7424 with SMTP id af79cd13be357-94421718c5amr1505537085a.66.1793625922211;
        Mon, 02 Nov 2026 05:25:22 -0800 (PST)
X-Received: by 2002:a05:620a:84c4:b0:940:7e5c:7424 with SMTP id af79cd13be357-94421718c5amr1505530585a.66.1793625921465;
        Mon, 02 Nov 2026 05:25:21 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c7852esm257033185e9.11.2026.11.02.05.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:25:20 -0800 (PST)
Date: Mon, 2 Nov 2026 15:25:19 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
Message-ID: <mmpow46nqejnddkndwlwdslgspjl3b25gocnpbc3qaxkmyqstn@52zey5gvjp2m>
References: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
 <20261101-hp-omnibook-v2-v2-2-1b99767deda0@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101-hp-omnibook-v2-v2-2-1b99767deda0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: carekbdDJ0OT-BjbxxnL7_GWYd4APBFU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX5ArxFmKRCwav
 E7+zrKp1jzMOykcwKFGTs3XGGhYjD/AQLXdzTxHhrlbtz+Pv2t6pDfMp5qNmcxdUfUrp0hQK/36
 Jk/DDvK4lz7Q49ndpx7peMhcdeERdFe3Zu45lykBAHLvVJf8fH8SdBqLKYPnJID0L5Is1kyRD4o
 Ojctw1++wsoOSciJ/igTXA8w8s2+9ojooKv+BqmAjLqr1YXsDZIljbr4nJxLdMRpGBYpC1B2vC2
 DmUYecYS0m3a4VyuQFQqF3Xy2UNyGfp/ytdxBk5BLFH4t2zCo7FiDySVZbRGCiUDt0ZmbGANRvm
 ZgWWxgZN4gkbxaRz5Fqno5+hGDWOKYvNsRhg8Pow9t7Z+tim92UYVH2P8s37qsZJ5QPs/62gUqe
 fPmEJhJFb/B4TWuqYnG6Z5zlh7x8BPsqDLPA5K2KNcMHpUr1nVdqkNs2msrqDQBWl0CBXWFcSYx
 tcRX1KEs29He6ec+mnw==
X-Proofpoint-GUID: carekbdDJ0OT-BjbxxnL7_GWYd4APBFU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX/0OraMvnMys6
 sy00blWfhC19pFYRYBClVif0hFqzYEaFByJRKsl3xzEhoVNe9kSZYkScjbfsd7t9llTkNaew5rc
 rvLpXpNI4gaY+44RWev7MLlqA3UgTUc=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae88f43 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9QAMbel9zcorH4rNmSIA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053

On 26-11-01 12:02:35, Jason Pettit wrote:
> Add board support for HP OmniBook Ultra 14" Next Gen AI PC
> (product SKU D29KLAS#ABA, board 8F03), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,omnibook-ultra-kg0xxx" / "qcom,glymur" compatible.
> 
> Enabled by this device tree:
> - internal eDP panel (2880 x 1800)
> - 3x USB Type-C with DisplayPort alt-mode, USB, Power Delivery
> - NVMe SSD on PCIe (pcie3b)
> - Wi-Fi and Bluetooth
> - HID-over-I2C keyboard, touchpad, touchscreen, lid switch
> - Adreno GPU and GMU (Freedreno GL on Mesa)
> - Audio playback and capture
> - Real-time clock
> - ADSP and CDSP
> - 5MP USB RGB Camera + IR Camera
> 
> Assisted-by: LLM

I believe checkpatch now complains about this. So drop it and mention
something in the cover letter about using LLM for this patch.

> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>

The rest looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

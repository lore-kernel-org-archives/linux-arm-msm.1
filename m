Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608130;
	b=bRI+8JvPQdtvlp2THINzPd8pygUOiyvS778Q5wd499FluWdrpLfJVY4jWRbv+mjGKpzW
	 18jbmsbJhqW50uJDJReIFzypX/O51a+olsxQgwC6tbAdRYiaqltVXVIF7Vq05l47Gi0qY
	 D2Fcy8WkaLsmDlLHHg2TtmOZy/xg3N0SiXZ2TjrYzDmAuUbSeQZFfjd+OFBx1HmfGoHpf
	 LX30A4WU9k/TFkiuSiTITgfghaaEPjomOT5exUhRaGjrAbeaScgPBUbsH+NF0AmuCtwo1
	 FYXLLWnlJ/YiaaVHlV94/kQwTl7fThMEZLMjSzShpOwY+PTYB3QyMMFhtCA4eyt73Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608130;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i3jYSnSdn2u/GLu3Pa6dvx+oEPdp+Zst7Dskdp50SrE=;
	b=IMVAzB4+wpDoBagPzo/SXzUSnOJChVt53DGtKMPrUz4VWhR1vsm+5E2PjgA/jcYx2r0u
	 d/YBcKDyH561hK8ini/MiPVvbjh0nXGakznEAroiMh3y7SL+p5PnGG35dJp/SsFs/VKNf
	 8Mde2+j2YZRJJXriKeSwil9j6W17gLnJx8ExJwJVfb+Wz8AySWethBm+z4lltaClYlHBs
	 rbFIufGI295bpMV/LtV2muRM7L/VKbKLQ5pXQqK3qT0whf/8jU7+1uI7T/JoPJjbMwm21
	 88GNqeNyVWPC6hwZGV6fm+HN7C8VV2EqAHZN18yprbMz2HdSrVxVimD1fLIfqqYcK4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FWZlc+cD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ED9434Pz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20338606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20338606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FWZlc+cD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ED9434Pz
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mBWi4130800
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i3jYSnSdn2u/GLu3Pa6dvx+oEPdp+Zst7Dskdp50SrE=; b=FWZlc+cDremacKft
	cqyuED4wIryfBVbpSPhjMFZ/b68Mrl3eIGreRGL6BWues1c67G/LjonhsTQi9Ojj
	pv1NENGBoJtxsViOjN6OWXfWH6BlHdzIQGTNmfyFu3xVhHUvYODgvFCfClQBwXV4
	+MKg2zUFO5uPTyydfqBixUp6WoluO9SjBG/r2feDeL/JV6+NNXF/BL7hL2eqPI19
	Wgs2v8cyhsnyzNJujss6cHH72c97N/bcIYIeCdYqxW6h9nvCLqPyb0ewOA8HskSB
	CfNAfEvJwLihiHbxVQMfuZ/Q2pGI8VvLc3/RF8BIvoM1BMGWnpnMBqSfVMVvRHDn
	IjQNww==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrqy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:02:08 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecdc7807f4so257886e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795608128; x=1796212928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i3jYSnSdn2u/GLu3Pa6dvx+oEPdp+Zst7Dskdp50SrE=;
        b=ED9434PzGFakLBNcj/btT2Rrr8gJpqdszjpYMflwY+kt1ZWAZ6bT06yBPT9n/dePwY
         5FfyZ/t5MFXewVINgUNz/wEOIBDp53JYn59zfab+r+/SUE6fgJcuuHZ5aEiy0OrofG+/
         cPVMW3FHVE55WjT5cTo3EZG3VyYRhqtD1BUd0KVaInSirg2vHDHlpVaSNt3OxWzpnoo3
         1gUlBgwA8xrAYGZzuEUMhiTjCynUPDS3nCofbXymWmf/AANklLKJ2eDQxXaDH+z+p5VI
         XZDcjMUUcV52c/J0MGlOku32Ue4E9Ffzu5QWL36Jj5gL/na5Z64SKqLFxroA8uExMBS4
         36Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608128; x=1796212928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3jYSnSdn2u/GLu3Pa6dvx+oEPdp+Zst7Dskdp50SrE=;
        b=2lvjUX9o8VUni5NkD0nc9fhq98CnxF8MH7A8dxM8qoqlil9SeqOOQB+DLw/SBfUJA1
         GGbug06MCnct/zK/drskQCcENC4c7G3Yf9ZOZKQju7ggvLZ5CJ2bHorCyGGF4cXgc/gZ
         9wAv5OuZerszaOPOOFzNqYLes7xa3DxhyvqQboXx9CYDmvoX9wugfEPKxThZdBmHVOUE
         JOJPcsCo+X47VHGqXI1fuIs4FAqdrFAtQwuPJmXRsvNpr0/2iaatUD1EHyo4XIMhEi1v
         RF2tPM9NGQeVOO18wQ1b13vhQ42RQjePYv2JqrXu8yJ+iYgIbWJskpSbZB73ed7+NDPj
         GGVA==
X-Forwarded-Encrypted: i=1; AL+hErH/QXbc48sjZ/oPr29jkUAsiv5M/HmU/JyWL8TJBINybPLP+kTfDkGiUfwnaQTBKIdgeqn+0CzRBqvzGc+z@vger.kernel.org
X-Gm-Message-State: APuU4Z/ud/VdfVilmux1xv6DFwJpAQuGEBUkAQiKQSXD5cuN4Lxb0ghA
	7yKA3SlwyuGvIqnDH2c6R1UbQK9kPo2zJptrfZsgos3UPLbRYFl3Wwhw3eJvrjAq+sHT9cq6CvQ
	eJ9A5vXGHcIbg97i4Y4stw7j5m6mhwEgDsm6jj/GwfyN2x4Gw1yfkyytmJEPu5CQ+5njq4RtzgZ
	WM
X-Gm-Gg: AZFdTZeG/TeCOeVZRnfG+XU7RnkUESKOOiUHcSlF61nHCx8VNiKJNXVFeDxJE00yI5I
	4q74xwL3rf/9Ity1UopqDf3bXJKgTiptI3PXTL91pJMoaWXGsFNFIb5GxlwKlMERENaAlyXACqd
	EBxevvfRQ9gD9iUsZ9ckw4iPoi+JFbkuF7H7NXiWtQp2GPW54I9e8YAXiXXpEPGemPxc4pdTAJy
	wPR0K/ipXXZWRyJcTWSSmrOORnhnqHzBR7GVTqUVA7ANkmGNXQrK6v7pdJ+7Z1rfg9V25jgdUkU
	wAK1xDAmQP1ohO/f4aOMBBiL8Olf+jKgTikCk9h1Fv7mJMTB7yvzxbkdzkuYAGKVhwQezbq0d+H
	+YBe6Xvo9siokiYKbVWmXk9/ks/Ksea6jJ6qjCXYmvEkDxxPvt59zYR/PRgOXrGG8JlhV7co=
X-Received: by 2002:ac5:c00a:0:20b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ee8af8d7bfmr11581628e0c.5.1795608128036;
        Wed, 25 Nov 2026 04:02:08 -0800 (PST)
X-Received: by 2002:ac5:c00a:0:20b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ee8af8d7bfmr11581553e0c.5.1795608127342;
        Wed, 25 Nov 2026 04:02:07 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acff65bsm648949266b.4.2026.11.25.04.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:02:06 -0800 (PST)
Message-ID: <e1b4fff2-d7f2-4647-bacc-df55343031ea@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 13:02:02 +0100
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
Subject: Re: [PATCH v5 3/3] phy: qcom-mipi-csi2: Add Hawi support
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
References: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
 <20261125-hawi-maili-camss-v5-3-1483b7f68dce@oss.qualcomm.com>
 <15cde6af-0b9f-4a0f-9d21-4e5ca9107a67@oss.qualcomm.com>
 <e93eee16-df8d-4d49-ae56-3e6ba9c31167@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e93eee16-df8d-4d49-ae56-3e6ba9c31167@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06ce40 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=yOYrsbgnHfbpD3x4ck8A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: WqdD9ptpmfe-CaCBcICVT4jdkCNCnjS3
X-Proofpoint-ORIG-GUID: WqdD9ptpmfe-CaCBcICVT4jdkCNCnjS3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfXxRNcaKxQcbDJ
 l3ELK/s2ImtEZp501GzJcqRifHOOZ2dm/CM81j1Jx5T6F0jwxAA5uzbz/92Zo2wosHCGbHCkgNa
 hBMnBiY27bc9NQddLtLpWMhgBG4mFLw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX4QZS0L8Q6WAq
 bvc28iRIWxlE2VMVVYmb0squjaVKqqHISSEYDc2TmyUAh154HsDf9WQv29Iiph89tWy2vLW9xnj
 vy2ZaiLfOy9DRs2ulwUfpqNUu6/88D7Qr20QTzJOTjtPRDSTZvVbjiBh+pukJHWbZ1Pf/bzQDF0
 sl4JQGacsUrzNdLGWkMrSiws2ca2LIs7y7Msq0dZtzDelfDXF0ekByWR/zWzreBHrQUH0A9scHt
 FfpqIe2R63L5GUK4aXfw5r1x2IPuKOLb5zsi7h5xa0xNh9kOGOfNAIq0FQ8J9HE7gHMzZkvgwHg
 OIxGwTW5WKY0wAOOKLdViwaM6gs4iD3XwqPCNaqNF7UyzHhJy/4UD0ahhfcp0X2cr8HbFNk+Gn3
 MMsiaDaV6VEbereZfJ3OAHhkpiu3LM6r8glEl5FZgcoZS8LEhOxVbeYZRDjoNGA23d0RIV9la+f
 0hwDcaL2BW0MaqnfDYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250047

On 11/25/26 1:00 PM, Nihal Kumar Gupta wrote:
> Hi Konrad,
> 
> On 25-11-2026 16:23, Konrad Dybcio wrote:
>>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>>> index ed40934d67eaeba0c6ac7ac75324ac6292fe7d9e..5d91303e0df2e8c5bca3ea8fa2bb831429a8f1ff 100644
>>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>>> @@ -162,6 +162,126 @@ mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
>>>  	{.reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
>>>  };
>>>  
>>> +/* 2nm 2PH 2p5Gbps 4 lane DPHY mode, Kaanapali table with data-lane CTRL0 0x8c */
>> nit: 2ph and DPHY are synonymous, if you rename the struct to something
>> like lane_regs_hawi_dphy, we no longer need this comment.
> ACK
> 
>>
>> As for the override, if its meaning is well-known (the difference is bit1
>> being set or not), we can add some sort of a booelan override instead of
>> duplicating the table, maybe
> This is not a boolean difference. Bit 7 enables PGM delay in both
> values. The difference is the programmed delay value:
> X1E uses 0x0e, Hawi uses 0x0c.
> 
> Since this may vary with other PHY tuning values, I would keep the
> SoC-specific table.

OK that works 

Konrad

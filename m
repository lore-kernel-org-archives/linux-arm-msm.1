Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705740;
	b=5obCFCbUtWyID+yX9FbV743KyIbjrtZPu53243oWeUe29++moQdgSk2BfIurWW3ap4al
	 0lRJm8wANaMgWb2HFPk64SPnShqXy8hGD1d6G+DQnx9d4obiTBT7sBj6Z3S1BAf2g8Zsu
	 PznunvJQGjekLOc7HoERSbH1wnp6B7a/1oYBUj5ZFXc5qs+pDAW109CyVua2htbeB1a/e
	 7XoGRHZCa1jXkrmcsh2hs6PszwBulTnn4hhFBIxJWuTc3qslmfYIp6JNjMfK2ullkIEaW
	 4Ro4s0BsHFPuMVbOcAMnl2Ft8JcssoJpOfRhBAdSwlytm75AvqZ2nXpz+l9DpYoPKcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MXZ6fbiVHEQv+ZeV6SOfsEnJ7187/w3LJyV+urF+JOU=;
	b=mWQkBsHi10ORx4eYt4xtX+JEXuR9lMcGR7dOflVhRmI5zAv0JLzJapbY34nPDpd3G0uk
	 7/xagtmNqxpCV6CsT23Lkzeg29pMeCg8EdaEz5X+C+M1TDwq4xmYcuDPyd9zFsUY/KMWZ
	 BI+ptZf/unAsogCkeoJSrgxfyrlhDIaOy4VpPS0OfT67GkOrgWZU6sNNzg27lOuG9b07Z
	 osxaRzl1+YTK8CZeRSMgoXeEaYYSYjwb7h7+UQuVyIQlp72dNYNYY09BHCpGzmN/FOnrr
	 U7WkL3XvU4vn6mLrZcqTVbveU94Z+JCrgziMimWvd8r5SfohRUsFcAw8EsvePE+wnbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aKc8s69D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSb1gsKM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ABC606D801
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 11:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88ABC606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aKc8s69D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSb1gsKM
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAUWw2201883
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 11:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXZ6fbiVHEQv+ZeV6SOfsEnJ7187/w3LJyV+urF+JOU=; b=aKc8s69DSW5Ycs5j
	jJHnaaQA1Qm/BO2HMQYM3VS1zS8PUbT0qlYLBaeucsZiCvGRqHwzTzR1CyNKDltY
	5Px0zMSxKzmT86JCJe5e9vte6ketF6TkfuHzwjY+n8ELYKE3hgIQ5/kQq4u/jvaC
	F4c5g48M+PVW7YF+9j1O5MGFH1SaC1Oyh/zt9F0i4URDmPD+sw3qWjjFh8MGp2Zu
	Csz4URuqDwbTmDyu2Bf6frVEiVhdq0EYxHwcZbe6RdvB4qUHyrXRMX12cE73yBvQ
	WofBam+1jS3XpiHaeSJao+Z9G8tDPjUJAxeOSKKNvzKtNJStvwIW/P+/l5H0igAo
	k18SZQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r3gx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 11:35:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93e2f72bfso65471155ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 03:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705737; x=1794310537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXZ6fbiVHEQv+ZeV6SOfsEnJ7187/w3LJyV+urF+JOU=;
        b=TSb1gsKMn5AElqC6j7qZNL7HmDnLzXTh6SX9nG+dHPuccp1mFP7tAjCIPvCvEBMTGM
         7BnBkgk9sJ59d8oeKKP3YdiYBd9OUDUeWMkUPyCWyb2CwCweQVLou9CODzb50t8UJJAx
         +iTdV5xYYtmRCu4Osc/hGtNqjbWZEnvm019W0Xt5qx+1GNdkV5Jo6H2czh2Bt0fmahQq
         EufO1LKQQwIU/KWO+w/lkTIQa5YgKFSw+G161rtcjCbPeEGXmbwY+6xPrl9QseiT8Tvk
         AI7Ufricn4l3kMgcKdC4AsLAGJIu03yjBAj8OUOFkuTznowGQ+bDmnfk7OXl75yVENQk
         zbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705737; x=1794310537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXZ6fbiVHEQv+ZeV6SOfsEnJ7187/w3LJyV+urF+JOU=;
        b=NC2870If5DwZodcRmQ77oEg6Ee8CmXOjipcRXiOfSMCApA8yVwm2Nt9VPd0ECN8Ivb
         Xu3DD1+6ATdik0ga85DmmAZf4F63dTCbSAbYixTgB10D1drnrYB/67xCPrC8gNL8j7i0
         HVYphxCs/U7cRzQZEeUX1j/wLGSknTKsALuzxsUTGm6TiIqtQkmABuckrHOK31OZVkcJ
         HDfGcDeK0hWGekTISVDqnfdDcp/dwtog41egwJ8gneE47o/fcASZbqCzr/XvKET42ypa
         xT4iDQy1+K6+t23yXnxx7AZaQWfNrdBmYHBBb/XxpPVoiIw9neSUHoRjXm5YSuldWFrr
         X9aw==
X-Forwarded-Encrypted: i=1; AKwUvBz5PHzy92EfTmQLpCd/fh4JdhPlfPyQV2bgt6NpWFoasnULq9jSn70BDl26FOWuwTMg1RwaG783fpqqV7Lc@vger.kernel.org
X-Gm-Message-State: APuU4Z+6Txj04YpPlLhRl4BtFi2yJQfYfyu9vnQ3M799pFV4kg0abxI2
	A+S0nl2T9ucoXOglyIMETHYaL2usJ06NUEmo6uss3WZuzmDTQCJUh/hmqK+u/yDqtCBfJeEwBP6
	e57tTR2C6+MTnORz6UrqUmv62QDRabL9POF5QuYaGrdTdi5uO+cW49rMH4Ej2XzPxAzjC
X-Gm-Gg: AYBFou255YVQYamMzeNseR6gp5w0WWdZnaveXVZc5LQgJSiHAwkF1e8u688sm2D/o5R
	ANLFyAzzhJLAo0SeSqSC4amG1B12FLQxA+5OdeepVuMFTISX57sHVTkLQV7zaXa5FX32P1LKHNT
	A9WfdPY7F7UODU6f9z0xA7TkS8AP5NsLrcmd1l0NIV+yqhfAn7o6KrvkUX1I6g2ZfIB/uYRB8jS
	ZuCO6lIrL4P7gr9yCbtBooFMUOaSSeyA2Mbbfw+nMr+p7if/WszA0fg+8jFELtsPbV/gPjFqkTE
	UvYmipzrVtMJauBxIxImufR5IB3J9dEdIwm8RzK7bVO1s8OIfR92owXLvSV5ZyAlDVn7Te5zIDv
	79ib7CQ7tabv8H8jxAxV5iwM9MDxOvsozw2U1iOsugHMwHh0WZg5Wo8GPEvVhLE4VYYtDCfBXzG
	h6StUf/Q==
X-Received: by 2002:a17:902:f645:b0:2e9:734c:501d with SMTP id d9443c01a7336-2eb3649bc22mr127001745ad.16.1793705737383;
        Tue, 03 Nov 2026 03:35:37 -0800 (PST)
X-Received: by 2002:a17:902:f645:b0:2e9:734c:501d with SMTP id d9443c01a7336-2eb3649bc22mr127001495ad.16.1793705736865;
        Tue, 03 Nov 2026 03:35:36 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052effsm39802075ad.3.2026.11.03.03.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:35:35 -0800 (PST)
Message-ID: <0b80b85a-5a56-475d-9dde-0d554f8ec8aa@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 17:05:31 +0530
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
Subject: Re: [PATCH v4 2/3] i2c: qcom-geni: Add bus recovery support for FIFO
 mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
 <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-2-59b3ce96dc4b@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-2-59b3ce96dc4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TmC8allhdau9ZAgn4fvQm4Zt_9g8Esg9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX5b9d3ZLoDr3M
 QO0RB3FmuzYYlIVZ+M9O78Bvbcss1Sbwtb8TX+mRRY9NTtD8j6ye0inGVplOnw2P9nH4EVys94A
 4C5Di1xMadgGkKqDYzd1sC9bRlsl1w/O2wlClu1wTPWUWQXE1PvtVLwGXHyooH15ue/J8WxacHj
 Dh7tZD99Tt8UwpiHX7Locnk4OC5yIMdW00l/Pv8N5Xx1836oCsfqxhJ5pL/z0PeNTSt5mHmjSDG
 Zgy5/JfJiNOnsXSZMq3zY94K6peQSEr+wbBkCMKsRIrpfEV0Th30S2DVu1XNHV2c896+r/Y5dw4
 gAMEbG/r6Wa6Kqjy4u1h9GaQR3OucQHiJJZY0mZLp27JbjbTnn+7L1RwzN97W1jg6Za46ESDCyv
 8fkNyHEj81I2s6gJxk+p84KfM89UHGRI0q084s8DI7WjBTuNfn9IM5EKpjYCExZ+S7n3iDP0JXk
 CW+qLPMqc23XYfFSObg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX7X6hxw8fQQlb
 8R5nMv/ETR34ZcqPSWo1UKdQittaJFSMbM7+rclX9u6GNdARzsWcRNnukdK3yV8zdKtKnmzPU0f
 vx162nlDm+IsK6qADx0ckdJ2Z8VXLfo=
X-Proofpoint-GUID: TmC8allhdau9ZAgn4fvQm4Zt_9g8Esg9
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9c70a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kinZEuG-tb8UP0AvViIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030046



On 11/3/2026 2:26 PM, Aniket Randive wrote:
> I2C transfers in FIFO mode can fail with -EPROTO, -ETIMEDOUT or
> -EAGAIN when a target holds SDA low, leaving the bus stuck and
> preventing subsequent transactions.
> 
> Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
> hardware opcodes to restore the bus to an idle state. Check the SDA
> line state through SE_GENI_IOS.RX_DATA_IN and skip recovery when the
> bus is already free. Trigger recovery automatically from
> geni_i2c_xfer() on -EPROTO, -ETIMEDOUT and -EAGAIN (arbitration-lost)
> errors, and register the recovery callback through i2c_bus_recovery_info
> to allow recovery via i2c_recover_bus().
> 
> Use the adapter timeout for recovery commands. Configure the serial clock
> and bus timing after runtime resume so direct calls to i2c_recover_bus()
> do not depend on an earlier transfer having configured them.
> 
> This adds bus recovery support for FIFO mode only.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9324718E1
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150551; cv=none; b=goDRYU6paGwAQEpPyh27VfrCZC6v4j/FxnHDL5D+s1uE431mVozOSgE4zVqAyzhST7eCUHUta1NSphoaXHXKxa3GedOUfUQqef97uW3erLMhirlwg29jHOvEd1LbtnQ3B0xDWl/Kmd6UwsLgLRHpiOw9yqQBwnWjy/cVWNnYdVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150551; c=relaxed/simple;
	bh=7rGnLQyzkLwTnL9Ma5ihnIWswpQ+yiXAUh1TvP4pYi0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LULIUQ1oppEgn47sd5IEqECtLHMrlCWNv000e0VV7/7DEskAFJ5D0p+uDDeN0gBRAJ3C9yOyuJBadORRg85qV2xoVstiZNMHT63AOGzXMFn9Y7WLDbarIKJhf/cykApKUVjzHhWLR9JjJjOCiMCdZLPGproySYVxKrp1MLV8tk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDIoMF+3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KB5LNymY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDIoMF+3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KB5LNymY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAGGI1983368
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 11:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KSPOXhDQq0GCi+jd+Z0hFBpW+y/WgMIH+G9un9D0uIU=; b=UDIoMF+3AKQJpFsQ
	N/x3DzaGyPlgboZYc0tR4E5T44I0ha7A/G2h6BxyrbGb7ZSF+G3L7/veJRUAJ3QW
	BTAK7knRif21xfKRaGdP/AHY+akjW9ZTNRFnoYA4GACa08xjQcbHH/Uqtiecm6HY
	t5Zy6/IPjf7dI4rKIeAmv5Kd56vK5IZxVjTnlKKzcfgkKyQgDV7BdT5DOSI+K3bp
	0hu65RBdJFr/SvaCB26hWBU7qrL67qspevVgQbNVNwCkVWxRUuVZJcG2kvMbJbwu
	XuKJXeliFeRKTj9jH0rtnKXq4EjPk5JSNajkIXtkPK+1NYqSXanVQsGUm62hsTjr
	ugeWqw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8ae4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 11:35:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd3b9e70fa4so5468811a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 04:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792150548; x=1792755348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KSPOXhDQq0GCi+jd+Z0hFBpW+y/WgMIH+G9un9D0uIU=;
        b=KB5LNymY4yhgSNJXxCaldQ3EwzjEZCItDGGJtka3Hm4jLFNNo3W14YQu2Zue/uyx1B
         mG/LtycRyaxk0T9yx/+2P0L5+IoAuedH7EfBYpS+QFcx4XmVO8ZkUGEkQlbaDrz9AsvY
         cTydDNNcDb5J8hqi2Pbimvwm4rkU84PPNMxWBMHY9c698Pk3SlzeZ4MC9A0WPn31g1Ae
         4w8QGLh8ykydFey04QJ4IuEXxY1CaRgjfeYaZp655yOv3JXoTwWv6Q679YNDu/N9FBQY
         ZdSmGWUG//kY+/+hzeQFUTVfpiLSX8I7owfgsZvjH3l8JmfwU0RTVJlkkIBJsZ6anJDh
         RQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150548; x=1792755348;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KSPOXhDQq0GCi+jd+Z0hFBpW+y/WgMIH+G9un9D0uIU=;
        b=k89C9np2bjfh46cV/9zUL/tu12k8IlA0rRUhnOIFdPb6eqno5g6nLB8k6V4R5fBo2V
         6nLvqantlltidmxlgeq+zQYAnj7GPT31POZNDHKKS4iJU7cV1fpiZdVrooZBhuEDFBQs
         PvpvpbvitYel456jbiUIEd+EtARCPt78Dl4d8+sYym+XqJ/3yYJ5QJScYUN/BFU34Yh9
         P5XoONp6/23gooYrtFuSB1AJ8RDRQrJm+XqDj0wnvnlzSrXtrKibjwMvNyn6fxd8P3zg
         QP9mluPEQCpXwpHdLmHhpSDC8CTQFQf5RuIFwvPL+ney69t6f0VTb5M/VaOeyxCuc+Wl
         TwRg==
X-Forwarded-Encrypted: i=1; AKwUvBwbRcAKL0HLSfzNhCh4Dkk8/NHFu6tSspafPRGaEEbtqILa90vRNIDvf2sJTctVhP/uC3+W7weAz+blJt4+@vger.kernel.org
X-Gm-Message-State: AFq9FYI4hg6DsmzwQz1qYDVmo8J+Xww/VC4m3uGId8irfKwUBSu4rsRa
	0y+DyEcX8M3pGddB2fsM4H768ouXsK/ZeD8m0OpgzeB6rEEh/VxQs/mb18SdTI146iGqvnKjExL
	Kw60o8BgSlPvBbzEO9vcbdvJ6N1eu0D9AhX9+1ApYQyX9IprPCVfCo3pVoDlhZgU8VTV0
X-Gm-Gg: AYBFou3h9oGmYwnUuz+ueSjVC07br1yyJpA6JnQP1tbbFXhlpSMuPVK5RKTuJDyqJ2w
	muwvHYdSdLtT2v7REZkFUQPjdz0LU9pn4AH3GX3FT++4BuneXOZLC5g+fXBq6O+/mi2p+cGQVrz
	d3AQd/NXsPo05IO9ttjx4croa/YCkAb2C1/A0bsxFCt0/V9OusOefu10FZ1fNrhGe+6k6x4jPZG
	MiqEJ3IPoc60st7CEpNvBjtyj1NV19TAh9xuwyzMrr///ur4DJRHi6J3N5wa+HNc9VGYRcG8JOn
	+DXrG4E8SSKkSpyEaKq0bMyNDV/PVNFB2LrO4ZC9scGz8zb3SMcj9zGsaAdFwHeDg7fWcbZhZDL
	lazBcosA9ir8g7iELVtQXMLHQ+eo=
X-Received: by 2002:a05:6a21:6812:b0:3dd:a196:3094 with SMTP id adf61e73a8af0-3e16bf09c3amr16527917637.68.1792150547950;
        Fri, 16 Oct 2026 04:35:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:6812:b0:3dd:a196:3094 with SMTP id adf61e73a8af0-3e16bf09c3amr16527889637.68.1792150547498;
        Fri, 16 Oct 2026 04:35:47 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58017c70sm970158b3a.48.2026.10.16.04.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 04:35:47 -0700 (PDT)
Message-ID: <010f8a27-e058-4c8b-8681-24df30c29853@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 17:05:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH RFC v2 4/4] phy: qcom-mipi-csi2: Add C-PHY support for
 X1E80100
To: geocausa@gmail.com, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
 <20261016-x1e-cphy-rfc-v2-4-377654253193@gmail.com>
Content-Language: en-US
In-Reply-To: <20261016-x1e-cphy-rfc-v2-4-377654253193@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0NiBTYWx0ZWRfX05tg1JRpCxlC
 J8DD2HnhW02EpovWnDV5qABadym9QmZdnsQFwGUjKJcAN9Wbp+I2hlMv0oKVYOydc4UJWRpsHzB
 UBDZWyTX8bauiioqYjr9u+EwTWjt/t0=
X-Proofpoint-ORIG-GUID: PQN70GQgqS7dcVUDyL39gW9VJe7_aK8o
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad20c14 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=F08ZnmPqtNv272u8dioA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0NiBTYWx0ZWRfX9etdYGn4wowi
 j0jvLwE9+vaQ6cEyJq1A2po+lDz5GA3xx3QqJl11TElGOTWbsoy/Yc15OS4BywGISb8Ml0IAwqN
 YVUBFBqRFx9lXrzdATGhxKATwHF7GwBzdlzCA9wINsG7NGbQ0tGxK8OIycbcLnGDxlESbrvb67y
 I65NtZYoRfrm7Dk4LZv7LNZMlVupgfGQwQ1oORoVTtAOO+f1KH4UywcDeNHW5y+5mubgyOA5WZR
 ffF5M4wpFCyNHlcEgD3FI6jSvbBSKxHNaRMLKISk7Re/USUU0lzdTwU/t5OeORZkpG4JqtAagM5
 W7Fxvj0/b2fpJQxYtSfhqyXkM2lKKWBeS/6kordQE8JQeZlHlZ+c/Qvq6ugzogzV5WF8Gc/3rG6
 q7ARSW/x25dqpYeeIGudyVAZwYKwvvCDHJmoGYGiDtbzsnjVL3pBcPTYTJjdqq1WJe120SKnkKe
 oTcTuq2ua04yZ2UyhXA==
X-Proofpoint-GUID: PQN70GQgqS7dcVUDyL39gW9VJe7_aK8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160046



On 16-10-2026 16:27, George Neacsu via B4 Relay wrote:
> +	{.reg_addr = 0x0a54, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a40, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a60, .reg_data = 0xa8, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a84, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a90, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
> +
> +	/* csiphy_reset_exit_reg_2_1_2, 3PH */
> +	{.reg_addr = 0x1000, .reg_data = 0x0e, .delay_us = 3048,
> +	 .param_type = CSIPHY_DEFAULT_PARAMS},
> +};
> +
I checked the register settings and they look good to me.

Can we write the delay value in hex as well, to keep the table
formatting consistent.
-- 
Regards,
Nihal Kumar Gupta


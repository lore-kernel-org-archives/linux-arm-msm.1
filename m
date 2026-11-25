Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608037;
	b=HNAdI0QuOivSoRFAj6PphhTsYKVgnd178F70OoLOHrzlRZpvMb0RGwpZns2rDOb58tyd
	 IA7oMTrX8Dk6LSlgr/QNzu2lwQ5RDEKT9lDiue8gl/Fo1BNUFzbWFZVmr5SQQ5iroqfAN
	 14DAU5uHWXCiQ93LDCaD175f7/dE+Jpfr1+UbCz9GBkSMp0bbgjY6Pbf2m1NyM0DzZBOE
	 HorUeUtUVdvZ4h2mVUNhyr53EwNKqS1yP0elJQ9Iy25lHtckFPMIovtvgBFPKGGPrU1j2
	 3OcF9jfAWf1F+nqttHNW/rp3fNb46vlVR2DyGsj+eDFIejoxYYu/gCGu+SxdULGC7UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608037;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZGmtiss+37jmH+iF3YqbwmD4+9FY1uTsN9kR+qeAjgg=;
	b=BQxisqVQE4fdZtXZL6celrPvzQvS3RAEchzGvxtfGcAOGQHMfX5wwU5GEvOlxBZC8JxH
	 wHcvk/UTkSo9i0nL2d9KlCwEq0elrthlRnYm2KJ2rpFAO87QMKc5ilcFJS4BsI0kn+Hkg
	 RfcQgNo3UB0nTSSHwJRNGCtInxKgLegNGTY5oyvE9as5mhfnbOjLhkhLoAGk6NOBDBWbb
	 EvhlWFtSHzs9bcTrUUR6V5r9F7y5mffGtQd7Btfk6g5X+cpf6bDdUtLTBZc3xoN46m0Vg
	 ffSKtlXzvVjNs8sgvHvOxONoHktZpDiqPEuTZmOo0tz5h0QeR6toz9MH3Y5i+/iX2tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="c33gkj/k";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z4bg1+bK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CE1606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28CE1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c33gkj/k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z4bg1+bK
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mkfh3642560
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZGmtiss+37jmH+iF3YqbwmD4+9FY1uTsN9kR+qeAjgg=; b=c33gkj/k+xAEBid9
	cfhgRNxHmvmdPnEq4qHSgM9+ksQzj4QTwJXo5Gb3+tuH2AdvABDNf2ReNSrx11BX
	ZvdpJpMdIzJO/r0xRfzYNai16w1ncvLhqanYSJYKEXfleFCzeGyryHkliEifQP+f
	4lXToPQZTfaCwwXbABBr+FvRKF2407zO8Mes+dOLOYb0xY3FJZqTHIwrHpeR6mef
	uX8v6iOwM6zb5T2brTgYzdwdvF9Qh92De+cm2Azq+yPaXKRz/1own6DQ+R9Nno+u
	PSn6w27GkD+e1tWGjtgBcEJMvIHgmKGgwWh3u816mACC7tKBbUwCLZ1hwz3ZBjbU
	oyU99A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2aqa2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:00:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a079256596so4082845b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795608035; x=1796212835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGmtiss+37jmH+iF3YqbwmD4+9FY1uTsN9kR+qeAjgg=;
        b=Z4bg1+bKoiLBSPGYI/02nXiyXwma7o1FwX2TX/7rLDWw4ESa0iGmPYPSos3KdSKp+X
         twssW2imtm1CsT+Joy39ublSFABlgBp2P+vEAVYKF9GaE6Ltg5ReIhsCvfTcNAgofgoA
         uHr4sJfSC1IiD7KMsA/ijNMfEzk9qPQhUj2JrBt9jr8LrKXvfvFeLIytLgVvCtDEbvbd
         2qA1N96VzqfluPL4gpr+R8C2UyZBd1F6Hd1cqCL9NRXsP+a5ZDLLfMUgk7yrmK1ZAvGj
         g7u/yO8/eoRid60cUhf5rhhmkEXvUTOMun3wzf6XyDmjzIwngjz0FmJgzkE0zmGBcnhE
         Tsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608035; x=1796212835;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGmtiss+37jmH+iF3YqbwmD4+9FY1uTsN9kR+qeAjgg=;
        b=okSilSDsIIauQ/HBggKIiSE8RDX8dvc7lqVKE5KZZMHcwYToQ7pigGXWc2fFXrLROA
         IPTvKa0QWZcIza0XKrj6TVJ6CruR9BbXsJvwRP5E6er/3p0/XVWfYGpw8EanAgHkcP9O
         UJDGTeBnOlsWopPIT4HxputDItzMdOTSxGwfUui9R0ZZbM+/CMVi77sNW1iqkAvT2YBH
         KxmhekgVJJWpZvbxOipfTbBlnWNy+0Eo3kSmnFfm5COzzd+Xckdv1zgVdPXxbr6qEvY/
         TdIJw6mdE6FiCx0U1lJIUfTQcxWSfnQCXDaQ7Pwj0H37hAQjSoeJgQpne8kvXenNlNXX
         JcZQ==
X-Forwarded-Encrypted: i=1; AL+hErFTPOlDLIL3/HuYsCd4AApxCm5Efb4/h3Oz/TluD0ntVrUqXrOuAnrWw/GMnbtcZXyuoi7v+KIhQx193us9@vger.kernel.org
X-Gm-Message-State: APuU4Z+yVhTNEmcF+gLwpR7IR94sBwmW5et0GlhBj+5+Q3EapOKp7Z7I
	Kh1uzeFyEeoUTZeh8UyKvbSZCcnjMgQ+G/GD7TvRyVMDbwdlHBRTiU4lrvkZV51qbvWRTc4516R
	mcx9Dm4cXMO6XFF/2j6G/f5F41uSl1yx4uKFiZr8Jq+vzg7BJGaG/rV6L/NfY5hbGWwjx
X-Gm-Gg: AZFdTZd1TanofHb9KZ7CZPHsgxwiZGD/DtpU97GjN7qi8Ea7o9E/HDUQwnN9pydAZ6o
	VfT0yuVj4I0ckiiWGrnwnNIXwLlS+57WEyboraPpSL+RTgiZa2QGPG5wdwhn8OpvdxbetlEcRw1
	o4Ok3j7W0mnDejiP7ats1Sp5onRbuzPZIu9UsM4IC/BTDzKpTsqnv/eMFomGqmbAyOzkNAREFS6
	Yu11mG3pKRByjPMQrKzv5jRw9TYfcRv/BC+fuk94BEG6ST2diG8+IhGYgRmho/XB2fHM44UrPAk
	5tFbd7xAdjPB8nFoFNFpH/Fw/xzuWy1nqt2shSLajYYSUeUjnW153NktXZD9vLwDbCTT3uDfKsI
	eUR/pr/9ZTUXmRAbnyG9rVdFoJfXzM8CfN+vlm5HiuBXTw2SsEqgnWkGYf2A3Tj/DUHkLpYVVtR
	yEuw==
X-Received: by 2002:a05:6a00:1817:b0:8a0:5f63:5521 with SMTP id d2e1a72fcca58-8c8792bef60mr15376392b3a.8.1795608034748;
        Wed, 25 Nov 2026 04:00:34 -0800 (PST)
X-Received: by 2002:a05:6a00:1817:b0:8a0:5f63:5521 with SMTP id d2e1a72fcca58-8c8792bef60mr15376338b3a.8.1795608034103;
        Wed, 25 Nov 2026 04:00:34 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm9045190b3a.7.2026.11.25.04.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:00:33 -0800 (PST)
Message-ID: <e93eee16-df8d-4d49-ae56-3e6ba9c31167@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 17:30:26 +0530
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <15cde6af-0b9f-4a0f-9d21-4e5ca9107a67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06cde3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=zU3wpra9rdAe81a_7icA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: K7RcoW0v8gj22coHa-YreJPk7AEuZTdV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfXzVXvysFyNH7x
 SPT7x75uxi85CycZxHyGnMgDGaaCgyyD3gpSCn+AyfYJ8OwOYg3VYALUuMx9RBQH7lYB7+ESWcG
 BhOdEyWaxBycYYoIhTEl58Gemjk7ULBk3+mIVY5ZOSwcxfqJWhe8MQ7spdoTDzOr3RIpE5xb5VC
 p5qjvfTOCzU5gBK784FOGTdi9SkdzIrTE7g0XT6Y/3u0kvwrpmeNugfMSGPsAvC/rR3NlrflXBZ
 639NZN7u8PPsNBLn4oBK1cZordkhNM+VnhNsNuv5znj5A4LILznsr7ntbUIvVn4SGx1daaBbMGK
 oV2OzN3+L4boKHvyDtkErjjD0GoF4P+dVQ0GOscZTmuVh5CSV0UOoyzN7jMPx4UtkSlBicAATca
 o+9g9DiY23INcreXsYBhkcJBTBua733wimB2aFPdSos4KHuj+mYEgbMKFSC9PqGf2x55a+mE8pZ
 iO021RjO8VzfV639zyQ==
X-Proofpoint-ORIG-GUID: K7RcoW0v8gj22coHa-YreJPk7AEuZTdV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX+L+1G32VLAHd
 8gGHXWlrdg/CKAN1GyVczvyp0gUHap7WF1Yek7c9oWrrmLaEYQ0Y1hyV7Fu4RiozeaYMaukG13C
 NzTqt8EytrLXKhVxW3ckhngLVmJ19KE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250047

Hi Konrad,

On 25-11-2026 16:23, Konrad Dybcio wrote:
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> index ed40934d67eaeba0c6ac7ac75324ac6292fe7d9e..5d91303e0df2e8c5bca3ea8fa2bb831429a8f1ff 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> @@ -162,6 +162,126 @@ mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
>>  	{.reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
>>  };
>>  
>> +/* 2nm 2PH 2p5Gbps 4 lane DPHY mode, Kaanapali table with data-lane CTRL0 0x8c */
> nit: 2ph and DPHY are synonymous, if you rename the struct to something
> like lane_regs_hawi_dphy, we no longer need this comment.
ACK

> 
> As for the override, if its meaning is well-known (the difference is bit1
> being set or not), we can add some sort of a booelan override instead of
> duplicating the table, maybe
This is not a boolean difference. Bit 7 enables PGM delay in both
values. The difference is the programmed delay value:
X1E uses 0x0e, Hawi uses 0x0c.

Since this may vary with other PHY tuning values, I would keep the
SoC-specific table.

-- 
Regards,
Nihal Kumar Gupta


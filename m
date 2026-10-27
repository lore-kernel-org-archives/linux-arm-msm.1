Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089887;
	b=piOcnHJ1HzLvqu4KcZtQQnAavnn0awDZwaJsJawcQqvY8HWvb6PnjYI67ZFV+s1QYsq4
	 FKXjqi1dB3AFQKCcTONpw8w9w07qM3pTVinpasU9ypzKwz3uep6723GQnJsS9tOIpXV34
	 NYpDdWYpg/8QCkwJ/Zi0W5QY37fmp2gPombPEbkZGK4c5UnIBg0XMyHBH+Uc0+quMezgF
	 aH60l9tS/9Op/RfrVynXxqTUm2Iab3eP1qQkEOQHyKsF1tNFFVGRTu1nPuwkx4nz9svqU
	 j1l3N7hmep8V8odn8koMdYYHc7Glzp/9EWdInCbj1m4Rz8Osm9WURFNNae8/F38QEjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tDfuRlR7hPuki/xS+Ng41cAx4Jg251B4AwP+7qUrXZA=;
	b=l7XviM15PtUhdEI87s0y8d7qXWvTVxHx4A6mZ51SgHXTBAnDoboOLcsuox9h2el2hlYR
	 HwqBtHZQMNim/OcQHtBtvDjW+og9YoteZmpAeHYWcjIegtlmNzqQ9/EKt4pjgJ5yph8Gj
	 8U5cgHQAB2jBfv2T4RHRZheqE5Gm1VKuw8teEWNO1qzNS8e3qlXQpNA5E4Oq5qs4anEmh
	 XDQiKr+2UdXDRdqvmz6Ccrf8Z0yls3Ws5+nnQEmaSH78ugYH+22fGvEV1wLA9n0hhx7v9
	 wOpB0MrmDkXwNAV/R5N+23LMOvA04ypnm4qhs0rFr7Vc+D7zQrMVi1WsTnq8vUF8eCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eo9DMkjA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a1aOhkNy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECD2606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ECD2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eo9DMkjA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a1aOhkNy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Z1aL752258
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tDfuRlR7hPuki/xS+Ng41cAx4Jg251B4AwP+7qUrXZA=; b=eo9DMkjAURCax4Sb
	6t+TCgPdlL7fsuIVJnfSAj+5uy4i+EjkVPc9AkAZ9CW6SFFPUTCS8wVrsX76pKgv
	L2KgoQs2DCFUwJUb76krjg8Zi6YCOO6DlVogGFLWQ+XnPC+md9/Kg5ERGoGa5T/f
	2JuecC/RVLIvvfNxJx2KrcplC4+PJCHOiNLI8abXVPgRl3ozeSv+9ygdfqtl0779
	9wmPPwlHugoq8hARLlpsJ9Ih5Bv/1FgQD8Ao0ZSkOmhWe4sRK0cV+5n1BY5b+SmO
	EsyV6WYlaOucDCiYvI7RFzEl6bG8AVzxWn3J9D51UYcstX8Bxz3rwDCiicwEBojD
	0ozq9Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmanxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:31:26 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so226540e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793089885; x=1793694685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDfuRlR7hPuki/xS+Ng41cAx4Jg251B4AwP+7qUrXZA=;
        b=a1aOhkNyhvsIKBrcA4cAV9uWmtV7hDCH0CVA/QViKpNZBMN/Hcib/pNDZZrXudW/Cn
         ds5a7FGrUB8DN1Zzty6EGW4tHbgQw+q8RrVRXI9uFthCYoiFwSjwHRZIDZAvhrroElmc
         xPlpeiTxZilkDSf3CyYClcoX4hotLlPyhwMRfSN7+JR6ywBQZkUg5wdQcWhEk1z5ux/O
         /dJKmt869GEqvVBnRwkjhDizoR31xcQ/AlKYjNxN3Gtzr+v9IA0pMNgEADPN5lAg2QAH
         NhoaepNN7vTS3BopS1G4uIJDcyUouN5hRVamQJIjhfqMFHJof/g86UfiCmjeWLnW35mK
         n+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089885; x=1793694685;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDfuRlR7hPuki/xS+Ng41cAx4Jg251B4AwP+7qUrXZA=;
        b=OVve5/gHTT1XdrFK3Bb/JiFiLbz0LgdAsvqeli/+lQ0JolxvA0K2BWDhjJrMXFNIwM
         o6UMhve0kD5hqWUEjnYs5qX+qowxP1pX3/J1NiCPtWGvxrgvMQqOQsU8AKfiQO0e9378
         YKyynCVWIuhQSphP7JVTiBTrb3sPWbSvdNRcbg8PMMdYS+202k3nKHHE6/YddQOvlKfm
         x89hAuobjSZaYzfyuBW00+0wNVwMGiun55ydHK1dWW+S+wo/a8YI9uysU/bN1cy7Cm32
         UypuECbZ9xkqRVZUmb+H9QX8X4G4sXao5TjAME7ooJFjpfyMMCAN8Fh0PIxhMnTpFO+1
         kHfQ==
X-Gm-Message-State: AFq9FYLeUg9g5h5Acin/6ZyOaoD1et7ZgyIRtJ5cMGeaX7sp/AwygWCq
	LJujSEKpW2nrFG3JNjUw0l9JwLkP+7qXCf2sFgLTBPctR1zAWXV4NK4ZyNOpSVwxj7PQPx6IJ5D
	856J7hWSpUmWjgLZLdBl+4g5KSadIQISnTF3QWa8YEtyoiJNd75TxQkdL/z4na6ZJjdgS
X-Gm-Gg: AYBFou1kKe05aqtqlqM1Tkk2KQqNnEACX3wsTzwY616DkCjGDkqlq/Yg3iO6qGG3mhU
	i4XgUZqbhDYahlGxkyBsAnwFhmbPvOp9g21i4xr8YWgJR8n0GLfXPzrYqSk1PG9Vx+80knBN5ud
	JBfX9CXi97GNQ/hZCrSGExeiBTiUN28E6wF3u+7kBmu7LeRi0MDTAT3rP7PO58WYSDoe3VDjIsC
	3pvK1gV7iaVOPO75Hl1D5WOZPnUamq8u9aAD1Rq35x23oeooiv8644C1GDC9VBKkaSwd5UvwS50
	gtlsSx3tvkFMYUpx9W9nsRLTjIzBqSjvP8kR3C4efI4kg6lY6aehmj0RuAUU8ovI3QrameTp4Av
	twSfopANpg9HgT/gien52WQ==
X-Received: by 2002:a05:6122:8494:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec232aa431mr2973388e0c.5.1793089885094;
        Tue, 27 Oct 2026 01:31:25 -0700 (PDT)
X-Received: by 2002:a05:6122:8494:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec232aa431mr2973384e0c.5.1793089884616;
        Tue, 27 Oct 2026 01:31:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66fa1asm411593466b.62.2026.10.27.01.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:31:23 -0700 (PDT)
Message-ID: <544a3e7d-151c-42da-a501-a40d720bc061@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 09:31:21 +0100
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
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2
 port
To: ShiTou Hong <redstone.dcity@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ShiTou Hong <dc_redstone@outlook.com>,
        KancyJoe <kancy2333@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
 <20261027080758.3990418-2-dc_redstone@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027080758.3990418-2-dc_redstone@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX+E++dPCLNx4y
 AxUqDlr8egxcK/DeK7Pdd0ZnTN0PxNapAn8KcD5bq0ECNcjnmbKEoWeGRDzJ1GjV/bpJ6YweyYX
 S2r3BDrhqjQ33OSuhRvsKwACPohcR10=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX1yW8y1ORPELF
 iOU73Rkr49gL3ssgOoL/eGw9P4uy34VG5BSn34YSQPchOmTqxRQd33kIy9cVl8Ct9dUKta6reGT
 lmOVyLET0r/KqzHWQbEFLowMrITkmxCWIWV9i2BZdQzzdwWtUfDv1ChGkYtwxwbrj8myw5bMlOa
 3IUCG2Tlmy2F0LrNxUOrfnKwtO363g4B6sqSXioJkMQS/RBIYsLQCaT0M1zzWmUWbkQdBh5E3fD
 xXG/9key1o4BrlIHmPidMuZvDDYpvI94Fu0uOYvWnP1VlZ57n6JOYCXuvZ1bkE54YJb2cK4ReNP
 QGkSwzxm8b+1RCDip770Z0j7E73dxPqrYHX+QzxIX6gMpUKO83hW3WeDU3pUpDjEfZbK3dtyIgj
 p8wLu33S2LUyA5j4UUVvvBmpXlfX5eIxWhZrjTTb4tFp8zezBOlMygEXStnWVGsclYGd/lb1ITV
 Q06020+19utCQdEOOZw==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae0615e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=WPJgwWr7pJBm-2QsHeQA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: qmJ6DH5wzC0Km9g5Tnhlrw4yfLpqNGAW
X-Proofpoint-GUID: qmJ6DH5wzC0Km9g5Tnhlrw4yfLpqNGAW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270033

On 10/27/26 9:07 AM, ShiTou Hong wrote:
> The sm8250-hdk has an on-board SD/UFS card slot,
> but the SDHCI port hasn't been enabled in the dts,
> so we can't use it after booting.
> 
> Enable the dts node of SDHCI for the on-board SD card slot.
> Add the pinctrl node of the SD card pins.
> 
> Co-developed-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

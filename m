Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625680;
	b=1gxkMCRIWJzgEIyxo5KNNx1zC5LK3KfJ4tRsjlM7LsMvZqTAlZJKoz4WbzbuYBgfgx1/
	 YZPt1ARlJBiYEQY0gw6EO3uo4YQ2/9uGdvYV6H0QBSbWe2GMWcC0kEccLio4vqZeeO7rY
	 oYKmKwQQF7xPHWYpAN9X4BzJBnOshJooVHf/rQXScZ8lQW97GP4IZkdepm/OBU1cvVThb
	 7hjlcBUqDCrsUEyhja1c9itVYdWsoTqLVGPKR2fNvFaKeJXpLa8D1YBVFuILFMPUvpSW2
	 0o/UXtRZSIQRHuixvfym+Rx5n8Sr9dI576Rx0Gjxloy+hj7fcZbjZoNwiTxQJC5Lusg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Xbx1BUgqsVB2CQb9oZczMqbiDBgubPx546cwvRO63fk=;
	b=LAM+0mxFMHGma9SonEUrD7C2Txa1Ybh8OGHSyCinLpE0x2LFMiihkOhGuckbVSnK6P7X
	 BQnQ3XQON3gqE96W2YQZhxNuM/VPh6J6ixlThM02ebuZfqi5sjX0e0AzlDHFWGCaeVG7d
	 VfCIRBwTv/LQ/rbD0qXPVldLDqfRyLi/btgL/b4TblNPjVXSPH+Se/pIY7ofUtIYgLViS
	 6pyyzWAfLMtqrYtfKWXGJYQUDLuvOXFV4U2zZR8+dGF3sO+1KGr7Br/J8MwC1xZQqCRmI
	 yZk6ogKIWJ8nvEvykhIwAVLBtPf2zyHVqyrbMh70OQoaDRleMoulECIO+O9bh2rXsmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3bFrcGg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e57XM+xk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60D5606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C60D5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3bFrcGg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e57XM+xk
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAmCb3627768
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xbx1BUgqsVB2CQb9oZczMqbiDBgubPx546cwvRO63fk=; b=N3bFrcGg79MFD7ZJ
	l89G978mD1C2ZoUWvkUTWFP7/nJzct3sr7LB5USoJJYXLZQouqSAKCQVHsB+mW+5
	sKobtD0UsgP/BRdaanP/iScNWvDBQiCtqa5IOjvfS22gOLa/9I5D4gDieDXip2p5
	0rKznQutRyRb7wHRCuBsSb3ua4PL83VOBFROiAr/+O0e0+BYvYm+NceIgqJM0X75
	1yQb5NuyFJ1h8P8W+3IYX4FVxCCptl778HPFnLur5kJ9MJlIZBb9YrPcowRrkvUm
	tkncXX2ZTWzLCZY0l/h0WQaDuqrb5vKTu+qQw3rUQbvq54gtoKP6my8Ts7wXt876
	0qmsSQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61ydb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:21:18 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99067ffb4a2so46553241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625678; x=1794230478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xbx1BUgqsVB2CQb9oZczMqbiDBgubPx546cwvRO63fk=;
        b=e57XM+xkm7vUpMUpP5yTpjlqnOurMx6kd1tqtDTExJ+aAT2RGra26UTvv+S67+JRYH
         751ltjajJ+4W99rgy5wurMsvS34YfXZFDhGm8qjdUWfWka/ln0ZNcV2gHLcd61y2vxFP
         KAcXE1EGRs3ejMvohPdin1cYlahtePIX07sL7xtQNc4wTIiVFvbaoYo3y+w05yNTLlYU
         CR1Hv/e4ekmV0N1ZyMvtiYzli0urCv69G7ys8cuHWEtkuqoQOocffxceoAXdvxuoUEzf
         /HzAtsI8eq7o8C+oTr5WVlB2GN89cOEz06OWdzoCbNRMCYON0ad+gbKTIpAdHZFIs79B
         +n9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625678; x=1794230478;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xbx1BUgqsVB2CQb9oZczMqbiDBgubPx546cwvRO63fk=;
        b=FNYrwrr8l37cZZPEJY5PByPTE5t5wNhH/ZN6K+P2v9QhZt3yQrhauG2+oqzQ+/+SQb
         nBciP9d6kgfTf2JKSDKUTS4WYi411PilYviTnUNG+4pyfKXUniC6NB+voTZXQRXw+520
         /Owlttpx/BMyIj8/XA5UTDgKtHDTVJpJcGouMc7AtA6nFhoR/XpP6eTu7C0LuiNZ0S30
         Xk7UqTW2T5Av4Jj4jksFDaO310J5756tC9f6byMnXzf7+c7SMhs6WZnxtiX7EZQvEpVr
         VdCNNah4VPdh9r8doqI75tI/RFdD7FPRm2yf3AqHr0NrGOk2j7SG4vcN8G4vvVYM9wmr
         cx7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwJeDHIOkh7AzvxTrDfLyWMX3gEAaEiq3LEKD/jNhe2EY/7gUYuvSpBzfx6RzpPkhn9C3OJfkA0PDRW8YUK@vger.kernel.org
X-Gm-Message-State: APuU4Z/PiJXqhZr1zw3VgaQf8iGYHfqqKbMnVXPgoMj2Qk1DdV1jff23
	ieG359BYsiHUYFpnOc0cjUI5Kc+tUMPfwmD0MBEbVW3mBGDY6Qa/krzadnRdGLKfn1/CATc951b
	eGcqraHZTh+qcIykuuTQHuWmSzYUqJKiV2v3Xeq6h1izeNAQurXLsSpyHoJCZN8Yj3fS/
X-Gm-Gg: AYBFou0KkTGTXXLjUs7aUD5T3KKntTmZuxYxgXGgMH59M6O11iCx63HffktJmlkvKan
	u3Hj978uC2bzcIpqMOn4z4B+zuidCavAMXfbBDx9oMFjq6QOjUIkpxdF7koG8HEvqZeMudS9qcd
	FyJFobyUyWs90QhMmyh6MDkX9rWvRh7q414miDFC3eiNtsEhT8bZwRPnuV1Ogx1ENSPuBISo0GA
	lDgQQXZdMZWvChjBbyGQLk1MsdCYmMDnWZ8+5T0/srLaml/N3LZ0MQYzquVtTJUvPIbKNJ2Cvd8
	dTZ5XSjGnjSyYIdINOSPj4O8aDQlvBi85Os7fv6P516/NHYgKPyJxgEmyrHzkjP2ZWCr6nLKOA4
	A59qdrytZaDJZ3rpZV9e5DVLjPeWYyErIJhW6SZPS+kWb2Rx4QioApretu0ECURCLuhzrRps=
X-Received: by 2002:a67:f446:0:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d072bde34dmr3850555137.3.1793625677668;
        Mon, 02 Nov 2026 05:21:17 -0800 (PST)
X-Received: by 2002:a67:f446:0:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d072bde34dmr3850535137.3.1793625677256;
        Mon, 02 Nov 2026 05:21:17 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcbb0sm3395230a12.19.2026.11.02.05.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:21:14 -0800 (PST)
Message-ID: <748ff335-71de-416d-b994-b97a24ef9bd7@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:21:09 +0100
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
Subject: Re: [PATCH RFC v2 5/5] arm64: dts: qcom: nord-rrd: Add sound support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021073633.2163128-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o_MSKNVPqCuDyHN6XGBFyXfzQvwyrzLa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX0tmGfTxjldD/
 3AYxjpZQjrR/NynLCjRivkpce3ygU2k1BGf/N9pTP87sjkKnyHADRrlJIdvkLNg/AUPRaD3Ku8U
 d/MCY9Xwt+hJ4s5laUn3ZN5nhtOBamQ=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae88e4e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-Q6HcSUBdirZEqn3JksA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX4oOUKukTK7OL
 4r2cIww3EiiJ6OOn6Rrut2VX3lNS1jzc2aIgzJYAW5MxJ+mJUV5ZG2Wf1NMuyXj6g0Fd4M8T7kW
 IrQLYEcXlK6Uh1rkVgglUMvhmhUMBQJ6KzJz2Uxnvw5ElLBlkn093hWIsvY6Ief4Q7oj/h27bql
 dESA6H2yZauWSm6pK/VOdvF6sXDnxXlSPsqtZyy09lurjHK8M9Rajdo2wb+N51yqfMrf92Qu8LY
 i0mZYWodUk4RFv7i+gbaAYocxHVAPt7bMSP+7J1FkuwqXFX+vHbZSuI70eaXfQFJ3FdA4S2n1F+
 72T7QkAkBDukJjbBl7nt4AbrPBFzdH3ksqFtOBxFyTmQOvyQtDzRlta3wb+zKWmZTbcnWee33ot
 D+E229m4cSAIWlOp69myxYTqG4roHMo641bsBynexhXrGppVf4Pj34jbL39B1YhInBWIEYCNsdL
 K6bteROog/4HDunJ3fg==
X-Proofpoint-GUID: o_MSKNVPqCuDyHN6XGBFyXfzQvwyrzLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020053

On 10/21/26 9:36 AM, Shawn Guo wrote:
> Enable audio on the nord-rrd board. Add a soundcard node using
> the qcom,nord-sndcard compatible.
> 
> Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
> clock supplied via MCLK0.
> 
> Describe DAC_ENABLE as the enable of two regulator-fixed supplies
> (3.3V and 5V load switches) feeding the PCM1681, and the two MAX9892
> click-and-pop suppressors as one simple-audio-amplifier on
> CLICK_POP_MUTE_N, routed after VOUT1..4, so DAPM controls the mute.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D329C36195B
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236835; cv=none; b=RoT4e9RklerWYHB9DwTBbU66CtDkoI5vnRpqtJaP7LhdDx+Ha2d+SzCx7EAGleiGGh/DFZMILKqViZ6+3wQbS5FzjueiXKxZOM9UjZ8JFU1PkPqBVgbqQPj8yOJjWYt8BJmfiMBRlZTslcdyzE1n5ABOskJwACu78/va+UyVZLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236835; c=relaxed/simple;
	bh=Ch0bNTUrZrdhGWjR+v/vzmIz0s6OQlTQ1MsLie08Hls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oc17f4vBJ5Lmi/bysg3XtJlFtThEOj3c4FtZSmzTpRctkkS6R39r00WX2JSpkq1OkK1AmC+Srj6y72gOTVSDwx1mxtUWWDtBFj8ov+O9h+fyoqTTifrvWflVur2vEatmk1aHe8tIELCyYdQCz45ssQwPoMO7BmO4ss0R0oT4VQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kPH/9l1m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+Ykh1gE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kPH/9l1m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i+Ykh1gE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7dVk3987796
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bULlRsmm21KR6nA5VCIlR2YU5yJGOIf9AWnYowD50+A=; b=kPH/9l1mFLZiX2zr
	TObXnAxpjIee6cv16jNerUkFWh+5Lj0neZEOTLePNk3YvmX0NYL+mmXoGVBiz2EG
	iAnEI6Y0ZYjqkoeMsUF2lgRsLS8AfFBgJ7hcPHnXZCsODBXFHKvyKUO5wr0obYOy
	W97g+AjwZWNo7T2zdAQf37uTrrzamFpA1WmbKAvmSh9GZ0wseELGicWcaxRfeQZm
	SfjlgFxLEYCGU8i4asgsuJ2kAh7V3tNeRQuUbUW0RK/vA1SzXq7mFbRkMtAwjrON
	2LJjCToeg5/FqNYEGkHFkTAQAsCYWD9nx1pdj9+Rp2kj2NHvxIeZKp/43gefo6VI
	Syl+Ig==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg893jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:40:32 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97c46be4adaso7927241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 07:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787236832; x=1787841632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bULlRsmm21KR6nA5VCIlR2YU5yJGOIf9AWnYowD50+A=;
        b=i+Ykh1gELlgqjFmD+T75hMNrhhrKyU2cDjla5wUcGW9eGrYuZkQWsRVqryzzh7Mo9W
         jEPto22SbG+BLJS+Y/B0BVYX4niM1PGv8aySkptNj+CLl4HUsqmMWgMCncJLAcRpLEm+
         cU4wPRXcFY9KSfH7pvZZkgKYrYo0G08hvwd8OlmGcKZSCSYSPAkeOf1x1y3K7gn5eZRn
         oV4u6knRjlM1wZ5n9gpY6k9gEOoaDMLgYZs4B3QmS4dUBta+ZtJxgTXHJH8MK5NvfXO8
         XrdN2RWo07g/caT1ywCUDnCxFNUGazs7t1S7CTzpkv2JAv0Bmf7/BlWKsuqY2ZOevjPF
         ZVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236832; x=1787841632;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bULlRsmm21KR6nA5VCIlR2YU5yJGOIf9AWnYowD50+A=;
        b=Pp5Mfb3OKS2K4MkDtG+ZrwNF3Yg4kyaoqyyiDm70iOkFTXAomcaMKdwIUfB1/6lFQV
         LwsIjLPNNJUFlzYwy5ryDtmFl+b6BRxvcvluFg/O/LdKUix7ajywkgYZmemNGeCJ0JYu
         qBis4aNxCLQKaao08zCXaFd3rRT/nwhr/U3JrQj2BcOTJxJgrIdR3Mxh+LevBUXhKv55
         EUTpSyybZy2mCSZqSozNia3pUHZ777VJ3XjyLZ8yFIjIhdNCru3ngaY1jfsbkGbFkmQ+
         x0tSDlwcCwsHpyUvnlhEfyUF6pmWi/p23UDT6jT6gfRIRqD+X8/zWJenmLp5y0EJ8BZ7
         R5lg==
X-Gm-Message-State: AOJu0Yy8vJVEUcquFdARBB6kFRLZlku217+GpQryCxLfqatOLhvHP/+J
	2XgIKBM5yuHgBI0mbjIX6Tow89hfdpSxexzUneuSutabmtmv3Nnmr6bYs+31Z4C7h18muckCQVT
	8yRwrPqsut3mzib+fd3ppl9ou3XQ6VOtkGpn5KWHtU8fJ50s7X6Ssgyvpbk/K/ckfOIzG
X-Gm-Gg: AR+sD10LaJRgxwS4zEsPoitJvmj43UmZdlLCt6tjc1/IYGZ/GzpMrQxbtvvwnj1+1vC
	5X6Vvv/tbgk8zZAn/aKxpChZ4xIJnVEfX6D9H+mQ2CW/H0enB+dQ1Y8ytRSTWMFw1kfXItapbUr
	VlL8IaUoMW31TlNR+Ioaw+c+qNSUEUCHaSBZi2Scpoiq7KNzYNNFx0Ome2EytAW1Z4Tfk5pbAPV
	q3bwQUDs6cYSGeh6KnUdS7EOsJT/V+mm7ycWwUA4Sc6U81V+SoHH3MF0IfYdahs5glWvfDunXS2
	K1XE09Eth3WWXJJSZByu7/ctPw7qdNypRFo+yKLTSc5h4L4m01bb12OBcsk3ogUa366u8x4v4Dw
	3gp31cipy/ktl0mWUFH5h7SJJ
X-Received: by 2002:a05:6102:14a8:b0:778:9d46:6dbf with SMTP id ada2fe7eead31-7789d46e53cmr1458797137.1.1787236832113;
        Thu, 20 Aug 2026 07:40:32 -0700 (PDT)
X-Received: by 2002:a05:6102:14a8:b0:778:9d46:6dbf with SMTP id ada2fe7eead31-7789d46e53cmr1458778137.1.1787236831752;
        Thu, 20 Aug 2026 07:40:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b478860c85sm1333752e87.35.2026.08.20.07.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 07:40:30 -0700 (PDT)
Message-ID: <24b878e2-6073-491b-a454-efbd6c21e89f@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 16:40:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] soc: qcom: geni-se: Fix endian conversion for
 serial_protocol comparison
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260820-fix-write-to-read-only-firmware-buffer-v2-0-7badcdc455fe@oss.qualcomm.com>
 <20260820-fix-write-to-read-only-firmware-buffer-v2-1-7badcdc455fe@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-fix-write-to-read-only-firmware-buffer-v2-1-7badcdc455fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEwOSBTYWx0ZWRfX14XBrjZajdsJ
 zKZEYI504hJ+tlu+VDgAoGBkBAE0KLqopPGfFv2EY05bES1R0dnyMUXlEzXYRXeIdUsVENbNpIA
 WC2m0wMSK7Q/ag3XPv8UiWwTZelm23E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEwOSBTYWx0ZWRfX9VlcQIJP16te
 IziLvCfeiJVx1mPNZWOTvu/O4ukd3cHA7GI8qKSRPjXMXkb96e+XnxFP2u+p4NL1lXp5cg9qi57
 HOeaFoOpXHXJO9Rcu0gXWH/jsPPFtEtBCyEkuPK4nXI0iYqyRlHAg9rDCPyj06eyfhNxQ1Baf40
 PVHOMTN9X5i3N3i2Xrc/TtAfJ3F5JLvKhZeUWkFuMJX41UAvxMY0ELoAYccFf42DG7+Bv9hhnQ4
 qINc3sf9KH8K7hTx7Y+I6loDlImEprrVOLls9JkV2umhovVvOcdiJKZ23ST7370mVCQojWkPdp1
 n93EG7Vr5NjxQcwW0MbjRthy5WdKuvhcgVNAkZr7ThNJ8oF6H6QpjE8Q+B0jJoxmzDRO5ttPkcx
 D0G8LpuCafR2xs/2Fuoz7i7PPZaQvstMPhF2cwRG6WwrPMeOp2Do13gTa913N/hdFZnKJR6ibf+
 jeKj4g/7kP9i6D5fr1g==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a8711e0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iJG6fKeWqX_QHOf8h_cA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: WR5-USOLKL6ZnUkCYeb9yvcSwws-f7mK
X-Proofpoint-ORIG-GUID: WR5-USOLKL6ZnUkCYeb9yvcSwws-f7mK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200109

On 8/20/26 4:30 PM, Viken Dadhaniya wrote:
> serial_protocol is declared as __le16 in struct se_fw_hdr, but was
> decoded with le32_to_cpu(). On big-endian systems the extra byte swap
> causes the field to always compare unequal to the protocol argument,
> so no firmware segment is ever selected.
> 
> Use le16_to_cpu() to match the field width.
> 
> Fixes: d4bf06592ad6 ("soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem")
> Cc: stable@vger.kernel.org
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF8B483BF3
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988938; cv=none; b=N1Ilw+4alxGRpG1Lwl0nIrf7RnI+/fY+v/0ac+EBNpRj2sqSnkfFHcuLSrdY6cNfPRz1OaJR2Vgrs8kt1XIU3AMiPh7gLVDr/MHwucO+V5VGngVQvWzd0x7VerUr/tYSpUHQcVCQUIhD5Lgw1+MP2tlmHEfLLRtWfh8EmJC2F5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988938; c=relaxed/simple;
	bh=kUWqBH/ANEOMF+OfYL8lsNbfxAwjX2wTKEKovjJYSgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YM76Y9HvU419l7vgt5u454mwJ+y1nsDqfCVcZr6ZXjJm1V4o3Jb6vPZz9dTFiRbrCitYNwNyOWNbu/Gra1+uSY3OBJ3dW7ynET1xeISnjpkOQli8q+cwYinbyRYGMrrmH3WeV8rdsIsvte+4/Aydmm0XbuH1Tz3eaHhyyFqzLv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EttIX+wK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L595+01X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EttIX+wK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L595+01X"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAduWa1926504
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+mt+jOa2RriQv+B+Wbv0m4jlSkeIIIrbl/YtagK9qk0=; b=EttIX+wKKp5EGn3p
	LtPmFUpyLInUxUc1Xw4Bq1V84fkHazBwgBh0h1WAZfY4jBHhzjG539FVbvvd+lZS
	FVZAZgA/316LeCbLJkaIvC9i7Od9EjBTp3/dL4ULavRQCxDs12SzPOA/uTQ8iGB+
	Xnr8jtfAzoe54OwdyLbnNmhjMscT5wMnIxRwoCyXCHCMrVaa8lNw0Z/1zmmZ7Jay
	cVZ1U4Us+i+8IrNhAbn/byrG88756CDM9wKiSpqeNATtmHaJp/uJHOC0X1mYxK0c
	cpv2vYCqEciAl1mPWRUQxI8/yOOlZfoVVGJtbc1kV1uaODpAZ2Hej888xHrX1lsO
	1YchcQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3va2ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:08:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530e0def61aso5032421cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 04:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789988926; x=1790593726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mt+jOa2RriQv+B+Wbv0m4jlSkeIIIrbl/YtagK9qk0=;
        b=L595+01X8adB+O6K7edEM/wbcWnzMJYDVXgGEnwbRVc5K9w2KhJc06TqxYFzBEz6v2
         1BAMwIo7OZ9ScwOMo+Lpr/6tWnica0qUOPdfE01LcYDcch6uns4P17dKO4Xf9nAcPXfG
         v04JFR6l3n4A80KZxQQcx2rW+oUe6UU7+9XhfvOR8eXn/5lTL+2nck0EDNW4Zz8TX3FT
         YUnhercBn4c0i59mjXGTyZhsM/5VV0abBdT+Q2Bm3lpsg8QbsXCfDVYDvFgWYm7q8GqK
         TGFNEH28+E6j1I5RYXPq09ENNo4Osf/hwt+E9JYCQCNxFeyJc0Uf0q1e8f7Thmx5hvXj
         9fSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988926; x=1790593726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+mt+jOa2RriQv+B+Wbv0m4jlSkeIIIrbl/YtagK9qk0=;
        b=dqVGrcVu5/CD7k+OhJpUHGm2MQNcQWl896Zvw066EJWWGtWsdXO/XwEkzq3kGBCklU
         NDjhbOXszRr3Hh4IZ/6I2CpqjiwvizH4SW82SG9FYaqg5SnfgUf2lTN7bsGdMXBFbPoh
         ky5EKqgTHXQfD5cWALFGrEZRNRj2TcbXnx/Y9gwEHRvrEPEf/UJvrPDLUBr3ooD2M1CA
         yupzDJDnQhZ2KQswIIi5g51sNqyZA38SX1xrT0jqwfw5NMFxkv+LyELCixb84+gnVUme
         ZKUI9YG0b6GPN2xf3jCk6NpwyXWg2QVaCHDseLtkRr1niJl4sezv5mLSNCGJabqfgqL6
         6JdQ==
X-Gm-Message-State: AFuF++kq5Ql3bu+F1LET/hVl4aXvWxkU4qhi/laK7Pzr6ji6+HvT77Pv
	7w+egWoTeK6ZpXclOo0DmCZoOi2NRtw2jFjd8rq8tUbTls14cG7cMQZQ2D/Eo9OGDwsYnxtgfUd
	ej4ZAYm6GdyY4hBSe0fTmPU/eFbrYeEk1I9hEU4eo6la/eYLqvJYrN4tFG/JrqRt2/Bat
X-Gm-Gg: AYBFou3uUo+ynKhXrkEgP61MeXsEw70nIQACURAlNSe7bh4fz59Hf1E8V7StKO2kEPl
	6exqZ+Lxr1ZXyJxLsZwvo0EwYEwOv+OYRSwZtsQ5QWiDtmLyL4x5HziCDXitIwD7P+Magq/vkBi
	NImS952THh27IMl8aUGoSClPPII9FYavzML74hGTRW5YI4fV/NQVl6N5ZLvcWe7vGwrxwEUy+j4
	B3aBvUpF7xqOw2pmu4gMGpzSi8Fd+dEWcmCKCatXwZjBYx5cLTpW5SYfSZEa1twBLoad3PUpV9d
	0cfDDd83k60TmYtnZxqTx1GfBwB6DGRwfmsxS5GczzuGEUVUeKUrW5pxB20OhbAOQeqZypj0Rjf
	M3fFmdeoFFjJxuXG7IZULSQ==
X-Received: by 2002:a05:622a:1911:b0:52d:8270:8e36 with SMTP id d75a77b69052e-532b743d863mr99486021cf.5.1789988925766;
        Mon, 21 Sep 2026 04:08:45 -0700 (PDT)
X-Received: by 2002:a05:622a:1911:b0:52d:8270:8e36 with SMTP id d75a77b69052e-532b743d863mr99485651cf.5.1789988925398;
        Mon, 21 Sep 2026 04:08:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a607468ee9sm22436471fa.3.2026.09.21.04.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:08:44 -0700 (PDT)
Message-ID: <22355625-a2ea-4b6e-99b3-65cf93ac8034@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:08:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] backlight: qcom-wled: Fix WLED3 brightness
 register stride
To: david@ixit.cz, Lee Jones <lee@kernel.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Marco Mattiolo <marco.mattiolo@hotmail.it>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Joel Selvaraj <foss@joelselvaraj.com>,
        stable@vger.kernel.org
References: <20260921-qcom-wled-backlight-v4-0-bab8c7ef73cb@ixit.cz>
 <20260921-qcom-wled-backlight-v4-2-bab8c7ef73cb@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-qcom-wled-backlight-v4-2-bab8c7ef73cb@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab11040 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Q3U7ue9uqBl2Npjrlm8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: vTSIl9A8EePe7x8S8W7dNoLBfyjYqJur
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE2MCBTYWx0ZWRfX0XJYYywHVOrs
 tcXIDx+vrhhpQFsFEFKvLKl3d7PMrLxjBY9B8+zAyLZ8CFt4HxCXlIzUuKpjc0G79ija/s5Ilwy
 AONbjQhaYnitPelKAAZFWUoq/77jnz0=
X-Proofpoint-GUID: vTSIl9A8EePe7x8S8W7dNoLBfyjYqJur
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE2MCBTYWx0ZWRfX27fUWSYXNZTS
 IiSEU1zYi3n0i2XYmPXzfBBZwAtU8u04OA5dlpOJxcYYVGMdmvvL/494D30u2Bn/gDe68Q1qNJ3
 DFgZw5mCRgq3UUdXiVoSzsbmNgyqdH5u/mrF4UVr8uAdFGWsGoijg6yditKIGSpDyG255Wvirr3
 1xXhiJK7+KkvBtMZ4YFHIa6F7DWF2WhM9JVtfDQCIqUCeF6gMYoe5sPIjA8e/Sg2P6aJvdtC8h6
 QNzUjmjrBAY1DlR7S2bpOQsI+tcxgCqpmqslpHDKuP0di5iVtGpFbQlQH5plXPyBEapOA7Cx8NW
 cjbnDPF+uSlRRyij73Pasw93QX1ZmWRTHRoVH/j6j49Lm1+0vMHqxHfkzYnYQiMq72nffPjp2w8
 upCzDMqbUXf6kkD1DzK2E2G4B4ZNlbgiLI1JEeR1NP7SEqMsschBCyvr/XQl7MMogVFB+2cxTdi
 maLr7YmoWe8aMqJ8JIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210160

On 9/21/26 12:46 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> WLED3 has a 16-bit brightness register pair per string, at 0x40 + 2*n,
> which is what the pm8941-wled driver wrote to:
> 
> 	rc = regmap_bulk_write(wled->regmap,
> 			wled->addr + WLED3_CTRL_REG_VAL_BASE + 2 * i,
> 			v, 2);
> 
> The restructuring for WLED3 turned that into WLED3_SINK_REG_BRIGHT(n),
> defined as 0x40 + n, so the two byte writes for consecutive strings
> overlap: string 1 overwrites the MSB of string 0 with its own LSB, and
> with the default three strings only string 1 ends up with the requested
> value.
> 
> Use the 2 byte stride.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/video/backlight/qcom-wled.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 2281007bdd459..f452d328997ad 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -54,17 +54,17 @@
>  #define WLED3_SINK_REG_SYNC				0x47
>  #define  WLED3_SINK_REG_SYNC_CLEAR			0x00
>  
>  #define WLED3_SINK_REG_CURR_SINK			0x4f
>  #define  WLED3_SINK_REG_CURR_SINK_MASK			GENMASK(7, 5)
>  #define  WLED3_SINK_REG_CURR_SINK_SHFT			5
>  
>  /* WLED3 specific per-'string' registers below */
> -#define WLED3_SINK_REG_BRIGHT(n)			(0x40 + n)
> +#define WLED3_SINK_REG_BRIGHT(n)			(0x40 + (n * 0x2))

Ideally n would be wrapped in its own parentheses (doesn't
checkpatch warn against that?)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

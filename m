Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A424DEC04
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073885; cv=none; b=UxpwWJTdn8wWSrN6zEB0OFezvetYHqH4qXBVK5przwCV14YG/rF1cBHCTbTjLTz0wgpGELlVps50D0lz9btTpPKfnpF2Srsp5+pdMDRRDInaAS/UaVj6b7P1SXr56/db/pPJnWzdQzDccQog/OVXKma0yaZjHcfcng3dbuPgbyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073885; c=relaxed/simple;
	bh=umTzAitXHWmLYEotv+KuFJnI11K50uWLB9nmZJ251Lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JlGwEbJqi081XZdvsgrrDwiwvm0G7dFlhNFyEBBgOZHuH7QEjNL1sKk1haZiqlJZwDMO4J5DpBIuzScm9yTGnsAyjnM8pHEn4//RIZEIdQEVxEnFGG86chMS+hmIhiNiMnjw8uRuyGH+PAIKMm8UBZtSkzdrH5ikGrQLVxWudwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhAlvLxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A4tQf6gi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhAlvLxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A4tQf6gi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MATSai1023763
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	044jsrB67uaRkWcSYVBrDKkesOnR5wd9zo0iuc05Kz8=; b=YhAlvLxsdJGCWPoo
	zK7eiPz8T6eJA5pWPuTzns/TNFFSsgrFv1b9KL3tMz7uGFk4yzPV5EdN0K1FRb3N
	18EIveuauidwF2/6cCEkNhUFMp7QT27O7kd2tCSiTKAsu79sWgvm21ZadkPNvTf3
	kK9CR9Glb5RBR0FHj9knlw19cNwtqaAZLP0IETZfKCXWiGRddq2bpVR3MHvNIHOs
	3hDUrLjuOvhreG/8qDqHXR1fe+cm1pVuV27dNT0uIgh1fZaiZ30Mk87XPO2FTZuw
	lWmfnFZ8VVr9qLsUFn3hsdXOIkBUav8VpPGyEm9dmUW0FeExovBoSWsZvyFyZZXU
	LTumkw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqycr1v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:44:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d0caso105907185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073880; x=1790678680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=044jsrB67uaRkWcSYVBrDKkesOnR5wd9zo0iuc05Kz8=;
        b=A4tQf6giWKfIPNqaZClsuvMHWCXs+mkGdUQgoErojHM+2fV5I0zJgUYJ9E+qWokdAf
         fEfPNU5TC5/m2lduT3JEy/XThKsdVHl7Or2Rxg0wv079atJOP0wFAHkkbAatdpeRC/TR
         8madP9JjLl+p7IHcoJemvsd1TM0UJPBDxyrDNd8pXIczDPF+0w9gO3i3rd69q81YywaK
         JqReJQoeuGTHrot2yhGblf2f9qUwoBbazY9Uf5D87M8fhLx1AFA3Wcm9tn/VTElgqDVR
         9F/jAzdlnOGWvjr0cm7i12/1hdKAhXKlTk4iQcB46uCgN0nZArJKVCgctB2VJ2L09RVY
         ub8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073880; x=1790678680;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=044jsrB67uaRkWcSYVBrDKkesOnR5wd9zo0iuc05Kz8=;
        b=1CLQnP/p4x/DqBgK1z2nTjhwRGQqPINyNux/v4qXg41ZOXklnYZPxw4g/eDDSQz/Ir
         xuz/x4oWLi2slg/lzswIXFxzFGa6nybBok/h5qkgnHPx4kPS4+5e6TseYGln57js3Ol3
         cnw+ZxPSow/VYhnVgkHc+FXPqEVWvIlqshkz4ujo2Ienjtp+QA4R9gOih2ds96+AsVFz
         WyY2oAEuQRxMTj+2k+StpmvPSTNtj6huu//Jw5RHTKSefvrpmhZecNidJm9h5R99qPs9
         HdDNMtEA7SILakjEGB7t6nAuQo81WrSstvn+BW8C+m/inXe8kX1tN1k1/gU7SNlI7u4C
         7lQg==
X-Forwarded-Encrypted: i=1; AKwUvBxf3qYcZeA9d/ZnV1feNxxSoB1wzSXaiWak3BCfEcRnO9R50b9lM4Yw7uf8TYB2RlEBOIpLJSvvGhJKG05m@vger.kernel.org
X-Gm-Message-State: AFuF++na1ynq88yh/Kr9y74+2oxXnd5IXmgwY5vatB751PKpALXJwabA
	x9EN36FRx8n9bhuI66ZDPi8q+JXlOz6GZROTXOjC4JZhH8u9qIdJQ0OZzEbqJERQv9xp+tbIMgj
	WNCQoL2SSE6TcquDtREICPlwcbKQxBMReOldaD2oVl9zZB6CP3lraIu/YwtU+p/P0TyRV
X-Gm-Gg: AYBFou2OtMkag2N8WMCZ3cERpQ3Xx5wHh+B8Kh8It8gDaA1DEwsLOHsPuV79TQMUN5+
	FxHvZt2V+arv4u7YoAFufXyrGnV+ErHLgSRYHe4muS31Ep0hZZy2F9Fehgc2xWtuSZ/Rap7azPu
	nB/CUNZpAY2k0ivQZo0fTEUS9jlpxE39MoCarLwPouSDvgJK0Jhk5s3rxmaimOe5XFjDlgE7H+U
	z/v7HlTEdMsJWEz/8Kru5gFcslhyjf92F+/4mscTBC8MUoH4Xi7imWh+QAPJ1debazSaHpdYT4k
	5BKwvkRHMt+IFExU5E7KHLof7tRGdt9LP0ydg8MU0jZGOXolJkeQ3TIM4ThwnTfgFpicDi4rI8S
	hJdsMd5BtGzbU5hJZfhwbRw==
X-Received: by 2002:a05:620a:d85:b0:93b:beb1:5790 with SMTP id af79cd13be357-93c15f855ccmr500228485a.5.1790073880165;
        Tue, 22 Sep 2026 03:44:40 -0700 (PDT)
X-Received: by 2002:a05:620a:d85:b0:93b:beb1:5790 with SMTP id af79cd13be357-93c15f855ccmr500226485a.5.1790073879816;
        Tue, 22 Sep 2026 03:44:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c54fbc2sm63789366b.16.2026.09.22.03.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:44:39 -0700 (PDT)
Message-ID: <58ced827-d6ec-49e1-9a2d-a4d5c4111721@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:44:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] remoteproc: qcom: pas: Add SDM670 ADSP support
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-6-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922015801.32373-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lx81GA3VtDGqLO7zkDLue3PEOsH8UjYg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1NSBTYWx0ZWRfXxcAmkg4Tiawt
 3V7oCG1gg/m6wUilKSDWIoQUHtsmfN8cgzOQZuRHIsCimS/mwxsSDT7MQBzMkgp7t9NbnGGzhs5
 W63KhQaYU3bkQyo8nQsVACfcKn+bTB99zSPETgkCyXj5tpz8hhr84JEVXege5TcMIoK0ow4LiOE
 /s3PnIHlQB4ttrL0a0TcLFMpNEOvT+k4hLY81pSM8JBSCpNuO7xi0FPYLAAHXTqOosGvHwHxocs
 jKh/PKOInOZWea0bSh9FoCyQYqTzqaIzRuYCHBatsdPURhyWCSXr3TJ7U4LjGCDY3xxsBMZn4la
 IWRp4KMYDTcqtv2YrZS/HWIZdaghfP0oUwtZ4lpVAZa4f3kproHrSOUBoRRPVubzxqRNwxi/cLC
 mu+a12j8B2uheakxMjtF7SYqQqSYkTVSzv7NcaLqXDW3jL8uvP+3AwF99DxJn5FFWRqPp4mWqKb
 t9mwor+STw4jq8twhXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1NSBTYWx0ZWRfX+ODHQAXyB3Cw
 fp9xrfdNdMTzLz9adCnFyww5Tnpfcx1avObCmgzCIndKiq89f8ltCTcp/v8bNnDZb/q7QKL2W47
 wjuSI7oM+zvvs0zpT9g4EYTswL0yw/U=
X-Authority-Analysis: v=2.4 cv=c8I+0h9l c=1 sm=1 tr=0 ts=6ab25c19 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=do7GNnlObjUVy-8jmn8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: lx81GA3VtDGqLO7zkDLue3PEOsH8UjYg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220155

On 9/22/26 3:57 AM, Richard Acayan wrote:
> The ADSP is used to control audio and sensors on the SDM670 SoC. Add the
> compatible for it, with the same data as SDM845 since the driver
> requires the load_state.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index ca8e61254c44..5272a462fc49 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1865,6 +1865,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
>  	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
>  	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init },
>  	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init },
> +	{ .compatible = "qcom,sdm670-adsp-pas", .data = &sdm845_adsp_resource_init },

Would a fallback compatible be suitable here?

Konrad

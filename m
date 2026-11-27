Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774010;
	b=45o6QITLnVirkoPygfSHoaM50k5kBUph012v3waffMFkNWYl9nKTkdX5lLTPSj786QAj
	 U0G0o1iKcQ/mByGEyUvI4LG14uCYTzwHmMbyQz2EPvkzQQJ6inXYkv/4oapGlMVRNGpMh
	 vvpI3T0flmVlaF3m4H8F8zPjbpdFUee6sq8/pFVZ6jNyfdMl+N05y955NXJOJz1SyWNDe
	 fx+njy8T5fzvzxMq3nGBmfnm6fUJWf5eSDnhjbkiF4kNKdLrAHExK8MTSu2gVbrE/lSRs
	 KYoLXlnum8t0F9gKuJp2eNGH5iEk28mkdMJq2ar1/yXs4VDHRr12tucVYoa+7O6MNbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774010;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1cqOkOwTUiNbtXA/P+l3ub34LY3g8DzoU9NlOJ8Fz40=;
	b=DVCqkccA/cwlEsFF+YPZMWIMT93a5c1jDVaiGxl+dc+/A5jLwDMJjIyCXzgo5NrYf0oJ
	 Ts7WBoa/ytUzshIVN2dduNfspvZGsIEyjlTDmtuGkx2clAci83keRi4EWDsEz25fVsygA
	 JRBAtLAhMY1Bs8td0HkvgIBUnoxpHTaZ+sLr0FOzlgLQUCDnk8I2hPzJkF6R70lDjGmn3
	 GpApO8BV1XG+CSUAraRqvCNqzcTh9Qvp6+Yj/9B/hB6UHGuaURMLKliuBnmcNLgULv8FO
	 CMBQgzB7DLGgAFFRIhMvuTJbAkaw//lvJA6PpquDuAgXgW6iEVKxqXBggSIGjl3gjww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OciRNu5r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtdkWMUZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ABE606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49ABE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OciRNu5r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtdkWMUZ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GO0A1779896
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1cqOkOwTUiNbtXA/P+l3ub34LY3g8DzoU9NlOJ8Fz40=; b=OciRNu5r3b+4XTi9
	ROtp0BI/VNQVDPsRbs6EjwVfY+jodjX0822oS+lLznsciTOok1dBwgRMkTthHyHU
	0FuFuetkwKEjaelwBUMMOAq6ol8ush/N+k4KhmyGVXmlk43BmwKNUZKqdrw/fZUb
	ejWUz1WPGGEMunCziZLJt8NAUU7Wq43XUfuGLSjn5OxDNqNIkMiiqo0KcbyAx3xC
	ydqJP5sNTlPjMiJsD27ZLiXDpojT/nAGOTJ3CSRGKMabHbPcei90BfeexzAf5iFL
	9ZYNW7f6UDeS4IglKNGloxpTJDox0RCereWcaZfmsYmvPahtf+gVLoHoKsDc334F
	SmMefw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhh32m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:06:49 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c9e0f047a6so290127e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795774007; x=1796378807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1cqOkOwTUiNbtXA/P+l3ub34LY3g8DzoU9NlOJ8Fz40=;
        b=NtdkWMUZ4RiIuv1HOpMtXYIVcM+2XZ02zht2uJCJP1yUCC9hBF+xxK5hbmOesBn+ce
         7RZ9ea+byy1Og8RBquXsjO1H6pKWD4oRGuSkoE5G3MJP2jbO94CewV0IjTjHGApnM5T7
         Pd6rWi95rUaZjOp0k1WbqThGBgseqKj/gRwwSZxghfmk5cfr7bDVaFhc4xXYdkzJnCFk
         sdWsWdHIWEmgC31wBNhEvUYC8noFQECMwOFtzL6+YG0mwHeGZ2iPPlXl72hnoNhAv77O
         yUBuKE+7saPrNsy6UbJCY218uKiqedD81MFyBe3uLqG+bMn1xrKuwJqaQZEGvwIAD5Gv
         GZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774007; x=1796378807;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1cqOkOwTUiNbtXA/P+l3ub34LY3g8DzoU9NlOJ8Fz40=;
        b=a+DBzL75UT1nUCWuW9YVt4/cxaw9WI03X/+HSCSWLUSkZ2p6rJzeae0W9iz6VTLDut
         f322w+MQAQsYKB+OHJ18WvHcs9prH7LbOxkMi8PwMn+fVvccQz5FvlGaaygDUOat7o5Y
         oBZqb0psqjCnK61e+h09sFXOLPc2HUgdKsH12u2IQiOm6nYC0EYnil+WJ/wcUZ6XDI2s
         FUpOrM+7q83ogq0CAn/XV05OclnSWVNIfTaou8o5gfWqSwH5tfvbIRdxKnIM/8lE8DfM
         kVHMU5cn6AC6J+sUOp3bT8FZtNU+RaymHYuSmPSD/kBMuc1I03akG9ftb1u0C0VeeKkJ
         lZ/A==
X-Gm-Message-State: APuU4Z+xmGi4vOMX4wr3r7xJIY9+z96TYO+J8RV15jmmedSk++SA2Tzn
	yrGf5YXTHyewMgxv8s1MNu0qLH8v0KiCihh6AxS+wZiQT/6Qyx7Fr9xkPUqvM9JfwCBA/jkrhVA
	+ORV6zjhgGbhQJbo0olus8E5v0CEfd4Y++hhqmpMicNbCt81Obmm73IqyhxFlGiBWVjxb
X-Gm-Gg: AZFdTZdvKCO3ylZY4LqcZqkNC3kGtOuODpbIC26ROC/Kjg9fpvHwAfnciRP3rmgY6Z+
	rTSbv85GJH6igLe/IWwx9yyTSAlWXnmMXJV0jN04gTi0Lcq2HQj+bIMcZ/TFRfHV9Hp+9oouJWg
	68y0oMsspEqlAbMHfWzqRTmknASucMMNJzqUg0Ylf7qly4bIRv/yEqMtX+g9Zn/bf3Nspgf5gGq
	CxuzLnp0hxVDnvOZvt6j/Z4DdWebo7oWldzDhVsBH7J6+Xj51N3xBy0TrY+j1XDvfWx1e3eFcWS
	2QlBYQPply7mttwYh6/+hA2/ocY64Z+Wg6Gstfq7wSG/Oo3sL+L6YH5CAH0fRkSM5WL0sLaxj+4
	eRwKe8TrZNJqMIS+ho+SlWdVjLhTyyMaOBeVQK6OD9kLdnjhp+bRE2GyClAgOJcIX2lwigjg=
X-Received: by 2002:a05:6122:8882:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee8af92398mr15166720e0c.5.1795774007221;
        Fri, 27 Nov 2026 02:06:47 -0800 (PST)
X-Received: by 2002:a05:6122:8882:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee8af92398mr15166706e0c.5.1795774006772;
        Fri, 27 Nov 2026 02:06:46 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe25asm850414766b.11.2026.11.27.02.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:06:46 -0800 (PST)
Message-ID: <cb4d9a71-ac2a-4b36-8a73-eb7dc500796a@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:06:44 +0100
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
Subject: Re: [PATCH 2/2] misc: fastrpc: expose unsigned PD node for
 compute-capable ADSP
To: Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_bkumar@quicinc.com, quic_chennak@quicinc.com,
        dmitry.baryshkov@oss.qualcomm.com
References: <20261127-master-v1-0-f998ec22497b@oss.qualcomm.com>
 <20261127-master-v1-2-f998ec22497b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127-master-v1-2-f998ec22497b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0MCBTYWx0ZWRfXwUboqW1hG0uE
 wmBeiCa2F+CyWMw/wFy6gLK7wT3XWmp0cSaCJfXXXvE3zrPVWkR2YJTX7NR2EqczaEQ16s7qC1/
 LytSMX04M4R7DyE1vLc0FPLpHzyR6bo=
X-Proofpoint-ORIG-GUID: -GuXy5U6V_HOoFw7FxlVqQTPJ2Imxc__
X-Proofpoint-GUID: -GuXy5U6V_HOoFw7FxlVqQTPJ2Imxc__
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b095639 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Rq7bUKYEei89WYC7L_QA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0MCBTYWx0ZWRfX7jcBs42Q6sAQ
 2FqwP3UExfysSXa+50ToDyRu1hfYTe4W03h3AMVsGcbX7wZssOTY/RQ1FdX2xPIIiuhX6pOQzff
 ecQt5sWbsx4vqeFPS/fJLiolSM0n4ZCp+XyuSUXUF1gbrdFfp6jUamp1oujsltMXjs0GBP7FKNs
 U2qq/WZTzkPXBmx2Gu55XDefAn6UhVm6mepTGn/+FLy0z5OqpzpXw76HGqNuKY49wOhkyzZVJ4N
 DQW9BY0Ls6sO9sHg/gamJpI0PFP7858Fkj8kQcA4FQgk1hudY1bSDnKkftQarhMm+7RfnV5u6uv
 MOw5OyLuajcJH9KgysAFxpYwWMfxa+fKgeCm9YyOm79SmPE5hh3qW5A7IL1tKZiTKTn6yQC+tCD
 hQEwdYMJIVCVf8Zoy4Gh9q8XHOXvlL38+UNdp/8LeR04lu7TzEvmW4A1DfAax1PI8hE4Y5Z105c
 7LIrlIBh0o5ILLf2tJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270040

On 11/27/26 10:56 AM, Anandu Krishnan E wrote:
> ADSP running a compute-capable firmware image needs an additional
> unsigned PD device node, same as CDSP/GDSP, instead of only the
> signed node it gets today. The probe-time capability query now
> caches the DSP's attributes before device nodes are registered, so
> fastrpc_register_devices() can check DSP_IMAGE_CONFIG_ATTR_IDX and
> fall through to the CDSP/GDSP unsigned+signed registration path when
> the queried ADSP reports FASTRPC_DSP_COMPUTE_LITE.
> 
> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
> ---

[...]

> @@ -2621,8 +2629,17 @@ static int fastrpc_register_devices(struct fastrpc_channel_ctx *cctx,
>  				    struct rpmsg_device *rpdev)
>  {
>  	struct device *rdev = &rpdev->dev;
> +	bool compute_capable = false;
>  	int err, i;
>  
> +	/*
> +	 * ADSP running a compute-capable firmware image also needs an
> +	 * unsigned PD node, same as CDSP/GDSP.
> +	 */
> +	if (cctx->domain_id == ADSP_DOMAIN_ID && cctx->valid_attributes &&
> +	    cctx->dsp_attributes[DSP_IMAGE_CONFIG_ATTR_IDX] == FASTRPC_DSP_COMPUTE_LITE)
> +		compute_capable = true;
> +
>  	/*
>  	 * Duplicate the ADSP sessions before any device node is registered
>  	 * below: misc_register() lets userspace open() and allocate a
> @@ -2647,6 +2664,9 @@ static int fastrpc_register_devices(struct fastrpc_channel_ctx *cctx,
>  
>  	switch (cctx->domain_id) {
>  	case ADSP_DOMAIN_ID:

With capability discovery in place, can we drop the domain_id
handling from the driver altogether?

Konrad

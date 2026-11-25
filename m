Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626590;
	b=EH94CUBl4bMc8r+l2ULDncxAISXdJLmuqiOOP0aS9+BfNlW8lXY6ZPB/C8QvsRiuGdt2
	 mg6cN6gKuZOP2ID+7UPJ8+g5eS6wCVSgVNoTHJido7sd4PIQjv+AqetSReAVqBqx+p2P+
	 lP0KAO4VNfGCV8odIRJJS8+1TXKo53tvbbNba9v4ZQGS/GNQWnmHBqrI0zqh+/38AJ4qo
	 AtdHZ3GPHIo3ck7l/KboCpACtsBH4a2ZU/f2McCXBqhAwZhugDFlO7xMjZL2dBRPlapJb
	 Ett7DydROfv5Dq1j0/Q/JaZYFQcr8CRxQ5sI+1bv4Y4GtdjJS91/D3i880SCCxfXarg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626590;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ffacn7nRNS6dp+vdW4d5BImSYl5nd9SJIwmzdMpCXn0=;
	b=cw1As80kJsmoT1Mg+lJG9fdE9KK4/qBpld7KAgOfLkS2KTrXL7gSF7vyRjZ3MgNBF9MS
	 lL6qGIp/gmUqvBvRmh67z21ebcMc61odpC5VTOTCkrHZCguOVBfWwnxYUBy/nR47Of6IO
	 A2lFXIIG3rjd9XwigF7IXb5Bny1yNbjwitwidw2cwIGc7F2OwDWC25oJWTkpeiIQ8ZTl0
	 DfmsQaK4H8OSQ8fg6pXN7cha3AEpM6eZQJrfldcrm+Q+UhTSxRlXUUs7vvBMml/BkMTnG
	 Dz737QQ4aeBMC3H+YPe+MLvXbbGovT+9mNLVrRPubICemcT2bs/2lgTy5BS4traeq3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dEq1AXIv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8W78Mqa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5291606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 17:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5291606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dEq1AXIv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8W78Mqa
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQarK454409
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 17:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ffacn7nRNS6dp+vdW4d5BImSYl5nd9SJIwmzdMpCXn0=; b=dEq1AXIvkaQYtT2F
	PQYrsoXWszTV7fsnNozEcnSX/a/6jZfyskL4ChCPeN6L1rvRUE5B2/H1Ek2+UM3H
	ykoNpBhh0iO4smAzQ7SOe73/EHdCN8LsbbCRfDeE2WROnLaoibVR7a3d6Nd5XOMb
	C91RusYZniwsKcvB/n422rECp08LMhIC48UiOKrNwshtdReIJWTnOVi5hYXXfVOO
	XR4rzSECQQvLozkP5ltDg5cIADh746d9AShqIdmHSqx6KRIFkSopUA4sSTayZPv4
	9HJ886IJ7aAodA8adUjOQCXoR6QHtP/g/TOTasXwBNkmDRtSh0ZEpFC2/1LjEVmN
	iAgb/g==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2sx64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 17:09:47 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b4d09fefd7so55793637b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795626587; x=1796231387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ffacn7nRNS6dp+vdW4d5BImSYl5nd9SJIwmzdMpCXn0=;
        b=g8W78Mqa8iHavISiyrUXt5jKRrWyEGScHZP8L64BXjl3zptiPOCYiV0OqBfniSP0Sl
         EBFil6yycGg1XUHSU3ianHCdiESSCR+tFmoOp3xy9/GCnVDU7mm6VQnAfjZng6CzG1Jv
         V5eJfizLi7Rv12fuGsEPtCfW88VnRmeQY9GcE16NKrGWltQwutPf07mZZds/M8ofnz7Z
         t5htaGtYemmj0o2dx/xa2ZcZOJAmlJt4K9jsCRY6IaMPEBrI9kwR1Uwe9dr2aeEaGAri
         aPnSTlfw6u5mDZZa+SkpTSMDL6kq32XwV8i1G0F261NV+DOWr/b2xCerJ/RMLmGSRElz
         16eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626587; x=1796231387;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ffacn7nRNS6dp+vdW4d5BImSYl5nd9SJIwmzdMpCXn0=;
        b=Ie6n/VLypU0nllspj2kdrh1/WxVFYEiQNp97Qld/I6JyPXxeJFVmDfi0Sx2Lt+fz6r
         NDylHiF3dmmGMsbhmFaTMteaLX7JGL2WBiA/d0w2oNjW/Ty8KYNShk1iLIkhHQ/99aXt
         SP6sPLxzzZNXvCO4mlNbwFkiibj5QNpn1exF9LNs4dG6i3pfqYERqRxe0XmtdjGxZTUU
         Eyeb7No0WZryY4SCJcYWfjnwzTP+3KXtW+5G+eW+T1omgD2TaMAO/68EztZg9EmdRRN8
         jxQFdNvT63ilsD2fgtoC3HER/h8plu/9YBrsetQy9bqpVYJNw6JhkvShaE7WpekJQRmQ
         BjSg==
X-Forwarded-Encrypted: i=1; AL+hErHvu7PdytoJGSzrwqJ97oiFUpw0TNTw29lCJe9XxaKvfksB5j70UidzgZMiF1ZuJDylx7ljBfjxHRvyV1Ai@vger.kernel.org
X-Gm-Message-State: APuU4Z+j5Wx3ElJ8hG2n6tQqNMzWvWtSVYR4YuMaau1HODNz8Ga60Ixn
	MLwdvUb2DO/pdcwHbakkVkvsRYWAGet2qGcH6Rg8uQe1BE0GMzVShikRnevHMCstTHldt1BDXkE
	8xhu3p+QIqwSpHGJGa/a+/FA8PpWMYBeYvycdP9nnhF50rmWWe6TX0kw91y0pqt+rQgLj
X-Gm-Gg: AZFdTZebzpsEzuM5AaBh+aSHDEtcqF1UL5uEdlOwb8tGWOrDTPWflYTV90NOCtH5Kl1
	2OoqFCgg7vHAIOQ5wgyxdlsFYwZlf8UbJwDZPAC1JWC0OoKkd/0+GHwjsHNEhMlXtMSg8Un+Y0n
	bdlgHGoSYUZYy1L5aD/9qgwuFhwprOzSjr1Vp5aVeVnByO25PsJ8UsTD8Q1K3r3EL5gQvBpxZY3
	WugbIbLEm1P1wThW6POO9iRiIwdzzLHryZ71himYmGjuhfy0a9+2Vp7UYw+OWPKYKHPryy1ub1r
	U4hGD4FjF9ZhnCQvfFUrmsuLBhhTm1R3N/1jpl+QhA1nLGovmKD04D1qeAs/o7ODIT2E259rxs/
	u/vjeOBtjZXphgmOsQYwtaTbT0kQeZjz1zRWw4kEJ1UsF1Rg79VSigsQ2xREEoK+eFYXjgaV8uX
	hrPRSsCG9nakVP
X-Received: by 2002:a05:690c:7342:b0:8b1:46a1:2893 with SMTP id 00721157ae682-8b520319b8bmr69712217b3.6.1795626587384;
        Wed, 25 Nov 2026 09:09:47 -0800 (PST)
X-Received: by 2002:a05:690c:7342:b0:8b1:46a1:2893 with SMTP id 00721157ae682-8b520319b8bmr69712047b3.6.1795626586828;
        Wed, 25 Nov 2026 09:09:46 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm19399409f8f.19.2026.11.25.09.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 09:09:46 -0800 (PST)
Message-ID: <f255486c-d4bf-4076-8fb8-7c6caccfdfd0@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 19:09:44 +0200
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
Subject: Re: [PATCH v2 03/12] media: qcom: camss: Add streams enable field to
 camss resources
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261125080001.2540101-4-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261125080001.2540101-4-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfXwQqEVZyX6nxF
 mIk68cHinOdb8M2o8BkPj3NmfOtFrtt+vUFbjPSY5UYMKnk447hFcdWSogulwNRAKWrGRwXhHaV
 OywzdgUxCvmUNe1aWrwLlGVYJRnr17U=
X-Proofpoint-GUID: oqVjfPSMZF0zcsX1fOETS64PZArLP1lo
X-Proofpoint-ORIG-GUID: oqVjfPSMZF0zcsX1fOETS64PZArLP1lo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfX5XRQb+W8hKUq
 fIIbg1LFYHA2T+/XNwPF7qmeBwt9EEYDc+NO+qo9cr2A1MURyU8OecG3oCKpwEbqehnlIhUoxGP
 EPtacjmNexoWyGgTFX4GCFvN+F0r8z8I37/YupRXWoGzI9nUvkq0kBDpMz9/NKgBi1156g9NTYS
 urGgQ3Pb2iyx3kHOFuAtFJJdC5rqkt5DULEwAei0nBxSMyCTZB01izzzrtPaiaOgH2H/lKg/ne/
 NsbPUPgaxU5bLCKLpRIdTEzuyZHwPKTFhpUxS7WEmbkNK7jrOCIwtkcbP7tptgjL8uN9lX/GYmX
 ppAMXbg4mfILM2uqNSgSeWmKFIqGJjOuXbgUf+VTKJyPCuotVU9PicwdJbsi1bAsNKxuCt16PpV
 EhQiC1JPbwZ/BhfN6aQcb7q+BDEKojXOwgBj7ivaCu0kJUuQLM94QZUGguYEXXz/Gj9jvzSvw0x
 cGBXdJwfdxRnrdAr8Mg==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b07165b cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=gmv_cWQL6D0Jf28gQFwA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250068



On 11/25/2026 9:59 AM, "Gjorgji Rosikopulos gjorgji.rosikopulos"@oss.qualcomm.com wrote:
> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> 
> Add a per-SoC streams_enable field to struct camss_resources, used by
> subsequent subdevices to select between the legacy s_stream()-based
> pipeline and the V4L2 subdev streams API.
> 
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 7564a7c46fa2..621ea2e3eba1 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -121,6 +121,7 @@ struct camss_resources {
>  	const unsigned int tpg_num;
>  	const unsigned int csid_num;
>  	const unsigned int vfe_num;
> +	const bool streams_enable;

If all agree i plan to drop streams_enable and use stream api as default, v4l2_core handles
compatibility with non-stream api so i think we should be fine. Just that we need to verify
on all the supported hw's.
Keeping old non-streams and streams in parallel in sub-devices implementations really adds
complexity and duplication of the code which is general.

~Gjorgji


>  };
>  
>  struct camss {


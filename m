Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703955;
	b=rDZfWzjNcKnIc1NvWIFp94lF0n/OxO0kZyYBQMY2PYchMQrdjeNW/wETjptqbR3ssz+7
	 ysxyQoho6N4wSzmi2WwjOU5KRjY05apjIa4n2LikWU2ehXn3LcDXOEt38ndRPyLE+d+XV
	 2PVjXlomu++cu9DrUtzkniGN3uHVzU32MSFrFBzOy9Buk3fWx7Mx8oQ14Pbuj8OlCXd/d
	 pAQd+KawIEJh4I32WG7Iw1ohdOz70HzVgb68gpPj3TM+9BOa36GOtMZcV1lj08OP70wvq
	 Z9Kfe2u1bKDEHEetL3NkZ4SYw4pMRy99eWiQ1QtE/r4DITS4DweikvuFzVxPItykLlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZzrZeIY1Yk9VPoQxHfM9k+OVqxTejpyNqmmY2PNtRG4=;
	b=YUKp41eomE/FmqmCVydrqWzovZQQHKTc7VQZfdRxc333J31I0gf8QmwLJ8lrXTXm0Vxf
	 h1A2756FjW+ONvxE+pNpCOdAzt6/8vthxrVQaKkVJozT1MnLBHkLIbrJVQWzaBbc4SSKG
	 sSXrUu3+WI1M8LUz8f+o0hOm+XacF/pV7QeQ5QpdYsdlh0m1cjZAYxY3sanTy1vjUN+i3
	 +MA3CytmUrZGf6eS4GEgyXK4ZTfpKlH8BNRJT8ZPbrJDBShdGnt43fy296Lbt81KALj2A
	 +ZZmCKFKuLZkSFzT1hxN8ROAjWwJ2gkLhFmmlLG+RM1w/ZNK1/+b4wkk7BX53dWWdAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P85f2N60;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ToDfsLjO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BBC606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2BBC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P85f2N60;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ToDfsLjO
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEUvv53563182
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZzrZeIY1Yk9VPoQxHfM9k+OVqxTejpyNqmmY2PNtRG4=; b=P85f2N60RB5zMg2P
	+AvFLCJbRJr985Fzkg7pQrrcgKSY2y9lBXdRiINvdJr4XDmzs8Ph6S67qW70LG3L
	Ef0IiLPMcb4uSdo8BAXLnV185gKTUGGXAenNHRiJ8VNjS3mXxR9ZRr2R4LxNSuLz
	GaM7u/R8s6wS3MCkh9MRlTmmnbyzGy/dxIGmlseE0P49MVdoDSUJFopIy0v0kllk
	KMf5kBxPHM7kpKEBpJnjUWnkmFnbSeBW86uOnXQLzu3gudybIN2YBd5lWQ4Z1Nud
	kEdntEMbhGx0dxerCrEY4qdJrWvEPDLnfwyGNihMNTQT25DL27tWjeb4dO9r1hnv
	k7k99A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sbhth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:39:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-54e4ecd1b4cso16013851cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703953; x=1796308753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzrZeIY1Yk9VPoQxHfM9k+OVqxTejpyNqmmY2PNtRG4=;
        b=ToDfsLjOYbg3QvAXT/99P3Olxf2QaWOUInnsKMAdeoWh2tQwu+qpTSZ2OZsAynKrYE
         3EkWPKM1dndAwdj3Ke4tc+h1n4s7TihedRkGKrRtjqUO1NMRo+G+KcrsyDys38pwqUg6
         HzXMDvi61uTP0ifP7GPQ9WQCWOjD0T0uTwioAiVnuPWTcF1vRuEIG93QHrTsUIbe0Ocg
         6e6R/kkxogBlA6Kyj69tL4oTXONM9hFMDylzYiR4MsJy7v8oFKdUSq3Al+qs8jpw92WC
         heoW3xUv9IXvsce7UMQoQ4wSDW1Y/yEv3Z4xn7qhP36T8iL1HVdIh3M6v2E1LAYJsj3e
         Pg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703953; x=1796308753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzrZeIY1Yk9VPoQxHfM9k+OVqxTejpyNqmmY2PNtRG4=;
        b=emZbPs7EZ0S3f9DuoGF5VkEFx680xxIGHe8OANmC1o8LzGWPQcvtcIOSjFQ4Dvstq8
         nwn86JpiVg6RCjULPyMBrJ314BJmOprc7UZOHFm+app87D6jLkKVs5d2epTXPJ14z+LZ
         nUISGQB1Ye3OrT7XNcNMJyvfF7Immj+D5PazKPh2BZldD2FbQ2sJPSRKpRoUCkMKLclX
         L0CXaPY1YwhF1AyNZ3yW9ZwmW4nj3Vzq406UF8x3PY18m53aFr5x/YaK4+8UeknXcUP0
         z0MTXMEFOF36P9QmcmU1Pnuv0MSJQiewrOr+xBJ+H31t4YZ2c0frMhkKFyZNy4tYnLut
         us2g==
X-Forwarded-Encrypted: i=1; AL+hErE8tYxEsO/XTR/dzGLpfiHU+E+2CW2NmP9oLe0wR3+U0BHepz2J98esyAx1ydnucDI+RxBT18exheWNNkKm@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rn+9Po6PiKAqC0TA2gBcLEBjXJsNo9osjZ90yHnjl4hFGrYc9
	Pxur4J0O71eKz6aCFSkkhD93Hpa2ol7az8934z+xEERi25yFOieCKa8vv98TeDRq+K2R2HeLZ9x
	x9n4wEVKkcN/QO7dPI3QFvZfDoa/Yem5EcSPZ/KQmr+em/SemWo9MW2xpXHg6OdqSp1PG
X-Gm-Gg: AZFdTZfkbe8awIXB3+5SEH5Cs9+GbdQ8eg9/fqEpi3TNi+auXs11dZErB9Vpc4gjFDX
	WdZcCdVUTdO0vi5foWVOBaYGbE6RxlhE0j/Mz8zJmKix+aN1G7RAVuS5jhXZzX1o7EAql5ITAj9
	p6iagib6OoIbhLItOwr7ORtdCXNoyGDzepFhL3LrbtqlkQ9DqoQCHZqqkZWC4FfSpi+CKheWTUo
	WwL7+a+NuiDYZ8L05/vLvqHErfhmoobppaOY2Kf7xAzwl+jBJ6xz+u/5YhhSDOCIgSkfFAUspkK
	HZ4M0ObKG7N7xBnaqmiNaIU7PZYMAU6xNxXptBCBp8ct0NZ6VQAmsbaN6WdriFJBRi5D3703ykS
	aS2opOPPLy9DvcQdRQIF5JYIgnAXwmDwMHsnVx70UypiLTYaueGXIMbLqHCN+Ej51szn9tIk=
X-Received: by 2002:a05:620a:870d:10b0:949:b7fe:6e47 with SMTP id af79cd13be357-949ba81fda1mr3568930485a.1.1795703952686;
        Thu, 26 Nov 2026 06:39:12 -0800 (PST)
X-Received: by 2002:a05:620a:870d:10b0:949:b7fe:6e47 with SMTP id af79cd13be357-949ba81fda1mr3568924185a.1.1795703952127;
        Thu, 26 Nov 2026 06:39:12 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e78a7sm9342284a12.16.2026.11.26.06.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:39:10 -0800 (PST)
Message-ID: <72c567ad-d321-42ca-8b7a-f6be442daefa@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:39:07 +0100
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
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Write the sleep and wake sets again
 after hibernation
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261120-soc-qcom-rpmh-rsc-restore-hibernation-v1-1-3ffd45c9c55a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261120-soc-qcom-rpmh-rsc-restore-hibernation-v1-1-3ffd45c9c55a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b084491 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jTy422TQQVLZ0cxgXWoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: oVdbb9ocoGukEj4iiuib-fHegWAOfovI
X-Proofpoint-ORIG-GUID: oVdbb9ocoGukEj4iiuib-fHegWAOfovI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX3xdDeTUdQbUt
 l3762aLfRrll9A6JWK7NLirSLGBYo3w/rp+hHo3r7OFSVf+lkVPEAv1mJD4wFfYnrOzPsU2Oane
 S9HRaFgyTmArReq5J2igDr+2Oi8aU6oay/nf7OtW+I+KkUfr+rKIOzYomCyAB9BAvTwr+A4bVMh
 s7PPrOMvO/QpVis8ftaeX+jN/ljRRLmA+09/otnNinfGDsA/HnaemmYJNYvlrFUzWUZHDebeZ16
 MpwpQ/KXiXP+szrNJSIVvh2rJyVbwz0WPLTrRjZaTc7wdjSjqx0VYWK2t3eLQRQroMvOHxe0vtD
 BTPiNi4vUQxxgRNyD8YskQj0HYCAnBiGEz3QxDkASqpGwuCh9piY2gWRSXlh3jps2wcmt1TsmiD
 3xZRZYvNwlqYm7NrMe1wuIpjtUrDmOVNrGW86oFsT5YrSzyJceHx4Y1qxB/N7dWyLT4YWUL4704
 4H+IEj/w4IPq/wQNhgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX9eoJP08tQDL2
 BSURMn4crj+fEN+OeBgWoPqJA5uWeVZR4+JZd48oJl1JGP32vqy4BYKqWBFi9hVxYkcb70ovl5B
 aoKLJtGZ4OkAj/EG11DJZWDshgv3Mro=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260057

On 11/20/26 4:08 PM, Abel Vesa wrote:
> The sleep and wake TCSes are written by rpmh_flush() right before the
> last CPU of the RSC power domain goes down, but only when the cached
> votes changed since the last flush. A hibernation image is restored by
> another kernel, which used the TCSes for its own votes. The cache of the
> restored kernel still says the TCSes hold its votes, so it never writes
> them again and every power collapse after the restore applies the sleep
> and wake votes of the kernel that loaded the image, until one of the
> cached votes happens to change.
> 
> Mark the cache dirty when restoring from hibernation, so that the next
> power collapse writes the sleep and wake sets of the restored kernel.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 02b74c510c3f..3f89857d9d22 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -1169,12 +1169,35 @@ static const struct of_device_id rpmh_drv_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, rpmh_drv_match);
>  
> +/*
> + * A hibernation image is restored by another kernel, which filled the sleep
> + * and wake TCSes with its own votes. Our cache still says they hold ours, so
> + * rpmh_flush() would never write them again and the next power collapse would
> + * use what the other kernel left behind. Write them again before that.

Should we fully drop that cache as we go towards hibernation?
(perhaps at a point when we're sure it isn't going to fail..)

IIUC we're going to have some votes that have been cast by drivers
that need them and then some leftover ones

Konrad

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793910959;
	b=oxaJxa/BSnDPt7iMULcLhMOZhU48JoML822XgCd4tePd7939H+EbA/vxefrWqq4Zyt9Z
	 K9rvDrXYEoiG2cpHMayuSA51a2UbY2QK4AkuevZHqG/MoBWJZyhMdVozz79KyUMnypxN8
	 L3m/r3PYCio3pFb+i2YVv/+bb84hR7Fj9aTBkXnL1uxPTF6hEmp/mDsO1d4mf+VDxYAdI
	 C9MUTiLPS1pIzEA6CaAqheIkuPJMFqZKUchG/GHRaXjAf83geGCVdWzuzx+n8N4BR+ahG
	 sSnAtAh2ibt8RUoWyl1IRDoWQzHMNvi0CHfYNC2iDE5xA7UZmqq8swpTNgNffCnLU/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YqSpUJF5S0KWoneHnBAKxwcgej8MtSQ7en4pjHv6yjM=;
	b=a4ogeAljThE6pBBDCexLLBxt3eeS8zSQgq+2b0kLDcmAf3rQbE9UPgneBfvcscRkgYD1
	 HZBwYUmNPkvCB0doUgc9+FyV22qAlYZ3lutSx2+5EGgDYUjxum3k6lGRZWF1rF97WbwMm
	 Awfj+kyr5TKi+S5PVP48zTRfh2MOKhhBonThdzIj6NT6YSf1b8bFfjCYowoxocUW+8dUO
	 mjtoaFNOZIaw3sMsGmzBrduZoIYVz/yJmpVvDl4gkM6fRCPVdd+vOfQpPc54ozFqdNcEy
	 AusAQGW/35R4Y6K0q57u01k3pNPqpj7+1eTRAote9QTB5xBPROjpQCk+v6nIBBETPVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Pence/o0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZsxUHvad;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D4B606A332
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 20:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D4B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pence/o0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZsxUHvad
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeWNW924248
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 20:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YqSpUJF5S0KWoneHnBAKxwcgej8MtSQ7en4pjHv6yjM=; b=Pence/o0Cr96X+co
	fgfH3MYzYjLkMYp3ywfGF285Z5K8sEYtTt9YdLhWA4l3yxMaUc3yekzmOMd6+Kx5
	tzMyurTVfA6LL00YVnQ0WcmXB3ernbUy7xZcehnAGYON87zqufguq60jR31Nk3s2
	ZEzfM97q+k+o4geKZZwd7FMGLREKATlHHvVjeXkc6n0duUvCzaW/yc/6sJeS9LGz
	JHwFscz2BNx9fo0/FSDxxmLBjxMLhqbJPWqnlU+ySSAt1SfRGIeWOFTSTzhEVaCD
	Y+BskzXxQtjI9MQKmnxGtgX/Xj2AJ8Op1moRzziDuj9V/gUOq8vyDZcWRD35psiV
	EWtsFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhktry2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 20:35:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb98809caso436806085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 12:35:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793910952; cv=none;
        d=google.com; s=arc-20260327;
        b=jqy6IJkDxwczKuliTCBvmr+dY5qPj4rlxfahpy29ol6/YLVrGOG+baHkcWaXJeN25g
         vGkNvbRFUBeRBozULwLuVgV2uRdaBrPrYkTI/UYWhz5sugE5viajJdTb3t79kZdyvGjE
         hLu08pOuOeVAUeZaQhmW5wcAcCAR59dy1OiXjkkzyOcXISQF5tSCDBH+iMUrI+IHvgW5
         PB1BVrdntnNwS34YJXDdLCYrMfNIjTKlpyZQs+O0wh2cLdcWAfRX8EC5Kfqkrmogsjlp
         fbQ0yHC5y1dIr+H/lZchsB92XqEcPZZGrk3+GzT0uwTLTzPWbUhUooJfiHWWrg9C8Fqv
         KClw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YqSpUJF5S0KWoneHnBAKxwcgej8MtSQ7en4pjHv6yjM=;
        fh=+wpzI2Q+EZJSx/gWRgmtgtKQTYqdBaZ6moDbiis/jis=;
        b=jDfbMMrWrUtPAqHVJyHGPorSyifLPX7fjtofCotW80hWKt1EAzZ9wX7l7PR1AH2G0h
         1F25Igyx/yBrHOd0LGIIQlv9H0kHbaLMGWAHvDfvjQz/YT3eAUDiLcAHnAhNOsFQ17nA
         9eYvWfDfkD8uPG2A875bpgjQsopQmbpaxUY5GR19oXEQS786ANKip7i0wnHS7LfzB10N
         xbTdrGDr1A2Ahf9N20u7RNMH3BfR2J2PJj6Nz043fKXe/7XJdesXep0qpQ2Zx3RwAsaZ
         N7UjQzMgxPje3wzFh7AJiCEDpAQnvLwT59Lh7B9SP+ufH32DtrnZPZAmOfIMYmcIaXi4
         nbyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793910952; x=1794515752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YqSpUJF5S0KWoneHnBAKxwcgej8MtSQ7en4pjHv6yjM=;
        b=ZsxUHvadDdTjjnU/lVNQPmgNKOXgVpg1Z9qaRHFVGT4xgTiaEDWczoLMnd8oVKkO4M
         V1HdQd1d0fzalYWGJ3QmMvp6+eFVNID48pFxIF92MVMpc8zjpHgpP0PqNKmfyhCqEpqb
         QI6bl+bHAQSAeFeVaaudVEtl0SpLHvSrzyNe5BgStgpMFTfh/9Dic8bL4G5KSyBmnk8U
         hIBdZGDo0UbTx+2hRzjYODsdiawhgRBpyDvdyFGkAj1PiTG/h5+VrQjNt8h6apmcyq/u
         GKptG+C6LRxj7cfwGl4OrAmkd02peyH0tZfxO/Yx9ndu6Op8E+6D9SGrUgA41dXqfL50
         B5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910952; x=1794515752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqSpUJF5S0KWoneHnBAKxwcgej8MtSQ7en4pjHv6yjM=;
        b=nQeaflgD3TJ22TGeA8v6lD2pn2LCTLwHvfcvtlCQdTvhQtGLQyVUifhCOTUFDBG9b1
         69wydrG2wyMMnsukaZXFbyUyF5K4VN2sH2kPbURqUTrzepE+6O5F3Xcfsp5Q4KNOL6L1
         62Dkuz3EUN8kglA7ZJL4qXvHA1EZs17hpcufvgUxrNIUzSPmKxa91FPvT+lv0TxajPne
         Seu6SoQN8FL4zE3xdVlIctKf4uuJke8qymfvyKtGQoshPwtrblDTou5mu9vs/v/DckaS
         299d/PF0Ws+lJGQscseYL1ccNUjwLahEL6tVGBozrNDsAIsEBG6f2h/EFKQ1wgZHFpTR
         wDHg==
X-Forwarded-Encrypted: i=1; AKwUvBwxrzKo79LdBLYBAPXxTopumzkkvy140ibmIJhFbY7kI1gk1pSY1u/LNBCLzHv4mgoOImRInjETs656aCvs@vger.kernel.org
X-Gm-Message-State: APuU4Z+yfYrDuFQJGCSgvyYDCp4SGGC2UVPeZncizUexuCw2CIvZExfL
	nvFvYNzlQ+hhlUENj13cWnCCRO0ZUa7ugPcrYiMXYQ3SO0tkX72nvuhvtKlJ+BbEeNT5rsvBAPu
	iTROhmM0o44rz02RIGswGt4ySJ9j4HvQSfg5oDWChL5a2MJX4wPJb/iRpjxfYPmUWm5qjY7/575
	8WgLr9zHABFVDxH7LnqPP/0AgsP9CEp/MI98ig09sVoRE=
X-Gm-Gg: AYBFou2heeTrInaquVV1Vs0+CFoJIzBGr5qyGXTavvwcMr4iRZG5wo0OBLZZv56aII7
	O1ZWGPu+yX4htspMk9TWBUy8UDo8PnWqzSA0NdwFS4uvA0anDHbO3BpJFMd8rzNm3tfzojlvqP9
	tVGPCI5r2rrbgfaE5yTANuh0erHbGn0VsSbNZTLG2iexd09n2l/w5xZJjpg9k6XsscjRkj6JA3o
	cZFX/gPINkxwIcNs53Yf7zyRWsWa/1IQ6RFHD18ZFlbrl+RlVx5cvWxTnwjHs+uji9TWbwMG9I=
X-Received: by 2002:a05:620a:838f:b0:93f:3bb5:5454 with SMTP id af79cd13be357-945f34d7e57mr40709585a.14.1793910951573;
        Thu, 05 Nov 2026 12:35:51 -0800 (PST)
X-Received: by 2002:a05:620a:838f:b0:93f:3bb5:5454 with SMTP id
 af79cd13be357-945f34d7e57mr40706885a.14.1793910951121; Thu, 05 Nov 2026
 12:35:51 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <010601a0f11c4762-f4775077-f8b1-4000-bdd2-d36d7658c606-000000@ap-northeast-1.amazonses.com>
 <010601a1ad265b72-97c3eac1-cb56-49fc-a50d-c5339e11e9d9-000000@ap-northeast-1.amazonses.com>
In-Reply-To: <010601a1ad265b72-97c3eac1-cb56-49fc-a50d-c5339e11e9d9-000000@ap-northeast-1.amazonses.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 21:35:40 +0100
X-Gm-Features: AclHuK8XUhhVbuJuvKO7cztGu5gbxLTTlaYVpQOBsiS-Amrfp_ILfbRVbQK_xpg
Message-ID: <CAFEp6-2vZT+c9fz2Ob1LvPQBjChOpCdAYa0qAWCyiDg3s4d0LQ@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: stop started subdevices when
 stream-on fails
To: Jizhou Tong <fqwqf@fqwqf.xyz>, Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, hverkuil@kernel.org,
        todor.too@gmail.com, gjorgji.rosikopulos@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX5jzck51Thdu3
 +x5KztYntTRNGX5U61hqoIu7WRyE81O4ZVOVMNdni2sKVYh7iV9+iAzzZEV7nbWhae5Ea3WxTtD
 XDvwo0mbELSUSxZwO/PB5quF/4vlj6i9IE/qdgozUsWdO9kD8EA0VjKIV4LcjUAsTcGh49LZh51
 dOSMQ7645ZcritUSWttlZ+hx3d4pQt/kjYiY/ZO8ZkZ9Q3Ejeo84MfcBQXDoM0yhw0dEvwT+DDb
 5X0IQl0mGsIiZn/XSyV7Mi2vxNLwT1c8VIFg1csUROXOt6d8p+Tqb4jR8vuVT2Bt5KX5A/ZEkuu
 tAe4aBZaJLYRArgVztGaY1VmnxY1W65nvO9PRjVyDqnjvScGzDx32FkXDuHR2uzcEBXseRB4fGU
 ZKFRN/J9S8GH0zYHayk1EhbHJKjSKlfhJyMoS8AsiJsVyLFUSYhtlgtNCIh+dtC6yrmc/HitkZL
 Jcz33AUQix9jrdMn1KA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX9C1byztujswt
 1gL+7gXvjb10T4C9qdtNESOG6nTKmjMCfkpFMVyErdFuoHI+exbmkmB/JyucDHbs2vF/g0y32c4
 aZo0sslw1vTDCjCjOY7NlK/QMsc62nA=
X-Proofpoint-ORIG-GUID: hUwD5r5eWBIBcwOIYupaGp7eDk5GUxK8
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aece8a8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=zfNuECduAAAA:8
 a=8g3GZXDhwfvaI8gMI10A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=EUuLU4E-60pLtsqvbPQD:22
X-Proofpoint-GUID: hUwD5r5eWBIBcwOIYupaGp7eDk5GUxK8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050082

On Thu, Nov 5, 2026 at 8:18=E2=80=AFPM Jizhou Tong <fqwqf@fqwqf.xyz> wrote:
>
> Hi Bryan,
>
> Could you take a look at this stream-start cleanup patch when you have a
> chance? It stops the subdevices that started successfully before a later
> subdevice failed, preserving the original error and unwinding the pipelin=
e.
>
> I checked media-committers next at 6628e7d4c6b2; this cleanup is still
> missing. The original posting includes the SL7/OV02C10 failure case and
> the fault-injection harness. Please let me know if you would prefer any
> changes or a rebase.

There is a similar submission from Qianhui Xu:
https://lore.kernel.org/all/20261031041154.308030-3-xiaqinghuan@mail.ustc.e=
du.cn/

Regards,
Loic

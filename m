Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792946824;
	b=apA4zArmryzkRHkfcwJ4rhFASJS30VTSk1JBP4FBwdwdoHJDewdIB7HizO2AWQNtPolh
	 LKLtOyzivtUMztCnUUjHlcz5io7RRlv4F12CJ0laZZZMutDfkdgDbIVwqbOaqRAQQ6oa+
	 Pk1W2CEhXEx/ojSj0WRZU8PVBsCS0gS+PUrz1OSbh561ULSTbrroMEd44zxuv+8CiIF10
	 weVOKBeK5C/7LlIlYVuT5X2ZR6c8CA9AH0ElnvmVO9jZPteST+kcVXvEEVz+zMBuH1G5A
	 SbyMn7XSYjcSTc5UGtjB2ajsxJBHcw+2eYiBawdWNN1QdEGf6FTypdVZ0LH/fBD7rdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792946824;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Xp8FtUY4IDV5E4b4db6+noYAQseHMiy5uxXtnclLFYw=;
	b=jJYSSokSao399eIvxwXK3aOJPKc5nIbRQMuYxJjPlQvqnzX861yjgVrlxizapajo0mT+
	 zEbVx8iBk93j4NnCmYqu6AVEa04rQfE5cuMpp5B2s2nsneyi3UDOFNnciqPhGF+Sgtz23
	 XW0TM7WWw2LpaAcVBRcn+sz1EjKcjSYflTyPXJhS7JB0J4AjSWiI9RMoCJ1WIbLXodduI
	 xxHT4w4ejRifzNC8C9bVsG/T6/dHK3Cv0ZdejAdgOZ21NEkSSL/K5wEB35yVHLnkfKaM0
	 r8IiQ4NmlGXUqKCOLTYCxMvx7I8NJm4S1aUVte5TBU9SERps4aT8IhBIPCKbYdEepSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UGO8N2bE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q/dOC/vP";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972D3606A31D
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 16:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 972D3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UGO8N2bE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q/dOC/vP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69PFjLlT639437
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 16:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xp8FtUY4IDV5E4b4db6+noYAQseHMiy5uxXtnclLFYw=; b=UGO8N2bEPA/9WR8c
	pmMe02dkH2DV9moeXtM7rl+9ZfqhhixfOs7tUecHgQnEk5IdKQ6NTyxCwbZlX/qr
	xWN2nWbbEKp/HZhKIwGBsbQghnCCpf47jgWi4LvuhTEjyCk9fhdnBzIupfxeDZJB
	mXAxe/z0md1NQqf7eSVjc8bd4CHmQxbO83roBX4fGcVlQb+q//C+8bL4tcPtqgwE
	Oifl1cu/P7zcUJZURPT+Se390nt40wskyGlLRP71yD3e6GtI4gXfvXzfrLkfaHv/
	hTBPvN4AYXrxrGCy+IxewNXr9o+/xxyV7sD4zmIo5vm3rKvr5QZVn0lbEtuUoO0h
	44x2mg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrukeve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 16:46:57 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-18b5ee75447so10009136c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 09:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792946816; x=1793551616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xp8FtUY4IDV5E4b4db6+noYAQseHMiy5uxXtnclLFYw=;
        b=Q/dOC/vPOVDlRbtbD9f41Ahngu3aGU53HTSB2uTiD4/0WCtTSqmoe0FhXlp/bDG6Ud
         t0Oii/Nh/PGTftpKGCFdO7zIY9z2uOA0csx/qUeIctOgXOXOLl1WYDiazfD6JjWaijDz
         QP/nivL99wGJ/rx6WLRDGf+1WeLzWIAVIAE0ExbWoc4WyZKsbw/AeLYwIS4f36kxT2bq
         k1PpB6zRGffrkuT1wN9pzwr/uB20+mBnoqLNnchFvntuSDhWdeJ3ExRVX0FhIV9IJePG
         q9Gd7iL2Babp8BSbuWlmnNeOWSRxBaT8pk89/hSfqYbbyR9TBgxsJJv9QAZPVzhrLjDo
         hBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792946816; x=1793551616;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xp8FtUY4IDV5E4b4db6+noYAQseHMiy5uxXtnclLFYw=;
        b=nR2srte11IVlFNKBsBCv+5DHEGGxgifRu2yOIiPYFgag6uQlfyqGHXp5J4W2pcqPyd
         XTK0Cy33H4ipQ3/HNGf7CDaCOJCBtynhhIDSNKYeKDD50+x98Cem/J+3NUlitDdJMnBv
         e8vElH9zynW9vuZ7jpQjF+maCQHvawbN0Xrnn6rqPNnRZ7Axyve39y7P5J8zVnBiduzV
         mWShyLjKY8Itlte3sht79RqnKI8VNVP4FmiwYOH2bkoYNu9ocpRYoyBlj8AutI7nYBtX
         K4mtzNJO+IG4v0LcSZAeZJfD81gorlVIv+uNSR9MgQYW7DUQNQIwQeGNTCf02JgU+aud
         pVjA==
X-Forwarded-Encrypted: i=1; AKwUvBxwHsPVLmruEboZaw9MsEZxfTj/+KEWOnz9G6Ussiqb9tQMRPcyNnj1rspaY5yG9T5LuEGWBI0DDcfBJ1WT@vger.kernel.org
X-Gm-Message-State: AFq9FYJlUmhoDrEP38bmXpArEMHnr9hKsYQ8Sl5ssPnj3Zjbvc6C7GyF
	iktdFB9eJyP72B7L8D1BXeInNqKm6RY4GBKPY071otsH8OqnCNtyQ+ty45cEBHj1N1rQ0r8kRgG
	4ueRmjCnXcmqFm1GiN1b42tlF+UIIE/0u5Sr71JlcwvkSkI2G0WdMwIfnQE6BPR1l4avJ
X-Gm-Gg: AYBFou1YIIk5fRqj6kp+S9DRRx5HPVGHgmGoz9zFlIShGmWl/usRkzrKxXNwfihqCKu
	CIGnnmwoV8+krMTfMSw5w8mCI3nafUma8pzotaq3lmANkh8qwsDnHntZlRkmdYR52/JZBpQ6Y3p
	w+E65+T7fjpXkx6qAYke2PivocbjilQKUzr5eOEmMpQkwl30Xlm1gIk5SC1x+o1pULZoQzae6Eh
	JLyUXpxlQMVl5YRkGb/xhlYz7XJ0E7AAWtKzMaX1ilZFD+LcNceu0Jw5I2Nxj5Pg7QU+qdNria+
	hweXvUunAoppsXaORuWT4V9oHCGQhcny2v2tqYQz6EYJZL9pRJ7rEaJkAXK0mBtdJThNQ42bEsa
	pul+IogLft9OMDJOWS/1IbdVFz8Of0w==
X-Received: by 2002:a05:7022:5f14:b0:144:de98:eec1 with SMTP id a92af1059eb24-1993571a23bmr6612004c88.11.1792946816246;
        Sun, 25 Oct 2026 09:46:56 -0700 (PDT)
X-Received: by 2002:a05:7022:5f14:b0:144:de98:eec1 with SMTP id a92af1059eb24-1993571a23bmr6611976c88.11.1792946815627;
        Sun, 25 Oct 2026 09:46:55 -0700 (PDT)
Received: from [192.168.29.10] ([49.37.153.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm37712917c88.17.2026.10.25.09.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 09:46:55 -0700 (PDT)
Message-ID: <b5cc804e-0f73-4ec9-88bf-ef6dd04eea83@oss.qualcomm.com>
Date: Sun, 25 Oct 2026 22:16:49 +0530
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
Subject: Re: [PATCH 0/5] Add support for a TEE agnostic Inline Crypto Engine
 service
To: Eric Biggers <ebiggers@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261024185602.GF2553@quark>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <20261024185602.GF2553@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDA2NiBTYWx0ZWRfX8v4aZU8TcYZA
 +KuzWBFA/bAkrKFdxXqUBmVb9bR0bkQUHc5P0GSAlAkkuvKMtzQxoAKw0yXzZDrsjC6hXm6Yup3
 MLUq/0T7D8RYzMLLmYY6PGPP7lL6aKLqgaFsoJUanEXl7m3GjIBEd2a8+9z7+loCU8l9wsCLR/4
 GYXOBYvyJD/vBaMfxNDg8yZF38rXgoDzF7P4LCOQvgTGhtnYYXmg5xKKe08xm3hQBRLttlVZu+V
 iJWuakGMWFX8AJNQ08Kf1ntHJxXm+iX9PMN9rPObwcV/9MjP+dtsrd1JFZJtA6Kz7ZSiodlb+XJ
 4dRWA1P+elrdcqR6Tzw3yqT573jTH+R+CYxJj3tVH82iAMcMnaEV9NIFYkWTDW/8pVcb7gwd4ks
 l3HyT4OCaeE0HZNBMS5qCypEbd+aHOfXeyiLMbbeZGiS87xTMIl9jdmJgifJ8waVTeq0E8CsBU3
 w4pZBcBBHnYENrrHClA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDA2NiBTYWx0ZWRfXztaljGdJwiyQ
 jeSzaFyUrhD3NRPr+fTUR0aDih6PDTY4tMqlJPKdx/qgHK4rG9EtuNFA4uSor/HQMWuoI1f+Ond
 3O6uRXuQTBTDTj5+ubpP7uofuhE35+o=
X-Proofpoint-ORIG-GUID: ilZJTetVyIlamjl5ubesgBU3PW-wwtX6
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6ade3281 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=hZ1hWxSZf3UX9FuxeSnJ0A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=P-IC7800AAAA:8 a=2OcuuN4x_lZ4hByzxpEA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: ilZJTetVyIlamjl5ubesgBU3PW-wwtX6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250066

Hi Eric,

On 25-10-2026 12:26 am, Eric Biggers wrote:
> On Wed, Oct 21, 2026 at 09:13:06PM +0530, Harshal Dev wrote:
>> This patch series adds a generic ICE service which provides TEE agnostic
>> APIs
> 
> There is already an ICE driver: drivers/soc/qcom/ice.c.  If it needs to
> do different things on different platforms, then it should be updated to
> do so.

Agreed, however this series does not intend to replace the ICE driver. It is
only meant to make the driver's calls into the ARM TEE firmware OS agnostic
of whether the platform boots with QTEE or OP-TEE. The ICE driver should not
do different things on different platforms, it should do exactly the same
things, however the TEE firmware calls should not be tied to QTEE as they
have been until now. 

> Adding a separate middleware module underneath it, with the ICE
> driver as its sole user, is unnecessary complexity that will just cause
> problems.
>

By moving the TEE call re-direction to a separate middleware we are ensuring
that we only touch the 9-10 lines in the driver which depend on the TEE firmware.
Merging this functionality in the ICE driver would substantially increases
the total file size.

> In fact the middleware module is called qcom_ice.ko, which is the exact
> same name as the ICE driver.  That's broken, as it's a name collision.

I agree with this point, I will re-name it to qcom_ice_tee_svc.ko, Hopefully
that will help with the name collision.

> I think the fact they have the same name hints pretty strongly that the
> functionality should just be incorporated into the existing qcom_ice.ko.
>

I beg to differ here. The ICE driver programs the non-secure hardware
interfaces of the ICE hardware. The ICE service this series introduces
re-directs ICE driver's calls into the TEE firmware to the correct firmware
booted on the platform. I believe these two are very orthogonal functionalities.
> AFAICT, this series also breaks boot on platforms without ICE firmware
> support, due to indefinite EPROBE_DEFER.  Choosing a simpler design
> would help avoid issues like that.

As per my understanding, all versions of the Qualcomm ICE hardware depend
on the TEE firmware to program certain aspects of the hardware. In-fact
a portion of the hardware interfaces of ICE are secure-software only
programmable. So we don't have any platform where ICE works without TEE
firmware support. This is why probe always defers if this check fails:
https://elixir.bootlin.com/linux/v7.3/source/drivers/soc/qcom/ice.c#L568

Appreciate your valuable time and suggestions here Eric. Do let me know if
any further thoughts.

Regards,
Harshal
> 
> - Eric


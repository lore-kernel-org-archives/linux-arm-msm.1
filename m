Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E0349427F
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 08:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397440; cv=none; b=YDkxPXrlKkvlPTVErzPPpFRkZV7Qo0kgXj0eRygks1GTz2LQjGgmEwuUoMrCPNPK2/pTwqmiPbvUAOM1yLHWk85GeMHLBauwDOda99lYPEVF7joDO8Gt16GDBGXpVKyf1gbNFcBO1/c9C0aM9Ipqb9Uj7t5gKwYxqPDrNxBnLxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397440; c=relaxed/simple;
	bh=PXcKyMYS/hHOX3NpHkRuJUCALN8b1o+BCk5pkYZdySw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFxgwCrB62+JSvRp+0prMCWQ+mV9Sjxwio0ONRb0Wj1qlxw0dN7gCKYqp38ugdINjYx8vUTT8VgV5Ke8dk11+Vqc3QNX9H9ZBf7vdGQ9wd6lODvIXMJ8YnS4QtGwCHIO+3td2DZOuSIiR6ehHoPpnv3d/kwQSngt8X7Gkxgel1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niKjqwWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JERt7PA2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="niKjqwWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JERt7PA2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j7h02178008
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 08:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urjK926b19n0E3NI6PZ509uXsTJzmrknfvZU+xUK15o=; b=niKjqwWuCwAXffN2
	7YbIdKbJbU1OS7827Pcs2ERD5CpnK3+fUj2AvBoG6oEa/ODyNd005e7rs8qnyZeD
	X8J73Pq1zOChfUXJgUP6/+UkLO7vo/BU93LYHqzDEMdAJafVaakfVUw9tFKHC8m6
	wlbZdVs/UCDe9QoBQnkcL4syPu6tlBQJWwlV47ObRynzyqZ29Oid/X09a/GBd7sL
	uBJ9/TXFn6eUgoYFjg94IH+FLqIeyuB+J6Khaaz5jlN4qZHkcM/OCwKSDqKm6RlV
	9HwUYNB7aLwjjbOolCs42OXmyc3KRFY25kfXXmGlJzD8oeJAq4PaTT3J7RESdIaZ
	8JPXjw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5u1hqem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 08:10:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso184537985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792397438; x=1793002238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urjK926b19n0E3NI6PZ509uXsTJzmrknfvZU+xUK15o=;
        b=JERt7PA2GX4rkZEoUrWEEOdCMtFjkwsh5Znt8lYTYaD+lHFZSVxuP5CfbWtrzyJ2Qr
         9X2C8sBRn2Chc3ABuV7XFuNWySTh7q/74NbamJplzKLjOMBVJ6sS1jNDeFwIwqtXnPDY
         /ogFGESD9G80wiMMAmBI4jccSBrGGxaFRveHgu59eQ3WX7M6A2g8l9xsvagbf29Gabm1
         +AwLYEjaq3arb8pmmdZQudQEhRDN6A+48d6yPqSFeD4solS+xFLPRGVu6gRwD1JL91LN
         ENNv9C/7bgz/gomFMh8AMZ1lAmgDppPFQYFAFGhrUEv/yJuUzjMrkSiqJD0iXaP8OkR1
         ceYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397438; x=1793002238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urjK926b19n0E3NI6PZ509uXsTJzmrknfvZU+xUK15o=;
        b=UhWUlbOIZZSVZSM3odtJ0fcHwNy6rlnMPQUn6cdumlTT8EUYEeUbRHFi0ANqbMhZW8
         VEN/i1G1pp4507PYXqsDbJPRJ8pUnPxsP9P4OH1tgIGa/4nCtuuzCoLBgtfKg18NM14l
         jjLeDWjcPAA8nglfjCTUFPciDMZdqD/C7aeBALiEpACOKTvZ8WXC53csG22z2W/b15iS
         VXeDdZlJf6NyqtgQ6J/GwZ7Rmx2CIcKgolbKwrH+RNVG+nR12TvhUtHOFn2tblMJDKEt
         dpCdlAcJt5SunwPV2SeS5247EVFluME47AyrO5DT8hKwxUNUnyqbdHts0VPw+FAlMRoe
         BhBQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4UyuZeCwYu0yxP35pZbIQ8MBb9/eV5n/Z67Ujupnc72spEv6/lLKcKY1LodliBS4M3r/qfpxxD2Jvq3nS@vger.kernel.org
X-Gm-Message-State: AFq9FYLvsfUKiJ/ozg0JFSaKQAWdlZb6D8w9cakW1xXNNjkgyZ6dI9JX
	YgEro43vpvIa2keeXAMxf9/HAwbYe9ZzKOl4Lx3vPbPVEYJxM3HG76AremzAVnYKqvjgM0xzkEH
	aKBg3LoV4P2HkPcp13JZK6ljHw+S8w9eh/moApTAe9Vmaq95CzRJoYrfy6hNCh2GNNoza
X-Gm-Gg: AYBFou01KiXHsBD70kYPcLEL0cd7orV6+H7g6qwQfMDkRVYUUsX7HYdG6j1Oj1HBjjg
	WkH2cA4SSMUhQp+0tvTojiuIq8nE2d0QwaMbv2yYpqnpDIRjS1/6Apt25qIsbBJpOOG5qBrV7sz
	oX0gEHBNU6SmdfG8ZRBEKA0eQSMeubiKgejAeR0/142MnaPS1BSq7N0paJmwLvWvzYU18OBCiDv
	cbpzzYm/8pR9x+p1edn5Ua/5SI5w5PNKRAoKRWwcbbY6NKjQezNAdvqKrGhIxo08c5DFFixqC7z
	rK8ie6YXJ2UXT6OciO0ywzOhqoPaFrZOJ8FgEc7kjGf8KAJ2oN9VFoIkuuJxD8JSHk5zcTB2OJl
	e0TliNKeBb0SmVXWED0T0zhJpbw==
X-Received: by 2002:a05:620a:2a05:b0:93c:d209:4ea1 with SMTP id af79cd13be357-93f17f3e3bemr1677761585a.24.1792397437727;
        Mon, 19 Oct 2026 01:10:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2a05:b0:93c:d209:4ea1 with SMTP id af79cd13be357-93f17f3e3bemr1677758885a.24.1792397437220;
        Mon, 19 Oct 2026 01:10:37 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd5038b8sm22045504f8f.48.2026.10.19.01.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:10:36 -0700 (PDT)
Message-ID: <773e7548-4f0f-442b-a737-c288b8cb582a@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 09:10:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: qcom: Fix off-by-one error in port exhaustion
 check
To: Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-v1-1-81f1a4c9c73a@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-v1-1-81f1a4c9c73a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5JuxP3FhnNKPuIiyLBy0Qp-TSgirrOyJ
X-Authority-Analysis: v=2.4 cv=NItAaE6g c=1 sm=1 tr=0 ts=6ad5d07e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=s6-JtZVsz5dYZhUdyjIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMiBTYWx0ZWRfXxG4S6HjPuZLz
 IdgiN4ixNlyy2m3q6+3RWeuJTK5jfhiOoVRuVPrzI7kS0k8djMFFTe8k1/7rAezm9oJB+0Y5jDm
 wjGEDhj8q3Tm2CAPrqmoY5qInXNMV1c=
X-Proofpoint-GUID: 5JuxP3FhnNKPuIiyLBy0Qp-TSgirrOyJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMiBTYWx0ZWRfXyhKkiG0OAonO
 rmaSDmDX3dGstZ33h/1Pq+nqyUWw3oz7W4+eLcETa+tTp9I+cpTZBRSka+qvKUUJvOTZFeXnBsS
 g9vjQYoLrAEElvXicbm4oq4e/3/fACgdv9F/3Y8mKDcoo4vMkhBLW195a6V9bZZft3bIv011w1t
 wd6UwzszkUJibhtI0CokhZypejX7xW59B9nABgbiI29cPm8m/XfvAv5eGeqHNT4eNhDeDNRH+UL
 jwHNk0tgSjfWj3NqvwpchjrNZPAAmHpwlZUrpkpD0T9nw91b2SercNFcKjoFvWYj5x0pPFDvnQ7
 P3OH7orJbD34CK/RDaKKtRJwLTQ67S1z37HGHFgjyYv/6VH2bYL3ODR9tOzmDvMeCzjiZnCNDBY
 bTQ3LY+CDMVE1Mw7Cf9Uaiczf2jxWOTP8x0YL08qWpgvyr2sxeTBi4zfTcM3oVvUfy3r9096Ep3
 OZRCR0zgnj0gb/tGqZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190032



On 10/12/26 11:17 AM, Christopher Obbard wrote:
> Qualcomm SoundWire master ports are indexed from 1, with bit 0 of
> port_mask reserved. Valid port numbers therefore range from 1 to
> maxport.
> 
> Commit 6ccec91c3535 ("soundwire: qcom: Fix port exhaustion check in
> stream_alloc_ports") changed the port exhaustion check from
> pn > maxport to pn >= maxport which rejects the last valid port.
> 
> On RB3gen2 (QCS6490), two WSA883x speaker amplifiers are connected
> to swr2, which has 8 ports. Each amplifier uses one port for playback
> and another for voltage and current sensing. The right amplifier's
> VISENSE port is mapped to master port 8, which is rejected by the new
> check.
> 
> Since all ports in a SoundWire stream are allocated together during
> hw_params, this causes the stream to fail with:
> 
>     qcom-soundwire 3250000.soundwire: All ports busy
> 
> The codec DMA backend then returns -EBUSY, preventing speaker playback.
> Disabling VISENSE works around the issue but also disables speaker
> protection.
This comment is incorrect, we do not have speaker protection enabled on
any of the devices.
> 
> The original fix addressed an exhaustion check that could never
> trigger because find_first_zero_bit() returns maxport when all
> searched bits are set. Include the reserved bit 0 in the search so
> exhaustion returns maxport + 1 and restore the pn > maxport check.
> 
> Fixes: 6ccec91c3535 ("soundwire: qcom: Fix port exhaustion check in stream_alloc_ports")
Cc Stable and Reported-by missing

> Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
> ---
>  drivers/soundwire/qcom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 6e0c5fb10efad..b4ce96792fa94 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1348,9 +1348,9 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
>  				if (m_port)
>  					pn = m_port;
>  				else
> -					pn = find_first_zero_bit(port_mask, maxport);
> +					pn = find_first_zero_bit(port_mask, maxport + 1);
thanks for adding this case, rb3gen2 should not hit this anyway.
>  
> -				if (pn >= maxport) {
> +				if (pn > maxport) {
>  					dev_err(ctrl->dev, "All ports busy\n");
>  					return -EBUSY;
>  				}
> 

Once those are fixed,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
> base-commit: 2e9eff8847a46530ab937696f340b9d5bea2e4ef
> change-id: 20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-47c0a8af1c5e
> 
> Best regards,
> --  
> Christopher Obbard
> 


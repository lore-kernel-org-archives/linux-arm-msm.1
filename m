Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793434623;
	b=H8GduGh+hMz6l9BJ9bK9YUUpIMLBGk3Zn//28LaltbSX4yXPoSYJ2bJGWUZTbADAU/b2
	 5tikDPswVKdU1yXDXJs3FF0/lwvcni8JzolQN/JTmr6FIxGkqZZQz21qErX+O+bPyHXtF
	 9pVmjEglvr6jQr1vpg9plTsBMvI6UOZdaIqHewkHQgJVoijcwsMPQMoAs3lQ27Loklqbz
	 9zMbhCX+HdsGIOysNt6UTxPhXI3UwRM8wZ2RPZCugGCpiU0l8zEZiKBIiys8P29Da8ckY
	 nz87+z+vcwDj48wh7vNVUUeZnUTO62McwSYjcd9wT9mxdLCrBNdyuKbUlx1cz4FsG1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793434623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2vw6HyQtXuRoikTGlJUDmnSnXK5AJkthquCz9mUm8YI=;
	b=fyqIDUtks1hLkQBgVXtiqONnOBGAynV1KvltWM5KnQgqNdAbDr8hMVyaAQpuNNoVQydo
	 heixo1YmVyHCycjWoRHg4nSTuwQxR2iJaG1rFMX36FBjyfP0ribLgC2Cu+mdwbmX6vOUP
	 6xyPDxKNMwZIxdx4sR7SF9KrfJfqPJDcN+dl9/F/dQ+ZVJW+T401xDn8d+P/8XvHC7YWY
	 SRLMxKye/8iyf+GpSDgPqNfy5CozAClfgzQz8eKWpCAlgElI332Byhi6UbMImmPhKxm5Z
	 4XX44NKNVz7pq25wgQ0Z7R5yfCqJzsgJsWglCxBQRQG4QCpZdNODvhZJlHCmG2jzNBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HjzSbq9x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=giUGF3Rr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9931606A322
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 08:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9931606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HjzSbq9x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=giUGF3Rr
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4amox1169480
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 08:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2vw6HyQtXuRoikTGlJUDmnSn
	XK5AJkthquCz9mUm8YI=; b=HjzSbq9xqHwShjbDgQTAf25CWAw7T8Cga632j0tt
	Nz5y9pJlWXGq0dByUVyxZufshCtPW3xxgj+1dDUB8tj9rl4lDI91XaVJ6Eg4XhI/
	6rdeeVF+bZ9S4IEOjU/ccrYL3Q8XK/NUpJFZfEpKyOvq+gBezmx/t/PFDuw8HPH9
	1w0sEAdGQkfAForLQGhLXid81HAIhtaXXQBBFchTyILWFJa3RuIuaEXK0tkTvP/I
	nhUwHaIpM7YvK+mHuIKhBIxCYpg8xdf1GuvLhPb63Bu7wU1f+oB6VFT/0jYmu9LS
	QG03Am20rx7tbFYJHHQNjewtG0t+pRs8NQjJVr9QP/4Qng==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8du8mmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 08:17:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2789793eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 01:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793434620; x=1794039420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2vw6HyQtXuRoikTGlJUDmnSnXK5AJkthquCz9mUm8YI=;
        b=giUGF3Rr1YodUYQyaL3NnIf5JhkBG9KyLS4dWko6slUFG4aSLsC9XA2YEgstKh63b+
         AQGB3ViJiA0PmiSMv/vi64O5gZ/xQUX6u3RjpcV56PUmULW/rMvbWW9KysDoxDLBklwC
         XvxG890efefFzbgtL1iu8WcjikSWCymn5vys4v/YNuGytd8VeO0AhtB/7jHX1CMLLZRh
         j34mrr/prdQ8BbcGA31vfrWPsuaJu4p9BTQLdVrnptKDkubrYtKQAK58SEyOCQNQJjtn
         Pyh4xr815jC5tUoPqNi1wQGH+CTInjpHlazksSt5VjEREQQ5cF5Wt0F60Ber8CU7ad/7
         woTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793434620; x=1794039420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2vw6HyQtXuRoikTGlJUDmnSnXK5AJkthquCz9mUm8YI=;
        b=hpEWvxMFFy5USZ0xxLUoDXdEX+7tsGuhM620cu3gPzn/sOZSJ/YsWmdP3XqP6WYcAo
         FsBDfXhjmkuh64BkC15Rt/2JvDYPzbA19xempRFNRC2jqV/gE96pnvqwHCrEAFR+k5Lj
         D/Ru6aYE2lyHM1GeNioyQsnC0nVsFiY0qlbc1KUWS2u3EktpREGoRaFt2Ox8qG5RPKCA
         /iGRZPSxPTuEupzI3mbF3Sw7Y96DegUsNxVPcStMmoI2a1Nzf5tW88NHnnuVNmb3aaLv
         gT2v5SqriO5/MOtjiik9SSYkjbMHT53V2JZ5WPEwBqj5FRwDVcV+844Bqnk5RsXUN/G+
         mfYA==
X-Forwarded-Encrypted: i=1; AKwUvByQgquQZwV433tqkO1u82hPW7A2au+aGZx/SyooKkihrVO9Yp9dQ2Mz7Kt1c2u2UEwwOhiv3e8OufNMEyr8@vger.kernel.org
X-Gm-Message-State: AFq9FYKv6A4owUQbqvHsPUGXTNVq8fFtepgK9NCp0R4k+xrHNshHwjiL
	Kj4WO9QBJwOCSHF9p1PYqIt9I5/BWC7jgZZz+KIpdBpblp+rKzoUX4ozAraqH5K5QuARyn+ExjA
	CsJybZKlG18qtHw8IxHIkhHFKSf0X5HhiZb+zJwu0DB5K0lOjnUmMc5xXzyeT/uGArekG
X-Gm-Gg: AYBFou2gM8C8tX3sMVq+K6ruO/JomCk3N3nwQIfx5bNz7bewPjin74JTHG+7YAbKN59
	lTDT4ZyDLNFyHjSH83dbDsikJ5Xt8gpJHoLohWToyyafJB1ry6tAxpVKRX76fUzixIjqi0CVPsM
	OU/POPSg8gb5iK0r7c8zMgPDCs3lCmwe0S4yMjG72SmYYE7ExoFjPtAaV5zGtbDlpHotMdo+AiH
	kjTZNIPWUivftTxFMxa78osYKeV8n27zStKCeDvyXludu+zkVYcYCjndoRZu9ZbfU9iASA8aAlH
	M+7//Tkg/0O5wKWPpYKwFlFK4rW13ER/cFSaPMIf2FcUsMCYnfveL4V/JGkQWaQmo1f9z1JaiFu
	FBKrxplROfbDFiOZevi7OIOxtlUR29he1nOy6wgrnBXbmO5y5HbhZAeB6RBmYhaORl/Z1f6lOkO
	ml0BqeecywQ81RFjk=
X-Received: by 2002:a05:7022:5f15:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-1ac5d88c71cmr6434302c88.13.1793434619480;
        Sat, 31 Oct 2026 01:16:59 -0700 (PDT)
X-Received: by 2002:a05:7022:5f15:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-1ac5d88c71cmr6434270c88.13.1793434618901;
        Sat, 31 Oct 2026 01:16:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm13098143c88.8.2026.10.31.01.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:16:58 -0700 (PDT)
Date: Sat, 31 Oct 2026 16:16:52 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
Message-ID: <auWj9PgfrDMNYrI7@QCOM-aGQu4IUr3Y>
References: <20261029022340.591372-1-shengchao.guo@oss.qualcomm.com>
 <c28ddf94-9bfb-4ed2-977c-4b1731a03887@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c28ddf94-9bfb-4ed2-977c-4b1731a03887@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae5a3fc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=8aRUgtnILpt5z2d1PpgA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: twCY8rRSb67XnZif9b_IYL4pot5SH60r
X-Proofpoint-GUID: twCY8rRSb67XnZif9b_IYL4pot5SH60r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAzMiBTYWx0ZWRfXwvcbCzT4Mmcs
 90FaSNgZAFeZsLckbDRSs6mLLbi1Gy6GGgGuqvnn7nhJgo+Ke+gbEm5L/HEphFBB180hgfOSGIk
 wn0Gb/USL8i7msrFdK7YhS20yWOW8zT0y2ofUkOynhPgSE7RTcvhuJDBMJ7Bf3hn6kwmr75/86P
 VX5d2k4OdHyB8RQliwkZYdKbxexltkFa+QSf75PP0v/LV6tzbJIpd5++mpzSDiuDWOGHuD12mby
 XDZxMj/+MbrlUMGOL96CtNuyQ9CuR+Q1+xux2VlFyyj+IIx1OVsizT7IoGDUw/d+9RrWSb2KP8j
 9G/2xQsmO4h9agX8YHUG/K+cpwk3dHF5fJwVbtQkT2N3X7EUwXdHubHeDQUuNixQCHYiN/Jpwe9
 I1ORPdC8CTfY1s9P73p5kjiT+f7bu4czAN1BNvLaeN/Nk8Zh8bFltqt20JoTF2tzuhlDD2FboiL
 Xuyroix5cUt1WS2FtUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAzMiBTYWx0ZWRfX9HovoAoxsqpi
 p7spX58cXxaKkXOxgvVxSkC4BHa9cySB7VkUi6vA/IuWjsBzr7QmIj6X2gVKq2N9Ca2O2gdT7OK
 Sf0BDEb22RtXkp/94mkMeApqCwiCW54=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310032

On Thu, Oct 29, 2026 at 10:59:25PM +0530, Prasad Kumpatla wrote:
> > diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> > index 9aae6aadd43d..f5b147962afa 100644
> > --- a/sound/soc/qcom/sc8280xp.c
> > +++ b/sound/soc/qcom/sc8280xp.c
> > @@ -303,6 +303,22 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
> >   	channels->min = 2;
> >   	channels->max = 2;
> >   	switch (cpu_dai->id) {
> > +	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> > +	case AIF_TDM_RX_0 ... AIF_TDM_TX_12: {
> > +		struct qcom_snd_tdm_slot_cfg cpu_cfg, codec_cfg;
> > +		unsigned int mask;
> > +
> > +		if (qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg))
> 
> 
> qcom_snd_get_dai_tdm_slots() errors are silently ignored here and the channel count falls back to 2.
> Could we distinguish the no-TDM-slot case from an actual parsing/configuration error?
> This would also make invalid TDM configurations easier to debug.


Good point, Prasad! I will send v3 for that.

Shawn

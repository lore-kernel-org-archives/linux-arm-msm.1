Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4AF3B1EC0
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787638085; cv=none; b=ZNuitpeiupazgyksYvD1mfJEadUJUpTivmNBgXzbYEmYkYlyxvMCifTDlY6HGsOSiBMI7809GlFN//WCAQUI5r9GK6gGs2oR20+0WE3D7i8ncR4taGiUphRIc+FGGVhqKz7AscFvsWcYc8DUAseTbgU9BYhBN/a3hx2N285e+co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787638085; c=relaxed/simple;
	bh=RLEloRLuD+ixdMI2Y1Po84LFsDM/JIJXlVNhL8C4hrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2AYEyXMB0L8pe3qyCqWaLPg+uhpQI7BGZksasfbvw35qWrogZfxC1bnliYgs731W/HMPwfB78f3e87aaQbZKEKNgsvwaoP3PEQwE7CyHMMrPhM7phA3XOwyiD3wduFugpyiGzvm544e3reI2XWVjlbWrJVsO7TYfBLprR6+fQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwzApbAV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtfETq9o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwzApbAV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtfETq9o"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2R2kq404980
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5hD4rH1wbx/QvdxTxVE2CBG63Z9YbrYWbrM76H+HcC8=; b=bwzApbAVBYYkcvtu
	UCekxB1/01Mecax2Q7Q0GCEl89PG4fGiB6QSRLG6YzoX/ayTW5O4cy7qQJeoULkc
	uL/wZKaE4XrrSNmX4HAmZLmeoKtO+wVUN1a6tOAgvMn0cEOGK2XT1YEgHIhKiewR
	5aFGwFUGDsRB5Er0IdMLvDexg7DbelL519EA4AKQMWMDRGMSL16BRwXcWHy4D8Kj
	u8T90pHbjvyuE6upKJehDFRYGeaAAo3tNZgRJaPHQz1welghjhocfYXC1tJKxbFd
	3F8eTfMlUc1stA1y1o8juFiyi9YSTWaaKrJJhhdnDEvdKUbRtaT+mzzeZ/O7PqXx
	Hl/oWA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8y5jh5uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:08:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cb18cfa04so143573241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 23:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787638082; x=1788242882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5hD4rH1wbx/QvdxTxVE2CBG63Z9YbrYWbrM76H+HcC8=;
        b=KtfETq9oZPYy84E6V39QEkODe5C8p235VlYAgtpUSgDbl1UnGxrmKA5H/VfGM5laIJ
         iIiNWOUaLErjNIZBz1peGdX6CidBcOqounTiroGOGtQjXRDVTUOIA1xxj/6b4pMnfcWa
         g1m4rSKa4qgUjhsXwVEu7azA5KZp4NiJOUl78lfjJwy93AZhiXKFA46DPTk8+m/4TAgE
         5A2oYnFX+ywK4trge3F1fj8Qt8k8h1gRnm7q6Ti5b9EvU3UStHTRQ60A/n33kawlaUG1
         AcgKThzthUZuRN8sxcnSxUeRXzTbsJUHfgcLpS8vbUaj2hDzOJSa35t1E+1vPnE6mFTA
         G6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787638082; x=1788242882;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5hD4rH1wbx/QvdxTxVE2CBG63Z9YbrYWbrM76H+HcC8=;
        b=hlhUNV0ebh0QortGQZ+TGEYkgL7Ht0F48fZOIyNCeuPceFMZBvazjZn0G/MhiDtlXV
         LgYcT8XuJtEpUsQSFMnzVtIhaVL6vDrr0eGO+BRLP+LJmCyDGCQdEBA6xYMhLMFHugup
         00eUN4+6Lw27Cd359rW8IynUJyIASV6JmKZCU+7P65ewT2t0WXl0jI1AL6600READcAA
         jd+hmvOc8sGcA9WrrjGVpvvJxWMRu+jBN51Tpzh/8rbBNk1isgAydLGqO+4bn4Npbm+p
         hDJMtAjf2Jzd8bfAtwtC1bfguboSiHhXHcDoqXQxX9xqMt9yn3nqn/qTkYCr9Klt/K1O
         6DeA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6HtXZl493RjdBDZtWMBjmxZf8Ak4MRLIWbxqgQdC066VDQ64Z66/Dxg9/7RPG69lWBDrdMGRrR15CShFI@vger.kernel.org
X-Gm-Message-State: AFuF++lzc8vDNyC69iFe4IeBE/osOVkNyX4NHLOsp0mMkklgzYjmsgYV
	XWy6pSGOtnO3EkfkHuXD+XR4tXJdoCNEm3GG/mu1nG+ttWagWoLu0VHxCD6RrMWcSMyBcjHlXDU
	CVW/i5keUnJduOuJERSaEyPhpj0Xn52vKKjDDDaa1sF3DXhBVva6IR+EzybAA15MAotxy
X-Gm-Gg: AR+sD12efHnl9eoiEYhTua3C+BDquvxh/zp65W7iRmR0bD5m8H3iXLCPDAzW8zTO5qE
	OoE51GKoF3vvPU5gMhIxK9SS0GlvVWXMu1BVr42jxo1+44AvX1CCr2GZ0DUisaNfymPMLDMOcrY
	BWUfH9jAUBKEAq9j9JHLV0IrJjeAc88jqzXVRNAeA/5/HlD6EVJPGrQAmRnXVk5FdqLqgfT3Odv
	bx+g+waE0TLcWaz3jHKDC7SubgL3fVKBqghvcHqpIVJwL4/SGPgNDqwDgg8/uukT17MdNYOtebw
	EL7avMo6eQuay/9ZUXGsfsHPtJuIj5zBsNVU3J1ojsOd+VrRskWDBGAu+Vb3GdryM7qtr5lzNCi
	qvfCidG8mJS/kyGEBlbd+Wa80WiI8
X-Received: by 2002:a05:6102:a18c:10b0:77f:fb50:8820 with SMTP id ada2fe7eead31-77ffb5090a4mr904688137.11.1787638082293;
        Mon, 24 Aug 2026 23:08:02 -0700 (PDT)
X-Received: by 2002:a05:6102:a18c:10b0:77f:fb50:8820 with SMTP id ada2fe7eead31-77ffb5090a4mr904668137.11.1787638081946;
        Mon, 24 Aug 2026 23:08:01 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00108asm18214296a12.2.2026.08.24.23.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 23:08:01 -0700 (PDT)
Message-ID: <dd8fea71-3b12-4c37-a1da-4b75b4c48760@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 08:07:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] ASoC: qcom: Add QAIF PCM operations
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Takashi Iwai <tiwai@suse.com>
References: <20260824063627.3595610-7-harendra.gautam@oss.qualcomm.com>
 <aff28775-b27f-4440-b7e8-01bb5a8ea906@web.de>
 <CAC-tS8Cxy9b2CwBTno5fAcjeXBd4jYj7KV2NqCjOccu9i5HxmA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAC-tS8Cxy9b2CwBTno5fAcjeXBd4jYj7KV2NqCjOccu9i5HxmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O5QJeh9W c=1 sm=1 tr=0 ts=6a8d3142 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=P-IC7800AAAA:8 a=L9GsOlX-8J4CZk4H7QYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA1MCBTYWx0ZWRfX7U9eopSNBRRw
 w7EcHloxm17WS/AJzGha4VUv9LmS+70AVC47AXAX8HmwNPfJPDKIyYpxhW9bMjYnym0+oTB/hi7
 rJezj98bDNMA/ljyolAE4Qbl4t/4Vqgag+kVU60d9r6jWdwOwSQd/f7DyS3vgZfuIzSunDD5mww
 5kbCvlPJuVYtyGwCuSKBG1gm8ps1zPr02suht7gfa1tXJ9VYnrI3jVGUH6fFmXosIQMVRmveUNM
 00bkEqjbg+qn29Gnq3Tv9i/aFgv6yITRw5544t50Gw9b7ghN+9M3mNoUfwieDqg/K/iGPuL3GIj
 McS8+PbEAz0ze0YFAkrXjGCDqsSjhXVHT3dHRtr8i/7NmxbpECNlfyRpIFSEu/URwcdK2Sk7ms6
 nbt/2+vMpw2TTEHsEbFmtyKDXKakpdr8/tIEcsSAaKDP4dVb3H789OekdzEWx/EZHizjynAS/ca
 gDmn0CxYYx9YXQDXy9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA1MCBTYWx0ZWRfXwydcTzFPsY3H
 ESAcqEfW0j4jocH/Poy4jgkAh1U3GJjKwMWXHFMQ84waI5UKjc/0tVvQmbYIlEt3oHxDAmr136o
 Y55EkWFAXavpM0fY6il7DD4vMSPPb88=
X-Proofpoint-GUID: 8Dh-flwpI-dHmLvOwjGuHMfL1TnRK47P
X-Proofpoint-ORIG-GUID: 8Dh-flwpI-dHmLvOwjGuHMfL1TnRK47P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250050

On 24/08/2026 12:10, Harendra Gautam wrote:
> On Mon, Aug 24, 2026 at 2:55 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>>
>> …
>>> +++ b/sound/soc/qcom/qaif-platform.c
>>> @@ -0,0 +1,544 @@
>> …
>>> +static int qaif_platform_pcmops_close(struct snd_soc_component *component,
>>> +                                   struct snd_pcm_substream *substream)
>>> +{
>> …
>>> +     mutex_lock(&drvdata->stream_lock);
>>> +     if (v->free_stream_dma_idx)
>>> +             v->free_stream_dma_idx(drvdata, data->stream_dma_idx, dai_id);
>>> +     mutex_unlock(&drvdata->stream_lock);
>> …
>>
>> Under which circumstances would you become interested to apply a statement
>> like “guard(mutex)(&drvdata->stream_lock);”?
>> https://elixir.bootlin.com/linux/v7.2/source/include/linux/mutex.h#L253
>>
>> Regards,
>> Markus
> Thanks for the pointer. I believe guard() can be used across all
> stream_lock. I Will address it in the next version.

No, not really. Obvious code is replaced with more complicated one.

<form letter>
Feel free to ignore all comments from Markus, regardless whether the
suggestion is reasonable or not. Several maintainers ignore Markus'
feedback, because it is just a waste of time.
</form letter>

Best regards,
Krzysztof

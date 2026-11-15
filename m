Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737190;
	b=eoaO3kWsFwY4XdXntq4jH5f9lVPlYas2U6I4U1rxuB8j7zn1eODguiUtuj6hCuiVTelS
	 O14HVE1dp3R7b9bNdl6eEkp9Br7wESY0rLkQCdXD1RI+vVGffNfLaoX2mtYGkL2d7CGYi
	 e1lfu4oRcVxuHZoCexCNIMcCQgxlvod6nJA6a11MnakGgRSS51+JTaIvfStSXXqmkwHXM
	 SmFy847xdUJamb0LHJyQdkz4JDraxXBexVwLwckE9s19rvGahRU/ObNGrdtHF/E9mKfQP
	 t3TocNiw+qGhogoqfkbJ9Y1LqLS32n23DY5PrkRdoQTayvdUawJ3GQzzkA7/KuLjyYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nCs/TbK1Q7g/vF7JeKiOZLVwlnDyGK+NAQzmLpONZCg=;
	b=z+yQZ1GhcxY5gVDUXHb6uMyLzsptRrQPdJ1G8p6wnNNQJBC6hKs3KGtEqa67ISggaduz
	 j9Ecbt5m5KOqYMGd3AiOR/LZWt8ISNSJaiPIuBGbiTM0y11pu/VeGXdjcW9nYqWArveZI
	 Mql1bhiyWm9PqYL8S95WFHm7+WTjTvoUq1N/zX1JICu0xrtd3HAW6y9uF62IZaBDYTn05
	 bpJKT+S8LvHd6/B90/lqcCsbUIavpB7fikLwo2Y+g4rsa1F9tH+Rtclk2oajIe2vEha2J
	 PNh2uht7saszacqOsxkh3yKJzEKmccJpdK+WJBgxVcIGvkIWLUfvh1M0mEQm7cXy5Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJhS6VOq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H854WM9m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9744606A327
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9744606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJhS6VOq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H854WM9m
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7wqUJ3778864
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCs/TbK1Q7g/vF7JeKiOZLVwlnDyGK+NAQzmLpONZCg=; b=mJhS6VOqqT5s6RYS
	IZ/goJ+6AJo7F40qNhP0aVD4hO1jV7egquRQwB9YB4R3hpWFseybL4ohva+84uxu
	FsiUro2LAwyyHlsHQNBgcnTes0VeHiBvXQhqVj7urF0vNJx0KXJdHmmUbKOD+0VB
	8+beuCnZaxY+X0OA+rwqLCZQTQfrBjtOGTnlTUxVIao4a+nBM8y4K0Wfd0BmmfWz
	gte5MJZ8vhCO9J+4PrKtIzwiP6sjh8q6Rgr4LfBkwTV6ZYnu/9twHCMUgdhNTreK
	89zGyGLBgv3n99oc6XS3TToNTC/36RsJnwDzwZkcerHTuxiquDfB+9KujyhE8PEt
	51C6qQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8tn4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:06:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91f16230f03so45322066d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 02:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794737188; x=1795341988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nCs/TbK1Q7g/vF7JeKiOZLVwlnDyGK+NAQzmLpONZCg=;
        b=H854WM9mSmc8X/BzAxncKlKYhigjoXrQ+t+VZGBH+hPXmkWgF2rAjCVcJfaauvl568
         9ep62vCYUZ296SVXRW734CnF+R17M4zjt7dnaFY07eh2n0TTTn/eFq1Aqs+NLCj9dxdu
         5kQ7rp2T+3wvP/gP142sSbcBddPW5A1QUHP6czFTcG+5MNIjgEL2ufovvkuE+umYnx1p
         tvTrMNLA3QvDUXrpZM5b85iDvZ5FUNJqJwB43aYuQsF6bmg8H7Rv4/n2YuOMBbheBxvr
         aAV7Q/df7GzdGrpgl8ceuBaLpKSW8jBMFB3P3XSmI36YZnpgz02B0XqiVPqGg+MkFwxc
         nP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794737188; x=1795341988;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nCs/TbK1Q7g/vF7JeKiOZLVwlnDyGK+NAQzmLpONZCg=;
        b=PoASIaNJZSaOo2KcaZOxW4ZbK1iVZOdT5KTiyVPZ87uJbO2tocCVjN6p1QDtC6k0PV
         JFLnvW3zyDKSnVzjUxSw5TKi/pMnYigqkupphNbKX4z4kzo/MLD2Tak0hZaN7j/fahNi
         h8q/Hb30mm9ztQ5Gkn/mIV3jv3BTxNH6ir7B4kH2ntOsk9FRL9K1x9/wWSeOWWoo2b2G
         TcbXUqIV4v+zOaPid/3dzuevPmXlH9kQwTUGmaQrUg8oJfcqe5hMlZOvME4LhsaIUHQT
         OL6BQ7Bquy12PBkTFXxe/+bnE1Zs3wwrr9QUFyqraGGrl51AGAPjpj8yqEg4Myj0QoRZ
         M2Qw==
X-Forwarded-Encrypted: i=1; AL+hErEBoJZQZsyxfYKb+PxyE2z9Ek9hIfEffafMZTRVmHxn2FvvTDhAxIJSxvWOM7MMS3Nnvo9rDcXhtvgbyhBk@vger.kernel.org
X-Gm-Message-State: APuU4Z+hYV3mI2zHxq89iA+qr257GcTHLBioG8+0Su9Dat1d/decF3bA
	qHr58Fav+LU72/pf32nkd4qtlqJuLCYi7Sla5kDM70wC2zb+epJ+fsvuJMjSa+V+uymbDipeUJK
	1hi0ybhXVrNE1QLSQDYnNXxzOJo2ec0ICRpAF6Abj22p44sbbHwsirtAAl/aw0+WZdL0z
X-Gm-Gg: AYBFou0SdwHxL41/mFt2oZSvZxfFNUQqBJ61sOGY9b+NQTJLFXSFycf5UgAbEiD9Ejv
	Ybw8Ka6ldunzS25AC+IhjcxlMSzmiVTdnctnjSkCmwDUMJ7z71H3aRdmj3S1tYZg9u6WF9VpRRT
	oyP2ncV/gk6KI1QbZl4xtwXUTTLHXbsXxxpA7UC7Xvp3dirb7nekQ8FoCiEv9UTHsLO71jaKTKM
	dL/FGyOgVrYXzQsK3U/ziVRubecd7CH/qno/PIW4k/xTVtM2/GmurNzjnGXhu7HPREy6paArq8z
	wApTa11DV2HmJuLsRQBebWD82oYUIv7H04vG9f498QS3LG+VIUUTvusYpkZHixYx51E0MP9WbTE
	WBphafVHok8sRgkaLvaxRHmWfPbbgiTVhnqIPsigK0FlPNea7CTsF2qlhoyo2uXVu0u3QKtIRyo
	9wHjweraMrf/ZtNB5aeg==
X-Received: by 2002:a05:620a:2890:b0:93b:c537:fdb8 with SMTP id af79cd13be357-9494ba4b5ccmr1184792385a.6.1794737187991;
        Sun, 15 Nov 2026 02:06:27 -0800 (PST)
X-Received: by 2002:a05:620a:2890:b0:93b:c537:fdb8 with SMTP id af79cd13be357-9494ba4b5ccmr1184788685a.6.1794737187463;
        Sun, 15 Nov 2026 02:06:27 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c236124esm3177401a12.6.2026.11.15.02.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:06:26 -0800 (PST)
Message-ID: <9cde423b-e71a-4038-9e89-d6ecd7da5399@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:06:24 +0000
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
Subject: Re: [PATCH 1/2] ASoC: qcom: q6apm: Guard callbacks until probe data
 is ready
To: Mohit Sharma <mohit.sharma@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261022144130.2443667-1-mohit.sharma@oss.qualcomm.com>
 <20261022144130.2443667-2-mohit.sharma@oss.qualcomm.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022144130.2443667-2-mohit.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af98424 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DoK0sgpsY2lmbaFclJUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA0MCBTYWx0ZWRfX5GvJWrhXnbyp
 mjk982uxA4fGmTulk/xOTAtXarv9Bkm43amoPKpv96kAY2px5syRgUPfo7oVykGNd55mohmPOet
 axguN/m7RWbHglE/2KWBTOCzMaLjptQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA0MCBTYWx0ZWRfX6htUAgXED6HB
 zjcvtxRrPaecdNEWcFAdnmtAYFYQD3IkuqZH6eqhb1LAmShdcYntKue+ZHnhk0GMVyBizMxEts2
 epozbCznb2ZPUK6VHDpo6EbG+fpICb6XGPzzUG46eKR4QxoZCNrzOk6msDK63o/G7fri936pdMR
 pN+r3+RE4Ys3JCJSwWoeyE2Ql9a1yDGtDkk1L79eNey+z5QnWasjqvR8l9XFoUEsiJWMoFnrTpT
 Eq6PJyyqgX0N93LXa17TcDLGahK32lHfQtgzdMuFnpl7cw1XPa+8eluRan9BLj8CQi98cCY5Tmp
 QgUB3nyWn0Cffa16KinemrNkzC/xpHJyeN/LvfQL0T8OkIdtP0kzy7ibfVYFHallGgpM20RXKKw
 aTUF6qNRQ305wAYX/2VtFy79hFdguHIeeKFBCkgfa1g2R8vMuDZrgetbBaqwUPADGn8Z98BHrae
 ik14ObEIHJHt591u+Ag==
X-Proofpoint-ORIG-GUID: iw4lElR5ODFYAmzq9jjniYqwEt6tbjZb
X-Proofpoint-GUID: iw4lElR5ODFYAmzq9jjniYqwEt6tbjZb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611150040

On 10/22/26 3:41 PM, Mohit Sharma wrote:
> The GPR bus needs to make response callbacks available before invoking a
> client probe because clients can issue synchronous commands from probe.
> This creates a short interval where a callback can run before the client
> has published its private data.
> 
> Make q6apm publish its driver data only after all callback-visible state
> has been initialized. Have the q6apm and q6prm callbacks ignore packets
> received before driver data is available.
> 
> Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm.c | 6 ++++--
>  sound/soc/qcom/qdsp6/q6prm.c | 3 +++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> index 3ec3c5a18c7a..dbebb643cd5e 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -872,8 +872,6 @@ static int apm_probe(gpr_device_t *gdev)
>  	if (!apm)
>  		return -ENOMEM;
>  
> -	dev_set_drvdata(dev, apm);
> -
>  	mutex_init(&apm->lock);
>  	apm->dev = dev;
>  	apm->gdev = gdev;
> @@ -887,6 +885,7 @@ static int apm_probe(gpr_device_t *gdev)
>  
>  	idr_init(&apm->modules_idr);
>  
> +	dev_set_drvdata(dev, apm);
>  	g_apm = apm;
>  
>  	q6apm_get_apm_state(apm);
> @@ -930,6 +929,9 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
>  	const struct gpr_hdr *hdr = &data->hdr;
>  	int graph_id, is_pos_buf;
>  
> +	if (!apm)
> +		return 0;
This is going to silently drop the responses. What are these packets?

> +
>  	result = data->payload;
>  
>  	switch (hdr->opcode) {
> diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
> index 2042ff1e8ff1..5c927ebd81f4 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.c
> +++ b/sound/soc/qcom/qdsp6/q6prm.c
> @@ -194,6 +194,9 @@ static int prm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
>  	const struct gpr_ibasic_rsp_result_t *result;
>  	const struct gpr_hdr *hdr = &data->hdr;
>  
> +	if (!prm)
> +		return 0;

This is going to silently drop the responses.
> +
>  	switch (hdr->opcode) {
>  	case PRM_CMD_RSP_REQUEST_HW_RSC:
>  	case PRM_CMD_RSP_RELEASE_HW_RSC:


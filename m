Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575162;
	b=Ut6iJ1CgBHOGc6xq+BTO5/59ZX5RTMjsYmiVp8W6acW8M0MwCRVi49lWBAX03fnX9S2A
	 q5pQ+szdQE3xDAGu6sZ1VU/Uen7wxg4HdwGDXRe0rhObyN11OjFzIpdRUDkRQWnesb8FJ
	 RphrCPcJ/btcz3JYWPVyauKF6aVoYcz7PhkmQhX+xBPDsF2ddXNiI7WEDD8vKVQNasET0
	 HNG8bm2T8IG/JrcFlbjzbd6jDjsefi07Edqcw8Z3riCrbhT16/507P7PioC/ZnisGsVUX
	 LpHz8VDOikAzKAnPbUJxc1hzknkHJRcQL4KQ6X0olqQa1ffuafSYP4fgOSahkQpi3lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575162;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=;
	b=jMinrB8gL0MVO6FuKNENCBMOZOewsMHCeg/3FtplmkjF7wYAcreX9BWnw+wXCdZdJ9tI
	 Vai8PxktxzD1VLBpt2QG0SnxMn1p7DZ2dwsOpxK5ePxQoDEzDdOpMT73ZGTwwwwcZjRWD
	 cVMWFqXvspOjdWlgLv/iCCUdAe0pHX5Q8b2k1anaLkmFVsTovx3jO+t57YvPZZ8EP32i2
	 v3GStSnhoDPt7J8FSI0fZBUqqZR/8XL9wMIJ0lNq7w2lQN97QKVN2C9TubMEcg5Snj4fR
	 wj/UgcwTmCmnAWGm1s31TBPnFSL/pFVjCfKhW+/OfOgWDJnxJ02Fn7jK2Vu/5iVNK3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUtPRNxx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jY3AlhAy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52C9606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D52C9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUtPRNxx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jY3AlhAy
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jJQB2848231
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=; b=JUtPRNxxI67F6Hv3
	kk03khUGkyKsuGjWIQMaGq2/MOQBBc/V33NO6OeW38ML6V/KVU3RhV2cGXOXSYB/
	1cjnMSPhbOl1RCxQVx+O0PnvNQQNzH1oG/p72Cqnd6rrB8n5DTPknV3S9VRhHXIl
	nCFuO8YVNFXozMw5MVCjRBn1VDqLT7On1XG2BOJJ3HJ7ScphFTDZCv/FelQR/aIf
	Dh83BrZ1VhPZFrZ8iBKMu2tyY6GAuRk3XFZe3GjD4mid/xW/Vw1GlJFz4h0P+8IL
	F33bpLGLY9OScl9ZxVnQiKQrk0dY8jCijAbqMQfOpW0ZSrqOsjCQlszcVa1D6XyW
	90I1uA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9b2w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:32:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536540909e5so1616011cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575160; x=1793179960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=;
        b=jY3AlhAyweYyNw6+MCdXN79EwCBjjAPJd58GmV5vhpMeDtZRu0JL/rd0UmwV92Zmbw
         xOoY2TuZdXZdoiubQc4kNt7gIwVN+5SqW/oqKT0g2XHl6ENBZuerzKHrDlNndQOCLrsa
         JT+xpEq1nscQviX8oVrNnnsiDyQGVaNjgHlAn4lBjBKbH9rgN7eVLGTVO00ZpHgF9P2A
         6hRFpqRn983GnD++ydUa4QZZMK73XPwwHXxK0Aapm/3LGehubvvVPnyzvR+yDMdllsq2
         OxtyqqW2RWEEF1KO8ZXMkaO5+9VdEBFT1UtNsuR00zNMvhmjOJ0gV2lOW6TYLrwCqxa1
         BmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575160; x=1793179960;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=;
        b=lItyL7uugmxJQn7SzxAocFYbfeIFORyI7CrgHLE8t99GH/bzGDhgtKsiv8LXAXKv6w
         569nrFHrDsOZjy0m9wEVDcjDBr7lIIAPmdgPjVWMM4gAJrzOrjjZgSwAAyGqYcq08REg
         ulCQ3XRIB4Tbtgz0/GK7zVe7JHhCU+tZqLpPeNMuYrF2xl/ukmLis4kB4mL5H33Y4bZc
         HgivD10jRumqAUnHlnD4nfUntFxx5m3Jxhah9p0R0rY52VBNDOkSgKMqtwZSTcmixg27
         rMZOiFG4We0zD70oIwAZ5KfPAwWuPb2ezey4vvQfOud4wqUT/MCEPJE82btavS3oWkNu
         n1QA==
X-Forwarded-Encrypted: i=1; AKwUvBz22NNDmjyFdAyETo5LoJdgkWu9Rsv0NRmRNMV3RaygZwEJee1lbZZAzIRM1TPEoDKuyGZPcDOCaLMado69@vger.kernel.org
X-Gm-Message-State: AFq9FYJOFRgh1r3arVfH6WHT6oc//XcerebNaGpiUPPoPc+RIbaLx9JY
	Ze43su+3raluIclCN6l/3BKOrEpdzfVNMgyHpvcw50XsyWXDRMjRN/Kfp0PMI0i5GuyhKiNBbm1
	env1109Ne5b7fzQmuuJ3jeX50Et1LWil7A68215Z8bJsK/0jy1686VuiFgCRgfIc60LFI
X-Gm-Gg: AYBFou090aWSycc1ByaMPizDdWdrUoqwAoolygVm6CAB4f3RIZGAsddQREOXEQP7ozV
	pC4Sv/fHhR3g/TdGcVyBXMrSF4LAJwEREjxdchKJj+TckGgdoaUaC+brfybHM11BBD5MeqgVXq4
	eQEiyD9AsFXV+I+L1irT7O2dM2o//89PlXT4cyNJZFwu+XL8zueDZ5FPl4h0zO7YScWw+0s0Jjb
	ExG/DJu/PY9ny8IE3vQSQiIwBKRNIjLzYYzRxlQ0HwCqsMymHfA64kJimr/PdEkJRZmqPJGbP2L
	mrktrLtCssiheVyeRlCFCXaxhiFLN+Dj1gOrVcp/3R16zgDE3j2/Yp52VYwc5mTFMKGLXA4TCQx
	80CJsCwjtiYD2s9gBpOLUbQ==
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr29271521cf.0.1792575159825;
        Wed, 21 Oct 2026 02:32:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr29271151cf.0.1792575159341;
        Wed, 21 Oct 2026 02:32:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f7b728sm58385366b.29.2026.10.21.02.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:32:38 -0700 (PDT)
Message-ID: <124dbc57-162c-48a5-b405-73f3b560bcf0@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:32:34 +0200
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
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: sdm845-google: Add WCD9340 codec
 and microphone capture
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261016-pixel3-audio-v6-0-11c88448b3be@ixit.cz>
 <20261016-pixel3-audio-v6-2-11c88448b3be@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-pixel3-audio-v6-2-11c88448b3be@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX23IGWPvlBavY
 4mQJZ92uJ935zki+Q7xx/irNKaCup9o0D45WYnQJe/n50sSMJB4kDwFj2ixsaQspK1PhDWDPpBB
 3JjBC9+NXOQ7bYy/LKZovrXm0t++5+k=
X-Proofpoint-GUID: 8D1o6iQjON45F6-Sa7b98D-Sa7GRGp26
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX4hPEUyl0dash
 NCC0/QZe6ISrPcYcZ1ULxtYcGo3ycKtqfPxSE9+uz7uaGlML5gTqW8VDutMp9OLWBW8H/5aW2G4
 krmVfZc42RLdFApKe5ph8BlEbzKR2U2xmxuLyyJtI21Y0viZSHcIr59bw7Psg9OogCbxc47pYbi
 ajyhCEjtdcpgTkEEZ7sce66FPjIFAdbkOBE9MiAfluPwI8zehS/4QjZO50sc4RGDF6BNhpBYBq8
 8p9qy50Bx7CzL1raHo/fWRk5WWf73sTqU8Q8I9O6dnO6+CvgvDbgukePgMGVv5/U0k4mo9wlut7
 TC61edNFtqQ4NfEM3T4JuurkONHEeD+fw9xgGK8dZDe3C9S6hqjTWc9pFzr+92DjDc40LwKnTcE
 KcgT4ggsW5E5Hd28u1HwZGRtXCrwVMFEvU/nJv/ZStGtv3CsG/ykShDQAkQOXqoZ+5cZEj/cIQe
 f2VZRD3kumCh62Y3ZXw==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad886b8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=d2f5cIJWjcLx9DfYaNwA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 8D1o6iQjON45F6-Sa7b98D-Sa7GRGp26
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

On 10/16/26 11:52 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 sound card so far only drove the two CS35L36 speaker
> amplifiers. Wire in the WCD9340 codec , add a SLIMbus capture link
> for it and route the three digital microphones
> 
> Based on work done by Casey Tunturi.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

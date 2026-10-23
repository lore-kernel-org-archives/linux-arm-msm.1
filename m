Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723614;
	b=Au89N6KEw+n8DA+tzPUV65D3DbaSmdV0DP2YYyXE+vYvAklJP84rNgoF90ocSQMhHeS2
	 7APN8Fsi7xiOZNyhRNAxZCrziPFirorR7HcB2ZnSVF/D6YpaRiDNfYn25Tmaqovit53lB
	 xscOdmptuP23jvfNtCkyKo4Lr7v03D7Vb6svyYV4J8zN/E1WJNa8UIuteFKqOApfAalBB
	 0OPqyJVkmOiM0XCOZ1qvP6qld1y7JzyAYWjjfMnlvVo2Ie+Dum3Yx6FEHVCjvJOh01Zx8
	 3eE0Mz/roGvopfnJt1UELFqhMMkfRKrFWjh85ViMOE8o4o959oxupl7UAp7kc2mkE2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jZGakksiT16L7VwD3yU9IXONc38dFFpjtCK73vPsBFg=;
	b=tNo4b2GUOrFlpc/gYIJghGBUVIPA7izqb38SxkfqgCfek9A8Z4ggVtjVBMTIyrAbWvlK
	 O7Emgt5ju718wB/D8x8IsrXVKuWeMsVCy2V/7Sp7RUfv5vP8GgdrpRxMcsDHZThyRbkvz
	 BrpCY9TVimZvmSU6Byui/SuMpBDpuzv1/jutf8CVgsfHmOsp3LChUSUY2b7pyl9B0OP+1
	 AVrzJ1mlNLJdZSd43+J5I2ep1aUcSS0KbtIuqbFSsmxn62pDf9Hz3K2aEqpbPWF5cVzRP
	 f6PLaTClQgL1bnqOn6hHmr5m46eJ34KFm39+uieJ/maLq4HzAFslafPPzeDbe8v/nQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lCyHy7qZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GejysvPz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E129606A319
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E129606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lCyHy7qZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GejysvPz
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1Fqra4008303
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jZGakksiT16L7VwD3yU9IXON
	c38dFFpjtCK73vPsBFg=; b=lCyHy7qZAbrfgvxkRgKTcON+7ExWcvBcBqfN+dyc
	VtUDL25cAEUF1PPP1l1l/gzWg/myL+jGg6ZTeh8rSzLZ5lv11tqgb1KanvxSh3x4
	WuJYQjp9hrFjsU57LumEKuXeL94eIQqhelPBaFs878O9eRH+s4ggN4DuT6M2B9K1
	TlxuRwH89IVWIIZboZwqFzEumvgFGbgZ+/8niGm36VaU0Ubnd/0SAdGheFZ8uwXZ
	Z9YxJG1wsuL9vNZozXMua12Nkz1kSjUxiXo/ECmF7zd9bgRk/gtceMf5de48HwG8
	bsYH1b0IqVomT0TpgfEX4zbtPIZJOZTAzlP9/V/hQNdX7A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmas1tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:46:53 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36637676140so705271eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 19:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792723613; x=1793328413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jZGakksiT16L7VwD3yU9IXONc38dFFpjtCK73vPsBFg=;
        b=GejysvPz+umkrZWuiMJmqtrKZV6dfa3Ivos1Z94HH/zFvkgRAz44MhLeIGkis7K32D
         ZZ74oFG6WpchsSEocSf/i3hHFjAL+hnr58Baxuws7DrfUe5zNp6A2Bu8F3LOMQb9wCyN
         5fFIfiNGjSYPB9Qs3OBehABwDkxQASd7Fj6ymg+7fX2MbtPbYb6f0ogFN6JlVNLDC2pu
         91VTlOqhSFYzOqH25jDsAXJ4yrGUj5BMo8G/nMQkYhxcEuCVKWhS544JWz+pjigvkqnA
         IZs5MAjDVBtKDw2nutW4ahtS6jiA/ac9IZFTW6jwoPdgfA3X5vSf1VS1HgT2hwFylcGX
         yorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723613; x=1793328413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZGakksiT16L7VwD3yU9IXONc38dFFpjtCK73vPsBFg=;
        b=dt1LC1XRstWmvDlFx2W7oTT0vkiVnJ4XKPMK1tTD9cyrqDn07OUMg2TF6RGAN28ffd
         a9xvO7BWK3QFowGWxsF9fZHJBxlT7fkLmkCjMWzBcz+e3rwhuaOLcaLRs6IG3kMzBgPC
         rdkR7NboeFZaavOruRiY0XBwGH+xGTJrt9epmZe+cpEGlsmammRHpUO6KQ3wo+zpmERw
         EATAehXs4nSpJzZQcz6NWdoG6m98JwwXHh7ZZ/ekCx8KSDvsmJV3FBxsX2IgY0bKIOc9
         YP/mALNQm0yL+oN3/yZ+bkzfC3OuauASeTEiOLFZ77PdjCpqkVImQfFlAvGulRA58BJU
         sQgw==
X-Forwarded-Encrypted: i=1; AKwUvBzOfiR12kPfSkoRQoQL4GN9sroinGu4I1Nnap9qTy2o+Rn2XL+2F8aj0x49BBHfc4aG/ujjHGIxa0H54yr+@vger.kernel.org
X-Gm-Message-State: AFq9FYLjztbcv7Ip/XE2wNyik12cqXCHuLYl7zuNZ29raojCUK9rOlLv
	IXvodhw+NlLC3iZI9qUIKvT2ARltJnxh4EMbc7XgfTvAzBKmpldAnH0RrsG2vHX1clKftMB9o9G
	SufLV+vPR3fb4+Ubeg63efMmRhj6q9yMDCADS7IIApt1384B9hr88GdC8piNB948qVpyg1J/ZoX
	Bh
X-Gm-Gg: AYBFou15NSUkVlMMaHsaXxwF8dtUqQS7k/Z/k1V44RKmNVNTcdSWTjNuWiJJAMXMyxS
	VbaIMtXRJIPbyY5iEMR3vtpgIxUNHfoumL7xHldsAtGTKy4pMwF0EOEYXMOvNAgJtXavJVGIld5
	FxruwXe0xOsVFXX5UWy+hCHlT8PBid2o2KEfWpWfCBjQVaxNKa4NYG9bVctwZU+4v3DJLkh8V5j
	QrKVenhsoygCAwI2B3tF9ESFLiJ3Wos4ydcWDkExiDx9K93RSETfir12AFu00BCR6CSM4V2RcHb
	qyGpzhh9itcnyJiHPFLLn26NHkzAGnUa2hof6A+0pM2J8ogGUnh73y97RezsrtLe2iAxe49lmv+
	ZuMa24yaEGCleK3Nq6nr5F0W0QogcfpMd4OrNNUHyDQ==
X-Received: by 2002:a05:7301:6183:10b0:351:4d03:c6a with SMTP id 5a478bee46e88-369d96dcf19mr1233556eec.12.1792723612691;
        Thu, 22 Oct 2026 19:46:52 -0700 (PDT)
X-Received: by 2002:a05:7301:6183:10b0:351:4d03:c6a with SMTP id 5a478bee46e88-369d96dcf19mr1233533eec.12.1792723612058;
        Thu, 22 Oct 2026 19:46:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5e9edsm2112066eec.9.2026.10.22.19.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:46:51 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:46:46 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
Message-ID: <atrKlhwKcQ2n1v8U@QCOM-aGQu4IUr3Y>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
 <20261022-nord-soccp-dt-v3-2-1a69a4d54c42@oss.qualcomm.com>
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
In-Reply-To: <20261022-nord-soccp-dt-v3-2-1a69a4d54c42@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adaca9d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8VUF_Pxp6yIriAAkYdQA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX16n1PStES0rL
 idwbo6x1CuPc+DGfegQt8WK1Om0DoAGE3J02XnlhVZPcBaB6I7uWgZyzC/uS1bswYFbHuHQTck8
 CRat6+EopGGzrKrM7XkzT97At6FbC10=
X-Proofpoint-GUID: bPHimYpdc3obaS4UR4MO5S7_8d0CrNfH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfXw5KiFs54vEEf
 8GnbSov3EetjQJP1gxOBh/4J0Y42GORKYbavkVF5teg6dz8W/HCbt7yLtpMxM0drxaEX6HlqfdP
 80I5uVuI6sS9yAW0bgLzu1JN9T57uMxdnDfgVPVFw7W/1WAZsPChr8aDe8OjjbalrQ4DeEJM/zC
 KbgdPqo4DDx5ePoar1JEuDj8oUsZxWm0/knJOyfO/hi6HFG/o9M9yAiUVji0SrLRHuvT9z9Qna+
 t0aRiCRKtOIiPQ0Q4rhhT10gN2mgv/OP5e1I/6K0PCCQtek2dhFsZ9cqalArOWJrloVXA51kzYL
 hdEyrz5DzgRMo3juctAeXME6D3odKtfO54wfcejW217KLFHx3DT29dVYMRlYchMu9SJHOSe57UY
 WQaFs6cU/AbX5jYcQQeWonreL4rNUZCU3oV/UJGPLlqkYJZN0YwaLHZRroEdwxnoyatU6yJn+mU
 IRRU/ItP/zmmRHj1x6w==
X-Proofpoint-ORIG-GUID: bPHimYpdc3obaS4UR4MO5S7_8d0CrNfH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230010

On Thu, Oct 22, 2026 at 05:27:02PM +0530, Anurag Pateriya wrote:
> Add the SoCCP remoteproc node with its firmware path on the Nord
> RRD board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

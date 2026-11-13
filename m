Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580350;
	b=ysS2DAUG3EA4dgrgFVqs5QI7njO9XCj3w82WEzaEMnogS7kP+iFBH8nYG7WFe6ijWeWk
	 M1geRNCy+hpT6QY2NVPC6GyN4mg6r1pPH+ZoUZ55DtjIHO/519hdhsUZIRP2JBAVkaDwp
	 soVzieNMd0H3lrpo9YHwlLhPXvt9F57onJc2ckH2Y1sqYMBUOKHir/R5DUeZuHjOlZNPt
	 RySc2Y2HJAEN7kXWwlUTyxcTxcl89tH3h3Y1gq25FZpcSoB73h/nRF4M6ndr8VUkp5Us/
	 IvhBku0CMHFF5mw92s9DIB2w11B1FzDA249hIlCpycgYHCHhY+SNi5gSmytI/sbS4wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z+SrVEfWujQdhhBgBRMpmlO8l1VQW2jEUCd7U688UDQ=;
	b=xTszdToBp2MTDW7R+OUtOjTXHgNHN+DjpKyyTiqU0Pfr4NfxJdTE3ANWgkcVCh7imbng
	 yoTWPx9ixampsHfY1kSc8MwOjET9oX+Z4JWKSH373Ub+8e67zpw4AenEo1Rccxq7YD9yZ
	 eW8TmyOlFlkixWMvlIJp000giEyGVdeihgyWNUczFJSFQSZqgT7N3QcwJnE8HE94Su36C
	 wu5X1Q/cUMO08sQCzDoDNY+FB82jqmDxBbmILgiZuZ8myA4aTRLZrx/g4g1I26L/ngIwB
	 uh277HnPwiJUy7dZ9jfnTsL21fTCGlMnG4xKISnvK7NZ7iRk6I0whW+D205bnvi6sMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fE5qM7Ct;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=efrV3IaX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74F1606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D74F1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fE5qM7Ct;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=efrV3IaX
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJlYp036611
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+SrVEfWujQdhhBgBRMpmlO8l1VQW2jEUCd7U688UDQ=; b=fE5qM7CtcmyqiJiA
	Bi5KbSEg50e8i+vpHccpKDHkmwYgcd9wGIeHyFEhrMW7w7/vfXw58WGeDwEywsn0
	jir8dmEISSeCO81quxCj8sQ2vikprln/ngnoqhO/TVT9ysHS35EPPGxNxQAM0NMv
	MSSL97TauJOdXmlAn9Q79YQ2vO0A3YeSOf8GTpHXoLMsl6A0IUF0QdKl/Nc5cer7
	tm/JqltEzSKgXscRYp4FO1NAmBP60WbwPsCpTnPKBk32AodS/frl5eyBWV0cFzj7
	gzJVDuCBXw5dfnRTWvF0e9ZcQc2YcKQ8OP16/wdpzEsk9bgJhZKmr8r+ikR/gFx1
	c+1QAA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja9sw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:32:29 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2c5352d1eso59204137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 06:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580348; x=1795185148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+SrVEfWujQdhhBgBRMpmlO8l1VQW2jEUCd7U688UDQ=;
        b=efrV3IaXJPD+Ey7S5C+RtctG/vN45dUQ7kVgs95H5I4ws/bMp5HxkTBRs281ppawEA
         Et/NRKh4mWGkn+bIIo34Jf8piyedn8gKZux3l8G4anfO/76JOPq3oQERX5W7AdwKkc2C
         IKRYAFFlXIObuMoJ5mEXe6ZHN0hmIdaVuwEUvV+nKu1LLxKJipnAUN1GKDQ/ZitMNsuT
         OjDMf+KKX0CCdWIe9JPzCTYcdHIzyVzwr6AgxuVqpDshFty5/y4NAjmIgy3j5CJh50oO
         89EHvF9rxTSC3jlJ/b3WFzgOSjxs4XaZ6NhSviaqvwkCvze1qRAG2SDUqSenEjdQyagN
         oHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580348; x=1795185148;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+SrVEfWujQdhhBgBRMpmlO8l1VQW2jEUCd7U688UDQ=;
        b=OElgHV0C5LN8EXPHdiERN50KKUEFlup4eBGQ/1YUnyNnmISJzGUchaA5GzeU70I0JZ
         IAPuhs/ndJ8HNRFCOA7JJgZmAvvBBL0ar/sNOhtL1UEEzJqT57fgC3I7KNkl2i2PGSz7
         laoN3uQr1XE46KGQzJVPaQOWUo3R+H30BnXuNHmNcPjhIOyoRK0CVdR5WEGJZpUf2R/P
         r3m6kgxL1VTno6tq2rKFS7rOzPLRMWQRUoiIXU7m/KD4ehGcs6Ia9grYRKIG0yNSsnFR
         As02FW+jmuM0K+ZJiDcQ5Lw+W2nbKkDzI3PCkNe28ZJotpNWL7j0UK9zU5gJsHB7KGkH
         kWrA==
X-Forwarded-Encrypted: i=1; AL+hErG1oIvulWhihn9PHAsy3FC8yn3b7EPdQO/Ogq5g4Gkk8DEwFqzlgtV56CatGm0ZZBtLPmqL5Sdyb0h+eMH4@vger.kernel.org
X-Gm-Message-State: APuU4Z8f46DtiD4HtmDBIxCkFFPrWkNFBoNbypj7VOJXRqw0K7Phvf+4
	lzAX7d4cATwohND0EL+4IHblvdqK0MldZ/6Fpl5j0I+MMLGCbK/3LiPgTSNWYHoMIIA7zWHjaoq
	96UV9eFDW02nPCh3ieEQQs/slxrjYlHFR+SV1c0VxB+clpWc9+cZOwzW0vBZj2Wx5C8jt
X-Gm-Gg: AYBFou0SQ+fV2oW4xo3Ah/UzBOQIVs7m/wg5oQv6qhOjYP8lLjCL6p93N4MOMqFInk1
	Ap3pT1poVyiHuIe4l6Qpa4wFT78DR58OoIs6pAeDvLnHKqQucp9lzqZOJo6bZQjcAVzKWT0/waD
	zMjFj9dIVaQnhjtRzVcfx4j1U7I4kpFuk03o/GR706Llh6PY7mO608+qJs69EpZT5hE9FClB8Gy
	yu7KV34DWayUr+065WzbkV5tx3Xo3cJTizP504TSi8kl1kifxu9RcUG/fu1z9kEp4eEI0fMzKHu
	lGvkU+MFpPDu/N49mvH5ZXyFTJDKdgnuMNwfgJHBhG6zYZ9XEa+ztYBt2MI3MH/tk9reu6G3PGG
	A4M697hBrfEPIpSqtlOYS0wysj8lqXkUpgOMmycnJeJrbpArHLjopemIyX8m+3nZjUkpmTko=
X-Received: by 2002:ac5:ce07:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ee344f2ff4mr908944e0c.0.1794580348202;
        Fri, 13 Nov 2026 06:32:28 -0800 (PST)
X-Received: by 2002:ac5:ce07:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ee344f2ff4mr908885e0c.0.1794580347493;
        Fri, 13 Nov 2026 06:32:27 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23708sm106818866b.24.2026.11.13.06.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 06:32:26 -0800 (PST)
Message-ID: <de00bcf8-c09f-4250-831d-007bfbf17eaf@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 15:32:24 +0100
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
Subject: Re: [PATCH] i2c: qcom-geni: Prefer asynchronous probing
To: Wenwen Fu <wenwfu@qti.qualcomm.com>, andi.shyti@kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261111090955.3378623-1-wenwfu@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111090955.3378623-1-wenwfu@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UJhV_RXj8u8esLYp1cfc8h6-FP8qakyQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfXwvnpcTloq5tj
 4pAHnoWLbFvWpiA7rEw8UD1pCZAalgIcwDTGLbDsUmNbq2+32XZIdy1tZQ9bnQox+5ngT+8izMq
 nI7NfoDtd5qghAy/GuMyz+8Mcg3Sc/4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX50T9mLtJe6d0
 wDTXa/896nQm6Iz3+gXGrRDJGuq28mNhYrzemfRzbSs+0faa+iWW6NoAbXHke/7+3fgna1jcxEF
 hA7XnSVHYvOFVeiaZHGKTbERuZ23PybW13o4tdiZjmz36DJTNLoLXmnBGk+fVrb+vm5sIEaIijK
 Lvau2HTQbJiOPnDfXRcF7v2yPYNVX8btZdMkLF0ZzVkQaUFOzcXc7o5X9b5qHsxIPgbkeqdeyyP
 wi15fLbsnp7X2w4WboIcjGNc7wM1OsBJXo8EXuFknKE2JrIItvi+NelCZPwWBOoEVEHFMH7udYh
 fpTg/jThYOXbysnz5XnS7c2eLmfbV8NEGdu+jp4GmSpm+V/1YK6fukD1+yKLHMzM6m3ggo/Fbrq
 MPK80FlnfbELmPy/6V9vyHIrV0niLsjse8/cmrJNHO36ifuvC1/pTMe6941A3Kf118FDBTACJ8P
 IhSPfcK+fsmiZUG0Ahg==
X-Proofpoint-ORIG-GUID: UJhV_RXj8u8esLYp1cfc8h6-FP8qakyQ
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af71f7d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BP9H1aEygeDGrBmwyXcA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130057

On 11/11/26 10:09 AM, Wenwen Fu wrote:
> When built in, GENI I2C can request serial-engine firmware during
> probe. If initramfs unpacking is still in progress, request_firmware()
> waits for it to complete, blocking subsequent driver initialization.
> 
> Prefer asynchronous probing so that other drivers can initialize in
> parallel while the firmware request waits for initramfs unpacking.
> 
> Assisted-by: Codex:GPT-6

This tag is considered obsolete, please drop it going forward

> Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

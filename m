Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618228;
	b=THPYiULYRT52gd8uvBwChiwZmXGjnAlY4M0Jy9RnzeD4IbwWD5U+DK8gduEsEGknNq/z
	 zU5EpJgP4Exn3TLPd/GNMqVkfDZTLhj2c0jBtLlm4KI9b78sDCuDukk+gZhbGeZGd/l+E
	 FniLAG70wGkgLi2YmMpURkiJ2xfSEvqzDGCp6A7DBh1TSrSKQyO3VTHFBNHjXQqPo6Tg3
	 /wFI2I/Z0acKlQaNNfCx+pS5E6aJm3p3eoXTMRUPI0p0KpKtCkfGo4T6ZPV6aevl4HbJu
	 Tg84sA3DGkBBS8KZ1hDRDf6CCask7u73qFYRWjHdxDGDL336gE8J5zQiZIKcwAA3ZAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618228;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s4VNs5xfUCjRE/cLeMEuZSzqF8vaZwaOOAaFa6QON48=;
	b=4OsCM1R4PDtatDPjDJwu8P5kHRK4/mmcB/Un48NCjHKx5FmDBI4/RGC7NzIMkk3+2drp
	 Vyw7tHygPW5RpGpEG41uKj2vktJe/qBx1w3E/ov2M0BYoILKlKgFt6HsJjLMpp/+6C041
	 tkNxVeG65tBAdj+HQPY0WmDmq2Xf1bh+uBhQkUXVS4qecmFjhnZ9lwBx4rEtUO51kkyi2
	 OG+stOAWj+TLdfVOF/4b6nKLPajWf8FSIG5qDReiI5/VjNhaZk3yqeALPDlEGGFBHYpZ9
	 6HFs9TUCY6OFxs0aptMgzKSPwIY/ZBJQQOrzGCgZhJHD+rh+eRVNVrnoZMoXD9jlsrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="n/ma8ISD";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YPVia6Hw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A142606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A142606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n/ma8ISD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YPVia6Hw
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AOjU3086536
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4VNs5xfUCjRE/cLeMEuZSzqF8vaZwaOOAaFa6QON48=; b=n/ma8ISDmfVg8B91
	6m2xTRUJ/nM7llmxP8P2zv8rgrvHswLZp8Kg+qnC1SklYm9LPnz4GB41/O7xdgxN
	K5VG+C425rWeahRAf1fPd81x9bZDVhn+F/3w+r38WlOmnoSQSJDhONRgjnaUPbwB
	0ZUvGlc8Upz2N3AQ2JxzwqpRLKK5tly/okuREx1n1aYBi15ig2ghRuo0+u0HGOf2
	E2BTgkFcqt0UFfLIAR+q73VBWOvla+Bg8z5Fa6ak+0VlJloV8kzX8O5b/dpAYfmF
	HISGdt7us2Cf3K03Uak0vd/VZh2qqRQVALtlbBpZTBJ2D+mRcDWC29XV5fjkVmfg
	Q/EvqQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61h0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:17:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c83481504so5716906d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618226; x=1794223026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4VNs5xfUCjRE/cLeMEuZSzqF8vaZwaOOAaFa6QON48=;
        b=YPVia6HwUcUBzzQXlGvA10Nnh6UeVu3+JAuijIpsrpOlAY56kbPmcimcckasss/bqu
         XSCeUHPuVhkE7AJTnJuVkfFhR95tNmisMk1FbYxHe5Cytt0kTXJcPbQHA1TFgz5PL9aL
         j4NKDawMi4rfuQWr5hVFyfNrvYnlmeFnwnErne22Fdche7Ksxpr6rjid0Ro4JNjtXjch
         4JzC1BgfHAiQj6/u/+KPBz+AlUxWTR45YKY7fNeDQHFu1A6xpsN3oPKJibH0lpa2NpAR
         TxR7lnlZHlD6JtbLiKBDUxXi3I9L4Mzivugqfwjr9DcOAoDkvHMH8P8B/O3YToHiqrVS
         bo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618226; x=1794223026;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4VNs5xfUCjRE/cLeMEuZSzqF8vaZwaOOAaFa6QON48=;
        b=jRBVw5G6FG8LHRJ3Rkw72jkwkGVZLTK2tsOKMhIgAV2PwgdtuMHevqpDf1Mrt+8C41
         9/VY3AiYCvuYhcYGJ3VNfAu4slJM8sQfA9Rx4LZzHxubLePB7guhEAFCfIdeS0qQx9ml
         4dBwdgcaUoSxu08VDwiTs5J5QP2tivE77Pd2Fhoq/sWRR04fmOpbPzaLHfDUMBlBdD1J
         bryp0JA+zfeY3GAZ/4Rbqb3uak3FX9DwWhKLg8yzYEAzGm4xnx1yhs48z0WSVbyjmpXQ
         TvbRtltQXxngeUudmfqdMjNFoaRxsgvectv8Mq6VDxJHCGOESxfHlNKHC3ShLmqugJej
         1KCA==
X-Forwarded-Encrypted: i=1; AKwUvBxeu3/p/83lq+8ybv0LXTg5ZrI0IJnx8nwzQA0W+dXVvDr58v9LcZHNL6QYBwza36XvinGXMayPoPHrbHQ0@vger.kernel.org
X-Gm-Message-State: AFq9FYLAckk0JT1rgUofiyuM8d+XdAAy9QL6EXOaDVjz42l7d1pno5Sj
	sCDtMS8zZMjDGXPPQhT++q9Lmq3o+0gYQNbF2oLOuL/bCBYCq9+0jEZ9x0My6rA2OEro8/70S1l
	bFwe3ftrb5R29hN2x3I0LMUw5v6cZJrUJcjQNk3vYbuWW8IQFLJ7SUw8mseLOMTVixL3y
X-Gm-Gg: AYBFou0TYlG08oGILKpYgjjdS6xBs9DBGHLtqy3NxYR9MypCipmBGvPpA0KtFwY/ADJ
	VgwQ31Lb2hTLdN1DlSDMaYI5VNGyf86vdQpP+ynQGmFcHSVZgQrTaJ2ZFlQqprHyMBSbFjRp2Fq
	E5XaYDaVn+NnKgzkXeo4IPYF+jH0fvcxPQoioh5gr75dpkTlzed8shY4mwmQmm6I9TKiveLg6UD
	WKUpxLIElwVr33CWqiTMhx4ic8cTbEpWHAJU4OzytcyvXsWVRvf+/t9AnEnniCabNZjv3Figr/u
	HrMZuL4aasTnDEz8KSGc+bKlBS+es++AIp+o1lAqEUHo0UV5grCJYMwbdrwsP2ZDrWomElcVbH2
	jQ55tMLgL0Cw+2YBndFM0wTBapAmEOSp/v8hMxPwc0rl0KTvMAQIw6u1lVtA+7TwUfw8CWhc=
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr1532710885a.4.1793618226065;
        Mon, 02 Nov 2026 03:17:06 -0800 (PST)
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr1532708185a.4.1793618225658;
        Mon, 02 Nov 2026 03:17:05 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd249sm375857566b.20.2026.11.02.03.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:17:04 -0800 (PST)
Message-ID: <ec20b3c8-e7ce-45d5-adbf-4d2c917940e2@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:17:03 +0100
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
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: milos-nothing-asteroids: Enable
 IPA
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-5-66a56c537749@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-asteroids-dts-updates-v2-5-66a56c537749@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VOT2D4dbfISJHTGThCE6bwp2xHHBUQZn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX1sAdi/vgTfDf
 QRTAXIigRaQ5dgLCZPV9MQgdQuXoxTGuRXRwMYkJxxKIfMLp3gkbyAQwdiv1ydWkCKMopQT+tA0
 L2cVhdwQ/OLQCegDiTJokRMzSosa2vw=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae87132 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RBzhS24iIX_dIUMOZkEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfXxp7IqeiDX803
 ISdM3I8lMl0EBQllxCX+qynB7pmvuNIRqvf6TQW2SpJ073c3RQ1djvPdW8uXgQaLl6CwfsrYntn
 r9Wa4Xk2DWiHZ7kEDWtlIm15mXYaNRS25Fsc7cgCVJu80e4g4gRwT2aEHg+K9cjECatQyEK+WqF
 COQYYuzv1xudGrNv0+dlRjiaxuAW6bBqSV0fEVEu44IySLSVyILEzOpwOo/Y0wo/TBBw18sPvR8
 PjGImbOmUvyl0Kmrg/PRThH5In3Kaf5alRBgAMC9OssIxtoA/tWGhJj5eudqzu7CcpEwb9aiF4g
 rF8WDkXf6enr6YmsVEADnO6d5xcNViFUox3k4DPFv8jRxbyxpnRK4QvfknPcTm7kE7kpp+qbfqo
 BxMW1TT6TAJY1VHpCYzK+o81lTtH9P/kFh41mwhHXwq4KcBNRQUdDpflQY7BGA3or+6dDfrVn+a
 N14BO4zguWLrHDl7Zyg==
X-Proofpoint-GUID: VOT2D4dbfISJHTGThCE6bwp2xHHBUQZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020044

On 10/30/26 11:41 PM, Alexander Koskovich wrote:
> Configure and enable the node for IPA which enables mobile data on this
> device.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

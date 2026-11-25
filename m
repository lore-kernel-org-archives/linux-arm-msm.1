Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605368;
	b=qhLrj4fvsRtulThSGDfwe+rughcL7SkrS8wKwSKlf9emXIj/8InpOpwzB0Ze/goK5Ooo
	 LPgU3JmMfkIgpFpxbWmFIFSJogfoEOL/91FLj8ltOcr0o/L/GWa0oSBdCyJC93+sQi+36
	 MYu5Uo30wwztgkOH4H9nmIV4bSn+fnMggsJDBQqdFlNDA+8gPjfLTj2zq9nk6xHOgnFgr
	 wh7+yrihHai40C1H/a63/CFqZoBG4HptLXT1KUh7ELW0fIMCfKnIg//08UuEnqtggRV2y
	 Bns2+KT5ccUNjxPyTb5HG16J93+kld3DTmanQgH3+SzjKloqewCWBjkQomeLjUqgEfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605368;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ydO6s6zouR5jlGhUAX7WLid8Ob4ZCGvRRCC4HGa45LE=;
	b=LE4bC9XgdFaJEC1pCK2gW9pYlTWKaWJAf852TFfjbUaWzr1lpceoXuLUkmRogyc6Z0ny
	 YwWsAyoVctXeso3FuI1TETeLKaAdwhBtcgxbpeEy7koQaqy7cQemCcLpzVuq+0ecX9tY4
	 tvc2/RP66TEMcXh3howX7gR14di5pb56R7n+kiVxW5OGasHy38v8x6zLZLZfEa7LwaO9g
	 lVUGMxcF9Tb5RJ25ZRmCHu8dxr7WUImPQXNXvAHr/WuMK7qoVoMd5bHFvDVcibt+pNeyR
	 LNTdStcbsXizkbN4WsjIb3U7anMw/W8a4NvtGpf3/ExIU6aRwbRxsy0U+Nat3wK0HSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LUxhB7zc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffBqD2Y2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A52606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A52606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LUxhB7zc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffBqD2Y2
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mAa9115100
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ydO6s6zouR5jlGhUAX7WLid8Ob4ZCGvRRCC4HGa45LE=; b=LUxhB7zc7CmsqzkO
	r3ZGWJCLWUe4qD2tPmoMv77pxKvjzq8P4+TO5PY4/RQeTJfNmf91Ujh/0LYX/1kO
	Gf8mfM+QZVvshnmFF6afeDPWclv+8wQPmTyWK2EQeS+Vm9Xq1xLcSzE3jNMJ0GKN
	y9SRAQJ2urUf6F5SgQp/aglydY5YIyCl52xXbUeHMUKhbKIusf9n4oxQgm54KJ48
	yKZfO/w/nWuiUG770y7fgmoa2sQD6WOoUyPaZnEHmdkLWQeJSKVE0WRa7ADkEGAy
	sRYcxTYhspE4kqW7pzRlMWST/nm3EF3uwxZ5Qd+zLrIuwM+O+1OkDlR7zlKhsycD
	3DepQA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkchuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:16:06 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecf0967947so198551e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795605365; x=1796210165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ydO6s6zouR5jlGhUAX7WLid8Ob4ZCGvRRCC4HGa45LE=;
        b=ffBqD2Y2aO+WAqVaCmzZ/zOCTzJjeHYop5E9eL4Nsgf3ZQUbfuM8KtFPlTBgRH3H3Q
         jreHsXhb2CvOr1hHwHLSVsnUT2Bnme7P02otpD+njccRhdb5C0dlUSf0ooS2yz9YmlYL
         I/Fj8Bl6v50IgJ5UmYF/otEUoAURDlJMpItnZMzQPfIH8cEjh6jxMBEVGtopbeFbvlgg
         k/LfF6oCR2Obu7oCtJRx0og6oskQmsY3x6hvol9jDqWiLvmoxCJ/hwYJk090RoXpeNvo
         5X3iZ+lLPupIHmHqAkjGNoZx+R0EVutm1USKA/4uNvoHlwHnq0BFwSmJAqD62eXH46Ej
         1qiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605365; x=1796210165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ydO6s6zouR5jlGhUAX7WLid8Ob4ZCGvRRCC4HGa45LE=;
        b=GWUeIphgL8Py2NjKxM/VGfnoXN+cV4je86CfHffYSc6sbPKaBb3ktGS9am0gJdLzOw
         /NZqc1ljN4t6Kv6xoiMEC44+QizZGTqScxxcFwfxIKeZMsRECh7AEmNOqU/KhOeTl17J
         oI7mdkiCO3Nsqa1kX0cPHB4iYTY/2Gk30dC1ddbKiJLdSFEJ/cGQpHdjYn+ZcY0OX179
         pLMa/cg3larCkftnI63UWv6rzzcq6e5diuPbWmckDGIqUUGVcIz6Ir7GWJI9cVzojI81
         vNbk/DqKtJWsoUom0DA7+2Crk3pZNV6fmehK/UQCcfMuN0plVJFUrnoVpGIaWkhpu6Qv
         Y45g==
X-Forwarded-Encrypted: i=1; AL+hErGARYUQ/0pDmr797+dRGOLjmv0QB3SRYYgXONNg6U+Xpj2OqwC7QX9jfBAm23G/4OwFQ9i/LE0l4mL7BQb+@vger.kernel.org
X-Gm-Message-State: APuU4Z9BQLM/btQhJNEtXhACceSXDjrMiXim3Q4s++0B0oGuT61U+4p4
	r9ltZEY42AcD0hsGgTYT44IKvt0Ef34WNJINWC9sYP/cNgalDQd8nk66NF/mQtEEN6J4IBWEFF7
	RTbsRgz7vqL6V5174rrSBllI8mArX+GapF23Ly1dirwrGtCUQDS5UtIxCI1EdNh1RN6ew
X-Gm-Gg: AZFdTZegdyYagK5udUfoGXcMuIBZYHGkXDY/Vs4lOMPEuJmNIOzCW5MRmUMLFLXW/Er
	fs/VCsEnVQcVp/sO8Im5uhi51obke6GCnpYdWmrRcZvxCU2IlsUanjLrHKSgOyUD0RxtruSsjo7
	42z1zkenO1LTClY27e4DH7YHrMzY2gQrr9fBTvuBGEf8YkzVxrImJFM0Kp6dHhATh9v0cM4dCgf
	qe7RmiFxY4d1XyJhXEsNkftsiVx7np04jAZ4nsD04Mly8qY8dzulkZBHhLZWxB3yOUwFE+I38TS
	7pS9xm7VX14qbqA31mAlRZoV2ki7tfKtf3AKE1ZA6TsnuEBvRq5xP9Y4ujvMXIGE+PP9XjxRLyF
	lG3bvnbyym6qFCf4bghGZLn7K2NY4jKHpnZfxfwHQOaaTj1sZcXQ80vyM0raj1s2R0daqRe8=
X-Received: by 2002:a05:6123:59c:10b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ee8b009d61mr10785983e0c.5.1795605365318;
        Wed, 25 Nov 2026 03:16:05 -0800 (PST)
X-Received: by 2002:a05:6123:59c:10b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ee8b009d61mr10785962e0c.5.1795605364872;
        Wed, 25 Nov 2026 03:16:04 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b03723bsm614271666b.87.2026.11.25.03.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:16:04 -0800 (PST)
Message-ID: <0d58f23d-cd7a-4a9b-9f22-c5ee4dea05a0@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:15:59 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: talos-evk-som: disable PCIe L1SS for
 QCA6698
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, mani@kernel.org, vkoul@kernel.org,
        neil.armstrong@linaro.org
Cc: Sudarshan Shetty <tessolveupstream@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        qiang.yu@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112022619.277383-1-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112022619.277383-1-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX8+/w+xxes/x4
 4PGLnGXH0M7wLqQUpbxgKRA7tMctRLnF2Wr17JQ2/AFT3Q31B9ePOyLG/0/Y3euqdas2NmTimWQ
 VlDvm3A/OxfHgQaw0ahl3fHVrLsr6y+h9IxngjeqERvZzzvzlHK0WrmAfx8qyv6LLxZV8KR/3QD
 QuPhl1JrMZ1mc1RuaqAlMgL3o3UEscgHsFKZ0An82XDB0eCnUc7W1NPou+bt8xjZKWJdpouwhFF
 +ZQQ5C+VmXRSRjg/0t7d260sATz8vWFJ9XMy4FEC3jz8Ytrw6RuzQoJTJAK/y+3noWZ42+TA38+
 GAqz4n18xkccSQ24RTQ12kF5bUJrNKJEuHM2SO+JspLyo9fNvEb8OzPi0kyL+s3ucIEhYLU9JRx
 ofwHb9OhVeFyAP1qJbaFYwYG86SckLF0GDOhJa33DSCC+CByquNpsjC4T1h3MYX32YkyhxN+i6F
 WDIwb8oyqSGVYbUokag==
X-Proofpoint-GUID: K9OYz6INVolH5b07MZRHfOKzOdfWAmaq
X-Proofpoint-ORIG-GUID: K9OYz6INVolH5b07MZRHfOKzOdfWAmaq
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b06c376 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=NtwryRwz0H4I5a1WLC8A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX7V+B9shL8YQT
 HzBA3WAY7/wCBLqT5BgtF7gPBH0DmKiNEW7tkBe5tDk/7TrNoddk81/kJ+U6m9NmQg74i2YEdCZ
 GVEoVOISi5sHd8dIxqXntHIxkBSrn9s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250044

On 11/12/26 3:26 AM, Ziyue Zhang wrote:
> The CLKREQ# signal for PCIe port0 is not properly routed on the
> QCS615 Talos EVK board. This prevents the QCA6698 WLAN device from
> driving CLKREQ# low to maintain the reference clock during L1 PM
> Substate (L1SS) entry. As a result, the reference clock is gated
> prematurely when L1SS is enabled.
> 
> Add the 'aspm-no-l1ss' Device Tree property to the PCIe port0 node so
> the ASPM driver disables L1SS on this link.
> 
> Fixes: 0f9e6db8a223 ("arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board")
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

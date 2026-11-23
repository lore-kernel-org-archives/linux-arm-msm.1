Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447062;
	b=cEUvD+hDpGMREhuNM7cPZWmNrTsAsa0/NuWC5NHAn0riGUwBh8csazxjheqHpfpPFpcX
	 PRG5W4IcZwK7jJdA9KZ0Sn+ehZ0j0UfZYwQQZPyL8U/NfdGI0LFXPWtxblmx14HiIYXvo
	 jP6Z3PN32263SL5WhPIq5orS7QAIUrwqCMUItHpn3zPgCXRbIVtQx0bqRYSNoVAGOQzkb
	 VpIemnhBT0yeYhL7btgmjpzPJcfl7uSh4uL9iPhChbmSjqG7XCYPkgavzHlFZYex7yk1F
	 7rvRB/Ys0JrD/41DRg1ApiqTQBllnrt0tNVRS6Fglb6uzh1l5WwVTC9u0SCJPg4nQow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447062;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vkrEv+PVcuudxd6R0af2wrFICM2sOzSUBrjd2eADlIY=;
	b=Ju9BlzfTIBUrI+JqrNfq3R1cDjXU1tIcSvBX4J7K9hRrTLKZ1LLBbpwz7Iy6bO1XhV+X
	 UdFpGfFTtfmPnZ6mwYVlonKO8JrFI9tT/d62X2BjVnDtBpXXEjRjkUp0/JahaYix13Rn9
	 O1c2rR5+R6/kBg4RGQ3m+VDeSWekOVYmCLr5/Z2YYSlrmWBSIwRqNck9U1Ak9R3SNaNQT
	 tVpxXJHA8gBOV3r7S6H+PBjB/QNWIpVCc5zjdFg8f6wUwL8OEuw/RU+cmp19vP7UU7EUz
	 wJVeBwGTUB085MNxBn3XfPBqk+TGC+sLomJkdxuo4W1IhkU4nrsO0PBbMOHqi+/WSvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Bj+jtzy/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zx7yn2de;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D84606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D84606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bj+jtzy/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zx7yn2de
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLYif446749
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vkrEv+PVcuudxd6R0af2wrFICM2sOzSUBrjd2eADlIY=; b=Bj+jtzy/tW5+Zv1Z
	cRybiJR+ZWrYLOqOFQtKGMxbyFu6GynHDh8jLV2d9h+PTox/EcjUYSbS2VxoMen2
	OXfbgM9SpL9kBKkC42r8AgV095FZ54A+bL8hc/YDnbHlZ3lnKaUZC8LGlvKO1XcR
	ITM8cHjmLdHbOWVUnC3x0osLeuYWQ3njziraoQ+krm+dawdLVUnpoL/oXmkJIjP9
	Bcii4gXGoXmmGsfkoyFwCbpA8vE1jLobzftEwENNfk776EyLjyC0ud/yeVAeNuN/
	6we9X0EnbjBsPyMjUx5iDXt6vZWFjM3D/0iNfAfU7TgC5YTsG4ZUc7YPcRBLUh/2
	Obs8uQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7420mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:17:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b436d37123so500180a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447059; x=1796051859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vkrEv+PVcuudxd6R0af2wrFICM2sOzSUBrjd2eADlIY=;
        b=Zx7yn2deOWtV6BkEV/IUz8rql8RAxl0MZ+jGj6cWSSMTW9u7gVKAXqvlAqMaFQhyTc
         KyL+pQTaxkG5B1k/mmi8K525T5hKGmjS4iYq5fdy4uurXKY5hSxqoJh9bbz8b1G1HY/E
         LBBWjvikleOm0joC3ueIPqs/J/J9TN0fbFTC1SmrHb/2PSQPMTc95MXEhnVwYVbZ11BN
         7afn2/qh3mJLNP3g4LEfrl2TZJQtblUgQgAumCm7TkiKWvIUqy27AsbS7fD6mjBA7VSt
         IjNba93q9j8KY4E81FXlHKI5uM0Sbtqw8ysHOM9udFAj5HuU7QqXhPKJ4jMTV2NnFvy5
         OiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447059; x=1796051859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vkrEv+PVcuudxd6R0af2wrFICM2sOzSUBrjd2eADlIY=;
        b=ylRTeczF8F4Vtle7uB6IUaibe36IsWS8WDTRztTPUwO+OgXVz7MgVqzKaOM0O6A9K7
         hwXuGchax1iW1XlQ5E4x02mZKc0Mjx1L8kd5h+21wIMpQht5hoqwCvJCyqJ+H/Thfl7P
         HcFWWuZbNxpmUDvsOPXHh69z1/8Wjifo3bysTzxf3i1S6lelu/dxxHHFtweI8n6jKYZL
         /f4izj8EZP/aH28/XOhIe0AM5AjwfAP4IFP0GhgjiTaISbScH8c5KG7DsNeJKyh2I9wS
         Kiso0uUuWEGKUEgsYcH89+IAViPdQjcwEhNgI8YMFk7Ygt1R2OohZz/6otMc/u3bScze
         saQQ==
X-Forwarded-Encrypted: i=1; AL+hErHlyleyxJ5CiPVojSToDTKXzESK2Jphhd4ax+OJ9ITxalJRDdIF0ONzehnS3T5MEnkzsxQWdwy/zOxvZ+Gn@vger.kernel.org
X-Gm-Message-State: APuU4Z9z9IGdPeaUm29HzyLSDvetVB1F4jOIOXlDG35nq/3gSC1d4pbb
	SislvuatgP/OEmdYzWqSrbONEwAsj2SJxzpItkY7UgjfUUi7euFZShk0yOZScVDexDHm2hx5QBf
	u9dyqhdT8EcmM7ARI1ER6CD/vAUaXOBeEF2OshO03japu/Nzn2xGeJWXB/ixgr5YlpRry
X-Gm-Gg: AZFdTZcI5FeDnnvK/GXe/6wBcBCetiB40W9Vr0vohD8Xe51YFwnuOlnh6IaS/zj8Drj
	/LsWzNrC38+6eul3UvTI6Um/kCxwI8ZpJWMdZSwpbCbbpPzup0yc6iBD/CdmqLUFP28l5cEp2Vn
	G9ipx6w1xvcR9TGpa8hE+2no5glU9Dgy3D3WNL1cqB5uBC5VZyJNj7XhTN1RzRI6uiXsFYLGdFw
	4x8nrLD10+k4kFe7VSa6DADznatW9UPFqHjxtyrRcv/UopZeRnAaizFLhpiJXOLjB/176ZaOjSY
	hK9xQdzKYIh8wYZ4yVUZuw26M9w4aDr1q6lMWWw7k42ZJsOlKTaVWhv5XlJrKGUrxdMrIZiDuhu
	ul7S1RbsDNrqPnR4v9Wh9RTz7C4ds9SfgcStvSrwQ2tbuNWgy+csTKlgvQ8810oFTS5vqhoM=
X-Received: by 2002:a17:90b:388c:b0:3b4:393:453c with SMTP id 98e67ed59e1d1-3b41c96fdc2mr18071154a91.6.1795447058629;
        Mon, 23 Nov 2026 07:17:38 -0800 (PST)
X-Received: by 2002:a17:90b:388c:b0:3b4:393:453c with SMTP id 98e67ed59e1d1-3b41c96fdc2mr18071093a91.6.1795447057989;
        Mon, 23 Nov 2026 07:17:37 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea28f4sm430944366b.33.2026.11.23.07.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:17:37 -0800 (PST)
Message-ID: <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:17:34 +0100
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
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vo5PnfmCa2sNeSh5xGCRPsN_ygm8DY7T
X-Proofpoint-ORIG-GUID: vo5PnfmCa2sNeSh5xGCRPsN_ygm8DY7T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfXxCfroohesBM1
 p9buSbZ86vqwKZc0GbxTORQBAbGYCKmVjBkhQkitA8BjbjIYbei2Xu9bNozB94OeRiZHPNpP/s3
 ZSs7y3W7rCD4o942SlHLvRGQr6Qr3/Q=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b045914 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JVp1Gilkp8drtUWwDXwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfXxfLiKLac7W2Q
 e/mWyrjJj689X45ZNGW/B22FIFWh24p+1RjLVuhosILkE+NsloXCeAPYAVPlkWkMlWGifiuFF8V
 GNCPdPyT2GiIgn0YtuMHS70BFHB4EmCOlnPb6Zvuy9sxSfyxdSkwIBQmGaZd7FHlXAp8EYv17cE
 owFRrBV+dzL6d6JmT6v/Rh69MPaEWUCiLXcyTchDptZLtbWF6n0cle47siadTCJY5oHluujyAfg
 4bBPsiIsfw04sc5JZL1FI2nSnqV253LXGW38sGFipKKZvK2Imyn0TQ7qCuf6EcphR8/He+YK7jK
 5+m76r96trQze0MklSxMGVXl0U9VotC6lne5cgoheNmcKbVsngtY0Eim1uDW5UqkMeMmEiy5Jys
 GDGrfYpyJTWSl4wbPh81X+34K4pxQ/sQg/ojpsE3YKMIAHKmN631oizfwzJHbJauxLR1mUkie9r
 NX/rVtRgm1VOJ2oV/VA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230060

On 11/22/26 6:46 PM, Krzysztof Kozlowski wrote:
> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
> currently used only in the socinfo.c driver.  There should no and there
> is no in-tree DTS user of these, so none of these constants are really
> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
> that part matches the concept behind DT bindings.
> 
> Driver have local copy of these defines, thus these can be dropped.
> This has no impact on in-tree ABI, but any outside users would be
> affected.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

I think we can move it altogether, to prevent a situation where one has
to take time out of their day to analyze which one of these is right..

To me, this is the same case as e.g. glymur-ipcc.h where the values are
some foreign constants that are specifically NOT bindings

Konrad

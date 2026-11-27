Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789126;
	b=qyoRDzMwY/ETERDtn40W9Jstc1KdMmTkUxw4ZcA+5BZO7mipLGZPEnNZchdE8EQyW+/O
	 E+zXZYGX0ZgjTdy4eNYn94WF38mKgNjXpzn3M6vlLiRAoEMTAmq+jHX/yNN00Xqvp9WOI
	 gmh9ZdzOIkjb6yy3DRfWRklJXV3la3txtTddrUwBsjfrkLe/5eWyEBcnxWw2cDzfVcTPJ
	 2dRl1WZBvBqQkSsWgMXEJd9eyXMFTeA0puvakBq3g6JLejFQIjft0oKZAeo5tnE2c4xkA
	 Ljvnlp7rPN1J45BRdz0tVevCW3JIHnzO7+y9QQ/80RjVfBfyHWTli4xFsFTHus7aaxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hjNZ6MbjojponFD30rn+KDUfBoOJ9+Q/e4UNW91YGkY=;
	b=vs7ab1sqX+EA4vg/ziaG82TMX4AmWwKnOU0FsEvOoL4kzZOc2yl4LkMnkijnZCnWOisc
	 v6sRqLnlv8gOv/qy1+LXjfs4MH6zMwXczvO/rvmYzubjRrkUy3faq/p/TRMWuhjibF+3J
	 uvUrZQdRu8T+OZ5JPVQjcl+RV/DHogOtBJzd8R+OpMouxkAUWqXDe7GA3sF4MWjDPW8pD
	 Ctga1JNx+T5f/57Kstn7BnDH2zaG6h4xgcveDh/iQyW4yvfgvChu36UIHGHwUPJFTt+7c
	 dWmXhpEhWOZp9SEisyoclR38hjd+FiEDKbaMAJBZBwjc+G7Rop+VmikpgTiDfkFTmYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpM2d2sQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/36J6pi";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D597606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D597606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpM2d2sQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/36J6pi
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1KdO685979
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hjNZ6MbjojponFD30rn+KDUfBoOJ9+Q/e4UNW91YGkY=; b=MpM2d2sQOjX3C0iJ
	5SFCSPvUX/RSIwDOi2p4mbqjLG10v6T1+JoVIbq4saOZxqoME7DZHOQEM4CUBKHt
	HmfJpr8k2Tu4UCON5RI+9PIgus1a6kbh/PKgxAweGTyImjN1yGZDkAu7nTKlg6n5
	20/R5GtCHKALP+yYEhCGJ4q5RLV6IPZktenLUzjTmMCHripjCNyf+dARgpNZbyJK
	ijaBLSNrkPpZKNVrgGAGATJDIBNsB+UUmscbAJUSDLsvGnaUKnFmTHLOTrMnciN/
	6bL4cBBqCDjq15sNiLj8iqJqr+xERlScDE0iSmSbh5diX0Zap0FNfUTbUfiUw3KG
	m8fucg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49bbwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:18:44 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecdc7807f4so365558e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 06:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789124; x=1796393924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjNZ6MbjojponFD30rn+KDUfBoOJ9+Q/e4UNW91YGkY=;
        b=R/36J6piOOlMDb2xMKz4Mwuw6vOSFF/6NvYMvOGCGTcGH093N+OxfgLC5KZClDwxdu
         MOBxEGfiLzZIihwGORMSqmkib3nM4NtVzzALcItBc1Kaaaee7EVCEcLqrUZYJAZXmw0W
         2dfBukJRGQF76fN30W9tp8CFa8DdJPkmkKlTiBYX4JnfSgHhhKFiN8gaE7w4BbAjQrHK
         ARdHducKV4dehjRxyxQnqcCpJNvFH6aNtPyeToarQc2/IzpOUkFsZccrLnTfir4vawsr
         DFOal8uvMsGvTql37cFcDkNdizMRqJlDF8aDJwArIRNtJFF4FeR0bo89BGO0pKZNoTOz
         BwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789124; x=1796393924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hjNZ6MbjojponFD30rn+KDUfBoOJ9+Q/e4UNW91YGkY=;
        b=fNSWbM6I4vccJOmzvYn/vK6cuaHMd2S4tGT+2lwVRFfJolPCnRKHBHDX0xycNo9D67
         D1rqvrP0pjYiVeBpNYzElns9SddtjgL9u/GSUSc0EgrrlwiQG02hX+7d6217kLIvDYQF
         9l9FMxK2uYnKDfqhRTYrphKRjQAMLz/c9PXVQMIeJ3FdqSjqtDFoFuUmEgO/oQ+BulYC
         +qjLMtsqaDYndMxs1UQVJik+xDU3eRqou4xaT0XlrzBKZDhh772U3NuWboTsBW3ncYTJ
         X4a4V50WtReaGZ01bjFyEH2RGGiAFQKATQcDVx/c6jMfFdnVLL+/4Bnm/wfw/oX635DT
         aiSg==
X-Forwarded-Encrypted: i=1; AL+hErFbFSo5kGqi0wTdyRJuVAXuczGDicXK57zItDJRm7ajwo8DNm1tnL3u5fHUpDNVFUGagQrWDQelMARpDKHa@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tp9PrYgZH7a1aFDtat+yUlxue1C7DJ556gBjKT5xpuhDd3Id5
	9kfNQi+qTbiD4j84bhQG2fkZ8FN9x7iCrPqbau999h0UbsS0KSZJBPUMAurlUsqIy5BsUptapbv
	mDsTAxev7YaOab6cGnj4v/0zDw+dVRbSuQ+Ano9L+igZ18RoM4SU4VHrIKQwUvAOzTQGG
X-Gm-Gg: AZFdTZfR0qnVu22+0yqdZs8GtZ6MVa5l2HuPl+tKvlAsYzQkptBaUqzjGvVuT1MNtz9
	kaECo0cK06kj7NcQZ4qZJqdiYgo9Dlnk/Gb1m8MqP6PditeW+xREhCM5okgykwQBxqojc9qt+ut
	7g7nwnVKPzg9usjpR5p0ds/Uu7uv1ejnmd4tWVSsfWQLUJHodStGqFBtjPnkYyOHYLb6mVT7mQB
	wUuvABYlS2HbPL1ZS0q2P6ol+diCtgwgFOdWu5npt+aYJz6ksd/eIj6C/XYooL52UwV576lMVRw
	HF+sp85ad1BnzPepkHK+UeMf31gLzKTKWCVAtiuXUlHYHzCuEhVbkzcl/ljHTYxMSMGNd6Yuh2g
	wgvtJ3iPFDvTr8nC8enrcrJ9tSQpZlDJ9MDwf3H5ro6aVn8nNbkas03X+fKTg01fJdJo+hig=
X-Received: by 2002:a05:6122:553:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee8ae12633mr22084642e0c.2.1795789123688;
        Fri, 27 Nov 2026 06:18:43 -0800 (PST)
X-Received: by 2002:a05:6122:553:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ee8ae12633mr22084556e0c.2.1795789123132;
        Fri, 27 Nov 2026 06:18:43 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6663esm876314966b.21.2026.11.27.06.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:18:42 -0800 (PST)
Message-ID: <39f263a8-f664-490c-ab25-5efb4bc606f5@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:18:40 +0100
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
Subject: Re: [PATCH v4] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C
 controller support
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261123122857.2424213-1-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123122857.2424213-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mllsPBIaghlDa3dERDCxZg5dNdsVjgcK
X-Proofpoint-ORIG-GUID: mllsPBIaghlDa3dERDCxZg5dNdsVjgcK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX9kAEACAogbKx
 Htnv8bUp9IslreK3omlzk96wfgFq9YxH0N+1wLS+C0AGv9l5rUyO5mpIxnCu5Qtf1rVZVRyGVH+
 ISa3Pm1wdINLaKXBffVqbmVzxouyZik=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfXxxsP/ZNUbBcR
 p99RuNoKf8Xq9MqHN1r/SYtR+4GCux2f1rAKQW6VchkTM2bj7f0HVbk6AhpiTHAGuBU3Ll4Bs+X
 BsXDv2ojRMh/DeJzvSiw+VY3NFXmBdnaLgcRoWSAd/XHyeLWGeJtgNmVsOMu1V+bqZ+S2gVUVoC
 U4K6y2P0U3KC15Akb9jV/3LACAkv7k9TXSrAyhUpQrl0213KG//El2skpnAApjhXX2qryedRxup
 ZPtfX8SCpEMrG4Y4o7ywfEOPxOy4LeHBL/vDhMp2bbUnblqhjMpSFuWwXyDotc99sBjLPWtIMvk
 TEJaWNl9Qn6OLSz4dBe+fo4HpgVgBHlqGVXlOwAQLPHfBGebsQauNc/pNgDJ3PCj/9XVbp4mJqS
 Wtb9eqUlBCpISZCKFGgjIQNWtlK0CF7pG2mawidU+VlE5GFHQrsP1nRHTPeDqWPUJUomh9GKcbv
 3fa9uCd5fVkDLdCN8gA==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b099144 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=QFD2gNDBM12XyJM7r4gA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270056

On 11/23/26 1:27 PM, Akash Kumar wrote:
> Add the Cypress CYPD6129/CYPD6229 Type-C PD controllers used on the
> Shikra CQM, CQS and IQS platforms, and wire up their connectors to
> the corresponding USB controllers.
> 
> CQM and CQS each expose a single USB-C port driven by a CYPD6129 on
> I2C3, connected to the HS-only usb_2 controller. IQS exposes two
> USB-C ports driven by a CYPD6229 (CYPD6129-compatible) on I2C3: the
> first port is HS-only and connects to usb_2, while the second port
> carries both the HS and SuperSpeed lanes and connects to usb_1 and
> its QMP SS PHY.
> 
> Both affected USB controllers are switched from the board-default
> peripheral-only mode to OTG, so that the role-switch framework can

Is there a real reason for keeping the peripheral override in
shikra-evk now, or was it only a convenient shortcut beforehand?

OTG is the default value, so preferably we would drop all overrides

Konrad

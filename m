Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610024;
	b=Dpx+MAW7nedqEZrOGH1KnWhXxEgQF+FcPmRPT1iWQcpXSIYkBoPjSNTxyVnA8j7nIyJI
	 ii+/yUuNlgtxgzZs736GzsZuj551BSrYaJTX/oxGdFVzB2qxy0WhLsrnsYfVKvAChDBa2
	 QOGEygBN7SgH4eXBIzUh95/SWJqh2I2XhcIfh9lWYA0vtt+h0U0gto300E9E5VfRmpZLi
	 /WbyIKaqCzSbFlk9VooIwmE3WNkD8qbGYqIbsYT92+Z102vNu4I+6h8Dx7GZsVxwUCeuZ
	 q1dTh7S/o30kjLKoMgYQ04VO2cT93JXIWr6TtASYpT9LFarDPOEdobpZGZfJHz/zerQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610024;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LcyZmMSv6hzfdTjtAfjoFhydCDrEqbyOrtGH/2VjRSw=;
	b=IufDTRLVN76Q+rmJYmQOj4S3A1gJwrLSK/wGBtD/yYHXvORHd46A423wmjXwsn9TGu1C
	 tGCOfM0k1KsJhn24iHAZubr1gh4b4SzfpCzmGLY9KMK4TbDnYGJt2bHLphD9E4naep47z
	 efo15cTciMY9YYHi/RgnqUyyvnyAbC6uI57n0aSq0+DJRQTdWsKJF31/eU/wynoj7UxjE
	 zLQb/wDagb0LOyzZilA485Ep1Ze258cEE5fEaQFYW+Hmlt1lsu1r9UN+d/zlDxKU5vyIz
	 JxFZ+LpE6NyASWPrXgnXMeF4YMdp36jgZa4tstIcL2aTyCqocyRpcVaojkuNJnM5s0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RZiaF9n8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNuRdoQ7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E1B606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1E1B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RZiaF9n8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNuRdoQ7
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24DFKc2433383
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LcyZmMSv6hzfdTjtAfjoFhydCDrEqbyOrtGH/2VjRSw=; b=RZiaF9n8KoArplt3
	Zk+xpRAm0lflCwyQ0IThXCXR2KTfyrvX7mq/99gb8HxZTwZzA6zfKKY1pWBM6RmC
	z/qpFuqGDsk2ajfL6uGTudXsqnGS5S4PecRHmYQKQ9432J8tJ3kZ6IPYuW7/pQ4E
	17Fa6UpbXELoGsUip9BMrTNXzcn3R5o3PO0/Y74p0X0LeVWeOXXpY1KCRuw1yJIA
	VRYJPqZWFF6dpTCwAv5kx5iolCBmCByX0F0D1uNz2wB7ZnEOhGWhDEBJHSUc6TGG
	cUTKOPm92AJfRS+SBiEm0GU/RpY/2SH+XwOU4rznMFIB+f4LC1hgriJS62wScRi9
	fXiF0A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka60yy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:00:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c8f9f6b49so7245456d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610022; x=1794214822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LcyZmMSv6hzfdTjtAfjoFhydCDrEqbyOrtGH/2VjRSw=;
        b=WNuRdoQ7aR0vzix6hc8LW8rxKPfGb7GDTFDAnaftWSpCEd0GBnWNK/+pLpx9Hzs5mw
         DPBscaT28LLUIe+A9y7t/ZJrCllroOJY/vEHnaZzIZ3JgoASQJL9gJNuZ6dfmc16X0xU
         g+ZlZMlw/58oqgkUDJsUzj8UmJbzmcQRE3mH50r3KGqD73HBON0zVCHrI8aLlScVY1de
         RnCvpBnxCkMG64AJJNeQJeftpZ5kEQlIfCzDwlgOyGsShV1lXIXdsS5n8bUECGefZOUL
         oEpk1QZddESBBa7bLuSgIHpOgyGGTT12muTrVWuT8irYE6Wc1pS3/KUalkjNm8ztZ4Rs
         3qEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610022; x=1794214822;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LcyZmMSv6hzfdTjtAfjoFhydCDrEqbyOrtGH/2VjRSw=;
        b=wk1SN4lX1j742V4odGDbAsV0wZGHvzssiB82yLlBLBcSEPPcRAB5S3N5iqZB5cndp2
         1Iqv8R/FQiBl4tRxw8XhARMaR5y9f6ksU3MKlfZPbMU6w0pjNgAVRlW3zw2Ub64oNjxl
         Hh4QrxyluTM5kfOR7AFICa/khLcoeuMkwCkK4vMFaBx7L+s8vswu/UQaRPr0WrhWDnkz
         tPWK65GS1WQfXBUYNrfZpQ1UlKZRhTv9cu8EFUDij968he3ixPdqMQ9CIwlo/so5KNM8
         oF5JAHQxLmNuIXOzZfDnoUzbFXb+beIYQtoEcl7WlL70eWn///qR+TIf6uPjHkFdCJfE
         gssQ==
X-Forwarded-Encrypted: i=1; AKwUvByPTXnF8GhNyPZqXhWn0l2sv5JB4JzKWwK8/bwG4BATd/IPkLyzQXa7HIaZkpChj4GddqxRyPy4/dFBJ66V@vger.kernel.org
X-Gm-Message-State: AFq9FYLAahEvf9XBbigR9GoZKW0ljctU3RhSlhrZH4PrNSQyI0+7Q2Au
	fi4EhtZ06V8GFZTnMVnQ2cVmUpQUbqe1eq4k1T+fIFyG/mNAC50lXqBuAZKMvWHc2MSERaVIgGt
	xtnILZ9yFq9WIfhg5TpED77PdwL9NZf5iGtEUPb1p63c259iNJf8Fdq1hiWo6iNLZLW7C
X-Gm-Gg: AYBFou2BrB0TSIFrnfl+tEwX2iZSafcV8Huw+CuhHrf46c8vmR2BR4FurJPNoGiKAEw
	UnSXqDD3WaAQNwQ7QtTvsPXioYyk60GIM5F6zqIuo2m8o4xnUcwxcr0jJtaZDEx1nnZIrpCma5W
	KzCD/fVFZpuI8GdGDuzKBVxdZw9cjEauS74cWOrcGbzCEWq35fQCnGQUyR1RNqQ5vAXFaqdmuio
	Vepf6ULB3RS+eCHguKWAX+4EGfzSNXshgWHCKQFU1NJjnv5sS0zElozzS2CUwpDQDtruIw5D70D
	Pl+N8Tn+GXUbbO9X2TWcThPB3UcRPguT2dJ8oEYT9skvlnQUYgD/CEIqKWQL6o8V44xBK3LJU1s
	Vyb4iLoYmM+WCVUnDra8AXHoxfhZmiHfsrd/hTP4VuKhzb4JiMBgHuf9jyKd34P7t+ML6X6w=
X-Received: by 2002:a05:620a:6f9a:20b0:939:9205:4d78 with SMTP id af79cd13be357-94421654ce0mr1466941385a.3.1793610021492;
        Mon, 02 Nov 2026 01:00:21 -0800 (PST)
X-Received: by 2002:a05:620a:6f9a:20b0:939:9205:4d78 with SMTP id af79cd13be357-94421654ce0mr1466937685a.3.1793610021051;
        Mon, 02 Nov 2026 01:00:21 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cb092c042sm333304866b.82.2026.11.02.01.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:00:20 -0800 (PST)
Message-ID: <c1e1f708-86a4-45a5-921b-fb8a74a827d4@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:00:17 +0100
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
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: sm8750: describe two of the
 three CCI I2C controllers
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-arm-msm@vger.kernel.org,
        linux-regulator@vger.kernel.org, devicetree@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20261102060458.461372-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261102060458.461372-4-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102060458.461372-4-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fIUxI1t-nAARDGFEAnaSnkyZN3Z3uFOD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX7yoNmS03G8U2
 7prL2bJnnkfx+EVXbtNpEKZbbRSQ0NP8RAldymUnWcqxL7VF0ER8wC1GJ+EnCEBP6sdXeT+AsZb
 4TpVqnJsQNyQR4aOvfPjVEdS9GT4d4I=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae85126 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lfLXJ-OPjq8_KLG3azgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX3Iwxnf6+UyTb
 vmQ9LyltKMrvb4kq6pqfM28DI49tUM04H8fQ1WfhqT1MvDGB2+jW4UOMqrtjIAE7m4VCNoZAuEa
 +JfR8E/J0zoyjMhJ69blTw/5wtjnuoRXKL2xwPys41hcELeHCC/7G6UUEv17SRi+aEccufIWf/Q
 S0JgCBUUkayK09dQLTMODtOK86qg/qycKT0bxug2PwIlH5Jklar7FxJAsn0XF7gwi6xwAM2qt1w
 /Vqujt5yt4tPVuqHu7MdIjoGallpekdwsIvkKuPNGVnGbmLCbx/8CViKGt6zsuvBGTpXRksi5hC
 DSE7TVQvPf86xGCuBd1Tqw6KVrukivzUMenBiDiKK2xyBx9YY8VU3Dx/7w43cT/luXwxO59hmh/
 y22d6r2rqaGp0guAHphb4NRtyFByLswQYhaDQBrZd7RYkvHUExxAtG7PdyWPkaCEtuEz9WF6aVS
 t2N03eyOP2KPPyXxMWg==
X-Proofpoint-GUID: fIUxI1t-nAARDGFEAnaSnkyZN3Z3uFOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020035

On 11/2/26 7:04 AM, Qianhui Xu wrote:
> The SM8750 has three CCI I2C controllers; this dtsi describes the two
> that the Qualcomm camera subsystem binds to on this SoC. Each controller
> exposes two I2C buses; both buses are described and left available, as
> on sm8550 and sm8650.
> 
> The TLMM pad assignment is cci0 bus 0 on gpio113/114, cci0 bus 1 on
> gpio115/116, cci1 bus 0 on gpio117/118 and cci1 bus 1 on gpio111/164,
> the last two being the pads shared with cci_timer. The remaining CCI
> pads, gpio112/153 and gpio119/120, belong to cci2, which is not
> described here.
> 
> The controller nodes are placed in unit-address order after
> videocc@aaf0000, and the pinctrl states in alphabetical order inside
> the TLMM node.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---

There's an identical patchset in flight, please don't send competing
series without a clear reason

https://lore.kernel.org/linux-arm-msm/20260618-pakala-camera-v2-2-9fbb729fd242@oss.qualcomm.com/

Konrad

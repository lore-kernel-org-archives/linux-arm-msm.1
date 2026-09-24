Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4996F3AFD1A
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240768; cv=none; b=oyEX/oEhaZyj9LmrktSg0DzI+0ghIN3FxcN+ohe31qkZ1U2eQ1qgHM+L1XbwcHWGwlt1RoZnfFJHsM0ORwUqoz7lwgodQXUxQmBmBaVPisVnre+sOg8qXdQMbfXv2hBe7vkRt37t+0us7hS577swuhuOcQWmzhjXSpr+tmIa14o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240768; c=relaxed/simple;
	bh=poW0PZ5zk0x1aS6ZoUJFhJMAlVCA0awRCniF7sN81mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nR04N593vhT94+tpzNRkQjk4u/RXhrNudaEMeZHEzQIS/kF8xljt8SYkHQQs55ldafuQBGORIRXmFi35Lg95xGY25oB/cVrIRcy/TFsugSxCm0B2TbQAlp/cB9+qM24HBhfdXkyZxspvLhWhUqkpH0yJC17IKQAXoKJCj5uOmtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PTkDYGRG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbedwOb+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PTkDYGRG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NbedwOb+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5ePeC1148091
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KZsUTsJlAuxATif6ogT+hS2X
	xr5/AGSAeT5fyF5OwXg=; b=PTkDYGRG4BI+pslPifUZbOe64td8IeHDTsLiS4qe
	llE5Tqv0ElgQ7n0ZJrJFsnOp8p/zzaKC7znWFI7TBfu/19UNhNxW3o8nBattTZhA
	MtgHYjji6URRqk6dQrSuxW2ZBoxS+I414jmtH9+KCfyfcPwR9J11OMIQr7cXWs+p
	hVF6Tx2iZ5gA9yvKcBfC+rLoR/smfgL+RLjMo4m/SF40WZAbTZMU//xmkhBS48+A
	dClHZ3lh9gaCzTOLMmMBKFYXnGBlNgOAPYLO//fJSkt1pKzrs9y3zZYMhHvN5uYG
	MQtkpXyC5zVQDZ+KpOWo/umG1M5Wdu8mh3uSYucAr78sNw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrapdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:06:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3282d5302ffso750592eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 02:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790240765; x=1790845565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KZsUTsJlAuxATif6ogT+hS2Xxr5/AGSAeT5fyF5OwXg=;
        b=NbedwOb+mTyCXrSvlj2a1dY/UxCzuUU7N0fACF90kwaJ+kULhzRm+ZWpE73bSjXpB3
         0aKN5jQVkx7qBCCZAiBBjBgzK6DND/GiWe8h5ESnrrm1K79s2ZSuJ37hzGtD3wKarNRZ
         DIQxJ31EeNXLvViRDrd1jI+Ce4WrOBvPQH9kLfpdggwyRJbxPcDOTdSljxbPHmlEUDRC
         aBpvwpj1qviXpaJSFNVLtbw3PbS957h2c/gNBxRigfCsK8p2TFc55KDCQVy/axG9tnV0
         T6SDApPrSUCNUxdEMenUIeo91qLGrEsuNf6c2MUqtgJKMLvtz0AI64++4mlhs5c7V611
         bB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240765; x=1790845565;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZsUTsJlAuxATif6ogT+hS2Xxr5/AGSAeT5fyF5OwXg=;
        b=2HVHxVi1lLxPl8WJUQVqKu/tIFO13Fv17Ph8wGnwPe5dootj8Z68c61tgiw/3OdCIi
         JsrRW85ore/bRxy0FYMaiaYU6Z3ALouE6nTmsU/5bz2y9WF8xe/OEFmsiVrFzNOva2wy
         /B1e0l51OO8iNLILiPxLGSZqRuNKpvplpJheQoQ8uCISv286eDf2IInXBGeNvhQDd1Lu
         OpIUkOZ4kDKhIobLYmTvwsycGnm+0o8i0207o2KO77R1RdBt8xaf6thscNNx6QMw+zOm
         dBvzaT9XQZIUdSfJhy97jCATyAncT2/tNESypj59zRWbE/fNw9i+ts3rh0I79+/r/dDG
         rxIA==
X-Forwarded-Encrypted: i=1; AKwUvBxFwvNWeCbryppPOPhaiRQa1GL7HekwQvBgQ3xnqnj+PgUc0UYwlO58zxdry5c32qOA1IZ1Hg/pKHVCaAyq@vger.kernel.org
X-Gm-Message-State: AFuF++nNAiDW92JoklSXfmjDvYalN9AkoPlvnU7TrlMTlEN7zmIP/M7/
	tfd0Gcekaei11CD9AaXLMdXmFPZW6MaAFaGCcysq9LmfQ7j3nR0g+zrx3M38RG4dDvAV5WvZ+fV
	Xxs0bj8KJDbqEd8t5Htrg+jSMBeAf753ryc69EvnmkYEUMonJSaavBaCk4ZSl1ZoUWmmW
X-Gm-Gg: AYBFou2QIGWwUZsJxYA2Oyt6NCoCIHdvm7UaaUNeJDRnBRYYb8/4oFJd7avgn3+uNgI
	gvAVnogGhmUxmtxEB//6OBtCeiw4uDjdQRcKb7LK+5DIsXR6SIDgmlRBzbiTnjhWiEfgqBejwnb
	4CgkszvTf/OpMJcvlHCtvhOMY8Kuop6+ewyywplD4xMQ0Vck5hvGOiT3Ua+EaoOjxFtqOLYB9h1
	JiLhXo3kVthlyxCoUQnOpWlfXFGs5ZFtnQouh233+lNiKgwyERVxRrShgwORGQgLJF7SXuDLamf
	sLXcUDaG2HQ4uB2W6P1CfU5KGNP0fUF5GdiiLVxzh6qFwNy/WH4Z1khPWjazMmCDHYTyW566kl+
	GND1QV11ycCxoWygLvOGvVBXVatzN52P0+b/5esZyig==
X-Received: by 2002:a05:693c:4144:10b0:33f:ddda:6076 with SMTP id 5a478bee46e88-340039b21d8mr1392563eec.6.1790240764519;
        Thu, 24 Sep 2026 02:06:04 -0700 (PDT)
X-Received: by 2002:a05:693c:4144:10b0:33f:ddda:6076 with SMTP id 5a478bee46e88-340039b21d8mr1392540eec.6.1790240763930;
        Thu, 24 Sep 2026 02:06:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e90ec54d8sm12602799eec.0.2026.09.24.02.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:06:03 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:05:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
Message-ID: <arTn9HKZGNSUxt0j@QCOM-aGQu4IUr3Y>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzOCBTYWx0ZWRfXxgSWSehT50zp
 LOIhS+Qpng0PkXKeOkR3VT5747uFnJDjkyoyim+loIuMlcLIVyG9VOstW47fJl7JxKOcJmSEJpP
 6QP0drF8MfXnWp8rTDjmeYlkFWmh4fpZvWsLMopJODeyaOzoR78Ae3KbyBlLLAOnS/Oy3rOb1n3
 VxX0tDQlEW3z0vPunpN4EPUWkeKcpFoLzn1jQHk0DdwwUMh/CKw4g2ciaRwP0Yw5CXZHMOXxZx8
 FQWz6XOW+/rwkI+xCvDgctBzeXgRo6YqW5sV02lt98yYOLyaEzcxlVmQDbXInkUELDKkMIti00q
 U7ON6/XbMe+Hz0ZcBMscXozwdidP7kHuUm3TUzxdORfe9p4P73XCGDdmZxAkcAnhrRrhsp/PPwX
 Ngv2ZvTVX1qZyhjEuSJr2dvyq0QW2Sk1gon1bWE4K6DpXXUsajhmdY2hUngmXDglXBDbCjxPr+K
 t846ujk3pLNZfECYaDg==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4e7fd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=geveDRkZF6hWoGEvibMA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzOCBTYWx0ZWRfX8+lbydAF6gnC
 o7dGPfw9tbTfGehW6qFTYusvo29/8x9GViF/gTLaav8Yu7L3/qgj/xV24K+Gc+M/P67yQh9/78k
 yWRrPaos8v8G5io6XdA0g4E4NG0aegg=
X-Proofpoint-GUID: dKnH0p9c29zqoua9kp9s9SKISLPDgYWJ
X-Proofpoint-ORIG-GUID: dKnH0p9c29zqoua9kp9s9SKISLPDgYWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240038

On Thu, Sep 24, 2026 at 12:51:33AM +0530, Taniya Das wrote:
> Add support for the DisplayPort Receiver (DPRX) clock controllers on
> Nord devices. There are two identical DPRX clock controller
> instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
> audio, AHB and video memory paths, along with core PLLs.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

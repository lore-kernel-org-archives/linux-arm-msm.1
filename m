Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B769B37F756
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 19:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572830; cv=none; b=pFri4n/5FnO9UVlDqVmZu5owBZaU1zwCFZiiHc4qcIrbXRkg6zE/9kdOTQb6BRO+wYAJvJxrV/lQ1asURjV0HYlrglXZx+itHeB8FKcEU7qrzob6smqNlN35OU63citY/I61Gl38twFEWH5w45n36HwhnV5skIexRdvNOfN4mEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572830; c=relaxed/simple;
	bh=4DYl81kZlsuBgH9Cq6P3j2EEwAY76sVSxzqBLH4OTgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+JB/1PkkNsGx6W9MYD3Ux8F+8bWejEn1WkaJhcIzWoKR9DJzcCkOitZnDOHaYEurFlEBKiJA31zY7Kn+nGt6SkgkUpo2Mb60tTdoRTvchH+GOs+/dyfOVW5lG51EEIYbeLcTaeXqqWOQ/TakJZ67fDl44DU8NDtvmmTZgLrNx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WrLeFETa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P6xc6MHd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WrLeFETa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P6xc6MHd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZThu3477818
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 19:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rAx7zopvulLjm7Hc/dyluOi0
	kS3PVntTNHMshaG6O6s=; b=WrLeFETag5DPDLFdA6mGDsVLV0bkODfX9ZjQHCV7
	i5pQG2LdKOpRNtDIPKZw2YhA7jf6MA7vNU+R1zR6RRxa9QB63UfjEc46bevULuZ0
	wZdyg4FIigoEe49OqM1PvmQhBM+5MhgaQf0FldvscMNF7GWHLSKEsqmfbGNm7BhI
	l2I2gqVa3DpwuR0OrId4kBE6oZJ641x6L/lPm7ZmHTBYeSScZ7MFUv091w6f4K2J
	wXLO58J0kcPUxpvzmRM++Bdr10Uj1Xl2zPGJc/8NdeRk4DI8+HdK3lcrhHNEHGjt
	O6lKO5B/0rzZFjGlW1GV1RNNIz4gdnA1LEimt/KICpRUQg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t80bvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 19:07:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bf4c0af4eso483010485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 12:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791572827; x=1792177627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rAx7zopvulLjm7Hc/dyluOi0kS3PVntTNHMshaG6O6s=;
        b=P6xc6MHd203qinrFvLBW4VO9qNbH9qGjRhUHNTnVo/XNgJGPY1x8ZD4PhJtpY9cFLJ
         BtxIYJcPArJLrYTE4ZvYO7lKfMLzoGt8BdGpt3vuqfv4dO4diWaMDwKejmuPkcnGl6zJ
         MEDc3tcRH/iJPrl5lBBbqGBzbsPTnqdawr0cjUG0ZENf2VkJ7S+VK8K2DqI+LaJwNUKj
         6ouT7nsrl2zAcG/zGK665v+gD85udWz7l7Zx0+Jc4TsvZuHoR+frSRkctQ3XHn4nHv7h
         eRofR9ANleE5yez46w+eOxDqwngIthKb0Br1w9nLTALdTrNsU/WHLvayVtLf5LzQlkB3
         ZXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791572827; x=1792177627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAx7zopvulLjm7Hc/dyluOi0kS3PVntTNHMshaG6O6s=;
        b=ZoYxMY5aqrM0EXK6Ywp2OJKir4K9qZHv4kC0AcZQ4R/6yDVH5R4+qDOX/Miw+9fORd
         HBM+/k0XUTeRZTPhjKPyhQ5BzgBBephpgF92qd2PdWEgp8UHW3u1RmB3b8dtJYEwmR0d
         0YGxUqCjdKtDDmyZt7KA89rO5A/ZVYhF6Mq5WtdEM1yDMziMxbNMIUDmXyGn0aKfnbmh
         QYRb1/7RS7QMwK2swhtlHV+xnkN0jaAhjMKilDWkIdEuYy2oGRL1UGfG4RYB7Yco0/We
         08epjC92qWi7DpkPWP0ShXXFsqfs9ohMPCc2aaVAjKAT2nim/XkmxS1rnBeL/7XtoPYX
         B63Q==
X-Forwarded-Encrypted: i=1; AKwUvBzZX66IRzDYoXitN/2DQTNzoDmF/4YOvXrewQwo68/e1U0o6oAmYxnaYTBOQ1llX5+ZcFRIzwM0fro2f07u@vger.kernel.org
X-Gm-Message-State: AFuF++k9t8UvE+PSA+Fu4dgZ92R66lcVu3wn0zMD2MzxZJ065UJzuY2S
	TDsiLEzzCkcEPCaDTNqfq8y6vG9O9Jx7pYgewB+xAP+JaLKSdPetI8x3mT7/syJwe13se/9BWhM
	qKoEYvRdtRim6Ae7T0dM+9sGr4O6eqKZDy7+KhAY8FVy73BW2P4pB9wKIag02UoFenuW7
X-Gm-Gg: AYBFou3DrBkltGPn8a4Hf+4Sio5YhO1H5x5LM4RGFRzYrVm8h5UK//RgxzsGBPBwDaG
	PG0HE2524YfQ8fgSWaIysJ3Cgn5Exp8t1RZdWuljYHy4XVmBFDmNNlFQnhvuJISelCUCg4nuxKY
	yw0iTAjipu5lE1rYg7asouKiEfRRp/josCW2znp9kcEq20CXtYcMJb8WqropOHwGM9n3xfryG4C
	oE+gGcQ3lZQtx1u8KhvGyzdIwkZOmgyAGeTxpjdPOmg6e9H2hCwKIQPt2A2y85rmp+H90WPzaEq
	pr2KH9aEa3aaTXEZW1zym5F8dbs+j/yIMZ6jiQl0n1Xvrunx2fI8V1QKf+dDSlpRrfit5wb6M/C
	kcBkkWANwj/WnLj0=
X-Received: by 2002:a05:620a:448e:b0:93c:65e3:df81 with SMTP id af79cd13be357-93eb95e3948mr523228085a.13.1791572826749;
        Fri, 09 Oct 2026 12:07:06 -0700 (PDT)
X-Received: by 2002:a05:620a:448e:b0:93c:65e3:df81 with SMTP id af79cd13be357-93eb95e3948mr523220585a.13.1791572826018;
        Fri, 09 Oct 2026 12:07:06 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac94c6sm5327825f8f.42.2026.10.09.12.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:07:05 -0700 (PDT)
Date: Fri, 9 Oct 2026 22:07:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
Message-ID: <vorbu5wtvnwxxd77lde7i53r72wu6wlta457ovvzso44rlgnnk@qa7egbe7mli3>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008081036.3492003-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfXxVVI2SvfckWf
 VATvPa5occaNBm64PfeIwSLaUTvvqiPhldbDrv9TiFG2M4/v/Xejo87p+yyylkucEgnJzUC2Jbf
 fLzK+EofDjcuwBO98Hv5pWJAXfIEAlI=
X-Authority-Analysis: v=2.4 cv=NPtAaE6g c=1 sm=1 tr=0 ts=6ac93b5b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: YfaY0M6UdGT4yc3zEOJ4UgbePFlvpfcI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX8JWzy5gFwPtH
 93owuOYSxTjn6l/dihNDFFeI6mONDXl+NL1vRi+f4O4uIL6ipSbukD51TDzGOohZp+BN2UM6jJt
 p7QT6qSBWQHUSqpuE7/s7UJXIAparnNKcZgp4u35skjV7+j6kCEQ//uAD3DbH9jp/wHGTUCG3WJ
 P63uzRsIzLWI7GExaLG/j1FhGBqa9j1vWCRDEU2GtQUTXGI29i7zthimKdqWg+pudVI5xpgPYk2
 717AYYz2LL172OeDAFjfW02y6rbOIC0JDB6jHLez0D8mjKhejdRoGH1xyRIlXK0UzPGcGaHvKIk
 uCjaAYF5A3MlbuDQCUtypTzZwknSEDp5yH5b+kL0oz3TNCI9GSpIGf+vklKSjUYHU+h10JUea3J
 T2JD1CUrZ0ieGyWMWcDRZnAXChpilog0C0SAPv1kk1rKNxmuD30+/aTrd3KxUnMeUlN1QmVlpAA
 v9cdAVw9thioGCjJm5w==
X-Proofpoint-ORIG-GUID: YfaY0M6UdGT4yc3zEOJ4UgbePFlvpfcI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090076

On 26-10-08 16:10:35, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> SM8750: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node instead passes the board XO and GCC_VIDEO_AHB_CLK,
> which is not an input of the controller.
> 
> Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
> clock. No functional change, GCC_VIDEO_AHB_CLK is enabled independently
> of this node.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

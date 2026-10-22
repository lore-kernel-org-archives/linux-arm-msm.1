Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655838;
	b=BY71Tqclh8FrDZTEpOlEqkCDOWELhYf3LAqoX8yX34qRw/US6Aq4DNXo2PqKYkxWd9fs
	 wr3qJh4vWLL2Cw8tNWrSyObA3f5DP/xt/O7PREz8KGWzzhNhSOTufSTpPmUc+CmG3E9eU
	 AkLIpB9OpaCvE5OaojqnOfDo4Rf6bFrA48Aepa5j5Z+W42R7XHbWUgr9gF6JsqOqVb8r1
	 K85jg4NNSJqUGIbAz+c/FZ6T2uiJAnv53G5yWhpae9yvWXG7+xMwIGGFSXsK/hExVN4ZK
	 vn6eWi1Ye+4BcCUstDWNGiAdkyuMYfNMyTSBnYleRi6jAhsJ9QfSvGrNLDZhpl8v0OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J/8G8u/GUEqT7hbge7ssUJBRPJYsFNJKrWSeXNi30Q0=;
	b=qT37xrl3fxVp+cpe/ocT95etWPgA9j28NDLk3+zA18BES0DjTqY9lqoLU544hSOHKoXj
	 kDtRs4JLS2NvN2w50WLHeE/owLVM1F1O8iPOmkZHIPRjUfwM1yO0gryCt712z5msouWem
	 RuTm/MXjxCc1NNc+52nFBdNY7PoZpM6RqEiIEWo9i50FNbNKBtNNrieit6P+L9QZ10IJj
	 /8sCaWfiyasp+ooceLWGBQvOm3Tbf6FtuBaT+o3WDuFiUZ9muQWJi+yoA3d0Qlo/Vh9pu
	 XQn5zXYTlA64O2OLzWW67YFsJEeWV8LaqtVzx/K0lwhT68FMxsAHn5Sx+YritoWqqfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ey0mmwdI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QxTi5qOy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EC4606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8EC4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ey0mmwdI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QxTi5qOy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70FMX2516191
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/8G8u/GUEqT7hbge7ssUJBRPJYsFNJKrWSeXNi30Q0=; b=Ey0mmwdIGvQ01Sx6
	4L1N6VQ9B66ThUSSp5oRGF0TM1LuUIpSFQdcJDgxDW0qDc5I6BktlskV+x58Rjui
	YKATMBnfwyoV0P+1fHLGXony60TXEs3CbqBwCsg1kAVU0KbH67qV7Ojpn3LnyZTp
	KvOJa9D6v6qgvSV9lw9AQWYb25bdhWkPcT9usBjiNktbLLpn41LsWHePPkhrxToe
	nYlFa7koonTz3ACgSBiOlsdUdTDJ6N8YHtBj6lWnL2fR55UgEczmfRJr6Wt/Nr69
	JPRJqPiMcwICnKoZBnzZtQ7cXSBhe3hG+ndKMZD8uwyxr49+bXSWZayIdtzqolLv
	vqWsVw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9bq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:57:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so37371985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 00:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792655836; x=1793260636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/8G8u/GUEqT7hbge7ssUJBRPJYsFNJKrWSeXNi30Q0=;
        b=QxTi5qOyh42Itp86UZAeExknuxu//wDA0xEJhAqdPtYl45cynBRplNhNlKJwAc66me
         iz9n+hd8tPD8O8JzjZ+YpRNBlikKev44/fxJXRohhDhs6NVoHWKmS3FO4WdT3E2TJ39v
         1zWwPZI0CQZ5+3g8KI98Bpf+ZkoSJwexGMyRSVUpVGIU2oHPlSLxX44tvjoaJdSyMewz
         e+00ilTo86PvDAYwY+CSU4gy9axNmt3qYWds3eh5mDZqvq16CGsSX3aWVGD65tHQEmnn
         10CS1WkZm6eIlrrzeOYdqoxAOohJPUCGcsvHsCkZeii5fLKoLQUmtxWTdDKxH7Lp52V7
         B7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655836; x=1793260636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/8G8u/GUEqT7hbge7ssUJBRPJYsFNJKrWSeXNi30Q0=;
        b=N/NuvKU53rIr0NL5TnHi6kjQnmGX9RAkZ4hQG1m4BMieaQCqSWMh01lwchGbhy3mDB
         i8sCQJfUollpgkod2hC+Bh3tEgzb+BQjMGC1KT9GMpAKUT0v/O+lazrdOUZfQQRdXA37
         VqljcjYhNR5L6xBu4H7lRiYGUfhSCJxlVzu1CP+xwb/plJxpdda9c9rtvpVZLLVr9uoe
         2tL8iyZL0y1kJPaykq3oONcssenirA524kaTD4CuctQaFpsbmVfzIldraxqMVQ/jYcUf
         9qxHKkBfWno947TIOLgpU4sJE2/LYcaX8AalQiCsyKdgMmscBF7mUJPGc0VRDF1/3yCB
         wqSA==
X-Forwarded-Encrypted: i=1; AKwUvByiouBasXhjV08QmlPaPNzTGmrIf3E62dtQ0bBRgRslOfc6zRS8/pjFCl6ZQKUkYY25StnS6EXUKk1Jcdh4@vger.kernel.org
X-Gm-Message-State: AFq9FYKVSduGBQnbd5lKLYUVzKcL55COSveS+6LLUpgN0wSALbIIlbn+
	C7/F1xaLHs3fZwBaVjzmPYddCTfA/DcZN1eu2KQ009TAVhziz+3hk77YnImHF8fP8LCQz+UBr0D
	wa4ym9lo/aSQ7Nr9n5fr2KVic3M5p+CJGpBpKoSOj+UA+sLo8+vbT+5TKC3snFRJhDxXn
X-Gm-Gg: AYBFou2OZ0ncRa+ghezStLWLdKcHB2VqU/jxFpvnYVxSc/ouM46FMUoNPQznrrTxrE7
	cN9PAsEjr/mAYCE3sGM9tdB71BK0IKI7rGaPm9Crbm6YcIwTTN2bn06MHj19yMC+ddlTN7eMdqw
	OLrDLNa4idy/+Zmaj9nZx4FvQOjtdF7j5V0uc0gcndFJs/zWqAMakuo4G+GGaHi+Ksxwcofp1yi
	VL4kWQSrBd1SRbzBVzIGG3kYi0d6xdTgbMjYmVQs1ShaviliX8mPAYu85KtEfTB/4h3dJN086gt
	7hV64QU+mqxY6nXW5uZcwY7y3R6K2ecSvAB+P7M37pwJ61ZbTsxXkt1bPgv9q2bnPjSVmSlauLx
	eWJz/uOpSULnQg7ykhs8WdQ==
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr929996585a.2.1792655835856;
        Thu, 22 Oct 2026 00:57:15 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr929994185a.2.1792655835451;
        Thu, 22 Oct 2026 00:57:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a61a2bcsm75777166b.87.2026.10.22.00.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:57:14 -0700 (PDT)
Message-ID: <1b31946a-9170-410c-b882-34e8b2b8c812@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:57:12 +0200
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
Subject: Re: [PATCH v2 1/3] clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to
 bi_tcxo
To: Sushmit Singh Rathore <sushmit718@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-2-sushmit718@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020142157.1749-2-sushmit718@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9c1dc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=9Jw45f44HywjUvPVWqEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: W15S6X1uYjtB24GPlq-0FbazdhRXXLMk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfXz5ULDjQhjTLR
 EcMoAguMTGb8IRnVFY8Z3x+zofinRRwHoMu1wVFarLedqWEOL0vJSQ6iwrGUlc9vdgZHb6S+ADC
 ZRbvIuCzSSvw0d9BrNA6bIS+LA2Oj/w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX2ba5Jm2ZgMCs
 GbiesMcMdPHDdRv3Rzuri5xCmq6cP3DqbAMeRrFRq8Uc9UNjJNv/SU8wk18vBqikU9HxSCIkJ11
 f2SQzEpTz3yE/mnaqOujzywAf0eY2Ey57ePG4i+v3W9zBT6Rlm7aGJkRbtoA7sxuWNjrSNBD17Q
 C3ihNbgrO7KEDaePClky1d/aC3PweUdjbS3mB82mXE4Y4smCzo82BxpeC41tkThIqGFK/91O9P/
 WS4jIIhMvrqd1zb76uvzWzBzvf5NaTdWrDeRkP6BB1XlX9zN0xaxHjhjaYGUiZd56alWimmCpoU
 +IfFjlnc6NHux8NzWLyYGOROm193geoGgxRcLXuHTA37uB22AoH2WUoDGaH4YzlZIqirrgKUeLW
 KkQRItNRUXOOh8USWpX/mQGg2jZH086k+7isOiVIKj70ch2VNKuXkrdCOYERrWeKLZTh+x6KX0m
 gUe4wMqi4RqAYP43Dpg==
X-Proofpoint-GUID: W15S6X1uYjtB24GPlq-0FbazdhRXXLMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220031

On 10/20/26 4:21 PM, Sushmit Singh Rathore wrote:
> gcc_eusb3_0_clkref_en gates the XO reference to the eUSB2 PHY, but it
> has no parent, so its rate reads as 0. On SM8475 the SNPS eUSB2 PHY
> takes this clock as its reference and rejects a 0 Hz rate as
> unsupported, so USB doesn't probe.
> 
> Parent it to bi_tcxo, as tcsrcc-sm8550 does for its clkref branches.
> 
> Fixes: db0c944ee92b ("clk: qcom: Add clock driver for SM8450")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


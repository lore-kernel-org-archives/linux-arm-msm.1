Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501647;
	b=graKhS35GfauIyYxQwE7jUBbhiFcl8NCaYAgjnMQ7buae6/Umfj81TQULs6YJWOTMaLk
	 dmZAlexjz3zJPQIv5+edMmGSKIrlTGWozOTG0txJRrSFJhQRuCTtUWJjgNzMQ0OMGv+Q0
	 N5saLfrH36Z7WqYPci922FqnZDdLuPGLJvP5nKD6MTQpswAM9LBOPyUUTwve6sKxY6/Ft
	 hPNGFw+EwS3blzOPBMs4pJ/qCx40h8iOoLXHam+9hyvCJ33D2e2sWVcHCm/rBKc8+VeyR
	 A1JrVIw+2pptgZmDFg0aBwoG+YV1o33ClwdzfE2kpfkX7CwrJIh+T6gbwi50/H/6tYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501647;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4gduBN8y/Akb5TuPhoYpqkFtKFLolNkjuTQDl1aV+6o=;
	b=tJkLHFpRBcmfqYPT6maw9hLn+KOonkYtgbE5zbptmOYFgVuKxENAYpc9kBHs0yBGnzeY
	 Vd8RfanxHaj78qK1qLPVlNUsfLN+ByAu4Rt+QxLQHSUaXStWNocsu3OFl7xpCjcAw+vEp
	 i9aMsEmbPdOFmT82rOO/k3q/fDIJANMvtBqkhEHo7aJ9LFtCKUFAuO9LlczxkztqSCZ3o
	 tJOtF1PCZOuEiU3m6+cPEEyslV0izRBCk4S0mgnoCz1b0puj/+lXjukw/Q5ulP/qPrpjR
	 V8bigBVbsHBvDG0UGuewJ1XpdyvtzRO+/lfX9LVUPTn7E8tn2KYodFZW2BeUAOvZ3TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAYYT4V8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsE37CBq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D65606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2D65606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAYYT4V8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsE37CBq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KCLSXm1625665
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4gduBN8y/Akb5TuPhoYpqkFt
	KFLolNkjuTQDl1aV+6o=; b=OAYYT4V8z50DfjzUMa+yqdRtNxhS9fwDbdY0tsw1
	VrTptOsnHlwyf6k4Z6VNuOOy/5pol8DVeORyuXsgKvrxvsZJdzbxVlQa+aCFSOLy
	8XURhBCgEg2hUMiZ8Z2uB1UiABvuuMp9Ma+i8ZKk0LlUQPIUK5bM1TYVt+vVSqVi
	kYKusc6VLSY0y7llVaI2qeN5Czt35Ao8l7uHJ2DF1ZWmnJZN+TLFER84Ust8R2/z
	SR0fXdHtB+BANj2foRnnKwfWmjk9AUg5SKkIuueslo9SbDh88JvZglY9u1r9GjtT
	D34/4g53Z0xIOjWZN92pj9HGlZvs9I96dDYUZs3j9rkQ2A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2ju5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:07:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cb9d27ddcfso850091137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501645; x=1793106445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4gduBN8y/Akb5TuPhoYpqkFtKFLolNkjuTQDl1aV+6o=;
        b=HsE37CBqjQo/lE3dvKlMwvywhZaN7OWN3zlmv1S8kepCH9tBR4P3wjqLVHkTLvrGch
         mXnrKhY57CiTueH8cqunisbTrOlKv52xbnP/6Qh6aOWV1P5jXwfB+D/k4T+aGAZjBHl+
         SU+jOUqpdPLcOsImMjB7Uelpj9mgPyfOdwZt0XOw9J3biT7TQ2Q3ixR21FqNjTlcNxTR
         thNZlr6lfd7fPNZJJEqyVWIh+Eq/aSbwfSobLtMhhhNaSBU3GojJIX3G5ngaTTx9Chml
         Il8kH4dUB4wOAoMuFEEXdLc1X/QrkdUgMh78uiJhabNt8zAVFZQkifuy4bRnrnBgLP/t
         Fj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501645; x=1793106445;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4gduBN8y/Akb5TuPhoYpqkFtKFLolNkjuTQDl1aV+6o=;
        b=cwUfYK8ae4ccejdvyzC7QsCWrtLLh63vU2/EQcE1tLM2tjxV3lvzhytc23ML9TVw41
         1WHSmkt7O4DPD+byPMKEzSxXXSPTV+Au+N4GJSZITMaKrrhmwjTWiMO7YOLbaDIZdvW8
         EjeQnLU/BaNprpsVEXy8wCHbljI7s3qs6tSuF83bmFIY2xloLG6houNsL4f4tDSQF2gE
         JbmJRVhxFPxEIh7sZzX0yqRp5qy2MFDGW+6M7NEGJ+PXi2zl3eyns1v7pSteVKC++Qwn
         sZ7WD/HXTN7z1LKlSTRlC0LfplYe3l+FRwMfOtFAA1y+K4LTeKEJR3jcg+l+v/X8F7ai
         xxXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrhsx7dcmdFQweEcGcZwQD3A/4+S1wfxFuNX8s0rzW9I0oDf/0xduTpSFM0g5pbra42seEzP+LpZFGCALO@vger.kernel.org
X-Gm-Message-State: AFq9FYLVAk2A9+O28+c9+XbcC2aQx0q6Ykr8DTJKTTXHVf/uvnk7/yQ+
	HN5bLbAYZ9lxRklL56mem6CklyBGGRMDhaTArwGDrA3UHBuCbUaInzI3BtqVv+GkkgAt7gY+eQn
	d4UW7JWQCiPthqsGR8u4KKACLs3VaBYg5AlCWm2T3nYho114N93Ol6WE+DveQjee04JqU
X-Gm-Gg: AYBFou2s4YQwerW4XzJFlbIiz9N3qranbNuJLzoH4XgpfXUecL8nqOkY9Qi44fLJpT/
	VoBNcaHYKv2XTIZ4UCu4gQ5CfdK92JWF1jV8d/lS0zU/nKRqqJLWX85FYPc+fWdDvisol+Hx4uB
	0dAr138rn7TmPgZ12YKCBZvbqxFGhiL1BlmzfH4Ccgtn24I3BvZ/Efba317RdWIkDs6AckWJKyB
	B5DtsU1DW8qPwfLuISN1cifQrCk8A7DGsmGzfjNLMFJfxBvEle2rutpsqf1Y7qUI/cBH7c718Ih
	x0q3U5LBUyV88h3Y6V9ytmF35UtqSS8LrL/+EWGfCeyM6xDJ0t4BTxDzRObNi9P4yzKTjP4X6UH
	2U/nuVhyVsDlrEesy
X-Received: by 2002:a05:6102:5809:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7cc3697d329mr2732877137.15.1792501644910;
        Tue, 20 Oct 2026 06:07:24 -0700 (PDT)
X-Received: by 2002:a05:6102:5809:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7cc3697d329mr2732853137.15.1792501644217;
        Tue, 20 Oct 2026 06:07:24 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d324f8sm64448535e9.6.2026.10.20.06.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:07:23 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:07:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sdm670: Use ICC tag defines
Message-ID: <lxtdscpjqwmu3gt4rbdkiumzi6yv464izxx7atwfcar7fabit7@rsrp5sfxlr6o>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-4-cae8d22649ac@oss.qualcomm.com>
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
In-Reply-To: <20261020-topic-icc_defines_ao-v1-4-cae8d22649ac@oss.qualcomm.com>
X-Proofpoint-GUID: y7AQl5yd6TkrCTHLA0BuR4fW6XIGOIoc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX4cYxwWuCvkZA
 c9EaoA9lke2ctPYCcQbbK+CXCiDYUVuJK+XGlKESpw8qD0cJpVyuRPMZmHm6fBpJB18/ELQDU4x
 ip3txy22A48EjCANQgpeZo2OlqCD2Eo=
X-Proofpoint-ORIG-GUID: y7AQl5yd6TkrCTHLA0BuR4fW6XIGOIoc
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad7678d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=i2oNlF0cj4oJyyjMQKYA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfXyvfpKTXLkZAk
 S6iYQzqZkepmYVzyO0Fx/+26KtbXqiSOokJtZYKJ/iOC42aljC4Y6KfcGw5FGdf/9xzzb5a7x6z
 Ln7U1wk919XKGnVC5B+yCGgC6cFbcAlKq+iq0Me+6dRxzKKV9/+wcvtUxAINogmH2F51NgMzxzC
 fn0R6KinlhBPbaLvihKyNSWmwaQ3OCKJhAjGRginHfOI+ijbpTUST2jyt4u5Mma3vOcBhi4c/mP
 79SXNVl4uvuVQYdflA/eUnytrC+0bciZoIQEyQTys5x6UAIqPpA701Wr8jQWMG+MJxD/2ls9sme
 KPrCBNftJ3zrktiiC56jqveCZXzr/9tFfGd3NMmsdXVGhrzA4wxO6MIj5Vz0jNl9Sb97ROtnyeR
 wRkqhCkoA14+5DxQWWMwyOYjCe5pua9BpthlhDIM3oSwunzdZnphIHIRBZMQLhexSLjEz3QV4sm
 XdW44egIvBponXeN0mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 14:42:08, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The magic values come from dt-bindings. Use the existing defines to
> demistify them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

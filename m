Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501632;
	b=0ueja/a0nQnLTn5dy7ThwlgqsV51ne4jsL04zsVgQa+8RE+/0Gjv83GJDYvPWl/w830G
	 bOOXP0utvwQd96IDq5vjpMXyBokv4UYXC43q1LoAgAH1DBhpNxGSwICoC5fOJPmA+/e2N
	 MySR1TSF4xdzgEuxdjxzVAST9ViDvuVHNW+rQaGrjOQTsW0FylE3TEHlQIXNeTKATQhRc
	 8gJ1mDoHiEjveNrs90wTIJnUP8L20H0dL75UZGrdFM/P5THXd1s7yqFy77cZaoS4777HP
	 7n25ozvbYPrlt3fNRLE1rRLLTWrUKffNMNHF1AfZTAgmropOHSXzMoZ76LuYYzcE/Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501632;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SGCLimzuaJwjAPK6tsNiAwtxFv6nKdVZflN0Nff4aOg=;
	b=XoGwWxZuqH0EioixS1v4Fl7L8Z5e9ZkoYkJRW2IX9taNLbBcHt1LPlDAmcqeJHDd/f1d
	 FZrQVSVXueoKtE/Ap3zIjKGnDSYgM1dPnj4XBOJ7QPgdYWZ1kCEI5mODXg1XR4OLtb7N0
	 9OhyifY899pjafkEFgeEX1FqhA11gbkaF3O6J8OJvC71SSF3OLvqYj7BholrD2Ob6hNhh
	 4l4V3JLa6f+PYsVwMbiGlI32JQ1NG5mwz3ZmxRLo/httmrZoqRH/+QYvi8KPGBQa9Vd6L
	 1Pgr/7S6piiQW3eu83lFx8mB9+F1lr00YIAJEL5rryCbXu8yTiC0orV18BM2b/RIlsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GdyKHJM+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NrKaBdi9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3429B606A319
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3429B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GdyKHJM+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NrKaBdi9
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxZV3927001
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SGCLimzuaJwjAPK6tsNiAwtx
	Fv6nKdVZflN0Nff4aOg=; b=GdyKHJM+TDw3hI99G8P5HySP6jbcJCQRXZs5wBtF
	WywCWLmHVGpcxYm35cgmlcCmn7Y7T8K2LSzRvexES8GA/kJLJPLCSz4bVHkRaVR9
	PFDAB1AmVJ1ierm4tO2MtLoZGf3HpHBsLkSpS6bes6VxqcrnNxfPIPWFx3Xtjtgt
	nqOaFUXRDH/MItm9ZY04dQpOEZ/8l/P/GTfPR/UVTbX5NDWtVN+gCsG0qBdPoc04
	lv03Fi81WlxSeOzLJJjs05jPSB5EiNDn4wsYF8rVzYNTjJmPeJ4YkQG6aD05VJFE
	cfil/Y5C1Ud4NZ+1IXu2+QRN1xiOxY6Paoxq341a0X4XcQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pak70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:07:11 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98909a978b9so451448241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501630; x=1793106430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SGCLimzuaJwjAPK6tsNiAwtxFv6nKdVZflN0Nff4aOg=;
        b=NrKaBdi9QrwN+aZGMSXRNIh+aJDUNPJ0s+W1JlUNWW/C+JqyucboBUKDC7I8t1ER3Z
         AhKu1tAC0OHPS/w65qsylI4AzlbJ41BUIbXS4sdg5lc9UCAwn9EYfZM98dnvjSjYc1Rw
         WSazPQnYu4Yff7R6pNNaE52MVqVjFqUud/Y04MbowoSjVVPOkkiuKiuoj+plHddVwsCP
         EY+zyVXtiE3Y1vlzojYrLENQvU5L+VvJi5/WdScyjUUWKPbVWgSIlJa8/bS3eCnoZ1nZ
         rE2o7Q+qhKs80BRiqt2QTXILB/GMclmoi15uzGUHBxD+FT83QPRJQk8sSXSuiixamkDs
         J0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501630; x=1793106430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SGCLimzuaJwjAPK6tsNiAwtxFv6nKdVZflN0Nff4aOg=;
        b=N5nZzZkbTFUgXKLCpMljW7aaU5OL1oGwmaU+mjKBnJ6iHIqokFDxSzaZkqFdc5cKZC
         uly7PUihDPdkvKwlYeOqixeFb9EbQh+CAapPvbU0MvOkwcCEdNGfe3vt7CUee4WBX0B4
         N+WujEOcf0m2PQ3ekZGo+G3cvgL60+IFV8QUEqltMbN8t4pNEQqDHCNtYfVR0cvasZ/i
         hEp6wC+tDZi4uL+SUmv/4qPmzxZz78+qDgslSzDPpBbmr0lwE0y32o8WalD25T3YNYDz
         v4hQdmexYbBy0qv2JtXGmuW4PdveOjNkRwz29SbEWvu2H3MLmfr+L64vym/IJjw+TQYh
         /kfA==
X-Forwarded-Encrypted: i=1; AKwUvBz+Hk9p2JJW+u/obQETRF6nZhS5Pr9pEZtoBQogNGK6+0u82hBmqctzR0YCyF0PHc5whVIk4fegjcn+okyK@vger.kernel.org
X-Gm-Message-State: AFq9FYIgmSeWyTtCUqNUVetCFp3JzGZ7cIGMXzpXu8lfy4ZXsEyB5BZO
	6v+R/k+UbGpbxs13sxKUxS3k+RAXFYgFAcahuAJBjEkbGTOY9Oi590AjOU+QhbVGgWLbJu5j/hz
	zEi6X+yWGdKKknu0q1ciRKQK23I7kIHiIUuOfLBRCh6gBJwypdUjqmy7Smi/29yr5BYTH
X-Gm-Gg: AYBFou0+aFJo/kxnA7NPAhH7YFzB60hk0cpx/YS4JCP1B3xFGQHTLHxXMGh0KbjHPpf
	d6gF63NG02vBJaLtKeZ/LWYhcE4qxa0oaNQURHmdGbCJy4W0LN/afkcS3fupSQrua/bZRG/EUC3
	efV+7/Pmm1f5Bttd5Dr84O7GGiW2BfidP5+oxI0cNzbGXjcC1aJjcF0Z6boiWt5Ltd+uLIrir0J
	L8+j5S5LW9l39+uexiII7ln5QLfZnR0FE3uKUQEY0esgbpOa+oeZH59b6RmXgbREsvcHpUWp2fC
	N1R4CW9xbROswgFgaGxdBcLStXEYNlCo8bSAJ0ULdlGqSK0G4jJvb+pB0cZt3MubrhCEivvazb8
	UvfBQhGQmPCa5T2oJ
X-Received: by 2002:a05:6102:5249:b0:7cc:2a3c:9a33 with SMTP id ada2fe7eead31-7cc36b49079mr2485513137.34.1792501630206;
        Tue, 20 Oct 2026 06:07:10 -0700 (PDT)
X-Received: by 2002:a05:6102:5249:b0:7cc:2a3c:9a33 with SMTP id ada2fe7eead31-7cc36b49079mr2485502137.34.1792501629023;
        Tue, 20 Oct 2026 06:07:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm76533525e9.13.2026.10.20.06.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:07:08 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:07:07 +0300
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
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sc8180x: Use ICC tag defines
Message-ID: <oeccvssjstt3o7pxautzzd7wa7ngo4aey32pahbca3vyoskonz@oyl3hqabwbgz>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-3-cae8d22649ac@oss.qualcomm.com>
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
In-Reply-To: <20261020-topic-icc_defines_ao-v1-3-cae8d22649ac@oss.qualcomm.com>
X-Proofpoint-GUID: MHrOj6eRDENlRNucczLIh9pD5WnoZWzb
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad7677f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=R4b9nUW322TDey9Zsr0A:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX9U8+zAcGSPuf
 vJ6FpsEhgGBvQgUawNFyjJdr+10m4XMkiU24ZWwrUnDZYr9muo5KREwu5Ckqo9dxwgT5NmcmCN2
 Zd0Igb4zT27QzZIDA3eRiIaZTzIv2qvCBTMxMgSPIw1ERBE6dh+6IHnzwPl+ei54HuepajkGnBg
 1jz2u1ECIrJEBtXq75fqGa9JMeF/LfMVwOw2ps2V1Zm4z7gWjlg6nz8nNgg6uSoh0XmP9iQ6Glj
 CD7HgCeDD48f+suEyMMr/hz2YG6wlcEkglfm7Zsuhj6Ggb2Qt/VjEl2r5nzlXDNs/dVt70KIylE
 cfiJuDEZ1ebAMf+YWJF3kPNbQOYaaVtSsuoNrOst+zPrdhd/sQGx8I9Fh89m6My5lH7Wvz9dy4r
 KqwqBSOnGWtAI7R4nVDWGMnnNwjg2FRX06E8kRLLlSSW0JUFBm5iHYYeia5aWjQ3BifSvpEUGT4
 biDTan5QH0fqXuWdJnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfXxDWIAMxrTB52
 rt5XBcAzmCfl7mtETanx9ybe1jKB3K+pU4yeHOgOmK4B/p7DpvyluA/NQhoRQVeG8zW/xtgrlXy
 EVFUeQEWmZp8OoReRN6Mnq0LBInpjf8=
X-Proofpoint-ORIG-GUID: MHrOj6eRDENlRNucczLIh9pD5WnoZWzb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-20 14:42:07, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The magic values come from dt-bindings. Use the existing defines to
> demistify them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

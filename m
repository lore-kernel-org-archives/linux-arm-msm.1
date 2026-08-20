Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D91403E88
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219143; cv=none; b=jiX34sJq9ORtdKMrOmMCE8VY4ykc6C79lS2GCRpdJs0L54dHc1NiBSKMHdmZZvzE8JSSYU30H+LE+RHiDtLjwfKVO4qBGga+WlTp1M7lL1rSqKpQFbN7euKjPyJLgze3LUqDeAiuTTYCCwHsc8VnncmpkbJR6efguTMllHSyvus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219143; c=relaxed/simple;
	bh=F161C/DF7UsWl4q0rXRwFx+clFgLr4p1LFk0d0V9LXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUsaYSxqnIYWYjnVoQI8roJDpQ7LYhVYP8bJO9AJChFk6DhnbrJ+zbZkvhlFO0+0q0lvZRjUrBhva3Wt0gHKWIHZ6SwXpHKHjoXQ/+fdPVRuk6T/n1V3pmucTdmObOuox+Xh+vOoBQXK55ZACwYVad7AuDfyvmYNTvnqBLmf7NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/aYZdNy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PcyvdNY0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/aYZdNy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PcyvdNY0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K7LE992753055
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mwz10jy+CVBwE4oPoSVTPynJ
	KSyyVze/J1ci64l4CYw=; b=P/aYZdNyKy5urz5ckFVsyBRjyUkbEhyB509oOQR6
	19BR2BqgdBzDTqPH5wWczlg7Y9WkWV+Yjy49uKqWDdhK0zkAPE99rbJeffSpXSLu
	MLb/V64ACes/DZf53qLeQE6IE0qfBceHoVzpQXCWbVl8VH5/Lx5UZaY2LsT1Rp/H
	fWw26lHhGchrlXA5kfejmeTQj6EIvajxYRv+P4g7IeWIODTx+E1UyGeYtNsdBq8e
	XqrgxNv8DgUGbcj4uUFzGKNMs72V0VSRmbp4lcjPwOpe4mPg4BmqhkxiJW6ww8YV
	hcuQeZcDyX25ZfqHGNC4bHkYF+BLelTj9tvmQ+vU92tKIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w498hfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:45:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e695a3b28so83579885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 02:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787219132; x=1787823932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mwz10jy+CVBwE4oPoSVTPynJKSyyVze/J1ci64l4CYw=;
        b=PcyvdNY06TcXYosvuMbha1kFXWVxeEvnENjYg2D0vudubM1xd/DBn1SONzSQ6IB1RH
         bFNxuDxa7ajZWgmTdpTNBi3dNG5IjRAoJMyclTc58Rb1daBDZdpmX0tINFaHHzIxYSZs
         D3tARZeaq8sKU6p/tUmILLoTDprMniQrXAo1G63OGSFs41WX4KbNvjCxI+SWzCi8XxA0
         SFJv71Go9KmDHRCYtthJlsVQ6iRzcRPlccQxq/2JWCygVmxumPBX33oKUfwsaJJtR7XF
         5pewl/hJWFPJhwlJTiMxNmWh5IjRsJ9gjfSfFhKY/lLgdngxwu/vZ1FhPeW6cUgju2bt
         Bydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219132; x=1787823932;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mwz10jy+CVBwE4oPoSVTPynJKSyyVze/J1ci64l4CYw=;
        b=cKHz+gE7IlKPsuEBiy0hTKHkWRncUcazdPzDq1SipMUav/y/vIokrDOYkjp9jV7qlI
         r+Z0Dmj8LyH6jE46dAhiOqMxyPAw2TPSGcCTVGCsyjasM3krln0/Qk+JZi3LprvAR78Q
         g/dSAuD7baqa5HILKwSZiNmoz4RFJtZd0aughPaSURJgPrB724KqRIHI54I/2yyFcBIf
         56nhd20DiSHqL0y3tDezZvV/yzXCGkLVz+XzrycX3mLbYGoBAHdFFAgyDfiVwV98uC42
         hCAbj81H1n84y2/F0JYppBNjAq4L4/vGWhqgKLuT13Oj7y+M0XGX72m3p63eUhdbwn3s
         yU5w==
X-Forwarded-Encrypted: i=1; AHgh+Rr9OQRRDedA6SZjjaowWMkGEkSF3PgHE/ZC+vCNoa8Xq+cEdCQHMqzF5EM58oBA7zlJqP9twwhxDINheOov@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc9UNzJTqkxs0lRCqg9rlw5/yRSOBKi5BGPPLtxFGqbVG5YEA9
	K6LsW1QAzhkGmdVkqQIZO5Kc7/GSeEAc1aWQnlAn2igBTuqB458rHWXjnZaG6XnW8mb0uAuzVbO
	TjKOo2BWqUNJV29FTwpPfOOC7mMcZ6/UCWCcbrSxM0/BwSJZpM5fEfJdak9acbvusbuXahYWRYv
	xH37L87A==
X-Gm-Gg: AR+sD11jTMaNhXDyTxGTQW206fHIjbjKO1kw20EEveic3hTSv2cF7YmAMRdBJfGWnUA
	9J2bNezDtisIWe+DUQGRBB+cvRVLN528+o/sxREDj76N5tmPRsm8h8XVlHNeSCYp5y3MIezfph9
	CEfmDZr3I8VuVzMNkG2mVLemY8d2QPhIEtWesnNT5uw2XlYJ2034tenrmCxEDR1hRPf7Xvak5IM
	wY/ZyV17p/hLRP0Aco+F/4EPhovVtWo22iLNNk704iLWrj6tY7SNqkc+fnakqo0ziEaNWm67Hs7
	Exn7V+x1S8b8bhSTjhNED53dENEx+6ysSZn78fmgff/DeFoVUiC89bkWYcZSI6ESX1BDFbdIqBa
	0rCapLnIEJkuB7jY=
X-Received: by 2002:a05:620a:438a:b0:933:ade:2daf with SMTP id af79cd13be357-9372852ccf6mr525662185a.18.1787219131651;
        Thu, 20 Aug 2026 02:45:31 -0700 (PDT)
X-Received: by 2002:a05:620a:438a:b0:933:ade:2daf with SMTP id af79cd13be357-9372852ccf6mr525658585a.18.1787219131095;
        Thu, 20 Aug 2026 02:45:31 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17fc80sm143880535e9.14.2026.08.20.02.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:45:30 -0700 (PDT)
Date: Thu, 20 Aug 2026 12:45:28 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
Message-ID: <dolyrylefweb6mwiingm3rh5ledf5x7mxngfho5czrvcymfpcx@lkntygnphbht>
References: <20260820-shikra_dtpm-v2-1-bc6698564ed5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-shikra_dtpm-v2-1-bc6698564ed5@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3MSBTYWx0ZWRfX1/0aomBwCFp0
 Fpw0zweb6EEcSQVlwKcKmTI83a6/4wAyKa0JHCK0L0KQf50OhyVjjMKHJWFbUiexr/bfUYGDWOU
 jy+/qGMPISE9amjqB4imt4vpdV1UGp8=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a86ccbc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VPIKziwejObZ-StCHZ4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: LqsE1jU5kQkKqYIl0jbn0ly9Z1jCA_nL
X-Proofpoint-GUID: LqsE1jU5kQkKqYIl0jbn0ly9Z1jCA_nL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3MSBTYWx0ZWRfXwTHf9FJgIQHV
 2cgaMsvB3KvI/0wHbDW+ZEUiBA6fUgzOKV6FZ80P6N0J+e/yD51Kg+PpFzL2f3SNEZK98WfBm6p
 e9A1PcR5AZKsyp97N1zqfoBEnk2aRpBVENboOFjQiS5h1cdNXjtusZl4jOaIZIrLFCFUFliIY4g
 N8cHnL45YMNRdtaeOn9QM93ph8enmy2LMSRlhri3qepwrT9dIUQD/WqKzLuibH65tSqq99vTO3q
 lF/w0PT3kSyDDvMWEpGr4Ld7mYbj5SRHuzyLx8WDLbdRdnitAXsW8SDZPC9xNH3kNCGR9snvDqB
 QxcPpXG1S6j6lNxcWGQ2vKzYef7gZKj5vw/NDM5+VU27iDa81LXYKVMbznKkHDU2KZkSTXmE6FS
 je2DojqAuawheveP1AIdFnnV/4ElbfiKoG9zSkdnNnMoIpgq64vWs612hQvoy/pjb3cXArUWgQG
 n9CFtfiNdtiZ+Am3itg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200071

On 26-08-20 15:08:00, Khalid Faisal Ansari wrote:
> The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
> connected via SPI5. Enable the SPI controller and add the TPM node
> with the ST33HTPM compatible and a 20 MHz max clock.
> 
> This change requires SPI5 to be enabled in shikra-evk.dtsi [1].
> 
> [1] https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

Please give reviewers some time to review before you send another
version.

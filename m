Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447344;
	b=KPw+sJLHHa0pNA3TtUYMTwwpR+0J9ihkx/9IoUYlaTBV1l8b7SsiZOTVdH74Ycshw3Ih
	 fLGL+XnxAxqoyOZByIGhqg6v7xec6+l3+peMC2PJ65jBioBqcekM0aHAf+iNJ+zwR2WZj
	 6CCv92tXvZHuaIDkIm0Cy4pm0fvcL4gOxW54aA79xmMBPY3bnE/AIEKr6AMhuXk5eocUg
	 XKvKb8hnqziQeso/gIyOz54MnROu9hk/lFSmqwd3+B1RdHgZ47/9OGgPlVrkN0jwTbUQS
	 3zYgVD9h96x3ubXPYZ07EmVAIHRHWf0GzjCgPM3aJMWjcgllIobBmVUa5qjphiD425w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7n3kUpad1a1JshKPPgB23JOaJaNZsFOqYQ9qFtOn8h4=;
	b=VEYNnOMFPCPwceQMYRHHbsxtSN6t8SJTi/4bKTqLh/ywDzRZq6mUgFehsD/i9gmZ7fhB
	 DDWEshFgIJ35rODlnZI76n2kUXCGMWNl9A/SO0nCkdl+5R7CGCx8heHM+VV3lIDL3dSeb
	 j834ihMAChtl8p03/CHO+5IoT+k1vWL9wqENInVuNWWQ3tgHs7Rf98BOimlbH1wln2sp5
	 kMzW1WFwtJw/QDa1QYh1MryJijN/ScjXrO4eE7oBAUqQReDeDs03edHn6kjIGoIuorkmU
	 tTID2UTIEh6WjJ/dlb/9Me0jwIz0pITCxzTpxE9MIIhs/0+0SFJc16/fjPQf+YRruZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZcnUk8H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kq3Mdtg3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310FE606A327
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 310FE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZcnUk8H;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kq3Mdtg3
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL6op2369534
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7n3kUpad1a1JshKPPgB23JOaJaNZsFOqYQ9qFtOn8h4=; b=nZcnUk8HF7vf2ziG
	a4G21tYe24cDEjoNAnHetQSn0W6TlchgP0dYkjhnLe9SSVug3VU6yapv2Ko7e3CH
	nUMp6ySaV0IAPp+zIrafUyhrbX+wTRurtdV3SqEox2MgynV+H1y9kgjuIKp16r/x
	hiInbHLghkmvnbIc/KNa5AgwMs0dZin1Fz+tesO90c8pRGaHcodZklAgc9GybcIx
	dDG/iej+RTFWdN1VrxyX1yuj52xh20VfLxN4fiU2s50Azxx/QpiYRNXpUx/EMEQP
	IntS6kzkK5CaG48iKzMZsZOQ+wcBJP761dpdVyMCs29FJK+TWu8c76E9d9VKZhzu
	ISUGyQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pa0pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:22:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495f7e03b9so26470085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447342; x=1796052142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7n3kUpad1a1JshKPPgB23JOaJaNZsFOqYQ9qFtOn8h4=;
        b=kq3Mdtg3nsGP+Whu1h2Qz05EEayizadmY7WOHH6D4nDHPpJGpLHwIjrHYa1ib1yoEq
         /hYs9iuECUzIILZnJ+b9/GxzDMD28nE7k1i8gHDOMON8MXl/1vjiWDTw020/t/p8slDp
         2W1tcz5jOObvKS6ttWrlPfp6mAO8+HO0poRKNgpKvJ5EU1nkJ3m49U1HPdwixWGcSZOO
         RhaPn1kb67WnnYOjicuj09U7oehup/16DJSLmY0wKnJPAjOWYCpMg1ozIidYf5vEnIpl
         7TuZL2niDO5rGj4jdEpGGoyCrLlPpFhAdM/wMBv2Vr2UhzEd1QFQ0sV4dtXc8TQBHKTk
         /lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447342; x=1796052142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7n3kUpad1a1JshKPPgB23JOaJaNZsFOqYQ9qFtOn8h4=;
        b=sjCX+IMO72vPdy3R4e7iCflkefh1pS184d3KF7Hw/1faEP8nqLCHdvIAF1dGeGHq5b
         10JVhXs853At7fd+gFziiRPkrhWCe9r4tX3pXvjnvHNR0Zkc36e3F200TTslY0pEdsas
         DgJR55wok1QXqR5H6upwbe3hQUI6oyeBzU+Ho2GCsl3QMBGjVe+/eEmpC4xSfvxVHQv5
         OLGP7hKBSNQ6WUxnVA4ueyW7r40GPfFVSeSWnrVO+5YYgyjsftNTeNMqZikKy1Fl/SwH
         CdEfT5QMoCndDsXvLATNeZQvnLQDj2DtQudCUv5jb9145tb9EgvYa8Fn5I82aGrmgYUb
         V0Wg==
X-Gm-Message-State: APuU4Z8EyEPEI9MBCIAjS5LhfSzKKrBXIF+G3ohjxHEqGAKDwZw/FXKt
	2HWLCxpfvwNrCNpHIDA5k1Dd6lXDWmP82IqSM+41MVnjV57prlhqhntGo4m675GtHo97+Eiq29P
	plID/tF2nQA7PrRb+n9fzfUKfej/BOy2eGBaLZ7SaSMXswVfXwtCR/AqresrklJKPA6YmfwWKl/
	pD
X-Gm-Gg: AZFdTZfqDRhEgQmLkIj0qQQX2pCXpe9YyrG6tyD21iwWt+8UG1S7sytYsNUnm39gV/s
	6IcPm+Q9zUoG74KFsV7l8r8iOOqu7uCfqkNM2EeZGOEvEtU5OhtI5pOwj1heb+IoVSF8ftod/xN
	JcAg6E+g2LUe18APgWs9JBqo4Ow2ADBrJREfdK/SjnbfT6QyYHaGSPflh8dl4GgtK+xXtlNJ+Bh
	WvWzep8V3Pv983qjZny+MJbqhTC3QqNV1blIDxR18vQ/Lu9HSPcMVkx6j0RE+mFtOqemPghNyno
	pT+evyKIcobSM773gzuyzZbEZcWiAo0YcejqzXR2XHvTK9nAmRqhB1Z6hlIHI/R4vD+zQa/6iZF
	hLb3D4V+41KVmiX0QJ909IG5Suo/vKRcs5jTOnacyllhEZnxPPTMt0nrNeOePWA9RiWSGjws=
X-Received: by 2002:a05:620a:6f82:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-949ba7fc843mr1901314985a.1.1795447342444;
        Mon, 23 Nov 2026 07:22:22 -0800 (PST)
X-Received: by 2002:a05:620a:6f82:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-949ba7fc843mr1901309785a.1.1795447341818;
        Mon, 23 Nov 2026 07:22:21 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm427828266b.84.2026.11.23.07.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:22:21 -0800 (PST)
Message-ID: <7a09b249-ac07-4868-9a62-fef4d8a547d7@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:22:19 +0100
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
Subject: Re: [PATCH v2 2/4] pinctrl: qcom: Enable by default MSM8917 and
 SAR2130P
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
 <20261123-b4-qcom-kconfig-unify-pinctrl-v2-2-958e205b1f60@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-2-958e205b1f60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX6gu4ZmJuDMkF
 NPJfo2+1ScrzUk7z1lCMww7A9uXRJMjhxGRETaOMORs3dxihQh5zAIJjlI8eQ8JIOUnQ+DsgRym
 7Lg18/sRvvzVa0aj6ZrggVH/iypxC6uSIxi2U8BMaGnue14CPlytmZPJxJFr8b4mFxchFVwmh5H
 52X3XUSvTswo4jOeHTDC8he6rwyXCnj9Z0JM0ycLhz07PJuncW/OP3kWYLKL6TIaweb/2WpE4D+
 vX8BLCFKeUXD1q7h8lhIgOS7VsoOM4oT6+LoWlj3Lq5VLVwci3N9m4i8OuVsrCKOMgW2aThZHfj
 D0N5eGLbHXYIE8VscOmtC4dKQXMp6KrMckxrR5CGakriTZNGQG247//1bzLAtkPPHDJhMxb/Z+h
 9p8NDLoM6z0d4d/Nhf6XFb/oxomV3zw4o18+hXGBTozFY3h0idXH0TYWEyx4c0jk6MbCNUuS2Cm
 5vk08hIKzAMJtVVTxkQ==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b045a2f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qJ9BVZF9c7qZnBjrwvsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: l8ZvHTDZwxyGyXcPI89aV8SUdphvqAWn
X-Proofpoint-ORIG-GUID: l8ZvHTDZwxyGyXcPI89aV8SUdphvqAWn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX9SHhA1qoZxQW
 Kd6c7nJa3cr6PbOsZfJlnadfZ/Bb8WkDn3I9L/9+bxYVpkB6/DFh+hj6WRk8MA0nKnMtnN1aMDr
 zw7yBj8FADs3NN7svSFlKicoj1CyUr8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230061

On 11/23/26 8:44 AM, Krzysztof Kozlowski wrote:
> The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
> essential for booting up SoCs and are not really optional for a given
> platform.  Kernel should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Enable by default pin controller drivers MSM8917 and SAR2130P SoCs to
> match above expectation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

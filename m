Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364642;
	b=3z5V+F1Mt1vzM7V9KbkrmJbukA8jU0NXWBox+H9cJ8YBfRmMhw5AjEtFzAyUlkjYCTOt
	 QrGljaWCX2EodbgQHbviqgJsJcUMKfMq8G271Ae3RcbUJiN9JbOhBiom1CGaV63kfB942
	 xpF5sWBD9ZDnOgAElXErDfdLKyq292jyBAJkkvZFx/7KGtzHS3k1HnPyljB8VLfAaTilJ
	 llur0rqwjjJEx45kK/XbSbQJsyE+dsVngtQbH+h/moYZv/kOzD6W7ByGQt0lPX2yktACB
	 ojCsoiyGImsVz2yWEmlhT6+wJjw9X3FnIDR68FC1dxr9FvrA/CZPCnOozvuG8ilHhAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364642;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pMlRakpe9kmQt25rmOummOqw5ijOCNsP1F1VTowhD/E=;
	b=WUwfidhYGjLYMu/avN8RzVSoxiH5fBChgZwRroANohgoJyd7+SwnmtWHquN2ANKqeOuS
	 R+31Grn/egT23ZyN1Q55zoZg73iOo3uBSSQf6XvHLKQg6Djro2TFG6O4mCqYxYnr4TwyF
	 HXSHZ1mIJuGvYhGAbfZnfobwdbPbCR5BccIacPNQ3asHXI9SYBZ4Nwfz9JiVnNkBz/r2M
	 gpCqfIrjtMAW3fFn4QTSkna69Fh35QUMDfvWCzeTX/GxiS68TpFwrGBPYFT3N9jiGk3dV
	 siQaDZFdXgp2US25GpoXbd2z7qHcvJ7wettb08xjXlHcOeRt28FECEbEmQCujmq3WRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eLH+G/ka";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SvWuNaml;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E74D60A381A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E74D60A381A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eLH+G/ka;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SvWuNaml
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGErL4144855
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pMlRakpe9kmQt25rmOummOqw5ijOCNsP1F1VTowhD/E=; b=eLH+G/kaDo+SOeNd
	hn9g3E3YnLyTcBrKc+V1QnaslwQCspq4tmkE07Ze65JVs8kJO5O/vrkHBULOwj5W
	S2GabPDHjQZjVTT5ENiqVi9Ub1F9czByGjjWhL0gfxdKoke7nyh5eFEoMtP7tuE0
	PEEJ5xKB/3ei6SMxd1aWXRmjl1zv4ix9W8KKQhul3fVWmbv9N++rQN2DlcNtiGT0
	JFtW+jAjXBa945fRvEaumaGi1ZBLUwaJGPYOjs/YH2aTuErzq4Jd7C6h2T1RW5Aj
	QIFw/69ckZYQgg3q1MK1671D1XZuQ82YpTpgs3nmRdF6lPgslF54bMpTWgQxwt+Z
	ZVOMog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme7532ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:50:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so18489885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 05:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364639; x=1793969439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMlRakpe9kmQt25rmOummOqw5ijOCNsP1F1VTowhD/E=;
        b=SvWuNamlfmolbeRTXoTaQ1EJc17sdw9nbR2uhdn4l4u0mu/sHL2gTW0F64BMHz0GXB
         C9yRP8RVMzwx5hY6wVbD0RHC1RybgFtXW3djXCmcpqpRir7JLSJ7Jwf3pqK+8i8ir1sE
         EiyZp/tP13U6NEO28duKibfpC8zZpAGroPUxEAB1H6O0AEltoxDsT5PioNCD7Lm3Sk7z
         Qe9RNQML7uadWf9K2uKJ8lq2QyWsI8dKW3aoxJZ/e2IVK6qVQ/+txcMHSYcZ0fRHjjSB
         CeLaDDQygtaCB5E3c9KVUQ61tZtOCIlueE/rBShoC0W3uXNULJdT5ehMfTiKVxaZVe2i
         jOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364639; x=1793969439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMlRakpe9kmQt25rmOummOqw5ijOCNsP1F1VTowhD/E=;
        b=oldyXCgctM2eKd9Zr6ll77zvr4le9vUujh7fpapkN3h3/cclGe1D8WaX8CuttaT1Zy
         95a84/s9oiBO24Lq2u83SnbSwnFN1O0LdzPLPXpvMlCL3lf8veTDlzkxywIWGT0YnZ3I
         NaYXRO1g2q40qP3ajaO37aWqAffVRO7RDBbFqtq7mJquW7l0mtkGQg03BiKn7JzF5GSe
         tTlS2HWgx/HJN8H4WTvuYQLG/p5s2KT5rftQ95MAMaeU0zOBMLCQmvaKr2FupcErBYHh
         3fDhVFhEiYsyfdBZM+BTvbhV6F8+BOCWfIHRrBzYud6DHZ7ivKM5JQic0S3oXT3S3QaZ
         1W4A==
X-Gm-Message-State: AFq9FYLJvaKb3Z2yFhgl3mmID9V4O3t9dScfPMiIdKkaabjzSp3ezsiv
	PR7xtXMMKK3411are7S3dYbToXJb5/1BUsKoVYpw2xhf4ESjbYFRYiccrN4tEe0Op4AS8/RQX7L
	b1yal7nqJIwwrvi48aEirYM65OQ1v4wj79s3ARQNWxoYFkxgMjgaOGR871/nn523IkrVd
X-Gm-Gg: AYBFou31wShIcSwjybw+Mk5T0Ag/xhSKvYTaqBGCnby3qXovEAgFVEZvVyFd6yEiJEq
	QYGuHB2k8/7tfXD9NaZsdkO76dz/iMe12nbn8WAYl8122GR4pYuh53w5GOTS6SLCcf2F81s/Nwr
	wuR3NzYaqTT5eHOv8ruTmTo7Mv7bt8cyVOVDXO/qyBQvAgsMLeYCx39omcwycathDBESs+2oLNq
	tfYz9z/vNSWjjUZdtoEAE21XtCHCHXrgpSnVZFvNsG4SvRjIs/DKo8/tjESpkEx+wrMm2FCGDJV
	rouZhOM3Bu6yDah1gpVbt2lZPDUgzZAGySk0jKcZFKDA+jKxzyxHuzxTcGbcRXxQSIJV/5pDWLN
	tT3/bLZ5UaG0x2K8rPn59zhGUdYNfm4LT6OHfLk3g9SAir9GOjyYevCSC0ApTOSDwx/byJNY=
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr357019085a.2.1793364639433;
        Fri, 30 Oct 2026 05:50:39 -0700 (PDT)
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr357016285a.2.1793364638962;
        Fri, 30 Oct 2026 05:50:38 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf43b0esm62382166b.85.2026.10.30.05.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:50:38 -0700 (PDT)
Message-ID: <21e77fd0-7e84-4173-a43d-f177be98427b@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:50:36 +0100
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
Subject: Re: [PATCH 1/5] arm64: dts: qcom: milos-nothing-asteroids: Enable UFS
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-1-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-1-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _kKgSBT0mSTp_oudLexcq8T1OVE0zNuJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX8Iyt5kR1gza0
 qCyy1vNzxC0d1PpjbhrPwC+gNqm3A9D2jSen0hrQah9aEHuPqtvU/bEvKDbavVv6mmYEMxCi3pa
 0Od6jnc2QtgaNIaY4gf4iHpv2xECLEF7IIJcg00/NMrClVf8RgikbZc0e8GOkS51HervwvEmP8k
 7vhrV/ZHhHg0+JyBDIetBDcfY6B3q6vlTj+E3NYVhIIck67YDEiL76BRofjjfyeQefzMq0SpJEK
 YAXB4/hIJbKJ4RoTIT8NEVqf987untWYA2uXzIpYeDLQu5vQ70YYri/muVOw3B7B+e1j224Z2F1
 iMN0dKNoVKCKU0zmlS1lMfnHrHCt253sofcEHqNutTtlvDBbXHN7htzh9pm0JIrOjLOaWz+qmnW
 HvhQNGk6ZZh2yih6LpotcB3AbBD+1Vr4IVzHrI7RcBOA4HvFW1Nerdao1pbr755kNd9AiIVHAxQ
 7GGY17aIPNfho1J+50Q==
X-Proofpoint-ORIG-GUID: _kKgSBT0mSTp_oudLexcq8T1OVE0zNuJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX2xK/e4WH1mlw
 yAUC54CIVQobku7oTi8ZbcOgMaxIn3mBskWU12zzZQh36qtYQ09B9BYyg2JLQb7K/gx4yo1LbFg
 uQ1wATTczOXtQTBwWFaQ99WlvlgqAGg=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae492a0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dMdhFRwUw7ASlwpx6HcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300051

On 10/29/26 11:33 PM, Alexander Koskovich wrote:
> Configure and enable the nodes for UFS, so that we can access the
> internal storage.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

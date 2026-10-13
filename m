Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935D73AF660
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880800; cv=none; b=H+KMmqv5qqBTioXJDv/7ggaMTdnb7utHEKXqoikEUnO0MtKP+2A7+YMlX1mzD5TrWhCRVy0QUE8EVAehow8qnFl3ceD+rovpwC9fV8VFDZeHUdDQC9Bm/J24NDeVhcdTIBVvJIt8eclM/BmSOuoyPXHXFlJeAPfAwsoQwC1Ixzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880800; c=relaxed/simple;
	bh=1aL7EQLDdLDEJ89Mg5MD5ZUMkF+ph76lnTDMWKkf4aU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F3xJ/ZzAw/M06FiWUgDJFziWogPLFqQL9DaVpg/m5yxHV1IsD/d3Gv+grJHuQ2leCHkfrEwdS8QenEsw9dXe0WoPw56s0/8vrIjy76AEbdlSVzWOizTxPSFAD+pf0uBUKFoZ83QIvl1qgwXKbmlyn2IkbzIENAjXrwlnyfSxH9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLkc5y0X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAPRoEm2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLkc5y0X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XAPRoEm2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OXVJ015278
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eNL7vgR4kDGeD5fPFGvpl05GH+Y/43WiLVBF8tPpz6M=; b=nLkc5y0XQPFD1mUJ
	sysjhMEBmQzsIDnt88JYqviIa6WrohOk1363fbZxP/QS/1rxks4/NQfmxFh7cEfy
	OUeaERIGqVFR2kukDs0FbS8IP1of8lbUjfO5jd1cBFdZCNTI/4OAniUq1MRoFmTb
	Dm4yCrW8faLWkO0iNXi7c5t5owEFnW8NA7G8ia3wNGz4JD2oYuN5Wgwgt6IC2kkT
	uy7hexJiVGkzPheO/Q3EngoHVLYwrK+jYLhcNbci6dcK+FyA9yANYYBlp1p5NIVD
	6Hv54PW3CZDkoWyjVKjcJcfUSQIaBZDosq98vnI+6ed/pgWGuPZ93oiesKvT9lgC
	Fc0OhA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ug9ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:39:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so34933085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791880797; x=1792485597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eNL7vgR4kDGeD5fPFGvpl05GH+Y/43WiLVBF8tPpz6M=;
        b=XAPRoEm2144AdSwxpIgKQ+dxsRa6wdTf67Dddh3JjICLPmdI3DldiB6IaIIa4dY6Vl
         3+mJWtBbWIzTXsFOBWfsO1F+VVlFjTR8ltOgYX9Z9yiSirgcvTzgjhkvD56TkJn8Z3Qr
         yGsA9pNW5kZKzHd51yO6l0Jqq/4D1gnjyU17bB63/Nj2JysOaTqxphp1dufZ0ZqF2aaj
         V2rnLSx5MqwUMkph4PhKkYb3Zq9BPal755N/e1GiAFK7OVyuQnaDxH95YdwCFOvlUSK3
         cDPwJwTTpKb8fsL5oJGkIYVu/LekErBECwtO3bXoie3enGrpNEo3c5/AAddmHzbF+1dx
         hZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880797; x=1792485597;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eNL7vgR4kDGeD5fPFGvpl05GH+Y/43WiLVBF8tPpz6M=;
        b=rZpTPh+osdW7WfZnvYArzRZ1ROn1AOJypHy6GBLOxZQvPtjl20i/gX8U9JrmaaAVWA
         Wo4q8kNzAzHOI/c3VOMCktNOFEtlwamUt8+fJ31Wa1mXLKhUZsi9eEDgM2Gbyn3ZVx4E
         Ue4aaNpCbD2RyPh6IZ2XfNVxGTe9pEXKepn5iDnbRg0/YhAr+cGTfRQsPpZDpVEQGizF
         EEUH/OAY/K4ePPlYpF7rma6yHMtpkkw7OLKidDpOXD4+0wA6f9RLxdJVG0k+YpBDvJGB
         mbAoY3kfJrD411CUYkLtpwrJsv1Dtl3pfXxw44d7BsFf3ApaQg+d5sRD7K3ZWGFRta4p
         csig==
X-Forwarded-Encrypted: i=1; AKwUvBxNlsqixUct/dBFu0Y1k6Dflz2CTbd+c2YZnqk/zjHEengoYyDXnFjCgvqAsa9LU0RsPpAKr7SuE95ojC45@vger.kernel.org
X-Gm-Message-State: AFq9FYIVG3RhU5pPJ/J93MnOKOYB5BJJAX0BN/xLjE7A5roehLk5Bh7K
	4XaRnrR0bxRMmBsC7A7MkwY8NFj1514yFD/GKkaRyBpF08MFCpJX8O/4hiEftAoSBOew/SMfdew
	zJwLHsRobMzN0gXXNQWxEvzLTs3afoDJrOb4dgD4gqFg4bBWerEMkZ1t9cnVgCY/FxQ11
X-Gm-Gg: AYBFou0J+GlHid9TX2seYnV1gEkGPl+ZQ1EiVX0Gyps9LlhZ6L0kb8sxAuuD1WKdpZV
	cSrMWIGtN5hLjwFfsk0GQ220+LXhwBRppTG/gUHjMR31YU0nV4PgwxX7t/0skuSfJPr6GZsb1zv
	TuOarHdIGxbJMU/5bUKj2fyVfNsiWTMGzhKjpszYY36AbJ3dgxqQRkFq3YkBfQPCYIiop4zc2v9
	aR81NjdoC1e124K4/IB7b9oZmEZW+nptq980IulKSXiFQE5WDrWtrgyIl/q/S3TXN4vleegYQ7Y
	lBsHQnwwH+s8MvDtLbTAapxwObOtaXo322YGEjm8YOrnoeLgH1qGjKHHtbj9Fzh2Z3U88Gua9wf
	H4vmMBqQA/sxKDriXDyK7gw==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr2187958985a.3.1791880797432;
        Tue, 13 Oct 2026 01:39:57 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr2187955985a.3.1791880796886;
        Tue, 13 Oct 2026 01:39:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c36fe6dbc61sm51688266b.30.2026.10.13.01.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:39:56 -0700 (PDT)
Message-ID: <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:39:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
 <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfXy8jlJuMjdypk
 NcXzkrqRHbMVfSNIWIg2jr0jO+1vb/gL7iO4egCMwOJ0InwvgUfNcjCX1RksRj8E1i2fUgbrvIY
 T+g2ibTYIY6CguFgYcGu9pbDYFHER8jmTqCIaLhmkIEQIFWscbAD9tcLf3k3glb59D3hFdzTU+b
 yirkh4KsCZ237n5Ftk2YqTrYZpM1AJa2Z0cGx16seGNVLRhhS4m6aIIbrPeFQWCPrp9CBC4QJUA
 +5vkFKnxnNHwww9yilixjpEJnnUjY8n3AAWtsQlASK2GresDPaMKDcZnwjjkPBuFyxlJAmxZnKT
 j4najLSyl1cvPqxl2/5Ufc7UUtPszxQksJirysscutqsW+5lRgkZcOl40/G9P2IPUNb5simethq
 fVFRwlNOFbNVmE7s9rhDBNsdF6tNj0vv5TgdE/WSbaM+CYZb8JstzPijvFFnO/QtQzlkiq+kt1/
 EYJkrJvVT51NnC9VTBg==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6acdee5e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rd0sP4ULdwr9m3flnKMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: -lO3Roc21nPjXciuETj4GgHhvrZO_V9p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX5PAVjGr8kvbF
 pRWLWtdmfsj5R24vSacVKYI3M4xM7UgW8Odjscxh2y/bffbLNlj55XRVbsK+FLfqACrMsrS6G4Q
 XLHlhyHCKTb5KIc+4yTz1lzhZz5Z24I=
X-Proofpoint-GUID: -lO3Roc21nPjXciuETj4GgHhvrZO_V9p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
> 
> 
> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>
>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>> ---

[...]

> Before review, I'd appreciate your input on the naming.
> 
> Surface Laptop 8th Edition comes in three sizes [1]:
> 
>   - 13 inch:   Snapdragon X2 Plus (6-core), UFS storage
>   - 13.8 inch: Snapdragon X2 Plus / X2 Elite (Mahua), NVMe
>   - 15 inch:   Snapdragon X2 Plus / X2 Elite
> 
> This series adds the 13.8 inch model only. I named it
> "microsoft,surface-laptop-8-13in" (mahua-microsoft-surface
> -laptop-8-13in.dts), but that clashes with the real 13 inch model, which is a different board (UFS instead of NVMe) and will need its own DTS.
> 
> I couldn't find a codename for these, so I can't follow the Laptop 7
> scheme (romulus13/15). Could you please suggest the naming you'd prefer
> for the compatible and DTS file name? I'll update it in v2.

I can't find any. The LLM suggests the 13.8/15 in codename starts
with "ROT" based on the INFs.

Konrad
